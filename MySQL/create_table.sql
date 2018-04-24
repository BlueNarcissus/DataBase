show databases;
#create database menagerie;
use menagerie;
select database();

# create table pet
create table if not exists pet(
name char(20) not null,
owner char(20) not null,
species char(20),
sex char(1),
birth date,
death date);

describe pet;
delete from pet;
load data local infile 'pet' into table pet;

INSERT INTO pet VALUES
('Puffball', 'Diana', 'hamster', 'f', '1999-3-30', NULL);

# create table event
create table if not exists event(
name char(20) not null,
date date,
type char(20),
remark char(255));

describe event;
delete from event;
load data local infile 'event' into table event;
#
select * from pet;
select * from event;

