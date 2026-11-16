# Verify a tail game (lam, nu) against a family with many seeds in parallel [N]: python vtail.py K 'lam' nu MODEL nseeds workers
import sys, json, numpy as np, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from concurrent.futures import ProcessPoolExecutor
from cp6 import task
if __name__ == '__main__':
    K = int(sys.argv[1]); lam = json.loads(sys.argv[2]); nu = float(sys.argv[3]); name = sys.argv[4]; n = int(sys.argv[5]); W = int(sys.argv[6])
    with ProcessPoolExecutor(W) as ex:
        res = list(ex.map(task, [(name, K, lam, nu, None, 50000 + s) for s in range(n)]))
    vals = sorted([r[1] for r in res], reverse=True)
    print(json.dumps(dict(K=K, lam=lam, nu=nu, model=name, best=vals[0], values=[round(v, 8) for v in vals])), flush=True)
