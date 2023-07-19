package main

import (
	"ai_project/db"
	"log"
)

func main() {
	_, err := db.NewDatabase()
	if err != nil {
		log.Fatalf("Couldnot connect to database: %s", err)
	}
}
