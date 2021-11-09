/*
	Comentário em bloco
*/

#Comentário em linha

#Criar um database
create database dbFilmesTurmaA;

#Permite visualizar os databases existentes no BD
show databases;

#Apaga um database
drop database dbFilmesTurmaA;

#Selecionar um database a ser utilizado
use dbFilmesTurmaA;

#create table - permite criar uma tabela no BD

#Tabela de Genero
create table tblGenero (
	idGenero int not null auto_increment primary key,
    nome varchar(30) not null,
    unique index(idGenero)
);

#Visualiza todas as tabelas existentes no database
show tables;

#Permite visualizar a estrutura de uma tabela
desc tblAtor;

#Tabela de Filme
create table tblFilme(
	idFilme int not null auto_increment,
    nome varchar(80) not null,
    tituloOriginal varchar(80),
    duracao time not null,
    sinopse text not null,
    dataLancamento date not null,
    dataRelancamento date,
    primary key(idFilme),
    unique index(idFilme)
);

#Tabela de Nacionalidade
create table tblNacionalidade (
	idNacionalidade int not null auto_increment primary key,
    nome varchar(30) not null,
    unique index(idNacionalidade)
);

#Apaga uma tabela
drop table tblNacionalidade;

#Tabela de Sexo
create table tblSexo (
	idSexo int not null auto_increment primary key,
    nome varchar(10) not null,
    unique index(idSexo)
);

#Tabela de Ator
create table tblAtor (
	idAtor int not null auto_increment primary key,
    nome varchar(80) not null,
    nomeArtistico varchar(80),
    dataNascimento date not null,
    dataFalecimento date,
    biografia text,
    idSexo int not null,
    constraint FK_Sexo_Ator #Cria um nome para o Relacionamento
    foreign key (idSexo) #Especifica nesta tabela quem será a FK
    references tblSexo(idSexo), #Especifica de onde está a PK
    unique index (idAtor)
);

drop table tblAtor;

show tables;

#Tabela FilmeAtor
create table tblFilmeAtor (
	idFilmeAtor int not null auto_increment primary key,
    idFilme int not null,
    idAtor int not null,
    
    #Relacionamento com Filme
    #Uma só linha de comando
    constraint FK_Filme_FilmeAtor
    foreign key (idFilme)
    references tblFilme (idFilme),
    
    #Relacionamento com Ator
    constraint FK_Ator_FilmeAtor
    foreign key (idAtor)
    references tblAtor (idAtor),
    
    unique index (idFilmeAtor)
);

#Tabela Diretor
create table tblDiretor (
	idDiretor int not null auto_increment primary key,
    nome varchar(8),
    nomeArtistico varchar(80),
    dataNasc date not null,
    idSexo int not null,
    unique index(idDiretor)
);

#Alterando a estrutura de uma tabela
##modify column - permite modificar as propriedades de um atributo
alter table tblDiretor
	modify column nome varchar(80) not null;
    
##change column - permite renomear o nome do atributo
	#alterar a estrutura de dados e propriedades
alter table tblDiretor
	change column dataNasc dataNascimento date not null;
    
#add column - permite adicionar um novo atributo
alter table tblDiretor
	add column biografia text;
        
#add constraint - permite adicionar um novo relacionamento
alter table tblDiretor
	add constraint FK_Sexo_Diretor
		foreign key (idSexo)
        references tblSexo (idSexo);

#drop column - permite apagar uma coluna
alter table tblDiretor
	drop column idSexo;

#drop foreign key - permite apagar um relacionamento
alter table tblDiretor
	drop foreign key FK_Sexo_Diretor;
    
alter table tblDiretor
	add column idSexo int not null,
    add constraint FK_Sexo_Diretor
    foreign key (idSexo)
    references tblSexo (idSexo);

desc tblDiretor;

create table tblRoteirista (
	idRoteirista int not null auto_increment primary key,
    nome varchar(80) not null,
    nomeArtistico varchar(80),
    dataNascimento date not null,
    dataFalecimento date,
    idSexo int not null,
    constraint FK_Sexo_Roteirista
    foreign key (idSexo)
    references tblSexo(idSexo),
    unique index (idRoteirista)
);

desc tblRoteirista;

create table tblFilmeGenero (
	idFilmeGenero int not null auto_increment primary key,
    idFilme int not null,
    constraint FK_Filme_FilmeGenero
    foreign key (idFilme)
    references tblFilme(idFilme),
    idGenero int not null,
    constraint FK_Genero_FilmeGenero
    foreign key (idGenero)
    references tblGenero(idGenero),
    unique index (idFilmeGenero)
);

desc tblFilmeGenero;

create table tblFilmeDiretor (
	idFilmeDiretor int not null auto_increment primary key,
    idFilme int not null,
    constraint FK_Filme_FilmeDiretor
    foreign key (idFilme)
    references tblFilme(idFilme),
    idDiretor int not null,
    constraint FK_Diretor_FilmeDiretor
    foreign key (idDiretor)
    references tblDiretor(idDiretor),
    unique index (idFilmeDiretor)
);

desc tblFilmeDiretor;

create table tblFilmeRoteirista (
	idFilmeRoteirista int not null auto_increment primary key,
    idFilme int not null,
    constraint FK_Filme_FilmeRoteirista
    foreign key (idFilme)
    references tblFilme(idFilme),
    idRoteirista int not null,
    constraint FK_Roteirista_FilmeRoteirista
    foreign key (idRoteirista)
    references tblRoteirista(idRoteirista),
    unique index (idFilmeRoteirista)
);

desc tblFilmeRoteirista;

create table tblDiretorNacionalidade (
	idDiretorNacionalidade int not null auto_increment primary key,
    idDiretor int not null,
    constraint FK_Diretor_DiretorNacionalidade
    foreign key (idDiretor)
    references tblDiretor(idDiretor),
    idNacionalidade int not null,
    constraint FK_Nacionalidade_DiretorNacionalidade
    foreign key (idNacionalidade)
    references tblNacionalidade(idNacionalidade),
    unique index (idDiretorNacionalidade)
);

desc tblDiretorNacionalidade;

create table tblAtorNacionalidade (
	idAtorNacionalidade int not null auto_increment primary key,
    idAtor int not null,
    constraint FK_Ator_AtorNacionalidade
    foreign key (idAtor)
    references tblAtor(idAtor),
    idNacionalidade int not null,
    constraint FK_Nacionalidade_AtorNacionalidade
    foreign key (idNacionalidade)
    references tblNacionalidade(idNacionalidade),
    unique index (idAtorNacionalidade)
);

desc tblAtorNacionalidade;

create table tblRoteiristaNacionalidade (
	idRoteiristaNacionalidade int not null auto_increment primary key,
    idRoteirista int not null,
    constraint FK_Roteirista_RoteiristaNacionalidade
    foreign key (idRoteirista)
    references tblRoteirista(idRoteirista),
    idNacionalidade int not null,
    constraint FK_Nacionalidade_RoteiristaNacionalidade
    foreign key (idNacionalidade)
    references tblNacionalidade(idNacionalidade),
    unique index (idRoteiristaNacionalidade)
);

desc tblRoteiristaNacionalidade;