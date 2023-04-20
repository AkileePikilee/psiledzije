
CREATE TABLE [Autor]
( 
	[KorIme]             varchar(20)  NOT NULL ,
	[ImePrezime]         varchar(40)  NOT NULL ,
	[DatumRodjenja]      datetime  NOT NULL ,
	[Biografija]         varchar(1000)  NOT NULL 
)
go

CREATE TABLE [IzdavackaKuca]
( 
	[KorIme]             varchar(20)  NOT NULL ,
	[Naziv]              varchar(40)  NOT NULL ,
	[Istorija]           varchar(1000)  NULL ,
	[Adresa]             varchar(60)  NOT NULL 
)
go

CREATE TABLE [Knjiga]
( 
	[ISBN]               varchar(20)  NOT NULL ,
	[Naziv]              varchar(40)  NOT NULL ,
	[Slika]              varbinary  NULL ,
	[Opis]               varchar(100)  NULL ,
	[ProsecnaOcena]      decimal(5,2)  NOT NULL 
	CONSTRAINT [Nula_244613327]
		 DEFAULT  0
	CONSTRAINT [IzmedjuNulaPet_1456810939]
		CHECK  ( ProsecnaOcena BETWEEN 0 AND 5 ),
	[IDIzdKuca]          varchar(20)  NOT NULL 
)
go

CREATE TABLE [Kolekcija]
( 
	[KorIme]             varchar(20)  NOT NULL ,
	[ISBN]               varchar(20)  NOT NULL 
)
go

CREATE TABLE [Korisnik]
( 
	[KorIme]             varchar(20)  NOT NULL ,
	[ImePrezime]         varchar(40)  NOT NULL ,
	[DatumRodjenja]      datetime  NOT NULL ,
	[Admin]              bit  NOT NULL 
)
go

CREATE TABLE [Licitacija]
( 
	[IDLicitacija]       integer  NOT NULL ,
	[NazivDela]          varchar(40)  NOT NULL ,
	[PDF]                varbinary  NOT NULL ,
	[DatumPocetka]       datetime  NOT NULL ,
	[DatumKraja]         datetime  NOT NULL ,
	[PocetnaCena]        integer  NOT NULL 
	CONSTRAINT [VeceJednakoOdNula_1976295580]
		CHECK  ( PocetnaCena >= 0 ),
	[TrenutniIznos]      integer  NOT NULL 
	CONSTRAINT [Nula_2099060818]
		 DEFAULT  0
	CONSTRAINT [VeceJednakoOdNula_232792837]
		CHECK  ( TrenutniIznos >= 0 ),
	[IDAutor]            varchar(20)  NOT NULL ,
	[IDPobednik]         varchar(20)  NULL 
)
go

CREATE TABLE [NajpopularnijiMesec]
( 
	[IDOcenjenog]        varchar(20)  NOT NULL ,
	[ProsecnaOcena]      decimal(5,2)  NOT NULL 
	CONSTRAINT [IzmedjuNulaPet_2045329637]
		CHECK  ( ProsecnaOcena BETWEEN 0 AND 5 ),
	[Tip]                char  NOT NULL 
	CONSTRAINT [TipPopularan_609004974]
		CHECK  ( [Tip]='K' OR [Tip]='I' OR [Tip]='A' )
)
go

CREATE TABLE [Napisao]
( 
	[IDAutor]            varchar(20)  NOT NULL ,
	[ISBN]               varchar(20)  NOT NULL 
)
go

CREATE TABLE [Objava]
( 
	[IDObjava]           integer  NOT NULL ,
	[Sadrzaj]            varchar(1000)  NOT NULL ,
	[DatumObjave]        datetime  NOT NULL ,
	[Slika]              varbinary  NULL ,
	[KorIme]             varchar(20)  NOT NULL 
)
go

CREATE TABLE [Ponuda]
( 
	[IDPonuda]           integer  NOT NULL ,
	[Iznos]              integer  NOT NULL 
	CONSTRAINT [VeceJednakoOdNula_1477657929]
		CHECK  ( Iznos >= 0 ),
	[IDLicitacija]       integer  NOT NULL ,
	[IDIzdKuca]          varchar(20)  NOT NULL 
)
go

