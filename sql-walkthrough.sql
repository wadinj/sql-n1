-- Le Select Walkthrough
-- https://www.w3schools.com/sql/sql_select.asp

-- Lister uniquement le nom et prénom des clients :
SELECT NOM, PRENOM FROM CLIENT;
-- Lister l’ensemble est champ et rappeler le PRENOM une seconde fois:
SELECT *, PRENOM FROM CLIENT;
-- Lister l’ensemble des clients en éliminant les doublons sur le nom grace à DISTINCT:
SELECT DISTINCT(NOM), PRENOM FROM CLIENT;
-- Lister l’ensemble des clients en éliminant les doublons nom/prénom:
SELECT DISTINCT NOM, PRENOM FROM CLIENT;
-- Lister les produits avec un prix supérieur à 500 avec la clause WHERE :
SELECT * FROM PRODUIT WHERE PRIX > 500;
-- Lister les produits avec un prix inférieur ou égal à 500 avec la clause WHERE :
SELECT * FROM PRODUIT WHERE PRIX <= 500;
-- Lister les produits avec un prix entre 50 et 500 avec la clause WHERE :
SELECT * FROM PRODUIT WHERE PRIX >= 50 AND PRIX <= 500;
-- Lister les produits avec un prix entre 50 et 500 avec la clause WHERE :
	SELECT * FROM PRODUIT WHERE PRIX >= 50 AND PRIX <= 500;
	-- Peut aussi être écrit grâce à un BETWEEN :
	SELECT * FROM PRODUIT WHERE PRIX BETWEEN 50 AND 500;
	-- Le BETWEEN est donc inclusive.

-- L’opérateur LIKE permet d’effectuer des recherches approximatives dans une chaîne de caractères : 
--	% pour remplacer 0 à N lettres
--	_  pour remplacer 1 lettre

-- Lister les clients ayant un nom commençant par “M”:
SELECT * FROM CLIENT WHERE NOM LIKE 'M%';

-- La fonction REGEXP permet d’effectuer une recherche par expressions régulières :
-- Lister les clients ayant un nom commençant par M
SELECT * FROM CLIENT WHERE NOM REGEXP '^M';
-- C’est très utile pour par exemple, découvrir si un email est invalide:
SELECT * FROM CLIENT WHERE EMAIL NOT REGEXP '^[a-zA-Z0-9][+a-zA-Z0-9._-]*@[a-zA-Z0-9][a-zA-Z0-9._-]*[a-zA-Z0-9]*\\.[a-zA-Z]{2,4}$';

-- Vous avez probablement remarqué au dessus, l’introduction de l’opérateur “NOT” permettant d’ajouter une négation à un FILTRE (NOT BETWEEN, NOT IN, NOT LIKE, NOT…)

-- L’opérateur “IN” permet de recherche si une propriété est dans un ensemble : 
SELECT * FROM CLIENT WHERE NOM IN ('TRUMP', 'UNKNOWN', 'MACRON');

-- Les opérateurs >, <, >=, <=, <>, BETWEEN, IN, DISTINCT fonctionnent sur des chaines de caractères, des dates, des entiers, des doubles...
-- Ajoutons une commande avec une date pour vérifier ce point

-- Ici, pas besoin de spécifier les champs car nous les remplissons tous
-- Donald Trump commande 2 trotinettes rouge
INSERT INTO COMMANDE VALUES(1, 1, NOW());
-- On introduit la fonction NOW(). Elle renvoie un objet DATETIME correspondant au DATETIME actuel.
-- Regarder ce qu'il y a dans commande pour voir le format de DATETIME.

-- On INSERT avec une date antérieure
-- Une trotinette rouge amélioré pour Vladimir Poutine
INSERT INTO COMMANDE VALUES(2, 6, '2020-04-01');

-- Regarder le résultat, que remarquerez-vous ?
-- Et si on rajoute une commande trotinette rouge pour Vladimir Poutine, que se passe-t-il ?

