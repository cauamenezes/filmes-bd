#Inserts, Updtes, Deletes e Select

##não precisa inserir a chave primária, pois ela é criada automaticamente

use dbFilmesTurmaA;

#Insert individual
insert into tblGenero (nome) values ('Aventura');
insert into tblGenero (nome) values ('Ação');
insert into tblGenero (nome) values ('Romance');

#Insert de múltiplos valores
insert into tblGenero (nome) values ('Fantasia'), ('Drama'), ('Terror'), ('Comédia');

#todo atributo varchar, real, booleano precisa de aspas simples. So não se usa quando é int
#Tabela de Filme
insert into tblFilme (nome,
					duracao,
                    sinopse,
                    dataLancamento,
                    dataRelancamento,
                    tituloOriginal
                    ) values
                    (	'VINGADORES: ULTIMATO',
						'03:01:00',
                        'Em Vingadores: Ultimato, após Thanos eliminar metade das criaturas vivas em Vingadores: Guerra Infinita, os heróis precisam lidar com a dor da perda de amigos e seus entes queridos. Com Tony Stark (Robert Downey Jr.) vagando perdido no espaço sem água nem comida, o Capitão América/Steve Rogers (Chris Evans) e a Viúva Negra/Natasha Romanov (Scarlett Johansson) precisam liderar a resistência contra o titã louco.',
                        '2019-04-25',
						'2019-07-11',
                        'Avengers: Endgame'
					),
					(	'O SENHOR DOS ANÉIS - O RETORNO DO REI',
						'03:21:00',
						'Sauron planeja um grande ataque a Minas Tirith, capital de Gondor, o que faz com que Gandalf (Ian McKellen) e Pippin (Billy Boyd) partam para o local na intenção de ajudar a resistência. Um exército é reunido por Theoden (Bernard Hill) em Rohan, em mais uma tentativa de deter as forças de Sauron. Enquanto isso Frodo (Elijah Wood), Sam (Sean Astin) e Gollum (Andy Serkins) seguem sua viagem rumo à Montanha da Perdição, para destruir o Um Anel.',
						'2003-12-25',
						null,
						'The Lord of the Rings: The Return of the King' 
					);

#Tabela Filme Genero                    
insert into tblFilmeGenero (idFilme, idGenero)
				values	(1, 1),
						(1, 2),
                        (1, 3),
                        (2, 2),
                        (2, 3);
                        
#Update
##atribui o valor indicado ao campo duração em todos os filmes
update tblFilme set duracao = '03:01:00';

###update em campos especíicos e em filmes específicos
update tblFilme set duracao = '03:01:00' where idFilme = 1;
update tblFilme set duracao = '03:21:00' where idFilme = 2;

#Delete
delete from tblGenero where idGenero = 7;
                        
select * from tblGenero;
select * from tblFilme;
select * from tblFilmeGenero;
                        