variable "subnet_id" {
    description = "AWS subnet to which host to be provisioned"
    type = string
    default = "subnet-07eef9e952669a523"

}
variable "security_group_id" {
    description = "AWS security group to which host to be provisioned"
    type = list(string)
    default = ["sg-08870f5217a0a039b"]
}
variable "key_pair" {
    description = "Existing key value pair"
    default = "hitanshi"
}

