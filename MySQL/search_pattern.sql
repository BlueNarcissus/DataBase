show databases;
use menagerie;
select database();

# LIKE/NOT LIKE
# % multiple characters, _ one character
SELECT * FROM pet WHERE name LIKE 'b%';
SELECT * FROM pet WHERE name LIKE 'B%';
SELECT * FROM pet WHERE name LIKE BINARY 'b%';  # case-sensitive, returns no result
SELECT * FROM pet WHERE name LIKE BINARY 'B%';

SELECT * FROM pet WHERE name LIKE '%fy';
SELECT * FROM pet WHERE name LIKE '%w%';
SELECT * FROM pet WHERE name LIKE '_____';  # name with five characters

# Regular Expression
SELECT * FROM pet WHERE name REGEXP '^b';
SELECT * FROM pet WHERE name REGEXP '^B';   # name begins with 'B'
SELECT * FROM pet WHERE name REGEXP BINARY '^b';
SELECT * FROM pet WHERE name REGEXP BINARY '^B';


SELECT * FROM pet WHERE name REGEXP 'fy$';  # name ends with 'fy'
SELECT * FROM pet WHERE name REGEXP 'w';    # name contains 'w'
SELECT * FROM pet WHERE name REGEXP '^.{5}$'; # name with five characters

