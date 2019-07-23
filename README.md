## Whatap-infra BOSH RELEASE

### Create / upload bosh release
```bash

$ bosh create-release --tarball=../whatap-infra-release.tgz --version=1.2.2 --force

$ bosh upload-release whatap-infra-release.tgz

```

### Create runtime-config yaml

```yaml

releases:
- name: whatap-infra
  version: 1.2.2

addons:
- name: whatap-infra
  jobs:
  - name: whatap-infra
    release: whatap-infra
    properties:
      license: x20ogfrumc5np-xv3bflu0483nh-x6tf61lhsja21q
      server_host: 10.180.6.22/10.180.6.24/10.180.6.35
    include:
      stemcell:
      - os: ubuntu-trusty
      - os: ubuntu-xenial

```


### Update runtime-config for whatap-infra 
```bash

$ bosh update-runtime-config --name whatap-infra whatap-infra-runtime-config.yml

```

And then run "Apply Changes" in Ops Manager




