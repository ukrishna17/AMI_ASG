version="V2"
asgname="Autoscaling-testing"
lcKeyname="asg-keypair"
lc_Sg="sg-093e2727028157daa"
AMIVersion="AMITest_$version"
LCVersion="LCTest_$version"
#image_id="ami-0ef38fe45b30d30f6"
#existed=$(aws ec2 describe-instances --instance-ids $instance_id --query Reservations[*].Instances[*].[InstanceId] --output text)

instance_id=$(aws ec2 run-instances \
        --image-id ami-0ac80df6eff0e70b5 \
        --region us-east-1 \
        --count 1 \
        --instance-type t2.micro \
        --key-name $lcKeyname \
        --security-group-ids "sg-0b29a2c1579c9651a" \
        --user-data file://launchwebsite.sh \
        --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=pilotinstance}]' \
        --query 'Instances[0].InstanceId')
sleep 70
#if [ -z $version -a -z $instance_id -a -z $asgname ] 
#then
#   if [ -z $existed ]; then 
     image_id=$(aws ec2 create-image --instance-id $instance_id --name $AMIVersion --description "AMI for my webserver $version" --query ImageId --output text)
     sleep 70
     aws autoscaling create-launch-configuration --launch-configuration-name $LCVersion --key-name $lcKeyname --image-id $image_id --instance-type t2.micro --security-groups $lc_Sg 
     sleep 40

     aws autoscaling update-auto-scaling-group \
				--auto-scaling-group-name $asgname \
				--launch-configuration-name $LCVersion \
				--min-size 1 \
				--desired-capacity 3\
				--max-size 10
   sleep 50				
   aws autoscaling update-auto-scaling-group \
				--auto-scaling-group-name $asgname \
				--termination-policies "OldestLaunchConfiguration" \
				--desired-capacity 2\
			  
#   else 
#      echo "no instance existed with this instance id:$instance_id"
#   fi
#else
#   echo "Don't Pass empty strings $version $instance_id $asgname"
#fi
