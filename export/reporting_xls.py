# Reporting za oszamet projekt
# osk1 i osk3 za skole
#
# Jedan mnogo veliki kveri sa kolumnama
# SELECT 
#
#
#
#
#
#
# 
#
# cells:
# Broj Ucenika
# 9C = razred I, muski    || 9D = razred I, zenski
# 10C = razred II, muski  || 10D = razred II, zenski
# 11C = razred III, muski || 11D = razred III, zenski
# 12C = razred IV, muski  || 12D = razred IV, zenski
# Od toga u komb odjelima 14C muski || 15C zenski
# 15C = razred I, muski    || 15D = razred I, zenski
# 16C = razred II, muski  || 16D = razred II, zenski
# 17C = razred III, muski || 17D = razred III, zenski
# 18C = razred IV, muski  || 18D = razred IV, zenski
# Od toga u komb odjelima 20C muski || 20C zenski
# 

import MySQLdb as mdb
import sys
import _mysql
from xlrd import *
from xlwt import *
from xlutils.copy import copy

query = """SELECT r.razred, zenske.Z, muski.M, opravdano.opravdano, neopravdano.neopravdano
FROM osz_ucenik as u
INNER JOIN osz_ucenik_razrednoodjeljenje as ur
ON u.oib = ur.ucenik_id
RIGHT OUTER JOIN osz_razrednoodjeljenje as r
ON ur.razrednoodjeljenje_id = r.id

LEFT OUTER JOIN 
(SELECT r.razred as razred, count(u.spol) as Z
FROM osz_ucenik as u
INNER JOIN osz_ucenik_razrednoodjeljenje as ur
ON u.oib = ur.ucenik_id
INNER JOIN osz_razrednoodjeljenje as r
ON ur.razrednoodjeljenje_id = r.id
WHERE spol = 'Z'
GROUP BY r.razred) as zenske
ON r.razred = zenske.razred

LEFT OUTER JOIN 
(SELECT r.razred as razred, count(u.spol) as M
FROM osz_ucenik as u
INNER JOIN osz_ucenik_razrednoodjeljenje as ur
ON u.oib = ur.ucenik_id
INNER JOIN osz_razrednoodjeljenje as r
ON ur.razrednoodjeljenje_id = r.id
WHERE spol = 'M'
GROUP BY r.razred) as muski
ON r.razred = muski.razred

LEFT OUTER JOIN 
(SELECT r.razred as razred, count(i.opravdano) as neopravdano
FROM osz_ucenik as u
INNER JOIN osz_izostanak as i
ON u.oib = i.ucenik_id
INNER JOIN osz_ucenik_razrednoodjeljenje as ur
ON u.oib = ur.ucenik_id
INNER JOIN osz_razrednoodjeljenje as r
ON ur.razrednoodjeljenje_id = r.id
WHERE i.opravdano = 0
GROUP BY r.razred) as neopravdano
ON r.razred = neopravdano.razred

LEFT OUTER JOIN 
(SELECT r.razred as razred, count(i.opravdano) as opravdano
FROM osz_ucenik as u
INNER JOIN osz_izostanak as i
ON u.oib = i.ucenik_id
INNER JOIN osz_ucenik_razrednoodjeljenje as ur
ON u.oib = ur.ucenik_id
INNER JOIN osz_razrednoodjeljenje as r
ON ur.razrednoodjeljenje_id = r.id
WHERE i.opravdano = 1
GROUP BY r.razred) as opravdano
ON r.razred = opravdano.razred

GROUP BY r.razred
"""

def mysql2tuple(query):
    conn = mdb.connect("localhost",
                       "root",
                       "rootpass",
                       "oszamet")

    cursor = conn.cursor()
    cursor.execute(query)

    rows = cursor.fetchall()
    column_name = []
    
    for i in cursor.description:
        column_name.append(i[0])

    cursor.close()
    conn.close()
    
    return (column_name, rows)


def mysql2dict(query):
    db=_mysql.connect("localhost",
                       "root",
                       "rootpass",
                       "oszamet")
    db.query(query)
    r=db.store_result()
    data = r.fetch_row(maxrows=0, how=1)
    return data


