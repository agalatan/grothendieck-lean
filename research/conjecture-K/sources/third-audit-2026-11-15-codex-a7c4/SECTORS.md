<!-- New third-audit note. Agent-ID: codex-a7c4. Refs #400. -->
# Angular odd-sector costs and the retained one-coordinate optimum

Agent-ID: codex-a7c4. Refs #400. Baseline
`39ae5c2393372213b52db6dcbfd647605e6d7e8b`, after the review and merge of #399.
All statements newly proved below are **P, by author, not externally reviewed**.
The root audit worker independently re-derived §§2–5 within this session,
including the pure-P rotation identity; this is not external review. Exact
scalar enclosures and comparisons are **C**, in the explicitly limited scope of
[`sector_axis_costs.py`](../../code/third-audit-2026-11-15-codex-a7c4/sector_axis_costs.py).
No Lean build or global sector search was performed.

## 1. Findings and new completed results

No further false sector-assembly theorem was found in the corrected living
ledger during this bounded pass. The regularity qualifications, positive-
definite optimization hypothesis, fixed-epsilon consumer restriction, and
positive-part assembly budget added in the second audit remain valid.
The reviewer’s new entries 3.12–3.14 preserve the scopes of the proofs checked
in that audit. The historical overstatements already recorded in the ledger
are not reported here as new findings.

Three further results distinguish the odd sectors and raw/retained functionals:

| Result | Exact scope | Relation to the baseline |
|---|---|---|
| Raw P-only cost at least 41/100 throughout the application box | G=conjugate(Z)P, every remote L² variable P, all amplitudes and dimensions | Improves the common Q/P majorant of STATUS 5.4 (line 153). Unlike Q, P alone has a positive uniform cost throughout the box. This does not assert a combined Q/P bound with the improved P coefficient. |
| Sharp retained d-axis cost throughout the box is in (0.392424545003417,0.392424545003418) | G=dZ(T−2), every complex d, zero even core; coefficient multiplies the energy 2\|d\|² | Extends the sharp raw n=1 cost 0.151676… of STATUS 2.6 (line 108) to the retained dual. A rational cost 0.39242 is valid. |
| The existing corner cubic also raises the retained dual by more than 7e-6 | epsilon=ell=.76,b=.16, G=(i/100)Z(\|Y\|²−1), independent standard complex Z,Y | Strengthens the raw counterexample in STATUS 5.4a (line 154). Full-box odd nonincrease fails even for the first-chaos retained dual. Neither K nor K′ is refuted. |

The retained d-cost also improves the d coefficient in the **joint zero-core
odd-block** majorant (§3). It supplies no bound at a nonzero even core.
The global tilted-A remainder mentioned by the reviewer at
`reaudit-2026-11-15-codex-a7c4/REVIEW_claude-b9ee.md:84–87` belongs to #396 and
was not duplicated here.

## 2. A positive P-only cost on the entire application box

Let Z be standard complex Gaussian, T=|Z|²,

    L=Z(a+bT),  a=ell−2b>0,  b>0,  p=1/epsilon,
    J_n=integral_0^infinity t^(n−1/2)e^(−t)/(a+bt) dt,
    Lambda(G)=E(|L+G|+|L−G|)−p E|G|².

Let P be any square-integrable complex random variable independent of Z;
there is no mean or circularity condition. Then

    Lambda(conjugate(Z)P)
      <= Lambda(0)−[p−(13/20)J1] E|P|².              (P)

In particular, on epsilon in [.74,.76], ell in [.76,.90], b in [.12,.16],

    Lambda(conjugate(Z)P) <= Lambda(0)−(41/100) E|P|².

For a genuine cubic this is the P in H_{2,0} sector. It should not be confused
with a first-chaos projection, also sometimes denoted P in the manuscripts.

### Angular estimate

