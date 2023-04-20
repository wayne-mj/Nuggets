## Storage account

To use
`az deployment group create --resource-group {resource group} --template-file {template.bicep} --name {deployment} --parameter storageAccountName='{storage account name}' Description='{description}'`

This bicep script by default creates a simple, locally redundant storage account.

Sample run:

```
> az deployment group create --resource-group rg_staging --template-file .\storage.bicep --name test1234 -o table --parameter storageAccountName='3ca90d38772547ceb' Description='This is a description'
Name      State      Timestamp                         Mode         ResourceGroup
--------  ---------  --------------------------------  -----------  ---------------
test1234  Succeeded  2023-04-20T23:36:49.412251+00:00  Incremental  rg_staging
```