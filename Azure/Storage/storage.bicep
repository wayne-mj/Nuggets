param location string = resourceGroup().location
param storageAccountName string

@allowed([
  'Standard_LRS'
  'Premium_LRS'
  'Premium_ZRS'
  'Standard_GRS'
  'Standard_GZRS'
  'Standard_RAGRS'
  'Standard_RAGZRS'
  'Standard_ZRS'
])
param storageType string = 'Standard_LRS'

@allowed([
  'BlobStorage'
  'BlockBlobStorage'
  'FileStorage'
  'Storage'
  'StorageV2'
])
param storageKind string = 'StorageV2'

@allowed([
  'Cool'
  'Hot'
  'Premium'
])
param accessTier string = 'Hot'

// Tags for resources
// Get the current datetime 
param BaseDate string = utcNow('u')

// Sets the time for UTC +10
// Set this to the most appropriate +/- UTC value.
var DateCreated = dateTimeAdd(BaseDate, 'PT10H')

// Set a description for the Resource Group
param Description string

// Resource tags
// Add any and all resource tags here
var ResourceTags =  {
  DateCreated: DateCreated
  Description: Description
}

resource StorageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
   name: storageAccountName
   location: location
   tags: ResourceTags
   
   sku: {
     name: storageType
   }
   kind: storageKind
   properties: {
     accessTier: accessTier
   }
}
