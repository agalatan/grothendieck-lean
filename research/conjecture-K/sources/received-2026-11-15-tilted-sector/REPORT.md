<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/REPORT.md (file dated 2026-11-15 06:06). Only this line was added. -->
# Tilted sector lemma: complete range u ≤ 0.0463

Agent-ID: **codex-6e2b**. 15 November 2026.

**P+C: the content-to-deficit inequality is proved in every finite dimension on the full requested energy range:**

\[
\boxed{\|c_{3/5}(q)\|^2\le\frac3{10}D(q)_++\frac6{10^6}
\qquad(0\le\|q\|^2\le463/10000).}                 \tag{1}
\]

Together with the previously certified global function-value remainder bound `Sec ≤ 13/20`, this proves the tilted-sector lemma (*) with

\[
\boxed{s=\frac35,\qquad\kappa=\frac{56730}{59009}<1,
\qquad\eta=\frac{5673}{295045000}<\frac1{50000}.}   \tag{2}
\]

No positivity assumption on the same-variance deficit is used. The proof holds for every remote linear form, with no restriction on its norm. This is a mathematical proof with exact and interval certificates, **not a new Lean theorem or a new bound on the Grothendieck constant**.

Labels: **P** = mathematical proof; **C** = exact or outward interval computation; **N** = floating-point exploration only; **O** = open. The requested inequality is now **P+C**, not O.

## What a reviewer should check first

1. The genuine complex `(2,1)` moment and Stein inputs in [deficit_dual_proof.md](deficit_dual_proof.md), especially the spectral square identity and the direction of the energy interpolation allowance. The same dual covers both kurtosis endpoints.
2. The half-line scalar comparison and the one-switch angular reduction in [deficit_structure_refine_proof.md](deficit_structure_refine_proof.md) and [deficit_angular_proof.md](deficit_angular_proof.md).
3. The global Hermite caps and concavity-based Gaussian lower chords in [deficit_moment_verify_proof.md](deficit_moment_verify_proof.md) and its [prefix extension](deficit_moment_prefix_proof.md).
4. The exact union and the treatment of `D<0`: exempt boxes prove `C²≤6e−6`; all others prove the stronger `C²≤.3D+6e−6`.
5. Run `python3 -I verify.py`. [results.txt](results.txt) distinguishes the earlier complete secant replay from the new integrated additive replay. The independent mathematical and source audit is [deficit_audit_results.md](deficit_audit_results.md).

## 1. Setting and inherited inputs — P

Let `Z,y₁,…,yₙ` be independent standard complex Gaussians. Set

\[
a=699/1250,\quad b=179/1250,\quad p=2500/1891,\quad
T=|Z|^2,\quad L=Z(a+bT),\quad A=T-2/5,\quad P=p-9/25.
\]

For a remote Wick cubic `q∈H_(2,1)`, write

\[
u=E|q|^2,\quad F(q)=2E|L+q|,\quad B(u)=2E|L+\sqrt uW|,
\quad D=B-F,\quad D_+=\max(D,0),
\]

where `W` is an independent standard complex Gaussian. Set `C=||c_(3/5)(q)||`, with the task's profiles

\[
c_s(q)=\Pi_1[q h_s(|q|^2)],\qquad
h_s(v)=g(v)-g(0)+s(j(v)-j(0)).
\]

Subtracting the constant linear profile is valid because `Π₁q=0`. For `u>0`, put `U=|q|²/u`, `δ=E|q|⁴−2u²`, `χ=δ/u²`. The existing complex-chaos theorems give

\[
EU=1,\quad EU^2=2+\chi,\quad0\le\chi\le42,\qquad
EU^3\le6+9\chi+\frac{4045313}{100000}\chi^{3/2}.     \tag{3}
\]

The Stein variables satisfy `EX=0`, `2P₁+R₁=χ`, `EX²≤2P₁/3`, `Er₁²≤2R₁/3`, and `R₁≤χ/3`, where `P₁=E UX`, `R₁=E Ur₁`. The test-function identity and these constraints are the inherited inputs identified and re-derived in the repository's `research/conjecture-K/sources/audit-2026-11-15-codex-a7c4/remote_strong_PROOF.md` and `REMOTE.md`. No statement for arbitrary pairs of real cubic chaoses is substituted for the intended complex bidegree theorem.

Set `h(v)=2E_Z|L+√v|`. Circular symmetry gives `F(q)=Eh(uU)`. The inherited Bernstein-profile theorem gives `h''''≤0`, `h'''≥0`, and concavity. Its derivative estimate and the exact comparison in [deficit_exact.py](deficit_exact.py) give

\[
-3<h''(v)\le0\qquad(v\ge0).                         \tag{4}
\]

At `u=0`, `q=0` almost surely and `C=0`; no normalized law is needed. All conclusions concern arbitrary finite dimension.

## 2. Strengthened structural content bounds — P+C

The previously certified global bounds are

\[
C^2\le\min\left\{\frac2{25}\delta,
3\delta^{3/2},\frac1{2500},\frac{19321}{10^6}u\right\}. \tag{5}
\]

The new energy-dependent bounds `C²≤γδ` are:

