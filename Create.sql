create table if not exists Singer (
	id serial primary key,
	name varchar(60) not null
);

create table if not exists Genre (
	id serial primary key,
	name varchar(60) not null
);

create table if not exists Singer_Genre (
    id serial primary key,
    singer_id integer not null references Singer(id),
    genre_id integer not null references Genre(id)
);

create table if not exists Album (
	id serial primary key,
	name varchar(80) not null,
	year_of_issue integer check(year_of_issue > 0) not null
);

create table if not exists Singer_Album (
    id serial primary key,
    singer_id integer not null references Singer(id),
    album_id integer not null references Album(id)
);

create table if not exists Songs (
	id serial primary key,
	name varchar(100) not null,
	duration numeric check(duration > 0) not null,
	album_id integer references Album(id) not null
);

create table if not exists Collection (
	id serial primary key,
	name varchar(80) not null,
	year_of_issue integer check(year_of_issue > 0) not null
);

create table if not exists Songs_Collection (
    id serial primary key,
    collection_id integer not null references Collection(id),
    songs_id integer not null references Songs(id)
)