-- Table USERS

CREATE TABLE "users" (
    "id" VARCHAR(13) NOT NULL UNIQUE PRIMARY KEY,
    "email" VARCHAR(40) NOT NULL UNIQUE,
    "password" VARCHAR(60) NOT NULL,
    "pin" VARCHAR(6),
    "created_at" TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    "updated_at" TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);


-- Table BALANCES

CREATE TABLE "balances" (
    "id" bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "balance" bigint NOT NULL DEFAULT 0,
    "created_at" TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    "updated_at" TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);


-- Table USERS_BALANCES

CREATE TABLE "users_balances" (
    "id_user" VARCHAR(13) REFERENCES "users"("id"),
    "id_balance" bigint  REFERENCES "balances"("id")
);


-- Table PROFILES

CREATE TABLE "profiles" (
    "id" bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "first_name" VARCHAR(20) NOT NULL,
    "last_name" VARCHAR(20) NOT NULL,
    "date_of_birth" DATE NOT NULL,
    "address" TEXT,
    "mother" VARCHAR(40),
    "created_at" TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    "updated_at" TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);


-- Table USERS_PROFILES

CREATE TABLE "users_profiles" (
    "id_user" VARCHAR(13) REFERENCES "users"("id"),
    "id_profile" bigint  REFERENCES "profiles"("id")
);

CREATE TABLE "otp" (
    "id" bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "code" VARCHAR(6) NOT NULL,
    "used" BOOLEAN DEFAULT FALSE,
    "created_at" TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    "expired_at" TIMESTAMP WITH TIME ZONE DEFAULT (NOW() + INTERVAL '5 minutes') NOT NULL
);

CREATE TABLE "users_otp" (
    "id_user" VARCHAR(13) REFERENCES "users"("id"),
    "id_otp" bigint  REFERENCES "otp"("id")
);

DROP TABLE "users_otp";
-- Daftar TABLE
SELECT * FROM "users";
SELECT * FROM "balances";
SELECT * FROM "users_balances";
SELECT * FROM "profiles";
SELECT * FROM "users_profiles";
SELECT * FROM "otp"
DROP TABLE "users", "balances", "users_balances", "profiles", "users_profiles", "otp";

DROP SCHEMA public CASCADE; 
CREATE SCHEMA public;

CREATE TABLE "otp" (
    "id" bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);


-- Create User and default balance


-- users, balances, users_balances
-- Lebih dari satu data

WITH "new_user" AS (
    INSERT INTO "users" ("id", "email", "password", "pin") 
    VALUES 
        ('082393468568', 'hidayatmaruf99@gmail.com', 'pwd123', '112233'),
        ('085399376716', 'zulaikha529@gmail.com', 'pwd1234', '112244')
    RETURNING "id"
),
"new_balance" AS (
    INSERT INTO "balances" ("balance") 
    VALUES 
        (20000), 
        (10000)
    RETURNING "id"
),
"ranked_user" AS (
    SELECT "id", row_number() OVER () as "rn" FROM "new_user"
),
"ranked_balance" AS (
    SELECT "id", row_number() OVER () as "rn" FROM "new_balance"
)
INSERT INTO "users_balances" ("id_user", "id_balance")
SELECT "u"."id", "b"."id" 
FROM "ranked_user" "u"
JOIN "ranked_balance" "b" ON "u"."rn" = "b"."rn";

-- Satu Data
WITH "new_user" AS (
    INSERT INTO "users" ("id", "email", "password", "pin") 
    VALUES 
        ('082393468568', 'hidayatmaruf99@gmail.com', 'pwd123', '112233')
    RETURNING "id"
),
"new_balance" AS (
    INSERT INTO "balances" ("balance") 
    VALUES 
        (20000)
    RETURNING "id"
)
INSERT INTO "users_balances" ("id_user", "id_balance")
SELECT "new_user"."id", "new_balance"."id" 
FROM "new_user", "new_balance";



-- profiles, users_profiles
-- Satu data
WITH "new_user" AS (
    INSERT INTO "profiles" ("first_name", "last_name", "date_of_birth", "address", "mother")
    VALUES ('Al-Maruf', 'Hidayat', '1999-08-18', 'Jl. Jenderal Sudirman No. 10', 'Lusiyah')
    RETURNING "id"
)
INSERT INTO "users_profiles" ("id_user", "id_profile")
SELECT '082393468568', "new_user"."id"
FROM "new_user";

SELECT * FROM "profiles";
SELECT * FROM "users_profiles";


-- otp, users_otp
WITH "new_otp" AS (
    INSERT INTO "otp" ("code")
    VALUES ('123456')
    RETURNING "id"
)
INSERT INTO "users_otp" ("id_user", "id_otp")
SELECT '082393468568', "new_otp"."id"
FROM "new_otp";

SELECT * FROM "otp";
SELECT * FROM "users_otp";
-- Selesai



-- Cek hasil pembuktian apakah ketiganya sudah terisi otomatis
SELECT * FROM "users";
SELECT * FROM "balances";
SELECT * FROM "users_balances";
