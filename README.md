Write with Terraform :
● VPC (CIDR 10.0.0.0/16) with subnets (2 private and 2 public, CIDR doesn’t matter here)
● NAT and Internet gateways
● Application load balancer and target group
● RDS database db.t3.micro with custom subnet group and EC2 instance t3.micro(latest
ubuntu AMI)
● Security groups, route tables, and other required resources
● Follow naming conventions from here
● Try to keep infra as secure as possible, and do not use any custom modules here.
● The state should be in a private S3 bucket