def report_osk13(file_name):

    rb = open_workbook('osk13_template.xls',formatting_info=True)
    rs = rb.sheet_by_index(0)
    wb = copy(rb)
    ws = wb.get_sheet(0)

    plain = easyxf('borders: left thin, right thin, top thin, bottom thin;' 
                   'alignment: vertical center;'
                   'font: height 220, name Arial Narrow;')

    plain_yellow = easyxf('borders: left thin, right thin, top thin, bottom thin;' 
                   'alignment: vertical center;'
                   'font: height 220, name Arial Narrow;'
                   'pattern: pattern solid, fore_colour light_yellow')

    plain_yellow_bold = easyxf('borders: left thin, right thin, top thin, bottom thin;' 
                   'alignment: vertical center;'
                   'font: height 220, name Arial Narrow, bold True;'
                   'pattern: pattern solid, fore_colour light_yellow;')

    plain_yellower_bold = easyxf('borders: left thin, right thin, top thin, bottom thin;' 
                   'alignment: vertical center;'
                   'font: height 220, name Arial Narrow, bold True;'
                   'pattern: pattern solid, fore_colour yellow;')

    plain_yellow_bold_red = easyxf('borders: left thin, right thin, top thin, bottom thin;' 
                   'alignment: vertical center;'
                   'font: height 220, name Arial Narrow, bold True, colour red;'
                   'pattern: pattern solid, fore_colour yellow;')
    
    # broj ucenika  
    ws.write(8, 1, Formula('SUM(C9:D9)'), plain_yellow)
    ws.write(9, 1, Formula('SUM(C10:D10)'), plain_yellow)
    ws.write(10, 1, Formula('SUM(C11:D11)'), plain_yellow)
    ws.write(11, 1, Formula('SUM(C12:D12)'), plain_yellow)

    ws.write(12, 1, Formula('SUM(B9:B12)'), plain_yellow_bold)
    ws.write(12, 2, Formula('SUM(C9:C12)'), plain_yellow_bold)
    ws.write(12, 3, Formula('SUM(D9:D12)'), plain_yellow_bold)
    
    ws.write(13, 1, Formula('SUM(C14:D14)'), plain_yellow)


    ws.write(14, 1, Formula('SUM(C15:D15)'), plain_yellow)
    ws.write(15, 1, Formula('SUM(C16:D16)'), plain_yellow)
    ws.write(16, 1, Formula('SUM(C17:D17)'), plain_yellow)
    ws.write(17, 1, Formula('SUM(C18:D18)'), plain_yellow)

    ws.write(18, 1, Formula('SUM(B15:B18)'), plain_yellow_bold)
    ws.write(18, 2, Formula('SUM(C15:C18)'), plain_yellow_bold)
    ws.write(18, 3, Formula('SUM(D15:D18)'), plain_yellow_bold)

    ws.write(19, 1, Formula('SUM(C20:D20)'), plain_yellow)

    ws.write(20, 1, Formula('SUM(B13+B19)'), plain_yellow_bold_red)
    ws.write(20, 2, Formula('SUM(C13+C19)'), plain_yellow_bold_red)
    ws.write(20, 3, Formula('SUM(D13+D19)'), plain_yellow_bold_red)
    


    # ukupno ocjene
    ws.write(12, 4, Formula('SUM(E9:E12)'), plain_yellow_bold)
    ws.write(18, 4, Formula('SUM(E15:E18)'), plain_yellow_bold)
    ws.write(20, 4, Formula('SUM(E13+E19)'), plain_yellow_bold_red)

    ws.write(12, 5, Formula('SUM(F9:F12)'), plain_yellow_bold)
    ws.write(18, 5, Formula('SUM(F15:F18)'), plain_yellow_bold)
    ws.write(20, 5, Formula('SUM(F13+F19)'), plain_yellow_bold_red)

    ws.write(12, 6, Formula('SUM(G9:G12)'), plain_yellow_bold)
    ws.write(18, 6, Formula('SUM(G15:G18)'), plain_yellow_bold)
    ws.write(20, 6, Formula('SUM(G13+G19)'), plain_yellow_bold_red)

    ws.write(12, 7, Formula('SUM(H9:H12)'), plain_yellow_bold)
    ws.write(18, 7, Formula('SUM(H15:H18)'), plain_yellow_bold)
    ws.write(20, 7, Formula('SUM(H13+H19)'), plain_yellow_bold_red)

    ws.write(12, 8, Formula('SUM(I9:I12)'), plain_yellow_bold)
    ws.write(18, 8, Formula('SUM(I15:I18)'), plain_yellow_bold)
    ws.write(20, 8, Formula('SUM(I13+I19)'), plain_yellow_bold_red)

    ws.write(12, 9, Formula('SUM(J9:J12)'), plain_yellow_bold)
    ws.write(18, 9, Formula('SUM(J15:J18)'), plain_yellow_bold)
    ws.write(20, 9, Formula('SUM(J13+J19)'), plain_yellow_bold_red)

    ws.write(12, 10, Formula('SUM(K9:K12)'), plain_yellow_bold)
    ws.write(18, 10, Formula('SUM(K15:K18)'), plain_yellow_bold)
    ws.write(20, 10, Formula('SUM(K13+K19)'), plain_yellow_bold_red)


    #upuceni na polaganje
    ws.write(12, 11, Formula('SUM(L9:L12)'), plain_yellow_bold)
    ws.write(18, 11, Formula('SUM(L15:L18)'), plain_yellow_bold)
    ws.write(20, 11, Formula('SUM(L13+L19)'), plain_yellow_bold_red)

    ws.write(12, 12, Formula('SUM(M9:M12)'), plain_yellow_bold)
    ws.write(18, 12, Formula('SUM(M15:M18)'), plain_yellow_bold)
    ws.write(20, 12, Formula('SUM(M13+M19)'), plain_yellow_bold_red)

    ws.write(12, 13, Formula('SUM(N9:N12)'), plain_yellow_bold)
    ws.write(18, 13, Formula('SUM(N15:N18)'), plain_yellow_bold)
    ws.write(20, 13, Formula('SUM(N13+N19)'), plain_yellow_bold_red)

    ws.write(12, 14, Formula('SUM(O9:O12)'), plain_yellow_bold)
    ws.write(18, 14, Formula('SUM(O15:O18)'), plain_yellow_bold)
    ws.write(20, 14, Formula('SUM(O13+O19)'), plain_yellow_bold_red)
    

    #upuceni na popravni ispit
    ws.write(12, 15, Formula('SUM(P9:P12)'), plain_yellow_bold)
    ws.write(18, 15, Formula('SUM(P15:P18)'), plain_yellow_bold)
    ws.write(20, 15, Formula('SUM(P13+P19)'), plain_yellow_bold_red)

    ws.write(12, 16, Formula('SUM(Q9:Q12)'), plain_yellow_bold)
    ws.write(18, 16, Formula('SUM(Q15:Q18)'), plain_yellow_bold)
    ws.write(20, 16, Formula('SUM(Q13+Q19)'), plain_yellow_bold_red)

    ws.write(12, 17, Formula('SUM(R9:R12)'), plain_yellow_bold)
    ws.write(18, 17, Formula('SUM(R15:R18)'), plain_yellow_bold)
    ws.write(20, 17, Formula('SUM(R13+R19)'), plain_yellow_bold_red)

    ws.write(12, 18, Formula('SUM(S9:S12)'), plain_yellow_bold)
    ws.write(18, 18, Formula('SUM(S15:S18)'), plain_yellow_bold)
    ws.write(20, 18, Formula('SUM(S13+S19)'), plain_yellow_bold_red)

    #broj ucenika koji nisu zavrsili razred
    ws.write(8, 19, Formula('SUM(U9:X9)'), plain_yellow)
    ws.write(9, 19, Formula('SUM(U10:X10)'), plain_yellow)
    ws.write(10, 19, Formula('SUM(U11:X11)'), plain_yellow)
    ws.write(11, 19, Formula('SUM(U12:X12)'), plain_yellow)

    ws.write(13, 19, Formula('SUM(U14:X14)'), plain_yellow)

    ws.write(14, 19, Formula('SUM(U15:X15)'), plain_yellow)
    ws.write(15, 19, Formula('SUM(U16:X16)'), plain_yellow)
    ws.write(16, 19, Formula('SUM(U17:X17)'), plain_yellow)
    ws.write(17, 19, Formula('SUM(U18:X18)'), plain_yellow)

    ws.write(19, 19, Formula('SUM(U20:X20)'), plain_yellow)

    ws.write(12, 19, Formula('SUM(T9:T12)'), plain_yellow_bold)
    ws.write(18, 19, Formula('SUM(T15:T18)'), plain_yellow_bold)
    ws.write(20, 19, Formula('SUM(T13+T19)'), plain_yellow_bold_red)

    ws.write(12, 20, Formula('SUM(U9:U12)'), plain_yellow_bold)
    ws.write(18, 20, Formula('SUM(U15:U18)'), plain_yellow_bold)
    ws.write(20, 20, Formula('SUM(U13+U19)'), plain_yellow_bold_red)

    ws.write(12, 21, Formula('SUM(V9:V12)'), plain_yellow_bold)
    ws.write(18, 21, Formula('SUM(V15:V18)'), plain_yellow_bold)
    ws.write(20, 21, Formula('SUM(V13+V19)'), plain_yellow_bold_red)

    ws.write(12, 22, Formula('SUM(W9:W12)'), plain_yellow_bold)
    ws.write(18, 22, Formula('SUM(W15:W18)'), plain_yellow_bold)
    ws.write(20, 22, Formula('SUM(W13+W19)'), plain_yellow_bold_red)

    ws.write(12, 23, Formula('SUM(X9:X12)'), plain_yellow_bold)
    ws.write(18, 23, Formula('SUM(X15:X18)'), plain_yellow_bold)
    ws.write(20, 23, Formula('SUM(X13+X19)'), plain_yellow_bold_red)

    #broj akceleriranih ucenika
    ws.write(12, 24, Formula('SUM(Y9:Y12)'), plain_yellow_bold)
    ws.write(18, 24, Formula('SUM(Y15:Y18)'), plain_yellow_bold)
    ws.write(20, 24, Formula('SUM(Y13+Y19)'), plain_yellow_bold_red)


    #kontrola sa nulama, da li je potrebno?

    #opravdano
    ws.write(12, 31, Formula('SUM(AF9:AF12)'), plain_yellower_bold)
    ws.write(18, 31, Formula('SUM(AF15:AF18)'), plain_yellower_bold)
    ws.write(20, 31, Formula('SUM(AF13+AF19)'), plain_yellow_bold_red)
        
    #neopravdano
    ws.write(12, 32, Formula('SUM(AG9:AG12)'), plain_yellower_bold)
    ws.write(18, 32, Formula('SUM(AG15:AG18)'), plain_yellower_bold)
    ws.write(20, 32, Formula('SUM(AG13+AG19)'), plain_yellow_bold_red)

    #UKUPNO
    ws.write(8, 33, Formula('SUM(AF9:AG9)'), plain_yellower_bold)
    ws.write(9, 33, Formula('SUM(AF10:AG10)'), plain_yellower_bold)
    ws.write(10, 33, Formula('SUM(AF11:AG11)'), plain_yellower_bold)
    ws.write(11, 33, Formula('SUM(AF12:AG12)'), plain_yellower_bold)
 
    ws.write(12, 33, Formula('SUM(AH9:AH12)'), plain_yellower_bold)
    ws.write(13, 33, Formula('SUM(AF14:AG14)'), plain_yellower_bold)

    ws.write(14, 33, Formula('SUM(AF15:AG15)'), plain_yellower_bold)
    ws.write(15, 33, Formula('SUM(AF16:AG16)'), plain_yellower_bold)
    ws.write(16, 33, Formula('SUM(AF17:AG17)'), plain_yellower_bold)
    ws.write(17, 33, Formula('SUM(AF18:AG18)'), plain_yellower_bold)

    ws.write(18, 33, Formula('SUM(AH15:AH18)'), plain_yellower_bold)
    ws.write(19, 33, Formula('SUM(AF20:AG20)'), plain_yellower_bold)
    ws.write(20, 33, Formula('SUM(AH13+AH19)'), plain_yellow_bold_red)

    #Pohvala
    ws.write(12, 34, Formula('SUM(AI9:AI12)'), plain_yellower_bold)
    ws.write(18, 34, Formula('SUM(AI15:AI18)'), plain_yellower_bold)
    ws.write(20, 34, Formula('SUM(AI13+AI19)'), plain_yellow_bold_red)

    #Nagrada
    ws.write(12, 35, Formula('SUM(AJ9:AJ12)'), plain_yellower_bold)
    ws.write(18, 35, Formula('SUM(AJ15:AJ18)'), plain_yellower_bold)
    ws.write(20, 35, Formula('SUM(AJ13+AJ19)'), plain_yellow_bold_red)

    #UKUPNO
    ws.write(8, 36, Formula('SUM(AI9:AJ9)'), plain_yellower_bold)
    ws.write(9, 36, Formula('SUM(AI10:AJ10)'), plain_yellower_bold)
    ws.write(10, 36, Formula('SUM(AI11:AJ11)'), plain_yellower_bold)
    ws.write(11, 36, Formula('SUM(AI12:AJ12)'), plain_yellower_bold)

    ws.write(12, 36, Formula('SUM(AK9:AK12)'), plain_yellower_bold)
    ws.write(13, 36, Formula('SUM(AI14:AJ14)'), plain_yellower_bold)

    ws.write(14, 36, Formula('SUM(AI15:AJ15)'), plain_yellower_bold)
    ws.write(15, 36, Formula('SUM(AI16:AJ16)'), plain_yellower_bold)
    ws.write(16, 36, Formula('SUM(AI17:AJ17)'), plain_yellower_bold)
    ws.write(17, 36, Formula('SUM(AI18:AJ18)'), plain_yellower_bold)

    ws.write(18, 36, Formula('SUM(AK15:AK18)'), plain_yellower_bold)
    ws.write(19, 36, Formula('SUM(AI20:AJ20)'), plain_yellower_bold)

    ws.write(20, 36, Formula('SUM(AK13+AK19)'), plain_yellow_bold_red)

    #Opomena
    ws.write(12, 37, Formula('SUM(AL9:AL12)'), plain_yellower_bold)
    ws.write(18, 37, Formula('SUM(AL15:AL18)'), plain_yellower_bold)
    ws.write(20, 37, Formula('SUM(AL13+AL19)'), plain_yellow_bold_red)

    #Ukor
    ws.write(12, 38, Formula('SUM(AM9:AM12)'), plain_yellower_bold)
    ws.write(18, 38, Formula('SUM(AM15:AM18)'), plain_yellower_bold)
    ws.write(20, 38, Formula('SUM(AM13+AM19)'), plain_yellow_bold_red)

    #Strogi Ukor
    ws.write(12, 39, Formula('SUM(AN9:AN12)'), plain_yellower_bold)
    ws.write(18, 39, Formula('SUM(AN15:AN18)'), plain_yellower_bold)
    ws.write(20, 39, Formula('SUM(AN13+AN19)'), plain_yellow_bold_red)

    #Preseljenje u drugu skolu
    ws.write(12, 40, Formula('SUM(AO9:AO12)'), plain_yellower_bold)
    ws.write(18, 40, Formula('SUM(AO15:AO18)'), plain_yellower_bold)
    ws.write(20, 40, Formula('SUM(AO13+AO19)'), plain_yellow_bold_red)

    #UKUPNO
    ws.write(8, 41, Formula('SUM(AL9:AO9)'), plain_yellower_bold)
    ws.write(9, 41, Formula('SUM(AL10:AO10)'), plain_yellower_bold)
    ws.write(10, 41, Formula('SUM(AL11:AO11)'), plain_yellower_bold)
    ws.write(11, 41, Formula('SUM(AL12:AO12)'), plain_yellower_bold)

    ws.write(12, 41, Formula('SUM(AP9:AP12)'), plain_yellower_bold)
    ws.write(13, 41, Formula('SUM(AL14:AO14)'), plain_yellower_bold)

    ws.write(14, 41, Formula('SUM(AL15:AO15)'), plain_yellower_bold)
    ws.write(15, 41, Formula('SUM(AL16:AO16)'), plain_yellower_bold)
    ws.write(16, 41, Formula('SUM(AL17:AO17)'), plain_yellower_bold)
    ws.write(17, 41, Formula('SUM(AL18:AO18)'), plain_yellower_bold)

    ws.write(18, 41, Formula('SUM(AP15:AP18)'), plain_yellower_bold)
    ws.write(19, 41, Formula('SUM(AL20:AO20)'), plain_yellower_bold)
    ws.write(20, 41, Formula('SUM(AP13+AP19)'), plain_yellow_bold_red)

    

    #punjenje reporta iz baze
    razredi = mysql2dict(query)
    
    razred_1 = {}
    razred_2 = {}
    razred_3 = {}
    razred_4 = {}
    razred_5 = {}
    razred_6 = {}
    razred_7 = {}
    razred_8 = {}

    for i, razred in enumerate(razredi):
        for c in razred.items():
            if c[1] is None:
                razredi[i][c[0]] = 0

    for razred in razredi:
        if razred['razred'] == '1':
            razred_1 = razred
        elif razred['razred'] == '2':
            razred_2 = razred
        elif razred['razred'] == '3':
            razred_3 = razred
        elif razred['razred'] == '4':
            razred_4 = razred
        elif razred['razred'] == '5':
            razred_5 = razred
        elif razred['razred'] == '6':
            razred_6 = razred
        elif razred['razred'] == '7':
            razred_7 = razred
        elif razred['razred'] == '8':
            razred_8 = razred

    #1. razred
    if razred_1:
        ws.write(8, 2, int(razred_1['M']), plain)
        ws.write(8, 3, int(razred_1['Z']), plain)
    
        ws.write(8, 31, int(razred_1['opravdano']), plain)
        ws.write(8, 32, int(razred_1['neopravdano']), plain)

    #2. razred
    if razred_2:    
        ws.write(9, 2, int(razred_2['M']), plain)
        ws.write(9, 3, int(razred_2['Z']), plain)
    
        ws.write(9, 31, int(razred_2['opravdano']), plain)
        ws.write(9, 32, int(razred_2['neopravdano']), plain)

    #3. razred
    if razred_3:    
        ws.write(10, 2, int(razred_3['M']), plain)
        ws.write(10, 3, int(razred_3['Z']), plain)
    
        ws.write(10, 31, int(razred_3['opravdano']), plain)
        ws.write(10, 32, int(razred_3['neopravdano']), plain)

    #4. razred
    if razred_4:
        ws.write(11, 2, int(razred_4['M']), plain)
        ws.write(11, 3, int(razred_4['Z']), plain)
    
        ws.write(11, 31, int(razred_4['opravdano']), plain)
        ws.write(11, 32, int(razred_4['neopravdano']), plain)

    #5. razred
    if razred_5:    
        ws.write(14, 2, int(razred_5['M']), plain)
        ws.write(14, 3, int(razred_5['Z']), plain)
    
        ws.write(14, 31, int(razred_5['opravdano']), plain)
        ws.write(14, 32, int(razred_5['neopravdano']), plain)

    #6. razred
    if razred_6:    
        ws.write(15, 2, int(razred_6['M']), plain)
        ws.write(15, 3, int(razred_6['Z']), plain)
    
        ws.write(15, 31, int(razred_6['opravdano']), plain)
        ws.write(15, 32, int(razred_6['neopravdano']), plain)

    #7. razred
    if razred_7:
        ws.write(16, 2, int(razred_7['M']), plain)
        ws.write(16, 3, int(razred_7['Z']), plain)
    
        ws.write(16, 31, int(razred_7['opravdano']), plain)
        ws.write(16, 32, int(razred_7['neopravdano']), plain)

    #8. razred
    if razred_8:    
        ws.write(17, 2, int(razred_8['M']), plain)
        ws.write(17, 3, int(razred_8['Z']), plain)
    
        ws.write(17, 31, int(razred_8['opravdano']), plain)
        ws.write(17, 32, int(razred_8['neopravdano']), plain)

  

    wb.save(file_name+'.xls')


report_osk13(sys.argv[1])




 


