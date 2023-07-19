# AI Project Backend

`Attention! This project is still in development.`

## Description
`AI Project Backend` is a backend for the AI Project. The application should allow users to add, edit, view and delete AI projects, and provide visual
reports of the project's status, progress, and other key performance indicators (KPIs).

## Installation
1. Clone the repository
2. Install the dependencies
3. Pull the postgres image from docker hub
4. Run the postgres image ( using Makefile )
5. Run the server
6. Enjoy!

## Usage

### Run Postgres Image (PostgresQL 15 - Docker Image)
You can run the Postgres image with the following command:
```makefile
make postgresinit
```  

The setup for `postgresinit` is in the `Makefile`:
```makefile
postgresinit:
    docker run --name postgres15 -p 5433:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -d postgres:15-alpine
```  

### Create Database on Container  
If you want to create a database on the container, you can run the following command:
```bash
exec -it postgres15 createdb --username=postgres --owner=postgres ai-project
```  
to confirm that you're already in the container, you can run the following command:
```bash
exec -it postgres15 psql --username=postgres ai-project
```  
it would be showing the following output:
```bash
psql (15.0 (Debian 15.0-1.pgdg100+1))
Type "help" for help.

ai-project=# 
```  

### Steps to Create New backend  
Here are the steps to create a new backend:
```cgo
go mod init github.com/ai-project
```  
For handling connection to postgres database, you need to using somenthing like this:  
`_ "github.com/lib/pq"` which is imported in `db.go` file. (in my personal case only, maybe it would be different in your case)  

if you face any error, the easy way is to running the following command:
```cgo
go mod tidy
```  
and the error will be gone.

#### Create Table
To create a table, there are many ways to do it.
in this case, I'm using `golang-migrate` to create a table, because for me it most efficient way to create a table.  

for the installation, you can refer to this link: [golang-migrate](https://github.com/golang-migrate/migrate/tree/master/cmd/migrate)  
in my case, i using `MacOS` so i'm using `brew` to install it:
```bash
    brew install golang-migrate
```  

#### Create Migration
To create a migration, you can run the following command:
```bash
migrate create -ext sql -dir db/migrations -seq create_users_table
```  
it will create a file in `db/migrations` folder with the name `000001_create_users_table.up.sql`
then you can add sql query to create a table in that file.  
```sql
CREATE TABLE "users" (
    "id" bigserial primary key NOT NULL,
    "username" varchar NOT NULL,
    "email" varchar NOT NULL,
    "password" varchar NOT NULL
);
```  
there is another migration file with the name `000001_create_users_table.down.sql`  
it is used to drop the table.  
```sql
    DROP TABLE IF EXISTS users;
```  

#### Run Migration  
To run the migration, you can run the following command:
```bash
    migrate -path db/migrations -database "postgresql://postgres:postgres@localhost:5433/ai-project?sslmode=disable" --verbose up
```  
it will create a table in the database.

#### Create The Repository
To create the repository, you can run the following command:
```bash
    mkdir -p internal/user/
    cd internal/user/
    touch user_repository.go
```  
Then you can create the :  
- Service
- Handler  
etc...`You can see the example in this repository.`  

## Screenshots

#### Workflow Screenshots  
![Workflow Screenshots](./assets/images/workflow.png)

#### IDE Screenshots  
![IDE Screenshots](./assets/images/code.png)  

#### SignUp Screenshots  
![Register Screenshots](./assets/images/signup.png)  

#### Login Screenshots  
![Login Screenshots](./assets/images/login.png)  

#### Logout Screenshots  
![Logout Screenshots](./assets/images/logout.png)  

## License  
[MIT](https://choosealicense.com/licenses/mit/)  

## Author  
[ivandjoh](https://linkedin.com/in/ivandjoh)
