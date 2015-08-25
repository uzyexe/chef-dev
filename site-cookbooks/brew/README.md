brew Cookbook
=============
Install packages by `homebrew`

Requirements
------------
Third party [homebrew cookcook](https://github.com/opscode-cookbooks/homebrew).

Usage
-----

#### brew::default
Just include `brew::default` or `brew` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[homebrew]",
    "recipe[brew::defalut]"
  ]
}
```
