################# vpc #################

variable "region" {
  description = "region"
  type = string
}

variable "project_name" {
  description = "project_name"
  type = string
}


# vpc vars
variable "vpc-cidr" {
  description = "vpc-cidr"
  type = string
}


# pub subnet 1
variable "pub-sub_1-cidr" {
  description = "pub-sub_1-cidr"
  type = string
}

# pub subnet 2
variable "pub-sub_2-cidr" {
  description = "pub-sub_2-cidr"
  type = string
}

# pvt app subnet 1
variable "pvt-app-sub_1-cidr" {
  description = "pvt-app-sub_1-cidr"
  type = string
}

# pvt app subnet 2
variable "pvt-app-sub_2-cidr" {
  description = "pvt-app-sub_2-cidr"
  type = string
}

# pvt data subnet 1
variable "pvt-data-sub_1-cidr" {
  description = "pvt-data-sub_1-cidr"
  type = string
}

# pvt data subnet 2
variable "pvt-data-sub_2-cidr" {
  description = "pvt-data-sub_2-cidr"
  type = string
}