resource "aws_s3_bucket" "mybuck_ray" {
    bucket = "raytest_buck12321"
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