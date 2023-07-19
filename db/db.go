package db

import (
	"database/sql"
	_ "github.com/lib/pq"
)

type Database struct {
	db *sql.DB
}

// NewDatabase Create a new database connection
func NewDatabase() (*Database, error) {
	db, err := sql.Open("postgres", "postgresql://postgres:postgres@localhost:5432/ai_pro?sslmode=disable")
	if err != nil {
		return nil, err
	}

	return &Database{db: db}, nil
}

// Close CloseDatabase connection
func (d *Database) Close() {
	d.db.Close()
}

// GetDB GetDatabase connection
func (d *Database) GetDB() *sql.DB {
	return d.db
}