-- Un vélo Btwin pour Emmanuel Macron avec la date & l'heure.
INSERT INTO COMMANDE VALUES(3, 2, '2020-04-01 17:10:53');

-- Une OneWheel pour Brigitte Macron
INSERT INTO COMMANDE(CLIENT_ID, PRODUIT_ID) VALUES(3, 4);
-- Et une trotinette
INSERT INTO COMMANDE(CLIENT_ID, PRODUIT_ID) VALUES(3, 1);
-- equivalent: INSERT INTO COMMANDE VALUES(4, 3, NULL);

-- SELECT sur champ NULL
SELECT * FROM COMMANDE WHERE DATE_COMMANDE IS 
-- NOT
NULL;

-- Par contre, c'est pas évident de deviner les IDs des PRODUITS et des CLIENTS pour faire une insertion, n'est-ce pas ?
-- Comment peut-on faire ?

-- Le tri. Comment trier avec la clause ORDER BY.

SELECT * FROM COMMANDE ORDER BY DATE_COMMANDE;

-- Par défaut et implicitement le ORDER BY est ascendant. Il est possible de le rendre descendant ou de le rendre explicite
SELECT * FROM COMMANDE ORDER BY DATE_COMMANDE ASC;
-- Descendant
SELECT * FROM COMMANDE ORDER BY DATE_COMMANDE DESC;

-- ORDER BY fonctionne sur les dates, les chaines de caractères, les entiers, les doubles...
-- Descendant
SELECT PRENOM, NOM FROM CLIENT ORDER BY PRENOM DESC;
-- Ascendant (implicite)
SELECT PRENOM, NOM FROM CLIENT ORDER BY PRENOM;

-- LIMIT & OFFSET : Limit permet de limiter le nombre de résultat retourner par la requête. Offset permet de mettre un décalage par rapport au début de la limite.
SELECT PRENOM, NOM FROM CLIENT ORDER BY PRENOM LIMIT 2;
SELECT PRENOM, NOM FROM CLIENT ORDER BY PRENOM LIMIT 2 OFFSET 2;
-- C'est particulièrement utile pour implémenter une pagination !

-- FONCTION D'AGREGAT
-- Nous pouvons compter les éléments d'une table grâce à COUNT
SELECT COUNT(1) FROM CLIENT;
-- COUNT est combinable avec DISTINCT
SELECT COUNT(DISTINCT NOM) FROM CLIENT; -- 5 car il y a deux MACRON
-- Il existe d'autres agrégat, MIN, MAX, AVG, SUM :
SELECT SUM(PRIX) FROM PRODUIT;
SELECT MIN(PRIX) FROM PRODUIT;
SELECT MAX(PRIX) FROM PRODUIT;
SELECT AVG(PRIX) FROM PRODUIT;

-- Des fonctions avancées 
-- La plupart disponible ici: https://www.w3schools.com/sql/sql_ref_mysql.asp
-- Les plus utiles
-- CHAR_LENGTH permet de renvoyer la taille d'une chaine de caractères
SELECT NOM, PRENOM, CHAR_LENGTH(EMAIL) FROM CLIENT;
SELECT NOM, PRENOM, CHAR_LENGTH(EMAIL) AS LONGUEUR_EMAIL FROM CLIENT; -- Ici, nous avons introduit AS afin de renommer 
                                                                      -- le nom de colonne d'un champ sous fonction pour plus de clarté
-- COALESCE : Renvoie le premier paramètre non null
SELECT COALESCE(DATE_COMMANDE, PRODUIT_ID) FROM COMMANDE;

-- CONCAT : Concatène plusieurs chaines de caractères 
SELECT CONCAT(NOM, ' ',  EMAIL, ' ', PRENOM) AS NOM_ET_PRENOM_ET_EMAIL FROM CLIENT ORDER BY NOM_ET_PRENOM_ET_EMAIL DESC;
-- Ici, nous avons renommer la colonne sous FONCTION afin de la passer dans un ORDER BY

