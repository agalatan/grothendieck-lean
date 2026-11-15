<!-- New audit note authored at this repository path on 2026-11-15. Agent-ID: codex-a7c4. -->
# Retained-sector audit, independent numerics, and exact error budgets

Agent-ID: codex-a7c4. Refs #395. This checks STATUS §11(c), and extends the
independent check of §11.4 to arbitrary correlated complex linear forms.
It does not prove a global tilted-sector inequality or a Grothendieck bound.
Historical sources are unchanged. Line references below are at base commit
`93098815d`, before this PR's central-file corrections.

**Labels:** existing formulas independently re-derived here are **P**;
new tail/assembly statements are **P, by their author, not reviewed**;
`sector_constants.py` gives exact scalar enclosures (**C**, scalar scope only);
`sector_numerics.py` gives **N**, never a global bound or certified integral.
No one outside this audit session has reviewed the new material.

## 1. Findings and bounded audit coverage

| Where | Finding and evidence | Severity | Correction |
|---|---|---|---|
| STATUS lines 421–422; KPR §11, line 266 | The remote part is described as `D(q) >= 0 up to slack`. At a fixed profile, a remote K cap is weaker than same-variance domination: see §5. This distinction was already explained in the 13 November independent-pushforward audit §1 and has reappeared in the new summary. | Medium: changes the stated remaining obligation | State L1 as `Lambda(q) <= S + eta_R`; use the assembly budget in §5 without assuming D nonnegative. |
| STATUS 11.15, line 412; KPR §§0,4 | “Exact sector gain” and “exact value” name floating-point quadrature and local optimization. The independent implementation reproduces the four-decimal table, but neither implementation proves a supremum. | Low: misleading precision language, despite N label | Say “numerically optimized sector gain” and “numerical value.” Keep N. |
| STATUS 11.18, line 415 | “Gaussian q: ... true content is 0” needs an explicit projection convention. A literal Gaussian first-chaos q has `Pi_1 q != 0`; the subtraction defining h_s then does not preserve content. The exponential law is a formal radial relaxation input/diffuse-cubic limit, with its auxiliary Gaussian excluded from the projection. This is the trap already recorded in §13.2, item 35. | Low: scope ambiguity | State the diffuse-limit interpretation and do not insert a first-chaos Gaussian into a cubic projection identity. |
| STATUS 11.17, line 414; KPR §9, lines 236–240 | A bound on the coefficient norm of r does not imply a pointwise bound on `\|r(y)\|`: every nonzero Gaussian linear form is unbounded. The source acknowledges a tail, but its numerical cost is not a full expectation bound. | Medium if the local grid is used in a proof | Use a certified compact Hessian estimate plus a tail bound; §6 supplies an explicit dimension-uniform tail allowance, conditional on the coefficient bound. |
| STATUS 11.4, line 339 | General complex coefficients and multiple drivers were R. Phase averaging and the Schur complement give the same Hermitian form without a dimension factor (§3), independently confirming the existing external theorem. | Improvement | P for the complete local form, with exact scalar enclosures; still local at zero. |

Coverage: 11.12–13 were re-derived with all signs and normalizations (§2).
11.15 was reimplemented (§4). 11.14's monotonicity was **not** certified;
11.16/19/20's tensor searches were **not** rerun and remain N/lower-bound evidence
for a supremum. The finite-amplitude Hessian grids in 11.17 were not turned into
certificates. The Cauchy–Schwarz inequality in 11.18 is valid by projection
contraction when `Pi_1 q=0`; its numerical tables were not replayed here.
No numerical or search entry is promoted to a theorem.

## 2. Tilt, content, and the quadratic model

