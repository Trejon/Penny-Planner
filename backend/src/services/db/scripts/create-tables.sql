CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS users (
  id uuid DEFAULT uuid_generate_v4 () PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  username VARCHAR(255) NOT NULL UNIQUE,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  created_at TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS accounts (
  id uuid DEFAULT uuid_generate_v4 () PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  balance BIGINT NOT NULL,
  debit BOOLEAN DEFAULT FALSE,
  credit_limit BIGINT,
  bank VARCHAR(255) NOT NULL,
  user_id uuid NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  created_at TIMESTAMP NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id)
);


CREATE TABLE IF NOT EXISTS transactions (
  id uuid DEFAULT uuid_generate_v4 () PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  amount BIGINT NOT NULL,
  credit BOOLEAN NOT NULL,
  memo VARCHAR(255) NOT NULL,
  occurrence_frequency VARCHAR(255),
  due_by_date TIMESTAMP,
  payee VARCHAR(255),
  user_id uuid NOT NULL,
  account_id uuid NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  created_at TIMESTAMP NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (account_id) REFERENCES accounts(id)
);


CREATE TABLE IF NOT EXISTS budgets (
  id uuid DEFAULT uuid_generate_v4 () PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  amount BIGINT,
  category VARCHAR(255),
  user_id uuid NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  created_at TIMESTAMP NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

-- CREATE TABLE IF NOT EXISTS lists (
--   id uuid DEFAULT uuid_generate_v4 () PRIMARY KEY,
--   name VARCHAR(255) NOT NULL,
--   description TEXT,
--   user_id uuid NOT NULL,
--   updated_at TIMESTAMP NOT NULL,
--   created_at TIMESTAMP NOT NULL,
--   FOREIGN KEY (user_id) REFERENCES users(id)
-- );

-- CREATE TABLE IF NOT EXISTS meals (
--   id uuid DEFAULT uuid_generate_v4 () PRIMARY KEY,
--   name VARCHAR(255) NOT NULL,
--   meal_type VARCHAR(255) NOT NULL DEFAULT 'lunch',
--   kind VARCHAR(255),
--   description TEXT,
--   url VARCHAR(255),
--   meal_date DATE NOT NULL,
--   user_id uuid NOT NULL,
--   list_id uuid,
--   updated_at TIMESTAMP NOT NULL,
--   created_at TIMESTAMP NOT NULL,
--   FOREIGN KEY (user_id) REFERENCES users(id),
--   FOREIGN KEY (list_id) REFERENCES lists(id)
-- );
