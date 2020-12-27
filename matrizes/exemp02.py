#matriz básica

import numpy as np
from numpy.linalg import inv

a=np.array([[2,5,8],[1,2,6],[4,9,1]]) #pode-se criar uma matriz manualmente
#a.shape() #retorna a ordem da matriz a

b=np.arange(10) #cria o vetor
b=b.reshape((5,2)) #dispõe b em uma matriz 5 por 2

c=np.identity(8) #identidade 8 por 8

d=np.zeros((3,3)) #cria uma matriz 3 por 2 de zeros

e=np.random.rand(2,5) #matriz aleatoria 5 por 2

multbe=np.dot(e,b) #produto entre a e b 

inva = inv(a) #inversa de a