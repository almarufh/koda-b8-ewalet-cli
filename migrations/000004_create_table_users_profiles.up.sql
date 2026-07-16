CREATE TABLE "users_profiles" (
    "id_user" VARCHAR(20) REFERENCES "users"("id"),
    "id_profile" bigint  REFERENCES "profiles"("id")
);