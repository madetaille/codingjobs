CREATE TABLE ParkingSystems (
  ID int(10) NOT NULL,
  name varchar(255) NOT NULL,
  PRIMARY KEY (ID));
  
CREATE TABLE Customers (
  ID int(10) NOT NULL,
  name Varchar(255) NOT NULL,
  location varchar(10) NOT NULL,
  PRIMARY KEY (ID));
  
CREATE TABLE Summaries (
  ParkingSystemID int(10) NOT NULL,
  CustomerID      int(10) NOT NULL,
  date_begin      timestamp NOT NULL,
  date_end        timestamp NOT NULL,
  PRIMARY KEY (ParkingSystemID,
  CustomerID,
  date_begin,
  date_end));
  
ALTER TABLE Summaries ADD CONSTRAINT `c_1: 1,n` FOREIGN KEY (ParkingSystemID) REFERENCES ParkingSystems (ID) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE Summaries ADD CONSTRAINT `C_2 : 1,n` FOREIGN KEY (CustomerID) REFERENCES Customers (ID) ON UPDATE CASCADE ON DELETE CASCADE;

INSERT INTO `Customers`(`ID`, `name`, `location`) VALUES (0,'Darth Vader', 'Tatooine');

INSERT INTO `ParkingSystems`(`ID`, `name`) VALUES (0,'Parking A');

INSERT INTO `Summaries`(`ParkingSystemID`, `CustomerID`, `date_begin`, `date_end`) VALUES (0,0,1603005003,1603012200);

SELECT * FROM Summaries WHERE CustomerID = 0;


