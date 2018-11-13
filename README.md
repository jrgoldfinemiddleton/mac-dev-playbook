# Mac Development Ansible Playbook

[![Build Status](https://travis-ci.org/jrgoldfinemiddleton/mac-dev-playbook.svg?branch=master)](https://travis-ci.org/jrgoldfinemiddleton/mac-dev-playbook)

*Note from upstream author*
This playbook installs and configures most of the software I use on my Mac for web and software development. Some things in macOS are slightly difficult to automate, so I still have some manual installation steps, but at least it's all documented here.

This is a work in progress, and is mostly a means for me to document my current Mac's setup. I'll be evolving this set of playbooks over time.

*See also*:

  - [Boxen](https://github.com/boxen)
  - [Battleschool](http://spencer.gibb.us/blog/2014/02/03/introducing-battleschool)
  - [osxc](https://github.com/osxc)
  - [MWGriffin/ansible-playbooks](https://github.com/MWGriffin/ansible-playbooks) (the original inspiration for this project)

## Installation

Check out the included `bootstrap_ansible_mac.sh` script.  Tweak as desired.  You should create a `config.yml` file to override variables in `default.config.yml`.

### Running a specific set of tagged tasks

You can filter which part of the provisioning process to run by specifying a set of tags using `ansible-playbook`'s `--tags` flag. The tags available are `dotfiles`, `homebrew`, `mas`, `extra-packages` and `osx`.

    ansible-playbook main.yml -i inventory -K --tags "dotfiles,homebrew"

## Overriding Defaults

Not everyone's development environment and preferred software configuration is the same.

You can override any of the defaults configured in `default.config.yml` by creating a `config.yml` file and setting the overrides in that file. For example, you can customize the installed packages and apps with something like:

    homebrew_installed_packages:
      - cowsay
      - git
      - go

    mas_installed_apps:
      - { id: 443987910, name: "1Password" }
      - { id: 498486288, name: "Quick Resizer" }
      - { id: 557168941, name: "Tweetbot" }
      - { id: 497799835, name: "Xcode" }

    composer_packages:
      - name: hirak/prestissimo
      - name: drush/drush
        version: '^8.1'

    gem_packages:
      - name: bundler
        state: latest

    npm_packages:
      - name: webpack

    pip_packages:
      - name: mkdocs

Any variable can be overridden in `config.yml`; see the supporting roles' documentation for a complete list of available variables.

## Included Applications / Configuration (Default)

Applications (installed with Homebrew Cask):

  - [Docker](https://www.docker.com/)
  - [Firefox](https://www.mozilla.org/en-US/firefox/new/)
  - [MacVim](http://macvim-dev.github.io/macvim/)
  - [Sequel Pro](https://www.sequelpro.com/) (MySQL client)
  - [Vagrant](https://www.vagrantup.com/)

Packages (installed with Homebrew):

  - autoconf
  - bash-completion
  - git
  - iperf
  - nmap
  - openssl
  - wget

My [dotfiles](https://github.com/jrgoldfinemiddleton/dotfiles) are also installed into the current user's home directory, excluding the `.osx` dotfile for configuring many aspects of macOS for better performance and ease of use. You can disable dotfiles management by setting `configure_dotfiles: no` in your configuration.

Finally, there are a few other preferences and settings added on for various apps and services.

## Testing the Playbook

This project is [continuously tested on Travis CI's macOS infrastructure](https://travis-ci.org/jrgoldfinemiddleton/mac-dev-playbook).

## Ansible for DevOps

Check out [Ansible for DevOps](https://www.ansiblefordevops.com/), which teaches you how to automate almost anything with Ansible.

## Author

[Jason Goldfine-Middleton](https://github.com/jrgoldfinemiddleton), 2018 (forked from [geerlingguy/mac-dev-playbook](https://github.com/geerlingguy/mac-dev-playbook)).
