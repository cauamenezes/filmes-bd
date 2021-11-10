#SELECT
/*
	select - especifica os campos a serem visualizados na pesquisa
    
    from - especifica quais tabelas serão utilizadas na pesquisa
    
    where - quais critérios de filtros serão utilizados
*/

use dbFilmesTurmaA;

#Retorna todas as colunas e todos os registros
#	* significa todas as colunas
select * from tblfilme;
select tblFilme.* from tblFilme;

#select com colunas específicas no filtro
select nome, sinopse from tblFilme;
select tblFilme.nome, tblFilme.sinopse
	from tblFilme;

# as - permite criar um alias (apelido) para uma coluna ou para uma tabela
select filme.nome as nomeFilme, duracao, sinopse
	from tblFilme as filme;
    
select nome, sinopse from tblFilme where idFilme = 1;

/*
	like busca os dados pela igualdade, como se fosse o (=)
    
    like '%var' - busca pelo final do atributo
    like 'var%' - busca pelo início do atributo
    like '%var%' - busca por qualquer parte do atributo (início, meio ou fim)
*/
select nome, sinopse from tblFilme where nome like '%vingadores%';