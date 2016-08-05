[![Poor Man's MAMP Logo](https://threenine.co.uk/wp-content/uploads/2016/08/poormansmamp.png)](https://threenine.co.uk/setting-php7-development-mac-osx/)

# POMAMA Administration Portal

Simple Homepage to manage the Poor Man's Mamp.

## Edit Portal Links

If you would like to edit the links that are displayed  in the header to suit  your environment i.e. Link to your GitHub repository and project management portal.  All you need to do is edit the config file in **home/config/header.php**

```php
		    $topnav = array(
			array( 'name' => 'Home', 'url' => 'http://localhost' , 'target' => '_self'),
			array( 'name' => 'Github', 'url' => 'http://github.com/threenine' , 'target' => '_blank'),
			array( 'name' => 'Portal', 'url' => 'http://internal.threenine.co.uk/project/', 'target' => '_blank'),
			array( 'name' => 'phpmyadmin', 'url' => 'http://localhost/phpmyadmin', 'target' => '_blank')
		);

```