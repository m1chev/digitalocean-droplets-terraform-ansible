# Summary: 
The purpose of this repo is to set number of nodes/droplets
on DigitalOcean and install Docker on them.

## Steps:
1. Frist run Terraform to create the droplets. 
Need to create terraform.tfvars file, in order to run the command, with the 
do_token = "place-to-put-the-actual-token"

`terraform apply --auto-approve`

2. Then run Ansible to install Docker. 
Should create hosts.ini file
with the IPs listed. The IPs should be visible after running the 
terraform apply command. Example of the file:

`[digitalocean]`

`1.1.1.1`


Run the actual command:

`ansible-playbook playbook.yml -u root`
