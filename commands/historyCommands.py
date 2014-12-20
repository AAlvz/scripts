#!/usr/bin/python
from collections import Counter
cnt = Counter()
for line in open('/home/alfonso/.bash_history', 'r'):
    cnt[line] += 1
#for k, v in cnt.most_common()[:-10:-1]:
for k, v in cnt.most_common()[:25]:
#    if len(k) > 70 and "|" in k: ##Para One-Liners
        print k + " "+ str((v*100.00/sum(cnt.values())))+" %\n"
#unidict = {k.decode('utf8'): v for k, v in cnt.items()}
