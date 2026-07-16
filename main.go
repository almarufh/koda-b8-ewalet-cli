package main

import (
	"fmt"
	"koda-b8-ewalet-cli/internal/database"
)

func main() {
	fmt.Printf("Find User by USERNAME\n\n")

	for {
		res, _ := database.FindUserById("082393468568")
		fmt.Printf("ID        : %s\n", res.ID)
		fmt.Printf("Email     : %s\n", res.Email)
		fmt.Printf("Password  : %s\n", res.Password)
		fmt.Printf("PIN       : %s\n", *res.Pin)
		break
	}

	fmt.Printf("\n\nCheck Saldo by USER ID\n")

	for {
		res, _ := database.FindBalanceByUserId("082393468568")
		fmt.Printf("ID    : %s\n", res.ID)
		fmt.Printf("Saldo : %d\n", res.Balance)
		break
	}

	fmt.Printf("\n\nCheck Saldo by ID\n")

	for {
		res, _ := database.FindBalanceById(2)
		fmt.Printf("ID    : %s\n", res.ID)
		fmt.Printf("Saldo : %d\n", res.Balance)
		break
	}

	fmt.Printf("\n\nProfile By User ID\n")

	for {
		res, _ := database.FindProfileByUserId("082393468568")
		fmt.Printf("ID        : %d\n", res.ID)
		fmt.Printf("Name      : %s %s\n", res.FirstName, res.LastName)
		fmt.Printf("Birthday  : %s\n", res.DateOfBirth)
		fmt.Printf("Adress    : %s\n", *res.Address)
		fmt.Printf("Mother    : %s\n", *res.Mother)
		break
	}

	fmt.Printf("\n\nProfile By ID\n")

	for {
		res, _ := database.FindProfileById(1)
		fmt.Printf("ID        : %d\n", res.ID)
		fmt.Printf("Name      : %s %s\n", res.FirstName, res.LastName)
		fmt.Printf("Birthday  : %s\n", res.DateOfBirth)
		fmt.Printf("Adress    : %s\n", *res.Address)
		fmt.Printf("Mother    : %s\n", *res.Mother)
		break
	}

	fmt.Printf("\n\nOTP By User ID\n")

	for {
		res, _ := database.FindOtpByUserId("082393468568")
		fmt.Printf("ID        : %d\n", res.ID)
		fmt.Printf("Code OTP  : %s\n", res.Code)
		break
	}
}
