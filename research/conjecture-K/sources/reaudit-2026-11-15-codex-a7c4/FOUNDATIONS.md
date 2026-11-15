<!-- New re-audit note, authored at this path on 2026-11-15. Agent-ID: codex-a7c4. -->
# Foundations, response domains and a conditional central consumer

Agent-ID: codex-a7c4. Refs #398. Baseline `b0ec41d69`; all source line locations below
refer to that tree (the merge commit `8ab5b606e` has identical audited content).
This is the second audit, after Claude's changes to
PR #397. Existing source files and the historical monograph are not edited.

Conjecture K remains open. The results below do not improve a Grothendieck
bound. **P** means a paper argument re-derived here; new corollaries are by
the author and not externally reviewed. **C** means the stated exact scalar
check, with its analytic inputs specified. No Lean build was performed.

## 1. New finding and corrections

| Location | Finding | Severity and correction |
|---|---|---|
| README lines 65–67; historical MONOGRAPH lines 292–296 | The response-domain summary gives total energy at most 0.072 without the threshold that makes it valid. The source gives 0.071981 only for **t≥0.8456**, at the peak epsilon. On the whole central interval starting at 0.84 its certified cap is **0.081884**. | Medium: an omitted response region could be lost from a consumer. State the thresholds and fixed epsilon explicitly. The genuine response in §2 disproves an unrestricted reading; it does not refute the valid regional theorem or K. |
| STATUS 2.10 and 2.10a, lines 106–107 at this baseline | The inequality Λ′≤Λ_P is still R although its elementary weak-duality proof is available in `ch20-pinned-gate.tex`, lines 110–117. | Audit improvement, not a false theorem: the argument is independently re-derived in §3, so this individual implication and the row with Λ′ can be P. This does not upgrade all of K′ or all response restrictions. |
| MONOGRAPH §6, lines 770–773 | The parenthetical description of arXiv:1407.6216 mentions EX⁴≥3 without its other input hypotheses. | Low: specify centered, variance one and **zero third moment**, and normalized fixed-degree homogeneous sums. The paper is background for a CLT, not a finite-error or signed-deficit theorem for K. |

The exact older source for the first correction is
`sources/manuscript/legacy/ch25-parts/30-response-feasibility.tex`,
lines 976–1039; its table lists all three thresholds. The chronological log
also preserves the omitted condition at line 395. The 13 November assembly
audit cautioned against importing response restrictions into raw K, but did
not identify the missing threshold in the current summary. This finding
adds the distinction **between different response regions**, even after
one has correctly restricted to actual responses.

Suggested replacement for the README sentence:

> At epsilon=1891/2500, actual responses with t≥0.84 have remote energy
> below 0.046266 and total energy below 0.081884. The stronger total cap
> 0.071981 needs t≥1057/1250. These are necessary regional constraints;
> omitted response regions still require coverage.

## 2. Re-derived all-sector response constraints (P + scalar C)

Let Z be visible, X the remote variables, P=P₁,₀, Q=P₂,₁,
Ph=tZ, F=epsilon Qk, h=(f+g)/2, k=(f−g)/2, |f|,|g|≤1,
and R=E|Z|=sqrt(pi)/2. These hypotheses also include unimodular responses.
For every cubic test U, support duality and the norm majorant give

    t + epsilon⁻¹ Re<U,F>
      ≤ (1/2)E(|Z+U|+|Z−U|)
      ≤ R + (1/2)E[|U|²/|Z|].                         (1)

Write the orthonormal visible-sector decomposition

    F=q+(T−1)r_A+Z² conj(r_B)/sqrt(2)+ZY+conj(Z)W+nu H(Z),
    H(Z)=Z(T−2)/sqrt(2),   T=|Z|².

The quadratic form E[|U|²/|Z|], divided by R, has diagonal weights

    (2, 3/2, 3/4, 1, 1, 7/8).

