# LOCAL DEVELOPMENT ONLY. Vault's listener is plaintext internally and
# published only on 127.0.0.1 by Docker Compose. Do not expose publicly.
ui = true
disable_mlock = true
storage "file" { path = "/vault/file" }
listener "tcp" {
  address = "0.0.0.0:8200"
  tls_disable = 1
}
