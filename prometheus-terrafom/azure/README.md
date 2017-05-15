# This is a starter to automate deployment of prometheus on Azure where I will be sporting prometheus stats from spring boot application and will be poll them using HA prometheus setup

N.B
Terraform will be modulazied later on.


Current 
---------------------------------------------------------
[public subnet ]                      | [private subnet]
---------------------------------------------------------
- prometheus server(s)    |
                          | - application servers                 
---------------------------------------------------------


Goal 
----------------------------------------------------------
[public subnet ]                      | [private subnet]
----------------------------------------------------------
- Bastion Box                         |  
- Grafana Dashboard >> Load Balancer  | - [two or more HA promethus servers]
                                      | - application servers
----------------------------------------------------------
