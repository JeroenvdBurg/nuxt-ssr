targetScope = 'subscription'
param location string = 'westeurope'

param swaName string = 'nuxt-ssr'

@allowed([ 'Free', 'Standard' ])
param swaSku string = 'Free'

var resourceGroupName = 'my-nuxt-app-rg'

// Create resource group
resource newRG 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: resourceGroupName
  location: location
}

module staticWebApp 'static-webapp.bicep' = {
  scope: newRG
  name: '${deployment().name}--swa'
  params: {
    location: location
    sku: swaSku
    name: swaName
  }
}
