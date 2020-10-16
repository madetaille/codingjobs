DROP TABLE IF EXISTS `Client`;
CREATE TABLE `Client` (
  `client_number` varchar(4) DEFAULT NULL,
  `name` varchar(9) DEFAULT NULL,
  `address` varchar(21) DEFAULT NULL,
  `locality` varchar(9) DEFAULT NULL,
  `category` varchar(2) DEFAULT NULL,
  `account` mediumint(9) DEFAULT NULL,
  `planet` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `Client` VALUES ('B062','skywalker','72, rue de la Gare','Namur','B2',-3200,'Tatooine'),('B112','skywalker','23, rue Dumont','Poitiers','C1',1250,'Tatooine'),('B332','Monti','112, rue Neuve','Genève','B2',0,'terre'),('B512','Gillet','14, rue de l\'Eté','Toulouse','B1',-8700,'terre'),('C003','Avron','8, rue de la Cure','Toulouse','B1',-1700,'terre'),('C400','Ferard','65, rue du Tertre','Poitiers','B2',350,'terre'),('F010','Toussaint','5, rue Godefroid','Poitiers','C1',0,'terre'),('F400','Jacob','78, chemin du Moulin','Bruxelles','C2',0,'terre'),('K111','Vanbist','180, rue Florimont','Lille','B1',720,'terre'),('L422','Franck','60, rue de Wépion','Namur','C1',0,'terre'),('S127','Vanderka','3, avenue des Roses','Namur','C1',-4580,'terre'),('S712','Guillaume','14a, chemin des Roses','Paris','B1',0,'terre'),('F011','PONCELET','17,Clos des Erables','Toulouse','B2',0,'terre'),('K729','NEUMAN','40,r.Bransart','Toulouse','',0,'terre');


DROP TABLE IF EXISTS `Order`;
CREATE TABLE `Order` (
  `order_number` mediumint(9) DEFAULT NULL,
  `client_number` varchar(4) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `Order` VALUES (30178,'K111',''),(30179,'C400',''),(30182,'S127',''),(30184,'C400',''),(30185,'F011',''),(30186,'C400',''),(30188,'B512','');


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

INSERT INTO `Product` VALUES ('CS262','Chev. Sapin 200*6*2',75,45),('CS264','Chev. Sapin 200*6*4',120,2690),('CS464','Chev. Sapin 400*6*4',220,450),('PA60','Pointe Acier 60 (10K)',95,134),('PS222','PL. Sapin 200*20*2',185,1220),('PA45','POINTE ACIER 45 (20K)',105,580),('PH222','PL HETRE 200x20x2',230,782);
