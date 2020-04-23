
CREATE DATABASE NETFLIX_SCHOOL;
USE NETFLIX_SCHOOL;
CREATE TABLE UTILISATEUR(
    ID INT AUTO_INCREMENT,
    NOM VARCHAR(512)  NOT NULL,
    PRENOM VARCHAR(512) NOT NULL,
    EMAIL VARCHAR(512) NOT NULL,
    TELEPHONE VARCHAR(16),
    MOT_DE_PASSE VARCHAR(1024),
    DATE_DE_NAISSANCE DATETIME,
    PRIMARY KEY(ID)
);

CREATE TABLE PROFIL(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ID_UTILISATEUR INT,
    SURNOM VARCHAR(512) NOT NULL,
    PREFERENCE_LANGUE VARCHAR(512),
    CONSTRAINT FK_UTILISATEUR FOREIGN KEY (ID_UTILISATEUR) REFERENCES UTILISATEUR(ID)
);

CREATE TABLE CONTENU_TYPE(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    LABEL VARCHAR(1024) NOT NULL
);

CREATE TABLE CONTENU(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    TYPE_ID INT,
    DATE_MISE_EN_LIGNE DATETIME NOT NULL,
    TITRE VARCHAR(1024) NOT NULL,
    ORIGINE VARCHAR(1024) NOT NULL,
    BOXOFFICE INT NOT NULL,
    CONSTRAINT FK_CONTENU FOREIGN KEY (TYPE_ID) REFERENCES CONTENU_TYPE(ID)
);

CREATE TABLE LANGUE(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    CODE_ISO VARCHAR(3),
    LABEL VARCHAR(1024) NOT NULL
);

CREATE TABLE LANGUE_CONTENU(
    ID_LANGUE INT,
    ID_CONTENU INT,
    PRIMARY KEY(ID_LANGUE, ID_CONTENU),
    CONSTRAINT FK_CONTENU_LANGUE FOREIGN KEY (ID_CONTENU) REFERENCES CONTENU(ID),
    CONSTRAINT FK_LANGUE_CONTENU FOREIGN KEY (ID_LANGUE) REFERENCES LANGUE(ID)
);


CREATE TABLE HISTORIQUE_VISUALISATION(
    ID INT AUTO_INCREMENT,
    ID_PROFIL INT,
    ID_CONTENU INT,
    DATE_VISUALISATION DATETIME,
    PRIMARY KEY(ID),
    CONSTRAINT FK_CONTENU_HISTORIQUE FOREIGN KEY (ID_CONTENU) REFERENCES CONTENU(ID),
    CONSTRAINT FK_PROFIL_HISTORIQUE FOREIGN KEY (ID_PROFIL) REFERENCES PROFIL(ID)
);

INSERT INTO UTILISATEUR(NOM, PRENOM, EMAIL, TELEPHONE, MOT_DE_PASSE, DATE_DE_NAISSANCE)
VALUES("Bettignies", "Louise", "blouise@gmail.com", "0615489878", NULL, "1996-01-06");
INSERT INTO UTILISATEUR(NOM, PRENOM, EMAIL, TELEPHONE, MOT_DE_PASSE, DATE_DE_NAISSANCE)
VALUES("Marc", "Patrick", "marc.patrick@gmail.com", "0320314932", NULL, "1986-12-30");
INSERT INTO UTILISATEUR(NOM, PRENOM, EMAIL, TELEPHONE, MOT_DE_PASSE, DATE_DE_NAISSANCE)
VALUES("Sali", "Abi", "sali.abi@hotmail.fr", "0646591311", NULL, "1990-09-16");
INSERT INTO UTILISATEUR(NOM, PRENOM, EMAIL, TELEPHONE, MOT_DE_PASSE, DATE_DE_NAISSANCE)
VALUES("Hancq", "Lucie", "lucie@yahoo.com", "0699745621", NULL, "1976-06-12");

INSERT INTO LANGUE(CODE_ISO, LABEL) VALUES ("EN", "Anglais");
INSERT INTO LANGUE(CODE_ISO, LABEL) VALUES ("FR", "Français");
INSERT INTO LANGUE(CODE_ISO, LABEL) VALUES ("DE", "Allemand");
INSERT INTO LANGUE(CODE_ISO, LABEL) VALUES ("MA", "Arabe");

