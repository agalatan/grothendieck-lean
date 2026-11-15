<!-- Original research note by codex-a7c4, 15 November 2026; Refs #400. -->
# Complete monotonicity, both content kernels, and a larger mixed-shell neighbourhood

Agent-ID: codex-a7c4. Baseline: `39ae5c2393372213b52db6dcbfd647605e6d7e8b`.
**P by its author, pending independent external review; C only for the explicit
finite scalar calculations in section 7.** No Lean formalization is claimed.

The complete-monotonicity input left inherited by
`../reaudit-2026-11-15-codex-a7c4/REVIEW_claude-b9ee.md` is valid. This note supplies
the missing all-order derivative induction, the Gaussian integral transformations,
and their integrability conditions. It extends that argument to the B kernel and
gives global derivative envelopes. A sharper off-character chaos estimate then
enlarges the conditional content neighbourhood from `D(p)/100` to `D(p)/90`.
The core content inequality remains a hypothesis; arbitrary cubic content,
the A/B/odd assembly, Conjecture K and any new Grothendieck endpoint remain open.

## 1. Definitions and the positive recurrence

Let `Z` be standard complex Gaussian, `T=|Z|²`, `a>0`, `b≥0`, and

    A(t)=a+bt,   J(t)=a+3bt,   H(t)=t A(t)²,   L=Z A(T).

Use `J` here to avoid confusing this linear denominator with the scalar benchmark
`B(v)`. The map H is a smooth increasing bijection of `[0,∞)`; write `h=H⁻¹`.
Define functions of s by

    f_D(H(t))=e^(−t)/(A J),       f_A(H(t))=e^(−t)/A²,
    f_B(H(t))=e^(−t)/(A³ J),     f_C(H(t))=e^(−t)/(A⁴ J).

For `c,p,q≥0`, the elementary identity

    −d/ds [e^(−ct) A^(−p) J^(−q)]
      = c e^(−ct) A^(−p−1) J^(−q−1)
        + p b e^(−ct) A^(−p−2) J^(−q−1)
        + 3q b e^(−ct) A^(−p−1) J^(−q−2),     s=H(t),                 (1)

has nonnegative coefficients. Iterating (1) proves complete monotonicity to
**every derivative order**, including the right derivatives at zero, for all
four displayed functions and for `e^(−h(s))`. It also proves complete
monotonicity of `h′(s)=1/(A(h(s))J(h(s)))` by taking `c=0,p=q=1`.
All the derivatives at zero are finite since `a>0`.

