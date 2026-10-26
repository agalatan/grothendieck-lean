"""Row pickle for the Stein re-solve / build_cert from a newcaps4 table: base = the cert-0745d pickle (header fields), nodes/caps replaced;
the exact node strings go into pk['nodes_exact'] (read by the patched sexact2.load / build_cert.py: no 1e-4 rounding).
usage: mkpkl_e.py base.pkl table.json out.pkl"""
import sys, json, pickle, numpy as np
from fractions import Fraction as F
pk = pickle.load(open(sys.argv[1], 'rb')); T = json.load(open(sys.argv[2]))
pk['nodes_exact'] = list(T['nodes']); pk['nodes'] = np.array([float(F(x)) for x in T['nodes']]); pk['caps_exact'] = list(T['caps'])
pk['caps'] = np.array([float(F(x)) for x in T['caps']]); assert pk.get('certified'); pickle.dump(pk, open(sys.argv[3], 'wb'))
print(sys.argv[3], len(T['nodes']), 'nodes')
