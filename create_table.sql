create table songwriter (
	id_songwriter serial primary key,
	name varchar(40) not null UNIQUE
);


create table genre (
	id_genre serial primary key,
	name varchar(40) not null UNIQUE
);


create table genre_songwriter (
	id_genre_songwriter primary key,
	id_genre integer references genre(id_genre),
	id_songwriter integer references songwriter(id_songwriter)
);


create table album (
	id_album serial primary key,
	name varchar(40) not null,
	release_year integer not null CHECK(release_year >= 1900)
);


create table album_songwriter (
	id_album_songwriter primary key,
	id_album integer references album(id_album),
	id_songwriter integer references songwriter(id_songwriter)
);


create table track (
	id_track serial primary key,
	name varchar(40) not null,
	duration integer not null,
	id_album integer references album(id_album)
);


create table compilation (
	id_compilation serial primary key,
	name varchar(40) not null,
	release_year integer not null CHECK(release_year >= 1900)
);


create table track_compilation (
	id_track_compilation serial primary key,
	id_track integer references track(id),
	id_compilation integer references compilation(id_compilation)
);