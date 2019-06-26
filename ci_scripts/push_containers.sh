export IMAGE_TAG=$(cat VERSION)
export AARCH=`uname -m`

docker build -t cachengo/k8s-helm-$AARCH:$IMAGE_TAG .
docker push cachengo/k8s-helm-$AARCH:$IMAGE_TAG
