#concat() - permite fazer a concatenação de strings
select concat('Filme: ', nome, ' duração: ', duracao) as resultado
	from tblFilme;
    
#concat_ws() - permite fazer a concatenação utilizando um símbolo como separador

select concat_ws(' - ', nome, duracao, dataLancamento) as resultado
	from tblFilme;
    
#locate() - localiza a posição de uma string
select locate('anos', sinopse) sinopse from tblFilme;

#reverse() - inverter o conteúdo da coluna
select reverse(nome) as resultado
	from tblfilme;
    
#length() ou char_length() - retorna a quantidade de caracteres de uma coluna
select length(nome) as qtde, char_length(nome) as qtde2
	from tblfilme;

#insert - permite inserir um novo conteúdo dentro do texto de uma coluna
	#insert(coluna, posição inicial que será acrescentado o conteúdo,
		#quantidade de caracteres que serão removidos, string a ser acrescentada
select insert(sinopse, 1, 0, 'A sinopse é:') as resultado, sinopse
	from tblfilme;
    
#substr() - permite extrair um conteúdo de uma string
select substr(sinopse, 1, 10) as resultado
	from tblfilme;
    
#replace() - permite localizar um caractere e substituir por outro
select replace(nome, 'A', '@') as resultado
	from tblFilme;

select * from tblfilme;

alter table tblfilme
	add column valor decimal;
    
alter table tblFilme
	modify column valor float;
    
update tblFilme set valor = '9'
	where idFilme = 4;

select nome, qtde, valor, round((valor - (valor*10)/100)) as valorComDesconto
	from tblFilme;