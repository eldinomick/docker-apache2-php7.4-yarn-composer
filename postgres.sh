docker run --name postgres -p 5432 \
--restart always \
-e POSTGRES_PASSWORD=password \
-v /home/docker/postgres:/var/lib/postgresql/data \
-d postgres
