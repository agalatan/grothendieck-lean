<!-- New second-audit note. Agent-ID: codex-a7c4. Historical sources unchanged. -->
# Sharp odd-sector costs and a second audit of sector assembly

Agent-ID: codex-a7c4. Refs #398. Baseline: `b0ec41d69` (after PR #397;
the subsequent master merge `8ab5b606e` has the same tree).
New proofs below are **P, by their author, with same-session peer review; not externally reviewed**; their rational scalar
premises are **C**, with precisely the scope checked by
[`sectors_exact.py`](../../code/reaudit-2026-11-15-codex-a7c4/sectors_exact.py).
This is a new audit of the integrated monograph, not a change to the historical
source files. No result below proves Conjecture K or changes a Grothendieck bound.

## 1. Findings at the baseline

| Baseline location | Finding | Consequence and correction |
|---|---|---|
| MONOGRAPH lines 318–330, especially 329 | The section defaults to the entire application box, but the displayed positive odd-sector costs apply at the peak. At the box corner, an explicit genuine odd cubic has Lambda greater than Lambda(0) by more than 7e-6 (§3). | State the peak-row restriction. The failure over the full box is mathematical, not merely failure of the old majorant. |
| MONOGRAPH line 726; first-audit ODD_COST lines 49–52 | The historical flank d-cost 0.36 was previously identified only as too large for the certificate. It is actually false: a genuine one-coordinate cubic violates it by more than 5e-7 (§4). | Retain the valid 0.356 row cost. The old audit's cautious statement is strengthened by a new result, not silently rewritten. |
| STATUS 2.6; first-audit ODD_COST §2 | The full-box n=1 theorem with cost 3/20 is correct. Its proof plus sharpness identifies the exact best uniform cost, in (0.151676198434561,0.151676198434562) (§5). | Optional improvement: use 0.15167 or state the sharp constant explicitly. |
| STATUS 2.8, line 104 | The frequency/orthogonality rule holds for every G. The appended first-order claim has a different scope: a fixed even base, with existence of the derivative, and only visible-sector perturbations. | Split the algebraic frequency statement from its variational corollary (§6). |
| STATUS 2.9, line 105; 7.2.1, line 230; MONOGRAPH lines 714–716 | Parity alone does not imply differentiability at every even L2 base. There is an explicit cusp even along a genuine odd cubic direction (§6). | State that derivatives vanish when they exist; for genuine even cubic bases the first derivative exists and vanishes. Do not assert arbitrary-base Hessian existence. |
| STATUS 7.4.1, line 259 | The Schur-complement optimization omits positive definiteness of the cost matrix, correctly present in its cited source. | Add k_A>0 and k_B−m²/k_A>0. The formula is the unrestricted supremum, hence an upper bound when amplitude caps are imposed (§7). |
| STATUS 11.23, line 499 | Claude's max(D,0) variant is correct for eta_R>=0. Its adjacent division by kappa requires kappa>0. | Make these minor hypotheses explicit (§7). |

The new counterexamples are to particular cost claims, **not to K**: its
benchmark S includes Gaussian optimization and can be strictly above Lambda(0).

## 2. The odd-sector majorant is sharp on two axes

Use the conventions of the first-audit ODD_COST note:

    T=|Z|²,  L=Z(a+bT),  a=ell−2b>0,  b>0,  p=1/epsilon,
    Lambda(G)=E(|L+G|+|L−G|)−p E|G|²,
    J_n=integral_0^infinity t^(n−1/2)e^(−t)/(a+bt) dt,
    k1=p−J1,   k3=p−(J3−4J2+4J1)/2.

The already proved all-amplitude bound is

    Lambda(ZQ+conjugate(Z)P+dZ(T−2))
      <= Lambda(0)−k1(E|Q|²+E|P|²)−k3*2|d|²,

for remote square-integrable Q,P, E Q=0, without an independence condition
between Q and P. Its conditional second-moment computation is valid: distinct
Z-frequencies remove all P cross terms and E Q=0 removes the Q,d cross term.

Let V be real, remote, square integrable, and centered, and put O_tau=i tau ZV.
The perturbation is perpendicular to L pointwise, so

    Lambda(O_tau)−Lambda(0)
      =2E[sqrt(T)(a+bT)(sqrt(1+tau²V²/(a+bT)²)−1)]
       −p tau² E V².

Since 0<=2(sqrt(1+x)−1)<=x for x>=0, dominated convergence gives

    lim_{tau→0} [Lambda(0)−Lambda(O_tau)]/||O_tau||² = k1.

For the genuine cubic choice V=|Y|²−1 with independent standard complex Y,
E V²=1. Thus no larger universal quadratic coefficient on the Q axis is valid.
This proves sharpness of the combined Q/P coefficient; it does not separately
assert sharpness on the P-only axis.

