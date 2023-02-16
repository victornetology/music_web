-- запросы
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








