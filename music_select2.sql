-- Количество исполнителей в каждом жанре.
SELECT ge.name, COUNT(ag.artist_id) 
FROM genre ge JOIN artist_genre ag ON ge.id = ag.genre_id
GROUP BY ge.name;

-- Количество треков, вошедших в альбомы 2019–2020 годов.
-- ДОРАБОТКА
-- Добавлено условие BETWEEN
SELECT al.name, count(tr.name)
FROM album al JOIN track tr ON al.id = tr.album_id
WHERE al.year_album BETWEEN 2019 AND 2020
GROUP BY al.name;


-- Средняя продолжительность треков по каждому альбому.
SELECT al.name, avg(tr.len_track)
FROM album al JOIN track tr ON al.id = tr.album_id
GROUP BY al.name;

-- Все исполнители, которые не выпустили альбомы в 2020 году.
-- ДОРАБОТКА
-- Исправлен запрос - добавдена связь RIGHT JOIN
-- чтобы выводились исполнители, у которых нет альбомов
SELECT ar.name, al.name, al.year_album 
FROM artist ar 
LEFT OUTER JOIN 
(artist_album aa JOIN album al ON aa.album_id = al.id)
ON ar.id = aa.artist_id
WHERE al.year_album <> 2020 OR al.year_album IS NULL;



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
-- ДОРАБОТКА
-- Добавлена дополнительная группировка по именам исполнителей
-- (хотя и без нее работало)
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
-- ДОРАБОТКА
-- Вложенные запросы работают быстрее связных
-- Данная реализация оптимальнее и эввективнее, чем с JOIN
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
-- ДОРАБОТКА
-- Ничего не надо исправлять (см документацию Postgres)
-- A sort_expression can also be the column label or number of an output column
-- https://www.postgresql.org/docs/current/queries-order.html
SELECT al.name, count(tr.name)
FROM album al join track tr on al.id = tr.album_id
GROUP BY al.name
HAVING count(tr.name) = (SELECT count(*) FROM track GROUP BY album_id ORDER BY 1 LIMIT 1)






