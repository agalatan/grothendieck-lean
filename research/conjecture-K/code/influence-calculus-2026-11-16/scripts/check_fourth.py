import sys, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np
from wickfloat import stats, symT
from fourth import delta, u_of, CLASSES
rng=np.random.default_rng(3)
print("pairing classes:",len(CLASSES),"total pairings:",sum(CLASSES.values()))
for n in [1,2,3]:
    for r in range(3):
        T=symT(rng.standard_normal(2*n**3),n); s=stats(T)
        print(n, s['u'], u_of(T), s['delta'], delta(T))
T=np.zeros((1,1,1),complex); T[0,0,0]=1/np.sqrt(2); print("monomial chi:",delta(T)/u_of(T)**2)
T=np.zeros((2,2,2),complex); T[0,0,1]=1/np.sqrt(2); print("X^2 Ybar chi:",delta(T)/u_of(T)**2)
