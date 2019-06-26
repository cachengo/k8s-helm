export IMAGE_TAG=$(cat VERSION)
export DOCKER_CLI_EXPERIMENTAL=enabled

docker manifest create --amend cachengo/k8s-helm:$IMAGE_TAG cachengo/k8s-helm-x86_64:$IMAGE_TAG cachengo/k8s-helm-aarch64:$IMAGE_TAG
docker manifest push cachengo/k8s-helm:$IMAGE_TAG
