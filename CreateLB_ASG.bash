aws elb create-load-balancer \
--load-balancer-name TestLB \
--listeners "Protocol=HTTP,LoadBalancerPort=80,InstanceProtocol=HTTP,InstancePort=80 \
--subnets subnet-06c92527 subnet-36994238 subnet-4f3e0b71 subnet-58f54415 subnet-95e002ca subnet-9b3cdafd \
--security-groups sg-0db5158fbc1023a95
