SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE IF NOT EXISTS `article` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `article` (`id`, `name`, `price`, `stock`) VALUES
(1, 'Dentifrice', '458.25', 250),
(2, 'shampoing', '999.99', 15),
(8, 'Produit cool', '45.00', 200),
(9, 'Autre produit cool', '20.00', 150),
(10, 'Super truc', '12.58', 102),
(11, 'Blobby blob', '452.00', 125),
(12, 'Accordéon', '485.00', 12),
(13, 'Pipeau', '45.00', 12);

CREATE TABLE IF NOT EXISTS `article_estimate` (
  `id_estimate` int(11) NOT NULL,
  `id_article` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `article_estimate` (`id_estimate`, `id_article`, `quantity`) VALUES
(4, 1, 1),
(4, 2, 1),
(4, 9, 2),
(4, 12, 5),
(6, 9, 1),
(6, 10, 2),
(6, 12, 1),
(6, 13, 5);

CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL,
  `lastname` varchar(100) CHARACTER SET latin1 NOT NULL,
  `firstname` varchar(100) CHARACTER SET latin1 NOT NULL,
  `adresse_rue` varchar(100) CHARACTER SET latin1 NOT NULL,
  `adresse_cp` varchar(5) CHARACTER SET latin1 DEFAULT NULL,
  `adresse_ville` varchar(50) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `client` (`id`, `lastname`, `firstname`, `adresse_rue`, `adresse_cp`, `adresse_ville`) VALUES
(1, 'Malkovich', 'Malkovich', '4 Rue des Docks', '75000', 'Paris'),
(2, 'Abagnale', 'Daniel', '116 bis Avenue du pré bleu', '13005', 'Marseille'),
(3, 'Araignas', 'Lucette', '12 Boulevard Montparnasse', '75000', 'Paris'),
(4, 'Araignas', 'Benjamin', '4 Rue des Pierres', '51454', 'Reims');

CREATE TABLE IF NOT EXISTS `estimate` (
  `id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `validated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('Brouillon','Validé','En attente','Payé','Annulé') COLLATE utf8_unicode_ci NOT NULL,
  `reference` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `discount` int(11) NOT NULL,
  `id_client` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `estimate` (`id`, `created_at`, `validated_at`, `status`, `reference`, `discount`, `id_client`) VALUES
(4, '2015-10-04 12:07:36', '2016-10-17 12:07:36', 'Brouillon', 'DE5802', 5, 1),
(6, '2016-05-04 12:07:36', '2016-09-05 05:04:12', 'Brouillon', 'FR2580', 0, 2);

ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `article_estimate`
  ADD PRIMARY KEY (`id_estimate`,`id_article`),
  ADD KEY `id_estimate` (`id_estimate`),
  ADD KEY `id_article` (`id_article`);

ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `estimate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client` (`id_client`);

ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;

ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;

ALTER TABLE `estimate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;

ALTER TABLE `article_estimate`
  ADD CONSTRAINT `article_estimate_ibfk_1` FOREIGN KEY (`id_article`) REFERENCES `article` (`id`),
  ADD CONSTRAINT `article_estimate_ibfk_2` FOREIGN KEY (`id_estimate`) REFERENCES `estimate` (`id`);

ALTER TABLE `estimate`
  ADD CONSTRAINT `estimate_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`);
