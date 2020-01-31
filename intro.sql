--Query all of the entries in the Genre table

SELECT * FROM Genre;

--Using the INSERT statement, add one of your favorite artists to the Artist table.

INSERT INTO Artist (ArtistName, YearEstablished)
VALUES (Lil Bigs, 1966)

--Using the INSERT statement, add one, or more, albums by your artist to the Album table.

INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
VALUES (Vol. 1, 03/05/1966, 160, Bland Products, 28, 8);

INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
VALUES (Lil Big Country, 07/19/1970, 123, Bland Products, 28, 11);

--Using the INSERT statement, add some songs that are on that album to the Song table.

INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES (The Short Song, 23, 03/05/1966, 8, 28, 23);
INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES (Wheres the Gin", 100, "03/05/1966", 8, 28, 23);
INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES ("Oh There It Is", 37, "03/05/1966", 8, 28, 23);


INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES ("Theres No Money In Bluegrass, 23, 07/19/1970, 11, 28, 24);
INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES (I Sold My Soul to an Executive, 90, 07/19/1970, 11, 28, 24);
INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES (Now I Can Afford More Gin, 10, 07/19/1970, 11, 28, 24);

--Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.

SELECT s.Title as SongTitle, al.Title as AlbumTitle, ar.ArtistName
FROM Song s
LEFT JOIN Album al
ON s.AlbumId = al.AlbumId
LEFT JOIN Artist ar
ON s.ArtistId = ar.ArtistId
WHERE ar.ArtistName = Lil Bigs;

--Reminder: Direction of join matters. Try the following statements and see the difference in results.

SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.AlbumId;
SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId;

--Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT al.Title, COUNT() as SongCount
FROM Album al
JOIN Song s
ON al.AlbumId = s.AlbumId 
GROUP BY al.Title;

--Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT ar.ArtistName, COUNT() as SongCount
FROM Artist ar 
JOIN Song s
ON ar.ArtistId = s.ArtistId
GROUP BY ar.ArtistName;

--Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT g.Label, COUNT() as SongCount
FROM Genre g
JOIN Song s
ON g.GenreId = s.GenreId 
GROUP BY g.Label;

--Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.

SELECT al.Title, MAX(al.AlbumLength) as MaxDuration
FROM Album al;

--Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.

SELECT s.Title, MAX(s.SongLength) as MaxDuration
FROM Song s

--Modify the previous query to also display the title of the album.

SELECT s.Title, MAX(s.SongLength) as MaxDuration, al.Title
FROM Song s
JOIN Album al
ON s.AlbumId = al.AlbumId;
