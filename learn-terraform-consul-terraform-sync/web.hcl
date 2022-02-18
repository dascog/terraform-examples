service {
  name = "web"
  id = "web1"
  port = 9002

  connect {
    sidecar_service {
      proxy {
        upstreams = [
          {
            destination_name = "api"
            local_bind_port  = 9003
          }
        ]
      }
    }
  }
}

 check {
     id =  "web",
     name = "The dashboard service",
     service_id = "web",
     tcp  = "localhost:9002",
     interval = "1s",
     timeout = "1s"
}

