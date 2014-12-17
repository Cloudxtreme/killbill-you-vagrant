# killbill-you-vagrant

vagrant box for killbill.io spike/dev work

## install

You need on your host machine:

- Ruby2.1.5
- Ruby2.1.5 dev kit
- The ruby gem `librarian-chef`
- VirtualBox
- Vagrant

On windows this is a pain, so you can install VirtualBox by hand and then run `windows-install.sh` from within a git bash prompt. Some parts may fail as the installers are not great; try closing any command prompts and running it again. If it fails again then skip `librarian-chef update` and just do `vagrant up`. 

After the pre-reqs are installed, navigate to the repo directory and:

```sh
librarian-chef update
vagrant up
```

This will download, start, and provision the vagrant box for use.

Once this is all done (first run takes a while), you should be able to access `http://localhost:8080/api.html`

## credentials

MySQL (can be connected to from host machine): user `killbill`, password `killbill`, database `killbill`

Tomcat admin: user `manager`, password `manager`

## fun facts

- Changes to the bundles folder should never be checked in - it's the plugin deployment folder that the server loads from
- This isn't setup for development of plugins yet, as we need to figure out the best way to do that while having them loaded from git repos
- Oh SQL, MY SQL! Our fearful trip is done. You can access the MySQL DB from the host machine by connecting on localhost:3306
- It would be nice to make the host install scripts a bit nicer but chocolatey is being a pain and people with a mac/linux probably have a preferred ruby management solution anyway
- D'yer Mak'er is not "Dire Maker" - it's closer to "Jamaica"
 