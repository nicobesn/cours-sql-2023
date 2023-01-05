<<<<<<< HEAD
--  Exercice 1: Lister tous les employés

SELECT *
FROM employees;

-- Exercice 2: Lister le nom, prénom et titre de chaque employé

SELECT employees.lastName, employees.firstName, employees.jobTitle
FROM employees;

-- Exercice 3: Lister les Réprésentants Commerciaux ('Sales Rep') de la table employés

SELECT *
FROM employees
WHERE employees.jobTitle = 'Sales Rep';

-- Exercice 4 : Lister les différents statuts de la table 'orders', sans doublons

SELECT DISTINCT STATUS
FROM orders;

-- Exercice 5: Lister les paiements réalisés au mois de Mai

SELECT * 
FROM payements
WHERE month(payements) = 5;

-- Exercice 6: Lister les paiements réalisés en mai ou en juin 2005

SELECT *
FROM payements
WHERE year(payementDate) = 2005
AND (
    month(payementDate) = 5
    OR 
    month(payementDate) = 6
);

-- Exercice 7: Lister le nom et prénom des clients(customers) en les combinant au sein d'une seule colonne nommée 'fullName'

SELECT CONCAT(contactLastName, ' ', contactFirstName) AS fullName
FROM customers;

-- Exercice 8: Lister les produits commençant par les caractères “195”

SELECT * 
FROM products
WHERE products.productName 
LIKE '195%';   --% au debut = fini par / % entre entouré = contient / % a la fin = commence par 

-- Exercice 9: Lister le nom des produits qui ont un prix de vente (buyPrice) entre 70 et 100 $.

SELECT p.productName
FROM products p
WHERE p.buyPrice BETWEEN "70" and "100";

-- Exercice 10: Lister les clients (customers) ayant l'un des prénoms suivants : 'Alexander', 'Daniel', 'Elizabeth'

SELECT *
FROM customers
WHERE customers.contactFirstName IN ("Alexander", "Daniel", "Elizabeth");

-- Exercice 11: Lister les clients ordonnés par Nom de famille en ordre descendant

SELECT customers.contactLastName
FROM customers
ORDER BY customers.contactLastName DESC; -- DESC = ordre descendant / ASC = ordre croissant

-- Exercice 12: Certains clients ont le même prénom. Réalisez une requête qui retourne les prénoms en doublons

SELECT customers.contactFirstName
FROM `customers`
GROUP BY customers.contactFirstName
HAVING COUNT (customers.contactFirstName) > 1; 


-- Exercice 13: Lister les 10 derniers enregistrements (en fonction de la colonne paymentDate) de la table payments

SELECT *
FROM payements
ORDER BY payementDate
LIMIT 10; 

-- Exercice 14: Retourner le paiement le plus cher

SELECT * MAX(payements.amount) 
FROM `payements`; 

-- Exercice 15: Retourner la ville d'un bureau (office city) accompagné par le nombre d'employés associés à ce bureau (officeCode)

SELECT o.city, COUNT(e.officeCode) AS 'nb_employe' FROM offices o
LEFT JOIN employees e 
ON e.officeCode = o.officeCode
GROUP BY o.city;

-- Exercice 16: Lettre à la DSI. Vous avez a reçu un courrier postal d'un client mais les informations sont à moitié effacées. Vous cherchez à retrouver qui celà peut bien être

-- En déchiffrant la lettre, vous arrivez uniquement à récupérer le deuxième et troisième caractère du code postal... '78'.
-- Réalisez une requête SQL permettant de lister les clients correspondants à ce code postal.**

SELECT *
FROM customers 
WHERE postalCode
LIKE '_78__'; 

-- Exercice 17: Lister le chiffre d'affaire (somme des paiements), regroupés par année



-- Exercice 18: Lister le chiffre d'affaire (somme des paiements), regroupés par année et mois. ordonnés chronologiquement

SELECT SUM(amount), YEAR(payements.paymentDate) y, EXTRACT (MONTH FROM payements.payementDate) m
FROM payements
GROUP BY y, m
ORDER BY payements.payementDate;

-- Exercice 19: Vous organisez une tombola. Faites une requête permettant de sélectionner un client aléatoirement

SELECT *, RAND() as R
FROM customers
ORDER BY R
LIMIT 1;

-- Exercice 20: Les employés ont des responsables (reportsTo). Retournez les employés n'ayant pas de supérieur



-- Exercice 21: Retourner les employés (employeeNumber, firstName, lastName) ayant le plus de responsabilités (le plus de reportsTo associés)



-- Exercice 22: Une erreur logicielle a eu lien, incrémentez toutes les factures de 5$.



-- Exercice 23: Avez-vous remarqué que la table des paiements n'est pas liée aux orders? Comparez le montant des commandes par rapport aux paiements , regroupés par client

SELECT o.customerNumber, p.amount as "Montant payement", SUM(od.quantityOrdered * od.priceEach) as "Montant commande" 
FROM orderdetails od 
JOIN orders o ON o.orderNumber = od.orderNumber
JOIN customers c ON o.customerNumber = c.customerNumber
JOIN payments p ON c.customerNumber = p.customerNumber
GROUP BY o.customerNumber;

-- Exercice 24: Les produits se vendent à des prix variants dans le temps. Retournez pour chaque produit le montant max et le montant min de la table orderdetails, ainsi que son prix actuel dans la table products

SELECT orderdetails.productCode, MAX(orderdetails.priceEach) as `Max`, MIN(orderdetails.priceEach) as `Min`, products.buyPrice 
FROM orderdetails 
JOIN products ON orderdetails.productCode = products.productCode 
GROUP BY orderdetails.productCode;
dedansD
DD
=======
--  Exercice 1: Lister tous les employés

