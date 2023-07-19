postgresinit:
	docker run --name postgres15 -p 5435:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -d postgres:15-alpine

postgres:
	docker exec -it postgres15 psql

createdb:
	docker exec -it postgres15 createdb --username=postgres --owner=postgres ai-project

dropdb:
	docker exec -it postgres15 dropdb ai-project

migrateup:
	migrate -path db/migration -database "postgresql://postgres:postgres@localhost:5435/ai-project?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://postgres:postgres@localhost:5435/ai-project?sslmode=disable" -verbose down

.PHONY: postgresinit postgres createdb dropdb migrateup migratedown