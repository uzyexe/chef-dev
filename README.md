Chef for my dev environment
====

This is repo for collecting my cookbooks for my own working environments.

## Requirements (OSX)

- Xcode
    - Command Line Tool (XCode > Preferences > Downloads)
- homebrew
    - `ruby <(curl -fsSkL raw.github.com/mxcl/homebrew/go)`


## Install Chef

```
% bin/init.sh
```

## Usage

```
% sudo chef-solo -c config/solo.rb -j nodes/ubuntu.json 
```
