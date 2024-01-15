import requests
import sys
from requests.auth import HTTPBasicAuth
import random as rnd

limit = 20
chunk = 10
strict = False
rand = False
depth = 5


def scrapePage(url, limit, strict, no_schema, visited, chunk):
    response = requests.get(url, auth=HTTPBasicAuth("gast", "creative"))

    links = []
    for i in response.iter_lines():
        if len(links) > chunk:
            return links
        if "href" in str(i):
            if len(str(i).split('href="')) > 1:
                line = str(i).split('href="')[1].split('"')[0]
                if no_schema in line:
                    line = no_schema + line.split(no_schema)[1].split('"')[0]
                    if line.endswith("/"):
                        line = line[0:-1]
                    line = "https://" + line
                    if (line not in visited) and (line not in links):
                        links.append(line)
    return links


if len(sys.argv) < 2 or not str(sys.argv[-1]).startswith("https://"):
    print("No url target given, exiting")
    exit()

url = str(sys.argv[-1])
no_schema = url.split("https://")[1]

for i in range(len(sys.argv)):
    if sys.argv[i] == "-r":
        rand = True
    if sys.argv[i] == "-s":
        strict = True
    if sys.argv[i] == "-l" and len(sys.argv) > i + 1:
        limit = int(sys.argv[i + 1])
    if sys.argv[i] == "-d" and len(sys.argv) > i + 1:
        depth = int(sys.argv[i + 1])
    if sys.argv[i] == "-c" and len(sys.argv) > i + 1:
        chunk = int(sys.argv[i + 1])

visited = []
next = [url]
gathered = []
for i in range(depth):
    if strict and len(gathered) > limit:
        break

    temp = []
    for link in next:
        visited.append(link)
        once = scrapePage(link, limit, strict, no_schema, visited, chunk)
        temp.extend(once)
    next = temp

    for i in next:
        if i not in gathered:
            gathered.append(i)
    for i in visited:
        if i not in gathered:
            gathered.append(i)

output = []
if not rand:
    print(gathered[0:limit])
    print(len(gathered[0:limit]))

    exit()

while len(output) < limit:
    link = gathered[rnd.randint(0, len(gathered) - 1)]
    gathered.remove(link)
    output.append(link)

print(list(set(output)))
print(len(output))
