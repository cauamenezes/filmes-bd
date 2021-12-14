DELIMITER $$
create procedure procListarFilmes (IN idGenero int)
	BEGIN
		#Condição para listar os filmes com filtro pelo id do Gênero
		if idGenero > 0 then
			select tblFilme.nome as nomeFilme, tblFilme.dataLancamento,
				   tblGenero.nome as nomeGenero
			from   tblFilme
				inner join tblFilmeGenero
					on tblFilme.idFilme = tblFilmeGenero.idFilme
				inner join tblGenero
					on tblGenero.idGenero = tblFilmeGenero.idGenero
			where tblGenero.idGenero = 2;
            
		#Condição para listar todos os filmes independentemente do id do Gênero
		elseif idGenero = 0 then
			select tblFilme.nome as nomeFilme, tblFilme.dataLancamento,
				   tblGenero.nome as nomeGenero
			from   tblFilme
				inner join tblFilmeGenero
					on tblFilme.idFilme = tblFilmeGenero.idFilme
				inner join tblGenero
					on tblGenero.idGenero = tblFilmeGenero.idGenero;
        end if;
    END $$