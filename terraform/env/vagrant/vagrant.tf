resource "vault_policy" "vagrant-testapp" {
	name     = "vagrant-testapp"

	policy   = <<EOT
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

resource "vault_auth_backend" "vagrant-approle" {

	type      = "approle"
	path      = "approle/environments/vagrant"

}

resource "vault_approle_auth_backend_role" "vagant-testapp-role" {

	backend   = "${vault_auth_backend.vagrant-approle.path}"
	role_name = "vagrant-test-app"
	policies  = ["vagrant-testapp"]

}
