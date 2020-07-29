aws ec2 run-instances \
        --image-id ami-0ac80df6eff0e70b5 \
        --region us-east-1 \
        --count 1 \
        --instance-type t2.micro \
        --key-name "asg-keypair" \
        --security-group-ids "sg-0b29a2c1579c9651a" \
        --user-data file://launchwebsite.sh \
        --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=pilotinstance}]' \
        --query 'Instances[0].InstanceId' \
	--output text
