create table users(
  id integer primary key autoincrement,
  twitter_id integer unique,
  name varchar(250),
  screen_name varchar(250),
  description varchar(250),
  language varchar(250),
  created_at datetime
);

create table tweets(
  id integer primary key autoincrement,
  twitter_id integer unique,
  user_id integer references users(id),
  text varchar(250),
  language varchar(250),
  created_at datetime
);
