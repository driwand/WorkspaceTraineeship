create database ParcInformatique
use parcInformatique

create table RoleUtilisateur
(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Nom VARCHAR(50),
	IdUtilisateur INT FOREIGN KEY REFERENCES Utilisateur(id),

	Datecreation date,
	Datemodification date,
	Datesuppression date,
	Creepar int foreign key references utilisateur(id),
	Modifierpar int foreign key references utilisateur(id),
	Supprimerpar int foreign key references utilisateur(id),
	IsDeleted int
)

create table Utilisateur
(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Nom VARCHAR(30),
	Prenom VARCHAR(30),
	Tel VARCHAR(30),
	Adresse VARCHAR(30),
	Ville VARCHAR(30),
	Email VARCHAR(30),
	Login_u VARCHAR(30),
	Password_u VARCHAR(30),
	Codepin INT,
	isAdmin INT default 0,

	Datecreation date,
	Datemodification date,
	Datesuppression date,
	Creepar int foreign key references utilisateur(id),
	Modifierpar int foreign key references utilisateur(id),
	Supprimerpar int foreign key references utilisateur(id),
	IsDeleted int
)

create table Client
(
	id INT IDENTITY(1,1) PRIMARY KEY,
	Nom VARCHAR(30),
	Tel VARCHAR(30),
	Fax VARCHAR(30),
	Adresse VARCHAR(30),
	Ville VARCHAR(30),
	Siteweb VARCHAR(30),
	Debutcontract DATE,
	Heurcontract INT,
	Prixheur FLOAT,

	Datecreation date,
	Datemodification date,
	Datesuppression date,
	Creepar int foreign key references utilisateur(id),
	Modifierpar int foreign key references utilisateur(id),
	Supprimerpar int foreign key references utilisateur(id),
	IsDeleted int
)

create table AffectationClient
(
	Id INT IDENTITY(1,1),
	Idclient INT FOREIGN KEY REFERENCES client(id),
	Idutilisateur INT FOREIGN KEY REFERENCES utilisateur(id),
	Dateaffectation DATE,
	constraINT ac_pk PRIMARY KEY (id,idclient,idutilisateur),
	
	Datemodification date,
	Datesuppression date,
	Modifierpar int foreign key references utilisateur(id),
	Supprimerpar int foreign key references utilisateur(id),
	IsDeleted int
)

create table Departement
(
	id INT IDENTITY(1,1) PRIMARY KEY,
	Nom VARCHAR(30),
	IdDeleted int
)

create table Employee
(
	id INT IDENTITY(1,1) PRIMARY KEY,
	Nom VARCHAR(30),
	Prenom VARCHAR(30),
	Tel VARCHAR(30),
	Email VARCHAR(30),
	Login_e VARCHAR(30),
	Password_e VARCHAR(30),
	isResponsable INT default 0,
	IdDep INT FOREIGN KEY REFERENCES Departement(id),
	Codepin INT,

	Datecreation date,
	Datemodification date,
	Datesuppression date,
	Creepar int foreign key references utilisateur(id),
	Modifierpar int foreign key references utilisateur(id),
	Supprimerpar int foreign key references utilisateur(id),

	Creepar_ int foreign key references Employee(id),
	Modifierpar_ int foreign key references Employee(id),
	Supprimerpar_ int foreign key references Employee(id),
	IsDeleted int
)
create table TypeProduit
(
	id INT IDENTITY(1,1) PRIMARY KEY,
	Nom VARCHAR(20),
	SupportingSoftware INT,
	SupportingUser INT,
	IsDeleted int
)

create table Produit
(
	id INT IDENTITY(1,1) PRIMARY KEY,
	Nom VARCHAR(30),
	Model VARCHAR(30),
	Marque VARCHAR(30),
	Datefabrication Date,
	Prix float,
	Login_p VARCHAR(30),
	Password_p VARCHAR(30),
	Editeur VARCHAR(30),
	Version_p VARCHAR(20),
	IsHardware INT,
	IdType INT FOREIGN KEY REFERENCES typeproduit(id),

	Datecreation date,
	Datemodification date,
	Datesuppression date,
	Creepar int foreign key references utilisateur(id),
	Modifierpar int foreign key references utilisateur(id),
	Supprimerpar int foreign key references utilisateur(id),
	IsDeleted int
)

