as.tibble(iris)

#criação padrão de um tibble
df <- tibble(
  x = 1:5,
  y = 1,
  z = x^2+y
)

#podemos dar nome aos headers com atributos não sintéticos usando ``
tb <- tibble(
  `:)` = 'smile',
  `` = 'space',
  `2000` = 'number'
)

#há uma outra forma para criá-los. Criam-se os headers usando fórmulas (~)
df <- tibble(
  ~x,~y,~z,
  #--/--/------ #linha opcional para melhorarmos nossa visualização
  'a', 2, 3.6,
  'b', 1, 8.5	
)


nyeflights13::flights %>% print(n = 10, width = inf) %>% view() #tamanho infinito


df <- tibble(
  x = runif(5),
  y = rnorm(5)
)

#veja a diferença entre invocar um elemento de um tibble e em um data frame clássico
df[['x']] 
df[[1]]

#para usarmos em conjunto com um pipe, temos que inser um . antes
df %>% .[['x']]