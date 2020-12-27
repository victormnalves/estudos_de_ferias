#importando dados do excel para vetores
import xlrd
import numpy as np

wb=xlrd.open_workbook('teste.xlsx')
plan=wb.sheet_by_name('Planilha1')
nr = plan.nrows
x=np.zeros(nr)

for i in range(nr):
    x[i] = plan.cell(i,1).value #recebendo da linha i e coluna B