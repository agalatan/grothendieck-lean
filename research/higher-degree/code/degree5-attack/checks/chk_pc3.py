import sys; import os; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import d5, numpy as np, json, math
from scipy.integrate import quad
R='/Users/alingalatan/workspaces/grothe/research/higher-degree/code/degree5-content/'
rows=[json.loads(l) for l in open(R+'rows5.lines') if l.strip()]
r79=json.load(open(R+'profiles_low/band_row_0.70.json'))['row']
z,w=d5.zgrid(npan=80,nth=256); p1=1/d5.E1
for rec in [r79]+[r for r in rows if r['t'] in (0.81,0.85)]:
    l,b,nu=rec['l'],rec['beta'],rec['nu5']; g=lambda t:l+b*(t-2)+nu*(t*t-6*t+6)/math.sqrt(12)
    Z=d5.E1*quad(lambda t:math.sqrt(t)*math.exp(-t)/abs(g(t)),0,60,limit=200)[0]
    B=d5.base(z,l,b,nu); Dz=d5.Dz(z,rec['bA'],rec['bB']); F=np.array([z,np.conj(z)]); out=[]
    for s in (0,0.1,0.2,0.4,0.8,1.5,3):
        N=np.zeros((2,2),complex)
        for A in (B+s*Dz,B-s*Dz): N+=(F*(w/(2*np.abs(A)))[None,:])@np.conj(F).T
        out.append(np.linalg.eigvalsh((N+N.conj().T)/2)[-1]/p1)
    print('row %.2f: Z=%.4f; elementary majorant of the odd pair, lam_max/p1 at s=0,.1,.2,.4,.8,1.5,3:'%(rec['t'],Z),' '.join('%.4f'%x for x in out))
