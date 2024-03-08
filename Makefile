postgres:
		docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:12-alpine

createdb:
		docker exec -it postgres12 createdb --username=root --owner=root pay_swift

dropdb:	
		docker exec -it postgres12 dropdb pay_swift

migrateup:	
		migrate -path db/migration/ -database "postgresql://root:secret@localhost:5432/pay_swift?sslmode=disable" -verbose up

migratedown:
		migrate -path db/migration/ -database "postgresql://root:secret@localhost:5432/pay_swift?sslmode=disable" -verbose down

sqlc:
		sqlc generate

.PHONY: postgres createdb dropdb migrateup migratedown sqlc