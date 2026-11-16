import sys,os
sys.path.insert(0,os.path.dirname(os.path.abspath(__file__)))
import numpy as np, time
from game5 import Grid
from g5 import br
G=Grid(16,6,12,6,32)
init=[1,-0.25,-0.37,0.044,-0.056,-0.034,0.0]
t0=time.time()
for eps in [0.835,0.849,0.863]:
    for gam in [0.268,0.2816,0.295]:
        v,cg,cf,it=br(G,eps,gam,init,iters=500,tol=1e-11)
        print('eps=%.4f gam=%.4f v=%.8f 1/v=%.7f it=%d t=%.0fs'%(eps,gam,v,1/v,it,time.time()-t0),flush=True)
