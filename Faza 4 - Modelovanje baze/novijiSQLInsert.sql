INSERT INTO Uloga VALUES
('ljubica', '123', 'ljubica@etf.rs', null, 1, 0, 'K', 0),
('nevajda', '123', 'nevajda@etf.rs', null, 0, 0, 'K', 1),
('mican', '123', 'mican@etf.rs', null, 1, 0, 'K', 0),
('djape', '123', 'djape@etf.rs', null, 1, 2.0, 'A', 0),
('tolstoj', '123', 'tolstoj@etf.rs', null, 1, 4.0, 'A', 0),
('kafka', '123', 'kafka@etf.rs', null, 0, 0, 'A', 0),
('dereta', '123', 'dereta@etf.rs', null, 1, 0, 'I', 0),
('jasen', '123', 'jasen@etf.rs', null, 1, 0, 'I', 0),
('klett', '123', 'klett@etf.rs', null, 0, 0, 'I', 0);

INSERT INTO Korisnik VALUES
('ljubica', 'Ljubica Muravljov', '2001-12-21', 1),
('nevajda', 'Luka Nevajda', '2000-11-10', 0),
('mican', 'Aleksa Micanovic', '2001-09-24', 0);

INSERT INTO Autor VALUES
('djape', 'Predrag Pesic', '2001-04-14', 'Rodjen u Beogradu. Nije umro.'),
('tolstoj', 'Lav Tolstoj', '1828-09-09', 'Rodjen na Jasnoj Poljani. Umro u Astapovu.'),
('kafka', 'Franc Kafka', '1883-07-03', 'Rodjen u Pragu. Umro u Klosternojburgu.');

INSERT INTO IzdavackaKuca VALUES
('dereta', 'Dereta', 'Jedna od najstarijih srpskih kuca.', 'Vladimira Rolovica 94, Beograd'),
('jasen', 'Jasen', 'Jedna od najopremljenijih srpskih kuca.', 'Lomina 4, Beograd'),
('klett', 'Klett', 'Jedna od najsavremenijih srpskih kuca.', 'Marsala Birjuzova 3, Beograd');

INSERT INTO ProdajnaMesta(IDIzdKuca, Adresa) VALUES
('dereta', 'Knez Mihailova 46, Beograd');

INSERT INTO Prati(IDPratilac, IDPracen) VALUES
('ljubica', 'mican'),
('ljubica', 'djape'),
('ljubica', 'dereta'),
('mican', 'ljubica'),
('mican', 'tolstoj'),
('djape', 'jasen');

INSERT INTO Objava VALUES
(1, 'Danas je lep dan, nisam dobio ban. Za razliku od Nevajde Luke, teske li su muke.', '2023-05-01', null, 'djape'),
(2, 'U tebe cu pucati iz puske ljute, Santa Maria Della Salute.', '2021-07-23', null, 'tolstoj'),
(3, 'Jako mi se svidja nova knjiga o Avataru.', '2023-04-15', null, 'ljubica'),
(4, 'Novosti o popustima mozete pronaci na nasoj web stranici.', '2022-09-10', null, 'klett'); 

INSERT INTO Povezani(IDAutor, IDIzdKuca) VALUES 
('djape', 'klett'),
('djape', 'jasen'),
('tolstoj', 'klett'),
('tolstoj', 'jasen'),
('tolstoj', 'dereta'),
('kafka', 'klett');

INSERT INTO Knjiga VALUES
('0000000000000', 'Operativni sistemi', null, 'Udzbenik iz operativnih sistema.', 4.5, 'jasen'),
('1111111111111', 'Ana Karenjina', null, 'Zivot Ane Karenjine.', 0, 'klett'),
('2222222222222', 'Rat i mir I tom', null, 'Velika i jako poucna prica o zivotnoj istini.', 2.0, 'jasen'),
('3333333333333', 'Rat i mir II tom', null, 'Nastavak sjajne drame Rat i mir.', 5.0, 'jasen'),
('4444444444444', 'Detinjstvo', null, 'U sto kafana proslo mi detinjstvo, o majko stara vise nista nije isto.', 0, 'dereta'),
('5555555555555', 'Proces', null, 'Prica o zivotu coveka koji se bori protiv sistema.', 0, 'klett'),
('6666666666666', 'Preobrazaj', null, 'Neverovatna pustolovina od prosjaka do kralja.', 0, 'klett'),
('7777777777777', 'Dvorac', null, 'Cardak, ni na nebu, ni na zemlji.', 0, 'klett');

INSERT INTO Napisao(IDAutor, ISBN) VALUES 
('djape', '0000000000000'), 
('tolstoj', '1111111111111'), 
('tolstoj', '2222222222222'), 
('tolstoj', '3333333333333'), 
('tolstoj', '4444444444444'), 
('kafka', '5555555555555'), 
('kafka', '6666666666666'), 
('kafka', '7777777777777');

INSERT INTO Kolekcija(KorIme, ISBN) VALUES
('ljubica', '0000000000000'),
('ljubica', '1111111111111'),
('mican', '0000000000000'),
('mican', '2222222222222'),
('mican', '3333333333333'),
('djape', '6666666666666');

INSERT INTO NajpopularnijiMesec VALUES
('3333333333333', 5.0, 'K'),
('0000000000000', 4.5, 'K'),
('2222222222222', 2.0, 'K'),
('tolstoj', 4.0, 'A'),
('djape', 2.0, 'A'),
('kafka', 0.0, 'A'),
('klett', 0.0, 'I'),
('jasen', 0.0, 'I'),
('dereta', 0.0, 'I');

INSERT INTO Recenzija(IDRec, Ocena, DatumObjave, Tekst, IDDavalac, IDPrimalacUloga, IDPrimalacKnjiga) VALUES
(1, 5, '2023-04-15', 'Sjajna knjiga, vise puta sam je procitala.', 'ljubica', NULL, '0000000000000'),
(2, 4, '2023-04-16', 'Dobra knjiga, pomogla mi je da dam OS u septembru.', 'nevajda', NULL, '0000000000000'),
(3, 4, '2023-04-17', 'Iskreno, jako kvalitetan pisac. Mnogo mi se svidja njegova brada.', 'nevajda', 'tolstoj', NULL),
(4, 2, '2023-04-18', 'Ocekivao sam mnogo vise od knjige.', 'mican', NULL, '2222222222222'),
(5, 5, '2023-04-19', 'U potpunosti je dopunio sve nedostatke iz prvog toma.', 'mican', NULL, '3333333333333'),
(6, 2, '2023-04-20', 'Moj brat, ali ne zna da pise.', 'mican', 'djape', NULL); 

INSERT INTO Licitacija VALUES
(1, 'Operativni sistemi', 'izmenitiOvdePutanju', '2023-04-10', '2023-04-15', 200, 2000, 'djape', 'jasen');

INSERT INTO Ponuda VALUES
(1, 200, 1, 'klett'),
(2, 1600, 1, 'dereta'),
(3, 2000, 1, 'jasen');