public with sharing class AccountLoyaltyHandler {

    public static void updateLoyalty(
        List<Opportunity> newOpps,
        Map<Id, Opportunity> oldOpps
    ) {
        Set<Id> accountIds = new Set<Id>();

        for (Opportunity opp : newOpps) {

            if (opp.StageName != 'Closed Won' || opp.AccountId == null) {
                continue;
            }

            // INSERT
            if (oldOpps == null) {
                accountIds.add(opp.AccountId);
            } 
            // UPDATE
            else {
                Opportunity oldOpp = oldOpps.get(opp.Id);

                if (oldOpp.StageName != 'Closed Won') {
                    accountIds.add(opp.AccountId);
                }
            }
        }

        if (accountIds.isEmpty()) return;

        Map<Id, Decimal> revenueMap = new Map<Id, Decimal>();

        for (AggregateResult ar : [
            SELECT AccountId, SUM(Amount) total
            FROM Opportunity
            WHERE AccountId IN :accountIds
            AND StageName = 'Closed Won'
            GROUP BY AccountId
        ]) {
            revenueMap.put(
                (Id) ar.get('AccountId'),
                (Decimal) ar.get('total')
            );
        }

        List<Account> accountsToUpdate = new List<Account>();

        for (Id accId : revenueMap.keySet()) {
            Decimal total = revenueMap.get(accId);

            String level;
            if (total < 10000) level = 'Bronze';
            else if (total <= 50000) level = 'Silver';
            else level = 'Gold';

            accountsToUpdate.add(new Account(
                Id = accId,
                Loyalty_Level__c = level
            ));
        }

        if (!accountsToUpdate.isEmpty()) {
            update accountsToUpdate;
        }
    }
}