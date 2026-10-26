"""FLOAT measurement only: newpkl_<t>.pkl with caps on ranges replaced by min(cap, Psi_float + pad_range), then hull.  usage: t tag lo:hi:pad,..."""
import sys, json, pickle, numpy as np
from fractions import Fraction as F
from math import ceil
C='/private/tmp/claude-501/-Users-alingalatan-workspaces-grothe/1ff22969-9478-477f-9e37-7f9845d8020c/scratchpad/c'
t, tag = sys.argv[1], sys.argv[2]; RG=[tuple(float(u) for u in a.split(':')) for a in sys.argv[3].split(',')]
pk = pickle.load(open(f'{C}/newpkl_{t}.pkl','rb')); N=[F(int(round(v*10**4)),10**4) for v in pk['nodes']]; Cp=[F(v) for v in pk['caps_exact']]
D={round(r['s'],6): r['psi'] for r in json.load(open(f'{C}/diag_caps_{t}.json'))}
up = lambda v: F(ceil(v*10**12),10**12); n=0
for i,s in enumerate(N):
    fs=float(s); hit=[pd for lo,hi,pd in RG if lo<=fs<hi]
    if hit:
        v=up(F(D[round(fs,6)]+hit[0]))
        if v<Cp[i]: Cp[i]=v; n+=1
H=[]
for i in range(len(N)):
    while len(H)>=2 and (Cp[H[-1]]-Cp[H[-2]])*(N[i]-N[H[-2]]) >= (Cp[i]-Cp[H[-2]])*(N[H[-1]]-N[H[-2]]): H.pop()
    H.append(i)
for a,b in zip(H[:-1],H[1:]):
    for i in range(a+1,b): Cp[i]=min(Cp[i], up(Cp[a]+(Cp[b]-Cp[a])*(N[i]-N[a])/(N[b]-N[a])))
pk['caps_exact']=[str(v) for v in Cp]; pk['caps']=np.array([float(v) for v in Cp]); pickle.dump(pk,open(f'{tag}_{t}.pkl','wb')); print(t,tag,n,'lowered')
