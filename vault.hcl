storage "file" {
    path = "/vault/file"
}

backup "file" {
    enabled = true
    destination = "/vault/backup"
    retain = 5
    file_permission = "0600"
}

listener "tcp" {
    address = "0.0.0.0:8200"
    tls_disable = true
}

api_addr = "http://0.0.0.0:8200"

default_lease_ttl = "168h"
max_lease_ttl = "720h"
disable_mlock = true

ui = true
  