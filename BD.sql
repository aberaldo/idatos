-- Adminer 4.7.8 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `locations`;
CREATE TABLE `locations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `locations` (`id`, `name`) VALUES
(1,	'Maldonado');

DROP TABLE IF EXISTS `neighborhoods`;
CREATE TABLE `neighborhoods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `neighborhoods` (`id`, `name`) VALUES
(35,	'2 De Febrero'),
(29,	'23XC+J6R'),
(13,	'33C4+64V'),
(34,	'Acuario 21'),
(8,	'Aidy Grill'),
(10,	'AtrÃ¡s Del Sanatorio Cantegril'),
(31,	'Av Roosevelt  SN'),
(20,	'Av. Fco. Acuña De Figueroa - Arcobaleno'),
(42,	'Av. Roosevelt & Av. San Remo'),
(25,	'Avenida José Terradel & 5 De Setiembre De 1874'),
(47,	'Brava Punta Del Este'),
(24,	'BUS 0769'),
(36,	'Calle 20 Esq. Calle 30'),
(23,	'Capricornio Entre Camino La Laguna Y Piscis Parada 38 Pinares SN'),
(38,	'CLAUDIO WILLIMAN Y PARADA 7 1111'),
(33,	'Edificio Torre Gattas 807'),
(19,	'El Remanso 200'),
(3,	'Entre Calle Claveles Y Neufar'),
(37,	'Esquilo 4'),
(21,	'Gibraltar & Apeninos'),
(27,	'Horacio & Ovidio'),
(15,	'Julio Herrera Y Reising 200'),
(12,	'Mansa'),
(46,	'Parada 19 Playa Mansa'),
(48,	'Parada 23 Mansa'),
(18,	'Península'),
(30,	'Pez Austral Y Cruz Del Sur SN'),
(249,	'Pinares'),
(247,	'Playa Brava'),
(14,	'Playa Mansa'),
(11,	'Playa Mansa Parada 10'),
(243,	'Playa Mansa Pinares'),
(245,	'Punta del Este'),
(22,	'Rambla Doctor Claudio Williman'),
(28,	'Rambla Doctor Claudio Williman Esquina Brasilia  Ooo'),
(32,	'Rambla General Artigas & Calle 29'),
(1,	'Rambla Williman'),
(251,	'Rincón del Indio'),
(248,	'Roosevelt'),
(26,	'Roosevelt 12 SN'),
(242,	'San Rafael'),
(17,	'San Remo Y Av Del Mar 0'),
(244,	'Zona El Golf');

DROP TABLE IF EXISTS `properties`;
CREATE TABLE `properties` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `currency` enum('USD','UYU') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `bedrooms` int DEFAULT NULL,
  `guests` int DEFAULT NULL,
  `bathrooms` int DEFAULT NULL,
  `neighborhood` int DEFAULT NULL,
  `location` int DEFAULT NULL,
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `platform` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `hash` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash` (`hash`(300)),
  KEY `location` (`location`),
  KEY `neighborhood` (`neighborhood`),
  CONSTRAINT `properties_ibfk_1` FOREIGN KEY (`location`) REFERENCES `locations` (`id`),
  CONSTRAINT `properties_ibfk_2` FOREIGN KEY (`neighborhood`) REFERENCES `neighborhoods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `properties` (`id`, `title`, `price`, `currency`, `bedrooms`, `guests`, `bathrooms`, `neighborhood`, `location`, `url`, `platform`, `hash`) VALUES
