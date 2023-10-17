-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 17 oct. 2023 à 21:32
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestcom`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `idArticle` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `pu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`idArticle`, `description`, `pu`) VALUES
(2, 'Crayon couleur', 250),
(3, 'Stylo', 15000),
(4, 'Regles', 1500),
(9, 'Cahier', 44);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `idClient` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `ville` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`idClient`, `nom`, `ville`, `telephone`) VALUES
(4, 'Khoudia BA', 'kaolack', '771247919'),
(5, 'Ndiasse MBOW', 'kaolack', '779070965'),
(6, 'lno122', 'KOLDA', '444'),
(8, 'lno', 'KOLDA', '778975896'),
(9, 'Mariama MBAYE', 'KOLDA', '444'),
(10, 'Abdou Aziz NDIAYE', 'KOLDA', '778975896'),
(11, 'Basirou BA', 'KOLDA', '778975896');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `idCommande` int(11) NOT NULL,
  `date` date NOT NULL,
  `idClient` int(11) DEFAULT NULL,
  `view` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`idCommande`, `date`, `idClient`, `view`) VALUES
(1, '2023-10-05', 6, 1),
(2, '2023-10-28', 5, 4),
(3, '1999-11-15', 4, 0),
(6, '1000-01-01', 4, 3),
(7, '2001-01-01', 4, 2),
(8, '2023-10-07', 4, 6),
(10, '2025-10-11', 4, 2);

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

CREATE TABLE `image` (
  `idImage` int(11) NOT NULL,
  `descript` varchar(255) NOT NULL,
  `chemin` varchar(255) NOT NULL,
  `taille` int(11) NOT NULL,
  `idArticle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `image`
--

INSERT INTO `image` (`idImage`, `descript`, `chemin`, `taille`, `idArticle`) VALUES
(12, 'khoudia.png', 'Images/khoudia.png', 335585, 9);

-- --------------------------------------------------------

--
-- Structure de la table `lignecommande`
--

CREATE TABLE `lignecommande` (
  `idArticle` int(11) NOT NULL,
  `idCommande` int(11) NOT NULL,
  `qte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `lignecommande`
--

INSERT INTO `lignecommande` (`idArticle`, `idCommande`, `qte`) VALUES
(2, 1, 12),
(2, 10, 1999),
(4, 2, 1574),
(4, 6, 1999),
(4, 8, 0),
(9, 7, 12);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`idArticle`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`idClient`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`idCommande`),
  ADD KEY `commande_ibfk_1` (`idClient`);

--
-- Index pour la table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`idImage`),
  ADD KEY `idArt` (`idArticle`);

--
-- Index pour la table `lignecommande`
--
ALTER TABLE `lignecommande`
  ADD PRIMARY KEY (`idArticle`,`idCommande`),
  ADD KEY `LigneCommande_ibfk_2` (`idCommande`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `idArticle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `idClient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `idCommande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `image`
--
ALTER TABLE `image`
  MODIFY `idImage` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`idClient`) REFERENCES `client` (`idClient`);

--
-- Contraintes pour la table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `image_ibfk_1` FOREIGN KEY (`idArticle`) REFERENCES `article` (`idArticle`);

--
-- Contraintes pour la table `lignecommande`
--
ALTER TABLE `lignecommande`
  ADD CONSTRAINT `LigneCommande_ibfk_1` FOREIGN KEY (`idArticle`) REFERENCES `article` (`idArticle`),
  ADD CONSTRAINT `LigneCommande_ibfk_2` FOREIGN KEY (`idCommande`) REFERENCES `commande` (`idCommande`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
