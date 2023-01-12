-- Exercice 1
-- Retournez le nom de l'ensemble des produits présents au sein de la base de données.

SELECT * 
FROM products

-- Exercice 2
-- Retournez en une requête le nombre de produits présents dans la base de données

SELECT COUNT(*) as Nombre_de_produits
FROM products


-- Exercice 3
-- Retournez le nom des produits qui possèdent le critère Végane

SELECT p.name FROM products p
JOIN product_has_criteria pc ON pc.product_id = p.id
JOIN criterias c ON c.id = pc.criteria_id
WHERE c.name = 'Végane'

-- Exercice 4
-- Retournez l'ensemble des produits qui est à base de l'ingrédient pain ciabatta.

SELECT p.* FROM products p
JOIN product_has_ingredient pi ON pi.product_id = p.id
JOIN ingredients i ON i.id = pi.ingredient_id
WHERE i.name = 'pain ciabatta'

-- Exercice 5
-- Retournez le nom des produits accompagnés par le nombre d'ingrédients le constituant

SELECT p.name, COUNT(pi.id) as nombre_ingredients
FROM products p
JOIN product_has_ingredient pi ON pi.product_id = p.id
GROUP BY p.name

-- Exercice 6
-- Produisez la requête SQL permettant de retourner le nom du produit ayant le plus d'allergènes ?

SELECT p.name, COUNT(pa.id) as nombre_allergenes 
FROM products p 
JOIN product_has_allergen pa ON pa.product_id = p.id 
GROUP BY p.name  
ORDER BY `nombre_allergenes`  DESC
LIMIT 1;

//

-- (WITH CTE)

SELECT * 
FROM
    (SELECT p.name, COUNT(pa.id) as nombre_allergenes 
    FROM products p 
    JOIN product_has_allergen pa ON pa.product_id = p.id 
    GROUP BY p.name  
    ORDER BY `nombre_allergenes`  DESC)


SELECT * FROM toto where nombre_allergenes = 
	(SELECT MAX(nombre_allergenes) 
    FROM toto)

-- Exercice 7
-- L'administrateur a prévu des critères qui ne sont affectés à aucun produit. Afin de garantir une BDD pertinente, il serait pertinent de les retirer. Veuillez créer la requête SQL permettant de les lister.

SELECT DISTINCT c.name
FROM criterias c
LEFT JOIN product_has_criteria pc ON pc.criteria_id = c.id
WHERE pc.id IS NULL 

SELECT  name FROM criterias WHERE id NOT IN (select criteria_id from c)


-- Exercice 8
-- Une équipe de développeurs souhaite ajouter la fonctionnalité permettant de créer un label.
-- Veuillez leur produire une requête permettant de créer un label nommé '  ' et ayant pour url /allergen/labels/label-bleu.png.
-- Les dates de création et de mise à jour doivent être initialiseés à la date d'execution de la requête.

INSERT INTO label (name, picture, created_at, updated_at)
VALUES ('Label Bleu', '/allergen/labels/label-bleu.png', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP())

-- Exercice 9
-- Retournez l'ensemble des noms des ingrédients non utilisés au sein des produits ou des tables pivots.
-- Ordonnés alphabétiquement et sans redondance.

SELECT 

-- Exercice 10
-- L'objectif de cette base de données est de pouvoir voir la présence ou l'absence d'allergènes.
-- Retournez le nom des produits qui ne contiennent pas de lait (milk)
-- Attention, il est possible d'associer des allergènes aux produits mais aussi aux ingrédients. Votre requête doit le prendre en compte.