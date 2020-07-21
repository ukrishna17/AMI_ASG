version=$1
keyname="Terra-Key"
groupId="terra-sg"
lcKeyname="asg-keypair"
lc_Sg="sg-093e2727028157daa"
instance_id="i-0a898d55c88c58bcc"
AMIVersion="AMITest_$version"
LCVersion="LCTest_$version"

image_id=$(aws ec2 create-image --instance-id $instance_id --name $AMIVersion --description "AMI for my webserver $version" --query ImageId --output text)

sleep 3m
aws autoscaling create-launch-configuration --launch-configuration-name $LCVersion --key-name $lcKeyname --image-id $image_id --instance-type t2.micro --security-groups $lc_Sg 

sleep 2m
aws autoscaling update-auto-scaling-group \
				--auto-scaling-group-name "Autoscaling-testing" \
				--launch-configuration-name $LCVersion \
				--min-size 1 \
				--desired-capacity 2\
				--max-size 3
