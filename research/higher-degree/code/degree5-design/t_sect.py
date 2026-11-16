import sys, os, json, time; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import sectors as S
t0=time.time()
rec=dict(t=0.84, l=0.8402, beta=0.1591, bA=-0.1585, bB=-0.0965, sig=0.2381, nu5=0.0409)
o=S.analyse(rec, nU=24)
print(json.dumps(o, indent=1)); print('secs %.1f'%(time.time()-t0))
