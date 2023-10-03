param location string = resourceGroup().location

param name string

module storageAccountModule 'storageAccount.bicep' = {
  name: 'storageAccount'
  params: {
    location: location
    name: name
  }
}

module servicePlanModule 'servicePlan.bicep' = {
  name: 'servicePlan'
  params: {
    location: location
    name: name
  }
}

resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' existing = {
  name: 'webstep-shared-szabi'
  scope: resourceGroup('Webstep-Common')
}

module functionAppModule 'functionApp.bicep' = {
  name: 'functionApp'
  params: {
    location: location
    name: name
    storageAccountName: storageAccountModule.outputs.name
    servicePlanId: servicePlanModule.outputs.id
    secret: keyVault.getSecret('secret')
  }
}

output functionAppUrl string = functionAppModule.outputs.url
