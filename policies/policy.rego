package forseti.storage.versioning

default allow = false

allow = true {
  input.versioning.enabled = true
}

allow = true {
  overrides[_] = "versioning"
}

overrides = o {
  split(input.labels["cleardata-override"], ",", o)
}
