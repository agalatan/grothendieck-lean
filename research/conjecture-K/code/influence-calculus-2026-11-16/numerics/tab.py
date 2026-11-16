"""Tabulate phi, j, g on a grid in s = sqrt(v) and save tab_peak.npz beside this file (label N). Single process."""
import sys, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np
from prof import phi, jprof, gprof
s=np.concatenate([np.linspace(0,1,801)[:-1],np.linspace(1,6,1001)[:-1],np.linspace(6,40,681)])
out=np.array([(phi(x*x),jprof(x*x),gprof(x*x)) for x in s])
np.savez(os.path.join(os.path.dirname(os.path.abspath(__file__)),"tab_peak.npz"),s=s,phi=out[:,0],j=out[:,1],g=out[:,2])
print("tabulated",len(s),"nodes")
