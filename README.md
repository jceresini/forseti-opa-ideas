
# Testing policies

## Run OPA in Docker
```
docker run -ti --rm \
    --name opa-tests \
    -v $(pwd)/policies:/opt/opa/policies \
    -p 8181:8181 \
    openpolicyagent/opa \
    run -s /opt/opa/policies
```

## Test 
```
source sample_data/bucket_versioning.sh

declare -a bucket_definitions=(
    "BUCKET_NO_VERSIONING"
    "BUCKET_VERSIONING_DISABLED_OVERRIDE"
    "BUCKET_VERSIONING_DISABLED_OVERRIDE_BAD"
    "BUCKET_VERSIONING_DISABLED"
    "BUCKET_VERSIONING_ENABLED"
)

for bucket in "${bucket_definitions[@]}"; do

    bucket_data=${!bucket}
    echo -n "TEST $bucket: "

    curl -H 'Content-type: application/json' \
        -d "{\"input\": $bucket_data}" \
        http://localhost:8181/v1/data/cloudstorage/objectversioning/is_valid

    echo
done
```

## Enforce
The policy may also contain an `enforce` endpoint that should return the object adjusted to fit the policy.

```
    curl -H 'Content-type: application/json' \
        -d "{\"input\": $BUCKET_NO_VERSIONING}" \
        http://localhost:8181/v1/data/cloudstorage/objectversioning/enforce
```
