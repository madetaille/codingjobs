CREATE TABLE Questions (
  ID         int(10) NOT NULL AUTO_INCREMENT,
  name       varchar(255) NOT NULL,
  content    varchar(500) NOT NULL,
  user_email varchar(255) NOT NULL,
  PRIMARY KEY (ID));
  
CREATE TABLE Users (
  email           varchar(255) NOT NULL,
  last_connection varchar(255) NOT NULL,
  PRIMARY KEY (email));
  
ALTER TABLE Questions ADD CONSTRAINT `c_1: 1,n` FOREIGN KEY (user_email) REFERENCES Users (email) ON UPDATE CASCADE ON DELETE CASCADE;

INSERT INTO `Users`(`email`, `last_connection`) VALUES ('test@test.test','2020-01-01 13:13:02');

INSERT INTO `Questions`(`name`, `content`, `user_email`) VALUES ('Q1','Question 1', 'test@test.test');
INSERT INTO `Questions`(`name`, `content`, `user_email`) VALUES ('Q2','Question 2', 'test@test.test');

DELETE FROM `Users` WHERE email = 'test@test.test';
