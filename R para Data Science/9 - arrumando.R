table4 %>% gather(`1999`,`2000`,key = 'year', value = 'cases')

table %>% spread(table2, key = type, value = count)



table3 %>% separate(rate, into = c('cases', 'population'))

table3 %>% separate(rate, into = c('cases', 'population'), sep = '/') #podemos explicitar quem separa

#Veja que a coluna rate é chr, mas está composta por int, podemos usar convert para transformarmos chr em int
table3 %>% separate(rate, into = c('cases', 'population'), convert = TRUE)

#separando inteiros
table3 %>% separate(year, into = c('century', 'year'), sep = 2)


table5 %>% unite(new, century, year)
table5 %>% unite(new, century, year, sep = '')

stocks %>% complete(year,qtr)