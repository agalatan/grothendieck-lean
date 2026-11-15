# Second audit: remote certificates and disjoint drivers

Agent-ID: codex-a7c4. Refs #398. 15 November 2026.
Baseline: `b0ec41d69`, whose audited files are unchanged in merge `8ab5b606e`.

**New completed result (P + C):** the previously unchecked numerical premise
in STATUS 4.2 is now independently certified by a standard-library Python
port. The cost theorem holds at every amplitude, in every dimension, throughout
the application box, and in the larger homogeneous domain in section 2. The
original October/November theorem is recovered, not attributed to this audit
as a new discovery. Its broader scope and exact uniform cost are explicit below.
The analytic argument and the port's rounding directions were separately
reviewed by the `sector_audit` worker in this session. External review is pending.

**C:** the Gaussian benchmark is independently checked with the direct Rice
formula, retaining the I₁ term which the earlier implementation eliminated by
integration by parts. **P, by author, with same-session peer review, not externally reviewed:** sections 4–5
give a dense-test extension that avoids changing the 45 remote duals, and a
convex-cell transfer criterion that avoids paying a first-order Lipschitz loss
at every interior point. Neither is a Lean port or a new Grothendieck bound.

## 1. Findings and audit coverage

| Location at baseline | Finding or improvement | Severity / action |
|---|---|---|
| `STATUS.md:132`, entry 4.2; `MONOGRAPH.md:362–368` | The all-amplitude disjoint cost had a checked analytic implication but an unexecuted scalar premise. Fresh independent integer verification closes that premise: exact potential cap `2188027284403/2^40<1.99`. | Substantive completion: change R premise to C, with scope in section 2. |
| Prior audit `REMOTE.md:245` (Claude §3a) | The remote spectral cut needs `Moments` and `SteinInputs` only. `Grothe.Lower.spec_of_inputs` at `Grothe/Lower/Stein.lean:578` supplies it directly. Going through the stronger `GramInputs`/`steinCut_of_inputs` adds unused dependencies. | Low; simplify a future port's dependency plan. No theorem in the old text is false. |
| Prior audit `REMOTE.md:249–251` | The constant-tail conversion is correct in principle, but an implementation should state the simultaneous changes unambiguously: for tail c use `φ₀=φ−c`, `β₀=β+c`, `G₀=G−c(u−1)`. | Low; explicit sign-safe formulas in section 4. |
| Prior audit `REMOTE.md:252–257` | Re-optimizing witnesses on rational-square meshes and re-proving Gaussian integration by parts for arbitrary knots are not the only options. Existing square-mesh cuts imply all the needed rational-knot cuts by uniform approximation, with an explicit expectation-error bound. | Useful new analytic reduction, section 4. It is not yet implemented in Lean. |
| `STATUS.md:153`, entry 6.1.1 | The large-w strip and the displayed linear bound use the same orthogonality assumptions but are different estimates. The linear expression alone does **not** close `u=.0463,w=.0223`: its increment is `1908731/125000000=.015269848`, much larger than the peak allowance `.002174245…`. | Medium, proof navigation; name the separate concave-envelope strip theorem, rather than calling it a consequence of the linear bound. |
| Prior audit `REMOTE.md:306–316` | The seven-million-anchor estimate concerns the particular first-order transfer formula. A different transfer via convexity uses remote caps at vertices and a Gaussian supporting plane; no all-box anchor count follows from the Lipschitz estimate for this method. | Improvement, not a refutation of the stated count; exact criterion in section 5. Missing vertex certificates are not presumed. |

The shared-A strip cited in the fifth row is
`sources/manuscript/legacy/lower-bound/sharp-circular.tex:94–147`. It uses the
concave majorant `min(1+Cs,sqrt(1+s))` and a separate compact integral, with
`W(.0463,.0223)−B₀<.002107`; it is not obtained by substitution into the linear
bound. That archived strip certificate and the later free-θ fourth-moment
cutoff remain **R** in this pass. The historical body of the monograph and all
existing sources were left unchanged.

The following acceptance checks were inspected beyond simply repeating the
earlier green run. No new soundness defect was found in the strong peak replay.

