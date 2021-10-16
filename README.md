# Final Case Study in Google Data Analytics Professional Certificate

**Thanks for visiting** [My 1st Data Project](https://github.com/lenguyenngocmai/1st_project_101221)

This project is my case study for my final course in [Google Data Analytics Professional Certificate](https://www.coursera.org/professional-certificates/google-data-analytics) on Coursera. 

**Disclaim** : The data is from open source, and the business request is just a common business problem that I see on the internet.

### Content 

1. Introduction
    * What is the scenario?
    * Where is the data?
    * What the RFM is?
2. Problem 
3. Solution
    * Task List
    * RFM segment
4. Conclusion
5. Reference

## Introduction

### What is the scenario? 

The retail company has a marketing plan to reward loyal customers and re-connect to ex-lover customers. 
However, the company had a limited budget. Therefore, they want the data team to analyze the data to pick a target customer group that brings the most value for the company.

In the real world, a start-up or small company with a small budget for marketing always needs to pick the right customer group. They must find the want to use the tiny budget efficiently to get the most benefit possible.

**Assumption: the analysis is for the marketing program on next year's Thank Giving day. The current date is 31/12/2011**

### Data and RFM analysis method 

#### Data
The Data I use in this project comes from  Kaggle. [E-Commerce Data](https://www.kaggle.com/carrie1/ecommerce-data)

- Data: transnational data set 
- Date Range: 01/12/2010 - 09/12/2011

#### RFM Analysis

**Introduction:**

- The RFM was developed in the 90s by retail organizations.
- The R-F-M analysis is a framework for determining segments for marketing and retention campaigns. It's a function of three factors:
1. Recency: the number of days since the last transaction of the customer
2. Frequency: the count of transactions
3. Monetary: the total revenue from each customer in the selected time frame

Benefits: The RFM is based on the marketing axiom that **80% of your business comes from 20% of your customer**. It helps identify customers who are more likely to respond to a promo by segmenting them into various categories.

**FRM Workflow:**

|Step 1 | Step 2 | Step 3 | Step 4|
| -----|-----|------|-----|
|**Data**: Data is available at transaction or customer level. Should include unique customer id, invoice date, invoice_id, invoice_value. | **RFM Table**: Summarize data to calculate Recency(R score), Frequency (F score) and Monetary (M score). | **RFM Score**: Find the distribution of R, F, M  and create the RFM score by splitting value into bins using quantiles or percentiles.| **Segments** : Use RFM score to define  customer segments.|

## Problem

**Situation**: 
-  With the limited marketing budget, the company cannot do the reward for all customers. 
Therefore, the CMO needs to have a dashboard to show customer categories to decide the target customer for the campaign.

**What we have**:
- We have transaction data 
- We know we can use the RFM model to determining the right group of customers.

## Solution: 

- From the situation, I determine the goal of the analysis: a dashboard to show customer segments.
- Based on the goal, condition, and situation, I create a task list to close the gap from the business request to the result.

**Task List**:

- [ ] Define the need of stakeholder
- [ ] Check the RFM method and compare it to the business request to choose the method that suits the company.
- [ ] Collect the data and check the quality of the data.
- [ ] Clean, transform data...
- [ ] Build RFM model by SQL code.
- [ ] Create Tableau dashboard.
- [ ] Share the dashboard, listen to the feedback, and improve it.
- [ ] Work with marketing and monitor the result of a campaign to improve the analysis.

**Postgres SQL code**
Please review [my analysis step using SQL](https://github.com/lenguyenngocmai/1st_project_101221/tree/main/data_integration)

**RFM dashboard**
Please review [my visualization](https://public.tableau.com/authoring/RFMSegmentDashboard/Dashboard1#1)

## Conclusion 

From the RFM segment dashboard:
- The company can start the reward campaign with champion and loyal customer which create more than 80% revenue for the company from 01.12.2010 to 09.12.2011.
- They can reconnect with the "Can't lost them" segment to make ex-lovers love the company again.

### Referrence 

**For the RFM theory** : 
- [Customer segmentation using RFM Analysis](https://blog.rsquaredacademy.com/customer-segmentation-using-rfm-analysis/)
- [RFM segmentation Overview](https://how-many-steps-inc.webflow.io/rfm-segmentation-overview)

**For SQL code** :
- [How to Create RFM Segments for Shopify](https://panoply.io/shopify-analytics-guide/how-to-create-rfm-segments-with-sql/)

> *Thank you again for visiting my git. I welcome and glad to talk if you want to discuss about Data, Business Analyst with me.*












