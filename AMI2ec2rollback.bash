version=$1
asgname=$3
LCVersion="LCTest_$version"

     aws autoscaling update-auto-scaling-group \
				--auto-scaling-group-name $asgname \
				--launch-configuration-name $LCVersion \
				--min-size 1 \
				--desired-capacity 1\
				--max-size 1
