<!-- New fifth-audit note. Agent-ID: codex-a7c4. Refs #411. -->
# Joint remainder: complete tail provenance and a smaller shift domain

Agent-ID: codex-a7c4. Baseline `0882c67d3f7dbfd02f821cad48808440643f802d`,
after merged #409. New proofs are **P by author, not externally reviewed**;
the scalar acceptances below are **C**, with the named exact checker.
The original compact finite-amplitude joint inequality remains **open**.

This addresses comment 1 and the two spectral suggestions in the
[#409 review](REVIEW_409_claude-b9ee.md). That review re-derived the
Gaussian-tail/closing steps of the 13-November reduction but checked its
global constants only numerically. Sections 2–3 below re-derive those
steps and freshly certify every scalar input. Section 4 then improves
the shift cutoff from 17/4 to **29/10**, at all three named rows.
This is a new sufficient tail bound, not a claim that 2.9 is optimal.

## 1. Statement

Let Z be standard complex Gaussian, T=|Z|², L=Z(a+bT), p=1/ε.
For fixed x,α,β∈ℂ put

    h=(T−1)α+Z² conjugate(β)/sqrt(2),
    R(V,h)=2(|V+h|−|V|−Re(h conjugate(ph V))),
    r_x(α,β)=E_Z R(L+x,h),     S₀=|α|²+|β|².

The three rows are the peak, flank and upper rows of STATUS, with a,b>0.
For every x,α,β at those rows,

    |x|≥29/10  ==>  r_x(α,β)≤(187/200) S₀.          (1)

The signed and robust targets are

    Q_s=(p−.24)|α|²+(p−.26)|β|²−.236 Re(α conjugate(β)),
    Q_r=(p−.24)|α|²+(p−.26)|β|²+.236 |αβ|.

Both satisfy, on |x|≥29/10 and with no amplitude restriction,

    Q_s−r_x ≥ .007 S₀,     Q_r−r_x ≥ .007 S₀.       (2)

Consequently the original Gaussian-tail reduction at shell variance cap
.0113 and amplitude radius .4 requires its compact premise only on

    0≤x≤2.9,    |α|,|β|≤.4,

with both relative phases retained. The diagonal reserves remain
.0000753 for Q_r or .0000807 for Q_s. This domain is 58/85 of the previous
[0,4.25] shift interval, and 29/60 of the original [0,6] interval.
There is still no certificate for the remaining compact premise.

## 2. Re-derived global majorant, with certified density caps

For V≠0, convexity and the square-root tangent inequality give

    0≤R(V,h)≤|h|²/|V|.                            (3)

The isolated zeros of L+x have zero Gaussian measure. Push forward the
weighted measures (T−1)²dγ and (T²/2)dγ under Z↦L(Z). Both have mass one,
and their planar densities at L(Z) are

    ρ_A=(T−1)²e^(−T)/[π(a+bT)(a+3bT)],
    ρ_B=T²e^(−T)/[2π(a+bT)(a+3bT)].

The denominator is the area Jacobian: the derivative of
|L|²=T(a+bT)² is (a+bT)(a+3bT). For all T≥0,
(T−1)²e^(−T)≤1. On [0,1] this is immediate; beyond 1 the only positive
maximum is 4e^(−3)<1. Therefore ρ_A≤1/(πa²).

For B, the row-specific caps ρ_B≤M/π are

| Row | M |
|---|---|
| peak | 7/25 |
| flank | 11/40 |
| upper | 13/50 |

Here is a short exact certificate for each, replacing the unreviewed
numerical check. Since e^t≥Σ_{j=0}^{16}t^j/j! on t≥0, it suffices on
[0,2] to prove positivity of the degree-18 rational polynomial

    P_M(t)=2M(a+bt)(a+3bt)Σ_{j=0}^{16}t^j/j!−t².

Its Bernstein controls are strictly positive on [0,1] and [1,2]. The
checker computes every control directly from the rational power
coefficients, with the minima recorded in JSON. There are six cells
in total; their smallest minimum is greater than .01003. For t≥2,
t²e^(−t) is nonincreasing and the denominator increases, so the endpoint
at 2 controls the entire remaining ray. This proves all three density
caps on [0,∞), without numerical quadrature.

A nonnegative planar measure of mass m and density at most d/π has
inverse-distance potential at most 2sqrt(md), uniformly in the center.
Indeed, for any radius r>0,

    ∫1/|z−x| dμ(z) ≤ m/r + (d/π)∫_{|z−x|<r}(1/|z−x|−1/r) dz
                    = m/r+dr.

Optimize r; zero mass is immediate. Applying this to the two measures gives

    J_A(x)=E[(T−1)²/|L+x|]≤2/a≤179/50,
    J_B(x)=E[T²/(2|L+x|)]≤2sqrt(M)≤53/50.

Cauchy–Schwarz for the mixed term in (3) and
sqrt((179/50)(53/50))≤39/20 now yield, uniformly in x and amplitudes,

    r_x(α,β)≤(179/50)|α|²+(53/50)|β|²+(39/10)|αβ|. (4)

The checker verifies each of these last rational comparisons. Since
p≥33/25 at all three rows, subtracting the targets gives

    r_x−Q_r ≤ (5/2)|α|²+(458/125)|αβ| ≤ (7/2)S₀,
    r_x−Q_s ≤ (5/2)|α|²+(517/125)|αβ| ≤ (15/4)S₀. (5)

The final inequalities are positivity of two real symmetric matrices:
diagonals (1,7/2), off-diagonal −229/125 for the first; diagonals
(5/4,15/4), off-diagonal −517/250 for the second. Both determinants
are strictly positive, checked exactly. This reconstructs the original
all-shift majorant rather than treating a successful script as its proof.

## 3. Gaussian amplitude tails and closing, with arbitrary sharing

Let α,β be holomorphic linear forms in remote standard complex Gaussians,
with variances v_A,v_B≤w=.0113. They may be perfectly correlated, and a
remote core q may share all their variables. For radius R define
E={|α|>R or |β|>R}, S₀=|α|²+|β|² and

    s=R²/w,     δ=2(1+s)e^(−s).

For v_A>0, the exponential law of |α|² gives

    E[|α|²; |α|>R]=v_A(1+R²/v_A)e^(−R²/v_A).

For v_A,v_B>0 let c be the squared correlation. Complex Gaussian linear
regression gives α=aβ+ξ with ξ independent of β and

    E[|α|² | β]=v_A(1−c)+c(v_A/v_B)|β|².

Integrating the event |β|>R thus gives

    E[|α|²; |β|>R]=v_A(1+cR²/v_B)e^(−R²/v_B).

At zero variance the corresponding variable/event is zero and the same
upper bounds follow directly. The function (1+t)e^(−t) decreases on
t≥0, and c≤1. The union bound consequently proves

    E[S₀ 1_E]≤δ(v_A+v_B).                          (6)

This is an energy-weighted tail bound. It requires no independence from
q. A hypothetical compact-amplitude estimate
r_x≤Q−ηS₀, uniform in x, may be evaluated at x=q. Combining it on
E-complement with (5) on E gives

    E[r_q−Q]≤[−η+(η+K)δ](v_A+v_B),

where K=7/2 for Q_r and K=15/4 for Q_s. Therefore

    η≥Kδ/(1−δ)                                   (7)

closes the reduction. For Q_r use E|αβ|≤sqrt(v_Av_B); for Q_s retain
the signed covariance E[α conjugate(β)]. All statements hold in every
finite dimension. Since (5) is uniform in q, no pointwise or tail bound
on the cubic q is inferred from its energy.

The new checker freshly verifies all six radius/reserve pairs of the
original table using the degree-160 positive Taylor lower bound for e^s.
At R=.4 it gives δ<.000021498418682, and verifies (7) at
η_r=.0000753 and η_s=.0000807. These reserves are less than .007, so
(2) supplies the shift tail for this radius. For the smaller radius .3,
the original larger reserves exceed .007: the newly shortened shift
interval is asserted here for R=.4, not for every row of the old table.

## 4. Keeping the angular average reduces the shift cutoff to 2.9

Let

    P(t)=(t−1)²+t²/2=3t²/2−2t+1,
    r(t)=sqrt(t)(a+bt),    M(t)=e^(−t)(3t²/2+t+2).

Cauchy–Schwarz in the two shell coefficients gives |h|²≤P(T)S₀,
and (3) implies

    r_x(α,β)≤S₀ E[P(T)/|L+x|].                    (8)

The fourth audit bounded the inner potential by the worst pointwise
denominator X−r(t). That discards most of the angular average. Instead,
for r<X, expansion of (1+(r/X)e^(iθ))^(−1/2) and its conjugate gives

    E_θ 1/|X+r e^(iθ)| = (1/X) Σ_{k≥0} a_k(r²/X²)^k,
    a_k=(binom(2k,k)/4^k)².                       (9)

The series is absolutely convergent for r/X<1; integrating its Fourier
expansion leaves equal indices. Its positive terms show that it increases
with r and decreases with X as long as X>r. Since a_k decreases in k,
for 0≤z<1,

    Σ_{k≥0}a_k z^k ≤ A_N(z)
      :=Σ_{k=0}^{N−1}a_k z^k+a_N z^N/(1−z).      (10)

Set X=29/10, c=97/20, n=200, N=24 and t_j=cj/n. The checker verifies
r(c)²/X²<1 at each row. For every |x|≥X and T∈[t_j,t_{j+1}], (9)–(10)
give the bound X^(−1)A_N(r(t_{j+1})²/X²). M is the exact mass tail of
P(t)e^(−t), so the inner contribution is at most

    I_inner=(1/X)Σ_{j=0}^{n−1}[M(t_j)−M(t_{j+1})]
                         A_N(r(t_{j+1})²/X²).     (11)

For T>c the weighted pushforward density is
e^(−T)P(T)/[π(a+bT)(a+3bT)], with mass M(c). The numerator decreases
for T≥3: after T=3+y, minus its derivative divided by e^(−T) is
3/2+4y+3y²/2>0. Thus the density is at most D_c/π, where

    D_c=e^(−c)P(c)/[(a+bc)(a+3bc)].

The mass/density estimate of §2 bounds the entire outer potential, at
every center, by 2sqrt(M(c)D_c). Exact arithmetic gives

| Row | Interval containing I_inner+2sqrt(M(c)D_c) |
|---|---|
| peak | (.929775349655366,.929775349655367) |
| flank | (.928544557183192,.928544557183193) |
| upper | (.932669154946248,.932669154946249) |

Each upper bound is less than 187/200=.935, proving (1). These are
certified bounds on an upper expression, not numerical evaluations of
the true potential. The largest eigenvalue of [[.24,.118],[.118,.26]]
is at most its largest row sum .378; hence

    Q_s≥(p−.378)S₀≥.942S₀.

Subtract (1) to get (2); Q_r≥Q_s gives the robust version. Simultaneous
rotation of Z,x,α,β makes x nonnegative real while preserving |α|,|β|
and Re(α conjugate(β)), so the reduced compact domain in §1 is valid.

## 5. Sharp local spectral constants, without global extrapolation

The fourth audit re-derived the zero-core Hermitian A/B cost matrix

    K_AB=[[k_A,m],[m,k_B]],
    k_A=p−(J₂−2J₁+J₀)/2,  k_B=p−J₂/4,
    m=(J₂−J₁)/(2sqrt(2)),
    J_j=∫₀^∞t^(j−1/2)e^(−t)/(a+bt)dt.

For k_A<k_B and m>0 its least eigenvalue and the B-energy fraction
of a minimizing direction are

    λ_min=(k_A+k_B−Δ)/2,
    e_B=(1−(k_B−k_A)/Δ)/2,
    Δ=sqrt((k_B−k_A)²+4m²).                        (12)

The scalar checker freshly evaluates J_j using the previously inspected
outward interval library and encloses (12):

| Row | λ_min interval | B-energy share interval |
|---|---|---|
| peak | (.298364651634117,.298364651634118) | (.032688705743602,.032688705743603) |
| flank | (.323152847874178,.323152847874179) | (.031700119898599,.031700119898600) |
| upper | (.327715897185325,.327715897185326) | (.031159045278746,.031159045278747) |

This is the exact optimal local common A/B cost at zero core. The directions
are realized by genuine cubic perturbations with
r_A=s sqrt(1−e_B)Y and r_B=−s sqrt(e_B)Y for a fresh standard complex
Gaussian Y. No global A/B margin may exceed the corresponding λ_min.
In particular the previous .300 obstruction is sharpened, while .29
remains only an unproved global candidate. The flank and upper local
spectra do not obstruct .300 there; no all-amplitude conclusion follows.

For the imaginary pointwise Q/ν block at the peak, use

    K_Qν=[[p−J₁, −(J₂−2J₁)/sqrt(2)],
          [−(J₂−2J₁)/sqrt(2), p−(J₃−4J₂+4J₁)/2]].

The same eigenvalue formula gives

    λ_min∈(−.387101627337727,−.387101627337726),
    e_ν∈(.418138450101614,.418138450101615).

Thus the scan's approximate .58/.42 energy split is explained by the
least eigenvector of this particular local block. One minimizing
coefficient direction is k_Q=i sqrt(1−e_ν), ν=−i sqrt(e_ν), k_P=0.
It is pointwise: constant nonzero Q is not a centered remote Wick
quadratic. The genuine zero-core Q/ν interaction vanishes after remote
averaging because E Q=0. No integrated cubic theorem or global five-sector
minimum is inferred from this two-dimensional calculation.

## 6. Reproduction and limits

```sh
python3 -I research/conjecture-K/code/fifth-audit-2026-11-15-codex-a7c4/joint_tail.py
```

The checker uses only the standard library, is read-only by default, and
reproduces `joint_tail_result.json`. `--write-result` writes only that
adjacent JSON. It certifies the six degree-18 Bernstein cells, all global
potential/mixed/tail constants, all old Gaussian reserve rows, the new
200-cell angular shift estimate, and the local spectra. Saved decimals
are outward enclosures, not acceptance inputs. The reused interval helper
is pinned by SHA-256 in the output. No Lean build was run.

This completes the mathematical/scalar provenance that the reviewer
explicitly left out of the original amplitude-box reduction. Its new
re-derivation still awaits external review. It neither closes the compact
joint premise nor the content theorem, nonzero-core odd sectors or full
row consumer. It does not affect the already reviewed tilted A-only
global theorem, which requires no amplitude-box reduction.