For r>=0 let C(r) be the circular mean of |1+r exp(i theta)| and set x=r².
The directional paired-norm majorant, followed by Jensen in theta, gives

    C(r) <= sqrt(1+x−x/[2(1+x)]).

Indeed the squared paired norm is at most
4(1+x)−4x cos²(theta)/(1+x), and E cos²(theta)=1/2.
Moreover

    sqrt(1+x−x/[2(1+x)]) <= 1+(13/40)x.

After squaring and multiplying by (1+x)/x, the difference has the positive
quadratic numerator

    169x²−391x+240,
    4*169*(169x²−391x+240)=(338x−391)²+9359.

The x=0 case follows directly. This proves a global estimate, not a Taylor
approximation or small-amplitude bound.

Condition on T and P and divide L±conjugate(Z)P by the phase of Z. The relative
phase of P is uniform, with frequency −2, so the conditional paired norm is
at most

    2sqrt(T)(a+bT)+(13/20)*sqrt(T)|P|²/(a+bT).

Integrating and using ||conjugate(Z)P||²=E|P|² proves (P).

### On this axis the retained functional equals the raw one

In fact Lambda_hat(conjugate(Z)P)=Lambda(conjugate(Z)P) at every amplitude,
for arbitrary remote L² P. To see this, write a first-chaos correction as
A=alpha Z+r, with r remote, and denote its retained objective before the
cubic penalty by J_G(A). Substitution Z→iZ sends L to iL and G to −iG.
Factoring i from the norms swaps the two terms and proves

    J_G(alpha Z+r)=J_G(−alpha Z+i r).

This transformation preserves ||A||². Its four iterates average to zero,
so convexity gives J_G(0)<=J_G(A) for every A. Thus the unique retained
minimizer is zero. This exact equality explains why keeping the first-chaos
penalty helps the d axis but does not improve the pure P functional itself.

### Uniformity in the profile

J1 decreases with ell and is convex in b on the box, since its denominator
is ell+b(t−2)>=11/25. Its maximum therefore occurs at ell=19/25 and one of
b=3/25,4/25. Also p is smallest at epsilon=19/25. The certified endpoint
costs are

    b=3/25: (0.462672994431484,0.462672994431485),
    b=4/25: (0.410973699623417,0.410973699623418).

Both exceed 41/100. No claim that 13/20 or the resulting P cost is sharp is
made. The second audit explicitly proved sharpness only on the Q and d axes;
applying that sharpness assertion to P would be incorrect.

## 3. Retaining the visible first-chaos correction improves the d cost

Let

    Lambda_hat(G)=inf_A {||A||²+E|L+G−A|+E|L−G+A|}−p||G||²,

where A ranges over the full holomorphic first chaos. In the convention above
define

    I=J3−4J2+4J1,
    K=J2−2J1,
    k1=p−J1,
    k3_hat=p−(1/2)[I−K²/(1+J1)].

For arbitrary remote L² variables Q,P with E Q=0, any complex d, and

    O=ZQ+conjugate(Z)P+dZ(T−2),
    v=E|Q|²+E|P|²,  h=2|d|²,

the following all-amplitude zero-core bound holds:

    Lambda_hat(O) <= Lambda(0)−k1 v−k3_hat h.        (R)

Choose the first-chaos trial A=alpha Z. The same paired-norm majorant used
in the old odd-sector proof gives

    Lambda_hat(O)
      <= Lambda(0)−p(v+2|d|²)
          +J1 v+I|d|²−2K Re(d conjugate(alpha))+(1+J1)|alpha|².

Angular integration removes the P cross terms; E Q=0 removes the Q/d and
Q/alpha terms. No independence between remote Q and P is required.
Minimize this explicit quadratic at alpha=dK/(1+J1) to obtain (R).

The extra coefficient is K²/[2(1+J1)] **per unit cubic energy**. Since
||dZ(T−2)||²=2\|d\|², its coefficient in front of |d|² is twice k3_hat.
For the normalized basis H(Z)=Z(T−2)/sqrt(2), the coefficient in front of
|nu|² for nu H(Z) is k3_hat itself.

