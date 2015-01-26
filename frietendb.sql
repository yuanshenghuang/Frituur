-- phpMyAdmin SQL Dump
-- version 4.0.4.2
-- http://www.phpmyadmin.net
--
-- Machine: localhost
-- Genereertijd: 26 jan 2015 om 14:36
-- Serverversie: 5.6.13
-- PHP-versie: 5.4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databank: `frietendb`
--
CREATE DATABASE IF NOT EXISTS `frietendb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `frietendb`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tbl_bestelling`
--

CREATE TABLE IF NOT EXISTS `tbl_bestelling` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `afhaaltijd` varchar(255) NOT NULL,
  `klantnaam` varchar(255) NOT NULL,
  `lijst` longtext NOT NULL,
  `totaal` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Gegevens worden uitgevoerd voor tabel `tbl_bestelling`
--

INSERT INTO `tbl_bestelling` (`id`, `afhaaltijd`, `klantnaam`, `lijst`, `totaal`) VALUES
(1, '08:26', 'sven', 'mayo €1.0       x 1\ncurry €1.0       x 1\nbitterballen €2.5       x 1\n', 4.5),
(2, '15:44', 'jan', 'grote friet €3.5       x 2\n', 7),
(3, '18:49', 'oualid', 'grote friet €3.5       x 1\n', 3.5),
(4, '12:33', 'kevin', 'bitterballen €2.5       x 1\nbockworst €2.0       x 1\nsito €2.3       x 1\nkraker €2.3       x 1\nkaassoufle €1.7       x 1\n', 10.799999999999999),
(5, '14:38', 'jan', 'grote friet €3.5       x 5\nkleine friet €2.5       x 5\nandalouse €1.0       x 4\nzoete mayo €1.0       x 4\nsamurai €1.0       x 4\ncurry €1.0       x 4\nmayo €1.0       x 4\nbitterballen €2.5       x 4\nbockworst €2.0       x 5\nsito €2.3       x 4\nkraker €2.3       x 3\nkaassoufle €1.7       x 5\nkaaskroket €2.5       x 4\nviandel pikant €2.1       x 4\ncervela €2.0       x 5\nviandel €2.1       x 4\n', 131.4),
(6, '11:37', 'inne', 'curry €1.0       x 1\nkraker €2.3       x 1\ncervela €2.0       x 1\n', 5.3),
(7, '12:26', 'sven', 'kaaskroket €2.5       x 1\n', 2.5),
(8, '13:50', 'sven', 'sito €2.3       x 1\nkraker €2.3       x 1\nkaaskroket €2.5       x 1\n', 7.1),
(9, '14:11', 'kevin', 'samurai €1.0       x 1\nkaassoufle €1.7       x 1\nkaaskroket €2.5       x 1\n', 5.2);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tbl_cartitem`
--

CREATE TABLE IF NOT EXISTS `tbl_cartitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product` (`product`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tbl_category`
--

CREATE TABLE IF NOT EXISTS `tbl_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Gegevens worden uitgevoerd voor tabel `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `name`) VALUES
(1, 'frieten'),
(2, 'snacks'),
(3, 'saus');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tbl_product`
--

CREATE TABLE IF NOT EXISTS `tbl_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `prijs` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category` (`categoryid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Gegevens worden uitgevoerd voor tabel `tbl_product`
--

INSERT INTO `tbl_product` (`id`, `categoryid`, `name`, `prijs`) VALUES
(1, 1, 'grote friet', 3.5),
(2, 1, 'kleine friet', 2.5),
(3, 2, 'bitterballen', 2.5),
(4, 2, 'bockworst', 2),
(5, 3, 'mayo', 1),
(6, 3, 'curry', 1),
(7, 2, 'sito', 2.3),
(8, 2, 'kraker', 2.3),
(9, 2, 'kaassoufle', 1.7),
(10, 2, 'kaaskroket', 2.5),
(11, 2, 'viandel', 2.1),
(12, 2, 'cervela', 2),
(13, 2, 'viandel pikant', 2.1),
(14, 3, 'samurai', 1),
(15, 3, 'zoete mayo', 1),
(16, 3, 'andalouse', 1);

--
-- Beperkingen voor gedumpte tabellen
--

--
-- Beperkingen voor tabel `tbl_cartitem`
--
ALTER TABLE `tbl_cartitem`
  ADD CONSTRAINT `tbl_cartitem_ibfk_1` FOREIGN KEY (`product`) REFERENCES `tbl_product` (`id`);

--
-- Beperkingen voor tabel `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD CONSTRAINT `tbl_product_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `tbl_category` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
