# La BDD c'est fantastique
# NetflixSchool.com

### Fonctionnalités à couvrir

NetflixSchool.com, c'est quoi :
- NetflixSchool doit permettre à un utilisateur de se connecter et de créer son profil.
	- La connexion doit être effectué par son email ou son numéro de téléphone et un mot de passe
	- Un utilisateur contient les caractéristiques suivantes :
		- email
		- telephone
		- mot de passe
	- Un utilisateur contient plusieurs profils avec les caractéristiques suivantes :
		- Une photo
		- Son nom
		- Son nickname
		- Son prénom
		- Sa date de naissance
- NetflixSchool répertorie du contenu (avec des types (i.e films, des series, des mangas et des dessins animés)) avec les caractéristique suivantes :
		- Un titre
		- Une date de mise en ligne
		- Une date de sortie
		- Origine

Nous devons être capable de savoir quel est le type d'un contenu correspondant à un enregistrement
- Chaque contenu contient plusieurs langue de diffusion, une langue est composé de :
	- Un code ISO unique
	- le label de la langue (i.e Français)

1. Etablir le MCD de NetflixSchool.com
2. A partir du MCD, établir le diagrammes des tables relationnelles de NetflixSchool.com