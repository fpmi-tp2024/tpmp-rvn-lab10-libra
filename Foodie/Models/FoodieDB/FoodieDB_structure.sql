PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "MenuItems" (
	"Id"	INTEGER,
	"Title"	TEXT,
	"Image"	TEXT,
	"Price"	REAL,
	PRIMARY KEY("Id" AUTOINCREMENT)
);
INSERT INTO MenuItems VALUES(4,'Burger','burger',5.5);
INSERT INTO MenuItems VALUES(5,'Coffee','coffee',3.25);
INSERT INTO MenuItems VALUES(6,'French Fries','frenchFries',4.0);
INSERT INTO MenuItems VALUES(7,'Fried Chicken','friedChicken',6.2999999999999998223);
INSERT INTO MenuItems VALUES(8,'Hotdog','hotdog',4.25);
INSERT INTO MenuItems VALUES(9,'Ice-Cream','iceCream',3.75);
INSERT INTO MenuItems VALUES(10,'Pizza','pizza',8.5);
INSERT INTO MenuItems VALUES(11,'Pork','pork',5.2999999999999998223);
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('MenuItems',11);
COMMIT;
