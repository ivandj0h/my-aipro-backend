# AI Project Backend

## Description
`AI Project Backend` is a backend for the AI Project. It is a REST API that allows the user to interact with the AI Project database.

## Installation
1. Clone the repository
2. Install the dependencies
3. Run the server
4. Enjoy!

## Usage

### Run Postgres Image
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
```cgo
go mod tidy
```
