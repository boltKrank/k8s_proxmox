terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "3.0.1-rc6"
    }
  }
}


// Connect to Proxmox:

provider "proxmox" {
  pm_api_url    = "https://192.168.20.27:8006/api2/json"
  pm_user       = "terraform@pam"
  pm_password   = "b072fa05-9a6a-4bdd-8b3d-8bdda50752af"
  pm_tls_insecure = true
}

/**

| Name    | Description            | CPU | RAM   | Storage |
|---------|------------------------|-----|-------|---------|
| jumpbox | Administration host    | 1   | 512MB | 10GB    |
| server  | Kubernetes server      | 1   | 2GB   | 20GB    |
| node-0  | Kubernetes worker node | 1   | 2GB   | 20GB    |
| node-1  | Kubernetes worker node | 1   | 2GB   | 20GB    |

**/