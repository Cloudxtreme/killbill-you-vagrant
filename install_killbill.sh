#!/bin/sh

cd /vagrant
sudo service tomcat7 stop
sudo rm -rf /var/lib/tomcat7/webapps/*
sudo gem install i18n --no-ri --no-rdoc
sudo gem uninstall i18n -v 0.7.0.beta1
sudo kpm install kpm.yml
sudo service tomcat7 start
