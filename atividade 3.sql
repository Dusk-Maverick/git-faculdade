/* AT3 Projeto de Banco de Dados*/


/*1° Quesito*/

DELIMITER $$
CREATE PROCEDURE inserir_aluno(IN id_curso INTEGER,IN dat_nasc DATE,IN total_cred INTEGER,IN mgp DOUBLE,IN n_alun VARCHAR(60),IN email VARCHAR(30)) 
 BEGIN
	INSERT INTO aluno (id_curso, dat_nasc, total_cred, mgp, n_alun, email)
    values (id_curso, dat_nasc, total_cred, mgp, n_alun, email);
    if row_count() = 1 then
    select n_alun from aluno;
    end if;
 END $$
 DELIMITER ;
 
 call insere_aluno(5, '2003-03-20', 40, 6.55, 'joao', 'jvsouzalopes@outlook.com');

/*Fim 1° Quesito*/

/*---------------------------------------------------*/

/*2° Quesito*/

DELIMITER //
CREATE PROCEDURE acumular()
BEGIN
declare cont tinyint unsigned default 1;
declare str varchar(30) default "";
WHILE cont < 6 DO
	set str = concat(str, contador, ",");
    SET contador = contador + 1;
END WHILE;
select str;
END//
DELIMITER ;

CALL acumular();

/*Fim 2° Quesito*/

/*-------------------------------------------------------*/

/*3° Quesito*/

delimiter $$
create procedure acumula_repetidoor()
begin
	declare res  varchar (30) default "";
    declare soma int default 1  ;
    repeat
		set res = concat(result, somador, "," );
        set soma = somador + 1;
        until soma > 9
    end repeat;
    select res;
end $$
delimiter ; 

call acumula_repetidoor();

/*Fim 3° Quesito*/