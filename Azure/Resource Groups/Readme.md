## Resource Groups

To use
`az deployment sub create --location {location} --template-file {template.bicep} --name {name} -o table --parameter ParameterName='value'`

Location is required twice, both by the command itself and the script specification.

A way around this could be:

```
LOCATION=australiaeast

az deployment sub create --location ${LOCATION} --template-file resourcegroup.bicep --name ResourceGroup-${LOCATION} -o table --parameter ResourceRegion='${LOCATION}'
```

## Example run

```
> az deployment sub create --location australiaeast --template-file .\resourcegroup.bicep --name 'testing1234' -o table --parameter ResourceRegion='australiaeast' ResourceGroupName='rg-testing1234' Description='This is a test of the bicep routine'
Name         State      Timestamp                         Mode
-----------  ---------  --------------------------------  -----------
testing1234  Succeeded  2023-04-19T01:06:34.587458+00:00  Incremental
```

### Reference documentation

[az deployment sub](https://learn.microsoft.com/en-us/cli/azure/deployment/sub?view=azure-cli-latest)