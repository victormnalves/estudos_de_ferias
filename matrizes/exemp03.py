#resolvendo sistemas

import numpy as np
from numpy.linalg import inv,solve

a=np.array([[0.15,0.1,0.06],[-1,-1,1],[1,1,1]]) #criamos uma matriz com os coeficientes númericos
b=np.array([20000,0,200000]) #criamos uma matriz com o resultado da igualdade

c=np.dot(inv(a),b) #resolvendo com fórmula
d=solve(a,b) #resolvendo com função pronta