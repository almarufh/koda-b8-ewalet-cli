package database

import (
	"context"
	"fmt"
)

// USER

func FindUserById(key int64) (*User, error) {
	var user User
	query := `SELECT "id", "username", "email", "password", "pin" FROM "users" WHERE "id" = $1;`
	conn, res := GetSinggle(query, key)

	err := res.Scan(&user.ID, &user.Username, &user.Email, &user.Password, &user.Pin)

	defer conn.Close(context.Background())

	if err != nil {
		fmt.Println("Gagal collect Table")
	}
	return &user, nil
}
