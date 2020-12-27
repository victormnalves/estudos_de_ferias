#função where

import numpy as np

a=np.array([[2,5,7],[4,10,-1],[1,2,1]])
[i,j]=np.where(a==a.max()) #retorna a posição do elemento dada uma condição lógica
posi = i,j
[i,j]=np.where(a%2==0) #i,j ficam entre colchetes para indexar a rotação vetorial
tam=i,j