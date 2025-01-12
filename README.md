# RISKEN kubernetes sample

This is kubernetes manifest sample for RISKEN system.

## RISKEN

`RISKEN` is the monitoring tool for your cloud, web-site, source-code...

For more information, please check [RISKEN Documentation](https://docs.security-hub.jp/).

## Architecture

The detailed flow can be found [here](https://docs.security-hub.jp/admin/infra_architecture/)

![Architecture](https://user-images.githubusercontent.com/25426601/139044505-308e49ed-9fc5-4656-bd4e-59db7f65b61f.png "Architecture")

## Run

### Required

- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- [kubectl](https://kubernetes.io/ja/docs/tasks/tools/install-kubectl/)
- [kustomize](https://kubectl.docs.kubernetes.io/installation/kustomize/)

### On Docker Descktop (MAC)

The detailed flow can be found [here](https://docs.security-hub.jp/admin/infra_local/)

1. Run kubernetes cluster with `docker-desktop`
2. Deploy RISKEN application
```shell
$ make local-apply
```

### On EKS

The detailed flow can be found [here](http://docs.security-hub.jp/admin/infra_aws/)

1. Create EKS cluster & Node group
2. Create ALB & Set OIDC Authentication
3. Deploy RISKEN application
    - Logged in your cluster
    ```shell
    $ aws eks --region <region_code> update-kubeconfig --name <cluster_name>
    ```
    - Copy template manifest & fix your cluster name
    ```shell
    $ cp -r overlays/eks-template overlays/eks
    $ sed -i "" -e 's/your-cluster/<cluster_name>/g' overlays/eks/*.yaml
    ```
    - Deploy 
    ```shell
    $ kustomize build overlays/eks | kubectl apply -f -
    ```
