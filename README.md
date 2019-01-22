
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
python3 run.py
```
