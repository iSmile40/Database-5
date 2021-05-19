# 1. Количество исполнителей в каждом жанре

SELECT g.name, COUNT(singer_id) FROM genre AS g
JOIN singer_genre AS sg ON g.id = sg.genre_id
GROUP BY g.name
ORDER BY COUNT(singer_id) DESC;

# 2. Количество треков, вошедших в альбомы 2019-2020 годов

SELECT COUNT(s.name) FROM songs AS s
JOIN album AS a ON s.album_id = a.id
WHERE a.year_of_issue = 2019 OR a.year_of_issue = 2020;

# 3. Средняя продолжительность треков по каждому альбому

SELECT a.name, AVG(s.duration) FROM songs AS s
JOIN album AS a ON s.album_id = a.id
GROUP BY a.name;

# 4. Все исполнители, которые не выпустили альбомы в 2020 году

SELECT s.name FROM singer AS s
JOIN singer_album AS sa ON s.id = sa.singer_id
JOIN album AS a ON sa.album_id = a.id
WHERE a.year_of_issue != 2020;

# 5. Названия сборников, в которых присутствует конкретный исполнитель

SELECT c.name FROM collection AS c
JOIN songs_collection AS sc ON c.id = sc.collection_id
JOIN songs AS s ON sc.songs_id = s.id
JOIN album AS a ON s.album_id = a.id
JOIN singer_album AS sa ON a.id = sa.album_id
JOIN singer AS si ON sa.singer_id = si.id
WHERE si.name = 'Radiohead';

# 6. Названия альбомов, в которых присутствуют исполнители более 1 жанра

SELECT a.name FROM album AS a
JOIN singer_album AS sa ON a.id = sa.album_id
JOIN singer AS s ON s.id = sa.singer_id
JOIN singer_genre AS sg ON s.id = sg.singer_id
JOIN genre AS g ON g.id = sg.genre_id
GROUP BY a.name
HAVING COUNT(DISTINCT g.name) > 1;

# 7. Наименования треков, которые не входят в сборники

SELECT s.name FROM songs AS s
LEFT JOIN songs_collection AS sc ON s.id = sc.songs_id
WHERE sc.songs_id IS NULL
ORDER BY s.name;

# 8. Исполнителя(-ей), написавшего самый короткий по продолжительности трек

SELECT si.name, s.duration FROM songs as s
JOIN album AS a ON a.id = s.album_id
JOIN singer_album AS sa ON sa.album_id = a.id
JOIN singer AS si ON si.id = sa.singer_id
WHERE duration = (SELECT MIN(duration) FROM songs);

# 9. Названия альбомов, содержащих наименьшее количество треков

SELECT a.name FROM album AS a
JOIN songs AS s ON s.album_id = a.id
WHERE s.album_id in (
	SELECT album_id FROM songs
	GROUP BY album_id
	HAVING COUNT(id) = (
		SELECT COUNT(id) FROM songs
		GROUP BY album_id
		ORDER BY COUNT
		LIMIT 1
	)
)
ORDER BY a.name
