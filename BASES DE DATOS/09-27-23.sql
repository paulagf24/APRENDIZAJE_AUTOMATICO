
#Del repositorio people. Alterar las tablas y añadir las constraints que cumplan lo siguiente:
· #El campo "personid" de la tabla people debe ser PRIMARY KEY.
· #El campo "personid" de la tabla peoplejob debe apuntar al campo "personid" de la
#tabla people.
#Generar una sentencia Insert por tabla y que FALLEN por incumplimiento de:
· #Tabla people. Clave primaria
· #Tabla peoplejob. Clave foránea a people

use 008people

ALTER TABLE people 
ADD CONSTRAINT personid_pe PRIMARY KEY (personid)

ALTER TABLE peoplejob
ADD CONSTRAINT personid_pejo FOREIGN KEY (personid) REFERENCES people(personid);

INSERT INTO people (personid,name) VALUES (5,'Diego');
INSERT INTO peoplejob (job,personid) VALUES ('CEO',6);

#Del repositorio dallas. Alterar las tablas y añadir las constraints que cumplan lo siguiente:
#· El campo "case_number" de la tabla incident debe ser PRIMARY KEY.
#· El campo "case_number" de la tabla officer debe apuntar al campo "case_number"
#de la tabla incident.
#· El campo "case_number" de la tabla subject debe apuntar al campo "case_number"
#de la tabla incident.
#Generar una sentencia Insert por tabla y que FALLEN por incumplimiento de: 
		#Tabla incident. Clave primaria 
		#Tabla officer. Clave foránea a incident 
		#Tabla subject. Clave foránea a incident

use 008dallas

ALTER TABLE incident
ADD CONSTRAINT case_ince PRIMARY KEY (case_number);

ALTER TABLE officer
ADD CONSTRAINT case_off FOREIGN KEY (case_number) REFERENCES incident(case_number);

ALTER TABLE subject 
ADD CONSTRAINT case_sub FOREIGN KEY (case_number) REFERENCES incident(case_number);

INSERT INTO incident (case_number) VALUES ('647484848484749494');
INSERT INTO officer (case_number) VALUES ('19');
INSERT INTO subject (case_number) VALUES ('19');



