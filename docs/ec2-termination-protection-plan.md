# EC2 Termination Protection — Terraform Security Improvement

## Project
terraform-aws-ec2-lab

## AWS Environment
- Region: us-east-1
- EC2 instance: i-00b425af9a114a029
- Root EBS volume: vol-0fe561df473bb8919
- Volume type: gp3
- Volume size: 8 GiB
- EBS encryption: enabled

## Verified Initial AWS Configuration
- EC2 API termination protection: disabled
- Root EBS DeleteOnTermination: true

## Terraform Security Configuration
- prevent_destroy: true
- disable_api_termination: true
- EBS encryption: true

## Verified Terraform Plan
- Resources to add: 0
- Resources to change: 1
- Resources to destroy: 0
- Proposed action: update EC2 termination protection in place

## Deployment Status
NOT DEPLOYED.

The Terraform configuration has been updated locally.
The proposed change has been validated and reviewed.
Terraform apply has not been executed.

## Architecture

```mermaid
flowchart TD
    A[Ubuntu WSL2] --> B[Terraform]
    B --> C[AWS EC2]
    C --> D[Encrypted EBS Root Volume]
    B -. Planned API Protection .-> C
    D -. Backup Not Yet Created .-> E[EBS Snapshot]

## Step 2 — Expected results

You should see:

- `Success! The configuration is valid.`
- A report containing the verified Terraform plan and Mermaid diagram.
- `main.tf` shown as modified.
- `docs/ec2-termination-protection-plan.md` shown as a new file.

The report clearly distinguishes **configured**, **planned**, and **deployed** resources.

## Step 3 — Commit and publish to GitHub

After checking that the report is accurate and contains no secrets, run this second block:

```bash
# ================================================
# LESSON 81: GIT COMMIT AND GITHUB PUSH
# ================================================

cd ~/terraform-aws-ec2-lab || exit 1

# Stage only the intended files
git add main.tf docs/ec2-termination-protection-plan.md

# Verify staged changes
git diff --cached --check || exit 1
git diff --cached --stat

# Commit the improvement
git commit -m "docs: record planned EC2 termination protection"

# Push to GitHub only if the commit succeeded
git push origin main

# Verify synchronization
git status --short --branch
git log -1 --oneline

echo "===== GITHUB PORTFOLIO UPDATED ====="
cat > docs/ec2-termination-protection-plan.md <<'EOF'
