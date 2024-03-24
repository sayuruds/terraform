output "region" {
  value = var.region
}

output "project_name" {
  value = var.project_name
}

output "vpc_id" {
    value = aws_vpc.vpc-main.id
}

output "pub-sub_1-id" {
  value = aws_subnet.pub-sub_1.id
}

output "pub-sub_2-id" {
  value = aws_subnet.pub-sub_2.id
}

output "pvt-app-sub_1-id" {
  value = aws_subnet.pvt-app-sub_1.id
}

output "pvt-app-sub_2-id" {
  value = aws_subnet.pvt-app-sub_2.id
}

output "pvt-data-sub_1-id" {
  value = aws_subnet.pvt-data-sub_1.id
}

output "pvt-data-sub_2-id" {
  value = aws_subnet.pvt-data-sub_2.id
}

output "ig-main" {
  value = aws_internet_gateway.gw-main
}