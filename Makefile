postgresinit:
	docker run --name postgres15 -p 5433:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -d postgres:15-alpine

postgres:
	docker exec -it postgres15 psql

createdb:
	docker exec -it postgres15 createdb --username=postgres --owner=postgres ai_pro

dropdb:
	docker exec -it postgres15 dropdb ai_pro

.PHONY: postgresinit postgres createdb dropdb