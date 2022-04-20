module "instance" {
  source                 = "git::https://github.com/von-salumbides/terraform-module.git//aws-instance"
  project                = var.project
  env                    = var.env
  ami_config             = "ami"
  instance_config        = "my-server"
  subnet_list            = var.subnet_list_external
  iam_instance_profile   = module.iam-role-ec2.profile_id
  vpc_security_group_ids = [module.security-group-ec2.id]
}