DROP SCHEMA IF EXISTS MatrixAlgebra;
CREATE SCHEMA IF NOT EXISTS MatrixAlgebra DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


USE MatrixAlgebra;


/* Sparse matrices */
DROP TABLE IF EXISTS Matrix1;
DROP TABLE IF EXISTS Matrix2;
DROP TABLE IF EXISTS Matrix3;

/*Create sparse matrices*/

CREATE TABLE Matrix1
(
   RowID      nchar(10),
   ColumnID   nchar(10),
   Value      real
);

CREATE TABLE Matrix2
(
   RowID      nchar(10),
   ColumnID   nchar(10),
   Value      real
);

CREATE TABLE Matrix3
(
   RowID      nchar(10),
   ColumnID   nchar(10),
   Value      real
);

/*Load values into the tables A and B*/

INSERT INTO Matrix1
     VALUES ('one', 'one', -2);

INSERT INTO Matrix1
     VALUES ('one', '2', 2);

INSERT INTO Matrix1
     VALUES ('one', '3', -1);

INSERT INTO Matrix1
     VALUES ('one', '4', 1);

-- Matrix1 represents a 1X4 matrix (-2, 2, -1, 1)
----------------------------------
-- |'one'| '2' | '3' | '4' |
----------------------------------
-- 'one'| -2 | 2 | -1 | 1 |
----------------------------------

SELECT * FROM Matrix1;

Create table MatrixAlgebra.TABLE1 (
A int,
B int,
C int,
D int 
);

insert into MatrixAlgebra.TABLE1 Values(2,1,3,23);
insert into MatrixAlgebra.TABLE1 Values(3,1,3,29);
insert into MatrixAlgebra.TABLE1 Values(2,1,1,17);

commit;

select * from MatrixAlgebra.Table1;

create table TABLE2 (
R int,
C CHARACTER(1),
M integer
);

select * from TABLE2;

insert into MatrixAlgebra.Table2 values(1,'A',2);
insert into MatrixAlgebra.Table2 values(2,'B',1);
insert into MatrixAlgebra.Table2 values(3,'C',3);
insert into MatrixAlgebra.Table2 values(4,'N',23);
insert into MatrixAlgebra.Table2 values(1,'A',3);
insert into MatrixAlgebra.Table2 values(2,'B',1);
insert into MatrixAlgebra.Table2 values(3,'C',3);
insert into MatrixAlgebra.Table2 values(4,'N',29);
insert into MatrixAlgebra.Table2 values(1,'A',2);
insert into MatrixAlgebra.Table2 values(2,'B',1);
insert into MatrixAlgebra.Table2 values(3,'C',1);
insert into MatrixAlgebra.Table2 values(4,'N',17);

commit;

select * from table2;

## Question 3a

select R * 7 'R', C * 7 'C', M * 7 'M' from MatrixAlgebra.Table2;

## Question 3b

## Could not figure it out on my own by just using SQL.  I can do it in PL/SQL or any programming language though..

