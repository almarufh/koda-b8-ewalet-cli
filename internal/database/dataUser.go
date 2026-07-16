package database

import (
	"context"
	"fmt"
)

// USER

func FindUserByUsername(key string) (*User, error) {
	var user User
	query := `SELECT "id", "username", "email", "password", "pin" FROM "users" WHERE "username" = $1;`
	conn, res := GetSinggle(query, key)

	err := res.Scan(&user.ID, &user.Username, &user.Email, &user.Password, &user.Pin)
	defer conn.Close(context.Background())

	if err != nil {
		fmt.Println("Gagal collect Table")
		panic(err.Error())
	}
	return &user, nil
}

// BALANCE
func FindBalanceByUsername(key string) (*Balance, error) {
	var balance Balance
	query := `
		SELECT "b"."id", "b"."balance" FROM "users" "u"
		JOIN "users_balances" "ub" ON "ub"."id_user" = "u"."username"
		JOIN "balances" "b" ON "b"."id" = "ub"."id_balance"
		WHERE "username" = $1;`
	conn, res := GetSinggle(query, key)

	err := res.Scan(&balance.ID, &balance.Balance)
	defer conn.Close(context.Background())

	if err != nil {
		fmt.Println("Gagal collect Table")
		panic(err.Error())
	}
	return &balance, nil
}
