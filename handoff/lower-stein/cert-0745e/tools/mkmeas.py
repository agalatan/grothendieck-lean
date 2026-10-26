"""Measurement / candidate tables on top of the cert-0745d table.  usage: mkmeas.py t tag mode [args]
 mode 'B'  : add the 0.00125 midpoints of [0.05, 0.2) with the CERTIFIED set-B caps of newcaps2 (min with the chord of the d table), hull
 mode 'I lo hi pad': float ideal caps Psi_float + pad on [lo, hi) (measurement only), hull"""
import sys, json, pickle, numpy as np
from fractions import Fraction as F
from math import ceil
C='/private/tmp/claude-501/-Users-alingalatan-workspaces-grothe/1ff22969-9478-477f-9e37-7f9845d8020c/scratchpad/c'
D='/private/tmp/claude-501/-Users-alingalatan-workspaces-grothe/1ff22969-9478-477f-9e37-7f9845d8020c/scratchpad/d/build'
t, tag, mode = sys.argv[1:4]
R=json.load(open(f'/Users/alingalatan/workspaces/grothe/handoff/lower-stein/cert-0745d/row_{t}.json')); N=[F(x) for x in R['nodes']]; Cp=[F(x) for x in R['caps']]
pk=pickle.load(open(f'{D}/newpkl3_{t}.pkl','rb')); assert list(pk['caps_exact'])==R['caps']
up=lambda v: F(ceil(v*10**12),10**12)
def chord(s):
    k=max(i for i in range(len(N)) if N[i]<=s); return Cp[k] if N[k]==s else Cp[k]+(Cp[k+1]-Cp[k])*(s-N[k])/(N[k+1]-N[k])
src={}
if mode in ('B','BI'):
    X=json.load(open(f'{C}/newcaps2_{t}.json')); add={}
    for s,c,sr in zip(X['nodes'],X['caps'],X['src']):
        s=F(s)
        if F(1,20)<=s<F(1,5) and s not in N: add[s]=min(F(c),up(chord(s))) if F(c)>=chord(s) else F(c); src[s]=sr
    for s,c in add.items(): N.append(s); Cp.append(c)
    o=sorted(range(len(N)),key=lambda i:N[i]); N=[N[i] for i in o]; Cp=[Cp[i] for i in o]
    print(t,'added',len(add),'midpoints; mean lowering vs d chord %.2e'%np.mean([float(chord_v-c) for chord_v,c in []] or [0]))
if mode in ('I','BI'):
    lo,hi,pad=map(float,sys.argv[4:7]); Dg={round(r['s'],6):r['psi'] for r in json.load(open(f'{C}/diag_caps_{t}.json'))}; n=0
    for i,s in enumerate(N):
        if lo<=float(s)<hi:
            v=up(F(Dg[round(float(s),6)]+pad))
            if v<Cp[i]: Cp[i]=v; n+=1
    print(t,'ideal lowered',n)
H=[]
for i in range(len(N)):
    while len(H)>=2 and (Cp[H[-1]]-Cp[H[-2]])*(N[i]-N[H[-2]])>=(Cp[i]-Cp[H[-2]])*(N[H[-1]]-N[H[-2]]): H.pop()
    H.append(i)
for a,b in zip(H[:-1],H[1:]):
    for i in range(a+1,b): Cp[i]=min(Cp[i],up(Cp[a]+(Cp[b]-Cp[a])*(N[i]-N[a])/(N[b]-N[a])))
pk['nodes']=np.array([float(x) for x in N]); pk['nodes_exact']=[str(x) for x in N]; pk['caps_exact']=[str(x) for x in Cp]; pk['caps']=np.array([float(x) for x in Cp])
pickle.dump(pk,open(f'{tag}_{t}.pkl','wb')); json.dump(dict(t=t,nodes=pk['nodes_exact'],caps=pk['caps_exact']),open(f'{tag}_{t}.json','w'))
