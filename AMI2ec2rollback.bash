version=$1
asgname=$2
LCVersion="LCTest_$version"

     aws autoscaling update-auto-scaling-group \
				--auto-scaling-group-name "Autoscaling-testing" \
				--launch-configuration-name $LCVersion \
				--min-size 1 \
				--desired-capacity 5\
				--max-size 10
   sleep 4m				
   aws autoscaling update-auto-scaling-group \
				--auto-scaling-group-name "Autoscaling-testing" \
				--termination-policies "OldestLaunchConfiguration" \
				--desired-capacity 2
  sleep 1m
