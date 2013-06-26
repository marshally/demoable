# Demoable

## Overview

**Demoable** allows developers to lock down their application in a specific enviornment with the use of access codes.

### Installation

To install use Demoable, you will have to run a generator and write some files.

First, run this to generate database migration file and to migrate the database.

	rake demoable:install:migrations && rake db:migrate
	
Then create an initializer to setup Demoable with the admin account and the specific envionment you want to test on.

Create the file named demoable.rb in config/initalizers.
	
	Demoable.setup do |config|
		config.admin_user = "admin"
		config.admin_password = "password"
		#Demoable defaults to qa so you don't need to specify this
		config.demo_environment = "qa"
	end
	
Now you need to mount the rails engine in your routes.rb file.

	mount Demoable::Engine, :at => '/demoable'
	

#TODO

- Mailers for the approval code
- A JSON api to do the following
	- Login in with code from other server
	- Get all the code models from the endpoint