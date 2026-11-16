<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-ab-sector-2026-11-15/route2/secant/EXTERIOR_PROOF.md (15 November 2026); codex-91d4, task #426. Only this line was added. -->
# Exact exterior regions for the joint secant at tilt (3/5,0)

Agent-ID: **codex-91d4**. Task #426. New results: **P+C, author only**.
These are complete bounds on stated subregions, not a full global bound.

Let `Z` be standard complex Gaussian, `T=|Z|²`,
`a=699/1250`, `b=179/1250`, `p=2500/1891`, and `L=Z(a+bT)`.
For complex `w,α,β`, write

    h=(T−2/5)α+Z²conj(β)/√2,
    Rem=2E[|L+w+h|−|L+w|−Re(h conj(ph(L+w)))],
    Q=m_A|α|²+m_B|β|²,
    m_A=p−59/100,       m_B=p−23/100.

The proposed global statement is `Rem≤Q`. Together with the retained
trial ξ=−(3/5)r_A it would give the common joint cost `23/100`.

**Proved here:** `Rem≤Q` whenever at least one of these conditions holds:

1. `|w|≥7/2`, with arbitrary amplitudes;
2. `sqrt(|α|²+|β|²)≥5`, with arbitrary w;
3. `|β|≤|α|/21` or `|α|≤|β|/56`, with arbitrary w and amplitudes.

The third item inherits the already reviewed global A-only theorem
`Rem_A≤(13/20)|α|²`. The first two do not need that theorem. All new scalar
acceptances replay through `python3 -I exterior_exact.py` using only the
standard library and the bundled outward rational interval helper.

## 1. Elementary remainder and radial density

For `V≠0`, concavity of square root and the triangle inequality give

    0≤2(|V+h|−|V|−Re(h conj(ph V)))≤|h|²/|V|,
    2(|V+h|−|V|−Re(h conj(ph V)))≤4|h|.                    (1)

The exceptional `L+w=0` has probability zero; all the inverse-distance
potentials below are finite. Weighted Cauchy–Schwarz gives

    |h|² ≤ Q P(T),
    P(t)=(t−2/5)²/m_A+t²/(2m_B)=q₂t²+q₁t+q₀,             (2)

where

    q₂=1/m_A+1/(2m_B), q₁=−4/(5m_A), q₀=4/(25m_A).

The map `Z↦L` has positive Jacobian `(a+bt)(a+3bt)`. The pushforward
of `P(T)` times Gaussian measure therefore has planar density

    exp(−t)P(t)/[π(a+bt)(a+3bt)].                         (3)

Its mass above T=c is exactly

    M(c)=exp(−c)[q₂(c²+2c+2)+q₁(c+1)+q₀].                 (4)

For any nonnegative planar measure of mass m and density at most D/π,
its inverse-distance potential at any center is at most `2sqrt(mD)`.
To see this, its ball mass is at most `min(m,Dr²)`, and integrating that
bound against `r^−2 dr` gives the assertion. This argument applies to
the entire outer source region and needs no lower bound on `|L+w|` there.

## 2. All amplitudes for |w|≥7/2

By rotational symmetry take `|w|=X`. For `r<X`, expansion of
`(1+(r/X)e^(iθ))^−1/2` and its conjugate and angular integration give

    E_θ 1/|X+r e^(iθ)|
      =(1/X)∑_(k≥0) a_k(r²/X²)^k,
    a_k=(binom(2k,k)/4^k)².                               (5)

The coefficients are positive and decreasing. Thus the mean increases
with r and decreases with X whenever r<X, and its series is bounded by

    A_N(z)=∑_(k=0)^(N−1)a_k z^k+a_N z^N/(1−z).             (6)

Set `X₀=7/2`, `c=6`, `n=200`, `N=24`, `t_j=cj/n`.
The checker proves `c(a+bc)²<X₀²`. On the j-th radial cell,
the angular potential is at most `A_N(t_(j+1)(a+bt_(j+1))²/X₀²)/X₀`.
The exact cell mass is `M(t_j)−M(t_(j+1))`. Hence the inner potential
for every X≥X₀ is at most

    I=(1/X₀)∑_[j=0,n−1] [M(t_j)−M(t_(j+1))]
                     A_N(t_(j+1)(a+bt_(j+1))²/X₀²).       (7)

