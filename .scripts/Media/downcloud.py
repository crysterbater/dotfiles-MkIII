import re
import urllib.request
import os
import os.path
import subprocess

p = re.compile('https:\/\/.+')
l = open('playlist.m3u8', 'r').read()
result = p.findall(l)

if not os.path.exists('output'):
	os.makedirs('output')
i = 0
try:
	for file in result:
		i += 1
		print('downloading #', i, 'of', len(result), '...')
		with open('output/' + str(i) + '.mp3', 'wb') as f:
			mp3 = urllib.request.urlopen(file)
			f.write(mp3.read())
except:
	print('M3U8 file too old! Try with a newer one.')
	exit()

print('calling', ['mp3cat', '-o', 'output/result.mp3'] + ['output/' + str(j) + '.mp3' for j in range(1, i + 1)])

subprocess.call(['mp3cat', '-o', 'output/result.mp3'] + ['output/' + str(j) + '.mp3' for j in range(1, i + 1)])
