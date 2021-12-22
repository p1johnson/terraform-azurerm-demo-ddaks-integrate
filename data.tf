data "tfe_outputs" "harness" {
  organization = "pjdevelop"
  workspace = "terraform-azurerm-demo-ddaks-harness"
}

data "tfe_outputs" "core" {
  organization = "pjdevelop"
  workspace = "terraform-azurerm-demo-ddaks-core"
}
