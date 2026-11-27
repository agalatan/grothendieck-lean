"""Replay: re-verify every stored certificate with the current cert.py and recompute its exact bound.
usage: reverify.py k n node_json ...   (processes the files with index = k mod n)"""
import sys, os, json, time
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from fractions import Fraction as Fr
import cert as C

k, n = int(sys.argv[1]), int(sys.argv[2])
files = sorted(sys.argv[3:])[k::n]
bad = 0; tot = 0
for fn in files:
    res = json.load(open(fn))
    for c in res['certs']:
        if 'B_exact' not in c:
            print(f"{fn}: certificate without bound (failed interval)", flush=True); bad += 1; continue
        tot += 1
        t0 = time.time()
        ok, info = C.verify(c, stein=c['stein'], maxdepth=24)
        sa, sb = Fr(*c['sa_exact']), Fr(*c['sb_exact'])
        B = max(C.bound_exact(c, sa), C.bound_exact(c, sb))
        same = (B == Fr(*c['B_exact']))
        if not ok or not same:
            bad += 1
        print(f"{os.path.basename(fn)} s=[{float(sa)},{float(sb)}]: verify {ok} {info if not ok else ''} bound_match {same} ({time.time()-t0:.1f}s)", flush=True)
print(f"REPLAY {k}/{n}: {tot} certificates, {bad} problems", flush=True)
