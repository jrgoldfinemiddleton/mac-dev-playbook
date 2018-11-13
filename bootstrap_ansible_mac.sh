#!/usr/bin/env bash

# install Apple command line tools
xcode-select --install 2>/dev/null || echo Apple CLI tools already installed

# create temporarily virtualenv (default macOS installation) to execute playbook
python -m virtualenv ~/.ansible_bootstrap

# activate the virtualenv
source ~/.ansible_bootstrap/bin/activate

# install Ansible in the virtualenv
pip install ansible

cd ~/Desktop

# clone the mac-dev-playbook repo
git clone https://github.com/jrgoldfinemiddleton/mac-dev-playbook.git

cd mac-dev-playbook

# pull role dependencies down from Ansible Galaxy
ansible-galaxy install -r requirements.yml

# ensure you have added a file called config.yml with your variables
[ -s config.yml ] && ansible-playbook main.yml -i inventory -K || echo 'Add your variables to config.yml, then run this again.'

cd .. && rm -rf mac-dev-playbook

# exit the virtualenv
deactivate && rm -rf ~/.ansible_bootstrap