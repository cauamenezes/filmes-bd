#### Relacionamentos e Views

## group by - permite agrupar por colunas do banco, ele elimina a repetição
## da coluna trazendo aenas uma ocorrência para ela.

select tblFilme.nome as nomeFilme, tblFilme.dataLancamento,
       tblFilme.sinopse, tblGenero.nome as nomeGenero,
	   tblAtor.nome as nomeAtor, tblAtor.dataNascimento,
       tblNacionalidade.nome as nacionalidadeAtor,
	   tblDiretor.nome as nomeDiretor,
	   tblRoteirista.nome as nomeRoteirista
       
## começar a relação pela tabela mais importante
from   tblFilme inner join tblFilmeGenero
		  on tblFilme.idFilme = tblFilmeGenero.idFilme
	   inner join tblGenero
		  on tblGenero.idGenero = tblFilmeGenero.idGenero
	   inner join tblFilmeAtor
		  on tblFilme.idFilme = tblFilmeAtor.idFilme		
	   inner join tblAtor
          on tblAtor.idAtor = tblFilmeAtor.idAtor
	   inner join tblFilmeDiretor
          on tblFilme.idFilme = tblFilmeDiretor.idFilme
	   inner join tblDiretor
          on tblDiretor.idDiretor = tblFilmeDiretor.idDiretor
	   inner join tblFilmeRoteirista
          on tblFilme.idFilme = tblFilmeRoteirista.idFilme
	   inner join tblRoteirista
          on tblRoteirista.idRoteirista = tblFilmeRoteirista.idRoteirista
	   inner join tblAtorNacionalidade
          on tblAtor.idAtor = tblAtorNacionalidade.idAtor
	   inner join tblNacionalidade
          on tblNacionalidade.idNacionalidade = tblAtorNacionalidade.idNacionalidade
group by tblAtor.nome
order by tblFilme.nome asc, tblAtor.nome desc, tblDiretor.nome asc;
        
        
##CRIANDO UMA VIEW (UMA VIEW É UM SCRIT APENAS DE SELECT QUE FICA ARMAZENADO DIRETAMENTO NO BD E PRÉ PROCESSADO,
# FAZENDO COM QUE NO BACK END FIQUE UM CÓDIGO MAIS LIMPO
# E QUE A SUA APLICAÇÃO TENHA UM PODER DE PROCESSAMENTO MAIS RÁPIDO)

create view vwListarFilmes as

	 select tblFilme.nome as nomeFilme, tblFilme.dataLancamento,
		   tblFilme.sinopse, tblGenero.nome as nomeGenero,
		   tblAtor.nome as nomeAtor, tblAtor.dataNascimento,
		   tblNacionalidade.nome as nacionalidadeAtor,
		   tblDiretor.nome as nomeDiretor,
		   tblRoteirista.nome as nomeRoteirista
		   
	## começar a relação pela tabela mais importante
	from   tblFilme inner join tblFilmeGenero
			  on tblFilme.idFilme = tblFilmeGenero.idFilme
		   inner join tblGenero
			  on tblGenero.idGenero = tblFilmeGenero.idGenero
		   inner join tblFilmeAtor
			  on tblFilme.idFilme = tblFilmeAtor.idFilme		
		   inner join tblAtor
			  on tblAtor.idAtor = tblFilmeAtor.idAtor
		   inner join tblFilmeDiretor
			  on tblFilme.idFilme = tblFilmeDiretor.idFilme
		   inner join tblDiretor
			  on tblDiretor.idDiretor = tblFilmeDiretor.idDiretor
		   inner join tblFilmeRoteirista
			  on tblFilme.idFilme = tblFilmeRoteirista.idFilme
		   inner join tblRoteirista
			  on tblRoteirista.idRoteirista = tblFilmeRoteirista.idRoteirista
		   inner join tblAtorNacionalidade
			  on tblAtor.idAtor = tblAtorNacionalidade.idAtor
		   inner join tblNacionalidade
			  on tblNacionalidade.idNacionalidade = tblAtorNacionalidade.idNacionalidade
	group by tblAtor.nome
	order by tblFilme.nome asc, tblAtor.nome desc, tblDiretor.nome asc;

#Permite visualizar todas as views dentro do BD		
show tables;

#Permite executar uma view
select * from vwListarFilmes;

#apaga uma view
drop view vwListarFilmes;