[![Poor Man's MAMP Logo](https://threenine.co.uk/wp-content/uploads/2016/08/poormansmamp.png)](https://threenine.co.uk/setting-php7-development-mac-osx/)


A quick easy way to create PHP development environment on MAC. 

This is supplemented by our post [Setting up PHP7 Development Evironment on MAC](https://threenine.co.uk/setting-php7-development-mac-osx/)



## Pre-requisites

### PHP

This set up is designed to work with PHP, Installing PHP via HomeBrew
---
			$ brew tap homebrew/dupes
			$ brew tap homebrew/versions
			$ brew tap homebrew/homebrew-php
			$ brew install php70
---
### dnsmasq

Dnsmasq provides network infrastructure for small networks.  It used within POMAM to create friendly URLs for project folders. i.e. http://threenine.dev

dnsmasq is installed via HomeBrew
--
		$ brew install dnsmasq
        $ cd $(brew --prefix)
        $ mkdir etc
		$ echo 'address=/.dev/127.0.0.1' > etc/dnsmasq.conf
		$ sudo cp -v $(brew --prefix dnsmasq)/homebrew.mxcl.dnsmasq.plist /Library/LaunchDaemons
		$ sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
		$ sudo mkdir /etc/resolver
		$ sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/dev'
---
# Set Up

Simply copy 3 files to your home directory :  create.sh, apache2 , home

Open a terminal window and execute
---
		$ bash create.sh
---

The shell will prompt for a directory name and your username (name of your home folder).

The directory name can be anything you like, we recommend calling Sites.

## Install PHPmyAdmin

Installation of phpmyadmin is now included in the create.sh.  This is just left here for reference should it be required
---
	$ curl -O https://files.phpmyadmin.net/phpMyAdmin/4.6.3/phpMyAdmin-4.6.3-all-languages.zip
	$ unzip phpMyAdmin-4.6.3-all-languages.zip
	$ mv phpMyAdmin-4.6.3-all-languages phpmyadmin
	$ mv phpmyadmin ~/Sites/
	$ rm phpMyAdmin-4.6.3-all-languages.zip
---

Once script has finished restart apache
---
	$ sudo apachectl -k restart
---

Navigate to http://localhost , your new Development Home Page will be viewed.

# Using

To create a new project simply navigate to your chosen directory i.e. Sites, and open the projects directory , create a new folder with the name of your new project i.e. fancynewproject

Add your new php files ensuring you add a new index.php 

You can then just navigate in your browser to http://fancynewproject.dev  your new site will be displayed.


