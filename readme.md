## Provisioning VPCs with public and private subnets

### Setup

#### Set these variables in your `.envrc` file

```
TF_VAR_region="us-east-1"
AWS_ACCESS_KEY_ID=test
AWS_SECRET_ACCESS_KEY=test2
ACTION=deploy
```

---

### Building the docker image

`docker build -f ./provisioner/Dockerfile -t vpc-provisioner .`

### Running the provisioner for Postgres on AWS

`docker run --env-file .envrc vpc-provisioner`
