--создаем таблицы
CREATE TABLE IF NOT EXISTS track(
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	len_track TIME NOT NULL,
	album_id INTEGER NOT NULL REFERENCES album(id)
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
	nick VARCHAR(40) 
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

-- добовляем артистов и ники
INSERT INTO artist (name)
VALUES ('John Bonjovi');

INSERT INTO artist (name, nick)
VALUES ('Chester Charles', 'Linkin Park');

INSERT INTO artist (name)
VALUES ('Modonna');

INSERT INTO artist (name, nick)
VALUES ('Bruce Marshall', 'Eminem');

INSERT INTO artist (name)
VALUES ('Michael Jackson');

INSERT INTO artist (name)
VALUES ('Ed Sheeran');

INSERT INTO artist (name, nick)
VALUES ('Stefani Joanne', 'Lady Gaga');

INSERT INTO artist (name)
VALUES ('Ryan Bingham');

INSERT INTO artist (name)
VALUES ('Louis Armstrong');

-- добовляем жанры
INSERT INTO genre (name)
VALUES ('pop');

INSERT INTO genre (name)
VALUES ('rock');

INSERT INTO genre (name)
VALUES ('jazz');

INSERT INTO genre (name)
VALUES ('rap');

INSERT INTO genre (name)
VALUES ('country');

-- добовляем значения в artist_genre
INSERT INTO artist_genre (artist_id, genre_id)
VALUES (1,2), (2,2), (3,1), (4,4), (5,1), (6,1), (7,1), (8,5), (9,3);

-- добовляем альбомы
INSERT INTO album(name, year_album)
VALUES ('Crush', 2000);

INSERT INTO album(name, year_album)
VALUES ('Minutes to Midnight', 2007);

INSERT INTO album(name, year_album)
VALUES ('Like a Prayer', 1989);

INSERT INTO album(name, year_album)
VALUES ('Music to Be Murdered By', 2020);

INSERT INTO album(name, year_album)
VALUES ('The Essential Michael Jackson', 2005);

INSERT INTO album(name, year_album)
VALUES ('Essentials', 2018);

INSERT INTO album(name, year_album)
VALUES ('Chromatica', 2020);

INSERT INTO album(name, year_album)
VALUES ('Mescalito', 2007);

INSERT INTO album(name, year_album)
VALUES ('All Time Greatest Hits', 1994);


-- добовляем значения в artist_album
INSERT INTO artist_album (artist_id, album_id)
VALUES (1,1), (2,2), (3,3), (4,4), (5,5), (6,6), (7,7), (8,8), (9,9);

-- добовляем track
INSERT INTO track (name, len_track, album_id)
VALUES ('Its My Life', '3:44', 1), ('Thank You For Loving Me', '4:01', 1);

INSERT INTO track (name, len_track, album_id)
VALUES ('What Ive Done', '3:29', 2), ('No More Sorrow', '5:05', 2);

INSERT INTO track (name, len_track, album_id)
VALUES ('Like a Prayer', '5:51', 3), ('Express Yourself', '4:35', 3);

INSERT INTO track (name, len_track, album_id)
VALUES ('Without Me', '4:23', 4), ('Sing for the Moment', '5:39', 4);

INSERT INTO track (name, len_track, album_id)
VALUES ('I Want You Back', '2:58', 5), ('Billie Jean', '4:54', 5);

INSERT INTO track (name, len_track, album_id)
VALUES ('I See Fire', '4:59', 6), ('Give Me Love', '5:26', 6);

INSERT INTO track (name, len_track, album_id)
VALUES ('Rain on me', '3:02', 7), ('Replay', '3:06', 7);

INSERT INTO track (name, len_track, album_id)
VALUES ('The Other Side', '2:08', 8), ('Dont Wait for Me', '4:54', 8);

INSERT INTO track (name, len_track, album_id)
VALUES ('What A Wonderful World - Single Version', '2:20', 9), ('Hello Dolly', '2:25', 9);


-- добовляем collection
INSERT INTO collection(name, year_collection)
VALUES ('Bast 2000', 2000)

INSERT INTO collection(name, year_collection)
VALUES ('Bast 2007', 2007)

INSERT INTO collection(name, year_collection)
VALUES ('Bast 1989', 1989)

INSERT INTO collection(name, year_collection)
VALUES ('Bast 2020', 2020)

INSERT INTO collection(name, year_collection)
VALUES ('Bast 2005', 2005)

INSERT INTO collection(name, year_collection)
VALUES ('Bast 2018', 2018)

INSERT INTO collection(name, year_collection)
VALUES ('Bast of the best 2007', 2007)

INSERT INTO collection(name, year_collection)
VALUES ('Bast 1994', 1994)


-- добовляем значения в collection_track
INSERT INTO collection_track(track_id, collection_id)
VALUES (1,1), (2,1), (3,2), (4,2), (5,3), (6,3), (7,4), (8,4), (13,4), (14,4), 
(9,5), (10,5), (11,6), (12,6), (15,7), (16,7), (17,8), (18,8);


-- select запросы
-- название и год выхода альбомов, вышедших в 2018 году
SELECT name, year_album FROM album
WHERE year_album = 2018;

-- название и продолжительность самого длительного трека
SELECT name, len_track FROM track
WHERE len_track=(SELECT MAX(len_track) FROM track);

-- название треков, продолжительность которых не менее 3,5 минуты
SELECT name, len_track FROM track
WHERE len_track >= '3:50';

-- названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT name, year_collection FROM collection
WHERE year_collection BETWEEN 2018 AND 2020;

-- исполнители, чье имя состоит из 1 слова
SELECT name FROM artist
WHERE name NOT LIKE '% %';

-- название треков, которые содержат слово "мой"/"my"
SELECT name FROM track
WHERE name LIKE '%my%'








