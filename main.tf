resource "aws_s3_bucket" "mybuck_ray" {
    bucket = "raytest_buck12321221"
}

resource "aws_s3_bucket_ownership_controls" "bucket_acl"{
    bucket = aws_s3_bucket.mybuck_ray.id
    rule{
        object_ownership = "BucketOwner"
    }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.bucket_acl]
   
  bucket = aws_s3_bucket.mybuck_ray.id
  acl = "private"
}
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh_sg"
  description = "Security group allowing SSH access"
  
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow access from any IP address
  }
}

output "security_group_id" {
  value = aws_security_group.allow_ssh.id
}
