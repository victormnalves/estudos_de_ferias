#funções especiais para matrizes

import numpy as np
import xlrd

#exportando matriz
wb=xlrd.open_workbook('matriz.xlsx')
plan=wb.sheet_by_name('Planilha1')
lin=plan.nrows
col=plan.ncols

m=np.zeros((lin,col)) #zerar o vetor
for i in range(lin):
    for j in range(col):
        m[i,j]=plan.cell(i,j).value
        
#matriz inputando valores
n = int(input('n:'))

x=np.zeros((n,n))
for i in range(n):
    for j in range(n):
        x[i,j]=float(input('x:'))

print(x)

hs=np.triu(m) #os valores abaixo da diagonal principal de m receberão 0
hi=np.tril(m) #os valores acima da diagonal principal de m receberão 0