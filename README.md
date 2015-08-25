Chef for my dev environment
====

This is repo for collecting my cookbooks for my own working environments.

## Requirements (OSX)

- Xcode
    - Command Line Tool (XCode > Preferences > Downloads)
- homebrew
    - `ruby <(curl -fsSkL raw.github.com/mxcl/homebrew/go)`


## Cookbooks

- [chef-rubies](https://github.com/tcnksm/chef-rubies)


## Install Chef

```
% bin/init.sh
```

## Usage

```
% sudo chef-solo -c config/solo.rb -j nodes/ubuntu.json 
```

## Inspired by

- [Managing My Workstations With Chef](http://jtimberman.housepub.org/blog/2011/04/03/managing-my-workstations-with-chef/)
- [pivotal-sprout/sprout](https://github.com/pivotal-sprout/sprout)
- [dann/chef-macbox](https://github.com/dann/chef-macbox)

## Author

[tcnksm](https://github.com/tcnksm)
