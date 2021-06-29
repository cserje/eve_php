
-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Gép: localhost
-- Létrehozás ideje: 2021. Jún 29. 16:23
-- Kiszolgáló verziója: 10.4.18-MariaDB
-- PHP verzió: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `EVE`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `CATEGORY`
--

CREATE TABLE `CATEGORY` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `icon` varchar(45) NOT NULL DEFAULT 'undefined.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `CATEGORY`
--

INSERT INTO `CATEGORY` (`id`, `name`, `icon`) VALUES
(1, 'Arc- és szemvédelem', 'undefined.jpg'),
(2, 'Fejvédelem', 'undefined.jpg'),
(3, 'Hallásvédelem', 'undefined.jpg'),
(4, 'Kéz- és karvédelem', 'undefined.jpg'),
(5, 'Lábvédelem', 'undefined.jpg'),
(6, 'Leesés elleni védelem', 'undefined.jpg'),
(7, 'Légzésvédelem', 'undefined.jpg'),
(8, 'Védőruhák', 'undefined.jpg');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `EQUIPMENT`
--

CREATE TABLE `EQUIPMENT` (
  `id` int(11) NOT NULL,
  `id_worker` int(11) NOT NULL,
  `id_standard_item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `EQUIPMENT`
--

INSERT INTO `EQUIPMENT` (`id`, `id_worker`, `id_standard_item_id`) VALUES
(8, 3, 1),
(9, 3, 1),
(11, 3, 1),
(13, 20, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `EQUIPMENT_VALUE`
--

CREATE TABLE `EQUIPMENT_VALUE` (
  `id` int(11) NOT NULL,
  `id_equipment` int(11) NOT NULL,
  `id_standard_item_field` int(11) NOT NULL,
  `value` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `EQUIPMENT_VALUE`
--

INSERT INTO `EQUIPMENT_VALUE` (`id`, `id_equipment`, `id_standard_item_field`, `value`) VALUES
(31, 8, 1, '2'),
(32, 8, 2, '2'),
(33, 8, 3, '3'),
(34, 8, 4, '4'),
(35, 8, 5, 'A'),
(36, 8, 6, ''),
(37, 8, 7, '8'),
(38, 9, 1, '4'),
(39, 9, 2, '5'),
(40, 9, 3, '4'),
(41, 9, 4, '4'),
(42, 9, 5, 'F'),
(43, 9, 6, 'P'),
(44, 9, 7, '11'),
(52, 11, 1, '1'),
(53, 11, 2, '2'),
(54, 11, 3, '3'),
(55, 11, 4, '1'),
(56, 11, 5, 'A'),
(57, 11, 6, ''),
(58, 11, 7, '9'),
(66, 13, 1, '2'),
(67, 13, 2, '2'),
(68, 13, 3, '2'),
(69, 13, 4, '2'),
(70, 13, 5, 'B'),
(71, 13, 6, 'P'),
(72, 13, 7, '8');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `FIELD_VALUE_SET`
--

CREATE TABLE `FIELD_VALUE_SET` (
  `id` int(11) NOT NULL,
  `text` varchar(45) NOT NULL,
  `value` varchar(45) DEFAULT NULL,
  `id_standard_item_field` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `FIELD_VALUE_SET`
--

INSERT INTO `FIELD_VALUE_SET` (`id`, `text`, `value`, `id_standard_item_field`) VALUES
(1, '1. szint', '1', 1),
(2, '2. szint', '2', 1),
(3, '3. szint', '3', 1),
(4, '4. szint', '4', 1),
(5, '1. szint', '1', 2),
(6, '2. szint', '2', 2),
(7, '3. szint', '3', 2),
(8, '4. szint', '4', 2),
(9, '5. szint', '5', 2),
(10, '1. szint', '1', 3),
(11, '2. szint', '2', 3),
(12, '3. szint', '3', 3),
(13, '4. szint', '4', 3),
(14, '1. szint', '1', 4),
(15, '2. szint', '2', 4),
(16, '3. szint', '3', 4),
(17, '4. szint', '4', 4),
(18, 'A szint', 'A', 5),
(19, 'B szint', 'B', 5),
(20, 'C szint', 'C', 5),
(21, 'D szint', 'D', 5),
(22, 'E szint', 'E', 5),
(23, 'F szint', 'F', 5),
(24, 'igen', 'P', 6),
(25, 'nem', '', 6),
(26, '6', '6', 7),
(27, '7', '7', 7),
(28, '8', '8', 7),
(29, '9', '9', 7),
(30, '10', '10', 7),
(31, '11', '11', 7);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `STANDARD_ITEM`
--

CREATE TABLE `STANDARD_ITEM` (
  `id` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `standard` varchar(100) NOT NULL,
  `icon` varchar(45) NOT NULL DEFAULT 'undefined.jpg',
  `enabled` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `STANDARD_ITEM`
--

INSERT INTO `STANDARD_ITEM` (`id`, `id_category`, `name`, `standard`, `icon`, `enabled`) VALUES
(1, 4, 'Mechanikai veszélyek ellen', 'MSZ EN 388:2016+A1:2019', 'undefined.jpg', 1),
(2, 4, 'Szemcseszórási műveletekhez', 'MSZ EN ISO 14877:2003', 'undefined.jpg', 0),
(3, 4, 'Hideg ellen', 'MSZ EN 511:2006', 'undefined.jpg', 0),
(4, 4, 'Vegyszerek és mikroorganizmusok ellen', 'MSZ EN ISO 374-1:2016', 'undefined.jpg', 0),
(5, 4, 'Termikus kockázatok ellen', 'MSZ EN 407:2020', 'undefined.jpg', 0),
(6, 4, 'Hegesztők védőkesztyűi', 'MSZ EN 12477:2001/A1:2005', 'undefined.jpg', 0),
(7, 4, 'Vágás és szúrás ellen', 'MSZ EN 1082', 'undefined.jpg', 0),
(8, 4, 'Radioaktív szennyezés ellen', 'MSZ EN 421:2110', 'undefined.jpg', 0),
(9, 4, 'Ionizáló sugárzás ellen', 'MSZ EN 421:2010', 'undefined.jpg', 0),
(10, 4, 'Láncfűrészek használói részére', 'MSZ EN ISO 11393-4:2020', 'undefined.jpg', 0),
(11, 4, 'Szigetelőanyagú kesztyűk', 'MSZ EN 60903:2004', 'undefined.jpg', 0),
(12, 4, 'Szigatelőanyagú karvédők', 'MSZ EN 60984:2002', 'undefined.jpg', 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `STANDARD_ITEM_FIELD`
--

CREATE TABLE `STANDARD_ITEM_FIELD` (
  `id` int(11) NOT NULL,
  `id_standard_item` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `type` enum('SELECT','TEXT') NOT NULL,
  `tooltip` varchar(45) DEFAULT NULL,
  `in_standard` tinyint(4) NOT NULL DEFAULT 0,
  `required` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `STANDARD_ITEM_FIELD`
--

INSERT INTO `STANDARD_ITEM_FIELD` (`id`, `id_standard_item`, `order`, `name`, `type`, `tooltip`, `in_standard`, `required`) VALUES
(1, 1, 1, 'Kopásállóság', 'SELECT', '', 1, 1),
(2, 1, 2, 'Késvágással szembeni ellenállás', 'SELECT', '', 1, 1),
(3, 1, 3, 'Továbbszakítással szembeni állóság ', 'SELECT', '', 1, 1),
(4, 1, 4, 'Átlyukasztással szembeni ellenállás', 'SELECT', '', 1, 1),
(5, 1, 5, 'TDM vágási ellenállás', 'SELECT', '', 1, 1),
(6, 1, 6, 'Ütésvédelem', 'SELECT', '', 1, 1),
(7, 1, 7, 'Méret', 'SELECT', '', 0, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `USER`
--

CREATE TABLE `USER` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `USER`
--

INSERT INTO `USER` (`id`, `name`, `email`, `password`) VALUES
(1, 'Cserjési Szilárd', 'cserjesi.szilard@bme.hu', 'ed7e504bada523d45c056c5c072b3305'),
(2, 'Cserjési Kristóf', 'cserjesi.kristof@bme.hu', '3c6a19c2b20cb3496a9573ef365b8c52');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `WORKER`
--

CREATE TABLE `WORKER` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `profession` varchar(45) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `WORKER`
--

INSERT INTO `WORKER` (`id`, `name`, `profession`, `id_user`) VALUES
(3, 'Kun Ábel', 'járműmérnök', 2),
(20, 'Kun Ábelné', 'logisztikai mérnök', 2);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `CATEGORY`
--
ALTER TABLE `CATEGORY`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- A tábla indexei `EQUIPMENT`
--
ALTER TABLE `EQUIPMENT`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_EQUIPMENT_1_idx` (`id_worker`),
  ADD KEY `fk_EQUIPMENT_2_idx` (`id_standard_item_id`);

--
-- A tábla indexei `EQUIPMENT_VALUE`
--
ALTER TABLE `EQUIPMENT_VALUE`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_EQUIPMENT_VALUE_1_idx` (`id_equipment`),
  ADD KEY `fk_EQUIPMENT_VALUE_2_idx` (`id_standard_item_field`);

--
-- A tábla indexei `FIELD_VALUE_SET`
--
ALTER TABLE `FIELD_VALUE_SET`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_FIELD_VALUE_SET_1_idx` (`id_standard_item_field`);

--
-- A tábla indexei `STANDARD_ITEM`
--
ALTER TABLE `STANDARD_ITEM`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_category_standard_item_idx` (`id_category`);

--
-- A tábla indexei `STANDARD_ITEM_FIELD`
--
ALTER TABLE `STANDARD_ITEM_FIELD`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_STANDARD_ITEM_FIELD_idx` (`id_standard_item`);

--
-- A tábla indexei `USER`
--
ALTER TABLE `USER`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- A tábla indexei `WORKER`
--
ALTER TABLE `WORKER`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_worker_idx` (`id_user`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `CATEGORY`
--
ALTER TABLE `CATEGORY`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `EQUIPMENT`
--
ALTER TABLE `EQUIPMENT`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT a táblához `EQUIPMENT_VALUE`
--
ALTER TABLE `EQUIPMENT_VALUE`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT a táblához `FIELD_VALUE_SET`
--
ALTER TABLE `FIELD_VALUE_SET`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT a táblához `STANDARD_ITEM`
--
ALTER TABLE `STANDARD_ITEM`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT a táblához `STANDARD_ITEM_FIELD`
--
ALTER TABLE `STANDARD_ITEM_FIELD`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT a táblához `USER`
--
ALTER TABLE `USER`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `WORKER`
--
ALTER TABLE `WORKER`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `EQUIPMENT`
--
ALTER TABLE `EQUIPMENT`
  ADD CONSTRAINT `fk_EQUIPMENT_1` FOREIGN KEY (`id_worker`) REFERENCES `WORKER` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_EQUIPMENT_2` FOREIGN KEY (`id_standard_item_id`) REFERENCES `STANDARD_ITEM` (`id`);

--
-- Megkötések a táblához `EQUIPMENT_VALUE`
--
ALTER TABLE `EQUIPMENT_VALUE`
  ADD CONSTRAINT `fk_EQUIPMENT_VALUE_1` FOREIGN KEY (`id_equipment`) REFERENCES `EQUIPMENT` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_EQUIPMENT_VALUE_2` FOREIGN KEY (`id_standard_item_field`) REFERENCES `STANDARD_ITEM_FIELD` (`id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `FIELD_VALUE_SET`
--
ALTER TABLE `FIELD_VALUE_SET`
  ADD CONSTRAINT `fk_FIELD_VALUE_SET_1` FOREIGN KEY (`id_standard_item_field`) REFERENCES `STANDARD_ITEM_FIELD` (`id`);

--
-- Megkötések a táblához `STANDARD_ITEM`
--
ALTER TABLE `STANDARD_ITEM`
  ADD CONSTRAINT `fk_category_standard_item` FOREIGN KEY (`id_category`) REFERENCES `CATEGORY` (`id`);

--
-- Megkötések a táblához `STANDARD_ITEM_FIELD`
--
ALTER TABLE `STANDARD_ITEM_FIELD`
  ADD CONSTRAINT `fk_STANDARD_ITEM_FIELDS_1` FOREIGN KEY (`id_standard_item`) REFERENCES `STANDARD_ITEM` (`id`);

--
-- Megkötések a táblához `WORKER`
--
ALTER TABLE `WORKER`
  ADD CONSTRAINT `fk_user_worker` FOREIGN KEY (`id_user`) REFERENCES `USER` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
