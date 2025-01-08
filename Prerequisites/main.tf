terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "3.0.1-rc6"
    }
  }
}


// Connect to Proxmox:

provider "proxmox" {

  pm_api_url    = var.pm_api_url
  pm_tls_insecure = var.pm_tls_insecure
  pm_api_token_id = var.pm_api_token_id
  pm_password = var.pm_password

}

/**

| Name    | Description            | CPU | RAM   | Storage |
|---------|------------------------|-----|-------|---------|
| jumpbox | Administration host    | 1   | 512MB | 10GB    |
| server  | Kubernetes server      | 1   | 2GB   | 20GB    |
| node-0  | Kubernetes worker node | 1   | 2GB   | 20GB    |
| node-1  | Kubernetes worker node | 1   | 2GB   | 20GB    |


// Jumpbox 
**/

resource "proxmox_vm_qemu" "jumpbox" {
  name = "jumpbox"
  target_node = "pve"
  clone = "Ubuntu24041"
}

/**

resource "proxmox_vm_qemu" "k8s_jumpbox" {
  name = "k8s-jumpbox"
  target_node = "pve"
  clone = "Ubuntu2404Base"
  cores = 1
  sockets = 1
  // storage = "nfs" // local-zfs.vm-101-disk-0,iothread=1,size=20G

}

**/