create database ParcInformatique

create table RoleUtilisateur
(
	id int IDENTITY(1,1) primary key,
	Roles text
)

create table Utilisateur
(
	id int identity(1,1) primary key,
	Nom varchar(30),
	Prenom varchar(30),
	Tel varchar(30),
	Adresse varchar(30),
	Ville varchar(30),
	Email varchar(30),
	Login_u varchar(30),
	Password_u varchar(30),
	Idrole int FOREIGN KEY REFERENCES RoleUtilisateur(id),
	isAdmin int default 0,
)

create table Client
(
	id int identity(1,1) primary key,
	Nom varchar(30),
	Tel varchar(30),
	Fax varchar(30),
	Adresse varchar(30),
	Ville varchar(30),
	Siteweb varchar(30),
	Debutcontract date,
	Heurcontract int,
	Prixheur FLOAT
)

create table affectationClient
(
	Id int,
	Idclient int foreign key references client(id),
	Idutilisateur int foreign key references utilisateur(id),
	Dateaffectation date,
	constraint ac_pk primary key (id,idclient,idutilisateur)
)

create table Departement
(
	id int identity(1,1) primary key,
	Nom varchar(30)
)

create table Employee
(
	id int identity(1,1) primary key,
	Nom varchar(30),
	Prenom varchar(30),
	Tel varchar(30),
	Email varchar(30),
	Login_e varchar(30),
	Password_e varchar(30),
	isDirecteur int default 0,
	Idrole int foreign key references RoleUtilisateur(id),
	IdDep int foreign key references Departement(id),
	
)
create table TypeProduit
(
	id int identity(1,1) primary key,
	Nom VARCHAR(20),
	SupportingSoftware int,
	SupportingUser int,
)

create table Produit
(
	id int identity(1,1) primary key,
	Nom varchar(30),

	IdType int foreign key references typeproduit(id)
)

create table ProduitClient
(
	id int identity(1,1) primary key,
)

create table Installer
(
	id INT IDENTITY(1,1) PRIMARY KEY,
	
)

create table ProduitUtiliser
(
	id int,
	IdProduitClient int foreign key references produitClient(id),
	IdEmployee int foreign key references employee(id),
	CONSTRAINT pr_pk PRIMARY KEY(id,IdProduitClient,IdEmployee)
)

create table ProprietesProduit
(
	id int identity(1,1) primary key,
	idType int foreign key references typeProduit(id)
)

create table ValeurProp
(
	Id int identity(1,1) primary key,
	Valeur varchar(30),
	IdProduit int foreign key references produit(id),
	IdPropriete int foreign key references proprietesproduit(id)
)

create table Demande
(
	Id int identity(1,1) primary key,
	Datedemande date,
	Description_d varchar(30),
	Statue varchar(30),
	IdEmployee INT foreign key references Employee(id)
)

create table Intervention
(
	Id int identity(1,1) primary key,
	Dateintervention date,
	Dateplacement int,
	Debut int,
	Fin int,
	Duree int,
	Activites VARCHAR(30),
	Description_i VARCHAR(30),
	Observation varchar(30)
)