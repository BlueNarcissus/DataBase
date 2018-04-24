use menagerie;
select database();

CREATE TABLE if not exists shop(
article int(4) UNSIGNED ZEROFILL default '0000' not null,
dealer char(20)                 default ''     not null,
price double(16,2)		default '0.00' not null,
primary key(article, dealer));

DESC shop;

DELETE FROM shop;
INSERT INTO shop VALUES
(1,'A',3.45), (1,'B',3.99), (2,'A',10.99),(3,'B',1.45),
(3,'C',1.69), (3,'D',1.25), (4,'D',19.95);

SELECT * FROM shop;



# the largest #article? 
SELECT MAX(article) as article FROM shop;

SELECT * FROM shop WHERE article=(SELECT MAX(article) FROM shop);

# the most expensive article?
# (1)
SELECT article,dealer,price FROM shop 
WHERE price=(SELECT MAX(price) FROM shop);

# (2)
SELECT article,dealer,price FROM shop 	
ORDER BY price DESC LIMIT 0,3;

# (3) compare each entry of s2 with each of s1 until s2 is NULL???
SELECT s1.article,s1.dealer,s1.price 
FROM shop as s1	LEFT JOIN shop as s2
ON s1.price<s2.price
WHERE s2.article IS NULL;




# maximum of column by group
SELECT article, MAX(price) as price FROM shop
GROUP BY article;

# also the corresponding dealer 
# (1) uncorrelated subquery; condition being column of the table
SELECT article,dealer,price FROM shop as s1
WHERE price=(SELECT MAX(s2.price) FROM shop as s2 WHERE s1.article=s2.article);

# (2) (right) join table with selected part of the table
SELECT s1.article, s1.dealer, s1.price FROM shop as s1
RIGHT JOIN (SELECT article,MAX(price) as price FROM shop GROUP BY article) as s2
ON s1.article=s2.article AND s1.price=s2.price;

#(3) ??? 
SELECT s1.article, s1.dealer, s1.price
FROM shop as s1 LEFT JOIN shop as s2
ON s1.article=s2.article AND s1.price<s2.price
WHERE s2.article IS NULL;





# user-defined variables @min_price to remember results
SELECT @min_price:=MIN(price), @max_price:=MAX(price) FROM shop;
SELECT * FROM shop WHERE price=@min_price OR price=@max_price;

SELECT MIN(price) as min_price, MAX(price) as max_price FROM shop;





