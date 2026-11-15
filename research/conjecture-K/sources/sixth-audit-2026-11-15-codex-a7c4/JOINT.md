<!-- New sixth-audit note. Agent-ID: codex-a7c4. Refs #415. -->
# The odd Q/ν interaction has two real coupling channels

Agent-ID: codex-a7c4. Baseline merged #413, `adb96a5a2`.
New arguments are **P by author, not externally reviewed**. The exact scalar
witness is **C**, with `odd_coupling.py` and its adjacent result JSON.
This corrects a local interaction formula; it does not refute Conjecture K,
the positive zero-core odd costs, or the proposed finite-amplitude odd bound.

## 1. The finding and its scope

KPR §12 (`sources/numerics-kprime-2026-11-15/README.md`, lines 322–325), repeated
in STATUS 11.45, describes the Q/ν cross term over a nonzero remote core as

> In the functional that term is ν̄·E[Q·γ(|q|²)]

for a scalar radial function γ. As a literal formula for the mixed quadratic
term this is incomplete: the real and imaginary directions have different
kernels. Equivalently, both a Hermitian pairing and a complex bilinear pairing
are needed. A simultaneous rotation `(Q,ν)↦(iQ,iν)` leaves the first pairing
unchanged but changes the second. Global rotation of the remote Gaussian
coordinates does not remove this term: Q has charge zero and ν is constant.

The source's conclusion that the interaction vanishes at zero core is correct.
The correction matters when using that cancellation at a nonzero core. Section 4
gives an explicit **genuine cubic** test at nonzero remote energy: the two mixed
coefficients even have opposite signs. Thus this is more than the already-known
pointwise example with an inadmissible constant Q.

Normalization is important. This note uses the normalized one-coordinate sector
`ν Z(T−2)/sqrt(2)`, of energy `abs(ν)²`. A source using `d Z(T−2)` instead has
`ν=sqrt(2)d`. All coefficients below use the normalized convention.

## 2. Exact two-kernel formula at a remote base

Let Z be standard complex Gaussian, T=|Z|²,

    L=Z(a+bT),   a>0, b≥0,   r(t)=sqrt(t)(a+bt),
    Λ(G)=E|L+G|+E|L−G|−p E|G|².

Let q,Q be remote square-integrable variables and ν a complex constant.
For real λ,μ use the perturbation

    G_{λ,μ}=q+λ ZQ+μ ν Z(T−2)/sqrt(2).

The cubic application takes q∈H₂,₁ and Q∈H₁,₁, hence EQ=0. No independence
between q and Q is assumed. The penalty has zero mixed λμ term, because
E[T(T−2)]=0. The substitution Z↦−Z converts the two norm terms into
`E(|L+q+O|+|L+q−O|)`, where O is the odd perturbation. The linear term vanishes.

For x≥0 put, with θ uniform on a circle,

    A(x)=E_T [T(T−2)/sqrt(2) · E_θ
              x²sin²θ / |r(T)+x exp(iθ)|³],
    B(x)=E_T [T(T−2)/sqrt(2) · E_θ
              (r(T)+x cosθ)² / |r(T)+x exp(iθ)|³].      (1)

The integral is over T and θ together; the angular integral may be improper
at an isolated resonant T. The jointly integrated functions are finite.
If the quadratic expansion is written as

    Λ(G_{λ,μ})=Λ(q)+λ²U+μ²V+2λμ K(q;Q,ν)+o(λ²+μ²),

then the exact mixed coefficient is

    K(q;Q,ν)=Re(ν) E[Re(Q) A(|q|)]
               +Im(ν) E[Im(Q) B(|q|)].                (2)

In particular, the mixed second derivative is **2K**, not K. Equivalently,

    K=(1/2) Re{ conjugate(ν) E[Q(A+B)(|q|)]
                       +ν E[Q(A−B)(|q|)] }.          (3)

To derive (2), fix q and absorb its argument into θ. After factoring the phase
of Z, the transverse numerator for `C=λQ+μν(T−2)/sqrt(2)` is

    sqrt(T) [ x sinθ Re(C)+(r(T)+x cosθ) Im(C) ].

The term containing sinθ times `(r+x cosθ)` integrates to zero. The norm's
second-order coefficient is the square of this transverse numerator divided
by `|r+x exp(iθ)|³`. Expanding its square gives (2).

