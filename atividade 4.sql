	delimiter $$
create trigger tri_vendas_ai
after insert on comvenda
for each row
begin
	
	close busca_itens;
    
    SET vtotal_item = NEW.n_valoivenda * NEW.n_qtdeivenda;
    
	UPDATE comvenda SET n_totavenda = vtotal_itens - vtotal_item
	WHERE n_numvenda = new.n_numvenda;
end$$
delimiter ;clare vtotal_itens float(10,2) DEFAULT 0;
	declare vtotal_item float(10,2) DEFAULT 0;
	declare total_item float(10,2);
    DECLARE qtd_item INT DEFAULT 0;
    DECLARE endloop INT DEFAULT 0;
    
	
	declare busca_itens cursor for
		select n_valoivenda, n_qtdeivenda
		from comvenda
		where n_numvenda = new.n_numvenda;
    
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET endloop = 1;
    

	open busca_itens;
	
		itens : loop
            
			IF fimloop = 1 THEN
				LEAVE itens;
			END IF;
        
			fetch busca_itens into total_item, qtd_item;
			
			
			SET vtotal_item = total_item * qtd_item;
			set vtotal_itens = vtotal_itens + vtotal_item;
            
		end loop itens;
CLOSE busca_itens;
    SET vtotal_item = NEW.n_valordvenda * NEW.n_qntdeivenda;
	UPDATE comvenda SET n_totavenda = vtotal_itens - vtotal_item
	WHERE n_numvenda = NEW.n_numvenda;
END$$
DELIMITER ;