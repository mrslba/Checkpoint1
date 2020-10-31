use proyecto;
#¿Cuál es el nombre de todos los libros?
select Book_Title 
from books;

#¿Cuáles son los 10 usuarios que han dado mayor puntuación?
select User_ID, avg(Book_Rating) as Puntación_promedio
from bookratings 
group by User_ID
order by Puntación_promedio desc
Limit 10;

#¿Cuál es el libro más reciente?
select * 
from books 
order by Year_Publication DESC;

#¿Cuáles son los libros que inician con Q?
select Book_Title 
from books 
where Book_Title 
like 'Q%';

#¿Cuáles son los libros que tienen en su nombre “ana”?
select Book_Title 
from books 
where Book_Title 
like '%ana%';

#¿Cuáles son los libros que terminan en “x”?
select Book_Title 
from books 
where Book_Title 
like '%x';

#¿Cuáles son los libros que no empiecen con “T”?
select Book_Title 
from books 
where not Book_Title 
like 'T%';

#¿Cuántos libros hay por autor? (se ordenan de mayor a menor)
select Book_Author, count(*) as Books
from books 
group by Book_Author
order by Books desc;

#¿Cuál es el usuario de mayor edad?
select User_ID, Age
from users
order by Age desc
Limit 1;

#¿Cuál es la calificación promedio de todos los libros?
SELECT 
    AVG(Book_Rating)
FROM
    bookratings;

#¿Cuántas personas son mayores de 20 años y menores de 35?
select count(age) as Users
from users
where age between 25 and 35;

#¿Cuántas personas hay en cada región y cuál es la región con mayor usuarios?
select Location, count(user_ID) as Users
from users
group by Location
order by Users desc
limit 1;

#¿Cuántos libros se publicaron en cada año?
select Year_Publication, count(Book_Title)
from books
group by Year_Publication;

#¿Cuáles la editorial con  más libros publicados?
select Publisher, count(ISBN) as Libros
from books
group by Publisher
order by Libros desc
limit 1;

#¿Cuántos años tiene el usuario promedio?
select avg(age) as Edad
from users;

#Creación de vista
create view	Títulos as
select Book_Title, avg(Book_Rating) as Rating, Book_Author, Year_Publication, Publisher
from bookratings
join books
on bookratings.ISBN = books.ISBN
group by Book_Title;

#¿Cuáles son los 5 mejores libros calificados y en qué años se publicaron?
select Book_Title, Rating, Year_Publication
from Títulos
order by rating desc
limit 5;

#¿Quién es el autor con la calificación más baja en alguno de sus libros?
select Book_Title, Rating, Book_Author
from Títulos
order by rating asc
limit 1;

#Creación de vista
create view	Edades as
select ISBN, Book_Rating, Age
from bookratings
join users
on bookratings.User_ID = users.User_ID;

#¿Cuántos años tienen los usuarios que dan calificación de  8 a 10?
select Book_Rating, avg(age) as Edad
from Edades
group by Book_Rating
order by Book_Rating desc
limit 3;



