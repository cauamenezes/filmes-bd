# VIEW -> select -> não trabalha com passagem de parâmetros
# PROCEDURE -> Insert, Delete, Update e Select. Permite fazer condições, repetições e criar variáveis.
# Na function tá a lógica

#FUNCTIONS E PROCEDURES

#deterministic - Para especificar que o retorno da função será do mesmo tipo de dados
	## da entrada de argumentos (caso hover) ou quando não existir argumentos de entrada

#not deterministic - Para especificar que o retorno da função será diferente
	## do tipo de dados da entrada dos argumentos

#DELIMITER - especifíca qual será o símbolo para encerramento da function
DELIMITER $$ 
create function saudacao(usuario char(30))
	returns char(15) #define o tipo de dados de retorno da function
    deterministic
		BEGIN
			#Declaração de variáveis da function
			declare horaAtual time;
			declare hora char(2);
            declare mensagem char(15);
            
            #Para atribuir um dado a uma variável utilizamos o comando set
            set horaAtual = curtime();
            set hora = hour(horaAtual);
            
            if hora >= 5 and hora < 12 then
				set mensagem = 'Bom dia!';
            elseif hora >= 12 and hora < 18 then
				set mensagem = 'Boa Tarde!';
			elseif hora >= 18 and hora <= 23 then
				set mensagem = 'Boa Noite!';
			else
				set mensagem = 'Boa Madrugada!';
			end if;
            
		return concat(mensagem, usuario);
        
		END $$
        
#Chamando uma função        
select saudacao(' José') as mensagem;

#Apaga uma função
drop function saudacao;