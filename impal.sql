--1.Bank
--create
CREATE TABLE Bank (
	Kode_Bank varchar(50) NOT NULL,
	Nama_Bank varchar(50) NOT NULL,
	Alamat varchar(50) NOT NULL,
	PRIMARY KEY (Kode_Bank)
);
--Insert
INSERT INTO Bank  (Kode_Bank, Nama_Bank, Alamat)
VALUES ("B001","GangBank Bandung","Bandung"),
	("B002","GangBank Jogjakarta","Jogjakarta"),
	("B003","GangBank Jakarta","jakarta"),
	("B004","GangBank Semarang","Semarang"),
	("B005","GangBank Cilegon","Cilegon"),
	("B006","GangBank Bali","Bali"),
	("B007","GangBank Malang","Malang"),
	("B008","GangBank Bogor","Bogor"),
	("B009","GangBank Bekasi","Bekasi"),
	("B010","GangBank Tanggerang","Tanggerang");
--Select
SELECT Nama_Bank FROM Bank;

--2.Rekening
--create
CREATE TABLE Rekening (
	No_Rekening varchar(20) NOT NULL,
	Kode_Bank varchar(50) NOT NULL,
	Saldo int NOT NULL,
	PRIMARY KEY (No_Rekening),
	CONSTRAINT bank_rel FOREIGN KEY (Kode_Bank) REFERENCES Bank(Kode_Bank)
);
--Insert
INSERT INTO Rekening  (No_Rekening, Kode_Bank, Saldo)
VALUES ("666256111","B001",1000000),
	("666256112","B002",1500000),
	("666256113","B001",1000000000),
	("666256114","B002",2000000),
	("666256115","B003",3500000),
	("666256116","B001",2360000),
	("666256117","B005",7500000),
	("666256118","B008",10000000),
	("666256119","B007",15000000),
	("666256120","B010",500000);
--Select
SELECT * FROM Rekening;

--3.Nasabah
--create
CREATE TABLE Nasabah (
	Id_Nasabah varchar(50) NOT NULL,
	No_Rekening varchar(20) NOT NULL,
	Nama varchar(100) NOT NULL,
	Username varchar(50) NOT NULL,
	Password varchar(50) NOT NULL,
	No_HP varchar(12) NOT NULL,
	Alamat varchar(100) NOT NULL,
	PRIMARY KEY (Id_Nasabah),
	CONSTRAINT nasa_rek FOREIGN KEY (No_Rekening) REFERENCES Rekening(No_Rekening)
);
--Insert
INSERT INTO Nasabah (Id_Nasabah, No_Rekening, Nama, Username, Password, No_HP, Alamat)
VALUES ("N671001","666256111","Lukman","Lukman123","sandilukman","08777123666","sukabirus"),
        ("N671002","666256112","Dandi","Dandi123","sandidandi","087771234267","sukapura"),
        ("N671003","666256113","Khairul","Khairul123","sandikhairul","08777123454","bojongsoang"),
        ("N671004","666256114","Fikhri","Fikhri123","sandifikhri","08777127866","dayeuhkolot"),
        ("N671005","666256115","Rifqi","Rifqi123","sandirifqi","08777123655","sukapura"),
        ("N671006","666256116","Taufik","Taufik123","sanditaufik","08777111666","cicaheum"),
        ("N671007","666256117","Siti","Siti123","sandisiti","08777123897","cimahi"),
        ("N671008","666256118","Diah","Diah123","sandidiah","08777153666","lembang"),
        ("N671009","666256119","Brenda","Brenda123","sandibrenda","08777120886","buah batu"),
        ("N671010","666256120","Amel","Amel123","sandiamel","08777123098","citeureup");
--Select
SELECT Nama, No_HP, Alamat FROM Nasabah;


