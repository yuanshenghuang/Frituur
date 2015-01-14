-- phpMyAdmin SQL Dump
-- version 4.0.4.2
-- http://www.phpmyadmin.net
--
-- Machine: localhost
-- Genereertijd: 19 dec 2014 om 19:39
-- Serverversie: 5.6.13
-- PHP-versie: 5.4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databank: `frituurdb`
--
CREATE DATABASE IF NOT EXISTS `frituurdb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `frituurdb`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tbl_friet`
--

CREATE TABLE IF NOT EXISTS `tbl_friet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naam` varchar(250) NOT NULL,
  `prijs` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Gegevens worden uitgevoerd voor tabel `tbl_friet`
--

INSERT INTO `tbl_friet` (`id`, `naam`, `prijs`) VALUES
(1, 'groot', 4);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tbl_saus`
--

CREATE TABLE IF NOT EXISTS `tbl_saus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naam` varchar(250) NOT NULL,
  `prijs` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Gegevens worden uitgevoerd voor tabel `tbl_saus`
--

INSERT INTO `tbl_saus` (`id`, `naam`, `prijs`) VALUES
(1, 'mayo', 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tbl_snack`
--

CREATE TABLE IF NOT EXISTS `tbl_snack` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naam` varchar(250) NOT NULL,
  `prijs` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Gegevens worden uitgevoerd voor tabel `tbl_snack`
--

INSERT INTO `tbl_snack` (`id`, `naam`, `prijs`) VALUES
(1, 'vleeskroket', 2.5);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
