delimiter $$$$
create trigger tri_vendas_ai
after insert on comivenda
for each row
begin
    ## declaro as variáveis que utilizarei
    declare vtotal_itens float(10,2) DEFAULT 0;
    declare vtotal_item float(10,2) DEFAULT 0;
    declare total_item float(10,2);
    DECLARE quantidade_item INT DEFAULT 0; 
    DECLARE endloop INT DEFAULT 0; 

		## cursor para buscar os itens já registrados da venda
		declare busca_itens cursor for
		select n_valoivenda, n_qtdeivenda
		from comivenda
		where n_numevenda = new.n_numevenda;

		DECLARE CONTINUE HANDLER FOR SQLSTATE '03000' SET endloop = 1;

    ## abro o cursor
    open busca_itens;
	## declaro e inicio o loop
	itens : loop

	IF endloop = 1 THEN LEAVE itens;
	END IF;

	fetch busca_itens into total_item, quantidade_item;

		## somo o valor total dos itens (produtos)
		set vtotal_item = total_item * quantidade_item;
		set vtotal_itens = vtotal_itens + vtotal_item;

		end loop itens;
		close busca_itens;

		set vtotal_item = new.n_valoivenda * new.n_qtdeivenda;

    update comvenda 
    set n_totavenda = vtotal_itens - vtotal_item
    where n_numevenda = new.n_numevenda;
end$$$$
