# install rvm with latest ruby 2.1.x
gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --ruby=ruby-2.1-head
source /home/vagrant/.rvm/scripts/rvm
rvm list

