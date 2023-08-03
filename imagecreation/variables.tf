# variable "aws_instance_name" {
#   type        = string
#   description = "the name of a master server already created"
#   #default = "HelloWorld"
# }
variable "region" {
  type        = string
  description = "The region for eg:EMEA"
}
variable "group" {
  type        = string
  description = "The region for eg: AMERICANA"
}
variable "gearID" {
  type        = string
  description = "the gearID for eg: 4295"
}
variable "theid" {
  type        = string
  description = "the theID for instance"
}
