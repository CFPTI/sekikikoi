-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le :  ven. 22 mars 2019 à 17:16
-- Version du serveur :  5.7.23
-- Version de PHP :  7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `sekikikoi`
--
CREATE DATABASE IF NOT EXISTS `sekikikoi` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `sekikikoi`;

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id_category` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id_category`, `name`) VALUES
(6, 'Article'),
(2, 'Cinéma'),
(1, 'Musique'),
(8, 'Parole'),
(5, 'Politique');

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
  `id_media` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `id_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `media`
--

INSERT INTO `media` (`id_media`, `titre`, `url`, `id_category`) VALUES
(1, 'Nés sous la même étoile', 'https://open.spotify.com/track/66ZtqKhYSA8XyPr0aAUFsm?si=7CwiDhOvRWCYm6UJn1U_Qw', 1),
(2, 'Générique dessin animé golodorak année 1975', 'https://www.youtube.com/watch?v=GKXrnNeTwj8', 2),
(3, 'Scarface Trailer HD (1983)', 'https://www.youtube.com/watch?v=7pQQHnqBa2E', 2),
(5, 'VIDÉO – Emmanuel Macron dit n\'importe quoi en essayant de citer IAM', 'https://lelab.europe1.fr/video-emmanuel-macron-dit-nimporte-quoi-en-essayant-de-citer-iam-3217847', 5),
(6, 'Nés sous la même étoile', 'https://fr.wikipedia.org/wiki/N%C3%A9s_sous_la_m%C3%AAme_%C3%A9toile', 6),
(7, 'Meurtre à Alcatraz', 'https://fr.wikipedia.org/wiki/Meurtre_%C3%A0_Alcatraz', 2),
(8, 'Elvis', 'https://open.spotify.com/track/2l0L4Ox3ILbHpXTIylKZRV?si=3eU3klFnQGuyji1MJ0-Rmg', 1),
(9, 'Akhenaton dans Génération Jedi : \"L’Empire du côté obscur est un morceau engagé\"', 'https://www.francetvinfo.fr/replay-radio/generation-jedi/akhenaton-dans-generation-jedi-lempire-du-cote-obscur-est-un-morceau-engage_1790639.html', 2),
(10, 'IAM - Sagacité\r\n', 'https://www.lesinrocks.com/1997/03/26/musique/iam-sagacite-11232636/', 5),
(11, 'L’empire du côté obscure', 'https://open.spotify.com/track/2I5S4UqzgMdooPBc31EmgX?si=M9iQsadJTkCH41DOSzrl6A', 1),
(12, 'L\'Empire du côté obscur (EP)', 'https://fr.wikipedia.org/wiki/L%27Empire_du_c%C3%B4t%C3%A9_obscur_(EP)', 5),
(13, 'Raw man', 'http://the-two.ch/discography/', 1),
(14, 'The Two métisse son blues sauvage à Montreux', '\r\nhttps://www.24heures.ch/culture/musique/The-Two-metisse-son-blues-sauvage-a-Montreux/story/12979019', 5),
(15, 'Pony Music: Les Docks s\'associent à SOS Méditerranée pour une soirée de sensibilisation', 'https://www.rts.ch/play/radio/pony-express/audio/pony-music-les-docks-sassocient-a-sos-mediterranee-pour-une-soiree-de-sensibilisation?id=10181412', 1),
(16, 'Plus Tony que Sosa', 'https://open.spotify.com/track/20S52xE4HYhqwlqy7tPgRh?si=ajWUkumyQoiQVYthgCUriw', 1),
(17, 'Sunday Bloody Sunday', 'https://youtu.be/SCKcULlEydo', 1),
(18, 'LE BLOODY SUNDAY DE 1972', 'https://www.guide-irlande.com/culture/bloody-sunday-1972/', 6),
(19, 'Bloody Sunday', 'http://www.allocine.fr/film/fichefilm_gen_cfilm=42572.html', 2),
(20, 'Un Dimanche comme les autres', 'http://www.allocine.fr/film/fichefilm_gen_cfilm=30294.html', 2),
(22, 'Bullet the blue sky', 'https://youtu.be/DHSL0Wvyf3k', 1),
(23, 'Bono parle des origines de « Bullet the Blue Sky »', 'https://www.rollingstone.fr/bono-parle-des-origines-de-bullet-blue-sky/', 6),
(24, 'Voyage au bout de l’enfer', 'https://www.senscritique.com/film/Voyage_au_bout_de_l_enfer/376439', 2),
(25, 'Apocalypse now', 'https://www.senscritique.com/film/Apocalypse_Now/488421', 2),
(26, 'Platoon', 'http://www.allocine.fr/film/fichefilm_gen_cfilm=29700.html', 2);

-- --------------------------------------------------------

--
-- Structure de la table `reference`
--

DROP TABLE IF EXISTS `reference`;
CREATE TABLE `reference` (
  `id_reference` int(11) NOT NULL,
  `description` text NOT NULL,
  `id_media_base` int(11) NOT NULL,
  `id_media_ref` int(11) NOT NULL,
  `id_type_ref` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `reference`
--

INSERT INTO `reference` (`id_reference`, `description`, `id_media_base`, `id_media_ref`, `id_type_ref`) VALUES
(1, 'On entend à la toute fin du morceau la phrase « La vie de rêve ». C\'est une citation de Tony Montana joué par Al Pacino dans la version française du film Scarface de Brian De Palma. Le personnage prononce cette phrase lors de sa demande d\'asile politique aux États-Unis alors qu\'il dépeint son quotidien à subir le pouvoir communiste de Cuba qu\'il vient de quitter.', 1, 2, 1),
(2, 'Le sample de ce morceau est tiré de ce film. Il aparaît à la fin du film notamment.', 1, 7, 4),
(3, 'On entend à la toute fin du morceau la phrase « La vie de rêve ». C\'est une citation de Tony Montana joué par Al Pacino dans la version française du film Scarface de Brian De Palma. Le personnage prononce cette phrase lors de sa demande d\'asile politique aux États-Unis alors qu\'il dépeint son quotidien à subir le pouvoir communiste de Cuba qu\'il vient de quitter.', 1, 3, 4),
(4, 'Au cours de la campagne pour l\'élection présidentielle de 2017, Emmanuel Macron détourne les paroles de la chanson en affirmant \"nous sommes bien nés sous la même étoile\"', 1, 5, 3),
(5, '“Je me souviens, quand j’étais petit, avoir pris une claque au cinéma en découvrant la Guerre des étoiles ”, explique le rappeur. “Ça nous a influencés, évidemment, et nous avons mis dans nos premiers morceaux des références à la saga. ” Le morceau le plus connu reste L’Empire du côté obscur , qui figure sur le mythique album L’école du micro d’argent sorti en 1997.', 8, 9, 4),
(6, 'Akhenaton ­ Dès le premier album, nous avions glissé des références à La Guerre des étoiles : à la fin d\'Elvis, on entend \"Tu vas payer ton manque total de lucidité shhhhh...\" On aime la SF depuis le début, mais plutôt les films que les livres. Mon préféré étant la trilogie de La Guerre des étoiles, avec son explication trop facile et américaine du bien et du mal. Cette définition manichéenne me débecte parfois ­ et c\'est pour cela que nous nous réclamons plus volontiers du côté obscur : c\'est Dark Vador que j\'admire, pas Luke Skywalker. Pour moi, admirer Skywalker reviendrait à admirer tous les gros hypocrites qui se font passer pour des bienfaiteurs de l\'humanité, tels que les hommes politiques.', 8, 10, 3),
(7, '“Je me souviens, quand j’étais petit, avoir pris une claque au cinéma en découvrant la Guerre des étoiles ”, explique le rappeur. “Ça nous a influencés, évidemment, et nous avons mis dans nos premiers morceaux des références à la saga. ” Le morceau le plus connu reste L’Empire du côté obscur , qui figure sur le mythique album L’école du micro d’argent sorti en 1997.', 11, 9, 4),
(8, 'C\'est aussi une chanson engagée, qui dénonce « un système. Celui dans lequel les gens qui ont fait de grandes écoles se font passer pour des gentils et stigmatisent les \"grands méchants\" des banlieues.» selon le chanteur Akhenaton.', 11, 12, 4),
(9, '«cri du cœur d’un peuple qui veut exister. Aujourd’hui, l’esclavage n’est plus le fait des planteurs de coton, mais celui d’un capitalisme où on meurt à 25 ans et où on nous enterre à 80.»', 13, 14, 3),
(10, '\"Ouais on est pas comme eux, pas comme eux\", fait référence aux paroles \"C\'est rien Léa si on était moins scrupuleux, un peu de jeu du feu, on serait comme eux \"', 1, 16, 2),
(11, 'L\'expression Bloody Sunday désigne un triste épisode de l\'histoire nord-irlandaise. Elle fait allusion aux événements du dimanche 30 janvier 1972 à Derry en Irlande du Nord, où 14 manifestants pacifiques furent tués par des tirs de l\'armée britannique.\r\n', 17, 18, 3),
(12, 'Film du même nom.', 17, 19, 4),
(13, 'Film sur le même événement historique du 30 janvier 1972.', 17, 20, 4),
(14, 'Article sur les origines de la chanson', 22, 23, 3),
(15, 'Film parlant des guerres au Vietnam.', 22, 24, 4),
(16, 'Film sur la guerre du Vietnam.', 22, 25, 4),
(17, 'Film parlant d\'un régiment d’infanterie près de la frontière cambodgienne.', 22, 26, 4);

-- --------------------------------------------------------

--
-- Structure de la table `type_reference`
--

DROP TABLE IF EXISTS `type_reference`;
CREATE TABLE `type_reference` (
  `id_type_reference` int(11) NOT NULL,
  `label` varchar(45) NOT NULL,
  `icon_type` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_reference`