| Part | Soundness check |
|---|---|
| `remote_stein_original/profile.py:5–17` | The monotone cubic root is bracketed, and the omitted root interval is certified by strict endpoint inequalities. The actual 377 evaluation nodes range from `1/400` to `66208393231/2500000000`; their roots are well inside the integration domain. |
| `profile.py:18–41` | For analytic callbacks, strict `|R|<sqrt(s)` or `|R|>sqrt(s)` keeps the hypergeometric argument in the unit disk. Positive series give `|A|≤2`, `|A′|≤1`; hence the returned bounds `4r`, `4|R|`, `4/r`, `2/|R|` enclose both real and imaginary parts. The square-root analytic guard remains active. A ball crossing the separation is rejected for subdivision. |
| `profile.py:42–58` | Real quadrature pieces cover the retained intervals; the omitted near-zero/root portions use nonnegative envelopes. The exponential tail beyond 64 is enclosed, not discarded. A float is used only to choose integer breakpoints, not to certify a value or a sign. |
| `verify.py:27–38` | Hermite interpolation coefficients are derived as Arb balls, and every stored rational coefficient is strictly above its entire ball. Global majorization follows from `h⁽⁴⁾≤0`, also outside the interpolation nodes. Positive cubic coefficient is checked separately. |
| `check_stein.py:29–50`, `exact.py` | Exact Bernstein checks cover every merged knot/profile cell. Multiplication by u² is canceled at zero before testing there. The final ray uses all nonnegative translated power coefficients, so no finite truncation is passed off as an infinite-tail proof. |
| `verify.py:50–81` | Disjoint-interior rectangles plus exact total area cover the closed rectangle. The central variance interpolation is for each fixed normalized law, so no regularity of optimizers is assumed. Zero variance and the whole high-variance ray have separate checks. |
| Claude's Lean mapping, prior `REMOTE.md` §3a | Read the actual theorem assumptions in `gaussian_moments`, `gaussian_steinInputs` and `spec_of_inputs`. Circular complex H₂,₁ supplies the proper normalization used by these theorems. The stated square-mesh distinction is real. No Lean build was run. |

## 2. Completed disjoint-driver cost, with larger scope

**P + C, independent analytic inspection and exact numerical replay; same-session
peer review, not external review.** Let `ℓ>0`,

    2/15 ≤ β/ℓ ≤ 4/19,   ε>0,   a=ℓ−2β,
    L=Z(a+β|Z|²),   T=|Z|².

Let Z be standard complex Gaussian, q any square-integrable complex random
variable, and U a centered proper complex Gaussian, **mutually independent**.
Then, writing `w=E|U|²`,

    Λ(q+(T−1)U) ≤ Λ(q) − [1/ε−199/(200ℓ)]w.       (D)

No cubic hypothesis, finite-dimensional restriction, circularity of q, or
amplitude restriction is required. On the application box,

    1/ε−199/(200ℓ) ≥ 1/152 > 0.

This follows by minimizing the coefficient at `ε=ℓ=19/25`. It is stronger
than merely transferring a remote cap unchanged. In particular the checked
peak remote cap now implies

    Λ(q+(T−1)U) < S+3.6e-7 − [1/ε−199/(200ℓ)]w

for remote cubics at the peak. This uses (D) directly, with no amplitude
truncation or Gaussian-buffer limit. Shared q/U drivers remain outside (D).

### Analytic bridge rechecked

Put `M_s(x)=E|x+sqrt(s)W|` and `K_s(x)=E|x+sqrt(s)W|^−1`.
The complex Gaussian heat equation is `∂_s M_s=K_s/4`. Thus one sign of the
norm increment from adding `(T−1)U` is

    (1/4)∫₀ʷ I_s(y) ds,
    I_s(y)=∫₀∞ e^−t(t−1)² E_θ K_{s(t−1)²}(r(t)e^{iθ}+y) dt.

The uniform bound below applies to y=q and y=−q; the two signs therefore
give increment at most `199w/(200ℓ)`. Independence permits conditioning on q;
visible independence and `E(T−1)=0` give
`E|q+(T−1)U|²=E|q|²+w`. Subtract the exact penalty to obtain (D).

The dimensionless potential is `ℓ I_s(y)`, with profile
`p=β/ℓ∈[2/15,4/19]` and scale `d=sqrt(s)/ℓ`. The proof uses

    r K_w(r) ≤ min(237/200, sqrt(π)r/sqrt(w+r²), 1+w/(2r²)).

For `x=r²/(2w)`, `U₀(x)=sqrt(2πx)e^−x I₀(x)`. With `m=2x(1−I₁/I₀)`,
`m′=2−2m+m²/(2x)` and `U₀′/U₀=(1−m)/(2x)`. Since `m(1)>1` and every
crossing of m=1 is upward, U₀ decreases beyond 1. Below 1,
`I₀(x)≤exp(x²/4)` gives the constant bound. The middle bound follows by
comparison of `I₁/I₀` with `2x/(1+2x)`; at a crossing the derivative
difference is `−3/(1+2x)²`. For the last bound, compare to `v=1+1/(4x)`:
the endpoint checks at `4/3` and `7/4` handle up to `9/4`, and
`(e^{2x}(vU₀′−U₀v′))′≥0` beyond `9/4` makes `U₀/v` attain its supremum
at an endpoint, where it is at most 1. Its limit at infinity is 1.
The checker certifies all finite scalar constants via positive rational
series and exact integer square roots; `π<22/7` suffices.

