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