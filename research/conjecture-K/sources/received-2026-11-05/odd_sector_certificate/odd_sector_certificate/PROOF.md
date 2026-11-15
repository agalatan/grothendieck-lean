<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/odd_sector_certificate/odd_sector_certificate/PROOF.md (file dated 2026-11-05). Only this line was added. -->
# Odd-sector baseline certificate and the exact nonzero-core target

This certificate does not settle the nonzero-core problem or Conjecture K.
It certifies an existing zero-core mechanism simultaneously for all odd sectors,
with arbitrary shared remote coordinates and no amplitude bound.

Let a=l-2b, p=1/eps, L=z(a+b|z|^2), and
O=zQ+conj(z)P+d z(T-2), with the sector assumptions in the problem.
Put v=E|Q|^2+E|P|^2 and h=2|d|^2. Then

    Lambda(O) <= Lambda(0) - k1 v - k3 h.

Certified constants (k1,k3): peak (0.128,0.330), flank (0.156,0.356),
upper (0.166,0.361). Note the normalization h=2|d|^2.
Thus the peak penalty in terms of |d|^2 is 0.660|d|^2.

Proof: the parallelogram identity and concavity of sqrt give

    |L+O|+|L-O| <= 2 sqrt(|L|^2+|O|^2)
                       <= 2|L|+|O|^2/|L|.

Since 1/|L| depends only on T, angular integration removes the Q/P and d/P
cross terms. E Q=0 removes the Q/d cross term. Therefore

    E[|O|^2/|L|] = v I1 + |d|^2 I3,
    I1 = integral_0^infinity sqrt(t) exp(-t)/(a+bt) dt,
    I3 = integral_0^infinity sqrt(t)(t-2)^2 exp(-t)/(a+bt) dt.

The costs are p-I1 and p-I3/2. The checker substitutes t=s^2 and uses
Arb's rigorous analytic integration on [0,10]. Beyond 10 both integrands
are bounded by (2/a)s^6 exp(-s^2). Integration by parts gives the tail bound

    (2/a) exp(-R^2)[R^5/2+5R^3/4+15R/8+15/(16R)], R=10.

It is less than 10^-36 at all three rows. The checker adds this as a ball
error and proves the strict cost comparisons. Dependency: python-flint.
Replay: python verify.py.

## Parity and the correct nonzero-core estimate

For every even-in-z field H and odd-in-z field O,

    Lambda(H+O)=Lambda(H-O).

Indeed z -> -z flips L and O and fixes H, interchanging the two norm terms;
the energy cross term vanishes by parity. Thus the first variation in O
vanishes. All mixed even/odd Hessian entries at an even base vanish whenever
the derivatives exist. This does not imply finite-amplitude monotonicity.

For an even H, the elementary norm majorant applied separately to L+H and
L-H yields the exact sufficient estimate

    Lambda(H+O)-Lambda(H)
      <= E[|O|^2/|L+H|] - p E|O|^2.                 (*)

The two first-order terms cancel in expectation. The two inverse-norm
quadratic terms are equal by z -> -z. Interpret the right side as extended
valued if the inverse-norm integral is infinite; no integrability is assumed
without proof.

Consequently, proving E[|O|^2/|L+H|] <= (p-k)E|O|^2 for the admissible
H=q+A+B would establish an all-amplitude odd-sector cost k. This is sufficient,
not necessary: the elementary norm majorant can lose angular curvature.
For H nonzero, its denominator depends on remote coordinates, so the cross
terms removed in the zero-core proof cannot simply be discarded.

No nonzero-core inequality, signed A/B inequality, or content comparison is
certified by this package. The analytic parity identities and reduction (*)
are proved here; only the scalar integrals are machine checked.
