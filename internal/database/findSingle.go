package database

import (
	"context"

	"github.com/jackc/pgx/v5"
)

func GetSingle(query string, key any) (*pgx.Conn, pgx.Row) {
	conn := Conn()
	return conn, conn.QueryRow(context.Background(), query, key)
}
