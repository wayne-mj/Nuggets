## Update VPC Script

Shell script to routinely update the VPC's security group.

1. Obtains the previous (if any) IP address of the internet connected interface from /var/tmp,
2. Obtains the current IP address of the internet connected interface,
3. Compares if there is a change,
4. Deletes the existing rules,
5. Recreates the rules with the new IP,
6. Saves the new IP address in /var/tmp.

Typically, can be used as a cron script set to run once an hour or as often as required to match with how often the DHCP service of the ISP refreshes the IP address.
