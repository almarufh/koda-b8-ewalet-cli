CREATE TABLE "users_otp" (
    "id_user" VARCHAR(13) REFERENCES "users"("id"),
    "id_otp" bigint  REFERENCES "otp"("id")
);