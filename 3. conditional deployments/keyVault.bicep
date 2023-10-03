param location string = resourceGroup().location

@secure()
param secretValue string

param updateKv bool = false

resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = if (updateKv) {
  name: 'webstep-shared-szabi'
  location: location
  properties: {
    enabledForTemplateDeployment: true
    tenantId: subscription().tenantId
    sku: {
      name: 'standard'
      family: 'A'
    }
    accessPolicies: []
  }
}

resource secret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = if (!empty(secretValue)) {
  parent: keyVault
  name: 'secret'
  properties: {
    value: secretValue
  }
}