For t≥6 the numerator `exp(−t)P(t)` decreases: the three coefficients
of `P(6+y)−P'(6+y)` are strictly positive. The denominator in (3)
increases. Thus the outer density is at most `D/π`, where

    D=exp(−6)P(6)/[(a+6b)(a+18b)].

By the preceding mass/density lemma the outer potential is at most
`2sqrt(M(6)D)`. The exact outward checker accepts

    I+2sqrt(M(6)D)<49/50<1.                               (8)

Equations (1), (2) and (8) prove `Rem≤(49/50)Q<Q` unless α=β=0,
where the statement is equality. The certificate encloses an upper
expression, not the exact supremum of the potential.

## 3. All w at total amplitude at least five

Since `E|T−2/5|=2exp(−2/5)−3/5<3/4` and `E T=1`, (1) gives

    Rem≤3|α|+2sqrt(2)|β|.                                 (9)

The strict moment comparison follows from
`exp(2/5)>∑_(k=0)^3(2/5)^k/k!>40/27`; no floating-point exponential
is used to accept it.

Put `R=sqrt(|α|²+|β|²)`, `A=|α|/R`, `B=|β|/R`, so A²+B²=1.
For R≥5, it suffices to show `5(m_A A²+m_B B²)≥3A+2sqrt(2)B`.
Complete the two squares with a multiplier 2 for A²+B²:

    5(m_A A²+m_B B²)−3A−2sqrt(2)B
      ≥2−9/[4(5m_A−2)]−2/(5m_B−2)>0.                     (10)

Both denominators and the final rational slack are checked exactly.
This proves the large-amplitude region at every complex w.

## 4. All w and amplitudes in the two axis cones

For the B-axis direction, the pushforward density of `T²/2` times
Gaussian measure is

    t² exp(−t)/[2π(a+bt)(a+3bt)]≤(7/25)/π.                (11)

On `[0,2]` the checker proves (11) with the degree-16 Taylor lower
bound for exp(t): all Bernstein coefficients of
`(14/25)(a+bt)(a+3bt)∑_(k=0)^16 t^k/k!−t²` are positive on `[0,1]`
and `[1,2]`. For t≥2 the left side of (11) decreases, by its logarithmic
derivative. Its total mass is one. Thus (1) and the mass/density lemma
give

    Rem_B≤2sqrt(7/25)|β|²<(53/50)|β|².                    (12)

At a fixed base w, the remainder is a convex nonnegative function of
the perturbation, vanishing at zero. For 0<λ<1, real convexity gives

    Rem(α,β)≤λ Rem_A(α/λ)+(1−λ)Rem_B(β/(1−λ)).             (13)

Combine the inherited A bound `13/20`, the new B bound `53/50`, and
optimize λ. With the zero axes treated directly this yields

    Rem≤(sqrt(13/20)|α|+sqrt(53/50)|β|)²
       ≤(13/20)|α|²+(53/50)|β|²+(5/3)|αβ|.               (14)

The mixed coefficient comparison is checked by squaring. If
`|β|≤|α|/21`, subtracting (14) from Q leaves at least
`[m_A−13/20−(5/3)/21]|α|²`, strictly positive away from zero.
If `|α|≤|β|/56`, it leaves at least
`[m_B−53/50−(5/3)/56]|β|²`. Both rational brackets are positive.

## 5. Remaining compact geometry and review boundary

The uncovered set satisfies

    |w|<7/2, 0<R<5, |α|/21<|β|<56|α|.

There are still five real parameters after simultaneous rotation.
No compact checker or uniform small-amplitude joint Hessian bound has
been accepted here. The monotone projected cubic in `GEOMETRY.md`
provides a nonsingular Hessian representation for R<sqrt(2ab), but a
representation alone does not upper-bound that Hessian by the target.

The checker depends on the bundled, previously reviewed exact interval
helper. It does not repeat the A-only global certificate or audit that
helper line by line. New proofs and new scalar acceptances need external
review before any P/C label without the author-only qualification.
