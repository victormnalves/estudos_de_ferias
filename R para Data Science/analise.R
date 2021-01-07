ggplot(data = diamonds) + geom_bar(mappings = aes(x = cut)) #histograma com o corte do dataset diamonds

ggplot(data = diamonds) + geom_histogram(mapping = aes(x = carat), binwidth = 0.5) #o parâmetro binwidth define o tamanho das classes
#binwidth é extremamente valiosa para encontramos novos padrões


ggplot(diamonds) + geom_histogram(mapping = aes(x = y), binwidth = 0.5) +
  coord_cartesian(ylim = c(0, 50)) #o parâmetro ylim impões um limite no eixo vertical (xlim impõe no horizontal)

#com a função between podemos procurar somente em um determinado intervalo
diamonds2 <- diamonds %>% filter(between(y, 3, 20))


diamonds2 <- diamonds %>% mutate(y = ifelse(y < 3 | y > 20, NA, y))

#isso criará no plot uma concentração em um ponto indesajado, para suprimir isso utilizamos o parâmetro na.rm
ggplot(data = diamonds2, mapping = aes(x = x, y = y)) + 
  geom_point(na.rm = TRUE)


############################################################

#boxplot de mpg separando em class analisando o hwy
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot()

#podemos ordenar de forma crescente pela mediana

ggplot(data = mpg) 
+ geom_boxplot(mapping = aes(x = reorder(class, hwy, FUN = median), y = hwy)) #a função reorder nos ajuda a ordenar o gráfico

#se os nomes forem muito grandes, podemos girar o plot com coord_flip()
ggplot(data = mpg) +
  geom_boxplot(mapping = aes(x = reorder(class, hwy, FUN = median), y = hwy)) +
  coord_flip()

ggplot(data = diamonds) +
  geom_count(mapping = aes(x = cut, y = color))

#geom_tile cria um heatmap 
diamonds %>% count(color, cut) %>%
  ggplot(mapping = aes(x = color, y = cut)) + geom_tile(mapping = aes(fill = n))

#criando um scatterplot
ggplot(data = diamonds) +
  geom_point(mapping = aes(x = carat, y = price))

#scatterplot com transparência diferente
ggplot(data = diamonds) +
  geom_point(mapping = aes(x = carat, y = price), alpha = 1 / 100)

ggplot(data = smaller) + geom_bin2d(mapping = aes(x = carat, y = price))

install.packages("hexbin")
ggplot(data = smaller) + geom_hex(mapping = aes(x = carat, y = price))

ggplot(data = diamonds, mapping = aes(x = carat, y = price)) +
  geom_boxplot(mapping = aes(group = cut_width(carat, 0.1)))