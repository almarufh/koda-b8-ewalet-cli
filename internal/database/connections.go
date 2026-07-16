package database

import (
	"context"
	"fmt"
	"os"

	"github.com/jackc/pgx/v5"
	"github.com/joho/godotenv"
)

func Conn() (*pgx.Conn, error) {
	err := godotenv.Load()

	if err != nil {
		fmt.Println("Gagal memuat file .env")
	}

	res := os.Getenv("DATABASE_URL")

	conn, err := pgx.Connect(context.Background(), res)
	return conn, err
}
