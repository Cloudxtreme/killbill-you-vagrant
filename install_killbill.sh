#!/bin/sh
sudo gem install i18n --no-ri --no-rdoc
sudo gem uninstall i18n -v 0.7.0.beta1
cd /vagrant
sudo kpm install kpm.yml
cp stripe.yml /var/tmp/bundles/plugins/ruby/killbill-stripe/0.2.1/stripe.yml