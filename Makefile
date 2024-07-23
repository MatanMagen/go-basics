createdb: 
	docker exec -it my-postgres createdb --username=postgres --owner=postgres simple_bank

dropdb:
	docker exec -it my-postgres dropdb simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://root:matan@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:matan@localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

.PHONY: createdb dropdb migrateup migratedown