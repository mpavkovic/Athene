#coding=utf-8
import MySQLdb as mdb
import sys
import codecs

def mysql2tuple(query):
    conn = mdb.connect("localhost", "root", "rootpass", "oszamet", use_unicode = True, charset = "utf8")

    cursor = conn.cursor()
    cursor.execute(query)

    rows = cursor.fetchall()
    cursor.close()
    conn.close()
   
    return rows


def query_header(query_name):
    query = ''
    header = ()
    if query_name == 'ucenici_po_nazivima':
        header = (('sifraUstanove','1-2-3'), ('podSifraUstanove','5-6-7'), ('razdoblje','1'), ('skolskaGodina','11-12'), ('uceniciOsnovniPodaci',),('jmbg','ime','prezime','datumRodjenja','drzavaRodjenjaNaziv','mjestoRodjenjaNaziv','mjestoRodjenjaPBroj','spol','sifraNacionalneManjine','prebivalisteUlicaIBroj','prebivalisteMjestoNaziv','prebivalistePBroj','prebivalisteVrijediOd','boravisteUlicaIBroj','boravisteMjestoNaziv','boravistePBroj','boravisteVrijediOd','boravisteRazlogBoravkaSifra'))

        query = """
SELECT u.jmbg, u.ime, u.prezime, u.datum_rodjenja, d.naziv, m_rod.naziv, m_rod.post_br, u.spol, nm.ematica_id as manjina_id, concat(prebivaliste.ulica,' ', prebivaliste.broj), prebivaliste.naziv, prebivaliste.post_br, prebivaliste.datum_od, concat(boraviste.ulica,' ', boraviste.broj), boraviste.naziv, boraviste.post_br, boraviste.datum_od, rb.ematica_id as razlog_boravista
FROM osz_ucenik as u

LEFT OUTER JOIN osz_drzava as d
ON u.narodnost_id = d.id

LEFT OUTER JOIN osz_mjesto as m_rod
ON u.mjesto_rodjenja_id = m_rod.id

LEFT OUTER JOIN 
(SELECT a.ucenik_id, a.ulica, a.broj, m.naziv, m.post_br, a.datum_od
FROM osz_adresa as a
LEFT OUTER JOIN osz_mjesto as m
ON a.mjesto_id = m.id
WHERE a.tip_adrese = 'prebivaliste') as prebivaliste
ON u.oib = prebivaliste.ucenik_id

LEFT OUTER JOIN 
(SELECT a.ucenik_id, a.ulica, a.broj, m.naziv, m.post_br, a.datum_od, a.razlog_boravista_id
FROM osz_adresa as a
LEFT OUTER JOIN osz_mjesto as m
ON a.mjesto_id = m.id
WHERE a.tip_adrese = 'boraviste') as boraviste
ON u.oib = boraviste.ucenik_id

LEFT OUTER JOIN osz_nacionalnamanjina as nm
ON u.nacionalna_manjina_id = nm.id

LEFT OUTER JOIN osz_razlogboravista as rb
ON boraviste.razlog_boravista_id = rb.id
                  """
    elif query_name == 'ucenici_po_siframa':
        query = ''

    else:
        try:
            raise NameError(query_name)
        except NameError as err:
            print('Ne postoji opcija ' + str(err))
            sys.exit()
    return (query, header)


def list2string(data_tuple, header = None, csv_str=unicode('')):
    data_tuple = list(data_tuple)
    data_tuple = [list(i) for i in data_tuple]    

    if header:
        header = list2string(header)
    else:
        header = '';

    csv_str += unicode(header)
       
    for i, data in enumerate(data_tuple):
        for j, c in enumerate(data):
            if c is None:
                data_tuple[i][j] = '' 
            elif type(c) is not unicode:
                data_tuple[i][j] = str(c)
            
            
    for data in data_tuple:
         for att in data:
             if type(att) is unicode:
                csv_str += att + ';'
             else:
                csv_str += unicode(att, errors='ignore') + ';'
         csv_str = csv_str[:-1]
         csv_str += "\n"
    
    return csv_str


def string2file(string, file_name='test.csv'):
    
    try:
        with codecs.open(file_name+'.csv', 'w', encoding='utf-8') as csv_file:
            csv_file.write(string)
    
    except IOError as err:
        print('File error: ' + str(err))



ucenik_tuple = mysql2tuple(query_header(sys.argv[2])[0])

header = query_header(sys.argv[2])[1]

string2file(list2string(ucenik_tuple, header), sys.argv[1])






