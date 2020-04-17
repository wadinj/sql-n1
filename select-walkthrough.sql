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
-- Donald Trump commande une trotinette rouge
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
INSERT INTO COMMANDE(CLIENT_ID, PRODUIT_ID) VALUES(4, 3);
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

-- Les fonctions avancées spéciales 
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
