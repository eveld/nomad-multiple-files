job "demo-proxy" {
  datacenters = ["dc1"]

  group "proxy" {
    network {
      port "http" {
        to = 8080
        static = 8080
      }
    }

    task "envoy" {
      driver = "docker"

      env {
        LISTEN_ADDR = "0.0.0.0:8080"
        UPSTREAM_URIS = "http://127.0.0.1:9090"
      }

      config {
        image = "nicholasjackson/fake-service:v0.21.0"
        ports = ["http"]
      }

      resources {
        cpu    = 500
        memory = 256
      }
    }
  }
}
