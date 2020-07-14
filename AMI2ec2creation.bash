#!/bin/bash

AMIimg_id="ami-065334bec91050778"
keyname="Terra-Key"
groupId="terra-sg"

instance_id=$(aws ec2 run-instances \
        --image-id $AMIimg_id \
        --instance-type t2.micro \
        --key-name $keyname \
        --user-data file://launchwebsite.sh \
        --security-group-ids $groupId \
        --query 'Instances[*].[InstanceId]' \
        --output text)
sleep 3m
aws ec2 create-image --instance-id $instance_id --name "AMItest_V2" --description "AMI for my webserver version2" --query ImageId --output text

sleep 3m
aws ec2 terminate-instances --instance-id $instance_id

