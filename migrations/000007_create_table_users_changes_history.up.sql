CREATE TABLE "users_changes_history" (
    "id" bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "id_user" VARCHAR(13) REFERENCES "users"("id") ON DELETE RESTRICT,
    "id_otp" bigint REFERENCES "otp"("id") ON DELETE RESTRICT,
    "change_type" VARCHAR(20) NOT NULL,
    "old_value" TEXT,
    "new_value" TEXT NOT NULL,
    "ip_address" VARCHAR(45),
    "user_agent" TEXT,
    "created_at" TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);