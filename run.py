import glob
import json
import re
import requests

opa_base_url = 'http://localhost:8181/v1'

# Determine what API an object came from
def get_api(obj):

    if 'selfLink' in obj:
        selfLink = obj['selfLink']
        pattern = r"^https:\/\/([a-z]+).googleapis.com\/([a-z]+)\/.*$"
        m = re.fullmatch(pattern, selfLink)
        if m:
            if m.group(1) != "www":
                return m.group(1)
            else:
                return m.group(2)

    return None

def sample_data():
    for file in glob.iglob("./sample_data/**/*.json", recursive=True):
        with open(file) as f:
            yield (file, json.load(f))

def opa_input(api, policy, action, obj):
    opa_url = "{}/data/cloud{}/{}/{}".format(
        opa_base_url,
        api,
        policy,
        action
    )

    data = {
        "input": obj
    }

    resp = requests.post(opa_url, data=json.dumps(data), headers={'Content-type': 'application/json'})
    return resp.json().get('result')


api_to_policies_map = {
    "storage": ["objectversioning"],
    "sql": ["acl"]
}

if __name__ == "__main__":

    for (file_name, obj) in sample_data():
        
        name = file_name.rsplit('/', 1)[1]

        print("TESTING {} ... ".format(name), end='')

        api = get_api(obj)
        policies = api_to_policies_map[api]
        for policy in policies:
            valid = opa_input(api, policy, 'is_valid', obj)
            if valid:
                print('validated')
            else:
                print('enforcement_needed')
                newobj = opa_input(api, policy, 'enforce', obj)
                print(json.dumps(newobj, indent=2))