**P, independently re-derived.** Let `T=|Z|^2`, `p=1/epsilon`,
`L=Z(a+bT)`, with a,b>0. For any square-integrable remote q and remote linear r,
`G=q+(T-1)r` has energy `||q||^2+||r||^2`, since `E(T-1)=0`.
Choose the first-chaos trial element `u=-s r` in the retained minimum.
The perturbation is even under Z -> -Z and L is odd. Therefore

    Lambda_hat(G) <= 2 E|L+q+(T-1+s)r|
                     - p||q||^2 - (p-s^2)||r||^2.

This trial inequality holds for every real s, even when `p-s^2` is nonpositive.
Useful positivity of a cost is a separate issue.

For a remote cubic, `Pi_1 q=0`. The first variation in r of its right side is

    2 Re <r, Pi_1[q (g(|q|^2)+s j(|q|^2))]>
      = 2 Re <r, Pi_1[q h_s(|q|^2)]>,
    h_s(v)=(g(v)-g0)-s(j0-j(v)).

Thus both signs in STATUS 11.13 are correct. Removing the constants g0+s j0
uses cubic orthogonality and does not apply to an arbitrary remote L² base.
At q=0 the quadratic cost is exactly

    k(s)=k_A-2g0 s-(1+j0)s^2.

The exact scalar checker encloses the maximizing tilt in
`(0.34339840980385,0.34339840980386)` and its positive-cost interval endpoints in
`(-0.15612660906817,-0.15612660906816)` and
`(0.84292342867587,0.84292342867588)`.
At s=7/10, `0.29757765153597 < k(s) < 0.29757765153598`.
These are local costs at q=0, not costs uniform in q or r.

For completeness, write c=Pi_1[q g] and mu=Pi_1[q j], and replace the nonlinear
remainder at q by its Hessian at the origin. The resulting model is

    2 Re<c,r> - 2 Re<mu,u> - k_A||r||^2
      -2g0 Re<r,u> + (1+j0)||u||^2.

Minimizing over u and maximizing over r gives exactly

    ||c-g0 mu/(1+j0)||^2/(k_A+g0^2/(1+j0)) - ||mu||^2/(1+j0).

This confirms the algebra of 11.13. For nonzero q it is a model with the Hessian
evaluated at the origin; it is not the actual Taylor expansion at q and supplies
neither an upper nor a lower bound on the full sector gain.

## 3. Local retained A/B form for arbitrary complex correlated drivers

**P, independently re-derived existing result** (external package `proofs.tex`,
lines 182–267). Let r_A,r_B be any remote complex Gaussian linear forms,

    H=(T-1)r_A + Z^2 conjugate(r_B)/sqrt(2).

Write `I_k=E[T^k/|L|]`, k=0,1,2, and define

    j0=I0/2,             g0=(I1-I0)/2,        d0=-I1/(2sqrt(2)),
    k_A=p-(I2-2I1+I0)/2, k_B=p-I2/4,         m0=(I2-I1)/(2sqrt(2)).

The local cost of the retained functional is the quadratic form

    Q(r_A,r_B)=k_A||r_A||^2+k_B||r_B||^2
               +2m0 Re<r_A,r_B>
               +||g0 r_A+d0 r_B||^2/(1+j0),
    Lambda_hat(t H)=2E|L|-t^2 Q(r_A,r_B)+o(t^2).

To verify conjugations, write Z=sqrt(T) exp(i theta), divide by exp(i theta),
and use `Im(exp(i theta) conjugate(r_B))=-Im(exp(-i theta)r_B)`.
For a remote trial correction t u the transverse perturbation is therefore

    Im(exp(-i theta)[(T-1)r_A - T r_B/sqrt(2) - u]).

Its squared angular average is one half the squared modulus of the bracket.
The quadratic coefficient of the paired norm, plus `||u||^2`, is

    E[ |(T-1)r_A-T r_B/sqrt(2)-u|^2/(2|L|) ]+||u||^2.

Completing its square gives `u=(g0 r_A+d0 r_B)/(1+j0)` and the displayed Q.
The inner product is `E[conjugate(r_A) r_B]`; no reality, independence, or
orthogonality assumption on the two forms was used. No factor depending on the
number of remote coordinates enters the calculation.