--

INSERT INTO `type_reference` (`id_type_reference`, `label`, `icon_type`) VALUES
(1, 'citation', '<i class=\"fas fa-quote-right\"></i>'),
(2, 'song', '<i class=\"fas fa-music\"></i>'),
(3, 'article', '<i class=\"fas fa-newspaper\"></i>'),
(4, 'video', '<i class=\"fas fa-film\"></i>');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_category`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id_media`),
  ADD KEY `id_catergory` (`id_category`);

--
-- Index pour la table `reference`
--
ALTER TABLE `reference`
  ADD PRIMARY KEY (`id_reference`),
  ADD KEY `id_media_base` (`id_media_base`),
  ADD KEY `id_media_ref` (`id_media_ref`),
  ADD KEY `id_type_ref` (`id_type_ref`);

--
-- Index pour la table `type_reference`
--
ALTER TABLE `type_reference`
  ADD PRIMARY KEY (`id_type_reference`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `media`
--
ALTER TABLE `media`
  MODIFY `id_media` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pour la table `reference`
--
ALTER TABLE `reference`
  MODIFY `id_reference` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `type_reference`
--
ALTER TABLE `type_reference`
  MODIFY `id_type_reference` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `category` (`id_category`);

--
-- Contraintes pour la table `reference`
--
ALTER TABLE `reference`
  ADD CONSTRAINT `reference_ibfk_1` FOREIGN KEY (`id_media_base`) REFERENCES `media` (`id_media`),
  ADD CONSTRAINT `reference_ibfk_2` FOREIGN KEY (`id_media_ref`) REFERENCES `media` (`id_media`),
  ADD CONSTRAINT `reference_ibfk_3` FOREIGN KEY (`id_type_ref`) REFERENCES `type_reference` (`id_type_reference`);