Angular orthogonality removes the cross-frequency terms. Remote q is
orthogonal to remote linear forms, and EY=0 removes the remaining
same-frequency cross terms. No independence among the remote coefficient
fields is required. The weights are Gamma integrals; for example the A
weight is E[(T−1)²/sqrt(T)]/R=3/2, and the normalized diagonal weight is
E[sqrt(T)(T−2)²/2]/R=7/8. Maximizing the six independent quadratic
expressions in (1) proves

    ||q||²/4 + ||r_A||²/3 + 2||r_B||²/3
      + (||Y||²+||W||²)/2 + 4|nu|²/7
      ≤ R epsilon²(R−t).                              (2)

The remote Rice support inequality is

    t + lambda epsilon⁻¹ e ≤ E rho(lambda²|q|²),
    e=||q||²,  rho(u)=E|Z+sqrt(u)|,  lambda≥0.

Concavity of rho and its tangent at u=1/10 give the global majorant

    rho(u) ≤ A+B u,
    A=886762780/10⁹,  B=432306903/10⁹.

For completeness, with x=u/2 the exact formulas used to enclose that
tangent are

    rho(u)=R exp(−x)[(1+u)I₀(x)+u I₁(x)],
    rho′(u)=(R/2)exp(−x)[I₀(x)+I₁(x)],
    rho(u)−u rho′(u)=R exp(−x)[(1+x)I₀(x)+x I₁(x)].

They follow by angular Gaussian integration (expand its exponential into
the absolutely convergent I₀ series) and differentiation. Concavity also
follows from the positive integral formula
rho′(u)=(1/(2sqrt(pi))) integral₀¹ exp(−us)sqrt((1−s)/s) ds.
The new checker recomputes the tangent enclosures using rational series:
Machin's identity for pi, an alternating exponential series, and positive
Bessel series with geometric tail majorants. It does not read stored
kernel values or assume the old decimal tangent check passed.

Optimizing lambda yields e≤4epsilon²B(A−t). Since all nonremote weights
in (2) are at least 1/3, it follows that

    ||F||² ≤ 3R epsilon²(R−t)+e/4
           ≤ epsilon²[3R(R−t)+B(A−t)].                 (3)

Fresh exact scalar checking at epsilon=1891/2500 gives:

| t lower bound | strict remote-energy cap | strict total-energy cap |
|---|---:|---:|
| 0.84 | 0.046266 | 0.081884 |
| 0.8456 | 0.040726 | 0.071981 |
| 0.851 | 0.035383 | 0.062431 |

This is a replay/re-derivation of an existing result, not a new energy bound.
It verifies only this moment-free part of STATUS 2.12, not all 25 response
constraints grouped in that entry.

An explicit counterexample to unrestricted energy caps uses one remote
coordinate X. Put V=X(|X|²−2), k=phase(V), f=k, g=−k. Then h=0, t=0;
these are actual unimodular responses, not an arbitrary L² surrogate.
With I=E[sqrt(T)|T−2|], projection onto the unique one-coordinate cubic gives

    F=epsilon (I/2)V,   ||F||²=||q||²=epsilon² I²/2.

Since

    I=sqrt(pi)/4+2 integral₂^∞ sqrt(t)(t−2)exp(−t) dt
      > sqrt(pi)/4+4exp(−3) > 17/40+4/27=619/1080,

using sqrt(pi)>17/10 and e<3, the peak energy is strictly larger than

    1370138139841/14580000000000 > 0.0939738 > 0.072.

The failure is entirely outside the stated central t regions. It shows why
the t hypothesis cannot be suppressed; it says nothing adverse about K.

## 3. Raw row and retained dual, independently re-derived (P)

For epsilon>0, B=beta Z(T−2), L=ell Z+B, G=epsilon Qk,
orthogonality and square completion give the exact identity

    Re<f,(P−epsilon Q)g>
      = t²−2ell t+||B||²/epsilon
        + Re E[conj(L+G)f+conj(L−G)g]−||G||²/epsilon
        −||Pk||²−epsilon||Qh+B/epsilon||².             (4)

