#UC1
CREATE DATABASE AddressBookService;
SHOW DATABASES;
USE addressbookservice;

#UC2
 CREATE TABLE AddressBook
    -> (
    -> firstName varchar(100) NOT NULL,
    -> lastName varchar(100) NOT NULL,
    -> address varchar(250) NOT NULL,
    -> city varchar(50) NOT NULL,
    -> state varchar(50) NOT NULL,
    -> zip numeric(6),
    -> phone numeric(10) NOT NULL,
    -> email varchar(100) NOT NULL,
    -> primary key (firstName, lastName)
    -> );

 DESCRIBE Addressbook;

#UC3
INSERT INTO addressBook values('Adity','Kharade','Kaulkhed','Akola','Maharashtra',444001, 8844557722,'abc@d.com');
INSERT INTO AddressBook VALUES ('Aniket','Sarap','Kaulkhed','Akola','Maharashtra',444001,8475612478,'adc@d.com');
INSERT INTO AddressBook VALUES ('Prajwal','Bhamodre','Kaulkhed','Akola','Maharashtra',444001,8475574178,'ac@d.com');
INSERT INTO AddressBook VALUES ('Sanket','Deshmukh','Kaulkhed','Akola','Maharashtra',444001,7445566221,'aac@d.com');

#UC4
Update AddressBook SET phone=1234567890 WHERE name='Adity';
Update AddressBook SET phone=7896541235 WHERE firstname='Aniket';

#UC5
DELETE from AddressBook where firstname='Sanket';

#UC6
SELECT * from AddressBook WHERE city ='Mumbai';
SELECT * from AddressBook WHERE state ='Karnataka';

#UC7
SELECT city, count(*) FROM AddressBook
-> GROUP BY city;
SELECT state, count(*) FROM AddressBook
-> GROUP BY state;

#UC8
SELECT * from AddressBook
   -> WHERE city = 'Akola'
   -> ORDER BY firstname, lastname;

#UC9
ALTER TABLE AddressBook RENAME TO Contacts;

ALTER TABLE Contacts
    -> DROP PRIMARY KEY;
ALTER TABLE Contacts
    -> ADD ContactID INT NOT NULL AUTO_INCREMENT FIRST,
    -> ADD PRIMARY KEY(ContactID);


CREATE TABLE AddressBook
   -> (
   -> BookID INT NOT NULL AUTO_INCREMENT,
   -> ContactID INT NOT NULL,
   -> BookName VARCHAR(100) NOT NULL,
   -> PRIMARY KEY (BookID),
   -> FOREIGN KEY (ContactID) REFERENCES Contacts (ContactID)
   -> );
ALTER TABLE AddressBook
    -> ADD BookType VARCHAR(100) NOT NULL AFTER BookName;

#UC10
SELECT BookType, COUNT(*) FROM AddressBook
    -> GROUP BY BookType;

#UC11
INSERT INTO AddressBook (contactId, BookName, BookType) VALUES
    -> (1, 'FamilyBook', 'Family'),
    -> (1, 'FriendBook', 'Friend'),
    -> (2, 'FriendBook','Friend'),
    -> (2, 'ProfessionBook','Profession'),
    -> (3, 'FamilyBook','Family'),
    -> (4, 'ProfessionBook','Profession'),
    -> (4, 'FamilyBook','Family'),
    -> (5, 'FriendBook','Friend');


# UC 12
create table zipCityState (
zip numeric(6) not null,
city varchar(100) not null,
state varchar(100) not null,
foreign key (zip) references contact_table(zip)
);
create table addressbookTypes (
addressbookName varchar(100) not null,
type varchar(100) not null,
foreign key (addressbookName) references contact_table(addressbookName)
);
alter table contacts_table 
drop column city,
drop column state;
alter table addressbook_table
drop column type;
insert into addressbookTypes values 
('AddressBook1', 'family'),
('AddressBook2','friend'), 
('AddressBook3','profession');
insert into addressbookTypes values 
(405689, 'Mumbai', 'Maharashtra'),
(400067, 'Mumbai', 'Maharashtra'),
(481023, 'Pune', 'Maharashtra'),
(408574, 'Satara', 'Maharashtra'),
(800561, 'hubli', 'Karnataka'),
(281557, 'Delhi', 'Delhi');

#Usecase 13:
select  contacts.contactId, addressbook.addressbookName, addressbookTypes.type, contacts.firstName, contacts.lastName, 
contacts.address, address.city, address.state, address.zip, contacts.phone, contacts.email
from contacts
inner join address on contacts.zip = address.zip
inner join addressbook on contacts.contactId = addressbook.contactId
inner join addressbookTypes on addressbookTypes.addressbookName = addressbook.addressbookName;