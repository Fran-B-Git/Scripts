import urllib.request
from bs4 import BeautifulSoup

def getTarget(url, id):
    page = urllib.request.urlopen(url)

    value = page.read()

    soup = BeautifulSoup(value, "html.parser")

    table = soup.find(attrs={'id':'table-aktualni-podaci'})

    for i in table.find('tbody').findAll('tr', recursive=True):
        tds = i.findAll('td', recursive=True)
        for j in tds:
            if(j.string.strip()== id):
                value = str(i.text).replace('\n\n','\n').strip()
                l = list()
                for line in value.split('\n'):
                    if(line.strip()!=''):
                        l.append(line.strip())
                return l

directions = dict({
    'N':'↑',
    'NW':'↖',
    'W':'←',
    'SW':'↙',
    'S':'↓',
    'SE':'↘',
    'E':'↑',
    'NE':'↗'})

weather = dict ({
    'vedro':'☀',
    'oblačno':'☁',
    'magla':'🌫',
    'slaba kiša':'🌦',
    'pretežno vedro':'🌤',
    'umjereno oblačno':'🌥',
    'grmljavina':'🌩',
})

target = getTarget('https://meteo.hr/podaci.php?section=podaci_vrijeme&param=hrvatska1_n', 'Zagreb-Maksimir')
id = target[0]
direction = "X"
if(target[1] in directions.keys()):
    direction = directions[ target[1] ]
temp = target[3]
icon = weather[ target[-1].split(',')[0] ]
print(id, direction, temp, icon) 