
# PROG8870 Final Project - CloudFormation Infrastructure

**Student Name:** Keerthana Garimella  
**Student ID:** 8985513

## Project Overview
This project provisions a complete AWS infrastructure using CloudFormation, including VPC, subnets, EC2 instance, S3 buckets, and an RDS MySQL database. All resources are parameterized for easy customization and reusability.

## Features
- **VPC**: Custom VPC with public and private subnets
- **Subnets**: Two public and two private subnets in valid availability zones
- **Internet Gateway & Route Table**: Public subnets are connected to the internet
- **EC2 Instance**: Parameterized instance type, AMI, and key pair
- **Security Groups**: For EC2 and RDS, with open ports for SSH, HTTP, and MySQL
- **S3 Buckets**: Four buckets with versioning and public access blocked
- **RDS MySQL**: Parameterized DB instance, username, password, and subnet group

## File Structure
```
cloudformation/
   finalproject-all.yaml   # Unified CloudFormation template
   ec2-vpc.yml            # EC2 and VPC resources (optional)
   rds.yml                # RDS resources (optional)
   s3-buckets.yml         # S3 resources (optional)
README.md                # Project documentation
```

## How to Deploy
1. **Configure AWS CLI** with your credentials.
2. **Upload the template** using the AWS Console or CLI:
    ```powershell
    aws cloudformation create-stack `
       --stack-name my-finalproject-stack `
       --template-body file://cloudformation/finalproject-all.yaml `
       --capabilities CAPABILITY_NAMED_IAM
    ```
3. **Monitor stack creation** in the AWS Console.

## Parameters
All major resources are parameterized. You can override defaults in the AWS Console or CLI. Key parameters include:
- `KeyName`: EC2 Key Pair
- `InstanceType`: EC2 instance type
- `AmiId`: AMI ID
- `S3Bucket1Name` to `S3Bucket4Name`: S3 bucket names
- `DBName`, `DBUsername`, `DBPassword`: RDS database details

## Troubleshooting
- Ensure all parameter values (especially S3 bucket names and AMI IDs) are valid and unique.
- Use valid availability zones for your region (e.g., `us-east-1a`, `us-east-1b`, etc.).
- Check AWS Console for stack events and error messages.

## Credits
Created by Keerthana Garimella for PROG8870 Final Project.


