CREATE TABLE "users" (
    "id" bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "username" VARCHAR(20) NOT NULL UNIQUE,
    "email" VARCHAR(40) NOT NULL UNIQUE,
    "password" VARCHAR(40) NOT NULL,
    "pin" VARCHAR(6),
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);

CREATE TABLE "balances" (
    "id" bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "balance" NUMERIC(15,2) NOT NULL DEFAULT 0.00,
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);

CREATE TABLE "users_balances" (
    "id_user" bigint  REFERENCES "users"("id"),
    "id_balance" bigint  REFERENCES "balances"("id")
);

CREATE TABLE "profiles" (
    "id" bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "first_name" VARCHAR(20) NOT NULL,
    "last_name" VARCHAR(20) NOT NULL,
    "date_of_birth" DATE NOT NULL,
    "address" TEXT,
    "mother" VARCHAR(40),
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);

CREATE TABLE "users_profiles" (
    "id_user" bigint  REFERENCES "users"("id"),
    "id_profile" bigint  REFERENCES "profiles"("id")
);

CREATE TABLE "otp" (
    "id" bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
)


SELECT * FROM "users";
SELECT * FROM "balances";
SELECT * FROM "users_balances";
SELECT * FROM "profiles";
SELECT * FROM "users_profiles";
SELECT * FROM "otp"
DROP TABLE "users", "balances", "users_balances", "profiles", "users_profiles";

CREATE TABLE "otp" (
    "id" bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
)











-- INSERT INTO "users" ("first_name", "last_name", "age") VALUES
-- ('Bildan', 'Jauhary', 18);

-- INSERT INTO "users" ("first_name", "last_name") VALUES
-- ('almaruf', 'hidayat');


-- CREATE TABLE "auth_users" (
--     "id" bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
--     "id_user" bigint REFERENCES "users"("id"),
--     "hp" int NOT NULL,
--     "email" VARCHAR(40) NOT NULL,
--     "password" VARCHAR(70) NOT NULL
-- );

-- INSERT INTO "auth_users" ("id_user", "hp", )

-- CREATE TABLE "change_users" (
--     "id" bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
--     "id_users" bigint  REFERENCES "users"("id"),
--     "otp" integer NOT NULL,
--     "expired" boolean DEFAULT false,
--     "used" boolean DEFAULT false,
--     "createdAT" TIMESTAMP DEFAULT NOW()
-- );

-- CREATE TABLE "change_logs" (
--     "id" bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
--     "id_users" bigint REFERENCES "users"("id"),
--     "id_change" bigint REFERENCES "change_users"("id"),
--     "type"  varchar(40) NOT NULL,
--     "before"  varchar(40) NOT NULL,
--     "after"  varchar(40) NOT NULL,
--     "succes" boolean DEFAULT false,
--     "createdAT" TIMESTAMP DEFAULT NOW()
-- );


-- -- DROP TABLE users;
-- -- DROP TABLE auth_users;
-- -- DROP TABLE change_logs;
-- -- DROP TABLE change_users;