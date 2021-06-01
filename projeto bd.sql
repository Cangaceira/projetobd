USE aula5;

Select * from aluno;

----------------------------------------------------------------
/*PRIMEIRO*/

INSERT INTO Aluno (cod_curso, dat_nasc, tot_cred, mgp, nom_alun, email) 
VALUES
(default, '1997-12-2', 60, 8.75, 'Donzelo', 'don@email.com'),
(default, '1997-12-2', 60, 8.75, 'Eleno', 'leninho@email.com'),
(default, '1997-12-2', 60, 8.75, 'Faustão', 'faust_globo@email.com');

DELIMITER $
create procedure novoaluno (mat_aluno INTEGER, cod_curso INTEGER, dat_nasc DATE, tot_cred INTEGER, mgp DOUBLE, nom_alun VARCHAR (60),  email VARCHAR (30))
deterministic
begin
insert into Aluno values(mat_aluno, cod_curso , dat_nasc , tot_cred , mgp , nom_alun, email);
end $

call novoaluno('', '' , '1111-11-1', 60, 8.2, 'abcde', '12345@email.com');
select * from aluno;


drop procedure novoaluno;
----------------------------------------------------------------
/*SEGUNDO*/

delimiter $$
create procedure segundowhile(limite tinyint unsigned)
begin
declare cont int;
declare result Varchar(50);
set cont = 1;
set result = '';
while cont <=5 DO
set result = concat(result, cont,',');
set cont = cont + 1;
end while;
select result;
end $$

call segundowhile(1);    


drop procedure segundowhile;

----------------------------------------------------------------------
/*TERCEIRO*/ 

delimiter $$$
create procedure repetecont(limite tinyint unsigned)
begin
declare cont int;
declare result Varchar(50);
set cont = 1;
set result = '';
repeat set result = concat(result, cont, " , ");
set cont = cont+1;
until cont = 10 end repeat;
select result;
end $$$

call repetecont(0);

drop procedure repetecont;

----------------------------------------------------------------
