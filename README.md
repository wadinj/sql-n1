# La BDD c'est fantastique

# TwitterSchool.com

### Fonctionnalités à couvrir

TwitterSchool.com, c'est quoi :
- TwitterSchool doit permettre à un utilisateur de se connecter et de créer son profil.
	- La connexion doit être effectuée par son email (unique) et un mot de passe
	- Le profil de l'utilisateur contient :
		- Une photo
		- Son nom
		- Son nickname
		- Son prénom
		- Sa date de naissance
- TwitterSchool doit permettre de Tweeter 
	- Un Tweet est rattaché à un utilisateur
	- Un tweet contient :
		- La date de publication
		- Le contenu (max 280 caractères)
		- Des "Like"
		- Des "Retweet"
		- Des commentaires d'autres utilisateurs
	- Un commentaire d'un Tweet contient :
		- Une date de publication
		- Un contenu (max 280 caractères)
		- Des "Likes"
	- Un Retweet contient :
		- Une date de retweet
		- Un Tweet
		- Un utilisateur
		- Un petit commentaire optionnel du retweet
	- Un Like contient :
		- Une date de like
		- Un utilisateur
	- Un utilisateur doit pouvoir "Follow" d'autres utilisateurs (i.e. c'est un lien entre 1 utilisateur et un autre)
Pour l'instant nous ne pouvons pas "Liker ou retweeter" un Retweet.

1. Etablir le MCD de TwitterSchool.com
2. A partir du MCD, établir le diagramme des tables relationnelles de TwitterSchool.com

Si vous n'avez pas réussi à établir un schéma fonctionnel, vous pouvez demander le script d'initialisation

3. Lister les utilsateurs suivi par un autre utilisateur (celui avec un ID = 1)
4. Lister les utilsateurs né après 1990
5. Lister les tweets des utilisateurs ayant écrit au moins commentaire
6. Lister le nom, prénom des utilisateurs ayant effectué un Retweet sans doublons
7. Lister les noms, prénoms des utilisateurs ayant effectué plus de 3 Tweets
8. Lister les utilisateurs ayant "Liker" au moins 2 commentaires et ayant retweeter au moins 1 fois.
9. Lister les utilisateurs suivis par au moins 5 autres utilisateurs sans doublons.