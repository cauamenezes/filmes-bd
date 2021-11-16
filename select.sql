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
	
    Operadores de comparação
		=
        <
        >
        <=
        >=
        like
        <> -> diferente
    
	like busca os dados pela igualdade, como se fosse o (=)
    
    like '%var' - busca pelo final do atributo
    like 'var%' - busca pelo início do atributo
    like '%var%' - busca por qualquer parte do atributo (início, meio ou fim)
*/
select nome, sinopse from tblFilme where nome like '%vingadores%';

/*
	Operadores lógicos
		and
		or
        not
*/

alter table tblFilme
	add column qtde int;
    
update tblFilme set qtde = 5
	where idFilme = 1;
    
update tblFilme set qtde = 7
	where idFilme = 2;
    
#Exemplos usando operadores de comparação e operadores lógicos
select * from tblFilme
	where qtde <= 5;
    
select nome, qtde from tblFilme
	where qtde <> 5;
    
select nome, qtde from tblFilme
	where not (qtde = 5);
    
select nome, qtde from tblFilme
	where qtde >= 3 and qtde <= 6;
    
select nome, qtde from tblFilme
	where not (qtde >= 3 and qtde <= 6);
    
#between - permite localizar por um range de valores
#Exemplo para não ficar escrevendo o atributo duas vezes
select nome, qtde from tblFilme
	where qtde between 3 and 6;
    
select nome, qtde from tblFilme
	where qtde not between 3 and 6;
    
select nome, qtde
	from tblFilme
	where qtde = 2 or
    qtde = 4 or
    qtde = 6 or
    qtde = 7;
    
#in() - permite filtrar por uma sequência de valores, não precisando escrever o atributo várias vezes
#OBS: Só funciona com o operador lógico OR
select nome, qtde
	from tblFilme
    where qtde in(2, 4, 6, 7);
    
select nome, qtde
	from tblFilme
    where qtde not in(2, 4, 6, 7);    
    
#Ordenação de dados
	#order by
		#ASC - ordenação crescente
        #DESC - ordenação decrescente
        
select * from tblFilme order by nome asc;
select * from tblFilme order by nome desc;

select nome, qtde
	from tblFilme
    where nome like '%de%' and
		qtde in (2, 4, 6)
		order by nome asc;
        
select nome, qtde
	from tblFilme
    where nome like '%de%' and
		qtde in (2, 4, 6)
		order by nome desc;
        
#limit - permite limitar a qtde de resulado na tela
select * from tblFilme limit 2;

#Encontrando o primeiro registro da tabela
select * from tblFilme 
	order by idFilme asc limit 1;

#Encontrando o último registro da tabela
select * from tblFilme 
	order by idFilme desc limit 1;

#MAX - retorna o maior valor de um atributo
#MIN - retorna o menor valor de um atributo

select min(qtde) as qtdeFilmes from tblFilme;
select max(qtde) as qtdeFilmes from tblFilme;

#count - retorna a qtde de itens do filtro (obs: ele ignora os valores null)
select count(nome) as qtdeFilmes from tblFilme
	where nome like '%de%';
    
select count(dataRelancamento) as qtdeDataRelancamento,
		count(nome) as qtdeNomeFilme
	from tblFilme;

#sum - retorna a soma de todas as colunas que foram especficadas
select sum(qtde) as soma from tblFilme;

#avg - retorna a média de uma coluna
#round - define a qtde de casas decimais após a vírgula
select round(avg(qtde), 1) as media from tblFilme;