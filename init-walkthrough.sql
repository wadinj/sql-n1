-- Docker startup : docker run --name mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -p 3306:3306 -p 33060:33060 -d mysql
-- INFORMATION SOURCE AVAILABLE AT https://www.digitalocean.com/community/tutorials/how-to-create-a-new-user-and-grant-permissions-in-mysql
-- Se connecter: mysql --host=localhost --user=root --password=my-secret-pw --protocol=tcp

-- CREATE A USER. NEVER USE THE ROOT ADMIN !
CREATE USER 'wadinj' IDENTIFIED BY 'P@ssword123!';
-- On peut ajouter une contrainte sur l'origine de connexion: CREATE USER 'wadinj'@'172.17.0.1' IDENTIFIED BY 'P@ssword123!'; 

-- On créé la base produit avec le root
CREATE DATABASE PRODUIT_DATABASE;

-- On ajoute les privileges sur la base PRODUIT
GRANT ALL PRIVILEGES ON PRODUIT_DATABASE.* TO 'wadinj';
FLUSH PRIVILEGES;

-- CHANGE ROOT DEFAULT NAME
use mysql;
update user set user='myadmin' where user='root';
flush privileges;
exit
-- mysql --host=localhost --user=root --password=my-secret-pw --protocol=tcp ne fonctionne plus
-- Se reconnecter avec notre wadinj
-- mysql --host=localhost --user=wadinj --password=P@ssword123! --protocol=tcp PRODUIT_DATABASE


-- Definition CREATE TABLE: https://dev.mysql.com/doc/refman/8.0/en/create-table.html
CREATE TABLE CLIENT(
    ID INT PRIMARY KEY,
    NOM VARCHAR(1024) NOT NULL,
    PRENOM VARCHAR(1024) NOT NULL,
    VILLE VARCHAR(1024) NOT NULL,
    CP CHAR(5) NOT NULL,
    EMAIL VARCHAR(512) NOT NULL
);

-- InnoDB - Transactionnelle
CREATE TABLE PRODUIT(
    ID INT PRIMARY KEY,
    NOM VARCHAR(1024) NOT NULL,
    DESCRIPTION VARCHAR(5096) NOT NULL,
    PRIX DOUBLE NOT NULL
) ENGINE=InnoDB;


CREATE TABLE COMMANDE(
    PRODUIT_ID INT,
    CLIENT_ID INT,
    DATE_COMMANDE DATETIME, -- PREFER DATETIME AS TIMESTAMP TO AVOID THE Unix Millennium Bug [http://unixmillenniumbug.com/]
    PRIMARY KEY(PRODUIT_ID, CLIENT_ID),
    CONSTRAINT FK_PRODUIT FOREIGN KEY (PRODUIT_ID) REFERENCES PRODUIT(ID),
    CONSTRAINT FK_CLIENT  FOREIGN KEY (CLIENT_ID) REFERENCES CLIENT(ID)
);

INSERT INTO PRODUIT VALUES(1, 'Trotinette Rouge', 'C\'est une trotinette rouge pour adulte', 120.12);
-- On aimerait ne pas avoir a stipulé l'ID, non ? Essayons
-- ALTER commande permet de modifier une table qui existe
ALTER TABLE PRODUIT DROP PRIMARY KEY; -- Ne Fonctionne pas car utilisé en clé secondaire dans commande 
ALTER TABLE COMMANDE DROP FOREIGN KEY FK_PRODUIT; -- On supprime la clé étrangère de commande 
ALTER TABLE PRODUIT DROP PRIMARY KEY; -- Maintenant on peut retirer la contrainte de clé primaire pour ajouter l'auto increment
ALTER TABLE PRODUIT MODIFY ID INT PRIMARY KEY AUTO_INCREMENT;
-- Maintenant, plus besoin de définir un ID [On peut aussi le faire pour le client]
INSERT INTO PRODUIT(NOM, DESCRIPTION, PRIX) VALUES('Trotinette Rouge amélioré', 'C\'est une trotinette verte de grande qualité pour adulte', 210.12);
-- InnoDB, insertion par transaction
START TRANSACTION;
INSERT INTO PRODUIT(NOM, DESCRIPTION, PRIX) VALUES('Vélo Btwin', 'C\'est un vélo d\'entrée de gamme', 200);
INSERT INTO PRODUIT(NOM, DESCRIPTION, PRIX) VALUES('OneWheel', 'C\'est une skateboard electrique avec une roue unique au centre', 1200.99);
SELECT * FROM PRODUIT; -- Les produits sont visibles uniquement dans la transaction. Si on ouvre une autre session, ils ne seront pas visibles
ROLLBACK; -- Aucun changement a été sauvegardé, les INSERT sont rollbackés.
SELECT * FROM PRODUIT;
START TRANSACTION;
INSERT INTO PRODUIT(NOM, DESCRIPTION, PRIX) VALUES('Vélo Btwin', 'C\'est un vélo d\'entrée de gamme', 200);
INSERT INTO PRODUIT(NOM, DESCRIPTION, PRIX) VALUES('OneWheel', '\'est une skateboard electrique avec une roue unique au centre', 1200.99);
COMMIT; -- On sauvegarde pour tout le monde

START TRANSACTION; -- CLIENT n'est pas InnoDB, la transaction n'est pas respectée
INSERT INTO CLIENT(NOM, PRENOM, VILLE, CP, EMAIL) VALUES('TRUMP', 'DONALD', 'WASHINGTON', '99999', 'donald@trump.com');
SELECT * FROM CLIENT;
ROLLBACK;
SELECT * FROM CLIENT;
INSERT INTO CLIENT(NOM, PRENOM, VILLE, CP, EMAIL) VALUES('MACRON', 'EMMANUEL', 'PARIS', '75000', 'emmanuel@macron.fr');
INSERT INTO CLIENT(NOM, PRENOM, VILLE, CP, EMAIL) VALUES('MACRON', 'BRIGITTE', 'PARIS', '75000', 'brigitte@macron.fr');
INSERT INTO CLIENT(NOM, PRENOM, VILLE, CP, EMAIL) VALUES('MERKEL', 'ANGELA', 'BERLIN', '15456', 'angela@merkel.de');
INSERT INTO CLIENT(NOM, PRENOM, VILLE, CP, EMAIL) VALUES('JOHNSON', 'BORIS', 'LONDON', '45633', 'boris@johnson.co.uk');
INSERT INTO CLIENT(NOM, PRENOM, VILLE, CP, EMAIL) VALUES('POUTINE', 'VLADIMIR', 'MOSCOU', '12345', 'invalid $ email @gmail.com');
