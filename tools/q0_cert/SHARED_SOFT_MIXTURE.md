# A shared L² phase-mixture budget for captured bands

Agent-ID: codex-cf82. This is a written reduction with directed-Arb
numerical checks, not a Lean theorem or a bound for any actual band residual.
The small-ball and Poisson summation arguments cited below still need their
own Lean proofs.

Let z,w be independent standard circular complex Gaussians, Z=z+κ(|z|²)w,
and let φ be the actual real phase polynomial times Gaussian damping. The
existing global phase cover gives |φ|≤1. We use the independently derived
facts in `SOFT_GAUSSIAN_MIXTURE.md`: ||Z||₂<2 and, for 0<r≤1/2,

    P(|Z|≤r) ≤ 8 r² (1+log(1/r)).

Set η=10^-14 and X=|Z|²+η². The dyadic-shell argument from that note gives

    ||phase(Z)-Z/sqrt(X)||₂
        ≤ η sqrt[(56/3)(1+log(1/η))] < 2.50e-13.                (1)

Put h=3/10 and define the positive, finite exponential mixture

    T(X) = (h/sqrt(pi)) sum_{m=-220}^{235} exp(mh/2-X exp(mh)).

For its infinite version, Poisson summation and the Gamma identity give the
uniform relative error at most

    E_h = 2 sqrt(2) exp(-pi²/h)/(1-exp(-pi²/h)) < 1.45825e-14.  (2)

The discarded low-m terms have L² norm, after multiplication by Z, below

    (2h/sqrt(pi)) exp(-221h/2)/(1-exp(-h/2)) < 9.8e-15,      (3)

using ||Z||₂<2. For the high tail, X≥η² and η² exp(235h)>414>50.
Since the trapezoid summand is decreasing there, comparison to its integral
and |Z|/sqrt(X)≤1 give the pointwise and L² upper bound

    exp(-η² exp(235h))/sqrt(pi η² exp(235h)) < 2e-181.        (4)

Let e=15e-15 and define

    A = Z T(X)/(1+e).

All terms in T are positive. From (2), T(X)≤(1+E_h)/sqrt(X) and E_h<e;
therefore |A|≤|Z|/sqrt(X)≤1. Applying the triangle inequality to (1)--(4)
and the normalization, whose additional L² cost is at most e, gives

    ||phase(Z)-A||₂ < 2.9e-13.                               (5)

`check_soft_shared_budget.py` verifies all displayed scalar inequalities
with directed Arb arithmetic, including the sharper total 2.88408e-13.
It does not establish the small-ball inequality, the Poisson formula or
the exact Gaussian profile norm.

For every integer j≥0, multiplying by (iφ)^j is a contraction in L².
Orthogonal projection to any one captured Hermite band is also a
contraction. Therefore the vector of ALL coefficient differences for
that band has Euclidean norm at most (5), by Bessel/Parseval. If C denotes
the band's stored center and B its projection, then

    ||B((iφ)^j phase(Z))-C||₂
       ≤ 2.9e-13 + ||B((iφ)^j A)-C||₂.                      (6)

For the first band, proving the second term in (6) at most 3.970001e-11
would imply the existing 4.000001e-11 cap. The second term is NOT proved
or estimated by this note; neither is any band cap discharged.

The new expression has 456 shared scales and can reuse the profile,
conditional covariance, exponentials and Gaussian-Hermite generating
recurrences for all modes. Nonetheless κ is an eleventh-degree function
of |z|², and the phase polynomial remains large; each mixture component
still requires radial integration and rigorous control of irrational
weights. Shared evaluation and vector-valued quadrature may be cheaper
than 456 independent integrals for each of 6,552 modes, but no algorithm
or runtime comparison has yet established this.

## Removing fine-scale behavior at the profile zeros

On [0,80], `check_profile_neighborhoods.py` uses directed Arb interval
arithmetic to prove |κ(s)|<1/5 on the three rational intervals

    J = [12,15] ∪ [83/4,522/25] ∪ [126/5,2521/100],

and |κ(s)|>1/1000 on the complement. These are external numeric checks,
not Lean theorems. Each interval in J has s≥12.

Define A' by dropping mixture terms with m≥9 only when |z|²∈J. Since the
weights are nonnegative, the dropped part has modulus at most |A|≤1 and A'
is still disk-valued and rotation-equivariant. Split the relevant events
according to |Z|≤|z|/2. On this event,

    |w| ≥ |z|/(2|κ(s)|),   P(event | z) ≤ exp(-s/(4κ(s)²)) ≤ exp(-75).

The κ=0 case has zero probability on this event. Since the dropped response
is disk-valued, its L² contribution here is at most exp(-37.5). On the
complement, |Z|²≥s/4≥3. The omitted tail starts at m=9, and comparison
to the decreasing integral from m=8 gives, with λ=exp(8h),

    |Z| T_tail(X) ≤ exp(-λX)/sqrt(pi λX)
                  ≤ exp(-3λ)/sqrt(3 pi λ).

The normalization 1/(1+e) can only reduce this bound. Directed Arb checks
in `check_soft_shared_budget.py` give 3λ>33 and show

    ||A-A'||₂ < 4.782e-16.

This cost is paid once for the entire coefficient vector, not once per
mixture term or mode. For all retained terms in J, m≤8, so t=exp(mh)≤exp(2.4);
outside J, β=α+tκ²≥α+t/10^6. This removes the most severe real-axis root
boundary layers but does not by itself bound derivatives, quadrature cost,
or the residual norm.

Two scalar diagnostics illustrate both progress and limitations.
`arb_mixture_radial_tile.py` proves single-mode contributions are tiny on
some [0,1] panels. For m=160 on [15,16],
`check_radial_suppression.py` instead proves an absolute contribution below
2.51e-75 using the real Gaussian exponent and a profile interval bound.
These are individual-mode results; no summation over all modes, scales or
panels is certified, and the selected energy head extends much farther than
the first captured band.

For q=c=d=0 specifically, `check_root_retained_suppression.py 6..8`
certifies that the sum of the retained m=6,7,8 contributions over all J has
modulus below 3e-21. Together with the shared m≥9 omission, only m≤5 need
quadrature on J for this coefficient. This refinement is scalar and must
not be substituted for the vector omission budget.

`benchmark_radial_subset.py` replays individual Arb integrals for the
q=0 coefficient on s∈[0,4] at m=-200,-50,-10,0,10,50,100,200. Each of
the eight was finite in one run, taking 7--444 integrand evaluations and
0.016--1.08 seconds per scale. The result covers only one radial panel and
eight of the earlier 401-scale variant: it is not the new sum, an aggregate rounding bound, or an
end-to-end runtime estimate. The complete softened q=0 coefficient remains
an open computation.
