resource "vault_policy" "vagrant-patientconversation" {
	name = "vagrant-patientcoversation"

	policy = <<EOT
path "transit/environments/vagrant/encrypt/patientconversation" {
  capabilities = ["create", "update"]
}

path "transit/environments/vagrant/decrypt/patientconversation" {
  capabilities = ["create", "update"]
}

path "auth/token/renew/*" {
  policy = "write"
}
EOT
}
