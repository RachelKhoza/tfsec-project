# tfsec-project

This project contains Terraform configuration for setting up an AWS S3 bucket with specific ownership controls and access control lists (ACLs). Additionally, this project uses GitHub Actions to integrate `tfsec` for Terraform code security analysis.

## Table of Contents
- [Project Overview](#project-overview)
- [Setup](#setup)
- [Usage](#usage)
- [GitHub Actions Integration](#github-actions-integration)


## Project Overview

This Terraform configuration creates an AWS S3 bucket and applies ownership controls and ACL settings to it. The configuration includes:

- An S3 bucket with a specific name.
- Ownership controls to ensure the bucket owner has ownership of all objects.
- An ACL setting to make the bucket private.

## Setup

1. **Prerequisites**:
    - Terraform installed on your machine.
    - AWS CLI configured with appropriate credentials.

2. **Clone the Repository**:
    ```sh
    git clone https://github.com/RachelKhoza/tfsec-project.git
    cd tfsec-project
    ```

3. **Initialize Terraform**:
    ```sh
    terraform init
    ```

4. **Apply the Configuration**:
    ```sh
    terraform apply
    ```

## Usage

Modify the `main.tf` file to customize the bucket name or other settings as per your requirements.

### `main.tf`
```hcl
resource "aws_s3_bucket" "mybuck_ray" {
    bucket = "raytest_buck12321221"
}

resource "aws_s3_bucket_ownership_controls" "bucket_acl" {
    bucket = aws_s3_bucket.mybuck_ray.id
    rule {
        object_ownership = "BucketOwner"
    }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
    depends_on = [aws_s3_bucket_ownership_controls.bucket_acl]
    bucket = aws_s3_bucket.mybuck_ray.id
    acl = "private"
}

GitHub Actions Integration

This project uses GitHub Actions to run tfsec and ensure the Terraform code adheres to security best practices.

GitHub Actions Workflow

The tfsec-check.yml file in the .github/workflows directory is configured to run tfsec on every push to the main branch and on pull requests.