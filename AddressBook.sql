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