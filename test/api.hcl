job "api" {
  datacenters = ["dc1"]

  group "api" {
    network {
      port "http" {
        to = 9090
        static = 9090
      }
    }

    task "app" {
      driver = "docker"

      env {
        LISTEN_ADDR = "0.0.0.0:9090"
        UPSTREAM_URIS = "http://127.0.0.1:5432"
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