At the named rows the exact enclosing intervals are:

| row | k3_hat | K/(1+J1), the coefficient of the optimal majorant trial |
|---|---|---|
| peak | (0.498769694397361,0.498769694397362) | (−0.392014614618995,−0.392014614618994) |
| flank | (0.525048300689048,0.525048300689049) | (−0.392549566041114,−0.392549566041113) |
| upper | (0.524317300839698,0.524317300839699) | (−0.388846578963306,−0.388846578963305) |

This trial is optimal for the quadratic majorant. It is not asserted to be
the exact retained minimizer at a finite nonzero d.

### Sharpness for the actual retained functional on the d axis

For G=i tau Z(T−2), remote first-chaos coefficients of A can be set to zero:
conditional Jensen in the independent remote variables decreases the two
norm terms, and dropping those coefficients also decreases ||A||². Write the
remaining A=alpha Z. The objective is convex and even in Re(alpha), with its
imaginary part fixed; thus its minimum has alpha=i y, y real. Apart from the
cubic penalty, the remaining objective is exactly

    y²+2E sqrt(T)*sqrt((a+bT)²+[tau(T−2)−y]²).

Its minimizer y_tau is O(tau). For example, strong convexity bounds its
distance from zero by half the absolute derivative at zero, which is at most
|tau| E[sqrt(T)|T−2|/(a+bT)]. This expectation is finite.
Put y=tau r. The quadratic expansion of the norm is uniform on bounded sets
of r: its divided remainder is dominated by
sqrt(T)(|T−2|+M)²/(a+bT), an integrable function for each M.
Therefore minimizing the expansion is justified and gives

    Lambda_hat(i tau Z(T−2))
      =Lambda(0)−2k3_hat tau²+o(tau²).

Thus no coefficient larger than k3_hat can hold in an all-amplitude quadratic
cost on this axis at the fixed profile. The first-chaos infimum has been
included in this sharpness argument, not frozen at a trial multiplier.

## 4. Sharp retained n=1 cost throughout the full box

Define

    F(ell,b,r)=r²+integral_0^infinity
        sqrt(t)(t−2−r)²e^(−t)/(ell+b(t−2)) dt,
    E_eff(ell,b)=inf_{r in R} F(ell,b,r)=I−K²/(1+J1).

The map (x,c) -> x²/c for c>0 is jointly convex. Consequently F is jointly
convex in (ell,b,r), and minimizing over r preserves convexity in (ell,b).
Explicitly, use the convex combination of two minimizing r values as a trial
at the convex combination of their profiles. Also F decreases in ell for
each r, so E_eff decreases in ell. The maximum of E_eff on the profile box
therefore occurs at ell=19/25 and b=3/25 or 4/25.

At epsilon=19/25 the corresponding k3_hat enclosures are

    b=3/25: (0.411864805505782,0.411864805505783),
    b=4/25: (0.392424545003417,0.392424545003418).

Together with p>=25/19, this proves that the exact best uniform retained cost
is k3_hat at (epsilon,ell,b)=(19/25,19/25,4/25). The sharpness result in §3 at
that corner shows that this is the best uniform coefficient, not just the
best coefficient of a convenient majorant.

In particular, throughout the box and in every ambient dimension,

    Lambda_hat(dZ(T−2)) <= Lambda(0)−0.39242*||dZ(T−2)||².

In total dimension one, H_{2,1} contains exactly this axis. Therefore the
retained optimum is still Lambda(0), uniquely at d=0. This does not improve
the optimum value already proved for the raw functional; it improves its
coercive quadratic cost.

## 5. The retained multiplier does not remove the Q-axis obstruction

Let V=|Y|²−1, with Y independent standard complex Gaussian, and G=i tau ZV.
At the first-chaos trial A=0, put

    k=(phase(L+G)−phase(L−G))/2
      =i exp(i theta)*tau V/sqrt((a+bT)²+tau²V²).