CREATE TABLE [Povezani]
( 
	[IDAutor]            varchar(20)  NOT NULL ,
	[IDIzdKuca]          varchar(20)  NOT NULL 
)
go

CREATE TABLE [Prati]
( 
	[IDPratilac]         varchar(20)  NOT NULL ,
	[IDPracen]           varchar(20)  NOT NULL 
)
go

CREATE TABLE [ProdajnaMesta]
( 
	[IDIzdKuca]          varchar(20)  NOT NULL ,
	[Adresa]             varchar(60)  NOT NULL 
)
go

CREATE TABLE [Recenzija]
( 
	[IDRec]              integer  NOT NULL ,
	[Ocena]              integer  NOT NULL 
	CONSTRAINT [IzmedjuNulaPet_728450822]
		CHECK  ( Ocena BETWEEN 0 AND 5 ),
	[DatumObjave]        datetime  NOT NULL ,
	[Tekst]              varchar(1000)  NOT NULL ,
	[IDDavalac]          varchar(20)  NOT NULL ,
	[IDPrimalacUloga]    varchar(20)  NULL ,
	[IDPrimalacKnjiga]   varchar(20)  NULL 
)
go

CREATE TABLE [Uloga]
( 
	[KorIme]             varchar(20)  NOT NULL ,
	[Sifra]              varchar(40)  NOT NULL ,
	[Email]              varchar(40)  NOT NULL ,
	[Slika]              varbinary  NULL ,
	[BrPratilaca]        integer  NOT NULL 
	CONSTRAINT [Nula_471390749]
		 DEFAULT  0
	CONSTRAINT [VeceJednakoOdNula_161082788]
		CHECK  ( BrPratilaca >= 0 ),
	[ProsecnaOcena]      decimal(5,2)  NOT NULL 
	CONSTRAINT [Nula_148871629]
		 DEFAULT  0
	CONSTRAINT [IzmedjuNulaPet_1037513072]
		CHECK  ( ProsecnaOcena BETWEEN 0 AND 5 ),
	[Tip]                char  NOT NULL 
	CONSTRAINT [TipUloga_2006560910]
		CHECK  ( [Tip]='A' OR [Tip]='K' OR [Tip]='I' ),
	[Banovan]            bit  NOT NULL 
	CONSTRAINT [NijeBanovan_422400377]
		 DEFAULT  False
)
go

ALTER TABLE [Autor]
	ADD CONSTRAINT [XPKAutor] PRIMARY KEY  CLUSTERED ([KorIme] ASC)
go

ALTER TABLE [IzdavackaKuca]
	ADD CONSTRAINT [XPKIzdavackaKuca] PRIMARY KEY  CLUSTERED ([KorIme] ASC)
go

ALTER TABLE [Knjiga]
	ADD CONSTRAINT [XPKKnjiga] PRIMARY KEY  CLUSTERED ([ISBN] ASC)
go

ALTER TABLE [Kolekcija]
	ADD CONSTRAINT [XPKKolekcija] PRIMARY KEY  CLUSTERED ([KorIme] ASC,[ISBN] ASC)
go

ALTER TABLE [Korisnik]
	ADD CONSTRAINT [XPKKorisnik] PRIMARY KEY  CLUSTERED ([KorIme] ASC)
go

ALTER TABLE [Licitacija]
	ADD CONSTRAINT [XPKLicitacija] PRIMARY KEY  CLUSTERED ([IDLicitacija] ASC)
go

ALTER TABLE [NajpopularnijiMesec]
	ADD CONSTRAINT [XPKNajpopularnijiMesec] PRIMARY KEY  CLUSTERED ([IDOcenjenog] ASC)
go

ALTER TABLE [Napisao]
	ADD CONSTRAINT [XPKNapisao] PRIMARY KEY  CLUSTERED ([IDAutor] ASC,[ISBN] ASC)
go

ALTER TABLE [Objava]
	ADD CONSTRAINT [XPKObjava] PRIMARY KEY  CLUSTERED ([IDObjava] ASC)
go

ALTER TABLE [Ponuda]
	ADD CONSTRAINT [XPKPonuda] PRIMARY KEY  CLUSTERED ([IDPonuda] ASC)
go

ALTER TABLE [Povezani]
	ADD CONSTRAINT [XPKPovezani] PRIMARY KEY  CLUSTERED ([IDAutor] ASC,[IDIzdKuca] ASC)