| Lower energy endpoint | Exact coefficient γ |
|---|---:|
| `9/1000` | `251/5000` |
| `3/250` | `121/2500` |
| `3/200` | `467/10000` |
| `9/500` | `451/10000` |
| `1/50` | `441/10000` |
| `1/40` | `1859/43200` |
| `3/100` | `3/80` |
| `7/200` | `71/2000` |
| `1/25` | `17/500` |
| `11/250` | `13/400` |

Every row holds from its listed endpoint through `463/10000`, including both boundaries, for all `χ`. Thus the central coefficients improve to `.0375`, `.0355`, `.034`, and `.0325` as the energy increases.

The structural identity is `C²≤(2/3)δ sup_R N_(Ψ_u)(R)`. Its scalar shifted-OU resolvent is

\[
k_u(x)=\int_0^1z^{2/3}E\,m''\!\left(zx+
\sqrt{\frac u2(1-z^2)}G\right)dz,\qquad
m(x)=E[(T-2/5)\operatorname{sign}(\Re L+x)].
\]

It solves `(5/3−(u/2)∂²+x∂)k_u=m''`. Rational cubic supersolutions on 500 intervals, extended constantly, are checked by exact Bernstein coefficients. Arb freshly encloses the 501 source values, the fourth derivative, and the infinite tails. The residual is affine in energy, so its two endpoints suffice. The half-line comparison includes the favorable downward derivative jump at one.

For the first six rows, `C²≤(11/108)||k_u||∞²δ` gives the constants; see the [refined low-energy proof](deficit_structure_refine_proof.md) and [medium-energy proof](deficit_structure_medium25_proof.md). For the last four, retain the shape of `|k_u(x)|≤W(|x|)`. Define

\[
A_R=\int_0^{\pi/2}\cos^3\theta\,k_u(R\cos\theta)d\theta,\qquad
B_R=\int_0^{\pi/2}\cos\theta\sin^2\theta\,k_u(R\cos\theta)d\theta.
\]

The content coefficient is bounded by the supremum of `max{(3A_R²−2A_RB_R+3B_R²)/12,(2/3)B_R²}`. A supporting functional has sign `sign(αcos²θ+βsin²θ)`, hence at most one switch. An interval check encloses every switch on 400 closed radial intervals in `[0,2]`, each with 4096 angular cells; an analytic estimate covers the infinite ray. The four largest compact upper enclosures are below `.037211600`, `.035357021`, `.033650745`, and `.032383690`. See [deficit_angular_proof.md](deficit_angular_proof.md).

## 3. Content versus the actual deficit — P+C

The complete cover has three components:

| Energy interval | Method | Accepted boxes |
|---|---|---:|
| `[0,9/1000]` | Global Hermite moment caps | 32 |
| `[9/1000,2/125]` | Moment caps with stronger content | 40 |
| `[2/125,463/10000]` | Global spectral Stein duals | 106 |

**Moment covers.** For two positive nodes, the cubic Hermite interpolant of `h,h'` is a global upper cap on the entire positive half-line, because its fourth-derivative remainder is nonpositive. Rounding each coefficient upward preserves the cap. Its positive cubic coefficient lets (3) bound its expectation. The two components freshly certify 20 and 33 global caps.

The Gaussian benchmark `B` is freshly integrated with a Rice/Bessel formula and a proved tail enclosure. Concavity makes the chord of lower endpoint enclosures a lower bound on each energy slab. In `(u,x)`, `x=√χ`, the budget

\[
\frac3{10}(B_{\rm lower}(u)-F_{\rm cubic\ upper}(u,x))
+6\cdot10^{-6}-H(u,x)                               \tag{6}
\]

is polynomial for a selected valid content branch `H`. Nonnegative exact bivariate Bernstein coefficients prove (6) throughout every nonexempt accepted box. The moment covers include `0≤x≤13/2`, hence all `χ≤42`.

**Stein cover.** For a piecewise-affine `φ`, constant in its tail, let `Φ(x)=∫₀ˣφ` and `d(x)=φ(x)−Φ(x)/x`. For `λ,μ>0`, `ν≥0`, and real `t,β`, set

\[
f_0=-(\phi+\beta)/2+(2t+\lambda/3)x,\qquad
g_0=-d/2+(t+\mu/3-\nu/2)x,
\]
\[
G=f_0^2/\lambda+g_0^2/\mu+\Phi-\phi
+(\nu/3-2t)(x^2-2).
\]

The Stein identity expands `EG(U)` into squares and nonnegative moment-budget remainders, proving `EG(U)≥0`. An exactly checked cubic `Q≥h(ux)+G(x)` on **all** `x≥0`, with `Q₃≥0`, yields

\[
F(q)\le Q_0+Q_1+(2+\chi)Q_2+
(6+9\chi+(4045313/100000)\chi^{3/2})Q_3.             \tag{7}
\]

All 119 proposed duals pass whole-half-line rational polynomial checks. The default verifier freshly checks the original 68 profile caps, adds ten Hermite caps on `[2,64]`, and uses a tangent on the remaining ray. These extended caps avoid the loss from the old tangent starting at two. All Gaussian benchmarks at the 14 energy nodes are freshly integrated.

