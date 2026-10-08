"""Propose a preprocessor eta = q^{-1}(Gamma t), truncated to J radial coefficients and
renormalized to exact coefficient norm 1 (exact rationals written as decimals).
Heuristic proposal only; verify_combined_N.py --eta certifies the result."""
import sys,json,argparse
from pathlib import Path
from fractions import Fraction as Q
import numpy as np
from flint import arb,acb,arb_poly,ctx,fmpq
ap=argparse.ArgumentParser();ap.add_argument('--source-dir',required=True,type=Path);ap.add_argument('--added-table',type=Path,action='append',default=[])
ap.add_argument('--modes',type=int,default=240);ap.add_argument('--terms',type=int,default=120);ap.add_argument('--output',type=Path,required=True);ap.add_argument('--digits',type=int,default=23)
args=ap.parse_args()
HERE=Path(__file__).resolve().parent
sys.argv=[sys.argv[0]];sys.path.insert(0,str(HERE))
import verify_combined_N as V
V.N=args.modes;N=V.N
upstream=args.source_dir.resolve()
sys.path.insert(0,str(upstream));sys.path.insert(0,str(upstream/'support_compression_certificate'))
import audit_sparse6_altgroups as source
V.source=source
ctx.dps=100
tables=[HERE/'added_origin_120_240.npz']+[t.resolve() for t in args.added_table]
L,R=V.load_origin(tables)
rows=list(source.RHO_ROWS);rows[2]=tuple(-x for x in rows[2])
columns=[V.scalar_column(row,N) for row in rows]
columns.append([(x*y.conjugate()).real for x,y in zip(L,R)])
q=[sum((V.aq(V.WEIGHTS[i])*columns[i][n] for i in range(6)),arb(0)) for n in range(N)]
qf=[float(x.mid()) for x in q]
# odd series Q(t) = sum q_n t^{2n+1}; compute inverse series coefficients in float via power series reversion
# Work with x = t^2: Q(t) = t * A(x), A(x)=sum q_n x^n. Inverse eta(s) = s*E(s^2) with Q(eta(s)) = Gamma*s.
# Solve by fixed point: E(x) = Gamma/A(x*E(x)^2)... use Newton on truncated power series via numpy polynomials.
J=args.terms
def compose_A(E):  # returns coefficients of A(x E(x)^2) truncated to J terms
    E2=np.convolve(E,E)[:J]
    xE2=np.concatenate([[0.0],E2])[:J]   # x*E^2
    out=np.zeros(J);pw=np.zeros(J);pw[0]=1.0
    for n in range(min(N,J)):
        out+=qf[n]*pw
        pw=np.convolve(pw,xE2)[:J]
        if not pw.any():break
    return out
def solve(Gamma):
    E=np.zeros(J);E[0]=Gamma/qf[0]
    for it in range(200):
        A=compose_A(E)            # we need E*A = Gamma (as series): E = Gamma/A
        # series division Gamma / A
        inv=np.zeros(J);inv[0]=1.0/A[0]
        for k in range(1,J):inv[k]=-sum(A[j]*inv[k-j] for j in range(1,k+1))/A[0]
        Enew=Gamma*inv
        if np.max(np.abs(Enew-E))<1e-18:E=Enew;break
        E=Enew
    return E
lo,hi=0.0,qf[0]
for _ in range(80):
    G=(lo+hi)/2;E=solve(G);s=np.sum(np.abs(E))
    if s<=1:lo=G
    else:hi=G
E=solve(lo)
print('Gamma',lo,'norm',np.sum(np.abs(E)),'direct q0-S',qf[0]-sum(abs(x) for x in qf[1:]))
# exact rational eta: round to `digits` decimals, then scale so that sum |e| = 1 exactly
den=10**args.digits
e=[Q(int(round(x*den)),den) for x in E]
tot=sum(abs(x) for x in e); e=[x/tot for x in e]
assert sum(abs(x) for x in e)==1 and e[0]>0
args.output.write_text(json.dumps([str(x) for x in e])+'\n')
print('wrote',args.output,'terms',len(e))
