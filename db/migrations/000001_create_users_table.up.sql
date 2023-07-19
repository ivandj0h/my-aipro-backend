CREATE TABLE "users" (
    "id" bigserial primary key NOT NULL,
    "username" varchar NOT NULL,
    "email" varchar NOT NULL,
    "password" varchar NOT NULL
)