The weighted visible density at dimensionless radius
`R_p(x)=x[1+p(x²−2)]` is

    g_p(x)=(x²−1)² e^−x² / ([1+p(x²−2)][1+p(3x²−2)]).

On `[0,4]`, cell heights on a `1/1024` grid and backward maxima express a
majorant as a positive sum of disk indicators. On a disk whose original
x-radius is X, the Gaussian standard deviation lies between
`z=d₀(1−X²)_+` and `d₁ max(1,|X²−1|)`. Taking the supremum over this variance
interval leaves a radial decreasing kernel. A translated disk has no greater
integral than the centered disk. With `C=237/200`, an upper bound for the
centered disk integral divided by `2π` is

    D=C(R−m)+1.773(sqrt(z²+m²)−z)−(C−1)(R−F)_+²/R,
    m=min(R,17z/20),  F=(5/3)d₁ max(1,|X²−1|).

The first improvement integrates the middle kernel bound; the second integrates
the far-radius bound. They do not overlap: `m≤.85z≤.85d₁max < (5/3)d₁max=F`.
For `d₁=∞` the last term is omitted. For `x≥4`, the density decreases; extending
its value at 4 over the inner disk and integrating the outer tail bounds the
entire remainder by `1/5000`. The proof's estimates
`R_p(4)<16`, denominator product `>20`, `e^−16<1.3e-7`, and
`∫₄∞x⁴e^−x² dx≤(290/8)e^−16` are all checked or immediate rational inequalities.

The independent Python port uses integer floor/ceiling division and `isqrt`.
It verifies 12 profile intervals and 278 scale intervals, including `[1,∞)`.
Independent interval-union checks in both parameters ensure no failed box is
silently discarded. Its exact maximum is

    2188027284403/1099511627776 < 199/100.

This reproduces the old claimed integer, closing the formerly R scalar premise.
See `remote_disjoint_cost.py` and `remote_disjoint_cost_result.json`.

## 3. Independent Gaussian benchmark and supporting constants

**C.** `remote_benchmark_crosscheck.py` uses the direct Rice formula

    B(v)=sqrt(πv)∫₀∞e^−t e^−x/2[(1+x)I₀(x/2)+xI₁(x/2)]dt,
    x=t(a+bt)²/v.

