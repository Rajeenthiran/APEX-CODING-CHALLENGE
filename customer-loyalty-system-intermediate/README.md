# Customer Loyalty Reward System

A Salesforce Apex project that automatically rewards customer loyalty points when an Opportunity is marked as **Closed Won**.

This project demonstrates enterprise-level Apex development practices including:
- Trigger Handler Pattern
- Bulkified Processing
- SOQL Optimization
- Governor Limit Handling
- Service Layer Architecture
- Test-Driven Development

---

# Business Requirement

Whenever an Opportunity is updated to **Closed Won**, the related Account should receive loyalty points based on the Opportunity Amount.

The system should:
- prevent duplicate rewards
- support bulk processing
- avoid governor limit issues
- follow Salesforce best practices

---

# Loyalty Points Rules

| Opportunity Amount | Loyalty Points |
|-------------------|----------------|
| Less than 1,000 | 10 |
| 1,000 – 4,999 | 50 |
| 5,000 – 9,999 | 100 |
| 10,000+ | 250 |

---

# Features

- One Trigger Per Object
- Trigger Handler Pattern
- Service Layer Design
- Bulkified Logic
- No SOQL Inside Loops
- No DML Inside Loops
- Duplicate Reward Prevention
- High Test Coverage
- Scalable Architecture

---

# Project Structure

```text
customer-loyalty-system/
│
├── force-app/
│   └── main/
│       └── default/
│           ├── classes/
│           │   ├── OpportunityTriggerHandler.cls
│           │   ├── OpportunityTriggerHandler.cls-meta.xml
│           │   ├── LoyaltyService.cls
│           │   ├── LoyaltyService.cls-meta.xml
│           │   ├── LoyaltyServiceTest.cls
│           │   └── LoyaltyServiceTest.cls-meta.xml
│           │
│           ├── triggers/
│           │   ├── OpportunityTrigger.trigger
│           │   └── OpportunityTrigger.trigger-meta.xml
│           │
│           └── objects/
│               ├── Account/
│               │   └── fields/
│               │       └── Loyalty_Points__c.field-meta.xml
│               │
│               └── Opportunity/
│                   └── fields/
│                       └── Reward_Processed__c.field-meta.xml
│
├── README.md
└── sfdx-project.json
```

---

# Custom Fields

## Account

| Label | API Name | Type |
|-------|-----------|------|
| Loyalty Points | Loyalty_Points__c | Number(18,0) |

---

## Opportunity

| Label | API Name | Type |
|-------|-----------|------|
| Reward Processed | Reward_Processed__c | Checkbox |

---

# Architecture

```text
Opportunity Trigger
        ↓
Trigger Handler
        ↓
Loyalty Service
        ↓
Account Update
        ↓
Mark Opportunity as Processed
```

---

# Trigger Example

```apex
trigger OpportunityTrigger on Opportunity(after update) {
    OpportunityTriggerHandler.afterUpdate(
        Trigger.new,
        Trigger.oldMap
    );
}
```

---

# Bulkification Strategy

This project is designed to support bulk operations efficiently.

Implemented using:
- Sets
- Maps
- Single SOQL Queries
- Single DML Statements

The solution supports processing up to 200 records in a single transaction.

---

# Governor Limit Best Practices

The following best practices are implemented:
- No SOQL queries inside loops
- No DML operations inside loops
- Bulk-safe processing
- Minimal database operations
- Optimized collections usage

---

# Test Coverage

The test class includes:
- Single Opportunity processing
- Bulk Opportunity processing
- Duplicate prevention validation
- Null Account handling
- Multiple amount range testing
- Edge case validations

Target Coverage:
- 90%+ Apex Coverage

---

# Example Flow

## Before Update

| Opportunity Stage | Amount | Account Points |
|------------------|---------|----------------|
| Prospecting | 6000 | 0 |

---

## After Update to Closed Won

| Opportunity Stage | Amount | Account Points |
|------------------|---------|----------------|
| Closed Won | 6000 | 100 |

---

# Technologies Used

- Salesforce Apex
- SOQL
- Salesforce DX
- VS Code Salesforce Extension
- Git
- GitHub

---

# Future Enhancements

Potential improvements:
- Queueable Apex
- Platform Events
- Email Notifications
- Custom Metadata Configuration
- Logging Framework
- Retry Mechanism

---

# Deployment

Deploy using Salesforce CLI:

```bash
sfdx force:source:push
```

Run Apex tests:

```bash
sfdx force:apex:test:run
```

---

# Author

Salesforce Developer with experience in:
- Apex
- SOQL
- LWC
- REST Integrations
- Java
- Spring Boot
- Angular
- Firebase

---

# License

This project is created for learning, interview preparation, and portfolio demonstration purposes.