#RELACIONAMENTO ENTRE TABELAS
#FORMA 01 - RELACIONAMENTO PELO WHERE
select tblFilme.nome as nomeFilme, tblFilme.duracao,
       tblFilme.dataLancamento, tblGenero.nome as nomeGenero
from   tblFilme, tblGenero, tblfilmegenero
where tblFilme.idFilme = tblFilmeGenero.idFilme and
	tblGenero.idGenero = tblFilmeGenero.idGenero;
    
select * from tblFilme;
select * from tblFilmeAtor;
select * from tblAtor;
select * from tblGenero;
select * from tblFilmeGenero;

#FORMA 02 - RELACIONAMENTO PELO FROM
#	(MODELO MAIS EFICIENTE)

## inner join - é utilizado para relacionar tabelas e trazer a igualdade entre elas
select tblFilme.nome as nomeFilme, tblFilme.duracao,
       tblFIlme.dataLancamento, tblGenero.nome as nomeGenero
from   tblFilme inner join tblFilmeGenero
		  on tblFilme.idFilme = tblFilmeGenero.idFilme
	   inner join tblgenero 
			on tblGenero.idGenero = tblfilmegenero.idGenero;
            
## left join - é utilizado para relacionar tabelas e trazer a igualdade entre elas
## e o que existe na tabela da esquerda que não está relacionado com a tabela da direita
select tblFilme.nome as nomeFilme, tblFilme.duracao,
       tblFIlme.dataLancamento, tblGenero.nome as nomeGenero
from   tblFilme left join tblFilmeGenero
		  on tblFilme.idFilme = tblFilmeGenero.idFilme
	   left join tblgenero 
			on tblGenero.idGenero = tblfilmegenero.idGenero;
            
## right join - é utilizado para relacionar tabelas e trazer a igualdade entre elas
## e o que existe na tabela da direita que não está relacionado com a tabela da esquerda
select tblFilme.nome as nomeFilme, tblFilme.duracao,
       tblFIlme.dataLancamento, tblGenero.nome as nomeGenero
from   tblFilme right join tblFilmeGenero
		  on tblFilme.idFilme = tblFilmeGenero.idFilme
	   right join tblgenero 
			on tblGenero.idGenero = tblfilmegenero.idGenero;
            
#Ex:
select tblFilme.nome as nomeFilme, tblFilme.tituloOriginal,
	   tblFilme.duracao, tblgenero.nome as nomeGenero,
       tblAtor.nome as nomeAtor,
       tblAtor.dataNascimento as dataNascimentoAtor,
       tblSexo.nome as nomeSexoAtor
from   tblFilme inner join tblFilmeGenero
		 on tblfilme.idFilme = tblfilmegenero.idFilme
	   inner join tblGenero
            on tblgenero.idGenero = tblfilmegenero.idGenero
	   inner join tblFilmeAtor
			on tblFilme.idFilme = tblFilmeAtor.idFilme
	   inner join tblAtor
			on tblAtor.idAtor = tblFilmeAtor.idAtor
	   inner join tblSexo
			on tblSexo.idSexo = tblAtor.idSexo
where year(tblFilme.dataLancamento) >= 2010 and
	  year(tblAtor.dataNascimento) >= 1980 and
      tblSexo.idSexo = 1;