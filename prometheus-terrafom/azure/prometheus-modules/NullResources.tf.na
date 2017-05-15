# Null resource to install prometheus will use variables to trigger changes
# wihtin null resource to force terraform to re-run ansible again instead of 
# running it manually
resource "null_resource" "prom_install" {
    triggers = {
    }
}