# resource "aws_subnet" "subnet" {
#   count = var.vpc_count * (var.public_subnet_count + var.private_subnet_count)

#   vpc_id = aws_vpc.vpc[
#     floor(count.index / (var.public_subnet_count + var.private_subnet_count))
#   ].id

#   cidr_block = cidrsubnet(
#     element(
#       var.vpc_cidr,
#       floor(count.index / (var.public_subnet_count + var.private_subnet_count))
#     ),
#     8,
#     count.index % (var.public_subnet_count + var.private_subnet_count) + 1
#   )

#   availability_zone = element(
#     var.availability_zones,
#     count.index % var.vpc_count
#   )

#   tags = merge(
#     var.tags,
#     {
#       "Name" = "${var.tags["Name"]}-${count.index + 1}-${
#         (count.index % (var.public_subnet_count + var.private_subnet_count)) < var.public_subnet_count ? "public-subnet" : "private-subnet"
#       }"
#     }
#   )
# }

resource "aws_subnet" "public_subnet" {
  count      = var.public_subnet_count * var.vpc_count
  depends_on = [aws_vpc.vpc]
  vpc_id     = aws_vpc.vpc[floor(count.index / var.public_subnet_count)].id

  cidr_block = cidrsubnet(
    element(
      var.vpc_cidr,
      floor(count.index / var.public_subnet_count)
    ),
    8,
    count.index % var.public_subnet_count + 1
  )

  availability_zone = element(var.availability_zones, count.index)

  tags = merge(
    var.tags,
    {
      Name = "${var.tags["Name"]}-${count.index + 1}-public-subnet"
    }
  )
}


