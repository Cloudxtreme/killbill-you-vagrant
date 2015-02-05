# killbill-you-vagrant

vagrant box for killbill.io spike/dev work

## install

You need on your host machine:

- Ruby2.1.5
- Ruby2.1.5 dev kit
- The ruby gem `librarian-chef`
- VirtualBox
- Vagrant

On windows this is a pain, so you can install VirtualBox by hand and then run `windows-install.sh` from within a git bash prompt. Some parts may fail as the installers are not great; try closing any command prompts and running it again.

After the pre-reqs are installed, navigate to the repo directory and:

```sh
vagrant up
```

This will download, start, and provision the vagrant box for use.

Once this is all done (first run takes a while), you should be able to access `http://localhost:8080/api.html`

You should be using git on your host machine, and ruby on the vagrant vm.

```sh
vagrant ssh
```

## working on a plugin

Clone your plugins into `plugins/`. These should not be checked in. For every plugin's .sql file, execute:

```sh
cat /path/to/sql/file.sql | mysql -h 127.0.0.1 -ukillbill -pkillbill killbill
```

This will setup any tables needed.

The development workflow is:

- Check out plugin
- Work on plugin
- Test plugin by deploying it to the `bundles/` folder (instructions in plugin readme)
- Push plugin
- Repeat

## credentials

MySQL (can be connected to from host machine): user `killbill`, password `killbill`, database `killbill`

Tomcat admin: user `manager`, password `manager`

## Direct Connect

Direct Connect is a... thing. It's one of our gateways for charging money. It has a 'Card Safe' feature that our clients like. Basically, Card Safe allows you to store a credit card, unassociated with a specific merchant. You can then charge them to any other merchant (Vendor in Direct Connect words) without having to reprompt. We make use of this in a few places.

The flow for CardSafe transactions:

1. Add a Customer to a vendor, making note of the CustomerKey - ManageCustomer
2. Add a card to a customer through CardSafe, making note of the returned CcInfoKey/CardSafeKey - StoreCard
3. Make a sale transaction, passing in a vendor, and make note of the returned PNRef - ProcessCreditCard (recurring)

It looks like you cannot do only an auth when charging a CardSafe card. To perform a refund/void/repeat, use ProcessCreditCard, under CardSafe.

To get started on the direct connect plugin, clone [NGPVAN/killbill-direct-connect-plugin](https://github.com/NGPVAN/killbill-direct-connect-plugin) into the plugins folder:

```sh
git clone https://github.com/NGPVAN/killbill-direct-connect-plugin plugins/killbill-direct-connect-plugin
```

- [Error Codes](https://gateway.1directconnect.com/paygate/nethelp/default.htm?turl=Documents%2Fresultresponsefielddefinition.htm)

## fun facts

- Changes to the bundles folder should never be checked in - it's the plugin deployment folder that the server loads from
- This isn't setup for development of plugins yet, as we need to figure out the best way to do that while having them loaded from git repos
- Oh SQL, MY SQL! Our fearful trip is done. You can access the MySQL DB from the host machine by connecting on localhost:3306
- It would be nice to make the host install scripts a bit nicer but chocolatey is being a pain and people with a mac/linux probably have a preferred ruby management solution anyway
- D'yer Mak'er is not "Dire Maker" - it's closer to "Jamaica"
 
