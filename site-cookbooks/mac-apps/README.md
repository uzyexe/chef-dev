mac-apps Cookbook
=================
Install mac-apps 

Requirements
------------
Third party [dmg cookcook](https://github.com/opscode-cookbooks/dmg)

Usage
-----
#### mac-apps::default
Include `mac-apps::APP_NAME` in your roles's `run_list`:

e.g.

```json
{
  "run_list": [
    "recipe[mac-apps::chrome]"
  ]
}
```

