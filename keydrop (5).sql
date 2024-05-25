-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Maj 19, 2024 at 03:10 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `keydrop`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `inventory`
--

CREATE TABLE `inventory` (
  `id` tinyint(4) NOT NULL,
  `player_id` smallint(6) NOT NULL,
  `skin_id` smallint(6) NOT NULL,
  `amount` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `player_id`, `skin_id`, `amount`) VALUES
(1, 107, 11, 1),
(2, 72, 12, 1),
(3, 72, 13, 1),
(4, 72, 14, 1),
(5, 72, 15, 1),
(6, 72, 16, 1),
(7, 72, 17, 1),
(8, 72, 18, 1),
(9, 72, 19, 1),
(10, 72, 20, 1),
(11, 72, 21, 1),
(12, 72, 22, 1),
(13, 72, 23, 1),
(14, 72, 24, 1),
(15, 72, 25, 1),
(16, 72, 26, 1),
(17, 122, 27, 1),
(18, 123, 71, 1),
(97, 123, 51, 0),
(107, 123, 67, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `skin`
--

CREATE TABLE `skin` (
  `Id` smallint(6) NOT NULL,
  `Name` tinytext NOT NULL,
  `Stattrack` tinyint(1) NOT NULL,
  `img` text NOT NULL,
  `price` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `skin`
--

INSERT INTO `skin` (`Id`, `Name`, `Stattrack`, `img`, `price`) VALUES
(1, 'SCAR-20 | Green Marine', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_scar20_gs_scar20_peacemaker03_light_large.061f9ac2ff0a040f6fcc296c451c09fe2e198f83.png', 1),
(2, 'MAG-7 | Cobalt Core', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mag7_cu_mag7_myrcene_light_large.7cd0ed89db7accc44d3289f9f1529e0a75f4643e.png', 1),
(3, 'MAC-10 | Rangeen', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_cu_mac10_alekhya_duo_light_large.7173900a6b75cee250a55197483cba3c0204b955.png', 1),
(4, 'XM1014 | Scumbria', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_aq_xm1014_scumbria_light_large.b8e79b3c4391784151d789edde360dbaaef7fd1f.png', 1),
(5, 'FAMAS | Survivor Z', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_famas_cu_famas_lenta_light_large.7ab508a407e56ab541dae127ef5fc64f09f6ae08.png', 1),
(6, 'MAC-10 | Light Box', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_gs_glock18_wrathys_light_large.8cf4aba20d193a1646b378a3d04a6fee3f66724c.png', 1),
(7, 'MP7 | Special Delivery', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_cu_dualberretta_dragons_light_large.2742674cbf237d1ba5fb6ed9f0d90e00a03570f9.png', 1),
(8, 'M249 | Nebula Crusader', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp7_cu_mp7_classified_light_large.231ba61751c2976258bf96b3d1db5ae6ecb03b95.png', 4),
(9, 'P250 | Wingshot', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m249_gs_m249_nebula_crusader_light_large.60f60c9e8203575e3e3f5574db51132e2b2fe7c7.png', 4),
(11, 'Galil AR | Stone Cold', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_gs_galil_nightwing_light_large.bc71fb0b9102f22348f39015b7de5affd60829e0.png', 5),
(12, 'G3SG1 | Flux', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_g3sg1_gs_g3sg1_flux_purple_light_large.6ed40e104625c9607e7df5ee60373a19d3dae634.png', 32),
(13, 'SSG 08 | Big Iron', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ssg08_cu_ssg08_technicality_light_large.1a057a14ca191ce12629e06217cbe86097444b03.png', 33),
(14, 'AK-47 | Frontside Misty', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_cu_ak47_winter_sport_light_large.785a08aecd996dcffc6f38373fdc73697e601a6a.png', 40),
(15, 'M4A1-S | Golden Coil', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_silencer_gs_m4a1s_snakebite_gold_light_large.574ace77e1044dbf3a387f200b2867332e974f70.png', 172),
(16, 'USP-S | Kill Confirmed', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_cu_usp_kill_confirmed_light_large.a3a7b8f19c9fb931b18c1edd7dd21d44e2c3c2e0.png', 166),
(17, 'Knife', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_knife_push_aa_fade_light_large.f73d939a3358a126ffbb7b93c9f87b9b78a6c78f.png', 1400),
(18, 'Dual Berettas | Hideout', 0, 'https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpos7asPwJf1-bJfQJA6c6zgJSKhMj4Nq_Zl2du79d4hNbN_Iv9nBrg-kBlNTqnLNKTIQdqNA6D8gDrxebvjcW66pnOyiNl7ikh4HvfmETln1gSOUP_d83o/512fx384f', 1),
(19, 'Nova | Dark Sigil', 0, 'https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpouLWzKjhu3OXJTjlQ7de9lZK0m_7zO6-fzj8C7sYhiLiR94702QDn_UJrNmv2dYLDcFU8ZVrX_1frlennjcC97oOJlyX_Py1n0g/512fx384f', 1),
(20, 'Tec-9 | Slag', 0, 'https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpoor-mcjh01vCRTjdX4tevlZKPqPL6NLLfk25D4ct2teXI8oThxg3sqUppZzrxJ4SVewRoMFHU8gW4ku69gZDo75mcz3oysnNztHjbnBCpwUYb_AiXdm0/512fx384f', 1),
(21, 'UMP-45 | Motorized', 0, 'https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpoo7e1f1Jfxv7YJWh97c-lkY2Jm_LwDL7fkWJf7fp9g-7J4cKn0Qaxr0c6YmumI4GVdlBtN1rZr1G8k-zm1sW-6J3PzXUyvScm5SyPgVXp1qY5rykn/512fx384f', 1),
(22, 'XM1014 | Irezumi', 0, 'https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgporrf0e1Y07OvFIG0TuOO_hoWRgvr9DLfYkWNFpsMk2LjH8dis2Abg8xA4YDr7ctWVdAM5ZFHY-1K8xrzn1sTv6szPyCN9-n51nuU3Vic/512fx384f', 1),
(23, 'SSG 08 | Dezastre', 0, 'https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpopamie19fwODPIWV96NmslZOfhfLLP7LWnn8f6pAm2-yV9NWt2AG3rkc-YjzzcoOUIwE2aA7Q_VG_lenrgMe-6smYmGwj5HfHgtJwGw/512fx384fs', 1),
(24, 'MAC-10 | Light Box', 0, 'https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpou7umeldf3vLLIG195dC6gZOCmPnLP7LWnn8f7cR3ibuXp9WkiQO3_kM_Nm-hJYXDcQ9tMgrYqFTvk-vo0cDq6pqcm2wj5HfOKwrF1Q/512fx384f', 1),
(25, 'Sawed-Off | Analog Input', 0, 'https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpopbuyLgNv1fX3YjxV6di5koa0kPb5NqnummJW4NE_2u-Yrd6i2AG3_BJtMmv0IoWSIFc4ZgqG_VbvlOe90cO8tZycnyA3uj5iuyhcVi1dpA/512fx384f', 5),
(26, 'Five-SeveN | Hybrid', 0, 'https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgposLOzLhRlxfbGTjtL-tmlkZaOmcj8KrnDn29u5Mx2gv2P8Y-k2VDj8kRlMWmnJdOQegVtYlvWqQW-kr261sS86czOzHc2viAh52GdwUK44ejvSA/512fx384f', 5),
(27, 'MP7 | Just Smile', 0, 'https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpou6ryFApwhMzCZC5W08-7nYyOqPv9NLPF2DkCv50ij7nD84j03QeyrURqam3yLISVegI3Mw2Bq1S9wr_q08Dq6cvXiSw0jpWIZ4I/512fx384f', 4),
(28, 'M4A4 | Etch Lord', 0, 'https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpou-6kejhth_KcTi5M7dezlomfksj4OrzZgiUAvJMojL6W9omsjgHirkNkZGqhdYfAdFQ7YlDR-1XswL3vgZa678ic1zI97V2YJQr8/512fx384f', 4),
(29, 'Glock-18 | Block-18', 0, 'https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgposbaqKAxf1P_HcjZ97s6_l4u0mvj6N6nYl2Vu5Mx2gv2Pp9jxjAa3r0JtZz-icNTAcAI9aQrU-wW-yenmhJG8tZiaynRk63YgtmGdwUJc6eYXpA/512fx384f', 5),
(30, 'USP-S | Jawbreaker', 0, 'https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpoo6m1FBRp3_bGcjhQ08mlhJO0k_jzNKLummJW4NE_iLGVpN-n3Qfs-RFtY2DzIo-TIFM8Ml7Zqwfow7js08W-vprAn3I16T5iuygX9mc8ew/512fx384f', 34),
(31, 'Zeus x27 | Olympus', 0, 'https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpooru2LhVfyfbdYgJW5Mm4kIWZqPD7N4Tdn2xZ_It12-iSp4r00AGw-xFtZT2gIofAd1c4NVzYq1Lvybrt1JC-vZnMwCFmpGB8spRMR_rC/512fx384f', 34),
(32, 'M4A1-S | Black Lotus', 0, 'https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpou-6kejhz2v_Nfz5H_uO7wIHahMj2P7rSnVRd59FkmdbN_Iv9nBrg8hdram6gJoGRdAE_ZVqC_FS2l-68gcW06ZibnCNj7Cgk4X2Olh3hn1gSOQ4iuyOq/512fx384f', 65),
(33, 'AWP | Chrome Cannon', 0, 'https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpot621FAZ3w8zcdDBS6c6zkL-HnvD8J_XTxW0Bu5Vy0-iYp9Xx0Vex_UA9aj2iIdPHewM9MljXr1Lqwuvn1Mftot2XnrCoW5Yv/512fx384f', 192),
(34, 'AK-47 | Inheritance', 0, 'https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpot7HxfDhh2MzYfi9B6dC3nY60m_7zO6-fzjwHvJEn2OqWotmi3gXt_BVtYD-ncIWcIA85YV-ErwK-ley-18e06oOJlyU3nvbOMA/512fx384f', 325),
(35, 'Knife', 0, 'https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQh5hlcX0nvUOGsx8DdQBJjIAVHubSaIAlp1fb3eihJ_tX4ktCPwfTwZbqDkG9Q7J1yjuvFoNim2wCx_BI4az37dtKSelA5YF3UrE_-n7m6gqgBBA/512fx384f', 5300),
(36, 'Sawed-Off | Black Sand', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sawedoff_cu_sawedoff_black_sand_light_large.7ed9ce5083489c0fdf92814f0ebf6945ec6f29d4.png', 1),
(37, 'Nova | Wood Fired', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_nova_gs_nova_hunter_brute_light_large.8e2520f25098056ccd03b679859458fdc006c0a7.png', 1),
(38, 'MP9 | Modest Threat', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp9_gs_mp9_colony01_light_large.f8d9792131b786025a960ddeda2eeb77f97c55e3.png', 1),
(39, 'SG 553 | Danger Close', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sg556_gs_sg553_over_heated_light_large.aba3188360b2a87b8687d73af6c2e3034290402c.png', 1),
(40, 'Glock-18 | Oxide Blaze', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_cu_glock18_corroden_light_large.68906a0523399b599555746b51db2ffac29c5db5.png', 1),
(41, 'Tec-9 | Fubar', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_tec9_gs_tec9_fubar_light_large.00f64007983561f57c808b23e9260ebea6437bc7.png', 1),
(42, 'G3SG1 | Scavenger', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_g3sg1_gs_g3sg1_savage_light_large.e452574f580f51b1da6312c0f80a0dc07e073d8b.png', 2),
(43, 'Galil AR | Signal', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_hy_galil_signal_red_light_large.d7c26f54fd72ec451094ea7791e921346e013197.png', 2),
(44, 'MAC-10 | Pipe Down', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_gs_mac10_exo_pipes_light_large.355aad3fa1602f8e682a5663f72b12feba0d4cf2.png', 2),
(45, 'USP-S | Flashback', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_usp_silencer_cu_usp_flashback_light_large.47e10129af33303bac557560400c33e4fe555680.png', 2),
(46, 'UMP-45 | Momentum', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ump45_cu_ump_arrows_light_large.83f1e692bdafa92f29ce15aebb02502c9e70f276.png', 17),
(47, 'MP5-SD | Phosphor', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp5sd_gs_mp5_festival_drip_light_large.c71af0a784e5ecd6e5d5f2f71961be155e283cde.png', 16),
(48, 'Desert Eagle | Mecha Industries', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_gs_deagle_mecha_light_large.e08c1fd8709f6b368956c41c68b17c15ff635635.png', 17),
(49, 'AWP | Neo-Noir', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_cu_awp_neonoir_light_large.c5dd57f8555d13c41f08024f27a9314074b698af.png', 105),
(50, 'AK-47 | Asiimov', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_cu_ak47_asiimov_light_large.665fc3b83c8046398787a57d2ef7a9d938244820.png', 100),
(51, 'Knife', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_knife_ursus_aa_fade_light_large.0b6899d17a60306b6279e6fbee981acb530665fc.png', 1232),
(52, 'MP7 | Armor Core', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp7_aq_mp7_ultramodern_light_large.5351e1926e4a9599d149c4941a8603f4143ff999.png', 1),
(53, 'Negev | Man-o\'-war', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_negev_am_negev_glory_light_large.11ebbe525e92bd0a56dd4d3a7795a31a01823ba7.png', 1),
(54, 'Sawed-Off | Origami', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sawedoff_cu_sawedoff_origami_light_large.5f1b3cef6d518cda69daafddd9b2c240a29cf0cc.png', 1),
(55, 'P250 | Valence', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_aq_p250_contour_light_large.faf5b305c68d8ea23814163b0a69dafa7318b818.png', 1),
(56, 'Desert Eagle | Bronze Deco', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_am_bronze_sparkle_light_large.42dc1d2bae9e586f75d6425f94a195014891533b.png', 1),
(57, 'AK-47 | Elite Build', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_cu_ak47_mastery_light_large.4305c0ba4b02ce531fc08c275fa6a9d87da2cf7e.png', 4),
(58, 'UMP-45 | Grand Prix', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ump45_am_ump_racer_light_large.6d935bf0d33ca90994b1dd9aec78a8938dcd94a2.png', 2),
(59, 'CZ75-Auto | Pole Position', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_cz75a_cu_cz75_precision_light_large.a0d0ea9d92ff9c535cbdaa9c07a1a95a5181a82b.png', 2),
(60, 'MAG-7 | Heat', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mag7_cu_mag7_redhot_light_large.76087a836e8c98fd10765a4b56dca946ba5acb4d.png', 2),
(61, 'AWP | Worm God', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_aq_awp_twine_light_large.f976c41b8f978d2b8d13734f14f6586982d859f1.png', 6),
(62, 'FAMAS | Djinn', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_famas_aq_famas_jinn_light_large.a0e1b8e2a572c5e3d6472181d4a0d6ce7f51139f.png', 6),
(63, 'Five-SeveN | Monkey Business', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_fiveseven_cu_fiveseven_banana_light_large.2d78a6614cb329ada893c8d028eb5c2b485f26f0.png', 8),
(64, 'Galil AR | Eco', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_cu_galil_eco_light_large.7f64e2d77423b3c4263a74caeda18383c2e487d5.png', 10),
(65, 'MAC-10 | Neon Rider', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_cu_mac10_neonrider_light_large.4ba82cf2ba2d9fdc694d707b563421bbcc20b174.png', 28),
(66, 'M4A1-S | Hyper Beast', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_silencer_cu_m4a1_hyper_beast_light_large.31850937661935a062d5f6faf5a1f02fdb90b861.png', 56),
(67, 'Knife', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_knife_m9_bayonet_an_tiger_orange_light_large.49d5afb6d7f17cb0b384be1416a9533841174ac5.png', 3595),
(68, 'M249 | System Lock', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m249_cu_m249_sektor_light_large.c957e70c656024b2c062f7af2031a76cb3c83f1c.png', 1),
(69, 'SCAR-20 | Grotto', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_scar20_aq_scar20_leak_light_large.06b9231638ba347e91c671ecf2c1364754794893.png', 1),
(70, 'XM1014 | Quicksilver', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_xm1014_aq_xm1014_sigla_light_large.71c180cd3b8bdea7d0b119ab2b9d54792c51b3aa.png', 1),
(71, 'Glock-18 | Catacombs', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_glock_cu_glock_deathtoll_light_large.cfcc6a17037a33bbb524ca1856c07cf76dda449d.png', 1),
(72, 'MP9 | Deadly Poison', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mp9_cu_mp9_deadly_poison_light_large.0776976e709ec7b503dd7e47b8c962338615b5da.png', 1),
(73, 'Sawed-Off | Serenity', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_sawedoff_cu_sawedoff_deva_light_large.9ffde04f2f082dce492b2fa6e250f69f538a50b5.png', 6),
(74, 'Dual Berettas | Urban Shock', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_elite_cu_elites_urbanstorm_light_large.d33c9dd65434d8b9f4e7b5092fcc2e07a874e625.png', 5),
(75, 'MAC-10 | Malachite', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_mac10_am_mac10_malachite_light_large.65b0eff12e655fb94ec9de545348178f1a5d60e0.png', 6),
(76, 'Desert Eagle | Naga', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_deagle_aq_deagle_naga_light_large.b410ad835b1894a448676ae0590586298af2cb33.png', 6),
(77, 'P250 | Muertos', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_p250_cu_p250_mandala_light_large.0acb51464cd72643c6a1fefaf8736288eb5d02f7.png', 19),
(78, 'M4A4 | 龍王 (Dragon King)', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_m4a1_cu_m4a4_ancestral_light_large.cbd9732689f42b7aec91bdb9166b1ee414974cb7.png', 26),
(79, 'AK-47 | Cartel', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_ak47_aq_ak47_cartel_light_large.2e7be9f4c7bda304f2a7c374260d95affca93f0b.png', 50),
(80, 'AWP | Man-o\'-war', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_awp_am_awp_glory_light_large.348eae0f5d4da8671886826648dd4197a9829090.png', 178),
(81, 'Galil AR | Chatterbox', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_galilar_cu_galil_abrasion_light_large.8398e4836a0c26add3514a6af2262704d85fec07.png', 36),
(82, 'Knife', 0, 'https://steamcdn-a.akamaihd.net/apps/730/icons/econ/default_generated/weapon_knife_m9_bayonet_an_tiger_orange_light_large.49d5afb6d7f17cb0b384be1416a9533841174ac5.png', 3567);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tokeny`
--

CREATE TABLE `tokeny` (
  `id` int(11) NOT NULL,
  `token` varchar(60) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tokeny`
--

INSERT INTO `tokeny` (`id`, `token`, `create_time`) VALUES
(76, 'f6efb707f20d91abb6a3af58eba8c39c5207c601', '2024-04-08 19:25:00'),
(77, 'e21a760e2d8010508f073e657c4b56ca62523ac4', '2024-04-08 19:31:17'),
(78, 'b3aaaea2b98c9a68ef18b0b7ca724dd5ccc3d168', '2024-04-08 19:33:23'),
(88, '3adf5247d0bd900654f7e5de94894f911341496f', '2024-04-08 19:53:35'),
(89, '98cf59868dc5b29ea80f0d0fbb0bc7a2fec4e05a', '2024-04-08 19:53:40'),
(108, '5798fe1b7d68f9d10a1d2efc1687a74d85715d5f', '2024-04-08 21:54:46'),
(113, '3155bdbde0ecc16d530dc2d9affc27be79bf3353', '2024-04-08 22:57:12'),
(118, 'dc4728c8a63c233139304d5f7fd12c4e15a07c2c', '2024-04-08 23:05:10'),
(123, 'f175f3dc328fa33966b1c5e74416a9d01421cfb4', '2024-05-17 18:03:30');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `Id` smallint(6) NOT NULL,
  `Nick` tinytext NOT NULL,
  `Age` tinyint(3) NOT NULL,
  `Password` tinytext NOT NULL,
  `money` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Id`, `Nick`, `Age`, `Password`, `money`) VALUES
(122, 'Test', 23, 'test', 100),
(123, 'admin', 23, '123', 22032),
(124, 'Test234', 23, 'test', 100);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `skin`
--
ALTER TABLE `skin`
  ADD PRIMARY KEY (`Id`);

--
-- Indeksy dla tabeli `tokeny`
--
ALTER TABLE `tokeny`
  ADD UNIQUE KEY `id` (`id`,`token`),
  ADD UNIQUE KEY `id_2` (`id`,`token`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `skin`
--
ALTER TABLE `skin`
  MODIFY `Id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `Id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
