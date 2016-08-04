[![Poor Man's MAMP Logo](https://threenine.co.uk/wp-content/uploads/2016/08/poormansmamp.png)](https://threenine.co.uk/setting-php7-development-mac-osx/)


A quick easy way to create PHP development environment on MAC. 

This is supplemented by our post [Setting up PHP7 Development Evironment on MAC](https://threenine.co.uk/setting-php7-development-mac-osx/)



## Prerequisites

	### PHP

		This set up is designed to work with PHP, Installing PHP via HomeBrew

			$ brew tap homebrew/dupes
			$ brew tap homebrew/versions
			$ brew tap homebrew/homebrew-php
			$ brew install php70

	### dnsmasq

		Dnsmasq provides network infrastructure for small networks.  It used within POMAM to create friendly URLs for project folders. i.e. http://threenine.dev

		dnsmasq is installed via HomeBrew

		$ brew install dnsmasq
        $ cd $(brew --prefix)
        $ mkdir etc
		$ echo 'address=/.dev/127.0.0.1' > etc/dnsmasq.conf
		$ sudo cp -v $(brew --prefix dnsmasq)/homebrew.mxcl.dnsmasq.plist /Library/LaunchDaemons
		$ sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
		$ sudo mkdir /etc/resolver
		$ sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/dev'

# Set Up

	Simply copy 3 files to your home directory :  create.sh, apache2 , home

	Open a terminal window 

		$ bash create.sh


