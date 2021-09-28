kubectl delete -f kubernetes/deployments/auth-deployment.yaml;
kubectl delete -f kubernetes/deployments/users-deployment.yaml;
kubectl delete -f kubernetes/deployments/tasks-deployment.yaml;
kubectl delete -f kubernetes/deployments/frontend-deployment.yaml;
kubectl delete -f kubernetes/services/auth-service.yaml;
kubectl delete -f kubernetes/services/users-service.yaml;
kubectl delete -f kubernetes/services/tasks-service.yaml;
kubectl delete -f kubernetes/services/frontend-service.yaml;