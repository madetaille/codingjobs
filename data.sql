DROP TABLE IF EXISTS `Clients`;
CREATE TABLE `Clients` (
  `client_number` varchar(4) DEFAULT NULL,
  `name` varchar(9) DEFAULT NULL,
  `address` varchar(21) DEFAULT NULL,
  `locality` varchar(9) DEFAULT NULL,
  `category` varchar(2) DEFAULT NULL,
  `account` mediumint(9) DEFAULT NULL,
  `planet` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `Clients` VALUES ('B062','skywalker','72, south street','San Francisco','B2',-3200,'Tatooine'),('B112','skywalker','23, Dumont street','London','C1',1250,'Tatooine'),('B332','Monti','112, Neuve street','Geneva','B2',0,'earth'),('B512','Gillet','14, summer street','Toulouse','B1',-8700,'earth'),('C003','Avron','8, Cure street','Toulouse','B1',-1700,'earth'),('C400','Ferard','65, Tertre street','Paris','B2',350,'earth'),('F010','Toussaint','5, Godefroid street','Paris','C1',0,'earth'),('F400','Jacob','78, Moulin street','Brussels','C2',0,'earth'),('K111','Vanbist','180, Florimont Street','Brussels','B1',720,'earth'),('L422','Franck','60, Wépion street','Amstredam','C1',0,'earth'),('S127','Vanderka','3, Rose avenue','Rotterdam','C1',-4580,'earth'),('S712','Guillaume','14a, Rose street','Paris','B1',0,'earth'),('F011','PONCELET','17,Clos des Erables','Toulouse','B2',0,'earth'),('K729','NEUMAN','40,r.Bransart','Toulouse','',0,'earth');


DROP TABLE IF EXISTS `Orders`;
CREATE TABLE `Orders` (
  `order_number` mediumint(9) DEFAULT NULL,
  `client_number` varchar(4) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `Orders` VALUES (30178,'K111','2019-03-04'),(30179,'C400','2019-02-01 14:09:02'),(30182,'S127','2020-02-02'),(30184,'C400','2020-02-03 15:09:00'),(30185,'F011','2018-07-04 17:00:00'),(30186,'C400','2015-01-09 17:00:00'),(30188,'B512','1230-01-03 18:00:00');


DROP TABLE IF EXISTS `Detail`;
CREATE TABLE `Detail` (
  `order_number` mediumint(9) DEFAULT NULL,
  `product_number` varchar(5) DEFAULT NULL,
  `quantity` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `Detail` VALUES (30178,'CS464',25),(30179,'CS262',60),(30179,'PA60',20),(30182,'PA60',30),(30184,'CS464',120),(30185,'CS464',260),(30185,'PA60',15),(30185,'PS222',600),(30186,'PA45',3),(30188,'CS464',180),(30188,'PA60',70),(30188,'PH222',92),(30184,'PA45',20),(30188,'PA45',22);


DROP TABLE IF EXISTS `People`;
CREATE TABLE `People` (
  `name` varchar(10) DEFAULT NULL,
  `age` varchar(3) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `People` VALUES ('Yoda','900','M'),('Darth Maul','','M');


DROP TABLE IF EXISTS `Product`;
CREATE TABLE `Product` (
  `product_number` varchar(5) DEFAULT NULL,
  `label` varchar(21) DEFAULT NULL,
  `price` smallint(6) DEFAULT NULL,
  `stock_quantity` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `Product` VALUES ('CS262','Chocolate bar',75,1),('CS264','Candy bar',2,2690),('CS464','Blue cheese',3,450),('PA60','Water bottle',1,134),('PS222','Sprite bottle',2,1220),('PA45','Coke can',3,580),('PH222','Vodka bottle',15,782);
