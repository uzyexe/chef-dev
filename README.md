Chef for Dev workstation environment
====

This is repo for collecting cookbooks for Dev workstation environments.

## Install the Chef DK (Chef Development Kit)

```
% curl -sL https://www.chef.io/chef/install.sh | sudo bash -s -- -P chefdk
```

## Usage

###download repository
```
% git clone https://github.com/uzyexe/chef-dev.git

```

### Mac OS X

```
% rake init
% sudo rake
```

### Linux

```
% rake init
% rake run:linux
```
