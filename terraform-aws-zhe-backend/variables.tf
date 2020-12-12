variable "region" {
  description = "AWS region"
  type        = string
}

variable "env" {
  description = "Tag to identify zhe enviroment type and resources"
  type        = string
  default     = ""
}

variable "creator" {
  description = "Tag to identiy who created this module's resources"
  type        = string
  default     = "Terraform"
}

variable "bucket_force_destroy" {
  description = "A boolean that indicates all objects (including any locked objects) should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable."
  type        = bool
  default     = true
}

variable "vpc_id" {
  description = "VPC id to create subnets and databases"
  type        = string
}

variable "cidr_netnum" {
  description = "Value to be added to Subnet CIDR"
  type        = number
  default     = 100
}

variable "db_subnet_count" {
  description = "How many private subnets will be created"
  type        = number
  default     = 2
}

# PosgreSQL

variable "create_postgresql" {
  description = "Create RDS PostgreSQL resources"
  type        = bool
  default     = true
}

variable "postgres_port" {
  description = "PostgreSQL port"
  type        = number
  default     = 5432
}

variable "postgres_user" {
  description = "PostgreSQL username"
  type        = string
  default     = "zenhub"
}

variable "postgres_dbname" {
  description = "PostgreSQL Databse Name"
  type        = string
  default     = "raptor_production"
}

variable "postgres_engine_version" {
  description = "PostgreSQL engine version"
  type        = string
  default     = "11.9"
}

variable "postgres_vars" {
  description = "Variables for PostgreSQL"
  type = object({
    instance_class = string
  })
  default = {
    instance_class = "db.t3.small"
  }
}

# Redis

variable "create_redis" {
  description = "Create ElastiCache Redis resources"
  type        = bool
  default     = true
}

variable "redis_port" {
  description = "Redis port"
  type        = number
  default     = 6379
}

variable "redis_engine_version" {
  description = "Redis engine version"
  type        = string
  default     = "5.0"
}

variable "redis_vars" {
  description = "Variables for Redis"
  type = object({
    node_type = string
  })
  default = {
    node_type = "cache.t3.small"
  }
}

# DocumentDB

variable "create_documentdb" {
  description = "Create DoceumntDB resources"
  type        = bool
  default     = true
}

variable "documentdb_user" {
  description = "DoceumntDB user"
  type        = string
  default     = "toad"
}

variable "documentdb_dbname" {
  description = "DocumentDB database name"
  type        = string
  default     = "zenhub"
}

variable "documentdb_engine_version" {
  description = "DoceumntDB engine version"
  type        = string
  default     = "3.6"
}

variable "documentdb_port" {
  description = "DoceumntDB port"
  type        = number
  default     = 27017
}

variable "documentdb_vars" {
  description = "Variables for MongoDB"
  type = object({
    instance_class = string
    instance_count = number
  })
  default = {
    instance_class = "db.t3.medium"
    instance_count = 1
  }
}

# RabbitMQ

variable "create_mq" {
  description = "Create MQ RabbitMQ resources"
  type        = bool
  default     = true
}

variable "mq_port" {
  description = "RabbitMQ port"
  type        = number
  default     = 5671
}

# FIXME - waiting terraform provider update
# variable "mq_name" {
#   description = "MQ cluster name"
#   type        = string
#   default     = "zhe-toad-rabbitmq"
# }

# variable "mq_engine_version" {
#   description = "RAbbitMQ engine version"
#   type        = string
#   default     = "3.8.6"
# }

# variable "mq_vars" {
#   description = "Variables for Redis"
#   type = object({
#     instance_type   = string
#     deployment_mode = string
#   })
#   default = {
#     instance_type   = "mq.t3.micro"
#     deployment_mode = "SINGLE_INSTANCE"
#   }
# }


# DB connection TLS

variable "db_connection_tls" {
  description = "enbale TLS for DB connections"
  type        = bool
  default     = true
}
