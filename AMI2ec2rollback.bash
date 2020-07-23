version=$1
asgname=$2
LCVersion="LCTest_$version"

     aws autoscaling update-auto-scaling-group \
				--auto-scaling-group-name $asgname \
				--min-size 0 \
				--desired-capacity 0\
				--max-size 0
     sleep 50
     aws autoscaling update-auto-scaling-group \
				--auto-scaling-group-name $asgname \
				--launch-configuration-name $LCVersion \
				--min-size 1 \
				--desired-capacity 1\
				--max-size 1
