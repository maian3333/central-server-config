datacenter = "dc1"
data_dir   = "/consul/data"
log_level  = "INFO"

server = true
bootstrap_expect = 1

ui_config {
  enabled = true
}

client_addr = "0.0.0.0"

ports {
  http = 8500
}

acl {
  enabled = true
  default_policy = "deny"
  enable_token_persistence = true

  tokens {
    initial_management = "f4security"
    agent = "f4security"  # Agent token with service:write permission for deregistration
  }
}
