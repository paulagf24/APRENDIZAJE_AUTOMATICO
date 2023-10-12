CREATE DATABASE test008;
USE test008;
CREATE TABLE sale (
id INT,
product VARCHAR(100),
quantity INT,
price DECIMAL(10,5),
sale_date DATE
);

INSERT INTO sale (id,product ,,fieldN) 
VALUES (value1,value2,...,valueN),
VALUES (value1,value2,...,valueN),
VALUES (value1,value2,...,valueN),

INSERT INTO sale (id, product, quantity, price, sale_date)
VALUES (1,'oil bottle',2,3.5,'2020-05-19');
INSERT INTO sale
VALUES (2,'milk carton',1,1.8,'2020-05-20');
INSERT INTO sale (id, product, quantity, price)
VALUES (3,'butter pack',1,2.3);

UPDATE sale SET price = price + price * 20/100
WHERE sale_date > '2020-05-18';

DELETE FROM sale
WHERE price < 2.4;

ALTER TABLE sale ADD seller VARCHAR(100);

ALTER TABLE sale DROP seller;

ALTER TABLE sale MODIFY COLUMN product VARCHAR(200);

ALTER TABLE sale RENAME TO newsale;
#eliminas el contenido de la tabla
TRUNCATE TABLE newsale
#eliminar la tabla por completo
DROP TABLE newsale;