We use the standard Bernstein representation theorem: a completely monotone
function on `(0,∞)` is the Laplace transform of a unique positive Borel measure;
the measure is finite when the function has a finite limit at zero. The precise
statement, including uniqueness and the finiteness criterion, is Theorem 2.6,
p.1608 of [Ehrnström–Wahlén, *Ann. IHP AN* 36 (2019)](https://www.numdam.org/item/10.1016/j.anihpc.2019.02.006.pdf),
which cites Theorem 1.4 of [Schilling–Song–Vondraček, *Bernstein Functions*,
second edition](https://www.degruyterbrill.com/document/doi/10.1515/9783110269338/html).
This standard representation theorem is an external analytic dependency; its
proof is not replaced by a finite computation here.

Write `f_i(s)=∫e^(−λs) μ_i(dλ)` for `i=D,A,B,C`. These are finite positive
measures, have no atom at zero because `f_i(s)→0`, and have every nonnegative
integer moment finite. Indeed differentiation is valid for `s>0`, and monotone
convergence as `s↓0` gives

    ∫λⁿ μ_i(dλ) = (−1)ⁿ f_i^(n)(0) < ∞.                          (2)

This proves positivity of the actual measures, not positivity inferred from a
finite list of derivative values or a numerical graph.

## 2. Gaussian identities and the scalar deficit assumptions

The density of L on the plane is `f_D(|y|²)/π`. Since its integral is one,
Tonelli gives `∫λ⁻¹ μ_D(dλ)=1`; consequently it is the probability mixture of
densities `(λ/π)e^(−λ|y|²)` with mixing measure `λ⁻¹ μ_D(dλ)`. Thus

    L has the law √V W,     V>0,     E V=a²+4ab+6b².              (3)

Here W is standard complex Gaussian independent of V. This establishes the
scale-mixture statement in baseline STATUS 2.7 without assuming it.

For a complex Gaussian `Y_λ` of variance `1/λ`, put

    M_λ(z)=E|Y_λ+z|,   K_λ(z)=E|Y_λ+z|⁻¹,   v=|z|².

The elementary identity `r⁻¹=π^(−1/2)∫₀∞u^(−1/2)e^(−u r²)du`, Gaussian
completion of the square, and `u=λw/(1−w)` give

    K_λ(v)=√(λ/π) ∫₀¹ e^(−λvw)/√(w(1−w)) dw
          =√π √λ E_θ e^(−λv cos²θ).                            (4)

The angular average is over a uniform angle. Equivalently it is
`e^(−λv/2)I₀(λv/2)`, consistent with
[DLMF 10.32.1](https://dlmf.nist.gov/10.32.E1). All integrands in this derivation
are nonnegative, so Tonelli applies. The plane identity `Δ|z|=1/|z|` is valid
distributionally with no point mass: the flux at a circle of radius r is `2πr`,
which tends to zero. Gaussian convolution therefore gives `ΔM_λ=K_λ`.
Differentiating the Gaussian density, or its heat equation, yields

    −∂_λ M_λ(v) = K_λ(v)/(4λ²)
                 = (√π/4)λ^(−3/2) E_θ e^(−λv cos²θ).           (5)

Let `Φ(z)=φ(|z|²)=2E|L+z|`. For each Gaussian component, radial integration of
`Δ(2M_λ)=2K_λ` gives

    d/dv [2M_λ(v)] = (1/2)∫₀¹ K_λ(vr) dr.

Mixing (4) proves that `φ′` is completely monotone. Its endpoint is finite:

    φ′(0)=(1/2)E|L|⁻¹=∫₀∞ e^(−r²)/(a+br²) dr.                (6)

Convexity of Φ and `φ″≤0` give `0≤D²Φ≤2φ′(0)I`. For the matched-variance
benchmark `B(v)=E_W φ(v|W|²)`, (3) gives

    B(v)=√π E√(V+v),
    B′(v)=(√π/2)E(V+v)^(−1/2)
          ≥ √π/[2√(a²+4ab+6b²+v)].                            (7)

Differentiation at zero is legitimate since (6) is finite; elsewhere it follows
from domination by the endpoint. Jensen applies to the convex function
`x↦(x+v)^(−1/2)`. These arguments check the concavity and derivative assumptions
used in the earlier content extension.

## 3. The A and B kernels as positive Laplace mixtures

Use the conventions

    Ψ_A(z)=E[(T−1)ph(L+z)] = z g_A(|z|²),    k_A=−g_A,
    Ψ_B(z)=E[(Z²/√2) overline(ph(L+z))] = z g_B(|z|²),   k_B=−g_B.

Thus `g_A` is the manuscript's `g`, and the B shell is normalized as
`Z² overline(r_B)/√2`. The phase at zero can be assigned any value, since the
probability of that event is zero for each fixed z.

### A kernel

Let `m(r,z)=E_θ|r e^(iθ)+z|` and
`P_A(v)=E[(T−1)|L+z|]`. The function m is even and convex in r, so `m_r≥0`
almost everywhere, with `|m_r|≤1`. Integration by parts using
`(t−1)e^(−t)=−(te^(−t))′`, followed by `r²=H(t)`, gives

    P_A(v)=∫₀∞ r² f_A(r²) m_r(r,z) dr.

The endpoint terms vanish (at zero the factor t vanishes; at infinity the
exponential dominates). Insert the measure μ_A using Tonelli. A radial
integration by parts in the normalized Gaussian expectation gives

    ∫₀∞ r²e^(−λr²)m_r(r,z)dr = −∂_λ M_λ(z).

Equation (5) yields

    P_A(v)=(√π/4)∫λ^(−3/2) E_θ e^(−λv cos²θ) μ_A(dλ).

At zero the original integral is
`P_A(0)=√π(a/4+9b/8)<∞`; therefore `∫λ^(−3/2)μ_A<∞`.
Together with (2), this justifies every derivative of the last display on
`v≥0`, including its right derivatives at zero. Taking the planar gradient,
`Ψ_A(z)=2z P_A′(v)`, proves

    k_A(v)=(√π/2)∫λ^(−1/2)
                       E_θ[cos²θ e^(−λv cos²θ)] μ_A(dλ).      (8)

This is a finite positive Laplace mixture in v, with all moments finite.

### B kernel

Changing variables `y=L(Z)` gives the exact convolution

    Ψ_B(z)=(1/(π√2))∫_C y² overline(ph(y+z)) f_B(|y|²) d²y.   (9)

Indeed `Z²=y²/A²`, and the pushed-forward density is `e^(−t)/(πAJ)`.
This time the integrand is complex, but its absolute value is bounded by
`|y|² f_B(|y|²)`, whose planar integral divided by π is

    ∫₀∞ s f_B(s)ds=∫₀∞ t e^(−t)dt=1.

Thus Fubini with μ_B is justified, equivalently `∫λ⁻² μ_B(dλ)=1`.
For each Gaussian component use Wirtinger derivatives
`∂_z=(∂_x−i∂_y)/2`, `∂_barz=(∂_x+i∂_y)/2`. Twice integrating derivatives
of the Gaussian density, rather than differentiating the singular phase
pointwise, gives

    (1/π)∫_C y² overline(ph(y+z)) e^(−λ|y|²)d²y
       = λ⁻³ E[∂_barz² overline(ph(Y_λ+z))]
       = (1/(2λ³))∂_barz K_λ(z).                              (10)

For clarity, `overline(ph)=2∂_z|·|`; hence
`∂_barz² overline(ph)=(1/2)∂_barz Δ|·|` as distributions. Convolution by a
Gaussian makes this smooth, which proves (10) without a nonintegrable
pointwise phase derivative. Substituting (4) into (9)–(10) proves

    k_B(v)=(√π/(2√2))∫λ^(−3/2)
                          E_θ[cos²θ e^(−λv cos²θ)] μ_B(dλ).  (11)

The negative moment needed here follows from `∫λ⁻² μ_B=1` and finiteness of
μ_B; positive moments follow from (2). Again this is a finite positive
Laplace mixture in v, with all moments finite. In particular **both k_A and
k_B are completely monotone**, for all `a>0,b≥0`, not just at three rows.

### A signed comparison that is also completely monotone

The exact identity `−f_A′=f_B+2b f_C`, together with uniqueness of Laplace
representations and (2), gives `λ μ_A=μ_B+2b μ_C`. From (8)–(11),

    k_A(v)−√2 k_B(v)
       = b√π ∫λ^(−3/2)E_θ[cos²θ e^(−λv cos²θ)] μ_C(dλ).      (12)

This is completely monotone and nonnegative. It is positive if `b>0`, and
zero if `b=0`. Its integrability follows from the measure identity when
`b>0`; the zero case is immediate. Therefore the inequality
`(−1)^j k_A^(j)≥√2(−1)^j k_B^(j)` holds at every order and every `v≥0`.
This comparison alone does not prove the much tighter `.5053/.007` target.

## 4. Endpoint derivative moments, including the curvature certificate

Let `C_n=E cos^(2n)θ=binom(2n,n)/4ⁿ`, and let
`M_j^A=(−1)^j k_A^(j)(0)`, `M_j^B=(−1)^j k_B^(j)(0)`.
Equations (8)–(11) and Tonelli give the nonsingular Mellin formulas

    M_j^A=(C_(j+1)/2)∫₀∞ s^(−1/2)(−∂_s)^j f_A(s)ds,  j≥0,
    M_j^B=(C_(j+1)/(2√2))∫₀∞ s^(−1/2)(−∂_s)^(j−1)f_B(s)ds, j≥1,
    M_0^B=(1/(2√2))∫₀∞ √t e^(−t)/(a+bt)dt.                  (13)

For example, `∫s^(−1/2)e^(−λs)ds=√π λ^(−1/2)` and
`C_3=5/16`, so the curvature factors are exactly `5/32` and `5/(32√2)`.
Under `s=H(t)`, `s^(−1/2)ds=J(t)dt/√t`. Apply (1), then put `t=r²`:
each term `c e^(−t)A^(−p)J^(−q)` becomes
`2c e^(−r²)A(r²)^(−p)J(r²)^(1−q)dr` in the integral. In particular,

    M_1^A=(3/16)∫₀∞ e^(−t)t^(−1/2)[A^(−3)+2b A^(−4)]dt,
    M_1^B=(3/(16√2))∫₀∞ e^(−t)t^(−1/2)A^(−3)dt.            (14)

This positive formula independently recovers the older signed-density
calculation of `M_1^A`. Complete monotonicity proves the global envelopes
`|g_i^(j)(v)|≤M_j^i`. If `v>0,j≥1`, the positive v-Laplace representation
also gives the useful bound

    |g_i^(j)(v)| ≤ (j/(e v))^j M_0^i.                        (15)

Here e denotes Euler's number. This bound follows by maximizing
`t^j e^(−vt)`; it has no extra factorial. These statements provide the
analytic continuum input for the separate `ALIGNMENT.md` certificate.

At the peak `a=699/1250,b=179/1250`, the exact checker encloses:

| j | `M_j^A` | `M_j^B` |
|---|---|---|
| 0 | (0.835135932614129, 0.835135932614130) | (0.422028097139578, 0.422028097139579) |
| 1 | (2.159180864970276, 2.159180864970277) | (1.032202342636649, 1.032202342636650) |
| 2 | (11.692061679509533, 11.692061679509534) | (5.367695368406354, 5.367695368406355) |
| 3 | (107.008779841537586, 107.008779841537587) | (47.777949142878429, 47.777949142878430) |
| 4 | (1442.955227801373920, 1442.955227801373921) | (631.920428453666175, 631.920428453666176) |

The corresponding flank and upper-row intervals are in the JSON output.
These are finite scalar **C** facts; the all-order conclusion uses the proof.

## 5. Full audit of the derivative norm input

For the atom `F_t(z)=z e^(−t|z|²)`, its two real derivative eigenvalues are
`e^(−x)` and `(1−2x)e^(−x)`, `x=t|z|²`, whose absolute values are at most one.
For a unit real vector u, put `y=cos²(angle(z,u))`. Direct differentiation gives

    |D²F_t(z)[u,u]|²/t
      =e^(−2x)x[4+16(2−x)y+16x(x−2)y²].                       (16)

For `0≤x≤1/2` its maximum over y is
`4x(3−2x)²e^(−2x)≤4`. To verify the inequality without a numerical maximum,
use the cubic Taylor lower bound for `e^(2x)`; three times the resulting
polynomial difference is `3−21x+42x²−8x³`. Its cubic Bernstein coefficients
on `[0,1/4]` and `[1/4,1/2]` are respectively
`(3,5/4,3/8,1/4)` and `(1/4,1/8,3/4,2)`, all positive. For
`1/2≤x≤2`, the maximum is `8e^(−2x)≤8/e<4`. For `x≥2` the maximum is at an
endpoint in y and bounded by `16x³e^(−2x)≤128e^(−4)<4`.
The simple strict exponential inequalities follow already from their positive
power series (`e>2`, `e⁴>32`). Thus the diagonal Hessian norm is ≤`2√t`.

This also bounds the full real bilinear operator norm: dualize the output by
a unit real linear functional, apply the scalar spectral theorem to the
resulting symmetric bilinear form, then take the supremum over output
functionals. No off-diagonal Hessian estimate is being assumed.

Apply these atom bounds to the finite positive v-Laplace measure ν_A in
(8). Its zeroth and first moments are `M_0^A,M_1^A`. Dominated differentiation
and Cauchy–Schwarz give

    ‖DΨ_A‖∞≤M_0^A,
    ‖D²Ψ_A‖∞≤2∫√t ν_A(dt)≤2√(M_0^A M_1^A).                  (17)

This completes the analytic gap in the older CONTENT section 3, including
the derivative interchange at zero and the Hessian operator convention.

## 6. The sharper conditional neighbourhood

Use the peak profile. Let remote coordinates split into orthogonal blocks
X,Y, let `p,h∈H_(2,1)`, let p have character one under simultaneous rotation
of X, and let h have zero component of that character. Set

    F(q)=E Φ(q),   C(q)=‖Π_(1,0)Ψ_A(q)‖₂,
    D(q)=B(‖q‖₂²)−F(q),   D₀=D(p),   ε=‖h‖₂².

Assume

    ‖p+h‖₂²≤463/10000,    D₀>0,    C(p)²≤(9/40)D₀.

Then the new assertion, in every finite dimension, is

    ε≤D₀/90   ⇒   C(p+h)²≤(6/25)D(p+h).                     (18)

### A sharp weighted chaos estimate

Let ℓ be any unit holomorphic Gaussian linear form in X. Every Wick monomial
of h has at least one particle outside X: any pure-X term of bidegree (2,1)
has X-character one and is absent. Rotate coordinates unitarily within X to
make ℓ the first coordinate. Its occupancy in each remaining monomial is at
most two. Expand h in normalized complex Hermite polynomials `H_pq(ℓ)`;
the coefficient for occupancy (p,q) is a chaos of complementary bidegree
`(2−p,1−q)`. Different pairs have orthogonal coefficients in the remaining
coordinates, so multiplying by a radial function of ℓ introduces no cross
terms. The permitted pairs and their normalized weighted squared norms are

| (p,q) | `E[\|ℓ\|\|H_pq(ℓ)\|²]/(p!q!)` |
|---|---|
| (0,0) | `√π/2` |
| (1,0), (0,1) | `3√π/4` |
| (2,0) | `15√π/16` |
| (1,1) | `7√π/8` |

These are elementary exponential moments; `H_11=|ℓ|²−1`. Consequently

    E[|ℓ||h|²] ≤ (15√π/16) ε.                               (19)

The constant is sharp: `h=ℓ² overline(Y_1)/√2` for one independent unit
coordinate outside X has norm one, X-character two, and attains it. If there
is no outside coordinate, the off-character h is zero. This step uses the
pure bidegree and excluded-character hypotheses essentially.

### The ledger must retain cubic-chaos membership

Baseline STATUS 6.3.9–6.3.9a listed the character and core conditions but did
not explicitly retain the source's assumption `p,h∈H_(2,1)`. It is essential
to the weighted estimate just proved. For independent standard complex X,Y,
let `h_R=Y 1{|X|>R}/sqrt(P(|X|>R))`, for any R>0. This is square integrable,
has norm one and X-character zero, but

    E[|X||h_R|²]=E[|X| conditional on |X|>R]>R.

Thus character exclusion alone gives no universal constant in (19). This
example refutes that proof shortcut, not the content theorem under its
correct cubic hypotheses. The living ledger now states membership explicitly;
all source proofs are preserved. This scope correction also applies when
reading the older /100 and .006D neighbourhood summaries.

### Perturbation and exact budget

Put `c₀=Π_(1,0)Ψ_A(p)`. Rotation covariance puts c₀ in the X linear subspace.
For each character `k≠1` of h, the two real-linear derivative terms have
characters k and `2−k`. Circle averaging therefore proves

    E DΦ(p)[h]=0,
    E overline(c₀)DΨ_A(p)[h]=0.

Also `‖p+h‖₂²=‖p‖₂²+ε`. For constants `l,H,d,β` with
`‖DΨ_A‖≤l`, `‖D²Ψ_A‖≤H`, `φ′(0)≤d`, `B′≥β` on the energy interval,
Taylor's theorem, (19), projection contraction and these cancellations give

    D(p+h)≥D₀−(d−β)ε,
    C(p+h)²≤C(p)²+[l²+(15√π/16)H C(p)]ε.                    (20)

For the second inequality, the cross term is twice the pairing with the
Taylor remainder, whose pointwise bound is `(H/2)|h|²`; the factor two
cancels. This covers c₀=0 as well. Convexity of Φ, `E p=0`, and concavity of
φ imply `F(p)≥φ(0)` and `B(v)≤φ(0)+dv`; hence
`C(p)²≤(9/40)d(463/10000)`.

The exact checker verifies the following strict peak bounds:

    l=.83514,  H=2.6857,  d=1.432,  C(p)<.12214,
    β=.98937,  15√π/16<1.66168.

Here H comes from (17), β from (7), and every decimal is the indicated exact
rational number. The resulting coefficient in (20) is

    l²+1.66168 H(.12214)+(6/25)(d−β)
      =8429832706429/6250000000000
      =1.34877323302864 < 27/20.

Subtracting `(6/25)D(p+h)` therefore yields

    C(p+h)²−(6/25)D(p+h) < −(3/200)D₀+(27/20)ε≤0

under (18). This increases the permitted remainder **energy** by `10/9`
over the previous `D₀/100`, and the norm radius by `√(10/9)`. The same
estimates fail the `D₀/89` budget; the checker includes that negative control.
No error in the older `D₀/100` or `(3/500)D₀` theorem is alleged.

## 7. Reproduction, coverage, and limits

Run from the repository root:

    python3 -I research/conjecture-K/code/third-audit-2026-11-15-codex-a7c4/content_kernels_exact.py

The standard-library script rejects `-O`, prints JSON, and does not write
files. Saved output is
`../../code/third-audit-2026-11-15-codex-a7c4/content_kernels_exact_result.json`.
It reuses the outward 220-bit rational interval arithmetic and rational
pi/exp/erf series from the older `odd_cost_check.py`, recomputing all inputs.
It uses the new positive recurrence (1) and exact partial fractions with
`J=3A−2a`, verified after clearing denominators. The only transcendental
integrals needed are

    I_k(a,b)=∫₀∞ e^(−r²)/(a+br²)^k dr,
    I_0=√π/2,   I_1=π exp(a/b)erfc(√(a/b))/(2√(ab)),
    I_(k+1)=[(2k−1−2a/b)I_k+(2/b)I_(k−1)]/(2ka).

The recurrence follows by integrating the derivative of
`r e^(−r²)/(a+br²)^k`. Only the three rows with `b>0` are computed by this
formula; the analytic CM results also cover `b=0`. This independently
recovers the old M₀,M₁ intervals and computes derivatives through order four,
the occupancy weights, Hessian Bernstein coefficients and the new exact
budget. It does not mechanically prove the analytic induction, distribution
identities, chaos decomposition or inequalities between functions.

This pass read baseline STATUS 6.2–6.3 and their cited audit summaries. The
following scope table distinguishes fresh work from inherited certificates;
line numbers are at the baseline commit named above.

| baseline claims | location | work in this pass |
|---|---|---|
| 2.7; 6.3.9, 6.3.9a | STATUS lines 109, 195–196; previous CONTENT §§2–3 | Full fresh CM/mixture/derivative proof, cancellation and perturbation rederivation; exact scalars rerun through independent positive formula; strengthened to (18). No failure found. |
| 6.2.1–6.2.2 | STATUS lines 175–176 | Cost theorem and its prior exact replay inherited; no fresh rectangle replay and no label upgrade of the older R claim. |
| 6.2.3–6.2.5 | STATUS lines 177–179 | Rechecked the scalar completion and projection/logic scopes: minimizing cost uses the full content vector, retains response feasibility and does not prove raw K. No new defect. |
| 6.3.1–6.3.4 | STATUS lines 187–190 | Rechecked moment/projection and driver/coefficient split scopes against CERT; prior Wick enumeration and millions of rectangles inherited. No new all-cubic inference. |
| 6.3.5–6.3.8 | STATUS lines 191–194 | Checked Hermitian/real-phase and energy restrictions, the R numerical premises of the Wick neighbourhood, and distinction between deficit identity and content bound. Saved scalar chain and old numerical premises not regenerated. |
| 6.3.10–6.3.12 | STATUS lines 197–199 | Historical/superseded R and scalar-only limitations preserved; no general tensor identity proof supplied here. |
| 6.3.13–6.3.18 | STATUS lines 205–210 | Open statements remain open. The new neighbourhood is conditional and does not fill their uncovered domains. |

The previously identified issue is an omitted rederivation in an otherwise
explicitly inherited analytic dependency, rather than a false theorem. This
note closes that review gap and records new kernel and neighbourhood results.
The coordinating worker independently checked the positive recurrence, both
Gaussian integral transformations, measure integrability, endpoint moments,
the atom Hessian bound, the off-character occupancy estimate and the final
budget. This is a within-session peer check, not external Claude-side review.
All prior sources and the historical monograph body are preserved verbatim.