create table ProprietesProduit
(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Nom VARCHAR(30),
	idType INT FOREIGN KEY REFERENCES typeProduit(id),
	IsDeleted int
)

create table ValeurProp
(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Valeur VARCHAR(30),
	IdProduit INT FOREIGN KEY REFERENCES produit(id),
	IdPropriete INT FOREIGN KEY REFERENCES proprietesproduit(id)
)

create table Demande
(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Datedemande DATE,
	Description_d VARCHAR(30),
	Statue VARCHAR(30),
	IdEmployee INT FOREIGN KEY REFERENCES Employee(id),

	
	Datemodification date,
	Datesuppression date,
	Modifierpar int foreign key references utilisateur(id),
	Supprimerpar int foreign key references utilisateur(id),

	Creepar_ int foreign key references Employee(id),
	Modifierpar_ int foreign key references Employee(id),
	Supprimerpar_ int foreign key references Employee(id),
	IsDeleted int
)

create table Intervention
(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	DateIntervention DATE,
	Dateplacement INT,
	Debut INT,
	Fin INT,
	Duree INT,
	Activites TEXT,
	Description_i TEXT,
	Observation TEXT,
	Statue VARCHAR(20),
	IdDemande INT FOREIGN KEY REFERENCES Demande(id),
	Idutilisateur int foreign key references utilisateur(id),

	Datemodification date,
	Datesuppression date,
	Modifierpar int foreign key references utilisateur(id),
	Supprimerpar int foreign key references utilisateur(id),
	IsDeleted int
)

create table ProduitClient
(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Dateaffectation DATE,
	Prixvente FLOAT,
	Idclient INT FOREIGN KEY REFERENCES Client(id),
	Idproduit INT FOREIGN key REFERENCES Produit(id),
	ParIntervention INT FOREIGN KEY REFERENCES Intervention(id),


	Datemodification date,
	Datesuppression date,
	Creepar int foreign key references utilisateur(id),
	Modifierpar int foreign key references utilisateur(id),
	Supprimerpar int foreign key references utilisateur(id),

	Creepar_ int foreign key references Employee(id),
	Modifierpar_ int foreign key references Employee(id),
	Supprimerpar_ int foreign key references Employee(id),
	IsDeleted int
)

create table Installer
(
	id INT IDENTITY(1,1) PRIMARY KEY,
	Dateexpiration DATE,
	Idlogiciel INT FOREIGN KEY REFERENCES produitClient(id),
	Idsoftware INT FOREIGN KEY REFERENCES produitClient(id),

	Datecreation date,
	Datemodification date,
	Datesuppression date,
	Creepar int foreign key references utilisateur(id),
	Modifierpar int foreign key references utilisateur(id),
	Supprimerpar int foreign key references utilisateur(id),

	Creepar_ int foreign key references Employee(id),
	Modifierpar_ int foreign key references Employee(id),
	Supprimerpar_ int foreign key references Employee(id),
	IsDeleted int
)

create table ProduitUtiliser
(
	Id INT IDENTITY(1,1),
	IdProduitClient INT FOREIGN KEY REFERENCES produitClient(id),
	IdEmployee INT FOREIGN KEY REFERENCES employee(id),
	CONSTRAINT pu_pk PRIMARY KEY(id,IdProduitClient,IdEmployee),

	Datecreation date,
	Datemodification date,
	Datesuppression date,
	Creepar int foreign key references utilisateur(id),
	Modifierpar int foreign key references utilisateur(id),
	Supprimerpar int foreign key references utilisateur(id),
	
	Creepar_ int foreign key references Employee(id),
	Modifierpar_ int foreign key references Employee(id),
	Supprimerpar_ int foreign key references Employee(id),
	IsDeleted int
)
