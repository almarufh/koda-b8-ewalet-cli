package database

import (
	"context"

	"github.com/jackc/pgx/v5"
)

func GetSinggle(query string, key any) (*pgx.Conn, pgx.Row) {
	conn := Conn()
	return conn, conn.QueryRow(context.Background(), query, key)
}
