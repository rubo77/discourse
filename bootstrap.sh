#!/usr/bin/env bash

# bootstrap script for Vagrant

# install packages without user interaction:
export DEBIAN_FRONTEND=noninteractive

do-release-upgrade -f DistUpgradeViewNonInteractive

cd /vagrant

### bundle install as user vagrant
su vagrant -c 'bundle install'
su vagrant -c 'bundle exec rake db:migrate'

### Starting Rails as user vagrant
su vagrant -c 'bundle exec rails s -b 0.0.0.0'