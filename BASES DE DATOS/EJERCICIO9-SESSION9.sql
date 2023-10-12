

#Una librer�a quiere organizar sus libros por autores. De cada libro se va a almacenar el nombre
#del libro, el autor, el g�nero y se le va a dar un id. De cada autor, se va a guardar el nombre y
#pa�s de nacimiento y tambi�n se le va a dar un id. Elaborar un modelo relacional que se ajuste
#a este requerimiento. Insertar un par libros de distintos autores en una BBDD del modelo
#generado para luego consultar los autores con sus pa�ses y el nombre de sus libros.

create table libro(idlibro INTEGER,
		nombre VARCHAR(100),
		idautor INTEGER,
		genero VARCHAR(100),
		constraint pk_libro primary key(idlibro),
		constraint fk_autor foreign key (idautor)
		references autor(idautor))
		
		
create table autor (idautor INTEGER,
		nombre VARCHAR(100),
		paisdenacimiento VARCHAR(100),
		constraint pk_autor primary key (idautor))
		
insert into autor (idautor, nombre, paisdenacimiento)
values(1, 'Stephen King', 'EEUU'),
(2, 'Vargas Llosa', 'Per�')

insert into libro (idlibro, nombre, idautor, genero)
values (1,'It',1,'Terror'),
(2, 'La ciudad y los perros', 2, 'Ficcion')

select a.nombre,
		a.paisdenacimiento,
		l.nombre 
from autor a 
inner join libro l 
on l.idautor=a.idautor



