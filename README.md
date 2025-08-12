## AWS Infrastructure Automation with Terraform and CloudFormation

## Overview
This project demonstrates how to provision a scalable AWS infrastructure using both Terraform and AWS CloudFormation. The infrastructure includes S3 Buckets, an EC2 Instance in a custom VPC, and a MySQL RDS Database. The project follows Infrastructure as Code (IaC) best practices, using variables, modular files, and clear documentation.

---

## Project Structure
```
/
├── terraform-project/
│   ├── main.tf
│   ├── provider.tf
│   ├── variables.tf
│   ├── terraform.tfvars
├── cloudformation/
│   ├── s3-buckets.yml
│   ├── ec2-vpc.yml
│   └── rds.yml
├── README.md
---

## Terraform Deployment

### Resources Created
- 4 private S3 buckets (with versioning)
- 1 custom VPC
- 2 public subnets
- 1 internet gateway
- 1 public route table and associations
- 1 EC2 instance (Amazon Linux 2, public IP, SSH access)
- 1 security group for EC2 (SSH)
- 1 security group for RDS (MySQL)
- 1 DB subnet group for RDS
- 1 RDS MySQL instance (publicly accessible)

### How to Deploy
1. **Set AWS credentials in your terminal:**
   ```powershell
   $env:AWS_ACCESS_KEY_ID="<your-access-key>"
   $env:AWS_SECRET_ACCESS_KEY="<your-secret-key>"
   $env:AWS_SESSION_TOKEN="<your-session-token>"
   $env:AWS_DEFAULT_REGION="us-east-1"
   ```
2. **Initialize and apply Terraform:**
   ```powershell
   cd terraform-project
   terraform init
   terraform plan
   terraform apply
   ```
3. **Destroy resources when done:**
   ```powershell
   terraform destroy
   ```

---

## CloudFormation Deployment

### Templates
- `cloudformation/s3-buckets.yml` — 3 private S3 buckets with versioning and public access block
- `cloudformation/ec2-vpc.yml` — VPC, subnet, IGW, route table, security group, EC2 instance
- `cloudformation/rds.yml` — MySQL RDS instance, security group, subnet group

### How to Deploy
1. Go to AWS Console → CloudFormation → Stacks → Create stack.
2. Upload the desired YAML file.
3. Enter parameters as prompted:
   - **S3 Buckets:** Unique bucket names
   - **EC2:** KeyName (e.g., `keerthi-keypair`), InstanceType (e.g., `t2.micro`)
   - **RDS:** DBName, DBUsername, DBPassword, DBInstanceClass, VpcId, Subnet1, Subnet2 (from EC2 stack outputs)
4. Click Create stack and wait for completion.
5. To delete, select the stack and click Delete.

---

## Variables and Dynamic Configuration
- All sensitive and dynamic values are set via `variables.tf` and `terraform.tfvars` for Terraform, and via Parameters for CloudFormation.
- No secrets are hardcoded in the codebase.

---

## State Management
- Terraform state is stored locally (`backend.tf` uses local backend).
- CloudFormation manages state automatically in AWS.

---

## Screenshots & Outputs
- S3 buckets with versioning enabled
- EC2 instance with public IP
- RDS instance running
- Terraform and CloudFormation code snippets
- Terraform apply and CloudFormation stack outputs

---

## Destroying Resources
- **Terraform:** `terraform destroy`
- **CloudFormation:** Delete the stack from the AWS Console or use:
  ```powershell
  aws cloudformation delete-stack --stack-name <stack-name> --region us-east-1
  ```

---

## Challenges & Solutions
- **Key pair errors:** Ensured the key pair exists in the correct region.
- **RDS password validation:** Used only allowed characters.
- **S3 bucket name uniqueness:** Used globally unique names.
- **CloudFormation property errors:** Fixed invalid properties (e.g., `AssociatePublicIpAddress`).

