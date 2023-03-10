drop table collection_track;

CREATE TABLE IF NOT EXISTS track(
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	len_track TIME NOT NULL,
	album_id INTEGER REFERENCES album(id)
);

CREATE TABLE IF NOT EXISTS album(
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	year_album INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS collection(
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	year_collection INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS collection_track(
	track_id INTEGER REFERENCES track(id),
	collection_id INTEGER REFERENCES collection(id)
);


CREATE TABLE IF NOT EXISTS artist(
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	nick VARCHAR(40) DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS artist_album(
	artist_id INTEGER REFERENCES artist(id),
	album_id INTEGER REFERENCES album(id)
);

CREATE TABLE IF NOT EXISTS genre(
	id serial PRIMARY KEY,
	name VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS artist_genre(
	artist_id INTEGER REFERENCES artist(id),
	genre_id INTEGER REFERENCES genre(id)
);