Likewise O_tau=i tau Z(T−2) is a genuine one-coordinate Wick cubic, with
||O_tau||²=2tau². The same argument, dominated by
sqrt(T)(T−2)²/(a+bT), proves

    lim_{tau→0} [Lambda(0)−Lambda(O_tau)]/||O_tau||² = k3.

Consequently k3 is the optimal all-amplitude quadratic cost for this axis at
each fixed profile. The phase i is essential to attain these second-order
coefficients; a calculation only on real d would miss sharpness.

## 3. A genuine odd cubic raises Lambda at one box corner

Take epsilon=ell=19/25, b=4/25, so a=11/25, and

    O=(i/100) Z(|Y|²−1).

The exact scalar checker encloses

    −0.076234794101626 < k1 < −0.076234794101625.

To give a finite-amplitude certificate, not only an asymptotic argument, use

    sqrt(1+x) >= 1+x/2−x²/8   (x>=0).

This follows from the nonnegative third derivative of sqrt(1+x). For
V=|Y|²−1, E V²=1 and E V⁴=9. As E sqrt(T)=sqrt(pi)/2<1,

    Lambda(i tau ZV)−Lambda(0)
      > tau²*(381/5000)−(9/4)*tau⁴/a³.

Here J1−p>381/5000 is certified independently in the new checker. With tau=1/100
the displayed lower bound is exactly

    3916263/532400000000 > 7/1000000.

Therefore no positive zero-core odd-sector cost, or even nonincrease, holds
throughout the full application box. This does not contradict Theorem A's
same-norm Gaussian domination, which uses a different comparator.

## 4. The flank cost 0.36 is false for the actual functional

At the flank profile

    epsilon=149/200, ell=4267/5000, b=1467/10000, a=14/25,

the exact enclosure is

    0.356624248973760 < k3 < 0.356624248973761 < 2853/8000.

Set O=(i/100)Z(T−2). The same square-root bound applies, now with

    E[sqrt(T)(T−2)^4]=(193/32)sqrt(pi)<193/16.

It gives, for tau=1/100,

    Lambda(i tau Z(T−2))−Lambda(0)+(9/25)*||i tau Z(T−2)||²
      > 2tau²*(9/25−2853/8000)−(193/64)*tau⁴/a³
       =1767691/3512320000000 > 5/10000000.

Thus the rounding to 0.36 cannot be repaired by a sharper proof of the same
statement. The ledger's existing 0.356 is a valid downward rounding.

## 5. The sharp uniform n=1 cost throughout the application box

Write

    I(ell,b)=integral_0^infinity sqrt(t)(t−2)²e^(−t)/(ell+b(t−2)) dt.

On the application box this is decreasing in ell and convex in b, since all
denominators are at least 11/25 and the weight is nonnegative. Thus I is largest
at ell=19/25 and an endpoint b=3/25 or 4/25. Also p is smallest at epsilon=19/25.
The exact endpoint enclosures for p−I/2 are, respectively,

    (0.225985672933425,0.225985672933426),
    (0.151676198434561,0.151676198434562).

Therefore, defining k_* as k3 at epsilon=ell=19/25,b=4/25,

    Lambda(dZ(T−2)) <= Lambda(0)−k_*||dZ(T−2)||²

holds for every complex d throughout the box, in every ambient dimension.
The sharpness limit in §2 at this corner proves that no larger uniform
coefficient works. In particular 15167/100000 is a convenient certified
rational improvement on 3/20. The earlier full-box optimum and uniqueness
theorem is confirmed; it follows because k_*>0 and H_{2,1}(C) has only this axis.

## 6. Frequency, parity, and regularity have different scopes

Factoring the phase e^(i theta) of Z gives q,A frequencies −1, B frequency +1,
ZQ and dZ(T−2) frequency 0, and conjugate(Z)P frequency −2. Integration in theta
eliminates mixed squared-norm terms between distinct frequencies. This exact
algebra holds for arbitrary sector coefficients; it is independently re-derived
here and can be labelled **P**.

If H is even and O odd under Z→−Z, substitution proves
Lambda(H+tau O)=Lambda(H−tau O). It proves a zero first derivative **if the
derivative exists**, and zero mixed even/odd Hessian entries **if that Hessian
exists**. At a remote or other even base, only A and B among the visible sectors
can have nonzero first variation under these regularity hypotheses. A variation
of the remote core itself is not included in this assertion.

There are two useful exact scope tests.

* An arbitrary cubic base need not be even. With O=Z(T−2),
  0<c<min(a/2,b) gives |L+cO|+|L−cO|=2|L| pointwise and
  Lambda(cO)=Lambda(0)−2pc². Its derivative along the odd direction O is
  −4pc, which is nonzero. Thus the phrase “every G” cannot cover this derivative
  claim even if all polynomials are genuine cubics.