Here the quadratic expansion really exists, not merely formally. The norm
remainder is dominated by `|O|²/|L+q|`. Under the radial map Z↦L, the measures
weighted by T and by T(T−2)²/2 have mass one and planar densities bounded by
`1/(πa²)` and `9/(πa²)`, respectively. For the second bound use
`T(T−2)²≤T³+4T²+4T` and `T^j exp(−T)≤j!`. The mass/density potential bound
therefore gives the uniform bounds 2/a and 6/a for their inverse-distance
potentials, at every q. Multiplying by remote |Q|² and |ν|² supplies an
integrable dominator. The pointwise norm Taylor expansion and dominated
convergence then justify the finite-dimensional Hessian and its mixed term.

At zero shift,

    A(0)=0,
    B(0)=(J₂−2J₁)/sqrt(2),
    J_j=∫₀∞ t^(j−1/2) exp(−t)/(a+bt) dt.             (4)

Thus EQ=0 kills both pairings at q=0, as the old record correctly states.
More generally a sufficient condition at any remote core is

    E[Q | |q|]=0.                                    (5)

It makes both conditional expectations in (2) vanish. Independence of Q and
|q| together with EQ=0 is one special case. Centering alone does not give (5).
These statements concern the mixed Hessian only, not finite-amplitude decoupling.

## 3. A Gaussian smoothing identity with an explicit remainder

The following elementary calculation makes the genuine-cubic test rigorous.
For r>0 and v≥0 write

    G(r,v)=E_X |r+sqrt(v)X|,
    H_I(r,v)=G_r(r,v)/r,    H_R(r,v)=G_rr(r,v),

where X is standard complex Gaussian. These are the imaginary and real
directional norm Hessians, respectively. Let `h(z)=sqrt(max(1−z,0))`.
The Gaussian Laplace transform and the integral formula for the square root give

    H_I(r,v)=(1/sqrt(π)) ∫₀∞ u^(−1/2) exp(−r²u) h(vu) du,
    H_R(r,v)=(1/sqrt(π)) ∫₀∞ u^(−1/2)(1−2r²u)
                                      exp(−r²u) h(vu) du.   (6)

For clarity, before substituting `u=t/(1+vt)`, the first integrand is
`t^(−1/2)(1+vt)^(−2) exp(−tr²/(1+vt))`. The substitution gives h(vu)
and extends it by zero beyond u=1/v. Differentiating in r yields the second
identity. All these integrals converge for r>0, including the case v=0.

For every z≥0,

    |h(z)−1|≤z,
    |h(z)−1+z/2|≤z²/2.                              (7)

For z≤1, rationalize the square root twice; the second residual is
`−z²/[2(1+sqrt(1−z))²]`. For z≥1 the displayed inequalities reduce to
elementary polynomial comparisons. Using (6), (7), and gamma integrals gives

    |H_I−1/r+v/(4r³)| ≤ min{3v/(4r³), 3v²/(8r⁵)},
    |H_R−v/(2r³)|    ≤ min{5v/(2r³), 9v²/(4r⁵)}.     (8)

For the coarser real bound use `|H_R|≤2v/r³`, obtained by subtracting the
zero v=0 integral in (6), and then add v/(2r³). The finer bound uses
`|1−2r²u|≤1+2r²u`; the gamma coefficients are 3/4 and 15/4.
The imaginary estimates follow directly from the corresponding gamma integrals.

In the weighted T integrals, `r(T)≥a sqrt(T)` and `|T−2|exp(−T)≤2`.
Split at `T=v/a²`, using the first bound of each minimum below the split
and the second above it. Then

    | E[T(T−2)H_R(r(T),v)/sqrt(2)] − v M/(2sqrt(2)) |
        ≤ (19sqrt(2)/(2a⁴)) v^(3/2),

    | E[T(T−2)H_I(r(T),v)/sqrt(2)] − B(0)+v M/(4sqrt(2)) |
        ≤ (9sqrt(2)/(4a⁴)) v^(3/2),                  (9)

where

    M=∫₀∞ (t−2)t^(−1/2)exp(−t)/(a+bt)³ dt.          (10)

The factor in the split calculation is
`(2/sqrt(2))[2C+2D]v^(3/2)/a⁴=2sqrt(2)(C+D)v^(3/2)/a⁴`
for an estimate `min(Cv/r³,Dv²/r⁵)`.

