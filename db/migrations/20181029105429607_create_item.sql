-- +micrate Up
CREATE TABLE items (
  id INTEGER NOT NULL PRIMARY KEY,
  date DATE,
  description VARCHAR,
  typus VARCHAR,
  amount FLOAT,
	account_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS items;