The visible correction along Z can be taken to be zero, at every amplitude for
this block: change all remote coordinates y -> -y, interchange the two norm
terms, and the correction objective is even in its visible coefficient while
keeping its remote coefficient fixed. Convexity then minimizes the visible
coefficient at zero. The remote objective has the strictly convex squared-norm
term. Its minimizer is O(t) near zero. The second-order norm remainders are
bounded by a constant times the squared perturbation divided by |L|; this is
integrable, since a>0 and the radial singularity is only T^(-1/2).
The expansion is uniform on bounded sets of trial coefficients in any fixed
finite dimension, which justifies minimizing the quadratic expansion.

The standard-library rational checker uses

    I0=pi exp(a/b) erfc(sqrt(a/b))/sqrt(ab),
    I1=(sqrt(pi)-a I0)/b,   I2=(sqrt(pi)/2-a I1)/b.

These follow by a Laplace representation of the reciprocal and polynomial
division. Machin's formula encloses pi; alternating series enclose erf and
arctangent; a positive series with a geometric tail encloses exp. Integer square
roots give directed rational square-root bounds. No floating point is used in
acceptance. At the peak the retained matrix is enclosed entrywise by

    A  in [0.60683885483874, 0.60683885483875],
    B  in [1.01343807031137, 1.01343807031138],
    AB in [0.26291259657063, 0.26291259657064],

and its smallest eigenvalue lies in
`[0.47779261268182,0.47779261268183]`. The previous “>0.477” is confirmed.
This is an independent check of an existing theorem, not a new local matrix.

## 4. Independent Wick-monomial computation

**N.** The new `sector_numerics.py` imports no repository code. It uses
q=sqrt(u/2)y(|y|²-2), coefficients (r,s,gamma) real, and evaluates the norm
in polar coordinates directly:

    A1=sqrt(v)[sqrt(u/2)(v-2)+(T-1)r-gamma],
    A2=T sqrt(v) s/sqrt(2),
    |L+G-gamma y|=hypot(ell+(A1+A2)cos(theta),(A1-A2)sin(theta)).

This implementation uses a different panel partition, Gauss–Legendre angular
integration, analytic gradients and simultaneous stationary equations for the
saddle. The source used angular midpoints or elliptic integrals, and nested
scalar minimization. The Gaussian benchmark here is an independent one-variable
Rice formula using scaled Bessel functions.

| u | D(q), finest grid | raw A / D | raw A+B / D | retained A / D | retained A+B / D |
|---|---:|---:|---:|---:|---:|
| 0.01 | 0.00137566154 | 0.12456775 | 0.12612685 | 0.02135983 | 0.02161733 |
| 0.02 | 0.00384984920 | 0.14822373 | 0.15095337 | 0.02247865 | 0.02304204 |
| 0.03 | 0.00678303949 | 0.15684154 | 0.16052024 | 0.02096799 | 0.02182985 |
| 0.0463 | 0.01206342071 | 0.16044543 | 0.16533698 | 0.01698219 | 0.01829395 |

Every ratio agrees with the source's printed four-decimal value. Orders per
radial panel were 12,24,36; angular orders 72,144,216. Between the last two
rules, the largest ratio changes at these four energies were respectively
`1.50e-5`, `1.45e-6`, `1.23e-6`, `7.43e-7`. These are convergence diagnostics,
not rigorous error bars. The displayed extra digits permit comparisons and do
not assert that many correct digits. The radial cutoff is 8; no interval tail
certificate is included in this N computation. A root with small gradient is
not proof of a global saddle or supremum. No search over complex sector
coefficients, additional drivers or other profiles was performed here.

Reproduce (roughly a few minutes, one CPU thread, bounded batches):

