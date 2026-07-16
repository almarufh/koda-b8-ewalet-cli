package database

import (
	"context"

	"github.com/jackc/pgx/v5"
)

func GetSinggle(query string, username string) pgx.Rows {
	conn := Conn()
	defer conn.Close(context.Background())
	rows, err := conn.Query(context.Background(), query, username)

	if err != nil {
		panic(err.Error())
	}
	return rows
}
