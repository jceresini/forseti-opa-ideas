package cloudsql.acl

default is_valid=true

is_valid = false {
  input.settings.ipConfiguration.authorizedNetworks[_].value == "0.0.0.0/0"
}

enforce[key] = value {
 key != "settings"
 input[key]=value
}

enforce[key] = value {
 key := "settings"
 value := _settings
}

_settings[key]=value{
  key != "ipConfiguration"
  input.settings[key]=value
}

_settings[key]=value{
  key := "ipConfiguration"
  value := _ipConfiguration
}

_ipConfiguration[key]=value{
  key != "authorizedNetworks"
  input.settings.ipConfiguration[key]=value
}

_ipConfiguration[key]=value{
  key := "authorizedNetworks"
  value := valid_authorized_networks
}

valid_authorized_networks = [net | net := input.settings.ipConfiguration.authorizedNetworks[_]
  net.value != "0.0.0.0/0"
]
