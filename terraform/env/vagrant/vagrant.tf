resource "vault_policy" "vagrant-testapp" {
	name = "vagrant-testapp"

	policy = <<EOT
path "transit/environments/vagrant/encrypt/testapp" {
  capabilities = ["create", "update"]
}

path "transit/environments/vagrant/decrypt/testapp" {
  capabilities = ["create", "update"]
}

path "auth/token/renew/*" {
  policy = "write"
}
EOT
}