(1,	'Alquiler De Temporada - Anual O Invernal - Millenium Tower - 3 Dormitorios Y Dependencia - Playa Mansa',	'18000',	'USD',	4,	0,	5,	1,	1,	'https://apartamento.mercadolibre.com.uy/MLU-645689291-alquiler-de-temporada-anual-o-invernal-millenium-tower-3-dormitorios-y-dependencia-playa-mansa-_JM#polycard_client=search-nordic&position=1&search_layout=grid&type=item',	'mercado-libre',	'42832218dc61388b8c5380389af4bb3f'),
(2,	'Alquiler Frente Al Mar (febrero - Carnaval Y Turismo Libre) - 1 Dormitorio Y Medio - 4 Personas - Piscina Y Serv. De Playa - Complejo Lincoln Center',	'3000',	'USD',	1,	0,	1,	1,	1,	'https://apartamento.mercadolibre.com.uy/MLU-697583564-alquiler-frente-al-mar-febrero-carnaval-y-turismo-libre-1-dormitorio-y-medio-4-personas-piscina-y-serv-de-playa-complejo-lincoln-center-_JM#polycard_client=search-nordic&position=2&search_layout=grid&type=item',	'mercado-libre',	'8195f215241eea1e867a24f9809d1043'),
(3,	'Casa En El Golf En Alquiler De Temporada - 8 Dorm En Suite',	'48000',	'USD',	8,	0,	6,	3,	1,	'https://casa.mercadolibre.com.uy/MLU-645734687-casa-en-el-golf-en-alquiler-de-temporada-8-dorm-en-suite-_JM#polycard_client=search-nordic&position=3&search_layout=grid&type=item',	'mercado-libre',	'0560df21f86b595f9ab91bb35e5737b0'),
(4,	'Alquiler De Temporada - Anual O Invernal - Millenium Tower - 3 Dormitorio Y Dependencia - Playa Mansa',	'18000',	'USD',	4,	0,	5,	1,	1,	'https://apartamento.mercadolibre.com.uy/MLU-645631027-alquiler-de-temporada-anual-o-invernal-millenium-tower-3-dormitorio-y-dependencia-playa-mansa-_JM#polycard_client=search-nordic&position=4&search_layout=grid&type=item',	'mercado-libre',	'8a9f4b49601484fdc7f5b42aec45471e'),
(5,	'Alquiler De Verano - Vista Al Mar - Playa Mansa - Frente Al Mar - 3 Dormitorios - Complejo Lincoln Center',	'3500',	'USD',	3,	0,	2,	1,	1,	'https://apartamento.mercadolibre.com.uy/MLU-697451472-alquiler-de-verano-vista-al-mar-playa-mansa-frente-al-mar-3-dormitorios-complejo-lincoln-center-_JM#polycard_client=search-nordic&position=5&search_layout=grid&type=item',	'mercado-libre',	'777856829a4149655c0adbfc1c84b4af'),
(6,	'Apartamento Frente Al Mar - Complejo Lincoln Center - 2 Dorm Y Medio - Vista Al Mar - Todos Los Amenities',	'2800',	'USD',	2,	0,	2,	1,	1,	'https://apartamento.mercadolibre.com.uy/MLU-697451496-apartamento-frente-al-mar-complejo-lincoln-center-2-dorm-y-medio-vista-al-mar-todos-los-amenities-_JM#polycard_client=search-nordic&position=6&search_layout=grid&type=item',	'mercado-libre',	'd1d78f2f7bca0aa4989955d64bebcf52'),
(7,	'Alquiler De Temporada 2025 - Frente Al Mar - Playa Mansa - 3 Dormitorios - Complejo Lincoln Center',	'3000',	'USD',	3,	0,	2,	1,	1,	'https://apartamento.mercadolibre.com.uy/MLU-697574984-alquiler-de-temporada-2025-frente-al-mar-playa-mansa-3-dormitorios-complejo-lincoln-center-_JM#polycard_client=search-nordic&position=7&search_layout=grid&type=item',	'mercado-libre',	'fb5d4d0b9155cf13d2aee13429305c69'),
(8,	'Alquiler Apartamento 4 Dormitorios Y Parrillero Propio En Punta Del Este',	'5500',	'USD',	4,	0,	4,	8,	1,	'https://apartamento.mercadolibre.com.uy/MLU-697699270-alquiler-apartamento-4-dormitorios-y-parrillero-propio-en-punta-del-este-_JM#polycard_client=search-nordic&position=8&search_layout=grid&type=item',	'mercado-libre',	'2157d7011ce6b49d6e8fe94ccdaae4ee'),
(9,	'Alquiler De Temporada - Frente Al Mar - Pent House Duplex - Torre Washington - Playa Mansa - 4 Dormitorios - Complejo Lincoln Center',	'8200',	'USD',	4,	0,	3,	1,	1,	'https://apartamento.mercadolibre.com.uy/MLU-697622334-alquiler-de-temporada-frente-al-mar-pent-house-duplex-torre-washington-playa-mansa-4-dormitorios-complejo-lincoln-center-_JM#polycard_client=search-nordic&position=9&search_layout=grid&type=item',	'mercado-libre',	'35cd144a8acc538ca25dc906c16f4684'),
(10,	'Alquiler De Temporada En Cantegril - 4 Dormitorios - Piscina',	'7000',	'USD',	4,	0,	3,	10,	1,	'https://casa.mercadolibre.com.uy/MLU-697926988-alquiler-de-temporada-en-cantegril-4-dormitorios-piscina-_JM#polycard_client=search-nordic&position=10&search_layout=grid&type=item',	'mercado-libre',	'6602fc1266d95708ee8e81c09afd9a5a'),
(11,	'Apartamento En Alquiler De Temporada ',	'4800',	'USD',	2,	0,	2,	11,	1,	'https://apartamento.mercadolibre.com.uy/MLU-645630413-apartamento-en-alquiler-de-temporada-_JM#polycard_client=search-nordic&position=11&search_layout=grid&type=item',	'mercado-libre',	'860057c7b4833648f23d6a8ddbc87f71'),
(12,	'Alquiler Temporario Apartamento 1 Dormitorio Playa Mansa Punta Del Este',	'4500',	'USD',	1,	0,	1,	12,	1,	'https://apartamento.mercadolibre.com.uy/MLU-697698978-alquiler-temporario-apartamento-1-dormitorio-playa-mansa-punta-del-este-_JM#polycard_client=search-nordic&position=12&search_layout=grid&type=item',	'mercado-libre',	'866d02c938075051f99d721bfb45fa36'),
(13,	'Apartamento En Alquiler En Punta Del Este. Piscina Climatizada, Barbacoa, Play Room.',	'100000',	'USD',	3,	0,	2,	13,	1,	'https://apartamento.mercadolibre.com.uy/MLU-645725755-apartamento-en-alquiler-en-punta-del-este-piscina-climatizada-barbacoa-play-room-_JM#polycard_client=search-nordic&position=13&search_layout=grid&type=item',	'mercado-libre',	'da7bf28bb682e33d47d33e3301da9807'),
(14,	'Venta Apartamento 6 Dormitorios Playa Mansa Con Cochera',	'50000',	'USD',	6,	0,	8,	14,	1,	'https://apartamento.mercadolibre.com.uy/MLU-698185604-venta-apartamento-6-dormitorios-playa-mansa-con-cochera-_JM#polycard_client=search-nordic&position=14&search_layout=grid&type=item',	'mercado-libre',	'410efc02f2ccd10cc2d5862d46110d91'),
(15,	'Alquiler Apto, Excelente Ubicación, Punta Del Este',	'300000',	'USD',	2,	0,	1,	15,	1,	'https://apartamento.mercadolibre.com.uy/MLU-697663238-alquiler-apto-excelente-ubicacion-punta-del-este-_JM#polycard_client=search-nordic&position=15&search_layout=grid&type=item',	'mercado-libre',	'72930349c9e433a4ea817bf56c65d432'),
(16,	'Fragata Frente Al Mar Parada 19 3 Dormitorios Alquiler Temporada Punta Del Este',	'7800',	'USD',	3,	0,	2,	12,	1,	'https://apartamento.mercadolibre.com.uy/MLU-697898222-fragata-frente-al-mar-parada-19-3-dormitorios-alquiler-temporada-punta-del-este-_JM#polycard_client=search-nordic&position=16&search_layout=grid&type=item',	'mercado-libre',	'd79e46a61e0a6f37331b7a78239d1044'),
(17,	'Casa En Alquiler De Temporada  En San Rafael ',	'4375',	'USD',	3,	0,	3,	17,	1,	'https://casa.mercadolibre.com.uy/MLU-697428874-casa-en-alquiler-de-temporada-en-san-rafael-_JM#polycard_client=search-nordic&position=17&search_layout=grid&type=item',	'mercado-libre',	'5c90776c15078122e6f9b43bd389ee49'),
(18,	'Alquiler Temporal Apartamento Con 3 Dormitorios Cerca Del Puerto',	'245000',	'USD',	3,	0,	2,	18,	1,	'https://apartamento.mercadolibre.com.uy/MLU-698224570-alquiler-temporal-apartamento-con-3-dormitorios-cerca-del-puerto-_JM#polycard_client=search-nordic&position=18&search_layout=grid&type=item',	'mercado-libre',	'213713a635ec0d0ce7a2822b7edfbdbd'),
(19,	' Alquiler 3 Dormitorios En Península ',	'3750',	'USD',	3,	0,	3,	19,	1,	'https://apartamento.mercadolibre.com.uy/MLU-697428882-alquiler-3-dormitorios-en-peninsula-_JM#polycard_client=search-nordic&position=19&search_layout=grid&type=item',	'mercado-libre',	'3b289961febcf1e5d7ac9c216a645d2d'),
(20,	'Alquiler De Invierno En Apartamento De 1 Dormitorio En Arcobaleno, Punta Del Este!',	'4000',	'USD',	1,	0,	1,	20,	1,	'https://apartamento.mercadolibre.com.uy/MLU-697365050-alquiler-de-invierno-en-apartamento-de-1-dormitorio-en-arcobaleno-punta-del-este-_JM#polycard_client=search-nordic&position=20&search_layout=grid&type=item',	'mercado-libre',	'129099e3ae30c6bb46a678a463189220'),
(21,	'Dueño Alquila Excelente Apartamento De 3 Dormitorios, Excelente Ubicación, A 1 Cuadra De La Playa',	'180000',	'USD',	3,	0,	3,	21,	1,	'https://apartamento.mercadolibre.com.uy/MLU-697766326-dueno-alquila-excelente-apartamento-de-3-dormitorios-excelente-ubicacion-a-1-cuadra-de-la-playa-_JM#polycard_client=search-nordic&position=21&search_layout=grid&type=item',	'mercado-libre',	'789f34fc1f0edba4bd383767eeea1160'),
(22,	'Apartamento Con Gran Ubicación, Sobre Playa Mansa, Parada 11 ',	'100000',	'USD',	1,	0,	1,	22,	1,	'https://apartamento.mercadolibre.com.uy/MLU-697351224-apartamento-con-gran-ubicacion-sobre-playa-mansa-parada-11-_JM#polycard_client=search-nordic&position=22&search_layout=grid&type=item',	'mercado-libre',	'9dcbacd6b4c624baea6f4819d46c32f9'),
(23,	'Espectacular Casa 100metros De La Playa Mansa.',	'480000',	'USD',	3,	0,	2,	23,	1,	'https://casa.mercadolibre.com.uy/MLU-697846512-espectacular-casa-100metros-de-la-playa-mansa-_JM#polycard_client=search-nordic&position=23&search_layout=grid&type=item',	'mercado-libre',	'4bc28bc82e4c399f3b5338543f9683b2'),
(24,	'Hermosa Vista  Al Mar, Primera Línea, Playa Brava,  Edificio Mare Nostrum',	'160000',	'USD',	3,	0,	2,	24,	1,	'https://apartamento.mercadolibre.com.uy/MLU-645715575-hermosa-vista-al-mar-primera-linea-playa-brava-edificio-mare-nostrum-_JM#polycard_client=search-nordic&position=24&search_layout=grid&type=item',	'mercado-libre',	'ef6a7a858a81f6c06e594f49f537572c'),
(25,	'Penthouse , Monoambiente, Tipo Habitación De Hotel',	'170000',	'USD',	1,	0,	1,	25,	1,	'https://apartamento.mercadolibre.com.uy/MLU-645712761-penthouse-monoambiente-tipo-habitacion-de-hotel-_JM#polycard_client=search-nordic&position=25&search_layout=grid&type=item',	'mercado-libre',	'da617c4f2143e9a0c6b54847de91716e'),
(26,	'Apartamento De 2 Dormitorios Y 2 Baños. Alquiler Temporada',	'250000',	'USD',	2,	0,	2,	26,	1,	'https://apartamento.mercadolibre.com.uy/MLU-645669725-apartamento-de-2-dormitorios-y-2-banos-alquiler-temporada-_JM#polycard_client=search-nordic&position=26&search_layout=grid&type=item',	'mercado-libre',	'618aa23e708ad3b25d65194960d9db05'),
(27,	'Cómoda Casa Para 6 Personas Con Piscina - Barrio Tranquilo Cerca De Las Playas Mansa Y Brava.',	'400000',	'USD',	3,	0,	2,	27,	1,	'https://casa.mercadolibre.com.uy/MLU-645611501-comoda-casa-para-6-personas-con-piscina-barrio-tranquilo-cerca-de-las-playas-mansa-y-brava-_JM#polycard_client=search-nordic&position=27&search_layout=grid&type=item',	'mercado-libre',	'd21e91ce012ca53a5ed192f51280d1a4'),
(28,	'Alquiler Punta Del Este Frente Al Mar Primer Quincena Enero',	'2300',	'USD',	1,	0,	1,	28,	1,	'https://casa.mercadolibre.com.uy/MLU-697442402-alquiler-punta-del-este-frente-al-mar-primer-quincena-enero-_JM#polycard_client=search-nordic&position=28&search_layout=grid&type=item',	'mercado-libre',	'2e590d00a4b3f45b22d5da0389f4db72'),
(29,	'Alquiler De Apartamento En Punta Del Este Frente Al Mar.',	'245000',	'USD',	2,	0,	2,	29,	1,	'https://apartamento.mercadolibre.com.uy/MLU-697439806-alquiler-de-apartamento-en-punta-del-este-frente-al-mar-_JM#polycard_client=search-nordic&position=29&search_layout=grid&type=item',	'mercado-libre',	'ce64a99ced24a498bf4397d5d858837d'),
(30,	'Cabaña Pinares 3d Y 1/2. 2 Bñ, Parque Bbcoa,cerco,5 Del Mar',	'200000',	'USD',	4,	0,	2,	30,	1,	'https://casa.mercadolibre.com.uy/MLU-697325740-cabana-pinares-3d-y-12-2-bn-parque-bbcoacerco5-del-mar-_JM#polycard_client=search-nordic&position=30&search_layout=grid&type=item',	'mercado-libre',	'0aae697adfacb51da633c3d1f384ef93'),
(31,	'Av. Roosevelt Y Parada 12 ',	'2000',	'UYU',	2,	0,	2,	31,	1,	'https://apartamento.mercadolibre.com.uy/MLU-697310884-av-roosevelt-y-parada-12-_JM#polycard_client=search-nordic&position=31&search_layout=grid&type=item',	'mercado-libre',	'21a332f015814ecad10c50b831fb9077'),
(32,	'Apartamento 1 Dormitorio Con Vista Al Mar',	'385000',	'USD',	1,	0,	1,	32,	1,	'https://apartamento.mercadolibre.com.uy/MLU-697837000-apartamento-1-dormitorio-con-vista-al-mar-_JM#polycard_client=search-nordic&position=32&search_layout=grid&type=item',	'mercado-libre',	'35f04936cabfe7c834bdff12922eb5d3'),
(33,	'Alquiler Temporada',	'150000',	'USD',	1,	0,	1,	33,	1,	'https://apartamento.mercadolibre.com.uy/MLU-697426336-alquiler-temporada-_JM#polycard_client=search-nordic&position=33&search_layout=grid&type=item',	'mercado-libre',	'690c0c46972c78c4efc07fc9b7c6495c'),
(34,	'Casa De Muy Buena Construcción, A 4 Cuadras De La Playa. En P 39 De Pinares, 5 Dormitorios, Desde Usd 160',	'160000',	'USD',	5,	0,	3,	34,	1,	'https://casa.mercadolibre.com.uy/MLU-694214930-casa-de-muy-buena-construccion-a-4-cuadras-de-la-playa-en-p-39-de-pinares-5-dormitorios-desde-usd-160-_JM#polycard_client=search-nordic&position=34&search_layout=grid&type=item',	'mercado-libre',	'bbdbd493cbb04187bd3fb9f3a33a32f3'),
(35,	'Moderno, Comodo & Seguro Disfruta Punta Dia Y Noche!!!',	'70000',	'USD',	1,	0,	1,	35,	1,	'https://apartamento.mercadolibre.com.uy/MLU-696890928-moderno-comodo-seguro-disfruta-punta-dia-y-noche-_JM#polycard_client=search-nordic&position=35&search_layout=grid&type=item',	'mercado-libre',	'1c7e9f4af533ddf1296b111b8bb47af1'),
(36,	'Alquiler En Punta Del Este - 3 Dormitorios + 2 Baños - Cerca De Todo',	'4600',	'USD',	3,	0,	2,	36,	1,	'https://apartamento.mercadolibre.com.uy/MLU-665428244-alquiler-en-punta-del-este-3-dormitorios-2-banos-cerca-de-todo-_JM#polycard_client=search-nordic&position=36&search_layout=grid&type=item',	'mercado-libre',	'f85ce99e9eafb377d747af2e11e0a642'),
(37,	'Casa Muy Acogedora Para Alquiler Temporal Enero Y Febrero. ',	'1000',	'USD',	2,	0,	1,	37,	1,	'https://casa.mercadolibre.com.uy/MLU-645059773-casa-muy-acogedora-para-alquiler-temporal-enero-y-febrero-_JM#polycard_client=search-nordic&position=37&search_layout=grid&type=item',	'mercado-libre',	'4749270ecdf5f3f774a251a0a4a7571d'),
(38,	'Dueño Alquila Parada Siete, Playa Mansa Punta Del Este Vista Al Mar',	'100000',	'USD',	1,	0,	1,	38,	1,	'https://apartamento.mercadolibre.com.uy/MLU-645617133-dueno-alquila-parada-siete-playa-mansa-punta-del-este-vista-al-mar-_JM#polycard_client=search-nordic&position=38&search_layout=grid&type=item',	'mercado-libre',	'8384460d7200470ed246f82d46504e1d'),
(39,	'Hermoso Apartamento Con Vista Al Mar En Playa Mansa',	'9900',	'USD',	2,	0,	2,	14,	1,	'https://apartamento.mercadolibre.com.uy/MLU-644893443-hermoso-apartamento-con-vista-al-mar-en-playa-mansa-_JM#polycard_client=search-nordic&position=39&search_layout=grid&type=item',	'mercado-libre',	'807d5625f4d1599452d35fa346b10bad'),
(40,	'Alquiler Frente Al Mar - 2 Dormitorios Y Medio - Mansa - Complejo Lincoln Center ',	'5500',	'USD',	2,	0,	2,	1,	1,	'https://apartamento.mercadolibre.com.uy/MLU-663067018-alquiler-frente-al-mar-2-dormitorios-y-medio-mansa-complejo-lincoln-center-_JM#polycard_client=search-nordic&position=40&search_layout=grid&type=item',	'mercado-libre',	'19720579e4ea80c0ccbbdbe6f1cd11e6'),
(41,	'Apartamento En Alquiler De Temporada - Mansa - 2 Dormitorios - Piscina Y Servicio De Playa - Complejo Lincoln Center',	'2500',	'USD',	2,	0,	2,	1,	1,	'https://apartamento.mercadolibre.com.uy/MLU-653858500-apartamento-en-alquiler-de-temporada-mansa-2-dormitorios-piscina-y-servicio-de-playa-complejo-lincoln-center-_JM#polycard_client=search-nordic&position=41&search_layout=grid&type=item',	'mercado-libre',	'b5f3bce70fa11f1c3bea0efe4a6667e8'),
(42,	'Alquiler De Invierno 2 Dormitorios One Tower -  Punta Del Este',	'160000',	'USD',	2,	0,	3,	42,	1,	'https://apartamento.mercadolibre.com.uy/MLU-671830920-alquiler-de-invierno-2-dormitorios-one-tower-punta-del-este-_JM#polycard_client=search-nordic&position=42&search_layout=grid&type=item',	'mercado-libre',	'c3c5d4c6515ddbd747bbf56ccd79ef00'),
(43,	'Alquiler De Verano 2025 - Ideal Para Familia - Con Amenities - Playa Mansa - Complejo Lincoln Center - Torre Jefferson',	'1500',	'USD',	3,	0,	3,	1,	1,	'https://apartamento.mercadolibre.com.uy/MLU-634350989-alquiler-de-verano-2025-ideal-para-familia-con-amenities-playa-mansa-complejo-lincoln-center-torre-jefferson-_JM#polycard_client=search-nordic&position=43&search_layout=grid&type=item',	'mercado-libre',	'02a18699580aeeee8f1ffe3cd20e4448'),
(44,	'Alquiler De Temporada (febrero Y Carnaval) - Frente Al Mar - Torre Washington - 3 Dormitorios - Playa Mansa',	'2000',	'USD',	3,	0,	3,	1,	1,	'https://apartamento.mercadolibre.com.uy/MLU-683087382-alquiler-de-temporada-febrero-y-carnaval-frente-al-mar-torre-washington-3-dormitorios-playa-mansa-_JM#polycard_client=search-nordic&position=44&search_layout=grid&type=item',	'mercado-libre',	'c63dbc6b33c8683f6276b8272155566b'),
(45,	'Alquiler Frente Al Mar (febrero Y Carnaval) - Playa Mansa - 3 Dormitorios - Todos Los Amenities - Complejo Lincoln Center',	'2500',	'USD',	3,	0,	3,	1,	1,	'https://apartamento.mercadolibre.com.uy/MLU-640663724-alquiler-frente-al-mar-febrero-y-carnaval-playa-mansa-3-dormitorios-todos-los-amenities-complejo-lincoln-center-_JM#polycard_client=search-nordic&position=45&search_layout=grid&type=item',	'mercado-libre',	'737d7158b85203ce3f24e541d9b37b3e'),
(46,	'Alquiler De Temporada - Edificio Fragata - Frente Al Mar - 3 Dormitorios - Todos Los Amenities',	'6000',	'USD',	3,	0,	2,	46,	1,	'https://apartamento.mercadolibre.com.uy/MLU-682782182-alquiler-de-temporada-edificio-fragata-frente-al-mar-3-dormitorios-todos-los-amenities-_JM#polycard_client=search-nordic&position=46&search_layout=grid&type=item',	'mercado-libre',	'ac18d6e2494ede3b770beb787a4551b8'),
(47,	'Casa Alquiler 4 Dormitorios Más Dependencia Brava Punta Del Este ',	'3000',	'USD',	4,	0,	3,	47,	1,	'https://casa.mercadolibre.com.uy/MLU-664776980-casa-alquiler-4-dormitorios-mas-dependencia-brava-punta-del-este-_JM#polycard_client=search-nordic&position=47&search_layout=grid&type=item',	'mercado-libre',	'25a8ed8f689cd08b6e8ce409b39a9982'),
(48,	'Casa En Alquiler De Verano - Playa Mansa - 5 Dormitorios - Piscina',	'6000',	'USD',	5,	0,	4,	48,	1,	'https://casa.mercadolibre.com.uy/MLU-692603938-casa-en-alquiler-de-verano-playa-mansa-5-dormitorios-piscina-_JM#polycard_client=search-nordic&position=48&search_layout=grid&type=item',	'mercado-libre',	'c77677854cc0db9cca9c92656549fa3f'),
(49,	'Muy Lindo Apartamento 3 Dormitorios Península A Pasos Del Mar! Alquiler Temporal',	'367',	'USD',	3,	6,	3,	18,	1,	'https://www.infocasas.com.uy/muy-lindo-apartamento-3-dormitorios-pennsula-a-pasos-del-mar-alquiler-temporal/190552135',	'info-casas',	'562419892675ba33cbe045b9377ccf21'),
(50,	'Departamento de 1 dormitorio en alquiler Anual Punta del Este',	'115',	'USD',	1,	0,	1,	242,	1,	'https://www.infocasas.com.uy/departamento-de-1-dormitorio-en-alquiler-anual-punta-del-este/190746375',	'info-casas',	'ad0d4296a8f7d6cf038eda73523ef58e'),
(51,	'Bruma',	NULL,	'UYU',	5,	9,	3,	243,	1,	'https://www.infocasas.com.uy/bruma/214395',	'info-casas',	'db11e0674db608e19483f9d2cf2537a7'),
(52,	'Agostino Bertani ',	'1.000',	'USD',	5,	10,	3,	244,	1,	'https://www.infocasas.com.uy/agostino-bertani/191170153',	'info-casas',	'caf0e8f4118066316d4f514c34ed45ad'),
(53,	'Cabaña',	'1.500',	'USD',	2,	4,	1,	245,	1,	'https://www.infocasas.com.uy/cabaa/190706019',	'info-casas',	'7cea7ea4b65ed7d8eae6b75f13ec40a2'),
(54,	'\"Hermosa casa en barrio Pinares para tus próximas vacaciones \"',	'5.000',	'USD',	4,	8,	3,	243,	1,	'https://www.infocasas.com.uy/hermosa-casa-en-barrio-pinares-para-tus-prximas-vacaciones/191378255',	'info-casas',	'91baefc1874098a312a2a0c6aed99e85'),
(55,	'Espectacular ubicación y vista al mar',	'180',	'USD',	1,	0,	1,	247,	1,	'https://www.infocasas.com.uy/espectacular-ubicacin-y-vista-al-mar/191604382',	'info-casas',	'b021a5bfb3c7389d5c07ffd8c716c1d7'),
(56,	'Apartamento en Alquiler Temporada - Zona Roosevelt Ref. 6149',	'167',	'USD',	1,	0,	1,	248,	1,	'https://www.infocasas.com.uy/apartamento-en-alquiler-temporada-zona-roosevelt-ref-6149/191121869',	'info-casas',	'8bd79bc1cb5ddbfd6a719319f93f6ded'),
(57,	'Casa en Alquiler Anual - Zona Pinares Ref. 6020',	'334',	'USD',	4,	0,	3,	249,	1,	'https://www.infocasas.com.uy/casa-en-alquiler-anual-zona-pinares-ref-6020/191041836',	'info-casas',	'f12495abc58f337ea462d1d384b2d487'),
(58,	'Punta del Este Pinares nueva 2 dorm 2 baños   toda cercada parrillero techado',	'180',	'USD',	2,	5,	2,	245,	1,	'https://www.infocasas.com.uy/punta-del-este-pinares-nueva-2-dorm-2-baos-toda-cercada-parrillero-techado/191564448',	'info-casas',	'43556d5ea0cdb0e4cba3ecb56b9591ec'),
(59,	'HERMOSA CASA EN EL CORAZON DE RINCON DEL INDIO. A 300METROS DE LA PLAYA',	'400',	'USD',	3,	8,	2,	251,	1,	'https://www.infocasas.com.uy/hermosa-casa-en-el-corazon-de-rincon-del-indio-a-300metros-de-la-playa/191595722',	'info-casas',	'1ed5a7517623d28cc3461a7fa3d1607f'),
(60,	'Alquiler casa en Punta del Este.Temporada Alta.',	'180',	'USD',	1,	3,	1,	8,	1,	'https://www.infocasas.com.uy/alquiler-casa-en-punta-del-estetemporada-alta/191594243',	'info-casas',	'831324d468aa97aeb245e436393b1789'),
(61,	'Hermoso apartamento en Maldonado',	'150',	'USD',	1,	3,	1,	248,	1,	'https://www.infocasas.com.uy/hermoso-apartamento-en-maldonado/227323',	'info-casas',	'ef74cd2885265c91c9806ef28d1aaf2e'),
(62,	'TALUJU Diciembre disponible',	NULL,	'UYU',	4,	8,	2,	14,	1,	'https://www.infocasas.com.uy/taluju-diciembre-disponible/216897',	'info-casas',	'af4acb983983120cfa3cd05fd537c821'),
(63,	'HERMOSO APTO TOTALMENTE RESTAURADO, ENERO 2025, 1A QUINCENA,  A 2 c del CONRAD',	'229',	'USD',	3,	5,	2,	8,	1,	'https://www.infocasas.com.uy/hermoso-apto-totalmente-restaurado-enero-2025-1a-quincena-a-2-c-del-conrad/191587196',	'info-casas',	'ae43bbb15ddc3e67d48709abf607129d'),
(64,	'Más que en casa',	'200',	'USD',	3,	6,	2,	245,	1,	'https://www.infocasas.com.uy/ms-que-en-casa/187386014',	'info-casas',	'b7008107723b2e5e8bd08445d8533091'),
(65,	'Apto a estrenar frente al mar',	'20.020',	'USD',	2,	4,	1,	243,	1,	'https://www.infocasas.com.uy/apto-a-estrenar-frente-al-mar/191569476',	'info-casas',	'1af39e53b3e41a3bb56ba1fe9dc2e807'),
(66,	'Gran Apartamento, con la comodidad de una casa y la seguridad un apartamento.',	NULL,	'UYU',	4,	8,	3,	14,	1,	'https://www.infocasas.com.uy/gran-apartamento-con-la-comodidad-de-una-casa-y-la-seguridad-un-apartamento/185541919',	'info-casas',	'f13f6ae51b7e84442720a479856551e7'),
(67,	'Casa De 2 Dormitorios, Living Comedor Con Cocina, Parrillero',	'590',	'USD',	2,	5,	1,	245,	1,	'https://www.infocasas.com.uy/casa-de-2-dormitorios-living-comedor-con-cocina-parrillero/187263994',	'info-casas',	'75e1ee95e73f1e9847783527438e4edf'),
(68,	'Casa de huéspedes en un amplio ambiente único',	'150',	'USD',	0,	2,	1,	245,	1,	'https://www.infocasas.com.uy/casa-de-huspedes-en-un-amplio-ambiente-nico/189496405',	'info-casas',	'5ea496fccf1fc7820fdbf958d98f6aa8'),
(69,	'Precioso departamento en Punta del Este a 50 mts de la playa mansa.',	'450',	'USD',	3,	6,	2,	14,	1,	'https://www.infocasas.com.uy/precioso-departamento-en-punta-del-este-a-50-mts-de-la-playa-mansa/191580391',	'info-casas',	'd2989c68c8d65c3078499de608b5621d');

-- 2024-10-25 23:05:59
