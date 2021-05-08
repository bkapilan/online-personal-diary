-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 13, 2019 at 03:56 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_personal_diary`
--

-- --------------------------------------------------------

--
-- Table structure for table `user_account`
--

DROP TABLE IF EXISTS `user_account`;
CREATE TABLE IF NOT EXISTS `user_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `cpass` varchar(255) NOT NULL,
  `isEmailConfirmed` tinyint(4) NOT NULL,
  `token` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_account`
--

INSERT INTO `user_account` (`id`, `name`, `email`, `pass`, `cpass`, `isEmailConfirmed`, `token`) VALUES
(1, 'Doe', 'doe@gmail.com', '$2y$10$lmnUCnmUJEhd7sLHnCxlkeknqm9JL6bYkyqUlAgA4ARHV8xIfgPhy', '$2y$10$CT5NZxXIUSKFV52WcFOphujjDFRuqPfgFwtcUwyLkVHEwfPWLcGsy', 0, 'zMQwNEUGty'),
(2, 'Bill', 'bill@gmail.com', '$2y$10$5QvCEfAR/TmZspDXGBuNROKGIxnIwEhctE7G9vlPA5x6ZCfCPuqHG', '$2y$10$3.H4.9ag/c3uTfEDWUjcEOdpGpROjcaSZhtzl90pzjMS6izcsEaxK', 0, '1Hh4j)znuk'),
(3, 'Tom', 'tom@gamil.com', '$2y$10$8HWak9ubyzerLD1zcsmU3..zFQkyBgF8L/AQcURFa9JcHRyzCi/.S', '$2y$10$mg.ktADjWkYk6qnYfVGKb.GW11TOjyBOBe8PdQDJszLr6XnjqPPAy', 0, '8JCsHZ02rG'),
(4, 'Dave', 'dave@gmail.com', '$2y$10$BBKJX1hFqcpPB/xNvYorZeUHscxot4LNxrQjo9zvwZ6/T23f0PhQy', '$2y$10$yat9.51vraJq6jZ0gSJBl.MLkJnBV5bh61TxHj7UIDgvHGPZdSxUy', 0, 'gvrklwP0(p');

-- --------------------------------------------------------

--
-- Table structure for table `user_post`
--

DROP TABLE IF EXISTS `user_post`;
CREATE TABLE IF NOT EXISTS `user_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `post` text NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`,`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_post`
--

INSERT INTO `user_post` (`id`, `uid`, `post`, `created`) VALUES
(36, 1, '<p><strong>Sri Lanka</strong>&nbsp;(<small><a href=\"https://en.wikipedia.org/wiki/British_English\" title=\"British English\">UK</a>:&nbsp;</small><a href=\"https://en.wikipedia.org/wiki/Help:IPA/English\" title=\"Help:IPA/English\">/sri&nbsp;Ëˆl&aelig;Å‹kÉ™,&nbsp;ÊƒriË&nbsp;-/</a>,&nbsp;<small><a href=\"https://en.wikipedia.org/wiki/American_English\" title=\"American English\">US</a>:&nbsp;</small><a href=\"https://en.wikipedia.org/wiki/Help:IPA/English\" title=\"Help:IPA/English\">/-&nbsp;ËˆlÉ‘ËÅ‹kÉ™/</a>&nbsp;(<a href=\"https://en.wikipedia.org/wiki/File:En-us-Sri_Lanka.ogg\" title=\"About this sound\"><img alt=\"About this sound\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/Loudspeaker.svg/11px-Loudspeaker.svg.png\" style=\"height:11px; width:11px\" /></a><a href=\"https://upload.wikimedia.org/wikipedia/commons/a/ae/En-us-Sri_Lanka.ogg\" title=\"En-us-Sri Lanka.ogg\">listen</a>);<sup><a href=\"https://en.wikipedia.org/wiki/Sri_Lanka#cite_note-9\">[9]</a></sup><sup><a href=\"https://en.wikipedia.org/wiki/Sri_Lanka#cite_note-10\">[10]</a></sup>&nbsp;<a href=\"https://en.wikipedia.org/wiki/Sinhala_language\" title=\"Sinhala language\">Sinhala</a>:&nbsp;à·à·Š&zwj;à¶»à·“ à¶½à¶‚à¶šà·&nbsp;<em><em>ÅšrÄ« Laá¹ƒkÄ</em></em>;&nbsp;<a href=\"https://en.wikipedia.org/wiki/Tamil_language\" title=\"Tamil language\">Tamil</a>:&nbsp;à®‡à®²à®™à¯à®•à¯ˆ&nbsp;<em>Ilaá¹…kai</em>), officially the&nbsp;<strong>Democratic Socialist Republic of Sri Lanka</strong>, is an&nbsp;<a href=\"https://en.wikipedia.org/wiki/Island_country\" title=\"Island country\">island country</a>&nbsp;in&nbsp;<a href=\"https://en.wikipedia.org/wiki/South_Asia\" title=\"South Asia\">South Asia</a>, located in the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Indian_Ocean\" title=\"Indian Ocean\">Indian Ocean</a>&nbsp;to the southwest of the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Bay_of_Bengal\" title=\"Bay of Bengal\">Bay of Bengal</a>&nbsp;and to the southeast of the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Arabian_Sea\" title=\"Arabian Sea\">Arabian Sea</a>. The island is geographically separated from the Indian subcontinent by the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Gulf_of_Mannar\" title=\"Gulf of Mannar\">Gulf of Mannar</a>&nbsp;and the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Palk_Strait\" title=\"Palk Strait\">Palk Strait</a>. The&nbsp;<a href=\"https://en.wikipedia.org/wiki/Capital_city\" title=\"Capital city\">legislative capital</a>,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Sri_Jayawardenepura_Kotte\" title=\"Sri Jayawardenepura Kotte\">Sri Jayawardenepura Kotte</a>, is a suburb of the commercial capital and largest city,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Colombo\" title=\"Colombo\">Colombo</a>.</p>\r\n\r\n<p>Sri Lanka&#39;s documented history spans 3,000 years, with evidence of pre-historic human settlements dating back to at least 125,000 years.<sup><a href=\"https://en.wikipedia.org/wiki/Sri_Lanka#cite_note-histr-11\">[11]</a></sup>&nbsp;It has a rich cultural heritage, and the first known&nbsp;<a href=\"https://en.wikipedia.org/wiki/Buddhism_in_Sri_Lanka\" title=\"Buddhism in Sri Lanka\">Buddhist</a>&nbsp;writings of Sri Lanka, the&nbsp;<a href=\"https://en.wikipedia.org/wiki/P%C4%81li_Canon\" title=\"PÄli Canon\">PÄli Canon</a>, date back to the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Fourth_Buddhist_council\" title=\"Fourth Buddhist council\">Fourth Buddhist council</a>&nbsp;in 29 BC.<sup><a href=\"https://en.wikipedia.org/wiki/Sri_Lanka#cite_note-12\">[12]</a></sup><sup><a href=\"https://en.wikipedia.org/wiki/Sri_Lanka#cite_note-13\">[13]</a></sup>&nbsp;Its geographic location and deep harbours made it of great strategic importance from the time of the ancient&nbsp;<a href=\"https://en.wikipedia.org/wiki/Silk_Road\" title=\"Silk Road\">Silk Road</a>&nbsp;through to the modern&nbsp;<a href=\"https://en.wikipedia.org/wiki/Maritime_Silk_Road\" title=\"Maritime Silk Road\">Maritime Silk Road</a>.<sup><a href=\"https://en.wikipedia.org/wiki/Sri_Lanka#cite_note-silkr-14\">[14]</a></sup><sup><a href=\"https://en.wikipedia.org/wiki/Sri_Lanka#cite_note-15\">[15]</a></sup><sup><a href=\"https://en.wikipedia.org/wiki/Sri_Lanka#cite_note-16\">[16]</a></sup></p>\r\n\r\n<p>Sri Lanka was known in the west and from the&nbsp;<a href=\"https://en.wikipedia.org/wiki/British_Ceylon\" title=\"British Ceylon\">beginning of British colonial rule</a>&nbsp;as Ceylon (<a href=\"https://en.wikipedia.org/wiki/Help:IPA/English\" title=\"Help:IPA/English\">/sÉªËˆlÉ’n/</a>,&nbsp;US also&nbsp;<a href=\"https://en.wikipedia.org/wiki/Help:IPA/English\" title=\"Help:IPA/English\">/seÉªËˆlÉ’n/</a>). A nationalist political movement arose in the country in the early 20th century to obtain political independence, which was granted in 1948; the country became a&nbsp;<a href=\"https://en.wikipedia.org/wiki/Republic\" title=\"Republic\">republic</a>&nbsp;and adopted its current name in 1972. Sri Lanka&#39;s recent history has been marred by a 26-year&nbsp;<a href=\"https://en.wikipedia.org/wiki/Sri_Lankan_Civil_War\" title=\"Sri Lankan Civil War\">civil war</a>, which ended decisively when the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Sri_Lanka_Armed_Forces\" title=\"Sri Lanka Armed Forces\">Sri Lanka Armed Forces</a>&nbsp;defeated the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Liberation_Tigers_of_Tamil_Eelam\" title=\"Liberation Tigers of Tamil Eelam\">Liberation Tigers of Tamil Eelam</a>&nbsp;(LTTE) in 2009.<sup><a href=\"https://en.wikipedia.org/wiki/Sri_Lanka#cite_note-17\">[17]</a></sup></p>\r\n\r\n<p>The current constitution stipulates the political system as a republic and a&nbsp;<a href=\"https://en.wikipedia.org/wiki/Unitary_state\" title=\"Unitary state\">unitary state</a>&nbsp;governed by a&nbsp;<a href=\"https://en.wikipedia.org/wiki/Semi-presidential_system\" title=\"Semi-presidential system\">semi-presidential system</a>. It has had a long history of international engagement, as a founding member of the&nbsp;<a href=\"https://en.wikipedia.org/wiki/South_Asian_Association_for_Regional_Cooperation\" title=\"South Asian Association for Regional Cooperation\">South Asian Association for Regional Cooperation</a>&nbsp;(SAARC), and a member of the&nbsp;<a href=\"https://en.wikipedia.org/wiki/United_Nations\" title=\"United Nations\">United Nations</a>, the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Commonwealth_of_Nations\" title=\"Commonwealth of Nations\">Commonwealth of Nations</a>, the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Group_of_77\" title=\"Group of 77\">G77</a>, and the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Non-Aligned_Movement\" title=\"Non-Aligned Movement\">Non-Aligned Movement</a>. Along with the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Maldives\" title=\"Maldives\">Maldives</a>, Sri Lanka is one of only two South Asian countries rated &quot;high&quot; on the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Human_Development_Index\" title=\"Human Development Index\">Human Development Index</a>&nbsp;(HDI), with its HDI rating and&nbsp;<a href=\"https://en.wikipedia.org/wiki/Per_capita_income\" title=\"Per capita income\">per capita income</a>&nbsp;the highest among South Asian nations.<sup><a href=\"https://en.wikipedia.org/wiki/Sri_Lanka#cite_note-HDI-8\">[8]</a></sup>&nbsp;The Sri Lankan constitution accords&nbsp;<a href=\"https://en.wikipedia.org/wiki/Buddhism\" title=\"Buddhism\">Buddhism</a>&nbsp;the &quot;foremost place&quot;, although it does not identify it as a&nbsp;<a href=\"https://en.wikipedia.org/wiki/State_religion\" title=\"State religion\">state religion</a>. Buddhism is given special privileges in the Sri Lankan constitution.<sup><a href=\"https://en.wikipedia.org/wiki/Sri_Lanka#cite_note-18\">[18]</a></sup></p>\r\n\r\n<p>The island is home to many cultures, languages and ethnicities. The majority of the population are from the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Sinhalese_people\" title=\"Sinhalese people\">Sinhalese ethnicity</a>, while a large minority of&nbsp;<a href=\"https://en.wikipedia.org/wiki/Tamils\" title=\"Tamils\">Tamils</a>&nbsp;have also played an influential role in the island&#39;s history.&nbsp;<a href=\"https://en.wikipedia.org/wiki/Sri_Lankan_Moors\" title=\"Sri Lankan Moors\">Moors</a>,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Burgher_people\" title=\"Burgher people\">Burghers</a>,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Sri_Lankan_Malays\" title=\"Sri Lankan Malays\">Malays</a>,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Chinese_people_in_Sri_Lanka\" title=\"Chinese people in Sri Lanka\">Chinese</a>, and the indigenous&nbsp;<a href=\"https://en.wikipedia.org/wiki/Vedda_people\" title=\"Vedda people\">Vedda</a>&nbsp;are also established groups on the island.<sup><a href=\"https://en.wikipedia.org/wiki/Sri_Lanka#cite_note-19\">[19]</a></sup></p>\r\n', '2019-12-08 15:03:18'),
(35, 1, '<h1>How to pop an alert message box using PHP ?</h1>\r\n\r\n<p>An alert box is used in the website to display a warning message to the user that they have entered the wrong value other than what is required to fill in that position. An alert box can still be used for friendlier messages. The alert box gives only one button &ldquo;OK&rdquo; to select and proceed.<br />\r\nThe alert message just like a pop-up window on the screen. Using this you can alert to the user with some information and message. PHP doesn&rsquo;t support&nbsp;<strong>alert message box</strong>&nbsp;because it is a server-side language but you can use JavaScript code within the&nbsp;<strong>PHP</strong>&nbsp;body to alert the message box on the screen.</p>\r\n', '2019-12-08 15:01:42'),
(34, 1, '<p>new post</p>\r\n', '2019-12-08 14:56:08'),
(37, 3, '<p><span style=\"font-size:22px\"><span style=\"font-family:Georgia,serif\"><strong>Colombo</strong></span></span></p>\r\n\r\n<p>Colombo, the capital of Sri Lanka, has a long history as a port on ancient east-west trade routes, ruled successively by the Portuguese, Dutch and British. That heritage is reflected in its its architecture, mixing colonial buildings with high-rises and shopping malls. The imposing Colombo National Museum, dedicated to Sri Lankan history, borders sprawling Viharamahadevi Park and its giant Buddha.</p>\r\n', '2019-12-08 15:09:20'),
(38, 2, '<p>In statistics and quantitative research methodology, a data sample is a set of data collected and the world selected from a statistical population by a defined procedure. The elements of a sample are known as sample points, sampling units or observations</p>\r\n', '2019-12-09 12:58:44'),
(39, 2, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', '2019-12-13 09:23:46');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
