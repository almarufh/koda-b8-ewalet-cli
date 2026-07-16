package database

import (
	"context"
	"os"

	"github.com/jackc/pgx/v5"
	"github.com/joho/godotenv"
)

func Conn() (*pgx.Conn, error) {
	err := godotenv.Load()

	if err != nil {
		panic(err.Error())
	}

	res := os.Getenv("DATABASE_URL")

	conn, err := pgx.Connect(context.Background(), res)
	if err != nil {
		panic(err.Error())
	}
	return conn, err
}
