package database

import (
	"context"
)

func PostSinggle(query string, search int, data string) bool {
	conn := Conn()
	defer conn.Close(context.Background())
	_, err := conn.Query(context.Background(), query, search, data)

	if err != nil {
		return false
	} else {
		return true
	}
}
