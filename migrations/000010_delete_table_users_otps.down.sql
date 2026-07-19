CREATE TABLE "users_otp" (
    "id_user" VARCHAR(13) REFERENCES "users"("id") ON DELETE RESTRICT,
    "id_otp" bigint REFERENCES "otp"("id") ON DELETE RESTRICT
);