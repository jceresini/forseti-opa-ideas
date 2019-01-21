package cloudstorage.objectversioning

default allow = false

allow = true {
  input.versioning.enabled = true
}

# This example expects a label named 'cleardata-override' with a comma-separated
# value allowing for multiple policy overrides
# ex: "versioning,public-access"
allow = true {
  overrides[_] = "versioning"
}

overrides = o {
  split(input.labels["cleardata-override"], ",", o)
}