Here ||B||²=2beta². Taking the two pointwise support moduli gives the raw
row; retaining −||Pk||² and imposing epsilon Qk=G gives the row with the
constrained functional Λ′. Thus the latter row does not need a minimax
interchange or existence of a maximizing response.

For every a in the first chaos,

    −||Pk||² ≤ ||a||²−2Re<a,k>,

with exact slack ||a−Pk||². Substituting in (4) changes the support
coefficients to L+G−a and L−G+a. Supremizing over the admissible responses,
and then taking the infimum over a, proves

    Λ′(G) ≤ Λhat(G)=inf_a J_G(a)−p||G||² ≤ Λ(G),
    J_G(a)=||a||²+E|L+G−a|+E|L−G+a|.                 (5)

This verifies the old implication marked R in STATUS 2.10a. The stronger
equality with the *unconstrained* disk-valued support problem is already in
the November projection package; (5) needs only weak duality. No equality
between constrained Λ′ and Λhat is claimed.

Useful elementary corollaries, stated here by the author:

1. J_G is 2-strongly convex, continuous and coercive in finite dimension,
   hence has a unique minimizer a*. Existence/uniqueness was already stated
   in `projection-attack-package/proofs.tex`, lines 51–54; it is not new.
2. **The minimizer obeys ||a*||≤R=sqrt(pi)/2**, in every dimension and for
   all L,G in L². For a first-chaos increment b, E|b|=R||b||, so the norm
   part of J_G is 2R-Lipschitz in the first-chaos norm. Along any unit ray,
   decreasing radius r>R lowers J_G, since the quadratic decreases faster
   than the Lipschitz term can increase.
3. **An a posteriori global inner-minimization bound** is available. At a
   trial a choose measurable disk-valued phases f_a,g_a of L+G−a,L−G+a
   (ordinary phases off zero), set k_a=(f_a−g_a)/2 and r=a−Pk_a. Then

       J_G(a)−||r||² ≤ min_b J_G(b) ≤ J_G(a),
       ||a−a*|| ≤ ||r||.                              (6)

   Indeed 2r is a subgradient and strong convexity gives
   J_G(b)≥J_G(a)+2Re<r,b−a>+||b−a||². Completing the square proves the
   value bound; strong monotonicity proves the distance bound. Arbitrary
   choices on zero sets give valid subgradients and therefore valid,
   possibly nonsharp, certificates. The residual must use the **full**
   first-chaos projection: a small residual in one selected direction
   alone does not certify minimization over all multipliers.
4. If certified numerical enclosures give J_G(a) in [J_lo,J_hi] and
   ||r||≤r_hi, then min J_G is in [J_lo−r_hi²,J_hi]. This is an error
   budget for the inner convex problem only. It does not certify a
   maximum over cubic tensors or sector amplitudes.

The strong-convexity principle is standard and the older `ch31` already
uses it for a smoothed larger saddle. The explicit radius and residual
corollaries are recorded for the retained numerics; no general priority
claim is made. They require no inverse-radius Hessian integrability.

## 4. Exact central consumer component (conditional P + C)

Fix **one** witness epsilon=1891/2500. Suppose an all-sector raw or retained
bound at the single peak profile supplies Λ(G)≤S+eta, or Λhat(G)≤S+eta,
for every response being covered. Let S_hi=1.3739535256616 be the upper
endpoint already certified by the October package and replayed in A15.
Then the same row gives

    V ≤ t²−2ell t+2beta²/epsilon+S_hi+eta.              (7)

A convex quadratic takes its maximum on a closed interval at an endpoint.
At t in [21/25,851/1000], the worst endpoint is 21/25. Consequently the
exact remaining allowance to the cap 500/701 is

    eta_max=166713115892493/1656988750000000000
           =0.0001006120988404375… .

