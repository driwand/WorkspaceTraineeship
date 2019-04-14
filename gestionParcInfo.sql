create database ParcInformatique
use parcInformatique

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

	Datecreation date default(getdate()),
	Datemodification date,
	Creepar int foreign key references utilisateur(id),
	Modifierpar int foreign key references utilisateur(id),
	IsDeleted int
)



create table RoleUtilisateur
(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Nom VARCHAR(50),
	IdUtilisateur INT FOREIGN KEY REFERENCES Utilisateur(id),

	Datecreation date default(getdate()),
	Datemodification date,
	Creepar int foreign key references utilisateur(id),
	Modifierpar int foreign key references utilisateur(id),
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
	Heurecontract INT,
	Prixheur FLOAT,

	Datecreation date default(getdate()),
	Datemodification date,
	Creepar int foreign key references utilisateur(id),
	Modifierpar int foreign key references utilisateur(id),
	IsDeleted int
)

create table AffectationClient
(
	Id INT IDENTITY(1,1),
	Idclient INT FOREIGN KEY REFERENCES client(id),
	Idutilisateur INT FOREIGN KEY REFERENCES utilisateur(id),
	Dateaffectation DATE default(getdate()),
	constraINT ac_pk PRIMARY KEY (id,idclient,idutilisateur),
	
	Datemodification date,
	Modifierpar int foreign key references utilisateur(id),
	IsDeleted int
)

create table Departement
(
	id INT IDENTITY(1,1) PRIMARY KEY,
	Nom VARCHAR(30),
	IdDeleted int,
	IdCLient int foreign key references client(id)
)

create table Employee
(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Nom VARCHAR(30),
	Prenom VARCHAR(30),
	Tel VARCHAR(30),
	Email VARCHAR(30) unique,
	Login_e VARCHAR(30),
	Password_e VARCHAR(30),
	IsResponsable INT default 0,
	IdDep INT FOREIGN KEY REFERENCES Departement(id),
	Idclient int foreign key references client(id),


	Datecreation date default(getdate()),
	Datemodification date,

	Creepar int foreign key references utilisateur(id),
	Modifierpar int foreign key references utilisateur(id),

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

	IsHardware INT,
	IdType INT FOREIGN KEY REFERENCES typeproduit(id),

	Datecreation date default(getdate()),
	Datemodification date,
	
	Creepar int foreign key references utilisateur(id),
	Modifierpar int foreign key references utilisateur(id),
	
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
	Datedemande DATE default getdate(),
	Description_d text,
	Statut VARCHAR(30),
	IdEmployee INT FOREIGN KEY REFERENCES Employee(id),

	
	Datemodification date,
	Modifierpar int foreign key references utilisateur(id),
	IsDeleted int
)


create table Intervention
(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	DateIntervention DATE default(getdate()),
	Deplacement varchar(30),
	TypeIntervention varchar(30),
	Debut DATE,
	Fin DATE,
	Duree INT,
	
	Statut VARCHAR(20),
	IdDemande INT FOREIGN KEY REFERENCES Demande(id),
	Idutilisateur int foreign key references utilisateur(id),
	Idclient int foreign key references client(id),

	Datemodification date,
	Modifierpar int foreign key references utilisateur(id),
	IsDeleted int
)

create table observation
(
	Id int identity(1,1) primary key,
	IdIntervention int foreign key references intervention(id),
	IdUser varchar(30),
	TypeOb varchar(30), --client,inter,system
	Textobservation text
)

create table ProduitClient
(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Dateaffectation DATE default getdate(),
	Prixvente FLOAT,
	Idclient INT FOREIGN KEY REFERENCES Client(id),
	Idproduit INT FOREIGN key REFERENCES Produit(id),
	ParIntervention INT FOREIGN KEY REFERENCES Intervention(id),
   
	Datemodification date,
	
	Creepar int foreign key references utilisateur(id),
	Modifierpar int foreign key references utilisateur(id),
	IsDeleted int
)

create table Installer
(
	id INT IDENTITY(1,1) PRIMARY KEY,
	Dateexpiration DATE,
	Idlogiciel INT FOREIGN KEY REFERENCES produitClient(id),
	Idsoftware INT FOREIGN KEY REFERENCES produitClient(id),

	Datecreation date default(getdate()),
	Datemodification date,
	Creepar int foreign key references utilisateur(id),
	Modifierpar int foreign key references utilisateur(id),
	IsDeleted int
)

create table ProduitUtiliser
(
	Id INT IDENTITY(1,1),
	IdProduitClient INT FOREIGN KEY REFERENCES produitClient(id),
	IdEmployee INT FOREIGN KEY REFERENCES employee(id),

	Login_u VARCHAR(30),
	Password_u VARCHAR(30),
	CONSTRAINT pu_pk PRIMARY KEY(id,IdProduitClient,IdEmployee),

	Datecreation date default(getdate()),
	Datemodification date,
	
	Creepar int foreign key references utilisateur(id),
	Modifierpar int foreign key references utilisateur(id),
	
	IsDeleted int
)

insert into Client(Nom) values ('guijj') select SCOPE_IDENTITY()


select * from Intervention 
select * from observation
select * from Demande





select * from Utilisateur

alter table intervention
add constraint default_date default getdate() for dateintervention

insert into Demande(Description_d,Statut,IdEmployee) values ('Ihave ap roblm with my computer hgrehjkh ururiui uiruoeiyrey ulore mlemihi yurjhjk so that wpnt djh yh ueupozphoaie  nand wdo hnin yujjj ruiyeyej hhhfoor ioro mi ue  uso that will mkes me glad','encours',1)

insert into Demande(Description_d,Statut,IdEmployee) values ('So that withh orkjrlj heurutruteriu ierytierrifr eriuuieriyei yeeryptuierypityerpiyt reutyeruityeroi uâ zerutyeruotyioer erutuo','encours',1)