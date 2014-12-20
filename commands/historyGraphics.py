#!/usr/bin/python
from collections import Counter
import matplotlib.pyplot as plt
cnt = Counter()
for line in open('/home/alfonso/.bash_history', 'r'):
    cnt[line] += 1
unidict = {k.decode('utf8'): v for k, v in cnt.items()}
print unidict
#se le da los datos al plot
plt.bar(range(len(unidict)), unidict.values(), align='edge', width=10)
#Se asignan los labels.
plt.xticks(range(len(unidict)), unidict.keys(), rotation = 45, fontsize = 4)
plt.subplots_adjust(bottom=0.4)
#plt.subplots(2,2,sharex='col')
plt.show()

