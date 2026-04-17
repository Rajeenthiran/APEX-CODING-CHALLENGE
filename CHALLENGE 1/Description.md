# Apex Coding Challenge: Customer Loyalty System

## 📌 Problem Statement
This project implements a Customer Loyalty System in Salesforce using Apex.

Whenever an Opportunity is marked as 'Closed Won', the system calculates 
the total revenue for the related Account and assigns a Loyalty Level:
- Bronze
- Silver
- Gold

---

## 🚀 Features
- Bulkified Apex Trigger
- Handler Class Design Pattern
- Aggregate SOQL for performance
- Follows Salesforce Governor Limits
- Fully tested with Apex Test Class

---

## 🏗️ Architecture
- Trigger: Handles Opportunity events
- Handler Class: Business logic
- Test Class: Ensures correctness and coverage

---

## 🧠 Concepts Used
- Apex Triggers
- Aggregate SOQL (SUM, GROUP BY)
- Collections (Map, Set)
- Bulk Processing
- Governor Limits Optimization

---

## 🧪 Test Coverage
- Covers insert scenarios
- Validates Loyalty Level assignment
- Ensures logic works for bulk records

---

## 📈 Output Example
If total Closed Won revenue = 60,000  
👉 Loyalty Level = Gold

---

## 💡 Why This Project?
This simulates a real-world business requirement often asked in Salesforce interviews.

