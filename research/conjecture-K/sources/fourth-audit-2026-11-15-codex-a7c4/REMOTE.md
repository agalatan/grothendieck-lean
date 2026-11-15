<!-- New fourth-audit note. Agent-ID: codex-a7c4. Refs #406. -->
# Remote audit: a larger certified profile region

Agent-ID: codex-a7c4. 15 November 2026. Baseline merged #403,
`2442792eab87cc48a71ba29dc74be7a250b4a03a`. Existing sources are unchanged.

**New result: P by author, not externally reviewed, plus C scalar budget.**
The existing peak remote cap and Gaussian supporting plane certify a
one-sided rectangle of normalized profiles, without computing another
remote anchor. It is much wider in the positive profile directions than the
earlier symmetric Lipschitz tube. The entire application box and the other
two named rows are still not covered.

This pass also inspects and replays the direct Rice/Arb benchmark code, and
independently reconstructs all six positive Bernstein cell polynomials in
the third audit. These were explicit exclusions of the review of #403.

**Resync addendum.** The worktree was subsequently fast-forwarded to
`9a93fb472`, containing #408's tilted-sector record. Its reviewed global
secant theorem and central content bound are compatible with this note:
they concern the peak tilted A-sector, whereas (6) below transfers only the
remote cap. The tilted theorem is not transferred to that rectangle. Its
new augmented-certificate route is addressed in section 6 below.

## 1. Audit findings and scope

| Location | Finding / disposition |
|---|---|
| STATUS 3.11; A15 REMOTE §4 | The symmetric transfer pays a triangle-inequality loss twice. The already-certified supporting plane permits a smaller, direction-dependent loss using a single remote anchor. The old bound is valid; section 2 completes a larger certified region. |
| STATUS 3.12; A15R REMOTE §4 | State the spectral-cut domain explicitly: U≥0, λ>0, μ>0 and ν≥0. These belong to the underlying cut definition, but the standalone summary says only “rational λ, μ”. The proof's divisions and positive error budget require the first three; ν≥0 is the inherited admissibility condition in `spec_of_inputs` and the package's `check_node`. This is a low-severity scope clarification, not a defect in the correctly scoped cut theorem. |
| STATUS 3.14; A15R REMOTE §3 and `remote_benchmark_crosscheck.py` | Direct Rice formulas, branch handling, tails and the global maximum enclosure check out under the usual Arb trust. Source-level audit and fresh replay are detailed in section 3. |
| A15T `potential_bounds.py`, `content_kernels_exact.py` | The power-to-Bernstein conversion is correct. Reverse expansion reconstructs every actual cell polynomial exactly; all controls are positive. Section 4 closes this finite arithmetic review gap. |
| STATUS 2–4,8; MON §§0–1,3.3–3.4,4b,5 | Rechecked the distinctions between a remote-only cap, same-variance deficit, disjoint cost, an all-sector premise and the fixed-epsilon consumer. No new counterexample to the correctly scoped results was found. Historical false Lean/all-row completion and rounded-target claims are already corrected by the living errata. |

The third audit's global kernel alignment is not a remote-cap theorem at
other profiles. Likewise the new region below controls only remote cubics;
it does not remove the joint, content, nonzero-core odd-sector or response
cover obligations. The full old Stein acceptance is inherited from its
recorded replay, not rerun in this pass. No Lean source is edited or built.

## 2. One-anchor transfer with a Gaussian support

Write ε₀=1891/2500, a₀=699/1250, b₀=179/1250. The existing peak certificate
gives, for every remote cubic q in every finite dimension and at every energy,

    Λ₀(q) < U₀,        U₀ = 1.373953883.                 (1)

Let v₀=403448/10⁷ and define the fixed-variance competitor at ε₀ by

    J(a,b) = 2 E|Z(a+bT)+sqrt(v₀)W| − v₀/ε₀.

The direct Rice certificate, freshly audited/replayed below, supplies

    J(a₀,b₀) > J₋ = 1.3739535256614828,
    g_a ∈ (1.689944147450845, 1.689944147450846),
    g_b ∈ (2.622896929056071, 2.622896929056073),

