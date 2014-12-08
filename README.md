# killbill-you-vagrant

vagrant box for killbill.io spike/dev work

## install

You need:

- Ruby2.1.5
- Ruby2.1.5 dev kit
- The ruby gem `librarian-chef`
- VirtualBox
- Vagrant

On windows this is a pain, so you can install VirtualBox by hand and then run `windows-install.sh` from within a git bash prompt. Some parts may fail; try closing any command prompts and running it again. If it fails again then skip `librarian-chef update` and just do `vagrant up`. 

After the pre-reqs are installed, navigate to the repo directory and:

```sh
librarian-chef update
vagrant up
```

This will download, start, and provision the vagrant box for use.

Once this is all done (first run takes a while), you should be able to access `http://localhost:8080/api.html`

## credentials

MYSQL: user `killbill`, password `killbill`, database `killbill`

Tomcat admin: user `manager`, password `manager`
