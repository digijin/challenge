drop table submissions;
drop table users;
drop table candidates;

CREATE TABLE submissions
(
  id serial primary key,
  candidate_id integer,
  data text,
  challenge text
);

CREATE TABLE users
(
  id serial primary key,
  name text,
  email text,
  pass text
);

CREATE TABLE candidates
(
    id serial primary key,
    name text not null,
    email text not null,
    created timestamp not null
);