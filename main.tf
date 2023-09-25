data "template_file" "user_data" {
  template = file("userdata.sh")
}

resource "aws_security_group" "DBsg" {
  name = "db-server-sg"
  ingress {

    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {

    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]

  }

  tags = {
    "env" = local.tags
  }

}

data "aws_iam_instance_profile" "Gsynergy" {
  name = "Gsynergy"
}

resource "aws_instance" "DBserver" {
  ami = var.ami
  instance_type = var.instance_type
  security_groups = [ aws_security_group.DBsg.name ]
  subnet_id = "subnet-0fe3f5b7df5c2d98c"
  user_data = data.template_file.user_data.rendered
  iam_instance_profile = data.aws_iam_instance_profile.Gsynergy.name
  tags = {
    "Name" = "Database-Server"
    "env" = "Gsynergy"
  }
}

resource "aws_security_group" "Airflowsg" {
  name = "airflow-server-sg"
  ingress {
    from_port = "22"
    to_port = "22"
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  tags = {
    "env" = "Gsynergy"
  }
}

resource "aws_instance" "Airflow" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = "subnet-0fe3f5b7df5c2d98c"
  security_groups = [ aws_security_group.Airflowsg.name ]
  user_data = data.template_file.user_data.rendered
  iam_instance_profile = data.aws_iam_instance_profile.Gsynergy.name
  tags = {
    "Name" = "AirFlow-Server"
    "env" = "Gsynergy"
  }
}

resource "aws_redshift_cluster" "RSCluster" {
  cluster_identifier = "GSynergy"
  database_name = "formation"
  master_username = "Admin"
  master_password = "Admin@123"
  node_type = "dc2.large"
  cluster_type = "single-node"
  tags = {
    "env" = "Gsynergy"
  }
}

data "template_file" "runner" {
  template = file("userdata_runner.sh")
}

resource "aws_instance" "runner" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = "subnet-0fe3f5b7df5c2d98c"
  iam_instance_profile = data.aws_iam_instance_profile.Gsynergy.name
  user_data = data.template_file.runner.rendered
  tags = {
    "Name" = "GH-runner"
    "env" = "Gsynergy"
  }
}