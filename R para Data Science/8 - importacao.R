read.csv('C:/dados/arquivo.csv')

read.csv('Primeira linha 
	Segunda linha
	x,y,z
	1,2,3', skip = 2) #pulamos 2 linhas

read.csv('# linha comentada que quero saltar
	x,y,z
	1,2,3', comment = '#') #pulamos 2 linhas

read.csv('1,2,3 \n 4,5,6', col_names = False) #\n adiciona uma nova linha e col_names indica se há ou não um header

read.csv('1,2,3 \n 4,5,6', col_names = c('x','y','z')) #inserimos um header 

read.csv('a,b,c \n 1,2,.', na = '.') #em na indicamos que os valores faltantes estão representados como '.' no data frame


x <- parse_integer(c('1','231','.','abc'), na = '.') 
x <- parse_integer(c('123','345','abc','123.45')) 
#podemos verificar falhas no vetor com problems e depois ajusta-las com dplyr
problems(x)


parse_double('1.23', locale = locale(decimal_mark = '.'))

parse_number('isso é um número 5%')

#por padrão, o R reconhece o . como agrupador, então não precisamos defini-lo
parse_number('$10.000')

#em muitos lugares usam-se ,
parse_number('123.156.465', locale = locale(grouping_mark = '.'))

x <- 'El Ni\xf1o was particularly bad this year'
parse_character(x, locale = locale(enconding = 'Latin1')) #aponta a codificação
guess_enconding(charToRaw(x)) #encontra a codificação, pode receber o caminho de um arquivo
charToRaw(x) #mostra o hexadecimal


frutas <- c('maçã','banana')
parse_factor(c('maçã', 'banana', 'bananana'), levels = frutas)


parse_datetime('2010-10-01T2010')
parse_datetime('20101010')

parse_date('2010-10-01')
parse_time('01:10am')
parse_time('20:10:01')

parse_date('01/02/15','%m/%d/%y')

guess_parser('2010-10-02')
guess_parser(c('1','2','3'))

challenge <- read.csv(readr_example('challenge.csv'))
problems(challenge) #veremos problemas em x e y

challenge <- read.csv(readr_example('challenge.csv'), col_types = cols(
  x = col_integer(),
  y = col_character()
))

challenge <- read.csv(readr_example('challenge.csv'), col_types = cols(
  x = col_double(), #ajustamos x
  y = col_date() #ajustamos y
))


write.csv(challenge, 'challenge.csv')

