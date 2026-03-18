module "resource_group" {
  source   = "./modules/resource-group"
  rg_name  = var.rg_name
  location = var.location
}

module "vnet" {
  source   = "./modules/vnet"
  rg_name  = module.resource_group.rg_name
  location = var.location
  vnet_name = var.vnet_name
}

module "storage" {
  source   = "./modules/storage"
  rg_name  = module.resource_group.rg_name
  location = var.location
}

module "acr" {
  source   = "./modules/acr"
  rg_name  = module.resource_group.rg_name
  location = var.location
  acr_name = var.acr_name
}

module "aks" {
  source      = "./modules/aks"
  rg_name     = module.resource_group.rg_name
  location    = var.location
  aks_name    = var.aks_name
  subnet_id   = module.vnet.aks_subnet_id
  acr_id      = module.acr.acr_id
}

module "vm" {
  source      = "./modules/vm"
  rg_name     = module.resource_group.rg_name
  location    = var.location
  subnet_id   = module.vnet.vm_subnet_id
}