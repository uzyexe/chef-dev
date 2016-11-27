Chef for DevOps Workstation Environment
=======================================

chef-dev is collecting cookbooks for DevOps workstation environments.

## QuickStart

* Clone the repo: `git clone https://github.com/uzyexe/chef-dev.git`
* Install with Chef DK: `curl -sL https://www.chef.io/chef/install.sh | sudo bash -s -- -P chefdk`
* Install with gem and cookbook: `rake init`
* Install with Packages: `sudo chef-solo -c config/solo.rb -j nodes/osx.json`

# Authors

* Shuji Yamada (<uzy.exe@gmail.com>)

## License

This project is licensed under the terms of the MIT license.
