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

module functionAppModule 'functionApp.bicep' = {
  name: 'functionApp'
  params: {
    location: location
    name: name
    storageAccountName: storageAccountModule.outputs.name
    servicePlanId: servicePlanModule.outputs.id
  }
}

output functionAppUrl string = functionAppModule.outputs.url
