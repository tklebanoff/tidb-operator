variable "subnets" {
  description = "A list of subnets to place the EKS cluster and workers within."
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}

variable "worker_groups" {
  description = "A list of maps defining worker group configurations to be defined using AWS Launch Configurations. See workers_group_defaults for valid keys."
  type        = list(map(string))

  default = [
    {
      name = "default"
    },
  ]
}

variable "worker_group_count" {
  description = "The number of maps contained within the worker_groups list."
  type        = string
  default     = "1"
}

variable "workers_group_defaults" {
  description = "Override default values for target groups. See workers_group_defaults_defaults in local.tf for valid keys."
  type        = map(string)
  default     = {}
}

variable "worker_group_tags" {
  description = "A map defining extra tags to be applied to the worker group ASG."
  type        = map(list(string))

  default = {
    default = []
  }
}

variable "worker_groups_launch_template" {
  description = "A list of maps defining worker group configurations to be defined using AWS Launch Templates. See workers_group_defaults for valid keys."
  type        = list(map(string))

  default = [
    {
      name = "default"
    },
  ]
}

variable "worker_group_launch_template_count" {
  description = "The number of maps contained within the worker_groups_launch_template list."
  type        = string
  default     = "0"
}

variable "workers_group_launch_template_defaults" {
  description = "Override default values for target groups. See workers_group_defaults_defaults in local.tf for valid keys."
  type        = map(string)
  default     = {}
}

variable "worker_group_launch_template_tags" {
  description = "A map defining extra tags to be applied to the worker group template ASG."
  type        = map(list(string))

  default = {
    default = []
  }
}

variable "worker_ami_name_filter" {
  description = "Additional name filter for AWS EKS worker AMI. Default behaviour will get latest for the cluster_version but could be set to a release from amazon-eks-ami, e.g. \"v20190220\""
  default     = "v*"
}

variable "worker_additional_security_group_ids" {
  description = "A list of additional security group ids to attach to worker instances"
  type        = list(string)
  default     = []
}

variable "local_exec_interpreter" {
  description = "Command to run for local-exec resources. Must be a shell-style interpreter. If you are on Windows Git Bash is a good choice."
  type        = list(string)
  default     = ["/bin/sh", "-c"]
}

variable "iam_path" {
  description = "If provided, all IAM roles will be created on this path."
  default     = "/"
}




variable "tidb_cluster_chart_version" {
  description = "tidb-cluster chart version"
  default     = "v1.0.0-rc.1"
}

variable "cluster_name" {
  type        = string
  description = "tidb cluster name"
}

variable "cluster_version" {
  type    = string
  default = "v3.0.0-rc.2"
}

variable "ssh_key_name" {
  type = string
}

variable "pd_count" {
  type    = number
  default = 1
}

variable "tikv_count" {
  type    = number
  default = 1
}

variable "tidb_count" {
  type    = number
  default = 1
}

variable "pd_instance_type" {
  type    = string
  default = "c5d.large"
}

variable "tikv_instance_type" {
  type    = string
  default = "c5d.large"
}

variable "tidb_instance_type" {
  type    = string
  default = "c5d.large"
}

variable "monitor_instance_type" {
  type    = string
  default = "c5d.large"
}

variable "override_values" {
  type    = string
  default = ""
}

variable "eks" {
  description = "eks info"
}
