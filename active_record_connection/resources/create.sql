create table users(
  id int primary key,
  twitter_id int unique,
  name varchar(250),
  screen_name varchar(250),
  description text,
  image varchar(250),
  created_at date
);

create table tweets(
  id int primary key,
  twitter_id int unique,
  user_id int references users(id),
  text text,
  created_at date
);
