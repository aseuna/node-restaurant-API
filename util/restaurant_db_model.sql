DROP DATABASE IF EXISTS `restaurant_dev`;
CREATE DATABASE `restaurant_dev`;
USE `restaurant_dev`;

CREATE TABLE `category`
(
  `id` integer unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  CONSTRAINT pk_category PRIMARY KEY (`id`)
);

CREATE TABLE `fooditem`
(
  `id` integer unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `category` integer unsigned NOT NULL,
  `description` varchar(200),
  `imgPath` varchar(200),
  CONSTRAINT pk_fooditem PRIMARY KEY (`id`)
);

CREATE TABLE `fooditemingredients`
(
  `id` integer unsigned NOT NULL AUTO_INCREMENT,
  `fooditemid` integer unsigned NOT NULL,
  `ingredientsid` integer unsigned NOT NULL,
  CONSTRAINT pk_fooditemingredients PRIMARY KEY (`id`)
);

CREATE TABLE `ingredients`
(
  `id` integer unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  CONSTRAINT pk_ingredients PRIMARY KEY (`id`)
);

CREATE TABLE `invoiceHeader`
(
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `totalPayment` decimal(15,2) NOT NULL,
  `orderid` bigint unsigned NOT NULL,
  `referenceNumber` bigint NOT NULL,
  `isPaid` bit(1) NOT NULL DEFAULT 0,
  CONSTRAINT pk_invoiceHeader PRIMARY KEY (`id`)
);

CREATE TABLE `invoiceLineItem`
(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `invoiceHeaderid` bigint unsigned NOT NULL,
  `lineItem` integer unsigned NOT NULL,
  `lineItemName` varchar(45) NOT NULL,
  CONSTRAINT pk_invoiceLineItem PRIMARY KEY (`id`)
);

CREATE TABLE `order`
(
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `number` integer unsigned NOT NULL,
  `creationTimeStamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `isTakeaway` bit(1) NOT NULL DEFAULT 0,
  `isReady` bit(1) NOT NULL DEFAULT 0,
  CONSTRAINT pk_order PRIMARY KEY (`id`)
);

CREATE TABLE `orderContents`
(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `orderid` bigint unsigned NOT NULL,
  `fooditemid` integer unsigned NOT NULL,
  CONSTRAINT pk_orderContents PRIMARY KEY (`id`)
);

ALTER TABLE `fooditem` ADD CONSTRAINT `fk_fooditem_category`
  FOREIGN KEY (`category`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE `fooditemingredients` ADD CONSTRAINT `fk_fooditemingredients_fooditem`
  FOREIGN KEY (`fooditemid`) REFERENCES `fooditem` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `fooditemingredients` ADD CONSTRAINT `fk_fooditemingredients_ingredients`
  FOREIGN KEY (`ingredientsid`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `invoiceHeader` ADD CONSTRAINT `fk_invoiceHeader_order`
  FOREIGN KEY (`orderid`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE `invoiceLineItem` ADD CONSTRAINT `fk_invoiceLineItem_invoiceHeader`
  FOREIGN KEY (`invoiceHeaderid`) REFERENCES `invoiceHeader` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `orderContents` ADD CONSTRAINT `fk_orderContents_fooditem`
  FOREIGN KEY (`fooditemid`) REFERENCES `fooditem` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE `orderContents` ADD CONSTRAINT `fk_orderContents_order`
  FOREIGN KEY (`orderid`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


INSERT INTO `category` (name)
VALUES 
("Burgers"),
("Meals"),
("Sides"),
("Desserts"),
("Beverages")
;


INSERT INTO `ingredients` (name)
VALUES
("Bun"),
("Patty"),
("Pulled Pork Patty"),
("Cheese"),
("Bacon"),
("Tomato"),
("Caramelized Red Onion"),
("Onion"),
("Salad"),
("Jalapeño Chili"),
("Chocolate Sauce"),
("Mango Sauce"),
("Caramel Sauce"),
("Strawberry Sauce")
;


INSERT INTO `fooditem` (name, price, category, description, imgPath)
SELECT
"Ez Brgr", 7.60, id, "Basic burger", NULL
FROM `category` WHERE name = "Burgers";

INSERT INTO `fooditem` (name, price, category, description, imgPath)
SELECT
"CheEz Brgr", 8.60, id, "Burger with cheese", NULL
FROM `category` WHERE name = "Burgers";

INSERT INTO `fooditem` (name, price, category, description, imgPath)
SELECT
"Bacon CheEz Brgr", 9.60, id, "Burger with bacon and cheese", NULL
FROM `category` WHERE name = "Burgers";

INSERT INTO `fooditem` (name, price, category, description, imgPath)
SELECT
"Devilz Brgr", 9.60, id, "Burger with Cheese and Jalapeño", NULL
FROM `category` WHERE name = "Burgers";


INSERT INTO `fooditem` (name, price, category, description, imgPath)
SELECT
"Ez Brgr meal", 12.50, id, "Basic burger meal", NULL
FROM `category` WHERE name = "Meals";

INSERT INTO `fooditem` (name, price, category, description, imgPath)
SELECT
"CheEz Brgr meal", 13.50, id, "Burger with cheese meal", NULL
FROM `category` WHERE name = "Meals";

INSERT INTO `fooditem` (name, price, category, description, imgPath)
SELECT
"Bacon CheEz Brgr meal", 14.50, id, "Burger with cheese and bacon meal", NULL
FROM `category` WHERE name = "Meals";

INSERT INTO `fooditem` (name, price, category, description, imgPath)
SELECT
"Devilz Brgr meal", 14.50, id, "Burger with cheese and jalapeño meal", NULL
FROM `category` WHERE name = "Meals";


INSERT INTO `fooditem` (name, price, category, description, imgPath)
SELECT
"Fries", 3.00, id, "French fries", NULL
FROM `category` WHERE name = "Sides";

INSERT INTO `fooditem` (name, price, category, description, imgPath)
SELECT
"Vanilla Ize Cream", 4.00, id, "Vanilla ice cream serving with a choice of sauce", NULL
FROM `category` WHERE name = "Desserts";

INSERT INTO `fooditem` (name, price, category, description, imgPath)
SELECT
"Fudge Brownie", 4.50, id, "Fudge Brownie square", NULL
FROM `category` WHERE name = "Desserts";


INSERT INTO `fooditem` (name, price, category, description, imgPath)
SELECT
"Soda", 3.20, id, "Soda", NULL
FROM `category` WHERE name = "Beverages";

INSERT INTO `fooditem` (name, price, category, description, imgPath)
SELECT
"Beer", 4.20, id, "Beer", NULL
FROM `category` WHERE name = "Beverages";

INSERT INTO `fooditem` (name, price, category, description, imgPath)
SELECT
"Cider", 4.20, id, "Cider", NULL
FROM `category` WHERE name = "Beverages";