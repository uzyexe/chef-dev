Chef for DevOps workstation environment
====

chef-dev is collecting cookbooks for DevOps workstation environments.

## Install the Chef DK (Chef Development Kit)

```
% curl -sL https://www.chef.io/chef/install.sh | sudo bash -s -- -P chefdk
```

## Usage

### Download
```
% git clone https://github.com/uzyexe/chef-dev.git
```

### Mac OS X

```
% rake init
% rake run:osx
```

### Linux

```
% rake init
% rake run:linux
```