M is strictly negative for every a>0,b≥0. Indeed, normalize the positive
measure `t^(−1/2)exp(−t)/(a+bt)³ dt`. Its mean is at most 1/2: reweighting
the Gamma(1/2) density by the nonincreasing function `(a+bt)^(−3)` decreases
the mean, by the elementary covariance inequality. Subtracting 2 proves M<0.

## 4. A finite genuine-cubic witness

Let X,Y be independent remote standard complex Gaussians, independent of Z,
and set

    f=|Y|²−1,  q_c=c X f,  c>0.

Then q_c∈H₂,₁, f∈H₁,₁, `‖q_c‖²=c²`, `Ef=0`, `Ef³=2`, `Ef⁴=9`.
The odd directions below are also genuine H₂,₁ cubics. Conditioned on Y,
q_c is circular Gaussian with variance v=c²f². Consequently (2) becomes

    K_R(c):=K(q_c;f,1)
      =E_Y f E_T[T(T−2)H_R(r(T),c²f²)/sqrt(2)],
    K_I(c):=K(q_c;if,i)
      =E_Y f E_T[T(T−2)H_I(r(T),c²f²)/sqrt(2)].       (11)

Use (9), Ef=0, Ef³=2, and E|f|⁴=9. For **every c>0**,

    |K_R(c)−c²M/sqrt(2)| ≤ (171sqrt(2)/(2a⁴))c³,
    |K_I(c)+c²M/(2sqrt(2))| ≤ (81sqrt(2)/(4a⁴))c³.   (12)

In particular the two small-c slopes have opposite signs at every positive
profile. At the peak, the exact checker encloses

    M ∈ (−13.183874938294249, −13.183874938294248),
    M/sqrt(2) ∈ (−9.322407371183240, −9.322407371183239),
    −M/(2sqrt(2)) ∈ (4.661203685591619, 4.661203685591620).

Choose the explicit finite value **c=1/1000**, hence remote energy **10⁻⁶**.
The two rigorous enclosures from (12) are

    K_R(c) ∈ (−.000010558959592, −.000008085855150) < −8·10⁻⁶,
    K_I(c) ∈ (.000004368336054, .000004954071317)   >  4·10⁻⁶.   (13)

Their difference exceeds 12·10⁻⁶. A purported single Hermitian radial formula
`Re(conjugate(ν) E[Q γ(|q|²)])` would give identical values for `(f,1)` and
`(if,i)`, for any scalar γ, even a complex-valued one. Thus it cannot equal
the true mixed coefficient. The failure occurs on actual cubic directions
over an actual remote cubic, not on an arbitrary L² countermodel.

Again, the mixed second derivatives are 2K_R and 2K_I. A negative or positive
off-diagonal coefficient alone proves neither failure nor success of a positive
full cost matrix, and no finite-amplitude pure-cost theorem is refuted here.

## 5. Exact scalar evaluation and reproducibility

Define `K_j^(m)=∫ t^(j−1/2)exp(−t)/(a+bt)^m dt`. Integration by parts of
`sqrt(t)exp(−t)/(a+bt)^m`, whose boundary terms vanish, gives

    K_0^(2)=(J₁+J₀/2)/a,
    K_1^(2)=(J₀−a K_0^(2))/b,
    K_0^(3)=[(3/2)K_0^(2)+K_1^(2)]/(2a),
    K_1^(3)=(K_0^(2)−a K_0^(3))/b,
    M=K_1^(3)−2K_0^(3).                             (14)

At the peak b>0, so these are safe operations on outward dyadic intervals.
The checker freshly computes J₀,J₁ with the already-inspected 220-bit rational
interval helper, records its SHA-256, verifies the factorial moments, and applies
the explicit remainder constants. Saved JSON is output, not an input.

```sh
python3 -I research/conjecture-K/code/sixth-audit-2026-11-15-codex-a7c4/odd_coupling.py
```

The script is standard-library only and read-only by default. Its output matches
`odd_coupling_result.json`; `--write-result` explicitly regenerates only that file.
No numerical quadrature, tensor search or floating-point acceptance is used.
The Gaussian Laplace identity and analytic remainder estimates are paper inputs,
not assertions that the scalar script independently proves.

The existing zero-core odd costs, parity argument, pointwise five-sector
obstruction, and joint A/B bounds retain their previous scopes. This pass adds
a correct nonzero-core interaction formula and a finite certified witness to
the need for both channels. The full odd-sector theorem remains open.
