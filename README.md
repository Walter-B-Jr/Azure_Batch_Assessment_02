## Lab Name: AzureBatch.L200.UnusableNodes.2
Introduction
This is a Level 200 lab for troubleshooting compute nodes in an “Unusable” state in Azure Batch. This lab should take ~45 minutes to complete.
Deployment Instructions
1.	Deploy the template and download the source code.
2.	Open up the application that was created in the deployment template to get the credentials required for the sample code to work correctly. Then, proceed to open the code sample in VS and make the following required changes:
a.	Open “Program.cs” under DotNetTutorial application. 
b.	Proceed to enter the credentials provided in the application to the code sample as shown below
i.	BatchAccountName
ii.	BatchAccountKey
iii.	BatchAccountUrl
iv.	StorageAccountName
v.	StorageAccountKey
vi.	You can name your PoolID and JobID however you desire.

 

Resources Created
This lab involves the following resources.
-	Resource Group
-	Batch Account 
-	Storage Account 
-	Application – (which contains Batch and Storage credentials)
-	Virtual Network
-	Network Security Group
Scenario
In this lab, after deploying the template you will see that the compute nodes deployed into the Batch pool are in a “unusable” state. You are tasked with resolving this issue
Your Goal
Your goal is to investigate the reason why the compute nodes are in a “unusable” state and then proceed to resolve the issue.
Proof of Solution
1.	Provide a screenshot confirming the error:

 

2.	Resolve the issue. Make the necessary changes to the relevant resource in order to get the nodes back to an “idle” state.
3.	Take a screenshot of the nodes in “idle” state.

 
