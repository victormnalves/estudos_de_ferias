library(tidyverse)
library(nycflights13)


planes %>% count(tailnum) %>% filter(n>1)
weather %>% count(year, month, day, hour, origin) %>% filter(n > 1)
flights %>%  count(year, month, day, tailnum) %>% filter(n > 1)

#criamos um dataset qualquer
flights2 <- flights %>% select(year:day,hour,origin,dest,tailnum, carrier)


#adicionamos as colunas de outro datase sem repetir a coluna com valores semelhantes
flights2 %>% select(-origin,-dest) %>% left_join(airlines, by = 'carrier') #a função left_join serve para adicionarmo uma nova coluna, o argumento by explicita qual elemento queremos "pular"

#teremos como resultado todos os valores de flights que têm os mesmos dest que top_dest
flights %>% semi_join(top_dest)

flights %>% anti_join(planes, by = 'tailnum') %>% count(tailnum, sort = TRUE)


x <- tribble(
  ~key, ~val_x,
  1, "x1",
  2, "x2",
  3, "x3")

y <- tribble(
  ~key, ~val_y,
  1, "y1",
  2, "y2",
  4, "y3")


#intersecção
intersect(x, y)

#união
union(x, y)

#diferença entre
setdiff(x, y)