--4.Transaksi
--create
CREATE TABLE Transaksi (
	No_Transaksi varchar(20) NOT NULL,
	Id_Nasabah varchar(50) NOT NULL,
	Id_Admin varchar(50) NOT NULL,
	Tanggal Date NOT NULL,
	Nominal int NOT NULL,
	PRIMARY KEY (No_Transaksi),
	CONSTRAINT trans_nas FOREIGN KEY (Id_Nasabah) REFERENCES  Nasabah(Id_Nasabah),
	CONSTRAINT trans_admin FOREIGN KEY (Id_Admin) REFERENCES Admin(Id_Admin)
);
--Insert
INSERT INTO Transaksi (No_Transaksi, Id_Nasabah, Id_Admin, Tanggal, Nominal)
VALUES ("T0909111","N671001","A001",10/10/2018,100000),
        ("T0909112","N671002","A002",11/10/2018,150000),
        ("T0909113","N671003","A003",12/10/2018,1100000),
        ("T0909114","N671004","A004",13/10/2018,1200000),
        ("T0909115","N671005","A005",14/10/2018,1300000),
        ("T0909116","N671006","A006",15/10/2018,1400000),
        ("T0909117","N671007","A007",16/10/2018,1500000),
        ("T0909118","N671008","A008",17/10/2018,2000000),
        ("T0909119","N671009","A009",18/10/2018,190000),
        ("T0909120","N671010","A010",19/10/2018,200000);
--Select
SELECT No_Transaksi, Tanggal, Nominal FROM Transaksi;


--5.Admin
--create
CREATE TABLE Admin (
	Id_Admin varchar(50) NOT NULL,
	Nama_Admin varchar(100) NOT NULL,
	Alamat varchar(50) NOT NULL,
	PRIMARY KEY (Id_Admin)
);
--Insert
INSERT INTO Admin (Id_Admin, Nama_Admin, Alamat)
VALUES ("A001","admin 1","bandung"),
	("A002","admin 2","jakarta"),
	("A003","admin 3","surabaya"),
	("A004","admin 4","Jogjakarta"),
	("A005","admin 5","Bekasi"),
	("A006","admin 6","Depok"),
	("A007","admin 7","Semarang"),
	("A008","admin 8","Padang"),
	("A009","admin 9","Aceh"),
	("A010","admin 10","Bengkulu");
--Select
SELECT Nama_Admin FROM Admin;


--6.Transfer
--create
CREATE TABLE Transfer (
	No_Transaksi varchar(20) NOT NULL,
    Rek_Tujuan varchar(20) NOT NULL,
	CONSTRAINT Trans_tr FOREIGN KEY (No_Transaksi) REFERENCES Transaksi(No_Transaksi)
);
--Insert
INSERT INTO Transfer (No_Transaksi, Rek_Tujuan)
VALUES ("T101501","666256111"),
	("T101502","666256112"),
	("T101503","666256113"),
	("T101504","666256114"),
	("T101505","666256115"),
	("T101506","666256116"),
	("T101507","666256117"),
	("T101508","666256118"),
	("T101509","666256119"),
	("T101510","666256120");
--Select
SELECT * FROM Transfer;

--7.Virtual_Akun
--create
CREATE TABLE Virtual_Akun (
    No_Transaksi varchar(20) NOT NULL,
	Rek_Virtual  varchar(20) NOT NULL,
	CONSTRAINT Trans_vir FOREIGN KEY (No_Transaksi) REFERENCES Transaksi(No_Transaksi)
);
--Insert
INSERT INTO Virtual_Akun (No_Transaksi, Rek_Virtual)
VALUES ("TV101511","666256111"),
	("TV101512","666256112"),
	("TV101513","666256113"),
	("TV101514","666256114"),
	("TV101515","666256115"),
	("TV101516","666256116"),
	("TV101517","666256117"),
	("TV101518","666256118"),
	("TV101519","666256119"),
	("TV101520","666256120");
--Select
SELECT * FROM Virtual_Akun;

