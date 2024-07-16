#!/bin/sh
### Shell script to modify the security group of a VPC to allow traffic
### specific for a Pi Hole hosted in an EC2 instance.
### Grab the old IP address from the tmp
### then get the IP assigned by the ISP
OLDIP=$(cat /var/tmp/oldip)
MYIP=$(curl -s https://checkip.amazonaws.com/)
SGID=sg-blahblahblahblahblah

echo "Old IP $OLDIP"
echo "New IP $MYIP"
if [ "$OLDIP" != "$MYIP" ] ; then
        echo "A change happened"
        echo "Removing old rules"
        for port in 22 53 80 443; do
            aws ec2 revoke-security-group-ingress --group-id $SGID --protocol tcp --port $port --cidr "$OLDIP"/32 --profile vpcadmin
        done
        
        aws ec2 revoke-security-group-ingress --group-id $SGID --protocol udp --port 53 --cidr "$OLDIP"/32 --profile vpcadmin
        aws ec2 revoke-security-group-ingress --group-id $SGID --protocol icmp --port -1 --cidr "$OLDIP"/32 --profile vpcadmin

        sleep 2

        echo "Adding new rules"
        for port in 22 53 80 443; do
            aws ec2 authorize-security-group-ingress --group-id $SGID --protocol tcp --port $port --cidr "$MYIP"/32 --profile vpcadmin
        done

        aws ec2 authorize-security-group-ingress --group-id $SGID --protocol udp --port 53 --cidr "$MYIP"/32 --profile vpcadmin
        aws ec2 authorize-security-group-ingress --group-id $SGID --protocol icmp --port -1 --cidr "$MYIP"/32 --profile vpcadmin

        echo $MYIP > /var/tmp/oldip
else
        echo "No change"
fi