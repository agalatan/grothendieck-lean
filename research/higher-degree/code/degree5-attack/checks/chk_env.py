import sys; import os; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import d5, math
from fractions import Fraction as Fr
rows, st = d5.rows2b()
T = Fr(500,701); tmax = Fr(886227,10**6)
# pieces: parabolas t^2 - 2 l t + C (rows), small-t: (2/5)t^2 + b on [0,t1]
t1 = Fr(st['t1_final'])
# float scan then exact evaluation at breakpoints between consecutive active rows
import numpy as np
ts = np.linspace(float(t1), float(tmax), 400001)
vals = np.min([ts*ts - 2*float(r['l'])*ts + float(r['C']) for r in rows], axis=0)
arg = np.argmin([ts*ts - 2*float(r['l'])*ts + float(r['C']) for r in rows], axis=0)
i = int(np.argmax(vals)); print('max over [t1,tmax] of min_r: %.10f at t=%.5f; room %.4e'%(vals[i], ts[i], float(T)-vals[i]), 'active row', rows[arg[i]]['tag'])
print('small-t piece max at t1: %.7f room %.3e'%(0.4*float(t1)**2+7058083/1e7, float(T)-(0.4*float(t1)**2+7058083/1e7)))
# exact crossing of rows 0.845 and 0.850
ra = [r for r in rows if r['tag']=='0.845'][0]; rb=[r for r in rows if r['tag']=='0.850'][0]
tc = (rb['C']-ra['C'])/(2*(rb['l']-ra['l'])); v = tc*tc-2*ra['l']*tc+ra['C']
print('exact crossing 0.845/0.850: t=%.6f value %.10f room %.5e'%(float(tc), float(v), float(T-v)))
# active intervals and room per row
prev=None; start=ts[0]
for j in range(len(ts)):
    if arg[j]!=prev:
        if prev is not None:
            seg=(ts>=start)&(ts<ts[j]); print(rows[prev]['tag'], '[%.4f, %.4f] max %.7f room %.3e'%(start, ts[j], vals[seg].max(), float(T)-vals[seg].max()))
        prev=arg[j]; start=ts[j]
seg=(ts>=start); print(rows[prev]['tag'], '[%.4f, %.4f] max %.7f room %.3e'%(start, ts[-1], vals[seg].max(), float(T)-vals[seg].max()))
for r in rows: print(r['tag'], str(r['l']), str(r['beta']), str(r['bA']), str(r['bB']), '%.10f'%float(r['C']))
# 4.18(a)
e,eta=Fr(39,50),Fr(779,10000)
for rho in (Fr(2287,2500), Fr(4571,5000)):
    c = e*rho*rho; cst = float(c)+float(eta*eta/e)/math.pi
    print('4.18a rho',rho,'const %.6f'%cst,'reach t <= %.4f'%math.sqrt((float(T)-cst)/float(1-eta)))
