k8s_ingress "consul-http" {
  cluster = "k8s_cluster.kubernetes"

  network {
    name = "network.cloud"
  }

  service  = "consul-ui"

  port {
    local  = 80
    remote = 80
    host   = 8500
  }
}

k8s_ingress "vault-http" {
  cluster = "k8s_cluster.kubernetes"
  service  = "vault"
  
  network {
    name = "network.cloud"
  }

  port {
    local  = 8200
    remote = 8200
    host   = 8200
  }
}

k8s_ingress "search-http" {
  cluster = "k8s_cluster.kubernetes"
  depends_on = ["k8s_config.apps"]

  network {
    name = "network.cloud"
    aliases = ["search.megacorp.com"]
  }

  service  = "search"

  port {
    local  = 80
    remote = 9090
    host   = 9090
  }
}
