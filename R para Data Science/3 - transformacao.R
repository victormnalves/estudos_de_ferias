library(nycflights13)
library(tidyverse)

filter(flights, month == 1, day == 1)

filter(flights, month == 11 | month == 12) #ou mês 11 ou mês 12
filter(flights, month %in% c(11,12)) #mês 11 e 12
#a melhor utilização aqui, é a conhecida De Morgan'law:
!(x & y) = !x | !y
!(x | y) = !x & !y
#exemplo utilizando a variavel de arrival e departure
filter(flights, !(arr_delay > 120 | dep_delay > 120))
filter(flights, arr_delay <= 120, dep_delay <= 120)



df <- tibble(x=c(1, NA, 3)) #criamos um novo data frame

#A função is.na(x) retorna os valores NA como verdadeiros
filter(df, is.na(x) | x>1) #filtramos valores que sejam NA ou >1 


arrange(flights, year) #somente o dado year
arrange(flights, year, month, day) #ano, mês e dia
#o parâmetro desc() serve para reordenarmos de maneira descendente.
arrange(flights, desc(arr_delay))



select(flights, year, month, day) #selecionamos dia, ano, mês
select(flights, year:day) #selecionamos as variáveis entre ano e dia
select(flights, -(year:day)) #selecionamos todas, exceto entre ano e dia

rename(flights, tail_num = tailnum) #Dará o nome tail_num à variável tailnum

select(flights, time_hour, air_time, everything())

flights_sml <- select(flights, year:day, ends_with("delay"),
                      distance, air_time) #criamos um novo dataset selecionando algumas variáveis
mutate(flights_sml, gain = arr_delay - dep_delay, 
       speed = distanc / air_time*60) #criamos diversas novas variáveis com base nas já existentes

#summarize() sozinha
summarize(flights, delay = mean(dep_delay, na.rm = TRUE)) #ainda não se sabe o que é na.rm

#agrupando com summarize() e group_by()
by_day <- group_by(flights, year, month, day)
summarize(by_day, delay = mean(dep_delay, na.rm = TRUE))

#uma combinação entre summarize() e group_by()
by_dest <- group_by(flights, dest)
delay <- summarize(by_dest, count = n(), dist = mean(distance, na.rm = TRUE),
                   delay = mean(arr_delay, na.rm = TRUE))
delay <- filter(delay, count > 20, dest != "HNL")

delays <- flights %>% group_by(dest) %>% summarize(count = n(), dist = mean(distance, na.rm = TRUE), 
              delay = mean(arr_delay, na.rm = TRUE)) %>% filter(count > 20, dest != "HNL")

#criamos o dataset
not_cancelled <- flights %>% filter(!is.na(dep_delay), !is.na(arr_delay))
#agrupamos e calculamos as médias
not_cancelled %>% group_by(year, month, day) %>% summarize(mean = mean(dep_delay))