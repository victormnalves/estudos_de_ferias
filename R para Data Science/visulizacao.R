install.packages("tidyverse") #instala o pacote
library(tidyverse) #carrega o pacote

#ggplot(data= <DATA>)+<GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))

#criando um plot de dispersão com os dados mpg$displ e mpg$hmy.
ggplot(data= mpg)+geom_point(mapping = aes(x = displ, y=hwy))

#o parametro color dará cor aos pontos, ele recebe mpg$class, que são as classes dos carros
ggplot(data= mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = class))

ggplot(data= mpg) 
+ geom_point(mapping = aes(x = displ, y = hwy, alpha = class)) #controla a transparência
ggplot(data= mpg) 
+ geom_point(mapping = aes(x = displ, y = hwy, size = class)) #controla o tamanho
ggplot(data= mpg) 
+ geom_point(mapping = aes(x = displ, y = hwy, shape = class)) #controla o formato

ggplot(data= mpg) 
+ geom_point(mapping = aes(x = displ, y = hwy), color = "blue") #todos pontos serão azuis

ggplot(data= mpg) 
+ geom_point(mapping = aes(x = displ, y = hwy), color = "blue") #todos pontos serão azuis

ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut))

#utilizar stat_count() nos retornará o mesmo gráfico que geom_bar()
ggplot(data = diamonds) + stat_count(mapping = aes(x = cut))

#utilizar stat_count() nos retornará o mesmo gráfico que geom_bar()
ggplot(data = diamonds) + stat_count(mapping = aes(x = cut))

ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, y = ..prop.., group = 1)
  )

ggplot(data = diamonds) +
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )