CREATE TABLE Artist
(
  ArtistID      INTEGER       NOT NULL,
  ArtistBio     VARCHAR2(255) NOT NULL,
  ArtistCountry VARCHAR2(255) NOT NULL,
  CONSTRAINT ArtistID PRIMARY KEY (ArtistID)
);

CREATE TABLE Band
(
  BandName   VARCHAR2(255) NOT NULL ,
  BandMembers VARCHAR2(255) NOT NULL,
    CONSTRAINT ArtistID_FK1 FOREIGN KEY (ArtistID) REFERENCES Artist (ArtistID)
);

CREATE TABLE SoloArtist
(
  ArtistGender VARCHAR2(255) NOT NULL,
  ArtistFirstName VARCHAR2(255) NOT NULL,
  ArtistLastName  VARCHAR2(255) NOT NULL,
    CONSTRAINT ArtistID_FK1 FOREIGN KEY (ArtistID) REFERENCES Artist (ArtistID)
);

CREATE TABLE Stations
(
  StationID INTEGER NOT NULL,
  AlbumID   INTEGER,
  ArtistID  INTEGER,
  CONSTRAINT StationID PRIMARY KEY (StationID),
  CONSTRAINT ArtistID_FK1 FOREIGN KEY (ArtistID) REFERENCES Artist (ArtistID)
);

CREATE TABLE LocalFiles
(
  LocalFileID INTEGER NOT NULL,
  FileType    VARCHAR2(255),
  CONSTRAINT LocalFileID PRIMARY KEY (LocalFileID)
);

CREATE TABLE Videos
(
  VideoID     INTEGER NOT NULL,
  VideoLength NUMBER  NOT NULL,
  CONSTRAINT VideoID PRIMARY KEY (VideoID),
  CONSTRAINT SongID_FK FOREIGN KEY (SongID) REFERENCES Song (SongID)
);