INSERT INTO PROFIL(ID_UTILISATEUR, SURNOM, PREFERENCE_LANGUE)
VALUES(1, "Louise", 2);
INSERT INTO PROFIL(ID_UTILISATEUR, SURNOM, PREFERENCE_LANGUE)
VALUES(1, "Papa", 4);
INSERT INTO PROFIL(ID_UTILISATEUR, SURNOM, PREFERENCE_LANGUE)
VALUES(1, "Maman", 1);
INSERT INTO PROFIL(ID_UTILISATEUR, SURNOM, PREFERENCE_LANGUE)
VALUES(1, "Ben", 3);

INSERT INTO PROFIL(ID_UTILISATEUR, SURNOM, PREFERENCE_LANGUE)
VALUES(2, "Louise", 2);
INSERT INTO PROFIL(ID_UTILISATEUR, SURNOM, PREFERENCE_LANGUE)
VALUES(2, "Lea", 3);
INSERT INTO PROFIL(ID_UTILISATEUR, SURNOM, PREFERENCE_LANGUE)
VALUES(2, "Maman", 1);
INSERT INTO PROFIL(ID_UTILISATEUR, SURNOM, PREFERENCE_LANGUE)
VALUES(2, "Oncle", 1);

INSERT INTO PROFIL(ID_UTILISATEUR, SURNOM, PREFERENCE_LANGUE)
VALUES(3, "Fabien", 4);
INSERT INTO PROFIL(ID_UTILISATEUR, SURNOM, PREFERENCE_LANGUE)
VALUES(3, "Luis", 4);
INSERT INTO PROFIL(ID_UTILISATEUR, SURNOM, PREFERENCE_LANGUE)
VALUES(3, "Tente", 4);
INSERT INTO PROFIL(ID_UTILISATEUR, SURNOM, PREFERENCE_LANGUE)
VALUES(3, "Grand'ma", 4);

INSERT INTO PROFIL(ID_UTILISATEUR, SURNOM, PREFERENCE_LANGUE)
VALUES(4, "Sam", 2);
INSERT INTO PROFIL(ID_UTILISATEUR, SURNOM, PREFERENCE_LANGUE)
VALUES(4, "Jo", 1);
INSERT INTO PROFIL(ID_UTILISATEUR, SURNOM, PREFERENCE_LANGUE)
VALUES(4, "Fabien", 2);
INSERT INTO PROFIL(ID_UTILISATEUR, SURNOM, PREFERENCE_LANGUE)
VALUES(4, "Louise", 2);

INSERT INTO CONTENU_TYPE(LABEL)
VALUES("Thriller");
INSERT INTO CONTENU_TYPE(LABEL)
VALUES("Romance");
INSERT INTO CONTENU_TYPE(LABEL)
VALUES("Series");

INSERT INTO CONTENU(TYPE_ID, DATE_MISE_EN_LIGNE, TITRE, ORIGINE, BOXOFFICE)
VALUES(2, "2015-01-30", "Arrête moi si tu peux", "US", 5453123);
INSERT INTO CONTENU(TYPE_ID, DATE_MISE_EN_LIGNE, TITRE, ORIGINE, BOXOFFICE)
VALUES(2, "2016-12-03", "Ratatouille", "US", 16456963);
INSERT INTO CONTENU(TYPE_ID, DATE_MISE_EN_LIGNE, TITRE, ORIGINE, BOXOFFICE)
VALUES(2, "2017-06-15", "Là-haut", "US", 8156357);
INSERT INTO CONTENU(TYPE_ID, DATE_MISE_EN_LIGNE, TITRE, ORIGINE, BOXOFFICE)
VALUES(1, "1996-11-11", "L'arme fatale", "US", 11569845);
INSERT INTO CONTENU(TYPE_ID, DATE_MISE_EN_LIGNE, TITRE, ORIGINE, BOXOFFICE)
VALUES(1, "1999-11-11", "L'arme fatale 2", "US", 11569845);
INSERT INTO CONTENU(TYPE_ID, DATE_MISE_EN_LIGNE, TITRE, ORIGINE, BOXOFFICE)
VALUES(1, "1999-02-16", "Armaggedon", "US", 1265489);
INSERT INTO CONTENU(TYPE_ID, DATE_MISE_EN_LIGNE, TITRE, ORIGINE, BOXOFFICE)
VALUES(2, "2016-02-13", "Bienvenue chez les ch'tis", "FR", 19654369);
INSERT INTO CONTENU(TYPE_ID, DATE_MISE_EN_LIGNE, TITRE, ORIGINE, BOXOFFICE)
VALUES(3, "2004-05-11", "Prison Break", "US", 11365478);
INSERT INTO CONTENU(TYPE_ID, DATE_MISE_EN_LIGNE, TITRE, ORIGINE, BOXOFFICE)
VALUES(3, "2006-05-11", "Street hoops", "US", 5365148);
INSERT INTO CONTENU(TYPE_ID, DATE_MISE_EN_LIGNE, TITRE, ORIGINE, BOXOFFICE)
VALUES(3, "2012-03-01", "Taxi 2", "FR", 6154396);
INSERT INTO CONTENU(TYPE_ID, DATE_MISE_EN_LIGNE, TITRE, ORIGINE, BOXOFFICE)
VALUES(3, "2016-12-11", "Lollipop", "Inde", 2659874);

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION)
VALUES(1, 3, "2016-12-11 17:53:00");
INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION)
VALUES(1, 6, "2017-12-11 14:53:00");
INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION)
VALUES(1, 10, "2017-06-11 11:56:00");
INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION)
VALUES(2, 2, "2011-06-11 16:56:00");
INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION)
VALUES(2, 9, "2011-06-11 18:54:00");
INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION)
VALUES(3, 1, "2020-04-10 11:45:10");
INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION)
VALUES(3, 5, "2020-04-12 11:45:10");
INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION)
VALUES(3, 1, "2020-04-10 11:45:10");


INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(16, 2, '2019-06-15 13:29:09');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(10, 4, '2018-12-11 01:36:29');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(13, 5, '2018-08-10 04:43:10');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(16, 2, '2018-10-10 00:53:31');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(11, 5, '2018-02-17 13:39:40');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(5, 8, '2018-05-04 14:58:01');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(15, 8, '2020-02-17 00:00:17');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(5, 6, '2018-08-22 18:43:19');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(9, 2, '2018-09-29 23:01:06');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(10, 5, '2018-09-11 16:45:38');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(11, 8, '2018-08-02 21:56:14');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(11, 3, '2020-02-19 20:50:21');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(12, 3, '2019-03-14 20:30:51');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(6, 4, '2019-12-17 06:19:37');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(2, 1, '2018-05-26 04:12:00');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(11, 1, '2018-05-20 10:43:31');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(10, 6, '2018-05-20 21:13:56');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(14, 1, '2018-04-01 01:37:38');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(13, 1, '2019-06-20 13:57:36');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(4, 3, '2018-09-02 16:33:12');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(9, 10, '2019-10-21 14:59:22');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(16, 10, '2019-04-26 02:27:50');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(2, 1, '2018-01-22 13:27:53');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(5, 10, '2019-08-10 19:59:31');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(15, 9, '2018-08-09 22:02:37');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(4, 5, '2018-12-13 14:51:35');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(12, 5, '2019-02-11 01:37:47');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(16, 10, '2018-01-14 04:24:44');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(7, 7, '2019-12-26 17:01:00');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(2, 4, '2018-06-17 15:37:54');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(3, 3, '2020-02-12 12:19:14');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(11, 5, '2018-02-08 16:29:04');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(2, 6, '2020-02-24 02:54:19');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(15, 2, '2018-05-21 05:51:37');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(11, 5, '2019-02-03 15:41:08');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(12, 5, '2018-02-19 03:42:36');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(16, 2, '2018-04-20 07:48:55');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(15, 2, '2019-10-30 06:52:12');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(1, 2, '2020-02-15 17:33:31');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(4, 10, '2019-09-04 06:10:09');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(16, 9, '2019-10-23 19:31:09');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(6, 10, '2019-10-21 12:28:48');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(13, 7, '2020-04-09 16:59:20');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(14, 10, '2018-05-16 12:34:15');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(8, 7, '2019-09-01 02:18:45');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(4, 9, '2018-09-23 22:27:16');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(10, 6, '2019-07-25 10:37:51');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(15, 7, '2018-04-28 14:00:01');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(12, 4, '2019-07-27 02:26:45');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(6, 10, '2018-08-27 09:20:44');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(15, 3, '2018-02-19 08:32:41');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(1, 8, '2018-01-25 05:12:41');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(8, 3, '2020-01-27 03:14:40');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(1, 10, '2019-04-27 23:19:16');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(8, 6, '2018-01-05 14:49:09');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(9, 8, '2018-01-19 16:31:19');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(13, 7, '2019-10-26 12:43:03');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(14, 1, '2019-12-06 16:45:34');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(11, 2, '2020-02-07 00:21:14');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(9, 8, '2018-02-11 20:48:59');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(7, 3, '2018-07-30 04:41:55');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(2, 1, '2019-12-01 06:35:03');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(1, 8, '2019-05-09 18:26:40');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(6, 10, '2019-10-03 05:22:56');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(6, 2, '2019-09-05 15:15:04');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(12, 5, '2018-02-02 04:58:52');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(5, 2, '2019-11-24 13:40:46');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(5, 7, '2019-04-15 20:36:16');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(1, 2, '2018-04-03 01:13:47');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(14, 3, '2018-01-04 16:00:56');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(14, 8, '2019-07-28 01:50:41');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(15, 2, '2018-04-16 23:44:08');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(12, 9, '2019-02-20 09:06:35');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(15, 8, '2019-12-05 08:56:27');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(6, 2, '2019-09-25 13:46:21');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(11, 4, '2020-03-17 17:00:29');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(16, 2, '2019-10-05 12:59:51');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(14, 10, '2018-05-12 03:44:53');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(5, 5, '2019-08-04 12:09:52');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(2, 2, '2018-11-05 06:38:59');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(1, 7, '2019-07-12 04:03:39');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(8, 2, '2020-04-07 02:03:53');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(16, 9, '2019-12-06 19:08:24');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(11, 4, '2019-09-09 17:26:06');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(14, 4, '2018-09-29 23:30:03');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(10, 3, '2019-12-26 03:39:16');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(9, 6, '2018-05-10 14:12:48');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(11, 5, '2018-11-20 01:19:35');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(12, 5, '2018-04-06 11:09:36');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(1, 6, '2019-08-30 15:41:30');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(16, 6, '2020-04-05 21:21:56');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(12, 7, '2019-07-24 17:57:31');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(13, 5, '2020-02-28 05:09:47');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(13, 5, '2019-09-03 10:02:50');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(14, 8, '2019-08-05 06:33:25');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(8, 9, '2018-12-30 14:34:30');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(6, 10, '2020-04-11 07:38:42');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(14, 6, '2020-01-12 08:39:11');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(11, 7, '2018-07-16 19:29:52');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(4, 4, '2019-06-22 22:08:45');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(9, 7, '2018-05-04 17:49:01');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(1, 9, '2020-01-05 15:35:11');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(7, 10, '2019-10-22 01:34:41');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(7, 4, '2018-07-10 15:17:32');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(1, 3, '2019-11-22 08:33:10');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(14, 1, '2018-08-26 08:36:46');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(3, 6, '2019-11-08 23:56:13');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(16, 7, '2018-04-28 22:28:13');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(15, 5, '2019-12-11 21:00:48');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(13, 3, '2018-09-18 03:52:03');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(5, 4, '2019-02-01 14:44:29');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(1, 7, '2019-12-29 12:44:00');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(7, 9, '2020-02-13 12:06:39');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(9, 6, '2019-01-16 15:43:33');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(7, 8, '2019-11-21 20:21:54');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(12, 8, '2018-11-16 06:10:16');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(6, 1, '2019-11-24 16:17:15');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(10, 1, '2018-09-11 05:27:07');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(16, 7, '2020-01-21 08:34:43');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(12, 9, '2019-08-12 13:30:31');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(7, 6, '2018-07-04 10:14:59');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(1, 8, '2019-11-27 12:24:23');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(5, 10, '2018-03-15 06:23:39');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(9, 5, '2018-05-25 05:07:54');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(14, 6, '2019-03-16 22:03:26');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(10, 7, '2018-11-18 18:51:59');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(13, 8, '2018-01-01 14:35:08');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(7, 1, '2019-05-14 01:26:04');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(3, 5, '2019-06-05 05:38:23');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(12, 8, '2018-07-24 08:13:50');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(5, 5, '2019-12-04 10:03:54');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(5, 5, '2018-09-14 00:27:14');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(15, 6, '2019-06-07 10:44:43');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(14, 1, '2019-04-15 19:00:21');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(12, 4, '2018-06-09 20:55:54');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(13, 5, '2018-11-29 08:22:02');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(12, 6, '2019-01-09 23:01:09');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(15, 8, '2020-03-27 16:05:16');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(1, 4, '2019-04-06 19:12:41');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(15, 7, '2019-01-03 03:01:15');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(3, 1, '2018-11-04 22:45:42');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(13, 1, '2020-02-29 09:21:08');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(14, 8, '2019-08-06 12:33:15');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(4, 3, '2019-07-29 22:20:27');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(7, 5, '2018-06-28 05:35:35');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(10, 5, '2018-12-14 03:57:49');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(2, 5, '2019-06-23 00:42:06');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(13, 2, '2018-04-05 21:36:36');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(16, 6, '2018-03-16 21:30:57');

INSERT INTO HISTORIQUE_VISUALISATION(ID_PROFIL, ID_CONTENU, DATE_VISUALISATION) VALUES(8, 8, '2020-02-29 11:32:33');

