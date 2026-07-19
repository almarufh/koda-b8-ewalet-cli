CREATE TABLE "users_profiles" (
    "id_user" VARCHAR(13) REFERENCES "users"("id") ON DELETE RESTRICT,
    "id_profile" bigint REFERENCES "profiles"("id") ON DELETE RESTRICT
);