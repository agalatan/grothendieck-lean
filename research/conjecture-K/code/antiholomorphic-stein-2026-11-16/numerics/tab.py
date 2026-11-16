"""Tabulate phi, j, g on a grid in s = sqrt(v) and save tab_peak.npz (label N)."""
import numpy as np, sys
from prof import *
from multiprocessing import Pool
# grid in s = sqrt(v): dense near 0
s=np.concatenate([np.linspace(0,1,801)[:-1],np.linspace(1,6,1001)[:-1],np.linspace(6,40,681)])
def row(si):
    v=si*si
    return (phi(v),jprof(v),gprof(v))
if __name__=="__main__":
    with Pool(2) as p: out=p.map(row,s)
    out=np.array(out)
    np.savez("tab_peak.npz",s=s,phi=out[:,0],j=out[:,1],g=out[:,2])
    print('tabulated',len(s),'nodes')
