read -d '' BUCKET_NO_VERSIONING <<EOF
{
    "etag": "CAE=",
    "iamConfiguration": {
        "bucketPolicyOnly": {
            "enabled": false
        }
    },
    "id": "opa-test-bucket",
    "kind": "storage#bucket",
    "location": "US",
    "metageneration": "1",
    "name": "opa-test-bucket",
    "projectNumber": "179590471157",
    "selfLink": "https://www.googleapis.com/storage/v1/b/opa-test-bucket",
    "storageClass": "MULTI_REGIONAL",
    "timeCreated": "2019-01-18T18:25:58.390Z",
    "updated": "2019-01-18T18:25:58.390Z"
}
EOF

read -d '' BUCKET_VERSIONING_DISABLED_OVERRIDE <<EOF
{
    "etag": "CAQ=",
    "iamConfiguration": {
        "bucketPolicyOnly": {
            "enabled": false
        }
    },
    "id": "opa-test-bucket",
    "kind": "storage#bucket",
    "labels": {
        "cleardata-override": "versioning,other"
    },
    "location": "US",
    "metageneration": "4",
    "name": "opa-test-bucket",
    "projectNumber": "179590471157",
    "selfLink": "https://www.googleapis.com/storage/v1/b/opa-test-bucket",
    "storageClass": "MULTI_REGIONAL",
    "timeCreated": "2019-01-18T18:25:58.390Z",
    "updated": "2019-01-18T18:43:49.962Z",
    "versioning": {
        "enabled": false
    }
}
EOF

read -d '' BUCKET_VERSIONING_DISABLED_OVERRIDE_BAD <<EOF
{
    "etag": "CAQ=",
    "iamConfiguration": {
        "bucketPolicyOnly": {
            "enabled": false
        }
    },
    "id": "opa-test-bucket",
    "kind": "storage#bucket",
    "labels": {
        "cleardata-override": "notversioning,other"
    },
    "location": "US",
    "metageneration": "4",
    "name": "opa-test-bucket",
    "projectNumber": "179590471157",
    "selfLink": "https://www.googleapis.com/storage/v1/b/opa-test-bucket",
    "storageClass": "MULTI_REGIONAL",
    "timeCreated": "2019-01-18T18:25:58.390Z",
    "updated": "2019-01-18T18:43:49.962Z",
    "versioning": {
        "enabled": false
    }
}
EOF


read -d '' BUCKET_VERSIONING_DISABLED <<EOF
{
    "etag": "CAM=",
    "iamConfiguration": {
        "bucketPolicyOnly": {
            "enabled": false
        }
    },
    "id": "opa-test-bucket",
    "kind": "storage#bucket",
    "location": "US",
    "metageneration": "3",
    "name": "opa-test-bucket",
    "projectNumber": "179590471157",
    "selfLink": "https://www.googleapis.com/storage/v1/b/opa-test-bucket",
    "storageClass": "MULTI_REGIONAL",
    "timeCreated": "2019-01-18T18:25:58.390Z",
    "updated": "2019-01-18T18:32:29.230Z",
    "versioning": {
        "enabled": false
    }
}
EOF

read -d '' BUCKET_VERSIONING_ENABLED <<EOF
{
    "etag": "CAI=",
    "iamConfiguration": {
        "bucketPolicyOnly": {
            "enabled": false
        }
    },
    "id": "opa-test-bucket",
    "kind": "storage#bucket",
    "location": "US",
    "metageneration": "2",
    "name": "opa-test-bucket",
    "projectNumber": "179590471157",
    "selfLink": "https://www.googleapis.com/storage/v1/b/opa-test-bucket",
    "storageClass": "MULTI_REGIONAL",
    "timeCreated": "2019-01-18T18:25:58.390Z",
    "updated": "2019-01-18T18:30:26.677Z",
    "versioning": {
        "enabled": true
    }
}
EOF

export BUCKET_NO_VERSIONING
export BUCKET_VERSIONING_DISABLED_OVERRIDE
export BUCKET_VERSIONING_DISABLED_OVERRIDE_BAD
export BUCKET_VERSIONING_DISABLED
export BUCKET_VERSIONING_ENABLED
