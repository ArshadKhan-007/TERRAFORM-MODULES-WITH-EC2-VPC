# 🏗️ Terraform Modules — AWS VPC & EC2

AWS infrastructure using a **modular Terraform structure** with support for multiple environments (dev & production).

---

## 📁 Project Structure

```
TERRAFORM-MODULES/
├── ENVS/
│   └── dev/
│       ├── main.tf           # Calls VPC & EC2 modules
│       ├── variables.tf      # Variable declarations
│       ├── provider.tf       # AWS provider config
│       ├── outputs.tf        # Shows vpc_id, subnet IDs, EC2 IP
│       └── dev.tfvars.example  # Example tfvars (actual dev.tfvars is gitignored)
│
└── MODULES/
    ├── VPC/
    │   ├── main.tf           # VPC, public & private subnets
    │   ├── variables.tf
    │   └── outputs.tf        # Exports vpc_id, subnet IDs
    └── EC2/
        ├── main.tf           # EC2 instance inside custom VPC
        ├── variables.tf
        └── outputs.tf
```

---

## 🚀 What This Project Does

- Creates a **custom AWS VPC** with public and private subnets
- Launches an **EC2 instance** inside the custom VPC (not default VPC)
- Uses **Terraform modules** for reusable, clean infrastructure
- Currently has **dev environment** set up with full VPC + EC2 infrastructure

---

## ⚙️ How It Works

```
dev.tfvars  →  dev/main.tf  →  VPC Module  →  outputs (subnet_id)
                           →  EC2 Module  ←  uses subnet_id from VPC
```

The `dev/main.tf` acts as a bridge — it passes values from `dev.tfvars` to both modules, and passes the VPC output (subnet ID) into the EC2 module.

---

## 🛠️ Usage

### 1. Go to your environment folder
```bash
cd ENVS/dev
```

### 2. Create your tfvars file from example
```bash
# dev.tfvars.example dekho aur apni values se dev.tfvars banao
cp dev.tfvars.example dev.tfvars
# Ab dev.tfvars mein apni actual values dalo
```

### 3. Initialize Terraform
```bash
terraform init
```

### 3. Plan (preview changes)
```bash
terraform plan -var-file="dev.tfvars"
```

### 4. Apply (create infrastructure)
```bash
terraform apply -var-file="dev.tfvars"
```

### 5. Destroy (delete infrastructure)
```bash
terraform destroy -var-file="dev.tfvars"
```

---

## 🔧 Want to Extend This Project?

This project is built to be easily expandable! Here are some things you can try:

**Add a Production Environment:**
```
ENVS/
└── production/
    ├── main.tf
    ├── variables.tf
    ├── provider.tf
    └── prod.tfvars    # Different CIDR, instance type, region etc.
```
Just copy the `dev` folder, rename to `production`, and update values in `prod.tfvars`!

**Add More Modules:**
```
MODULES/
├── RDS/       # Add a database
├── S3/        # Add storage buckets
├── ALB/       # Add a load balancer
└── SG/        # Add security groups as a module
```
Each module follows the same pattern — `main.tf`, `variables.tf`, and `outputs.tf`.

---

## 📝 Variables (dev.tfvars.example)

> ⚠️ **Note:** `dev.tfvars` is **not pushed to GitHub** because it contains sensitive values like AMI IDs and environment-specific config. Instead, `dev.tfvars.example` is provided as a template. Copy it and fill in your own values.

```bash
cp dev.tfvars.example dev.tfvars
```

| Variable | Description | Example |
|---|---|---|
| `cidr-block` | VPC CIDR range | `10.0.0.0/16` |
| `public_cidr` | Public subnet CIDR | `10.0.1.0/24` |
| `private_cidr` | Private subnet CIDR | `10.0.2.0/24` |
| `availability_zone` | AWS AZ | `us-east-1a` |
| `ami_id` | EC2 AMI ID | `ami-0abc123...` |
| `instance_type` | EC2 instance type | `t3.micro` |
| `name` | Resource name tag | `Server` |
| `Name` | VPC name tag | `vpc_module` |

---

## 📤 Outputs

After `terraform apply`, you will see:

- `vpc_id` — ID of the created VPC
- `public_subnet_id` — ID of the public subnet
- `private_subnet_id` — ID of the private subnet
- `ec2_public_ip` — Public IP of the EC2 instance
- `ec2_public_dns` — Public DNS of the EC2 instance

---

## 🔑 Key Concepts Used

- **Terraform Modules** — Reusable infrastructure components
- **Output Variables** — Passing data between modules
- **tfvars files** — Environment-specific values
- **Multi-environment setup** — Dev is there but we can add production env also.

---

## 🗺️ Architecture Diagram

![Architecture Diagram](images/architecture-diagram.svg)

