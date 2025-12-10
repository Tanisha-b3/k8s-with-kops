variable "bucket_name" {
  description = "Name of S3 bucket."
  type        = string
  default = "s3Bucket-t"
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
}