All remote first-chaos projections of k vanish by its Z-phase. Its visible
coefficient is

    E[conjugate(Z)k]
      =i tau E[sqrt(T)V/sqrt((a+bT)²+tau²V²)].

Since E V=0, subtracting the same expression with denominator a+bT leaves
it unchanged. The inequality 0<=1−1/sqrt(1+x)<=x/2 and Cauchy–Schwarz give

    ||P_{1,0}k||
      <= (|tau|³/2) E[sqrt(T)|V|³/(a+bT)³]
      < (3/2)|tau|³/a³,

because E|V|³<=sqrt(E V² E V⁴)=3 and E sqrt(T)<1.
The strong-convexity residual bound, re-derived in second-audit FOUNDATIONS
§3, implies

    Lambda_hat(G) >= Lambda(G)−||P_{1,0}k||²
                  >= Lambda(G)−(9/4)tau^6/a^6.       (Q)

Thus retaining the first-chaos multiplier changes this imaginary Q ray only
by O(tau^6). In particular the coefficient k1 is sharp on the Q axis for
the retained functional too: the upper bound in (R) and the previous raw
sharpness limit agree to second order. Unlike the d cost, it cannot be
improved by retaining this penalty.

At the application-box corner epsilon=ell=19/25,b=4/25,a=11/25 and tau=1/100,
the previously certified raw gain is greater than

    tau²*(381/5000)−(9/4)*tau^4/a³
      =3916263/532400000000.

The upper bound on the retained improvement is only

    (9/4)*tau^6/a^6=9/29025255424 <3.2e-10.

Consequently

    Lambda_hat(G)−Lambda_hat(0)
      >83397221223/11337990400000000 >7e-6.

Here Lambda_hat(0)=Lambda(0) follows directly from the triangle inequality
and the nonnegative correction norm. This refutes full-box odd nonincrease
for Lambda_hat as well as Lambda. It does not refute Lambda_hat<=S, nor the
stronger retained functional Lambda′, which is only bounded **above** by
Lambda_hat. In particular it is not a counterexample to K′.

## 6. Scope, reproducibility, and remaining obligations

The corrected STATUS 2.8–2.9, 7.2 and 7.4.1 were reread against their proofs.
The real and complex local matrix conventions in 7.3.1 and 11.22 agree: the
matrix off-diagonal m multiplies 2 Re<r_A,r_B>, while an energy coefficient
for d multiplies 2|d|². No new normalization error was found. The all-shift
Hessian theorem 7.3.2 remains local at remote bases and cannot be integrated
along a nonremote A/B path. Its stored compact certificates were not replayed.
No all-amplitude conclusion is drawn from the local matrices or the numerical
searches. The new P-axis bound must not be combined silently with an
independently optimized Q/d bound; only the joint bound (R) is proved here.

The conditional central consumer still needs an all-sector premise and
complementary response coverage with a fixed witness epsilon. None of the
new axis results discharges those obligations. The reviewer’s prospective
global tilted-A norm-remainder bound remains separate work under #396.

Reproduce from the repository root:

```sh
python3 -I research/conjecture-K/code/third-audit-2026-11-15-codex-a7c4/sector_axis_costs.py
```

The script is read-only unless `--write-result` is passed. It uses only the
standard library and imports the earlier exact-rational interval library by
an explicit repository-relative path. It recomputes J0,…,J3 rather than
reading stored numerical results, and records the imported file's SHA-256.
The new quadratic discriminant, endpoint comparisons, and retained-corner
residual budget use Fraction arithmetic; no floating-point value enters
acceptance. The saved output is
[`sector_axis_costs_result.json`](../../code/third-audit-2026-11-15-codex-a7c4/sector_axis_costs_result.json).
This is not a new independent special-function implementation, a Lean proof,
or an exhaustive audit of all archived calculations.
