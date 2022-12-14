docker build -t mo7zayed/larakube-http -f kubernetes/docker/Dockerfile .;
docker build -t mo7zayed/larakube-horizon -f kubernetes/docker/Dockerfile.horizon .;

docker push mo7zayed/larakube-http;
docker push mo7zayed/larakube-horizon;
