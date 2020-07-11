Drop table Property Cascade Constraints;
Drop table Renter Cascade Constraints;
Drop table Renting Cascade Constraints;

Create Table Property (
	Pno		Number(4) Not Null,
	Street		Char(14),
	City		Char(10),
	Zip		Char(8),
	Rooms		Number(3),
	Rent		Number(5,2),
 	Primary Key(Pno));

Create Table Renter (
	Rno		Number(4) Not Null,
	FName		Char(10),
	LName		Char(10),
	Address		Char(40),
	Max_Rent	Number(5,2),
	Primary key (Rno));

Create Table Renting (
	Pno		Number(4) Not Null,
	Rno		Number(4) Not Null,
	Rent_Start	Date,
	Rent_End	Date,
	Primary key (Pno, Rno, Rent_Start),
	Foreign Key(Pno) references Property,
	Foreign Key(Rno) references Renter);

Insert into Property values (1,'16 Holhead','Dee','Aberdeen',6,650);
Insert into Property values (2,'6 Argyll St','Kilburn','London',4,400);
Insert into Property values (3,'6 Lawrence St','Partick','Glasgow',3,350);
Insert into Property values (4,'2 Manor Rd',NULL,'Glasgow',3,375);
Insert into Property values (5,'18 Dale Rd','Hyndland','Glasgow',5,600);
Insert into Property values (6,'5 Novar Dr','Hyndland','Glasgow',4,450);
Insert into Property values (7,'1 SQL Dr', 'Bloomington', 'Indiana','United States',3,650);
Insert into Property values (8,'1 SAP Dr', 'Chicago', 'Illinois',4,5500);

Insert into Renter values(1,'John','Kay','56 High St, Putney, London',425);
Insert into Renter values(2,'Aline','Stewart','64 Fern Dr, Pollock, Glasgow',450);
Insert into Renter values(3,'Mike','Ritchie','18 Tain St, Gourock',750);
Insert into Renter values(4,'Mary','Treager','5 Tarbot Rd, Kildary, Agerdeen',600);
Insert into Renter values(5,'Vinnie','Treager','2451 E 10th St, Bloomington, Indiana','United States',600);
Insert into Renter values(6,'Dalia','Anab','5 Blah Blah Rd.', 'Bloomington', 'Indiana','United States',600);

Insert into Renting values(1,4,'01-JAN-2005','30-DEC-2006');
Insert into Renting values(2,1,'01-FEB-2005','30-JUL-2006');
Insert into Renting values(3,2,'15-JAN-2006','30-DEC-2007');
Insert into Renting values(4,2,'01-JAN-2004','30-DEC-2006');
Insert into Renting values(1,3,'06-JUN-2007',NULL);
Insert into Renting values(3,4,'01-JAN-2007','30-DEC-2007');
Insert into Renting values(4,1,'01-JAN-2008',NULL);
Insert into Renting values(5,2,'01-MAR-2007',NULL);
Insert into Renting values(6,4,'01-JUL-2008','15-OCT-2010');
Insert into Renting values(6,3,'01-NOV-2010',NULL);
Insert into Renting values(7,5,'01-NOV-2010','01-NOV-2010');
Insert into Renting values(8,6,'01-NOV-2010','01-NOV-2010');

COMMIT;

SELECT Property.Pno,Property.Rent,Renter.FName,Renter.LName, Renting.Rent_Start FROM Renter,Property,Renting WHERE Renting.Rent_Start LIKE '%%-%%-2010';
SELECT Renter.Rno, Renter.FName,Renter.LName, Renting.Rent_Start,Renting.Rent_End, Property.Rent FROM Renting,Renter,Property WHERE Property.Rent > 0;
SELECT COUNT(Renting.Pno) FROM Renting WHERE Renting.Pno=Property.Pno AND Renting.Pno = 4;
SELECT Renter.Address, Renter.Rno, Renter.FName, Renter.LName, Renting.Rno, COUNT(Renting.Rno) FROM Renter INNER JOIN Renting ON Renter.Rno = Renting.Rno GROUP BY Renter.Address, Renter.Rno, Renter.FName, Renter.LName, Renting.Rno;
SELECT SUM(Property.Rent), Renting.Rent_End FROM Property,Renting WHERE Renting.Rent_End = NULL;