-- Encore mieux, CONCAT_WS : Concatène plusieurs chaines de caractères avec un séparateur
SELECT CONCAT_WS(' ', NOM, EMAIL, PRENOM) AS NOM_ET_PRENOM_ET_EMAIL FROM CLIENT ORDER BY NOM_ET_PRENOM_ET_EMAIL DESC;


-- SUBSTRING : SUBSTR(chaine, début, taille) - Découpe une chaine de caractère
SELECT SUBSTR(PRENOM, 1, 1) AS PREMIERE_LETTRE_PRENOM, NOM FROM CLIENT; 
-- Vous remarquez qu'en SQL, l'index de départ est 1 ! Différent de la majorité des langages de programmation.

-- Les requêtes multi tables
-- Il est possible de requêter sur plusieurs tables en même temps
SELECT * FROM CLIENT, PRODUIT; -- C'est ce qu'on appelle un "FULL-JOIN". Le résultat est l'ensemble des combinaisons des enregistrements des tables selectionnées. 
-- On peut ajouter une contrainte WHERE sur les clés étrangères à ce type de requête
SELECT * FROM CLIENT, COMMANDE WHERE CLIENT.ID = COMMANDE.CLIENT_ID;
-- On peut joindre autant de tables que l'on souhaite
SELECT * FROM CLIENT, COMMANDE, PRODUIT WHERE COMMANDE.PRODUIT_ID = PRODUIT.ID AND COMMANDE.CLIENT_ID = CLIENT.ID; 
-- Un peu de clarté :
SELECT CL.NOM, CL.PRENOM, P.NOM, P.DESCRIPTION, P.PRIX FROM CLIENT AS CL, COMMANDE AS CO, PRODUIT AS P WHERE CO.PRODUIT_ID = P.ID AND CO.CLIENT_ID = CL.ID; 

-- Le clause JOIN
-- SQL 2 a apporté une clause afin de permettre de joindre des tables plus facilement "JOIN"
-- C'est uniquement du sucre syntaxique permettant d'avoir des requêtes beaucoup plus parlante.
-- Les requête multi tables au dessus peuvent être écrite avec JOIN :
SELECT * FROM CLIENT FULL JOIN PRODUIT;
-- Ou
SELECT * FROM CLIENT JOIN PRODUIT;
-- En rajoutons notre contraintes pour obtenir les commandes des clients :
SELECT * FROM CLIENT CL JOIN COMMANDE CO ON (CL.ID = CO.CLIENT_ID);
-- Ici, nous avons omis AS pour CLIENT CL, il est implicite.

-- La même chose avec les commandes de produits des clients :
SELECT CL.NOM, CL.PRENOM, P.NOM, P.DESCRIPTION, P.PRIX FROM CLIENT CL INNER JOIN COMMANDE CO ON (CL.ID = CO.CLIENT_ID) INNER JOIN PRODUIT P ON (CO.PRODUIT_ID = P.ID);
-- Il existe plusieurs types de jointure. Les jointures gauche, droite externe :
-- Jointure externe gauche (LEFT OUTER JOIN): Renvoie l'ensemble des éléments à gauche même si la clause ON n'est pas satisfaite. Remplacer par NULL les éléments de clause droite quand ON n'est pas satisfait
SELECT CL.NOM, CL.PRENOM, P.NOM, P.DESCRIPTION, P.PRIX FROM CLIENT CL LEFT OUTER JOIN COMMANDE CO ON (CL.ID = CO.CLIENT_ID) LEFT OUTER JOIN PRODUIT P ON (CO.PRODUIT_ID = P.ID);
-- Jointure externe droite (RIGHT OUTER JOIN): identique mais pour le membre de droite
SELECT CL.NOM, CL.PRENOM, P.NOM, P.DESCRIPTION, P.PRIX FROM COMMANDE CO RIGHT OUTER JOIN PRODUIT P ON (CO.PRODUIT_ID = P.ID) RIGHT OUTER JOIN CLIENT CL ON (CL.ID = CO.CLIENT_ID)
-- Il existe aussi FULL OUTER JOIN (EXTERNE DROITE + GAUCHE)
				-- CROSS JOIN - Produit Cartésien
				-- Les mots clés INNER et OUTER sont optionnels

