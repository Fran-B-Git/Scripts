import requests
import sys
from requests.auth import HTTPBasicAuth
import random as rnd
import xml.etree.ElementTree as et

limit = 20
strict = False
rand = False

if len(sys.argv) < 2 or not str(sys.argv[-1]).startswith("https://"):
    print("No url target given, exiting")
    exit()

url = str(sys.argv[-1])
for i in range(len(sys.argv)):
    if sys.argv[i] == "-r":
        rand = True
        strict = True
    if sys.argv[i] == "-s":
        strict = True
    if sys.argv[i] == "-l" and len(sys.argv) > i + 1:
        limit = int(sys.argv[i + 1])
        strict = True

response = requests.get(url, auth=HTTPBasicAuth("gast", "creative"))
links = []
tree = et.fromstring(response.text)

for i in tree:
    if i[0].text not in links:
        links.append(i[0].text)

output = []


for i in links:
    link = i
    if strict and (len(output) > limit):
        break
    if rand:
        link = links[0]
        while link in output:
            link = links[rnd.randint(0, len(links) - 1)]
    output.append(link)


for i in output:
    print(i)