Thus eta≤1/10000 leaves more than 6.12·10⁻⁷ of strict row-cap margin.
The same single row even covers the rational interval

    [16799/20000,681/800]=[0.83995,0.85125].

These scalar statements are freshly checked with Fraction arithmetic.
They upgrade the central error-budget calculation to **C conditional on
the inherited S enclosure and the still-open all-sector K_eta premise**.
They are not a full lower-bound consumer: the complementary response
regions, mathematical bridge to the operator norm, and Lean integration
remain. In particular the newly certified remote cap alone cannot be
substituted for the all-sector hypothesis of (7).

The same peak S upper endpoint and one fixed row do not certify 1.4022 on
all of [0.84,0.851], even with eta=0: at t=0.84 its upper bound is
0.7131661496700611…, above 5000/7011. Additional rows or a finer division
of the interval are needed for that target. This is a limitation of this
specific sufficient certificate, not a proof that exact K cannot give
1.4022. Different epsilon values must not be mixed inside one consumer.

More generally, for a finite collection of rows with **common epsilon**,
each verified on an assigned closed t-interval, checking both endpoints of
each associated quadratic and checking the interval cover suffices. A
continuum of profile hypotheses is unnecessary when such a finite cover
is supplied. Claude's new REMOTE §4 already notes this; the present
calculation makes its central peak-row component exact.

## 5. Literature and coverage

The primary [arXiv abstract of Nourdin–Peccati–Poly–Simone](https://arxiv.org/abs/1407.6216)
confirms the extra zero-third-moment hypothesis. Its conclusion is an
asymptotic Gaussian criterion for fixed-degree homogeneous sums; it does
not supply the desired nonlinear content estimate. The [publisher record
for Peccati's survey](https://www.esaim-proc.org/articles/proc/pdf/2014/01/proc144403.pdf)
confirms the bibliographic item, but its full text was inaccessible through
the web reader (403); this pass does not newly verify every constant quoted
from it. Janson, the Malliavin text, Bernstein-functions book and the DLMF
list remain background citations, not freshly checked theorem inputs.

| Coverage | What was actually checked | Limit |
|---|---|---|
| README statement; MON §§0–1; STATUS 2.1,2.10,2.10a | Raw row (4), weak retained dual (5), epsilon consistency, exact central budget | Full global consumer and K remain open |
| MON §2 and STATUS 2.8–2.9 | Sector bidegrees, energy orthogonality and parity rechecked against the weighted support calculation | This is not finite-amplitude odd-sector control |
| STATUS 2.12; MON §1 response cuts | All-sector energy ellipsoid, Rice tangent, three regional caps independently re-derived and exactly checked | Other grouped response constraints inherited/read only |
| MON §4b; STATUS 7–8 | Six-layer logic, axis versus joint cost, local versus finite-amplitude scope, fixed-epsilon consumer | Prior analytic/certificate findings retained; no redundant reruns |
| MON §5 | Conditional endpoint consumer in §4, including exact 1.402 error budget | No outside-central cover or Lean theorem |
| MON §6 | Literature scope and one missing input hypothesis checked in primary source | Other background literature not fully re-audited |
| MON §7; README index | Historical provenance/file map reviewed against the existing audit notes | No claim that all archived code was rerun |
| Latest Claude review | Read `REVIEW_claude-b9ee.md` and the changes it identifies: fresh replay, input mapping, finite rows, positive-part assembly | No new Lean build or independent replay of the whole remote package by this subtask |
| Previous 13/15 November audits | Compared existing scope corrections, consumer warnings and failed-route register before selecting this work | Previously reported independence and A/B gaps are not presented as new |

Reproduce the new scalar evidence from the repository root:

    python3 -I research/conjecture-K/code/reaudit-2026-11-15-codex-a7c4/foundations_exact.py

The saved `foundations_exact_result.json` records PASS and exact fractions.
The checker uses only the standard library; no SciPy/Arb installation,
saved kernel grids, full builds or long computations are required.
