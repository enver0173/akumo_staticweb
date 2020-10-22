resource "aws_route53_record" "www" {
  zone_id = var.route_zone_id  #pulls your route53 zone ID from tfvars file
  name = var.domain_name       #pulls your domain name from tfvars file
  type = "A"
  alias {
    name = aws_s3_bucket.website_bucket.website_domain
    zone_id = aws_s3_bucket.website_bucket.hosted_zone_id
    evaluate_target_health = false
  }
}
