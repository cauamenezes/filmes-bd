#Retorna a data atualizada do servidor
select curdate() as dataAtual;
select current_date() as dataAtual;

#Retorna a hora atualizada do servidor
select curtime() as horaAtual;
select current_time() as horaAtual;

#Retorna a data e a hora atualizada do servidor
select current_timestamp() as dataHoraAtualizado;

select current_time() as hora;
select time_format(current_time(), '%H:%i:%s') as hora;
select time_format(current_time(), '%H') as hora;
select time_format(current_time(), '%i') as minuto;
select time_format(current_time(), '%s') as segundo;
select time_format(current_time(), '%H:%i') as horaMinuto;
select time_format(current_time(), '%r') as horaFormatada;
#Retorna a hora em 00 - 23
select time_format(current_time(), '%T') as horaFormatada;

#Exemplo com duas formatações
select time_format(time_format(current_time(), '%T'), '%H:%i') as resultado;

#hour(), minute(), second()
select hour(current_time()) as hora;
select minute(current_time()) as minuto;
select second(current_time()) as segundo;

select concat(hour(current_time()), ':', minute(current_time())) as horaMinuto;

#FORMATAÇÃO DE DATA

select date_format(current_date(), '%W') as diaSemana;
select date_format(current_date(), '%w') as diaSemana;
select date_format(current_date(), '%a') as diaSemana;

select date_format(current_date(), '%M') as mes;
select date_format(current_date(), '%m') as mes;
select date_format(current_date(), '%b') as mes;
select date_format(current_date(), '%d') as dia;
select date_format(current_date(), '%y') as ano;
select date_format(current_date(), '%Y') as ano;

select date_format(current_date(), '%d/%m/%Y') as dataBrasil;
select date_format(current_date(), '%Y-%m-%d') as dataUniversal;

#FUNÇÕES DAY(), MONTH(), YEAR()
select day(current_date()) as dia;
select month(current_date()) as mes;
select year(current_date()) as ano;

select week(current_date()) as numeroSemana;
select dayofweek('2021-11-21') as numeroSemana;
select dayname('2021-11-21') as nomeDaSemana;
select dayofyear('2021-11-21') as diaDoAno;
select date_format('2021-11-21', '%w') as diaSemana;

#Calculando diferença de data e hora
select timediff('15:00:00', '22:00:00') as diferencaHoras;
select ((datediff('2021-11-23', '2022-01-24')*24)*-1) as diferencaHoras,
		datediff('2021-11-23', '2022-01-24') as diferencaDias;
        
select timestampdiff(DAY, '2021-11-22 15:00:00', '2021-11-23 22:00:00')
as difDay;