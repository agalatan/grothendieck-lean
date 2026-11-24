import json, numpy as np, sys
from scipy.interpolate import CubicSpline
from numpy.polynomial.laguerre import laggauss
from numpy.polynomial.legendre import leggauss
R='/Users/alingalatan/workspaces/grothe/research/higher-degree/code/degree5-content/'
tau, w = laggauss(64)
x, wx = leggauss(40); T=[]; W=[]
for a,b in zip([0,.5,1,1.5,2,2.5,3,4,6,9,14,22,34],[.5,1,1.5,2,2.5,3,4,6,9,14,22,34,60]):
    T.append((b-a)/2*x+(a+b)/2); W.append((b-a)/2*wx)
T=np.concatenate(T); W=np.concatenate(W)*np.exp(-T)
def junta(path, frac, sect='A'):
    d=json.load(open(path)); S=np.array(d['S'])
    G=CubicSpline(S, np.array(d['G'+sect])+(0.4 if sect=='A' else 0.3)*np.array(d['G0']))
    def h(v):
        s=np.sqrt(np.maximum(v,1e-18)); return G(np.minimum(s,6.0))/s
    u=frac*d['ustar']
    kp=lambda v:(np.array([w@h(xx+u*tau) for xx in np.atleast_1d(v)])-h(np.atleast_1d(v)))/u
    V=u*T*(T-2)**2/2
    c=np.sqrt(u)*(W@(T*(T-2)/np.sqrt(2)*h(V))); K=kp(V); Om=1.5*(W@(V*K**2))-0.75*(W@(V*K))**2/u
    return c**2/(42*u*u), Om, c**2/(42*u*u*Om), d
print('PV3 snippet row 0.84 0.85u* (expect 0.01540 0.06732 0.2287):', junta(R+'profiles/band_row_0.84.json',0.85)[:3])
for fr,exp in ((0.7,(0.01358,0.10826)),(0.85,(0.01153,0.11536)),(1.0,(0.00990,0.11988))):
    print('row 0.80 junta', fr, junta(R+'profiles/band_row_0.80.json',fr)[:3], 'expect truth, Omhat', exp)
for t in ('0.70','0.74','0.78'):
    p=R+'profiles_low/band_row_%s.json'%t; d=json.load(open(p))
    print(t, 'keys', [k for k in d.keys() if k not in ('S','psi','GA','GB','G0','dpsi','dGA','dGB','dG0','allowance')])
    print('  cover', d['covering_row'], 'ustar', d['ustar'], 'ucap', d['ucap'], 't_lo', d['t_lo'], 'room', d['room'], 'band_min', d['band_minimum'], 'row', d['row'])
    for a in d['allowance']: print('   ', a)
    bm=d['band_minimum']
    for fr in (1.035,1.449,1.612):
        print('  junta ratio A at u/u*=%.3f: %.4f ; B: %.4f'%(fr, junta(p,fr)[2], junta(p,fr,'B')[2]))