where (g_a,g_b)=∇J(a₀,b₀). Since J is convex, its tangent is a global lower
bound for J, hence for the Gaussian supremum S. This is exactly the support
already proved in STATUS 3.13–3.14; the improvement is how it is combined
with (1).

For ε>0 set λ=ε/ε₀, δa=a/λ−a₀ and δb=b/λ−b₀. For every remote cubic q,
positive homogeneity and the norm triangle inequality give

    Λ_{ε,a,b}(q)
      ≤ λΛ₀(q/λ) + λsqrt(π)(|δa|+(3/2)|δb|).        (2)

Indeed the penalties agree exactly:
`||q||²/(λε₀)=λ||q/λ||²/ε₀`, while the two norm terms cost at most
`2λ E[|Z||δa+δbT|]`. Using `E|Z|=sqrt(π)/2` and
`E|Z|³=3sqrt(π)/4` gives (2). The scaled Gaussian competitor of variance
λ²v₀ yields

    S(ε,a,b) ≥ λ[J₋+min(g_a^-δa,g_a^+δa)
                         +min(g_b^-δb,g_b^+δb)].       (3)

Consequently, for arbitrary real δa,δb,

    Λ(q)−S < λ[U₀−J₋+sqrt(π)(|δa|+(3/2)|δb|)
                    −min(g_a^-δa,g_a^+δa)
                    −min(g_b^-δb,g_b^+δb)].           (4)

No restriction on ||q|| or the dimension enters. Scalar multiplication
preserves the remote cubic space, as required in applying (1) to q/λ.
The support remains valid without assuming differentiability of the
optimizing Gaussian variance: v₀ is fixed throughout this argument.

For δa,δb≥0, the error coefficients in (4) reduce to

    sqrt(π)−g_a^- < 5156856465917/62500000000000,
    (3/2)sqrt(π)−g_b^- < 71567694604409/2000000000000000.   (5)

They are about .08251 and .03578, instead of the old symmetric coefficients
2sqrt(π) and 3sqrt(π). The new exact checker derives
`sqrt(π)<1772453850905517/10¹⁵` from Machin's identity and alternating
arctangent series; it does not use floating point or a stored π enclosure.

### A completed continuum rectangle

For every

    ε ∈ [37/50,19/25],       λ=ε/ε₀,
    0 ≤ a/λ−699/1250 ≤ 1/2000,
    0 ≤ b/λ−179/1250 ≤ 1/625,                         (6)

and every remote cubic q, (4)–(5) give

    Λ(q)−S < 2348075715791501/23637500000000000000
           < 1/10000.                                (7)

The maximal rational bound in (7) is about .0000993368891. Thus this is an
actual new continuum of certified remote profiles, not only a criterion
waiting for vertex certificates. With the slightly smaller bound
`δb≤3/2000`, the same proof gives

    Λ(q)−S < 7241885051036049/75640000000000000000
           < 96/10⁶.                                 (8)

The region is asymmetric. It cannot be reflected into negative increments
without using the other signs in (4). It contains neither the named flank
nor the named upper row: their normalized increments are respectively
`(349/37250,106997/18625000)` and `(69/5000,11/1250)`, outside (6).
The prior tube remains useful on its other sides. No all-profile or
same-variance domination is asserted.

## 3. Direct Rice benchmark audit

**C, fresh replay plus inspected implication; within-session independent
inspection, not a new external approval.** The code is unchanged at
`code/reaudit-2026-11-15-codex-a7c4/remote_benchmark_crosscheck.py`.
For x=t(a+bt)²/v, the direct Rice formula is

    B(v)=sqrt(πv) ∫ e^−t e^−x/2[(1+x)I₀(x/2)+xI₁(x/2)] dt.

Differentiation gives `B′(v)=sqrt(π)/(2sqrt(v)) ∫e^−t e^−x/2 I₀(x/2)dt`;
the gradient integrands, before the common factor sqrt(π/v), are
`e^−t t(a+bt)e^−x/2(I₀+I₁)` and its t-multiple. These follow directly
by differentiating the series and using the Bessel recurrences, so there is
no integration-by-parts endpoint correction in this implementation.

