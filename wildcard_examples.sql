--select all products whose name contains Ford
SELECT productName, productCode
FROM products
WHERE productName LIKE '%Ford%';

--select all products whose name begins with the letter T
SELECT productName, productCode
FROM products
WHERE productName LIKE 'T%';