```sh
python3 -I research/conjecture-K/code/audit-2026-11-15-codex-a7c4/sector_numerics.py --orders 12,24,36
python3 -I research/conjecture-K/code/audit-2026-11-15-codex-a7c4/sector_constants.py
```

Saved outputs are beside the scripts, `sector_numerics.json` and
`sector_constants.json`. Both contain method and scope labels.

## 5. Correct assembly of an approximate remote cap

**P, by its author, not reviewed; elementary error-budget lemma.** Fix a profile
and put A(u)=Lambda_Gauss(u), S=sup_v A(v), D(q)=A(u)-Lambda(q).
Suppose the following hold on exactly the remote and sector domain being used:

    Lambda(q) <= S+eta_R,
    gain(q) <= kappa D(q)+eta_A,       0 <= kappa <= 1.

Then, without any sign assumption on D,

    Lambda_hat(q+sectors)
      <= (1-kappa)Lambda(q)+kappa A(u)+eta_A
      <= S+(1-kappa)eta_R+eta_A.

This is a convex combination, so the domain restrictions and `0<=kappa<=1`
are essential. Thus a certified remote error 3.6e-7 costs at most 3.6e-7 in
this assembly, and if kappa=1/2 it costs at most 1.8e-7. These are conditional
budgets, not assertions that the sector hypothesis has been proved.

In contrast, the remote cap alone implies only

    D(q) >= -[S-A(u)]-eta_R.

It need not imply D>=0 or D>=-eta_R. A scalar countermodel is S=0, A(u)=-1,
Lambda(q)=0, eta_R=0: the remote cap is true while D=-1. This refutes the
logical implication, not a statement about a particular cubic. The November
13 audit already made this distinction; the application here corrects its
reappearance in the November 15 summary.

## 6. A dimension-uniform allowance for the Gaussian sector tail

**P, by its author, not reviewed.** This is an auxiliary bound for a future
compact tilted-sector check, not that check or the tilted-sector theorem.
Let r be any remote Gaussian linear form with w=E|r|², q any remote base,
s in [0,1], R>0, and

    V=L+q, h=(T-1+s)r,
    Rem(V,h)=2(|V+h|-|V|-Re(h conjugate(phase V))).

For V=0 choose phase V=0. The triangle inequality gives
`0<=Rem(V,h)<=4|h|` (the lower bound uses the subgradient inequality).
Independence of T from the remote variables, and the exact circular Gaussian
law of r, give

    E[Rem(V,h); |r|>R]
      <= 4[-s+2exp(s-1)] exp(-R²/w) [R+w/(2R)] .             (T)

For w=0 the tail is zero. To prove (T), use
`E|T-1+s|=-s+2exp(s-1)` and

    E[|r|; |r|>R] = sqrt(w) Gamma(3/2,R²/w)
      <= exp(-R²/w)[R+w/(2R)].

The last inequality follows by integration by parts and
`Gamma(1/2,x)<=exp(-x)/sqrt(x)` for x>0. No independence between q and r is
needed and the estimate is independent of dimension. Its right side increases
with w, so a coefficient bound w<=w0 suffices.

If a *certified* compact Hessian estimate gives
`Rem` averaged over Z at most `theta |r|²` for every q-value and |r|<=R,
with theta>=0, then the global averaged remainder is at most
`theta w` plus (T). Thus a pointwise cutoff may be removed with an explicit
allowance, rather than being mistaken for a coefficient restriction.

At s=7/10, R=3/10 and w<=9/2500=(0.06)², the exact scalar checker proves
that (T) is less than `14/10^12`. The observed optimal amplitudes fit this
range, but **no general amplitude theorem proving w<=9/2500 is supplied**.
At the larger existing shell bound w<=0.0113 the same tail allowance is about
3.46e-4, which is too large for a 1e-4 budget. Hence the empirical observation
that the tail starts near five standard deviations cannot simply be used for
the full response domain. A better compact radius, tail estimate, or a priori
coefficient bound is still required.
