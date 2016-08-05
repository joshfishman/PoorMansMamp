[![Poor Man's MAMP Logo](https://threenine.co.uk/wp-content/uploads/2016/08/poormansmamp.png)](https://threenine.co.uk/setting-php7-development-mac-osx/)


A quick easy way to create PHP development environment on MAC. 

The inspiration to create this was a direct result from my post [Setting up PHP7 Development Evironment on MAC](https://threenine.co.uk/setting-php7-development-mac-osx/) in which I was detailing the steps to setting up a PHP development environment on my mac.  There was so much twiddling with configuration files etc.  I just wanted an easier way, and being a software engineer I had the power to make it easy, so I did!



## Pre-requisites

### PHP

Currnently POMAMA is configured to run only with PHP7 due in part that is what I primarily develop in at the moment. 

Typically I install PHP on my mac using HomeBrew. If you don't currently use HomeBrew . Why?  [Install HomeBrew on Mac](http://garywoodfine.com/install-homebrew-mac/)

To install PHP via HomeBrew is quick and easy
---bash
			$ brew tap homebrew/dupes
			$ brew tap homebrew/versions
			$ brew tap homebrew/homebrew-php
			$ brew install php70
---
### dnsmasq

**dnsmasq** provides network infrastructure for small networks.  It used within POMAMA to create friendly URLs for project folders. i.e. http://threenine.dev

Install dnsmasq via HomeBrew and configure it

--bash 
		$ brew install dnsmasq
        $ cd $(brew --prefix)
        $ mkdir etc
		$ echo 'address=/.dev/127.0.0.1' > etc/dnsmasq.conf
		$ sudo cp -v $(brew --prefix dnsmasq)/homebrew.mxcl.dnsmasq.plist /Library/LaunchDaemons
		$ sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
		$ sudo mkdir /etc/resolver
		$ sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/dev'
---

### MYSQL

Currently POMAMA only support mySQL 

---bash
	$ brew install mysql

	# Start the mysql server
	$ brew services start mysql

	# Secure your mySQL Installation
	$ mysql_secure_installation
---

# Set Up

Simply copy 3 files to your home a.k.a root directory :  
..*create.sh
..*apache2
..*home

Open a terminal window and execute
---bash
		$ bash create.sh
---

The shell will prompt for a **Directory name:** 

**Directory Name**   Can be anything you like, however we recommend calling **Sites**


You may be prompted to enter your Password for sudo access.  This is to copy the ammended apache2 configuration files over.

Once create has completed simply navigate to http://localhost , your new Development Home Page will be visible in all it's glory. You are now ready to start creating new PHP projects

# To create new PHP projects

To create a new project simply navigate to your chosen directory i.e. Sites, and open the projects directory , create a new folder with the name of your new project i.e. fancynewproject

Add your new php files ensuring you add a new index.php 

You can then just navigate in your browser to http://fancynewproject.dev  your new site will be displayed.

# Contributions

If you have a few ideas for the product and would like to contribute just let us know 

If this project has helped you and you would like to share the love and buy us coffee you can [Donate via PayPal](https://www.paypal.me/geekiam) or buy something from our [Amazon Wish List](https://www.amazon.co.uk/registry/wishlist/3VBBD36KEPLO1?tag=threeninecons-21)




