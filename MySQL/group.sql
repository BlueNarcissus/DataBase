show databases;
use menagerie;
select database();

# How many pets does each one have? and their species?
SELECT owner,count(*) FROM pet
GROUP BY owner;

SELECT owner,species,count(*) FROM pet
GROUP BY owner,species;

# How many in each species? and their sex?
SELECT species,count(*) FROM pet
GROUP BY species;

SELECT species,sex,count(*) FROM pet
WHERE sex IS NOT NULL
GROUP BY species,sex;

SELECT species,sex,count(*) FROM pet
WHERE species='dog' OR species='cat'
GROUP BY species,sex;

