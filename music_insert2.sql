
-- добовляем артистов и ники
INSERT INTO artist (name, nick)
VALUES 
	('John Bonjovi', NULL),
	('Chester Charles', 'Linkin Park'),
	('Modonna', NULL),
	('Bruce Marshall', 'Eminem'),
	('Michael Jackson', NULL),
	('Ed Sheeran', NULL),
	('Stefani Joanne', 'Lady Gaga'),
	('Ryan Bingham', NULL),
	('Louis Armstrong', NULL)
	('Benni Benassi', 'Benni');

-- добовляем жанры
INSERT INTO genre (name)
VALUES 
	('pop'),
	('rock'),
	('jazz'),
	('rap'),
	('country');

-- добовляем значения в artist_genre
INSERT INTO artist_genre (artist_id, genre_id)
VALUES (1,2), (2,2), (3,1), (4,4), (5,1), (6,1), (7,1), (8,5), (9,3), (7,2), (10,1);

-- добовляем альбомы
INSERT INTO album(name, year_album)
VALUES 
	('Crush', 2000),
	('Minutes to Midnight', 2007),
	('Like a Prayer', 1989),
	('Music to Be Murdered By', 2020),
	('The Essential Michael Jackson', 2005),
	('Essentials', 2018),
	('Chromatica', 2020),
	('Mescalito', 2007),
	('All Time Greatest Hits', 1994),
	('Dawn of Chromatica', 2021);

-- добовляем значения в artist_album
INSERT INTO artist_album (artist_id, album_id)
VALUES (1,1), (2,2), (3,3), (4,4), (5,5), (6,6), (7,7), (8,8), (9,9), (7,10);

-- добовляем track
INSERT INTO track (name, len_track, album_id)
VALUES 
	('Its my Life', '00:03:44', 1), ('Thank You For Loving Me', '00:04:01', 1),
	('What Ive Done', '00:03:29', 2), ('No More Sorrow', '00:05:05', 2),
	('Like a Prayer', '00:05:51', 3), ('Express Yourself', '00:04:35', 3),
	('Without Me', '00:04:23', 4), ('Sing for the Moment', '00:05:39', 4),
	('I Want You Back', '00:02:58', 5), ('Billie Jean', '00:04:54', 5),
	('I See Fire', '00:04:59', 6), ('Give Me Love', '00:05:26', 6),
	('Rain on me', '00:03:02', 7), ('Replay', '00:03:06', 7),
	('The Other Side', '00:02:08', 8), ('Dont Wait for Me', '00:04:54', 8),
	('What A Wonderful World - Single Version', '00:02:20', 9), ('Hello Dolly', '00:02:25', 9),
	('Rain on Me', '00:04:23', 10);

-- добовляем collection
INSERT INTO collection(name, year_collection)
VALUES 
	('Bast 2000', 2000),
	('Bast 2007', 2007),
	('Bast 1989', 1989),
	('Bast 2020', 2020),
	('Bast 2005', 2005),
	('Bast 2018', 2018),
	('Bast of the best 2007', 2007),
	('Bast 1994', 1994);

-- добовляем значения в collection_track
INSERT INTO collection_track(track_id, collection_id)
VALUES (1,1), (2,1), (3,2), (4,2), (5,3), (6,3), (7,4), (8,4), (13,4), (14,4), 
(9,5), (10,5), (11,6), (12,6), (15,7), (16,7), (17,8), (18,8);






