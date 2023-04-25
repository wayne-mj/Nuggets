## Configuration tool starting point
## Ping an IP address range to test if it is available for use to be assigned
## Replace with the appropriate octets.
$NETADDR='192.168.0.'

## Create an array
$results = @()

## Foreach loop
200..254 | ForEach-Object {
    $IPADDR="$NETADDR$_"
    Write-Host "Testing if $IPADDR already is in use ..."
    $result = Test-Connection $IPADDR -Count 1 -Quiet

    if ($result -eq $false)
    {
        $MESSAGE="Available"
    }
    else {
        $MESSAGE="Unavailable"
    }

    $object = New-Object PSObject -Property @{
        IPAddress = $IPADDR
        Result = $MESSAGE
    }

    $results += $object
}

$results | Export-Csv -Path "ping_results.csv" -NoTypeInformation