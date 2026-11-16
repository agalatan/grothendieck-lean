import sys; sys.path.insert(0,__import__('os').path.dirname(__import__('os').path.abspath(__file__)))
import numpy as np, json
row=sys.argv[1]
sys.argv=[sys.argv[0],row]
import importlib
L=importlib.import_module('lp_gap')
# finer grids near the maximiser (module already ran its coarse scan)
us=np.linspace(0.75*L.u0,1.35*L.u0,61); ms=[2.0,2.002,2.005,2.01,2.02,2.03,2.05,2.08]
best=(-9,None)
for m in ms:
    rb=(-9,None,None)
    for u in us:
        v,p=L.lp(u,m)
        if v is not None and v>rb[0]: rb=(v,u,p)
    print('  refined m=%.3f  best u=%.5f  gap=%+.4e'%(m,rb[1],rb[0]-L.S5))
    if rb[0]>best[0]: best=(rb[0],(m,rb[1],rb[2]))
v,(m,u,p)=best
at=[(float(L.X[i]),float(p[i])) for i in np.nonzero(p>1e-10)[0]]
print('REFINED max moment-LP gap %+.4e at m=%.3f u=%.5f atoms=%s'%(v-L.S5,m,u,[(round(x,4),round(q,7)) for x,q in at]))
json.dump(dict(gap=v-L.S5,m=m,u=u,atoms=at),open('lp_%s.json'%row,'w'))
