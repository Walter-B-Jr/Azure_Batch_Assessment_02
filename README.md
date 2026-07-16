## Lab Name: AzureBatch.L200.UnusableNodes.2
## Introduction
This is a Level 200 lab for troubleshooting compute nodes in an �Unusable� state in Azure Batch. This lab should take ~45 minutes to complete.
## Deployment Instructions

Deploy the ARM template **`azuredeploy.json`** (in the root of this repo) using any option below.

### Option 1 - Deploy to Azure (one-click)
[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FWalter-B-Jr%2FAzure_Batch_Assessment_02%2Fmaster%2Fazuredeploy.json)

Click the button, pick (or create) a resource group + region, set `namePrefix`, then **Review + create** -> **Create**.

### Option 2 - Azure CLI
```powershell
az group create -n rg-batch-lab-02 -l westus2
az deployment group create -g rg-batch-lab-02 --template-file azuredeploy.json --parameters namePrefix=batlab02
az deployment group show -g rg-batch-lab-02 -n azuredeploy --query properties.outputs
```

### Option 3 - Azure Portal (Load file)
1. Portal -> search **Deploy a custom template** -> **Build your own template in the editor**.
2. **Load file** -> select `azuredeploy.json` from this repo -> **Save**.
3. Choose/create a resource group + region, set `namePrefix`, then **Review + create** -> **Create**.

### After deploying
Open the deployment **Outputs** for `batchAccountName`, `batchAccountUrl`, `storageAccountName`, and `poolSubnetId`, then get the keys from the portal:
- Batch account -> **Keys** -> account **URL** + **Primary access key**.
- Storage account -> **Access keys** -> account name + **key1**.

Paste these into `DotNetTutorial\Program.cs` (`BatchAccountName`, `BatchAccountUrl`, `BatchAccountKey`, `StorageAccountName`, `StorageAccountKey`, `PoolSubnetId`), then build and run the console app.

<details><summary>Manual deployment (alternative)</summary>
1.	Deploy the template and download the source code.
2.	Open up the application that was created in the deployment template to get the credentials required for the sample code to work correctly. Then, proceed to open the code sample in VS and make the following required changes:
a.	Open �Program.cs� under DotNetTutorial application. 
b.	Proceed to enter the credentials provided in the application to the code sample as shown below
i.	BatchAccountName
ii.	BatchAccountKey
iii.	BatchAccountUrl
iv.	StorageAccountName
v.	StorageAccountKey
vi.	You can name your PoolID and JobID however you desire.

 

</details>

## Resources Created
This lab involves the following resources.
-	Resource Group
-	Batch Account 
-	Storage Account 
-	Virtual Network
## Scenario
In this lab, after deploying the template you will see that the compute nodes deployed into the Batch pool are in a �unusable� state. You are tasked with resolving this issue
## Your Goal
Your goal is to investigate the reason why the compute nodes are in a �unusable� state and then proceed to resolve the issue.
## Proof of Solution
1.	Provide a screenshot confirming the error:
2.	Resolve the issue. Make the necessary changes to the relevant resource in order to get the nodes back to an �idle� state.
3.	Take a screenshot of the nodes in �idle� state.

 
