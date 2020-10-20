CREATE TABLE Film (
  ID           int(10) NOT NULL,
  Language     VARCHAR(20) NOT NULL,
  Title        varchar(255) NOT NULL,
  Description  varchar(255),
  Release_Year int(4),
  DirectorID   int(10) NOT NULL,
  PRIMARY KEY (ID));
  
CREATE TABLE Film_Actors (
  FilmID  int(10) NOT NULL,
  ActorID int(10) NOT NULL,
  PRIMARY KEY (FilmID,
  ActorID));
  
CREATE TABLE Actor (
  ID         int(10) NOT NULL,
  First_Name varchar(255) NOT NULL,
  Last_Name  varchar(255) NOT NULL,
  PRIMARY KEY (ID));
  
CREATE TABLE Director (
  ID         int(10) NOT NULL,
  First_name varchar(255) NOT NULL,
  Last_name  varchar(255) NOT NULL,
  PRIMARY KEY (ID));
  
ALTER TABLE Film_Actors ADD CONSTRAINT `c_1: n,n` FOREIGN KEY (FilmID) REFERENCES Film (ID) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE Film_Actors ADD CONSTRAINT `c_2: n,n` FOREIGN KEY (ActorID) REFERENCES Actor (ID) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE Film ADD CONSTRAINT `c_3: 1,1` FOREIGN KEY (DirectorID) REFERENCES Director (ID) ON UPDATE CASCADE ON DELETE CASCADE;

INSERT INTO `Director`(`ID`, `First_name`, `Last_name`) VALUES (0, 'Steven', 'Spielberg');

INSERT INTO `Actor`(`ID`, `First_Name`, `Last_Name`) VALUES (0, 'William', 'Bradley Pitt');
INSERT INTO `Actor`(`ID`, `First_Name`, `Last_Name`) VALUES (1, 'Angelina', 'Jolie Voight');

INSERT INTO `Film`(`ID`, `Language`, `Title`, `Description`, `Release_Year`, `ActorID`, `DirectorID`) VALUES (0,'English','my movie','nice description!',1992,0);

INSERT INTO `Film_Actors`(`FilmID`, `ActorID`) VALUES (0,0);
INSERT INTO `Film_Actors`(`FilmID`, `ActorID`) VALUES (0,1);

DELETE FROM `Film` WHERE Title = 'my movie';



