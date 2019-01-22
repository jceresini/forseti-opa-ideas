package cloudstorage.objectversioning

default is_valid = false

is_valid = true {
  input.versioning.enabled = true
}

# This example expects a label named 'cleardata-override' with a comma-separated
# value allowing for multiple policy overrides
# ex: "versioning,public-access"
is_valid = true {
  overrides[_] = "versioning"
}

enforce[key] = value {
 key != "versioning"
 input[key]=value
}

enforce[key] = value {
  key:="versioning"
  value:={"enabled":true}
}

overrides = o {
  split(input.labels["cleardata-override"], ",", o)
}
