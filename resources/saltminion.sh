#! /usr/bin/env

vagrant ssh
apt-get --yes -q install python-software-properties
add-apt-repository ppa:saltstack/salt
apt-get --yes -q update
apt-get --yes -q install salt-minion
