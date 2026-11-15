"""codex-a713: independent arithmetic for the conditional A+B budget.

No research-record code is imported. Ordinary double arithmetic only; the
formulas are derived in record_audit.md. This is not an interval certificate.
Run with python3 -I, redirecting stdout to budget_audit.log in this directory.
"""
from math import sqrt
from fractions import Fraction as Q

u, rho, e0, ka, kb = 0.0463, 0.5053, 0.007, 0.24, 0.26
e = e0 * sqrt(u)
dmax = 1.6 * u
for kappa in (0.24, 0.15, 0.10):
    for m in (0.118, 0.115, 0.11, 0.10, 0.05, 0, -0.118):
        schur = kb - m*m/ka
        h = abs(rho - m/ka)
        aa = kappa/ka - 1 + kappa*h*h/schur
        bb = 2*h*sqrt(kappa)*e/schur
        cc = e*e/schur
        endpoint = aa*dmax + bb*sqrt(dmax) + cc
        z = min(sqrt(dmax), -bb/(2*aa)) if aa < 0 else sqrt(dmax)
        maximum = max(cc, aa*z*z + bb*z + cc)
        print(f"kappa={kappa:.2f} m={m:+.3f} endpoint={endpoint:.12g} "
              f"sup={maximum:.12g} maximizer_D={z*z:.12g}")

for kappa in (0.10, 0.15):
    cb2 = 0.1195
    gain = (kb*kappa + ka*cb2 + 2*0.118*sqrt(kappa*cb2))/(ka*kb-0.118**2)
    print('separate-B-content', kappa, 'diagonal-gain/D', kappa/ka+cb2/kb,
          'adverse-mixed-gain/D', gain)
print('1/0.713267=', 1/0.713267)
print('500/701=', 500/701)
print('1/1.4022=', 1/1.4022)
uQ=Q(463,10000); e2=Q(7,1000)**2*uQ
kaQ=Q(6,25); kbQ=Q(13,50); mQ=Q(59,500); rhoQ=Q(5053,10000)
sQ=kbQ-mQ*mQ/kaQ; hQ=rhoQ+mQ/kaQ; LQ=1/kaQ+hQ*hQ/sQ
CQ=e2/sQ; etaQ=Q(1,10000)
kQ=(etaQ-CQ)/(etaQ*LQ-CQ/kaQ)
deltaQ=hQ*hQ*kQ*e2/(sQ*sQ*(1-kQ*LQ)**2)
assert 0<deltaQ<Q(8,5)*uQ
print('exact adverse assumed-matrix threshold=', kQ, float(kQ),
      'maximizing Delta=', float(deltaQ))
