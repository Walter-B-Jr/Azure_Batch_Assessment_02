// Azure Batch training lab environment.
// Deploys a Batch account (auto-storage) and a VNet/subnet for the pool's compute nodes.

targetScope = 'resourceGroup'

@description('Azure region for all resources.')
param location string = resourceGroup().location

@description('Short prefix used to derive resource names (lowercase letters/digits).')
@minLength(3)
@maxLength(11)
param namePrefix string = 'batlab02'

@description('Object ID of the principal that runs the sample app and needs blob data access. Defaults to the deploying user.')
param appPrincipalId string = deployer().objectId

var suffix = uniqueString(resourceGroup().id)
var storageAccountName = toLower('${namePrefix}stg${substring(suffix, 0, 6)}')
var batchAccountName = toLower('${namePrefix}ba${substring(suffix, 0, 6)}')
var vnetName = '${namePrefix}-vnet'
var poolSubnetName = 'pool-subnet'
var storageBlobDataContributor = subscriptionResourceId('Microsoft.Authorization/roleDefinitions', 'ba92f5b4-2d11-453d-a403-e96b0029c9fe')

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    minimumTlsVersion: 'TLS1_2'
    allowSharedKeyAccess: true
    allowBlobPublicAccess: false
    supportsHttpsTrafficOnly: true
  }
}

resource vnet 'Microsoft.Network/virtualNetworks@2023-11-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.20.0.0/16'
      ]
    }
    subnets: [
      {
        name: poolSubnetName
        properties: {
          addressPrefix: '10.20.0.0/24'
          privateEndpointNetworkPolicies: 'Disabled'
        }
      }
    ]
  }
}

resource batchAccount 'Microsoft.Batch/batchAccounts@2024-07-01' = {
  name: batchAccountName
  location: location
  properties: {
    poolAllocationMode: 'BatchService'
    publicNetworkAccess: 'Enabled'
    autoStorage: {
      storageAccountId: storageAccount.id
    }
    networkProfile: {
      accountAccess: {
        defaultAction: 'Allow'
      }
      nodeManagementAccess: {
        defaultAction: 'Deny'
      }
    }
  }
}

output batchAccountName string = batchAccount.name
output batchAccountUrl string = 'https://${batchAccount.properties.accountEndpoint}'
output storageAccountName string = storageAccount.name
output poolSubnetId string = resourceId('Microsoft.Network/virtualNetworks/subnets', vnetName, poolSubnetName)

resource blobDataRole 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(storageAccount.id, appPrincipalId, storageBlobDataContributor)
  scope: storageAccount
  properties: {
    roleDefinitionId: storageBlobDataContributor
    principalId: appPrincipalId
  }
}
