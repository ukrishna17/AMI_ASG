#!/bin/bash

AMIimg_id="ami-065334bec91050778"
keyname="Terra-Key"
groupId="terra-sg"

aws ec2 run-instances \
        --image-id $AMIimg_id \
        --instance-type t2.micro \
        --key-name $keyname \
        --user-data file://launchwebsite.sh \
        --security-group-ids $groupId \
        --query 'Instances[*].[InstanceId]' \
        --output text
