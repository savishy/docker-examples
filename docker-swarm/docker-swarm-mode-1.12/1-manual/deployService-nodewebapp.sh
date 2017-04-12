eval $(docker-machine env manager0)
docker network create --driver overlay webnet
docker service create --name webapp \
 --network webnet \
 --replicas 3 \
 --publish 80:8000 \
 lherrera/webapp:1.0
docker service create --name redisdb \
--network webnet \
--replicas 1 redis:alpine
