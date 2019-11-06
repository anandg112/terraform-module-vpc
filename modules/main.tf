module "vpc_with_subnets" {
  source             = "./../examples"
  region             = "${var.region}"
  availability_zones = "${var.availability_zones}"

}