* An even L² base need not be a regular point. Let
  H=L sign(Re Z), which is even, and use the genuine odd cubic O=Z(T−2).
  For |tau|<min(a,2b), the quantities 2(a+bT)±tau(T−2) are positive. Pairing
  the two half-circles gives exactly

      Lambda(H+tau O)−Lambda(H)
        =|tau| E[sqrt(T)|T−2|]−2p tau².

  The penalty cross term vanishes by parity. The positive cusp precludes a
  derivative at zero. H is not a cubic, so this is specifically a refutation
  of the arbitrary-even-L² interpretation, not of the cubic-base statement.

For a genuine even polynomial cubic H, L±H are nonzero polynomials: L is
nonzero and odd, so it cannot equal either even H identically. Their zero sets
have Gaussian measure zero. The pointwise first norm derivatives therefore
exist almost surely, and their difference quotients are bounded by |O|.
Dominated convergence proves first differentiability in every integrable cubic
direction O; parity makes it zero. A second derivative needs additional
integrability and is not supplied by this argument.

## 7. Retained matrix and assembly: confirmed results and small qualifications

The local complex matrix in first-audit SECTORS §3 survives the second audit.
For H=(T−1)r_A+Z²conjugate(r_B)/sqrt(2), the transverse perturbation for a remote
first-chaos correction u is

    Im(e^(−i theta)[(T−1)r_A−T r_B/sqrt(2)−u]).

The minus sign on r_B follows from conjugation, and phase averaging is one half
the squared modulus. Completing the correction square gives the retained cost

    k_A||r_A||²+k_B||r_B||²+2m0 Re E[conjugate(r_A)r_B]
      +||g0 r_A+d0 r_B||²/(1+j0).

Complex relative phases and correlated drivers are covered. The correction minimizer
is (g0 r_A+d0 r_B)/(1+j0); the visible correction vanishes by remote parity and
convexity. This confirms the first-audit local result. It gives no global
finite-amplitude cost and no change in the numerical status of the searches.

The Schur-complement gain formula in STATUS 7.4.1 requires k_A>0 and
k_B−m²/k_A>0. For example k_A=k_B=1,m=2,c=d=0 gives the displayed algebraic
formula zero, but the unrestricted gain is unbounded above on r_A=−r_B.
The cited ASSEMBLY_AUDIT §1 already includes the missing hypotheses. With them,
completing squares proves the formula; caps only reduce the supremum.

For the new positive-part assembly variant let A(u)<=S,
D(q)=A(u)−Lambda(q), and Lambda(q)<=S+eta_R, eta_R>=0. If

    gain(q)<=kappa max(D(q),0)+eta_A,   0<=kappa<=1,

then for D>=0 the convex-combination argument gives S+(1−kappa)eta_R+eta_A,
and for D<0 the direct remote cap gives S+eta_R+eta_A. Thus the latter is a
valid uniform conclusion. No nonnegativity of D is assumed. The fixed-tilt
gain defined as a supremum over r is nonnegative because r=0 is admissible;
a gain evaluated at an arbitrary particular r need not be. If the signed
hypothesis gain<=kappa D+eta_A is used, nonnegative gain implies
D>=−eta_A/kappa only when kappa>0; at kappa=0 it imposes no condition on D.

## 8. Reproducibility and bounded coverage

Run from the repository root:

```sh
python3 -I research/conjecture-K/code/reaudit-2026-11-15-codex-a7c4/sectors_exact.py
```

The saved output is
[`sectors_exact_result.json`](../../code/reaudit-2026-11-15-codex-a7c4/sectors_exact_result.json).
The new script independently computes the moment identities and all finite-
amplitude acceptance inequalities with Fraction arithmetic. It imports the
already audited exact-rational scalar interval library from the first audit by
an explicit repository-relative file path, recomputes its J integrals, and
records that library's SHA-256. It does not trust the old saved results and
does not claim an independent implementation of the special-function library.
Python standard library only; assertions must be enabled, enforced by a guard.
No floating-point value enters acceptance. The proof above, not the script,
supplies the implication from those scalar premises to arbitrary amplitudes.

Coverage in this second pass: MONOGRAPH 3.1,3.2,3.5–4; STATUS 5,7,9–12;
the prior ODD_COST full-box theorem, SECTORS tilted formulas and complex matrix,
ASSEMBLY_AUDIT scope, Claude's review and max(D,0) addition, and the diffuse
asymptotic hypotheses. No new defect was found in the full-box n=1 proof,
retained conjugations, or the positive-part budget. The diffuse expansion is
for a fixed cubic and positive Gaussian buffer; its CLT claims retain their
independent-block hypotheses, not arbitrary dimension-uniform scope.

The first-audit monomial quadrature, tensor searches, and compact Hessian grids
were not rerun and remain **N**. No all-amplitude joint/tilted/odd-at-nonzero-
cubic-core theorem is established. This is a bounded mathematical review,
not a claim to have re-proved every reported theorem in the monograph.
