## 1. Since we do not have terraform we would use localstack

//for x86_64
curl --output localstack-cli-2026.5.0-linux-amd64-onefile.tar.gz \
    --location https://github.com/localstack/localstack-cli/releases/download/v2026.5.0/localstack-cli-2026.5.0-linux-amd64-onefile.tar.gz

sudo tar xvzf localstack-cli-2026.5.0-linux-*-onefile.tar.gz -C /usr/local/bin

For other visit the documentation site.
[Loaclstack](https://docs.localstack.cloud/aws/getting-started/installation/)


## 2. Please make an account on localstack and have docker inside your vm

use key accociated with localstack 
```
localstack start -d
```

## <h2>For k3s:
helm repo add localstack https://helm.localstack.cloud

helm install my-localstack localstack/localstack --version 0.7.0

helm install localstack localstack/localstack -f  -n localstack

helm pull localstack/localstack --version 0.7.0 && tar -xvf localstack-0.7.0.tgz