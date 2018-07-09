resource "vault_auth_backend" "password" {
  path    = "userpass/"
  type    = "userpass"
}