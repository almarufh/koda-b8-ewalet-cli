package database

import (
	"context"
	"fmt"
)

// USER

func FindUserById(key string) (*User, error) {
	var user User
	query := `SELECT "id", "email", "password", "pin", "created_at", "updated_at"  FROM "users" WHERE "id" = $1;`
	conn, res := GetSingle(query, key)

	err := res.Scan(&user.ID, &user.Email, &user.Password, &user.Pin, &user.CreatedAt, &user.UpdatedAt)
	defer conn.Close(context.Background())

	if err != nil {
		fmt.Println("Gagal collect Table")
		panic(err.Error())
	}
	return &user, nil
}

// BALANCE
func FindBalanceByUserId(key string) (*Balance, error) {
	var balance Balance
	query := `
		SELECT "b"."id", "b"."balance" FROM "users" "u"
		JOIN "users_balances" "ub" ON "ub"."id_user" = "u"."id"
		JOIN "balances" "b" ON "b"."id" = "ub"."id_balance"
		WHERE "u"."id" = $1;`
	conn, res := GetSingle(query, key)

	err := res.Scan(&balance.ID, &balance.Balance)
	defer conn.Close(context.Background())

	if err != nil {
		fmt.Println("Gagal collect Table")
		panic(err.Error())
	}
	return &balance, nil
}

func FindBalanceById(key int) (*Balance, error) {
	var balance Balance
	query := `
		SELECT "b"."id", "b"."balance" FROM "balances" "b"
		WHERE "id" = $1;`
	conn, res := GetSingle(query, key)

	err := res.Scan(&balance.ID, &balance.Balance)
	defer conn.Close(context.Background())

	if err != nil {
		fmt.Println("Gagal collect Table")
		panic(err.Error())
	}
	return &balance, nil
}

// Profile

func FindProfileByUserId(key string) (*Profile, error) {
	var profile Profile
	query := `
		SELECT "p"."id", "p"."first_name", "p"."last_name", "p"."date_of_birth", "p"."address", "p"."mother", "p"."updated_at" FROM "users" "u"
		JOIN "users_profiles" "up" ON "up"."id_user" = "u"."id"
		JOIN "profiles" "p" ON "p"."id" = "up"."id_profile"
		WHERE "u"."id" = $1;`
	conn, res := GetSingle(query, key)

	err := res.Scan(&profile.ID, &profile.FirstName, &profile.LastName, &profile.DateOfBirth, &profile.Address, &profile.Mother, &profile.UpdatedAt)
	defer conn.Close(context.Background())

	if err != nil {
		fmt.Println("Gagal collect Table")
		panic(err.Error())
	}
	return &profile, nil
}

func FindProfileById(key int) (*Profile, error) {
	var profile Profile
	query := `
		SELECT "p"."id", "p"."first_name", "p"."last_name", "p"."date_of_birth", "p"."address", "p"."mother", "p"."updated_at"
		FROM "profiles" "p"
		WHERE "id" = $1;`
	conn, res := GetSingle(query, key)

	err := res.Scan(&profile.ID, &profile.FirstName, &profile.LastName, &profile.DateOfBirth, &profile.Address, &profile.Mother, &profile.UpdatedAt)
	defer conn.Close(context.Background())

	if err != nil {
		fmt.Println("Gagal collect Table")
		panic(err.Error())
	}
	return &profile, nil
}
