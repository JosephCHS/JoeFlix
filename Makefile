.PHONY: help init plan apply destroy update backup ansible-install vault-edit clean

help:
	@echo "JoeFlix Media Server Management"
	@echo ""
	@echo "Available commands:"
	@echo "  make init          - Initialize OpenTofu and install dependencies"
	@echo "  make plan         - Show planned infrastructure changes"
	@echo "  make apply        - Apply infrastructure changes"
	@echo "  make destroy      - Destroy all infrastructure (USE WITH CAUTION)"
	@echo "  make update       - Update all services via Ansible"
	@echo "  make backup       - Create backup of container configurations"
	@echo "  make vault-edit   - Edit Ansible vault file"
	@echo "  make clean        - Clean up temporary files"
	@echo "  make ansible-install - Run Ansible playbook for service installation"

init:
	@echo "Initializing JoeFlix infrastructure..."
	cd opentofu/joeflix_containers && tofu init

plan:
	@echo "Planning infrastructure changes..."
	cd opentofu/joeflix_containers && tofu plan

apply:
	@echo "Applying infrastructure changes..."
	cd opentofu/joeflix_containers && tofu apply -auto-approve

destroy:
	@echo "WARNING: This will destroy all containers and services!"
	@read -p "Are you sure? [y/N]: " confirm && [ $$confirm = "y" ]
	cd opentofu/joeflix_containers && tofu destroy -auto-approve

update:
	@echo "Updating all services..."
	cd ansible && ansible-playbook -i hosts.yml main.yml --tags update

backup:
	@echo "Creating backup of configurations..."
	tar -czf joeflix_backup_$$(date +%Y%m%d).tar.gz ansible/group_vars/ ansible/vault.yml opentofu/joeflix_containers/secrets.auto.tfvars

vault-edit:
	@echo "Editing Ansible vault..."
	cd ansible && ansible-vault edit vault.yml

clean:
	@echo "Cleaning up temporary files..."
	find . -name "*.retry" -delete
	find . -name ".terraform" -type d -exec rm -rf {} +
	find . -name "*.tfstate*" -delete
	find . -name ".terraform.lock.hcl" -delete

ansible-install:
	@echo "Running Ansible playbook..."
	cd ansible && ansible-playbook -i hosts.yml main.yml