At each energy endpoint, **one dual and one content branch** cover both kurtosis endpoints. Equation (7) plus `H/(3/10)` is convex in `χ`, so its maximum is at an endpoint. For a fixed actual normalized law `U`, put

\[
Q_{\rm budget}(u)=\frac3{10}[B(u)-Eh(uU)]+6\cdot10^{-6}-H(u,\chi).
\]

Since `B''≤0`, `H''≥0`, and (4) holds, `Q_budget''≤(9/10)(2+χ)`. An energy cell of width `Δu` therefore costs at most

\[
\frac{9(2+\chi_{hi})}{80}(\Delta u)^2               \tag{8}
\]

below its endpoint chord. All nonexempt corner budgets exceed this exact allowance. The direction matters: an **upper** second-derivative bound gives this **lower** chord estimate. See [deficit_dual_proof.md](deficit_dual_proof.md).

**Positive part and exact union.** Exempt boxes prove `C²≤H≤6e−6`. Every other box proves `C²≤.3D+6e−6`, which implies (1) because `D≤D₊`. Neither case assumes `D≥0`.

The [exact union checker](deficit_cover_union.py) squares moment `x` endpoints exactly and clips to `χ≤42`. Its **178 rectangles and 45 energy strips** cover `[0,463/10000]×[0,42]`, with zero gaps. Closed boxes include all boundaries. The union runs after all three component certificates, so it combines freshly checked inequalities, not merely stored geometry. This proves (1).

## 4. Full tilted-sector assembly — P+C

The previous [global secant proof](secant_proof.md) establishes

\[
2[f(w,\rho)-f(w,0)-\langle\nabla_\rho f(w,0),\rho\rangle]
\le\frac{13}{20}|\rho|^2,\qquad
f(w,\rho)=E_Z|L+w+A\rho|,                           \tag{9}
\]

for all complex `w,ρ`. Its compact cover accepts 102,104 boxes; small amplitudes and both spatial and amplitude exteriors have proved bounds. It averages over the source before imposing the quadratic estimate, without a uniform per-ring Hessian bound.

Integrating (9), identifying its linear term with the first-chaos content, and completing the square gives, for every linear `r`,

\[
J(q,r):=2E|L+q+Ar|-P\|r\|^2-F(q)
\le2C\|r\|-k\|r\|^2\le C^2/k,
\qquad k=P-13/20=59009/189100.                       \tag{10}
\]

Insert (1) into (10):

\[
\boxed{2E|L+q+(T-1+s)r|-(p-s^2)\|r\|^2
\le2E|L+q|+\frac{56730}{59009}D(q)_+
+\frac{5673}{295045000}.}                           \tag{11}
\]

[deficit_exact.py](deficit_exact.py) checks `κ<1` and `η<2e−5` exactly. Numerically, `κ≈.961378773` and `η≈.0000192275755`. Localization O-A2 is absent. There is no Gaussian bad-event allowance or maximizer-existence premise.

## 5. Reproducibility, trust, and retained history

From this directory, `python3 -I verify.py` replays the full active chain: exact constants, curvature input, global secant cover, old global content bounds, all ten used new barriers, four angular certificates, three content/deficit covers, and their union. It needs python-flint/Arb and `clang++` with strict directed-rounding support. `TILTED_FLINT_PYTHON` selects an interpreter if needed. Compilation uses temporary subdirectories of this folder.

The earlier complete secant replay is preserved byte-for-byte in [results_secant_history.txt](results_secant_history.txt), with its [original wrapper](verify_secant_history.py). The new additive command is `python3 -I verify.py --deficit-only`, recorded in [deficit_integrated_results.txt](deficit_integrated_results.txt). The integrated additive run passed with zero uncovered boxes. It freshly recomputes all new inputs and checks the 14 unchanged source hashes of its earlier prerequisites; it does not numerically rerun those prerequisites. [results.txt](results.txt) indexes both runs and final proof hashes. `--algebra-only` checks scalar comparisons only, not the whole certificate.

Floating-point searches merely propose rational witnesses; no solver objective or sampled inequality is accepted as a proof. The numerical trust chain is Python exact rationals, python-flint/Arb, the audited integration and polynomial routines, and strict IEEE directed arithmetic in the C++ checks. Analytic reductions and inherited complex-chaos theorems remain explicit mathematical inputs. This is **P+C**, not Lean kernel verification.

The earlier reports remain in [REPORT_secant_history.md](REPORT_secant_history.md) and [REPORT_localization_history.md](REPORT_localization_history.md). Exploratory `deficit_moment_mid*`, optimizer files, and partial alternative searches are not active proof inputs. No claim is made beyond `u=463/10000`.

The repository and GitHub record were read at [`d0bd91a1b2eeabaa0cdbb22fcf8907c5414f1a75`](https://github.com/agalatan/grothendieck-lean/commit/d0bd91a1b2eeabaa0cdbb22fcf8907c5414f1a75). The user review folder and repository sources were read only. All new files and edits are confined to this authorized handoff folder; there were no Git mutations, external comments, or Lean builds.
