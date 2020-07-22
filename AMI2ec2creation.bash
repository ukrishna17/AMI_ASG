version=$1
instance_id=$2
asgname=$3
lcKeyname="asg-keypair"
lc_Sg="sg-093e2727028157daa"
AMIVersion="AMITest_$version"
LCVersion="LCTest_$version"
#image_id="ami-0ef38fe45b30d30f6"


if [ "$version" != "" ] && ["$instance_id" != "" ] && ["$asgname" != "" ]; then
    if [ "aws ec2 describe-instances --instance-ids $instance_id --query Reservations[*].Instances[*].[InstanceId] --output text" != "" ]; then 
        image_id=$(aws ec2 create-image --instance-id $instance_id --name $AMIVersion --description "AMI for my webserver $version" --query ImageId --output text)
	sleep 80
	aws autoscaling create-launch-configuration --launch-configuration-name $LCVersion --key-name $lcKeyname --image-id $image_id --user-data file://launchwebsite.sh --instance-type t2.micro --security-groups $lc_Sg 
	sleep 40
	aws autoscaling update-auto-scaling-group \
				--auto-scaling-group-name $asgname \
				--launch-configuration-name $LCVersion \
				--min-size 1 \
				--desired-capacity 1\
				--max-size 1
     else 
	  echo "no instance existed with the given instance"
     fi
else
    echo "Don't Pass empty strings"
fi
