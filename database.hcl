job "demo-database" {
  datacenters = ["dc1"]

  group "database" {
    network {
      port "sql" {
        to = 5432
        static = 5432
      }
    }

    task "postgres" {
      driver = "docker"

      env {
        LISTEN_ADDR = "0.0.0.0:5432"
      }

      config {
        image = "nicholasjackson/fake-service:v0.21.0"
        ports = ["sql"]
      }

      resources {
        cpu    = 500
        memory = 256
      }
    }
  }
}
