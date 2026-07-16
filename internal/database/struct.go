package database

import (
	"time"
)

type DataUser struct {
	ID          int64
	Username    string
	Email       string
	Password    string
	Pin         *string
	Balance     int64
	FirstName   string
	LastName    string
	DateOfBirth time.Time
	Address     *string
	Mother      *string
	Code        string
}

type User struct {
	ID        string    `json:"id"`
	Email     string    `json:"email"`
	Password  string    `json:"password"`
	Pin       *string   `json:"pin,omitempty"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
}

type Balance struct {
	ID        string    `json:"id"`
	Balance   int64     `json:"balance"`
	UpdatedAt time.Time `json:"updated_at"`
}

type Profile struct {
	ID          int64     `json:"id"`
	FirstName   string    `json:"first_name"`
	LastName    string    `json:"last_name"`
	DateOfBirth time.Time `json:"date_of_birth"`
	Address     *string   `json:"address,omitempty"`
	Mother      *string   `json:"mother,omitempty"`
	UpdatedAt   time.Time `json:"updated_at"`
}

type Otp struct {
	ID        int64     `json:"id"`
	Code      string    `json:"code"`
	Used      bool      `json:"used"`
	CreatedAt time.Time `json:"created_at"`
	ExpiredAt time.Time `json:"expired_at"`
}