-- Maintenant, un peu d'exercice :

-- 1. Lister les ID_PRODUIT, ID_CLIENT des commandes avec une data strictement inférieur au 15 Avril 2020 trié par ordre décroissant
-- 2. Lister les ID_PRODUIT, ID_CLIENT des commandes effectué le 1 Avril 2020 dans l'après-midi (entre 14h et 18h inclusif)
-- 3. Lister LE NOMBRE de produits avec un prix supérieur ou égal à 1000E 
-- 4. Lister l'ensemble des produits contenant le mot "trotinette" avec un prix supérieur à 150E
-- 5. Lister l'ensemble des produits contenant le mot "trotinette" avec un prix supérieur à 150E
-- 6. Lister le nombre de commande de trotinette (améliorée ou non) (nom du produit contenant 'trotinette')
-- 7. Lister le montant total des commandes des clients de la famille "Macron"
-- 8. Ajouter une table fournisseur(id, nom, ville, date_ajout) avec l'ID auto-increment et clé primaire. Le nom du fournisseur doit être UNIQUE. 
--    Nom et ville ont une longueur de 512 char. date_ajout est une datetime
-- 9. Ajouter une colonne FOURNISSEUR_ID a la table PRODUIT avec une contrainte d'intégrité vers l'ID de la table fournisseur
--	  Avec une suppression en CASCADE 
-- 10 Ajouter les fournisseurs 
-- Nom=Air Liquide, Ville=Paris, date d'ajout "maintenant"
-- Nom=Airbus, Ville=Toulouse, date d'ajout " 24 Décembre 2015"
-- Nom=Decathlon, Ville=Villeneuve d'Ascq, date d'ajout "1 Janvier 2012"
-- 11. (recherche) Mettre à jour la colonne FOURNISSEUR ID pour les trotinettes + le vélo Btwin avec Decathlon
-- 	   Le OneWheel pour Airbus
-- 	   Un nouveau produit 'Oxygène' pour Air Liquide (prix 154.14, description NULL)
-- Sans aucun identifiant en dur (FOURNISSEUR_ID = 1)
-- 12. Lister les produits jamais commandés
-- 13. Lister le prix moyen des produits Decathlons
-- 14. Lister les noms (Sans doublon) qui ont commandés des produits Decathlon
-- 15. Afficher les initiales des clients table(Initiale nom, Initiale prénom, nom prenom séparé par un espace)
-- 16. Afficher le premier produit de Decathlon dans l'ordre alphabétique (i.e Trotinette)

-- La Clause GROUP BY
-- Elle permet d'effectuer des opérations sur un groupe de données ayant une caractéristique commune (le type)
-- L'ensemble des colonnes selectionnées dans un SELECT ou un ORDER BY doit être obligatoirement dans la clause GROUP BY si celle-ci est présente
-- Le nombre de commande par produit
SELECT P.NOM, COUNT(*) NOMBRE_DE_COMMANDE 
FROM CLIENT CL INNER JOIN COMMANDE CO ON (CL.ID = CO.CLIENT_ID) INNER JOIN PRODUIT P ON (CO.PRODUIT_ID = P.ID) GROUP BY P.NOM;
-- On peut aussi faire des regroupements via plusieurs colonnes
SELECT P.NOM, P.DESCRIPTION, COUNT(*) NOMBRE_DE_COMMANDE 
FROM CLIENT CL INNER JOIN COMMANDE CO ON (CL.ID = CO.CLIENT_ID) INNER JOIN PRODUIT P ON (CO.PRODUIT_ID = P.ID) GROUP BY P.NOM, P.DESCRIPTION;
-- GROUP BY / ORDER BY 
SELECT P.NOM, COUNT(*) NOMBRE_DE_COMMANDE 
FROM CLIENT CL INNER JOIN COMMANDE CO ON (CL.ID = CO.CLIENT_ID) INNER JOIN PRODUIT P ON (CO.PRODUIT_ID = P.ID) GROUP BY P.NOM ORDER BY NOMBRE_DE_COMMANDE DESC;
-- HAVING permet d'ajouter une condition sur le résultat de l'aggrégat GROUP BY
SELECT P.NOM, COUNT(*) NOMBRE_DE_COMMANDE FROM CLIENT CL INNER JOIN COMMANDE CO ON (CL.ID = CO.CLIENT_ID) INNER JOIN PRODUIT P ON (CO.PRODUIT_ID = P.ID) 
GROUP BY P.NOM HAVING NOMBRE_DE_COMMANDE = 2

