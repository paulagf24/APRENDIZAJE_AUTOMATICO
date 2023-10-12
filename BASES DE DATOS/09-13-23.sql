
1

CREATE TABLE ParaiZooHuesped (
tipo VARCHAR(100),
nombre VARCHAR(100),
sexo VARCHAR (2),
fecha_nacimiento DATE,
especie VARCHAR(100),
fecha_incorporación DATE,
peso_kg_comida DECIMAL(10,5),
jaula VARCHAR(100),
peso_kg_llegada DECIMAL(10,5)
);

2

INSERT INTO ParaiZooHuesped (tipo, nombre, sexo, fecha_nacimiento, especie, 
fecha_incorporación, peso_kg_comida,jaula, peso_kg_llegada)
VALUES ("conejo", "Parches","M", "2017-09-20", "herbíboro", "2019-09-13", 0.25,"24", 1.5 )

3

INSERT INTO ParaiZooHuesped (tipo, nombre, sexo, fecha_nacimiento, especie, 
fecha_incorporación, peso_kg_comida,jaula, peso_kg_llegada)
VALUES ("caballo", "Spirit","M", "2009-08-07", "herbíboro", "2019-10-02", 3 ,"15", 230 )

INSERT INTO ParaiZooHuesped (tipo, nombre, sexo, fecha_nacimiento, especie, 
fecha_incorporación, peso_kg_comida,jaula, peso_kg_llegada)
VALUES ("pava", "Perla", "F", "2018-09-21", "herbíboro", "2019-10-02", 0.5, "23", 42)

4

INSERT INTO ParaiZooHuesped (tipo, nombre, sexo, especie, 
fecha_incorporación, peso_kg_comida,jaula, peso_kg_llegada)
VALUES ("tigre", "Fresa","F", "carnívora", "2019-11-20", 4 ,"31", 42 )

6

INSERT INTO ParaiZooHuesped (tipo, nombre, sexo, especie, 
fecha_incorporación, peso_kg_comida,jaula, peso_kg_llegada)
VALUES ("cocodrilo", "Nilo","M", "carnívora", "2019-12-12", 5 ,"47", 44 )

8

Elabora la sentencia SQL para actualizar las fechas de nacimiento de estos animales.

UPDATE ParaiZooHuesped SET fecha_nacimiento = "2016-09-20"
WHERE nombre='Fresa';

UPDATE ParaiZooHuesped SET fecha_nacimiento = "2012-11-20"
WHERE nombre='Nilo';
