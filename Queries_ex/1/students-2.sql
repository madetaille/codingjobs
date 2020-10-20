SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `population` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `cities` (`id`, `name`, `population`) VALUES
(1, 'Viennes', 1840000),
(2, 'Paris', 2244000),
(3, 'Lyon', 484000);

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'Amicale de la saucisse de Montélimar', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi semper ultricies mi, id gravida lorem placerat a. Etiam tellus diam, sagittis vitae lobortis sit amet, pharetra non lacus. '),
(2, 'Club des amateurs de confipote', 'Praesent aliquam ipsum eu vulputate feugiat. Ut sit amet mi iaculis, mollis nibh vel, rutrum leo. Aliquam at purus euismod, commodo massa at, congue ex'),
(3, 'Ligue des défenseurs de la choucroute', 'Donec a scelerisque est. Maecenas vitae lobortis arcu, id aliquet mi. In iaculis metus ipsum, quis lobortis velit ornare in. Suspendisse blandit eu est ac malesuada.');


CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `languages` (`id`, `name`) VALUES
(1, 'Français'),
(2, 'Anglais'),
(3, 'Allemand'),
(4, 'Espagnol');

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `birthday` date NOT NULL,
  `id_group` int(11) NOT NULL,
  `id_language` int(11) NOT NULL,
  `id_university` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `students` (`id`, `lastname`, `firstname`, `birthday`, `id_group`, `id_language`, `id_university`) VALUES
(1, 'John', 'Smith', '1985-05-01', 1, 1, 1),
(2, 'Robert', 'Barriton', '1989-02-10', 1, 1, 1),
(3, 'Manu', 'Escarbèche', '1975-02-12', 1, 2, 1),
(4, 'Hervé', 'Leblic', '1962-08-15', 2, 3, 1),
(5, 'Ariel', 'Defraise', '1959-11-01', 1, 3, 2),
(6, 'Abby', 'Rethel', '1978-08-11', 2, 1, 1),
(7, 'Gérard', 'Pochel', '1987-02-28', 2, 4, 2),
(8, 'André', 'Bechet', '1985-05-01', 2, 3, 3),
(9, 'Alfred', 'Bougainvillers', '1985-05-25', 3, 3, 4),
(10, 'Gérard', 'Manfroid', '1985-04-27', 2, 3, 4),
(11, 'Agar', 'Dunord', '1991-03-14', 3, 3, 4),
(12, 'Thomas', 'Bochard', '1978-02-15', 2, 3, 4),
(13, 'Armand', 'Ravert', '1989-09-18', 3, 2, 4),
(14, 'Jean', 'Meurdesoif', '1987-05-01', 3, 3, 1),
(15, 'Al', 'Colique', '1985-08-10', 3, 3, 1);

CREATE TABLE `universities` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `id_city` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `universities` (`id`, `name`, `id_city`) VALUES
(1, 'Université de Viennes', 1),
(2, 'Université Pierre et Marie Curie', 2),
(3, 'École Polytechnique', 2),
(4, 'École Normale Supérieure de Lyon', 3);

ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_group` (`id_group`),
  ADD KEY `id_language` (`id_language`),
  ADD KEY `id_university` (`id_university`);

ALTER TABLE `universities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_city` (`id_city`),
  ADD KEY `id_city_2` (`id_city`);

ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

ALTER TABLE `universities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`id_group`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `students_ibfk_2` FOREIGN KEY (`id_language`) REFERENCES `languages` (`id`),
  ADD CONSTRAINT `students_ibfk_3` FOREIGN KEY (`id_university`) REFERENCES `universities` (`id`);

ALTER TABLE `universities`
  ADD CONSTRAINT `universities_ibfk_1` FOREIGN KEY (`id_city`) REFERENCES `cities` (`id`);
