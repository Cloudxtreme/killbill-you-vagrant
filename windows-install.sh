rb=/c/Ruby21-x64/bin/ruby
gm=/c/Ruby21-x64/bin/gem
dk="/c/ruby215dk"

echo [INSTALLING RUBY]
curl http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.1.5-x64.exe?direct >> rubyinstaller.exe
rubyinstaller.exe //verysilent //tasks="assocfiles,modpath"
rm rubyinstaller.exe

echo [INSTALLIHNG RUBY DEVKIT]
curl http://cdn.rubyinstaller.org/archives/devkits/DevKit-mingw64-64-4.7.2-20130224-1432-sfx.exe >> devkit.exe
devkit.exe -o"$dk" -y
rm devkit.exe
$rb "$dk/dk.rb" init
$rb "$dk/dk.rb" install

echo [INSTALLING LIBRARIAN-CHEF]
$gm install librarian-chef --no-rdoc --no-ri

echo [INSTALLING VAGRANT]
curl -L https://dl.bintray.com/mitchellh/vagrant/vagrant_1.6.5.msi >> vagrant.msi
msiexec //qr //i vagrant.msi
rm vagrant.msi

echo [GO INSTALL VIRTUALBOX]