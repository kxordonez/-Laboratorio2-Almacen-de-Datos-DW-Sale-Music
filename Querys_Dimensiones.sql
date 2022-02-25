--QUERYS PARA LAS DIMENSIONES LABORATORIO 2

--CONSULTA PARA ALBUMS
SELECT Title AS TitleAlbum
FROM albums;

--CONSULTA PARA ARTIST
SELECT Name AS NameArtist 
FROM artists;

--CONSULTA PARA CUSTOMERS
SELECT FirstName,LastName,Phone,Fax,Email 
FROM customers;

--CONSULTA PARA  INVOICE ITEMS
SELECT UnitPrice,Quantity
FROM invoice_items;

--CONSULTA ´PARA LOCATION
SELECT BillingAddress AS Address,BillingCity AS City,BillingState AS State,BillingCountry AS Country,BillingPostalCode AS PostalCode
FROM invoices;

--CONSULTA PARA TRACKS
SELECT  tracks.Name AS NameTrack, 
                media_types.Name AS MediaType,
                genres.Name AS NameGenre,
                tracks.Composer,
                tracks.Milliseconds,
                tracks.Bytes,
                tracks.UnitPrice
            FROM tracks
            INNER JOIN media_types
            ON tracks.MediaTypeId = media_types.MediaTypeId
            INNER JOIN genres
            ON tracks.GenreId = genres.GenreId;

--CONSULTA PARA TRACKS Y UNIR DIMENSIONES
SELECT tracks.TrackId, 
                tracks.Name AS NameTrack, 
                media_types.Name AS MediaType,
                genres.Name AS NameGenre,
                tracks.Composer,
                tracks.Milliseconds,
                tracks.Bytes,
                tracks.UnitPrice
FROM tracks
INNER JOIN media_types
ON tracks.MediaTypeId = media_types.MediaTypeId
INNER JOIN genres
ON tracks.GenreId = genres.GenreId;

--CONSULTA PARA LA TABLA DE HECHOS
SELECT   invoices.InvoiceId,
                customers.CustomerId,
                dim_time.TimeId,
                invoices.InvoiceId AS LocationId,
                tracks.TrackId,
                artists.ArtistId,
                albums.AlbumId,
                invoices.Total
FROM invoices INNER JOIN customers
ON invoices.CustomerId= customers.CustomerId
INNER JOIN invoice_items
ON invoice_items.InvoiceId= invoices.InvoiceId
INNER JOIN tracks
ON tracks.TrackId=  invoice_items.TrackId
INNER JOIN albums
ON tracks.AlbumId= albums.AlbumId
INNER JOIN artists 
ON albums.ArtistId= artists.ArtistId 
INNER JOIN dim_time
ON invoices.InvoiceDate= substr(dim_time.date,0,20)