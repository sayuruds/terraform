# provider
provider "aws" {
  region = var.region
  profile = "website-profile"
}

# vpc
module "vpc" {
  source                = "./modules/vpc"
  region                = var.region
  project_name          = var.project_name
  vpc-cidr              = var.vpc-cidr
  pub-sub_1-cidr        = var.pub-sub_1-cidr
  pub-sub_2-cidr        = var.pub-sub_2-cidr
  pvt-app-sub_1-cidr    = var.pvt-app-sub_1-cidr
  pvt-app-sub_2-cidr    = var.pvt-app-sub_2-cidr
  pvt-data-sub_1-cidr   = var.pvt-data-sub_1-cidr
  pvt-data-sub_2-cidr   = var.pvt-data-sub_2-cidr

}