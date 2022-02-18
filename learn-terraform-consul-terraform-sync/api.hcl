service {
  name = "api"
  id = "api1"
  port = 9003

  connect {
    sidecar_service {}
  }
}

 check {
     id =  "api",
     name = "The counting service",
     service_id = "api",
     tcp  = "localhost:9003",
     interval = "1s",
     timeout = "1s"
}

