import sys, os, time; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np, d5eng as D
t0=time.time()
g=D.zgrid(half=True); print('grid pts',g[0].size)
# peak row of the K5 work, with the K5 game constants, to validate against 0.7124302 (d5row, e1=0.848926, eta=0.281576)
D.E1,D.ETA=0.848926,0.281576
rw=D.Row(0.84,0.8402,0.1591,-0.1585,-0.0965,e1=0.848926,eta=0.281576,grid=g)
t1=time.time(); inn=D.Inner(rw); print('psi grid %.1fs'%(time.time()-t1))
print('lam at (0.2395,0.0408): %.8f (repo 1.3587334; d5row 1.35873119)'%inn.lam(0.2395,0.0408))
v,s,n=inn.sup(); print('sup %.8f at sig %.4f nu5 %.4f ; row %.8f (d5row: S5=1.35873125, row 0.7124302)'%(v,s,n,v+rw.const()))
print('total %.1fs'%(time.time()-t0))
