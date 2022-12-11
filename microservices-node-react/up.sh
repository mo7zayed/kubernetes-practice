kubectl_apply () {
    kubectl apply -f kubernetes/deployments/auth-deployment.yaml;
    kubectl apply -f kubernetes/deployments/users-deployment.yaml;
    kubectl apply -f kubernetes/deployments/tasks-deployment.yaml;
    kubectl apply -f kubernetes/deployments/frontend-deployment.yaml;
    kubectl apply -f kubernetes/services/auth-service.yaml;
    kubectl apply -f kubernetes/services/users-service.yaml;
    kubectl apply -f kubernetes/services/tasks-service.yaml;
    kubectl apply -f kubernetes/services/frontend-service.yaml;
}

build () {
    cd ./tasks-api && sh ./build.sh && cd ..;
    cd ./users-api && sh ./build.sh && cd ..;
    cd ./auth-api && sh ./build.sh && cd ..;
    cd ./frontend && sh ./build.sh && cd ..;
}

echo "Rebuilding images \n";
build;

# kubectl_apply;
if [ "$1" != "-u" ]; then
    kubectl_apply;
else
    kubectl_apply;

    kubectl rollout restart deployment/auth-api;
    kubectl rollout restart deployment/users-api;
    kubectl rollout restart deployment/tasks-api;
    kubectl rollout restart deployment/frontend;
fi