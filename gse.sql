-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : Dim 22 jan. 2023 à 22:44
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gse`
--

-- --------------------------------------------------------

--
-- Structure de la table `acceder`
--

CREATE TABLE `acceder` (
  `IDE` int(11) NOT NULL,
  `IDC` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `acceder`
--

INSERT INTO `acceder` (`IDE`, `IDC`) VALUES
(1, 234),
(2, 234),
(2, 238),
(3, 236),
(5, 235);

-- --------------------------------------------------------

--
-- Structure de la table `administration_`
--

CREATE TABLE `administration_` (
  `IDA` int(11) NOT NULL,
  `NOM` char(45) DEFAULT NULL,
  `PRENOM` char(45) DEFAULT NULL,
  `EMAIL` varchar(30) DEFAULT NULL,
  `TELEPHONE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `administration_`
--

INSERT INTO `administration_` (`IDA`, `NOM`, `PRENOM`, `EMAIL`, `TELEPHONE`) VALUES
(190, 'barry', 'doucou', 'doucoubarry@gmail.com', 778850504),
(192, 'Kebe', 'Mamadou', 'Mamadoukebe@gmail.com', 778453245),
(193, 'Diop', 'Modou', 'modoudiop@gmail.com', 756475894),
(194, 'dieng', 'fatou', 'fatoudieng@gmail.com', 784356790),
(198, 'junior', 'Barry', 'barryjunior@gmail,com', 764354356);

-- --------------------------------------------------------

--
-- Structure de la table `batiment`
--

CREATE TABLE `batiment` (
  `IDB` int(11) NOT NULL,
  `NOMB` char(45) DEFAULT NULL,
  `LOCALITE` varchar(30) DEFAULT NULL,
  `ATTRIBUT_14` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `batiment`
--

INSERT INTO `batiment` (`IDB`, `NOMB`, `LOCALITE`, `ATTRIBUT_14`) VALUES
(97, 'Dawo', '0987djio', NULL),
(567, 'Badou', '0988Fary', NULL),
(789, 'Senghor', '0978bie', NULL),
(984, 'duillo', '0099Fal', NULL),
(1299, 'Wallu', '45Destreet', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `chambre`
--

CREATE TABLE `chambre` (
  `IDC` int(11) NOT NULL,
  `IDB` int(11) NOT NULL,
  `NOMB` char(45) DEFAULT NULL,
  `COULEUR` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `chambre`
--

INSERT INTO `chambre` (`IDC`, `IDB`, `NOMB`, `COULEUR`) VALUES
(234, 567, 'Wallu', 'Rouge'),
(235, 97, 'Dawo', 'Blanc'),
(236, 984, 'Senghor', 'Rose'),
(237, 984, 'Badou', 'Jaune'),
(238, 97, 'Badou', 'Bleu');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `IDE` int(11) NOT NULL,
  `NOM` char(45) DEFAULT NULL,
  `PRENOM` char(45) DEFAULT NULL,
  `EMAIL` varchar(30) DEFAULT NULL,
  `GENRE` char(10) DEFAULT NULL,
  `IP_ADRESS` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`IDE`, `NOM`, `PRENOM`, `EMAIL`, `GENRE`, `IP_ADRESS`) VALUES
(1, 'Senghor', 'Ben', 'BenSenghor@gmail.com', 'Masculin', 123443),
(2, 'Ndiaye', 'Genevieve', 'GeniNdiaye@gmail.com', 'Feminin', 123456),
(3, 'Diarra', 'Adama', 'diarraAdama@gmail.com', 'Masculin', 123567),
(4, 'Goudiaby', 'Djiby', 'DjibyGoudiaby@gmail.com', 'Masculin', 123345),
(5, 'Ndiaye', 'Mbaye', 'Mbayendiaye@gmail.com', 'Masculin', 123456);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `acceder`
--
ALTER TABLE `acceder`
  ADD PRIMARY KEY (`IDE`,`IDC`),
  ADD KEY `FK_ACCEDER` (`IDC`);

--
-- Index pour la table `administration_`
--
ALTER TABLE `administration_`
  ADD PRIMARY KEY (`IDA`);

--
-- Index pour la table `batiment`
--
ALTER TABLE `batiment`
  ADD PRIMARY KEY (`IDB`);

--
-- Index pour la table `chambre`
--
ALTER TABLE `chambre`
  ADD PRIMARY KEY (`IDC`),
  ADD KEY `FK_SITUER` (`IDB`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`IDE`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `acceder`
--
ALTER TABLE `acceder`
  ADD CONSTRAINT `FK_ACCEDER` FOREIGN KEY (`IDC`) REFERENCES `chambre` (`IDC`),
  ADD CONSTRAINT `FK_ACCEDER2` FOREIGN KEY (`IDE`) REFERENCES `etudiant` (`IDE`);

--
-- Contraintes pour la table `chambre`
--
ALTER TABLE `chambre`
  ADD CONSTRAINT `FK_SITUER` FOREIGN KEY (`IDB`) REFERENCES `batiment` (`IDB`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
