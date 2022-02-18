log_level   = "INFO"
working_dir = "sync-tasks"
port        = 8558

syslog {}

buffer_period {
  enabled = true
  min     = "5s"
  max     = "20s"
}

consul {
  address = "localhost:8500"
}

driver "terraform" {
  # version = "0.14.0"
  # path = ""
  log         = false
  persist_log = false

  backend "consul" {
    gzip = true
  }
}

task {
 name        = "learn-cts-example"
 description = "Example task with two services"
 source      = "findkim/print/cts"
 version     = "0.1.0"
 services    = ["web", "api"]
}

service {
 name   = "api"
 filter = "\"cts\" in Service.Tags"
 # namespace = "my-team"
 # datacenter  = "dc1"
 description = "Match only services with a specific tag"
}


