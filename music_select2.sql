-- Количество исполнителей в каждом жанре.
SELECT ge.name, COUNT(ag.artist_id) 
FROM genre ge JOIN artist_genre ag ON ge.id = ag.genre_id
GROUP BY ge.name;

-- Количество треков, вошедших в альбомы 2019–2020 годов.
-- ДОРАБОТКА
SELECT count(tr.name)
FROM album al JOIN track tr ON al.id = tr.album_id
WHERE al.year_album BETWEEN 2019 AND 2020;

-- Средняя продолжительность треков по каждому альбому.
SELECT al.name, avg(tr.len_track)
FROM album al JOIN track tr ON al.id = tr.album_id
GROUP BY al.name;

-- Все исполнители, которые не выпустили альбомы в 2020 году.
-- ДОРАБОТКА
SELECT ar.name from artist ar
where ar.name not in 
(select ar.name from artist ar 
join artist_album aa on aa.artist_id = ar.id 
join album al on al.id = aa.album_id 
WHERE al.year_album = 2020);

-- Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT DISTINCT ar.name, cl.name
FROM artist ar 
JOIN artist_album aa 
JOIN album al 
JOIN track tr 
JOIN collection_track ct
JOIN collection cl ON cl.id = ct.collection_id
ON ct.track_id = tr.id 
ON tr.album_id = al.id
ON al.id = aa.album_id 
ON aa.artist_id = ar.id
WHERE ar.name = 'Ryan Bingham';

-- Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT al.name, count(ge.name) 
FROM album al
JOIN artist_album aa 
JOIN artist ar
JOIN artist_genre ag 
JOIN genre ge ON ge.id = ag.genre_id
ON ag.artist_id = ar.id
ON ar.id = aa.artist_id 
ON aa.album_id = al.id
GROUP BY al.name, ar.name
HAVING count(*) > 1;

-- Наименования треков, которые не входят в сборники.
SELECT tr.name 
FROM track tr 
WHERE tr.id NOT IN (SELECT DISTINCT ct.track_id FROM collection_track ct);


-- Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
SELECT ar.name, tr.len_track
FROM artist ar 
JOIN artist_album aa 
JOIN album al
JOIN track tr ON tr.album_id = al.id
ON al.id = aa.album_id 
ON aa.artist_id = ar.id
WHERE tr.len_track = (SELECT min(tr.len_track) FROM track tr);

-- Названия альбомов, содержащих наименьшее количество треков.
SELECT al.name, count(tr.name)
FROM album al join track tr on al.id = tr.album_id
GROUP BY al.name
HAVING count(tr.name) = (SELECT count(*) FROM track GROUP BY album_id ORDER BY 1 LIMIT 1)






