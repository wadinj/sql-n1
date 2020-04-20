# La BDD c'est fantastique

# TwitterSchool.com

### Fonctionnalités à couvrir

TwitterSchool.com, c'est quoi :
- TwitterSchool doit permettre à un utilisateur de se connecter et de créer son profil.
	- La connexion doit être effectué par son email (unique) et un mot de passe
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
		- D'autres commentaires ?
	- Un Retweet contient :
		- Une date de retweet
		- Un Tweet
		- Un utilisateur
		- Un petit commentaire optionnel du retweet
	- Un Like contient :
		- Une date de like
		- Un utilisateur
		- Un emoji
	- Un utilisateur doit pouvoir "Follow" d'autres utilisateurs (i.e. c'est un lien entre 1 utilisateur et un autre)
Pour l'instant nous ne pouvons pas "Liker ou retweeter" un Retweet.

1. Etablir le MCD de TwitterSchool.com
2. A partir du MCD, établir le diagrammes des tables relationnelles de TwitterSchool.com
