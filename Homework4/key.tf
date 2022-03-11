resource "tls_private_key" "whisky_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "whisky_key" {
  key_name   = "whisky_key"
  public_key = tls_private_key.whisky_key.public_key_openssh
}

resource "local_sensitive_file" "whisky_key" {  
  content  = tls_private_key.whisky_key.private_key_pem
  filename           = "whisky_key.pem"
}