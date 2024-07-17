CREATE TABLE "accounts" (
  "id" bigserial PRIMARY KEY,
  "owner" varchar NOT NULL,
  "balance" bigint NOT NULL,
  "currency" varchar NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT 'now()'
);

CREATE TABLE "entries" (
  "id" bigserial PRIMARY KEY,
  "acoount_id" bigint NOT NULL,
  "ammount" bigint NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT 'now()'
);

CREATE TABLE "orders" (
  "id" bigserial PRIMARY KEY,
  "from_acoount_id" bigint NOT NULL,
  "to_acoount_id" bigint NOT NULL,
  "ammount" bigint NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT 'now()'
);

CREATE INDEX ON "accounts" ("owner");

CREATE INDEX ON "entries" ("acoount_id");

CREATE INDEX ON "orders" ("from_acoount_id");

CREATE INDEX ON "orders" ("to_acoount_id");

CREATE INDEX ON "orders" ("from_acoount_id", "to_acoount_id");

COMMENT ON COLUMN "entries"."ammount" IS 'can be positive or negetive';

COMMENT ON COLUMN "orders"."ammount" IS 'must be positive';

ALTER TABLE "entries" ADD FOREIGN KEY ("acoount_id") REFERENCES "accounts" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("from_acoount_id") REFERENCES "accounts" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("to_acoount_id") REFERENCES "accounts" ("id");