-- 17. Afficher le nombre de produits par le nom de fournisseur
-- 18. Afficher le nom du fournisseur ayant vendu le plus de produit (Tips: La clause ALL permet de vérifier qu'une condition est correcte pour l'ensemble des éléments sous-jacent, ex:
-- 19. Afficher le montant total de commande par JOUR (deux colonnes : Le jour YYYY-MM-DD, le montant total) [Sans la valeur date NULL]
-- 20. Afficher l'ensemble des clients (nom + prénom) (même ceux qui n'ont rien commandé) avec le montant total dépensé par client (ex: MACRON->182E, TRUMP->0)
	-- Le prix ne doit jamais afficher NULL, mais 0 en cas de NULL


-- Les autres requêtes DELETE, UPDATE.
-- La clause DELETE permet de supprimer des enregistrements
-- La clause UPDATE permet de mettre à jour des enregistrements
-- On va changer le prénom de  DONALD TRUMP en DONALD JR
UPDATE CLIENT SET PRENOM = 'Donald Jr' WHERE NOM = 'TRUMP' AND PRENOM = 'DONALD';

-- DELETE permet de supprimer des enregistrements
DELETE FROM CLIENT WHERE NOM = 'JOHNSON' AND PRENOM = 'BORIS';
-- Mais que se passe-t-il si on supprime un client ayant des commandes ?
DELETE FROM CLIENT WHERE NOM = 'MACRON' AND PRENOM = 'EMMANUEL'; 
-- Meme chose pour un UPDATE sur un ID
UPDATE CLIENT SET ID = 11 WHERE NOM = 'MACRON' AND PRENOM = 'EMMANUEL';

-- Il est possible de paramétrer la propagation des modifications d'une clé étrangère au niveau du paramétrage des contraintes d'intégrités
-- Ex avec Commande : 
CREATE TABLE COMMANDE2(
    PRODUIT_ID INT,
    CLIENT_ID INT,
    DATE_COMMANDE DATETIME, -- PREFER DATETIME AS TIMESTAMP TO AVOID THE Unix Millennium Bug [http://unixmillenniumbug.com/]
    PRIMARY KEY(PRODUIT_ID, CLIENT_ID),
    CONSTRAINT FK_PRODUIT2 FOREIGN KEY (PRODUIT_ID) REFERENCES PRODUIT(ID) ON DELETE CASCADE ON UPDATE CASCADE, 
    CONSTRAINT FK_CLIENT2  FOREIGN KEY (CLIENT_ID) REFERENCES CLIENT(ID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- On peut aussi le faire POST-CREATION Avec un ALTER.
ALTER TABLE COMMANDE DROP FOREIGN KEY FK_CLIENT; -- On supprime la clé étrangère de commande 
ALTER TABLE COMMANDE ADD FOREIGN KEY FK_CLIENT(CLIENT_ID) REFERENCES CLIENT(ID) ON DELETE CASCADE ON UPDATE CASCADE;
-- ON re-tente !
DELETE FROM CLIENT WHERE NOM = 'MACRON' AND PRENOM = 'EMMANUEL';
-- Vérifier l'impact de la query