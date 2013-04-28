
DROP TABLE user IF EXISTS;
CREATE TABLE user (
  id	INTEGER IDENTITY PRIMARY KEY,
  name	VARCHAR(60),
  password  VARCHAR(30), 
  email	VARCHAR(60), 
  image VARCHAR(60)
);
CREATE INDEX user_name ON user (name);
