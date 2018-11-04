-- +micrate Up
CREATE TABLE accounts (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS accounts;
