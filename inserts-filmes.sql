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
                    tituloOriginal,
                    qtde
                    ) values
                    (	'UM SONHO DE LIBERDADE',
						'02:20:00',
                        'Em 1946, Andy Dufresne (Tim Robbins), um jovem e bem sucedido banqueiro, tem a sua vida radicalmente modificada ao ser condenado por um crime que nunca cometeu, o homicídio de sua esposa e do amante dela. Ele é mandado para uma prisão que é o pesadelo de qualquer detento, a Penitenciária Estadual de Shawshank, no Maine. Lá ele irá cumprir a pena perpétua. Andy logo será apresentado a Warden Norton (Bob Gunton), o corrupto e cruel agente penitenciário, que usa a Bíblia como arma de controle e ao Capitão Byron Hadley (Clancy Brown) que trata os internos como animais. Andy faz amizade com Ellis Boyd Redding (Morgan Freeman), um prisioneiro que cumpre pena há 20 anos e controla o mercado negro da instituição.',
                        '1995-01-25',
                        null,
                        'The Shawshank Redemption',
                        2
					),
                    (	'FORREST GUMP - O CONTADOR DE HISTÓRIAS',
						'02:20:20',
                        'Quarenta anos da história dos Estados Unidos, vistos pelos olhos de Forrest Gump (Tom Hanks), um rapaz com QI abaixo da média e boas intenções. Por obra do acaso, ele consegue participar de momentos cruciais, como a Guerra do Vietnã e Watergate, mas continua pensando no seu amor de infância, Jenny Curran.',
                        '1994-12-07',
                        null,
                        'Forrest Gump',
                        4
					);
                    
                    

#Tabela Roteirista Nacionalidade                   
insert into tblRoteiristaNacionalidade (idRoteirista, idNacionalidade)
				values	(1, 1),
						(2, 1),
                        (3, 2),
                        (4, 2),
                        (5, 1),
                        (5, 3),
                        (6, 1),
                        (7, 1);
						
                        
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
                        