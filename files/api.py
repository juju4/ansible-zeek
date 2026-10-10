#!/usr/bin/python
# from http://nullsecure.org/building-your-own-passivedns-feed/

import requests
import json
import sys

indicator = sys.argv[1]

url = 'http://localhost:8081/dns/'

r = requests.get(url+indicator)
j = json.loads(r.text)

print('+------------------------+------------------------+--------+-------+-----------------------------+')
print('|       First Seen       |        Last Seen       |  Type  |  TTL  |           Answer            |')
print('+------------------------+------------------------+--------+-------+-----------------------------+')

for record in j['records']:
    print('  ', record['first'], '\t   ', record['last'], '     ',
          record['type'], '      ', record['ttl'], '   ', record['answer'])
