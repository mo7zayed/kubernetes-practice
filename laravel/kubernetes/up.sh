kubectl_apply () {
    kubectl apply -f kubernetes/deployments/http.yml;
    kubectl apply -f kubernetes/services/http.yml;
}

build () {
    sh ./kubernetes/docker/build.sh;
}

echo "Rebuilding images \n";
build;

# kubectl_apply;
if [ "$1" != "-u" ]; then
    kubectl_apply;
else
    kubectl_apply;

    kubectl rollout restart deployment/http;
fi
