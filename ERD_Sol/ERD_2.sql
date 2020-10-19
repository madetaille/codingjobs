CREATE TABLE Author (
  Name    varchar(255) NOT NULL,
  Address varchar(255) NOT NULL,
  URL     varchar(255),
  PRIMARY KEY (Name,
  Address));
  
CREATE TABLE Book (
  ISBN          varchar(255) NOT NULL,
  PublisherName varchar(255) NOT NULL,
  AuthorName    varchar(255) NOT NULL,
  AuthorAddress varchar(255) NOT NULL,
  Year          int(10),
  Title         varchar(255),
  Price         double NOT NULL,
  Shelve_id     int(10) NOT NULL,
  PRIMARY KEY (ISBN));
  
CREATE TABLE Shelve (
  Id   int(10) NOT NULL AUTO_INCREMENT,
  Type varchar(255) NOT NULL,
  PRIMARY KEY (Id));
  
ALTER TABLE Book ADD CONSTRAINT `c_1:1,n` FOREIGN KEY (AuthorName, AuthorAddress) REFERENCES Author (Name, Address) ON UPDATE RESTRICT ON DELETE RESTRICT;

ALTER TABLE Book ADD CONSTRAINT `c_2:1,n` FOREIGN KEY (Shelve_id) REFERENCES Shelve (Id) ON UPDATE RESTRICT ON DELETE RESTRICT;


INSERT INTO `Author`(`Name`, `Address`, `URL`) VALUES ('Mattieu','random_address','https://google.com');

INSERT INTO `Shelve`(`Id`, `Type`) VALUES (0,'Science fiction');


INSERT INTO `Book`(`ISBN`, `PublisherName`, `AuthorName`, `AuthorAddress`, `Year`, `Title`, `Price`, `Shelve_id`) VALUES ('123','Jacques','Mattieu','random_address','1993','Nice title',12.2,0)

DELETE FROM `Shelve` WHERE id = 1;