go

ALTER TABLE [Prati]
	ADD CONSTRAINT [XPKPrati] PRIMARY KEY  CLUSTERED ([IDPratilac] ASC,[IDPracen] ASC)
go

ALTER TABLE [ProdajnaMesta]
	ADD CONSTRAINT [XPKProdajnaMesta] PRIMARY KEY  CLUSTERED ([IDIzdKuca] ASC,[Adresa] ASC)
go

ALTER TABLE [Recenzija]
	ADD CONSTRAINT [XPKRecenzija] PRIMARY KEY  CLUSTERED ([IDRec] ASC)
go

ALTER TABLE [Uloga]
	ADD CONSTRAINT [XPKUloga] PRIMARY KEY  CLUSTERED ([KorIme] ASC)
go


ALTER TABLE [Autor]
	ADD CONSTRAINT [R_1] FOREIGN KEY ([KorIme]) REFERENCES [Uloga]([KorIme])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [IzdavackaKuca]
	ADD CONSTRAINT [R_5] FOREIGN KEY ([KorIme]) REFERENCES [Uloga]([KorIme])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Knjiga]
	ADD CONSTRAINT [R_11] FOREIGN KEY ([IDIzdKuca]) REFERENCES [IzdavackaKuca]([KorIme])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Kolekcija]
	ADD CONSTRAINT [R_14] FOREIGN KEY ([KorIme]) REFERENCES [Uloga]([KorIme])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Kolekcija]
	ADD CONSTRAINT [R_15] FOREIGN KEY ([ISBN]) REFERENCES [Knjiga]([ISBN])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Korisnik]
	ADD CONSTRAINT [R_2] FOREIGN KEY ([KorIme]) REFERENCES [Uloga]([KorIme])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [Licitacija]
	ADD CONSTRAINT [R_20] FOREIGN KEY ([IDAutor]) REFERENCES [Autor]([KorIme])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Licitacija]
	ADD CONSTRAINT [R_21] FOREIGN KEY ([IDPobednik]) REFERENCES [IzdavackaKuca]([KorIme])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Napisao]
	ADD CONSTRAINT [R_12] FOREIGN KEY ([IDAutor]) REFERENCES [Autor]([KorIme])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Napisao]
	ADD CONSTRAINT [R_13] FOREIGN KEY ([ISBN]) REFERENCES [Knjiga]([ISBN])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Objava]
	ADD CONSTRAINT [R_19] FOREIGN KEY ([KorIme]) REFERENCES [Uloga]([KorIme])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Ponuda]
	ADD CONSTRAINT [R_22] FOREIGN KEY ([IDLicitacija]) REFERENCES [Licitacija]([IDLicitacija])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Ponuda]
	ADD CONSTRAINT [R_23] FOREIGN KEY ([IDIzdKuca]) REFERENCES [IzdavackaKuca]([KorIme])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Povezani]
	ADD CONSTRAINT [R_8] FOREIGN KEY ([IDAutor]) REFERENCES [Autor]([KorIme])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Povezani]
	ADD CONSTRAINT [R_9] FOREIGN KEY ([IDIzdKuca]) REFERENCES [IzdavackaKuca]([KorIme])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Prati]
	ADD CONSTRAINT [R_6] FOREIGN KEY ([IDPratilac]) REFERENCES [Uloga]([KorIme])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Prati]
	ADD CONSTRAINT [R_7] FOREIGN KEY ([IDPracen]) REFERENCES [Uloga]([KorIme])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [ProdajnaMesta]
	ADD CONSTRAINT [R_10] FOREIGN KEY ([IDIzdKuca]) REFERENCES [IzdavackaKuca]([KorIme])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Recenzija]
	ADD CONSTRAINT [R_16] FOREIGN KEY ([IDDavalac]) REFERENCES [Uloga]([KorIme])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Recenzija]
	ADD CONSTRAINT [R_17] FOREIGN KEY ([IDPrimalacUloga]) REFERENCES [Uloga]([KorIme])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Recenzija]
	ADD CONSTRAINT [R_18] FOREIGN KEY ([IDPrimalacKnjiga]) REFERENCES [Knjiga]([ISBN])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go