The prior code replaced I₁ by integration by parts, including a finite-endpoint
correction. Keeping I₁ checks that transformation independently. The new code
uses 160-bit Arb/Acb arithmetic and explicit positive tail bounds after 64.
Its quadrature callbacks are entire in t: FLINT's scaled Bessel function is
`exp(−z)I_n(z)` for the integer orders 0 and 1, as specified in the
[FLINT reference](https://flintlib.org/doc/acb_hypgeom/index.html#modified-bessel-functions).
At `v₀=403448/10000000`, it proves

    1.3739535256614828 < B(v₀)−v₀/ε < 1.3739535256614829.

Derivative signs at `.040344` and `.040346`, strict concavity, and the tangent
at v₀ reproduce `1.3739535256614<S<1.3739535256616`.
No remote cap is inferred from the Gaussian calculation alone.

For the fixed-v₀ competitor at the peak, the same direct integrals give

    1.689944147450845 < ∂_a B(v₀) < 1.689944147450846,
    2.622896929056071 < ∂_b B(v₀) < 2.622896929056073.

Their integrands are `sqrt(π/v₀)e^−t t(a+bt)(I₀+I₁)e^−x/2`, and its
t-multiple. The tails use the norm's Lipschitz bound, respectively
`2∫₆₄∞sqrt(t)e^−t dt` and `2∫₆₄∞t^{3/2}e^−t dt`, enlarged to elementary
exponential moments. These enclosures make the support-plane construction
in section 5 quantitative. Full deterministic results are saved in
`remote_benchmark_result.json`.

## 4. Dense-test extension: retain the existing 45 duals

**P, by author; reviewed by `sector_audit` within this session, not externally reviewed.** The rational-square knot restriction
does not require changing the numerical duals at the paper-proof level.
Here is an explicit extension using only `EU=1` and `EU²<∞`, together with
the already-proved spectral cuts on rational-square meshes.

First remove the constant tail c by setting

    φ₀=φ−c,  Φ₀=Φ−cu,  β₀=β+c.

Then `d₀=d`, `f₀(new)=f₀(old)`, `g₀(new)=g₀(old)` and
`G_new=G_old−c(u−1)`, so their expectations agree. If R is the old majorant,
replace it by `R_new=R−c(u−1)`; the pointwise difference `R−h−G` and its
expected upper bound are unchanged. Thus this step costs no numerical slack.

For compactly supported continuous piecewise affine φ with rational knots and
values, choose rational R with `R²` beyond its support. Interpolate φ at
`u_j=(jR/n)²`, `j=0,…,n`. Values and square-root knots are rational. The
interpolants φ_n vanish on the final ray and converge uniformly, since their
largest u-mesh width is at most `2R²/n`. They are exactly tests of the Lean
mesh family: use `vs=[R/n,…,R]` and `z=[φ(u₀),…,φ(u_{n−1})]`, with the
final value zero supplied by `cutCells`. To justify passing their cuts to the limit, let
`δ=||φ_n−φ||∞`, `M=||φ||∞`, and set

    A_f=2t+λ/3,  A_g=t+μ/3−ν/2.

Uniformly for u≥0,

    |d_n−d|≤2δ,  |(Φ_n−φ_n)−(Φ−φ)|≤(u+1)δ,
    |f_n−f|≤δ/2,  |g_n−g|≤δ.

With the same rational λ,μ,t,β,ν in both cuts, expansion of the squares gives
the explicit expectation bound

    E|G_n−G| ≤ δ[(M+|β|)/(2λ)+|A_f|/λ
                       +2(M+|A_g|)/μ+2]
                  +δ²[1/(4λ)+1/μ].

The quadratic u-term cancels. Each cut is integrable because it grows at most
quadratically. Since `EG_n≥0` and the displayed bound tends to zero, `EG≥0`.
This proves every required rational-knot cut from the existing square-mesh
family. A future Lean port still has to formalize the approximation and limit;
it does not have to re-optimize the 45 witnesses or prove a new Gaussian IBP
formula. The direct `spec_of_inputs` theorem also avoids the unused Gram-budget
prerequisites in the older port sketch.

## 5. Convex-cell transfer, with a certified Gaussian support

**P, by author; reviewed by `sector_audit` within this session, not externally reviewed.** Fix ε. Let θ=(a,b), and let
θ₁,…,θ_m be vertices of a convex cell. Suppose the *same family* of remote q
satisfies `Λ_{θ_i}(q)≤U_i` at each vertex. Let H be any affine or concave lower
bound for the Gaussian optimum S on the cell. If

    U_i − H(θ_i) ≤ η   for every vertex i,

then `Λ_θ(q)≤S(θ)+η` throughout the cell, in every dimension.

Indeed, for barycentric weights w_i, convexity of the norm gives
`Λ_θ(q)≤Σw_iΛ_{θ_i}(q)≤Σw_iU_i≤Σw_iH(θ_i)+η≤H(θ)+η≤S(θ)+η`.
No differentiability of the optimizing Gaussian variance is required. One may
also use `(a,b,p)` with `p=1/ε`, since the penalty is affine in p. Positive
homogeneity allows the same two-dimensional shape normalization as the older
tube theorem.

For a usable H choose any fixed Gaussian variance v₀ and profile θ₀. The
function `J(θ)=2E|Z(a+bT)+sqrt(v₀)W|−v₀/ε` is convex, and `S≥J`. Therefore
`J(θ₀)+∇J(θ₀)·(θ−θ₀)` supports S globally. The value and gradient enclosures
in section 3 give the explicit **concave** lower support

    H(θ)=1.3739535256614828
        +min(g_a^-·δa,g_a^+·δa)+min(g_b^-·δb,g_b^+·δb),

where δa=a−699/1250, δb=b−179/1250 and g_a^±,g_b^± are the rational decimal
endpoints in section 3. It is valid for every real a,b at the fixed peak ε.
The minimum of the two affine alternatives correctly handles the unknown
gradient inside its enclosure; concavity makes vertex acceptance sufficient.

This is a complete reduction with an explicit certified support, **not a
certificate for an uncomputed cell**. Additional remote caps U_i are still
needed. It replaces the first-order error payment by a vertex-to-support gap.
If the optimized Gaussian benchmark is twice differentiable and the support
is tangent at an optimizing variance, Taylor's theorem makes that gap second
order in cell width; no such uniform regularity or quadratic constant is
certified here. No anchor-count bound is asserted. The old “seven million anchors” arithmetic
remains correct for its particular Lipschitz construction, not for every
possible transfer construction.

## 6. Reproduction and limits

From the repository root:

```sh
python3 -I research/conjecture-K/code/reaudit-2026-11-15-codex-a7c4/remote_disjoint_cost.py
python3 -I research/conjecture-K/code/reaudit-2026-11-15-codex-a7c4/remote_benchmark_crosscheck.py \
  --dependency-dir /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/dependencies
```

The first uses only the standard library. Omit the dependency argument for the
second if python-flint is installed normally. Both are read-only by default,
print deterministic JSON, reject `-O`, and write their saved result only when
explicitly passed `--write-result`. No original source was edited, no Lean
module was built, and no benchmark computation was mistaken for a remote
certificate. The peak remote allowance remains `3.6e-7`; the other named rows,
shared-driver finite-amplitude assembly, and the row-envelope consumer remain
open.
