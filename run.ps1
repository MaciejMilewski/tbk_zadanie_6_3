docker image build -t express-node expressJs
docker image build -t flask-node flask

docker network create test-net
docker volume create pg-data

docker container run -d --name postgres --net test_network -p 5432:5432 `
--mount type=bind,source="$(Get-Location)"/database,target=/docker-entrypoint-initdb.d `
--mount source=pg-data,target=/var/lib/postgresql/data `
-e POSTGRES_USER=dbuser -e POSTGRES_PASSWORD=secretpassword -e POSTGRES_DB=sample-db `
--label traefik.enable=true --label traefik.port=5432 --label traefik.priority=5 `
--label traefik.http.routers.postgres.rule="Host(\`"postgres\`")" `
postgres:11.5-alpine

docker container run --rm -d --name server2 --net test_network -p 3000:3000 --label traefik.enable=true --label traefik.port=3000 --label traefik.priority=10 `
--label traefik.http.routers.server2.rule="Host(\`"0.0.0.0\`") && PathPrefix(\`"/cars/add\`")" express-node

docker container run --rm -d --name server1 --net test_network -p 5000:5000 --label traefik.enable=true --label traefik.port=5000 --label traefik.priority=7 `
--label traefik.http.routers.server1.rule="Host(\`"127.0.0.1\`") && PathPrefix(\`"/cars\`")" flask-node

docker run -d --name traefik -p 8080:8080 -p 80:80 -v /var/run/docker.sock:/var/run/docker.sock traefik:v2.0 --api.insecure=true --providers.docker
