## Lab Name: AzureBatch.L200.Troubleshooting.2

### Introduction
This is a Level 200 lab for Troubleshooting in Azure Batch. It is a **self-contained failure scenario**: deploying the template stands up the entire environment *and* runs the failing workload automatically. There is **no console app to build or run** and **no manual steps** — your job is purely to diagnose the failure with our internal tools.

## Deployment Instructions

Deploy the ARM template **`azuredeploy.json`** (root of this repo) using any option below.

### Option 1 - Deploy to Azure (one-click)
[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FWalter-B-Jr%2FAzure_Batch_Assessment_02%2Fmaster%2Fazuredeploy.json)

Click the button, pick (or create) a resource group + region, optionally set `namePrefix`, then **Review + create** -> **Create**.

### Option 2 - Azure CLI
```powershell
az group create -n rg-batch-lab-02 -l eastus2
az deployment group create -g rg-batch-lab-02 --template-file azuredeploy.json --parameters namePrefix=batlab02
```
> Pick a region where your subscription has Batch **dedicated core quota** so the pool node can allocate.

### Option 3 - Azure Portal (Load file)
1. Portal -> search **Deploy a custom template** -> **Build your own template in the editor**.
2. **Load file** -> select `azuredeploy.json` -> **Save**.
3. Choose/create a resource group + region, optionally set `namePrefix`, then **Review + create** -> **Create**.

## What happens automatically
The deployment creates the Batch and Storage accounts, a compute pool, and (via a short-lived seed container) a job with tasks. The pool attempts to allocate a node. Allow several minutes after deployment for the node state to settle before investigating.

## Resources Created
- A Resource Group
- A Batch Account
- A Storage Account
- A Batch **Pool** (`batch_assessment_pool_Test`)
- A Batch **Job** + **Tasks** (`batch_assessment_job_Test`)
- A short-lived User-Assigned Managed Identity + Container Instance used only to seed the job/tasks

## Scenario
In this lab, after the environment deploys you will see that the compute node(s) in the Batch pool are in an **unusable** state. You are tasked with resolving this issue.

## Your Goal
Your goal is to investigate the reason why the compute nodes are in an **unusable** state and then proceed to resolve the issue.

## Proof of Solution
1. Provide a screenshot confirming the error.
2. Resolve the issue. Make the necessary changes to the relevant resource in order to get the nodes back to an **idle** state.
3. Take a screenshot of the nodes in an **idle** state.

## Important: After completing the lab
Please make sure to delete all the resources you created for this lab.