The callback uses integer-order scaled Bessel functions. FLINT specifies
the scaling as e^−z I_ν(z), so orders 0 and 1 are entire functions of z;
composition with the polynomial x(t)/2 is entire. The analytic flag may
therefore be ignored for these callbacks. This is the function required
by the contour quadrature, including complex balls near the integration
path; it is not an absolute-real-part scaling. See the
[FLINT primary reference](https://flintlib.org/doc/acb_hypgeom/index.html#modified-bessel-functions).

The 256 adjacent pieces [k/4,(k+1)/4] cover [0,64]. The following positive
tail bounds enclose the complete omitted ray, with T=64:

| Quantity | Bound beyond T | Reason |
|---|---|---|
| B(v) | e^−T[2a(T+1)+2b(T²+2T+2)+sqrt(πv)] | Triangle inequality and sqrt(t)≤t, t^(3/2)≤t² for t≥T |
| B′(v) | sqrt(π)e^−T/(2sqrt(v)) | 0≤e^−z I₀(z)≤1 for real z≥0 |
| ∂_aB | 2e^−T(T+1) | Norm derivative bounded by 2sqrt(t)≤2t |
| ∂_bB | 2e^−T(T²+2T+2) | Norm derivative bounded by 2t^(3/2)≤2t² |

Each actual tail is nonnegative at the positive peak profile. Adding the
ball with midpoint and radius half the upper bound therefore encloses it
with the correct sign. The integrals are real on the real path, so taking
the real component of the Acb enclosure is valid.

Complete monotonicity of the visible radial law makes B strictly concave
for v>0. The checked derivative signs at .040344 and .040346 bracket the
global maximizing variance. Concavity bounds its value by the tangent at
v₀, and `|B′(v₀)−1/ε₀|(.040346−.040344)` is a valid enlarged tangent error.
The fresh 160-bit replay exits 0 and reproduces the committed result JSON:
the direct value is `1.3739535256614828336252 ± 2.59e−23`, and the upper
bound is `1.3739535256615254615738 ± 3.16e−23`. It also reaccepts the exact
gradient decimal intervals used in (3). No Arb/FLINT internals are audited.

## 4. Exact Bernstein arithmetic audit

For p(x)=Σa_j x^j on [l,r], let

    q_k = Σ_{j≥k} a_j binom(j,k) l^(j−k)(r−l)^k.

This is exactly the coefficient of t^k in p(l+(r−l)t). The identity

    t^k = Σ_{i=k}^n [binom(i,k)/binom(n,k)]
                       binom(n,i)t^i(1−t)^(n−i)

follows by factoring t^k and expanding (t+(1−t))^(n−k). It proves the
forward conversion implemented in both third-audit scripts. Since the
Bernstein basis is nonnegative and sums to one on [0,1], the smallest
control coefficient is a lower bound for p throughout the interval.

The new `bernstein_crosscheck.py` uses a different direction of this
identity: it expands

    Σ_i c_i binom(n,i)(x−l)^i(r−x)^(n−i)/(r−l)^n

in x and checks exact equality of every power coefficient with the
original polynomial. It checks the three degree-21 constant-bound cells,
the degree-47 far-field cell and both degree-3 content-Hessian cells. All
six reconstruct exactly and have strictly positive controls. It also
replays the original finite scalar acceptance. In particular the two
content minima are 1/4 and 1/8, and the far-field minimum exceeds 9/20.

The potential polynomial direction is sound: positive Taylor truncations
lower-bound e^(2x), while the stated geometric remainder upper-bounds I₀.
Subtracting the square of the latter with the upper bound π<22/7 leaves
a lower polynomial. The reverse reconstruction is finite arithmetic, not
a new proof of the analytic ODE or the infinite-tail argument, which retain
their recorded review. It does not audit Python's Fraction implementation,
all historical checkers, or the inherited 220-bit interval library.

## 5. Reproduction

From the repository root:

```sh
python3 -I research/conjecture-K/code/fourth-audit-2026-11-15-codex-a7c4/remote_profile_transfer.py
python3 -I research/conjecture-K/code/fourth-audit-2026-11-15-codex-a7c4/bernstein_crosscheck.py
python3 -I research/conjecture-K/code/reaudit-2026-11-15-codex-a7c4/remote_benchmark_crosscheck.py \
  --dependency-dir /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/dependencies
```

All three passed. The first two use only the standard library and reject
`-O`; their saved JSON files contain outputs, not numerical input data.
The benchmark script requires python-flint (0.9.0 in this replay). Omit
the dependency argument when it is available in the normal interpreter.
All are read-only by default. These are research checks, not Lean proofs.

## 6. The merged tilted-sector update

Read the fifth tilted report, its third review, `secant_assembly.md`, the
new README layer summaries, and STATUS 11.26–11.45 after #408. No new
scope contradiction was found in the relevant remote/consumer statements.
The reviewed global secant bound replaces the earlier conditional
localization route for this tilted A-sector. It does not close the content
comparison, the joint A/B problem, the odd sectors, or the full consumer.
The ledger correctly distinguishes reviewed γδ and (2/25)δ estimates from
the partly unreviewed 3δ^(3/2) and 1/2500 estimates.

The reduction in STATUS 11.44 is sound: a certificate for
`Λ(q)+H(u,δ)/k≤S+η`, with a valid content upper bound H and
`k=59009/189100`, directly controls the tilted retained A-core. The
existing standalone remote cap cannot pay the worst uniform sector bound.
For the original moment polynomials, the endpoint-in-x argument also
survives adding either γδ/k or 3δ^(3/2)/k: for fixed variance the polynomial
has form c₀+c₂x²+c₃x³ with c₃≥0, so its derivative on x≥0 has at most a
change from negative to positive and its maximum on an interval is at an
endpoint. The extra terms only increase c₂ or c₃. The rational coefficient
γ is valid on 0.03≤u≤0.0463. In particular it is valid on the **actual**
central rectangle `[7/200,23/500]×[0,1/5]` of the October checker;
mentioning its lower variance endpoint avoids an apparent domain ambiguity.
This inspection validates the proposed reduction, not an augmented
certificate: the new dual bounds and their acceptance remain to be built.

The parent audit's new CONTENT note was independently checked here: the
angular majorant, concavity of its splice, both Jensen steps, exact
inverse-radius constants, small-radius finite integral, positive-u
derivative and the decreasing-w extension are consistent. Its new strips
use raw A-core second moments and are separate from the tilted secant
theorem. This review does not upgrade the inherited fourth-moment cutoff.

### A completed central near-Gaussian subclass

**P by author + C rational acceptance, external review pending.** This is a
new explicit consequence of the reviewed inputs of #408, not a new secant
or content theorem. Keep the **peak profile fixed**. Let q be any remote
cubic in any finite dimension, let r be any remote linear form with any
sharing with q, and suppose

    3/100 ≤ u=E|q|² ≤ 463/10000,
    0 ≤ χ=(E|q|⁴−2u²)/u² ≤ 7/100.                  (9)

There is no amplitude bound on r and no sign assumption on D(q). The
reviewed central content coefficient and global tilted cost give

    C²≤γδ,  δ=χu²,  γ=1077659/27000000,
    𝒥(q,r)≤C²/k,  k=59009/189100.

Use the existing peak remote cap and the retained trial inequality
`Λ̂(q+(T−1)r)≤Λ(q)+𝒥(q,r)` to obtain

    Λ̂(q+(T−1)r)−S
      < 9/25000000 + γ(7/100)(463/10000)²/k
      = 3115324569897527/159324300000000000000
      < 1/50000.                                  (10)

The numerical size of the exact upper bound is .000019553354824. All
inputs to this consequence are reviewed results: STATUS 3.3, 11.12,
11.40 and 11.41. It uses neither the partly unreviewed cubic-cumulant
bound nor the unreviewed uniform content cap. The exact checker above
recomputes (10), including the identity
`k=1/ε₀−(3/5)²−13/20`.

The assertion is a retained **A-core** result on the subclass (9), at the
peak. It is not transferred to (6), does not add B or odd sectors, and
does not prove the general content comparison of STATUS 11.43 or the
proposed augmented certificate over its full domain.
