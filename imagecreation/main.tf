terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.7.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAR53GJE5KN3HP7QNG"
  secret_key = "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"
}


# data "aws_instance" "foo" {
#   instance_id = aws_instance.webcom.id
# }

locals {
  date   = formatdate("DD-MMM-YYYY", timestamp())
  prefix = "Citrix-XA-WIN16-PRD"
}

resource "aws_ami_from_instance" "custom_image" {
  name               = "${local.prefix}-${local.date}"
  #source_instance_id = data.aws_instance.foo.instance_id
  #source_instance_id = "i-0715215f9ad003a9a"
  source_instance_id = var.theid

  tags = {
    Name                        = "${local.prefix}"
    "BU:SoftwareInstallationID" = "1125151070787077097"
    "BU:Budget"                 = "0031_0000_6483"
    "BU:EnterpriseMonitoring"   = "Full"
    "BU:SupportGroup"           = "Citrix Support"
    "BU:PatchingGroup"          = "NA"
    "BU:ApprovalGroup"          = "AIG-Citrix Support-${var.region}-Mgr"
    "BU:ApplicationName"        = "Citrix-XenDesktop-${var.group}"
    "BU:EnvironmentType"        = "Production"
    "BU:BackupType"             = "NA"
    "BU:GEARID"                 = "${var.gearID}"
    "BU:DeviceType"             = "Managed"
  }
}