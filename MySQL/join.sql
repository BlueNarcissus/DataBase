show databases;
use menagerie;
select database();

# inner join 2 tables
SELECT pet.name,pet.birth,event.type FROM pet INNER JOIN event
ON pet.name=event.name;

# How old are the pets when they had litter?
SELECT pet.name, pet.birth, event.type, event.date, TIMESTAMPDIFF(year, pet.birth, event.date) as age
FROM pet INNER JOIN event
ON pet.name=event.name
WHERE event.type='litter';

SELECT pet.name, TIMESTAMPDIFF(year, pet.birth, event.date) as age, event.remark
FROM pet INNER JOIN event
ON pet.name=event.name
WHERE event.type='litter';

# inner join inside the same table
# pair up female and male pets of the same species?
SELECT p1.name,p1.sex,p2.name,p2.sex,p1.species FROM pet as p1 INNER JOIN pet as p2
ON p1.species=p2.species AND p1.sex='f' AND p2.sex='m';