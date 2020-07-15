#!/bin/bash

AMIimg_id="ami-065334bec91050778"
keyname="Terra-Key"
groupId="terra-sg"
lcKeyname="asg-keypair"
lc_Sg="sg-093e2727028157daa"

#instance_id=$(aws ec2 run-instances \
#        --image-id $AMIimg_id \
#        --instance-type t2.micro \
#        --key-name $keyname \
#        --user-data file://launchwebsite.sh \
#        --security-group-ids $groupId \
#        --query 'Instances[*].[InstanceId]' \
#        --output text)
sleep 3m
image2_id=$(aws ec2 create-image --instance-id $instance_id --name "AMItest_V2" --description "AMI for my webserver version2" --query ImageId --output text)

sleep 3m
aws ec2 terminate-instances --instance-id $instance_id

aws autoscaling create-launch-configuration \ 
                --launch-configuration-name lctest_V2 \
                --key-name $lcKeyname \
                --image-id $image2_id \
                --instance-type t2.micro \
                --security-groups $lc_Sg 
#                --user-data file://myuserdata.txt



