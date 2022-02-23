---------------------------------------------LABORATORIO 2-------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------
--ALBUM
CREATE TABLE dim_album (
    AlbumId  INTEGER        PRIMARY KEY AUTOINCREMENT
                            NOT NULL,
    TitleAlbum    NVARCHAR (160) NOT NULL
);

--ARTIST
CREATE TABLE dim_artist (
    ArtistId INTEGER        PRIMARY KEY AUTOINCREMENT
                            NOT NULL,
    NameArtist     NVARCHAR (120) 
);
--CUSTOMERS
CREATE TABLE dim_customer (
    CustomerId   INTEGER       PRIMARY KEY AUTOINCREMENT
                               NOT NULL,
    FirstName    NVARCHAR (40) NOT NULL,
    LastName     NVARCHAR (20) NOT NULL,
    Phone        NVARCHAR (24),
    Fax          NVARCHAR (24),
    Email        NVARCHAR (60) NOT NULL
);

--INVOICE ITEMS
CREATE TABLE dim_invoice_items (
    InvoiceLineId INTEGER         PRIMARY KEY AUTOINCREMENT
                                  NOT NULL,
    UnitPrice     NUMERIC (10, 2) NOT NULL,
    Quantity      INTEGER         NOT NULL
);

--LOCATION --INVOICES
CREATE TABLE dim_location (
    LocationId         INTEGER         PRIMARY KEY AUTOINCREMENT
                                      NOT NULL,
    Address      NVARCHAR (70),
    City         NVARCHAR (40),
    State        NVARCHAR (40),
    Country      NVARCHAR (40),
    PostalCode   NVARCHAR (10)
);

--TRACKS
CREATE TABLE dim_tracks (
    TrackId      INTEGER         PRIMARY KEY AUTOINCREMENT
                                 NOT NULL,
    NameTrack        NVARCHAR (200)  NOT NULL,
    MediaType        NVARCHAR (120),
    NameGenre    NVARCHAR (120) ,
    Composer     NVARCHAR (220),
    Milliseconds INTEGER         NOT NULL,
    Bytes        INTEGER,
    UnitPrice    NUMERIC (10, 2) NOT NULL
);

--TABLA DE HECHOS
CREATE TABLE fact_sales (
    FactSalesId   INTEGER  PRIMARY KEY AUTOINCREMENT
                              NOT NULL,
    InvoiceId      INTEGER,
    CustomerId    INTEGER,
    TimeId            INTEGER,
    LocationId     INTEGER,
    TrackId         INTEGER,
    ArtistId        INTEGER,
    AlbumId        INTEGER,
    Total               NUMERIC (10, 2) NOT NULL
);