SELECT *
FROM employees;

-- Exercice 2: Lister le nom, prénom et titre de chaque employé

SELECT employees.lastName, employees.firstName, employees.jobTitle
FROM employees;

-- Exercice 3: Lister les Réprésentants Commerciaux ('Sales Rep') de la table employés

SELECT *
FROM employees
WHERE employees.jobTitle = 'Sales Rep';

-- Exercice 4 : Lister les différents statuts de la table 'orders', sans doublons

SELECT DISTINCT STATUS
FROM orders;

-- Exercice 5: Lister les paiements réalisés au mois de Mai

SELECT * 
FROM payements
WHERE month(payements) = 5;

-- Exercice 6: Lister les paiements réalisés en mai ou en juin 2005

SELECT *
FROM payements
WHERE year(payementDate) = 2005
AND (
    month(payementDate) = 5
    OR 
    month(payementDate) = 6
);

-- Exercice 7: Lister le nom et prénom des clients(customers) en les combinant au sein d'une seule colonne nommée 'fullName'

SELECT CONCAT(contactLastName, ' ', contactFirstName) AS fullName
FROM customers;

-- Exercice 8: Lister les produits commençant par les caractères “195”

SELECT * 
FROM products
WHERE products.productName 
LIKE '195%';   --% au debut = fini par / % entre entouré = contient / % a la fin = commence par 

-- Exercice 9: Lister le nom des produits qui ont un prix de vente (buyPrice) entre 70 et 100 $.

SELECT p.productName
FROM products p
WHERE p.buyPrice BETWEEN "70" and "100";

-- Exercice 10: Lister les clients (customers) ayant l'un des prénoms suivants : 'Alexander', 'Daniel', 'Elizabeth'

SELECT *
FROM customers
WHERE customers.contactFirstName IN ("Alexander", "Daniel", "Elizabeth");

-- Exercice 11: Lister les clients ordonnés par Nom de famille en ordre descendant

SELECT customers.contactLastName
FROM customers
ORDER BY customers.contactLastName DESC; -- DESC = ordre descendant / ASC = ordre croissant

-- Exercice 12: Certains clients ont le même prénom. Réalisez une requête qui retourne les prénoms en doublons

SELECT customers.contactFirstName
FROM `customers`
GROUP BY customers.contactFirstName
HAVING COUNT (customers.contactFirstName) > 1; 


-- Exercice 13: Lister les 10 derniers enregistrements (en fonction de la colonne paymentDate) de la table payments

SELECT *
FROM payements
ORDER BY payementDate
LIMIT 10; 

-- Exercice 14: Retourner le paiement le plus cher

SELECT * MAX(payements.amount) 
FROM `payements`; 

-- Exercice 15: Retourner la ville d'un bureau (office city) accompagné par le nombre d'employés associés à ce bureau (officeCode)

SELECT o.city, COUNT(e.officeCode) AS 'nb_employe' FROM offices o
LEFT JOIN employees e 
ON e.officeCode = o.officeCode
GROUP BY o.city;

-- Exercice 16: Lettre à la DSI. Vous avez a reçu un courrier postal d'un client mais les informations sont à moitié effacées. Vous cherchez à retrouver qui celà peut bien être

-- En déchiffrant la lettre, vous arrivez uniquement à récupérer le deuxième et troisième caractère du code postal... '78'.
-- Réalisez une requête SQL permettant de lister les clients correspondants à ce code postal.**

SELECT *
FROM customers 
WHERE postalCode
LIKE '_78__'; 

-- Exercice 17: Lister le chiffre d'affaire (somme des paiements), regroupés par année



-- Exercice 18: Lister le chiffre d'affaire (somme des paiements), regroupés par année et mois. ordonnés chronologiquement

SELECT SUM(amount), YEAR(payements.paymentDate) y, EXTRACT (MONTH FROM payements.payementDate) m
FROM payements
GROUP BY y, m
ORDER BY payements.payementDate;

-- Exercice 19: Vous organisez une tombola. Faites une requête permettant de sélectionner un client aléatoirement

SELECT *, RAND() as R
FROM customers
ORDER BY R
LIMIT 1;

-- Exercice 20: Les employés ont des responsables (reportsTo). Retournez les employés n'ayant pas de supérieur



-- Exercice 21: Retourner les employés (employeeNumber, firstName, lastName) ayant le plus de responsabilités (le plus de reportsTo associés)



-- Exercice 22: Une erreur logicielle a eu lien, incrémentez toutes les factures de 5$.



-- Exercice 23: Avez-vous remarqué que la table des paiements n'est pas liée aux orders? Comparez le montant des commandes par rapport aux paiements , regroupés par client

SELECT o.customerNumber, p.amount as "Montant payement", SUM(od.quantityOrdered * od.priceEach) as "Montant commande" 
FROM orderdetails od 
JOIN orders o ON o.orderNumber = od.orderNumber
JOIN customers c ON o.customerNumber = c.customerNumber
JOIN payments p ON c.customerNumber = p.customerNumber
GROUP BY o.customerNumber;

-- Exercice 24: Les produits se vendent à des prix variants dans le temps. Retournez pour chaque produit le montant max et le montant min de la table orderdetails, ainsi que son prix actuel dans la table products

SELECT orderdetails.productCode, MAX(orderdetails.priceEach) as `Max`, MIN(orderdetails.priceEach) as `Min`, products.buyPrice 
FROM orderdetails 
JOIN products ON orderdetails.productCode = products.productCode 
GROUP BY orderdetails.productCode;
>>>>>>> bb067f0a632c5c4873b3e0ee3475e6e359bc719b
