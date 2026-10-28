# Independent finite quintic Mehler audit

23 October 2026. Scope: audit of the finite fifth-chaos coefficient for
responses depending on the visible Gaussian and the normalized conditional
Gaussian. All work for this audit is in this scratch directory. The repository
worktree and its existing dirty files were read only. No production changes,
commit, or commands against the main checkout are part of this audit.

## Result and exact boundary

The conditional Mehler calculation and the eight local-channel formula in
`../grothe-shared-response/docs/EXACT_QUINTIC_PROJECTION_2026-10-23.md` pass this
independent algebraic audit. In particular, the normalization does not permit
assigning actual first-chaos degree to the conditional variable `G`.

For the two rational phase profiles in `quintic-sign-certificate.json`, the
external Arb verifier certifies the actual finite coefficient at `m=10^12` in
the strict interval

    -809/200000 < s5_m < -2021/500000,

that is, `-0.004045 < s5_m < -0.004042`. This conclusion combines the analytic
identities proved below with directed numerical integral enclosures. It is not
a Lean theorem about Gaussian projections. The seven Lean theorems supplied
here formalize only generic finite-energy error, signed-step, convex-mixture,
and three-column Cramer algebra.

The result controls these frozen responses and their convex payoff mixtures.
A negative fifth coordinate gives a decreasing positive fifth-multiplier step
on these payoffs. It does not bound the supremum over other responses and does
not establish a Grothendieck endpoint.

## 1. Conditional Gaussian covariance

Use independent standard proper complex Gaussian coordinates `Z`, `X in C^m`,
and `Y in Sym²(C^m)`. The symmetric matrix model has diagonal coordinates
`Y_ii`, off-diagonal coordinates `Y_ij/sqrt(2)`, and Frobenius norm squared
`||Y||²`. Its covariance is

    E[M_ab bar(M_cd)] = (delta_ac delta_bd + delta_ad delta_bc)/2.

For `X != 0`, define the unit Veronese direction

    u(X) = (X_i², sqrt(2) X_i X_j for i<j) / ||X||².

Its norm is one because the numerator's norm squared is `||X||^4`.
Its Hermitian pairing is

    <u(X),u(X')> = (<X,X'>/(||X|| ||X'||))² = gamma².

The null event `X=0` can be assigned any direction. The variable

    G = sum u_j(X) bar(Y_j)

has standard proper complex Gaussian law conditional on `X`; consequently it
is independent of `X`. Equivalently this is
`X^T bar(M) X/||X||²`. In an actual Mehler coupling with real `|rho|<1`,
every original coordinate is coupled with correlation `rho`. Conditional on
`X,X'`, the pair `G,G'` is jointly proper complex Gaussian with unit variances
and

    E[bar(G) G' | X,X'] = rho gamma².

Both the factor `rho` from `Y,Y'` and the square of the angular pairing are
needed. The `Z,Z'` pair is independent of this conditional pair.

## 2. Local Hermites and actual fifth degree

Let `H_pq` be the normalized complex Hermites with leading monomial
`w^p bar(w)^q/sqrt(p!q!)`. For example,

    H11(w)=|w|²-1,
    H20(w)=w²/sqrt(2),
    H21(w)=w(|w|²-2)/sqrt(2),
    H22(w)=(|w|^4-4|w|²+2)/2,
    H32(w)=w(|w|^4-6|w|²+6)/sqrt(12).

The products `H_ab(Z)H_cd(G)` are an orthonormal basis for the independent
two-variable Gaussian law. Write the coefficient of a function `F` as
`F_ab;cd = E[bar(H_ab(Z)H_cd(G)) F(Z,G)]`. The conditional complex Hermite
identity gives

    E[bar(F(Z,G)) H(Z',G')]
      = sum bar(F_ab;cd) H_ab;cd rho^(a+b+c+d) K_cd(rho),
    K_cd(rho) = E[gamma^(2c) bar(gamma)^(2d)].

Finite Hermite expansions establish this first; convergence in `L²` and the
marginal Cauchy--Schwarz inequality pass it to arbitrary `L²` functions.
Also `sum |bar(F_ab;cd) H_ab;cd| <= ||F||₂ ||H||₂`.

For a charge-one response, the local indices satisfy `a-b+c-d=1`. Under a
common phase rotation of every original coordinate, `G` has charge one
(two `X` factors and one conjugate `Y` factor). Therefore the actual Hermite
expansion of `F(Z,G(X,Y))` has charge one too. Actual total degree five then
means bidegree `(3,2)`. In the original Gaussian Mehler expansion the
coefficient of `rho^5` is exactly `<P32 F,P32 H>`.

Terms with local total degree greater than five are `O(|rho|^6)` uniformly
near zero: `|gamma|<=1` bounds each `K_cd`, and the absolutely summable
coefficient products bound the remaining series. There are finitely many
indices of local degree at most five. Thus it suffices to extract their
finite Taylor coefficients. The smooth angular calculation in section 3
justifies that extraction. No phase-tail approximation or central limit
argument occurs here.

## 3. Angular density and Taylor coefficients

At zero correlation let `X=sqrt(R)U` and `X'=sqrt(S)V`, where the independent
radial variables have `Gamma(m,1)` law and the independent directions are
uniform unit vectors. Put `gamma=<U,V>`, `w=sqrt(RS)gamma`, and `T=R+S`.
The correlated joint Gaussian density relative to this independent law is

    L_rho=(1-rho²)^(-m)
      exp[-rho² T/(1-rho²) + rho(w+bar(w))/(1-rho²)].

The elementary independent angular and radial moments are

    E[gamma^a bar(gamma)^b]=0                     if a != b,
    M_j := E|gamma|^(2j)=j!/(m)_j,
    E[RS]=m²,
    E[RS T]=2m²(m+1),
    E[(RS)²]=m²(m+1)².

For `m>=2`, `|gamma|²` has the `Beta(1,m-1)` law; its beta integral gives
`M_j`. For `m=1`, the direction is a uniform phase, so `M_j=1`; the same
formula remains valid. Phase invariance gives the unequal-exponent zero.
The radial formulas follow from `E[R^k]=(m)_k`.

Set `W=w+bar(w)`, `D=m-T`, and `E=m/2-T`. Expansion of the logarithm gives

    log L_rho = rho W + rho² D + rho³ W + rho⁴ E + O(rho⁵).

Thus the second-order density coefficient is `D+W²/2`, and its fourth-order
coefficient is

    E + D²/2 + W² + D W²/2 + W⁴/24.

For `K10=E[gamma² L_rho]`, angular balance keeps only `bar(w)²/2` at order
two. At order four it keeps `(D/2+1)bar(w)²+w bar(w)³/6`. Consequently

    [rho²]K10 = (m²/2) M2 = m/(m+1) = kappa²,

    [rho⁴]K10 = ((m+2)m²/2 - m²(m+1)) M2
                    + m²(m+1)² M3/6
               = m(m+2)/(m+1) - 2m + m(m+1)/(m+2)
               = m/((m+1)(m+2)) = A4.

For `K11`, the zero-order term is `M2`. At order two the radial term is
`-m M2`, while the balanced term in `W²/2` is `RS |gamma|²`. For `K21`,
angular balance at order two again requires `bar(w)²/2`. Therefore

    K11(0)=M2=2/(m(m+1))=1/d,
    [rho²]K11=-m M2+m² M3
                =4(m-1)/((m+1)(m+2))=B2,
    [rho²]K21=(m²/2)M4
                =12m/((m+1)(m+2)(m+3))=C2,
    K22(0)=M4=24/(m(m+1)(m+2)(m+3))=D0.

The angular functions are even in `rho`: replacing `X'` by `-X'` changes
the correlation sign and leaves the even powers defining `K_cd` unchanged.
All needed derivatives exist with Taylor remainder of the indicated order.
To justify differentiation, on any compact real `|rho|<=r0<1`, multiply
the independent Gaussian density by `L_rho`; derivatives are bounded by a
polynomial times `exp[-c(||X||²+||X'||²)]` for a positive `c` depending on
`r0`. The angular factor is bounded by one. This supplies domination at every
finite derivative order. The density also has a complex analytic extension
in a sufficiently small neighborhood of zero with an integrable bound.

## 4. Exhaustive channel enumeration

Angular balance in the density implies

    K_cd(rho)=O(rho^(2|c-d|)).

Indeed the angular exponent mismatch is `2(c-d)` and each factor `w` or
`bar(w)` changes it by one. Local total degree `L=a+b+c+d` must be odd by
charge one. Only `L=1,3,5` can contribute to actual degree five.

At `L=1`, the `Z` channel has `K00=1` and contributes only actual degree one.
The `G` channel contributes `A4` at actual degree five.

At `L=3`, charge one gives the following exhaustive possibilities:

* `H21(Z)`: `K00=1`, so no actual fifth contribution.
* `H11(Z)G`: the leading `K10` coefficient gives `kappa²`.
* `H20(Z)bar(G)`: the leading `K01=K10` coefficient gives `kappa²`.
* `Z H11(G)`: the second-order `K11` coefficient gives `B2`.
* `bar(Z)H20(G)`: its angular order is at least four, so actual degree is
  at least seven.
* `H21(G)`: the leading `K21` coefficient gives `C2`.

At `L=5`, a contribution requires `c=d`. The three possibilities are
`H32(Z)` with coefficient one, `H21(Z)H11(G)` with coefficient `1/d`, and
`Z H22(G)` with coefficient `D0`. Every other degree-five channel has
positive angular order and contributes only at higher actual degree.

This proves the exact diagonal formula with eight distinct orthonormal local
channels. Using coefficient names in this order,

    v = <H32(Z),F>,       A = <H11(Z)G,F>,
    B = <H20(Z)bar(G),F>, q = <G,F>,
    n = <Z H11(G),F>,     hN = <H21(Z)H11(G),F>,
    ell = <H21(G),F>,     zN2 = <Z H22(G),F>,

the general pairing is

    <P32 F,P32 H>
      = bar(vF)vH + kappa²(bar(AF)AH+bar(BF)BH)
        + A4 bar(qF)qH + B2 bar(nF)nH + (1/d)bar(hNF)hNH
        + C2 bar(ellF)ellH + D0 bar(zN2F)zN2H.

This is a formula on the restricted response family `F(Z,G)`. It does not
claim that the full invariant actual fifth-chaos space has dimension eight.

## 5. Signed pair and the finite error budget

Hermite parity is `H_cd(-G)=(-1)^(c+d)H_cd(G)`. Therefore replacing `F(Z,G)`
by `F(Z,-G)` changes the signs of exactly `q,A,B,ell`. The cross coefficient
for this pair is

    s5_m=|v|²-kappa²(|A|²+|B|²)-A4|q|²+B2|n|²
           +(1/d)|hN|²-C2|ell|²+D0|zN2|².

For the real phase profiles the coefficients are real by conjugation
symmetry, so these absolute squares equal the ordinary squares used in the
verifier. Relative to `s5_infinity=|v|²-|A|²-|B|²`, the eight diagonal errors
are

    0, 1/(m+1), 1/(m+1), -A4, B2, 1/d, -C2, D0.

The eight coefficient squares have sum at most `||F||₂²<=1` by Bessel for a
disk-valued response. Thus the error is at most the largest absolute diagonal
entry. Bounding each square separately and adding the entries would waste
this energy constraint.

For `m>=3` the largest absolute entry is `B2`. Its comparisons with
`1/(m+1), A4, 1/d, C2, D0` respectively reduce to

    m+2 <= 4(m-1),
    m <= 4(m-1),
    2(m+2) <= 4m(m-1),
    3m <= (m-1)(m+3),
    6 <= m(m-1)(m+3).

All hold for integer `m>=3`. At `m=2`, the maximum is `C2=2/5`. Also
`B2<4/m` for every positive `m`, since
`m(m-1)<(m+1)(m+2)`. Hence the universal bound is `4/m` for `m>=2`.
The degenerate `m=1` constants also obey that bound.

For the sharper signed enclosure define

    p=max{1/(m+1),B2,1/d,D0},
    n=max{A4,C2}.

Then `-n <= s5_m-s5_infinity <= p`. The verifier uses these exact rational
one-sided bounds. For general disk-valued `F,H`, the unsigned pairing limit
has plus signs on `v,A,B`, and its diagonal error has entries
`0,-1/(m+1),-1/(m+1),A4,B2,1/d,C2,D0`. The same `4/m` bound follows from
`sum |F_i||H_i| <= (sum |F_i|²)^(1/2)(sum |H_i|²)^(1/2)<=1`.

## 6. Three integrals and numerical certificate

For `F=phase(Z+c H21(Z)+bG)` with real `c` and `b>0`, write `Z=r exp(i theta)`
and rotate `G` by `exp(-i theta)`. Put

    t=r[1+c(r²-2)/sqrt(2)]/b,  x=t²/2.

The standard one-dimensional conditional Gaussian integrals are

    psi(t)=E[phase(t+G)]=sqrt(pi)t exp(-x)(I0(x)+I1(x))/2,
    zeta(t)=E[bar(G)phase(t+G)]=sqrt(pi) exp(-x)I0(x)/2,
    eta(t)=E[G phase(t+G)]=-sqrt(pi) exp(-x)I1(x)/2.

Their normalizations can also be checked by integration by parts:
`eta=psi'-zeta`, and the Bessel recurrence gives
`psi'=sqrt(pi)exp(-x)(I0-I1)/2`. In particular `psi` is odd, `eta` is even
and nonpositive, and `eta(0)=0`. The signed `t` in `psi` must be retained.

With radial density `2r exp(-r²)`, the three limit coefficients are

    v = integral 2r² exp(-r²)(r⁴-6r²+6) psi(t)/sqrt(12) dr,
    A = integral 2r exp(-r²)(r²-1) zeta(t) dr,
    B = integral 2r³ exp(-r²) eta(t)/sqrt(2) dr,

over `0<=r<infinity`. These match the verifier callbacks, including the
negative sign in the `B` callback. Beyond `R=8`, use
`|psi|<=1` and `|zeta|,|eta|<=sqrt(pi)/2`. Direct radial integration yields

    tail_v <= [Gamma(7/2,R²)+6Gamma(5/2,R²)+6Gamma(3/2,R²)]/sqrt(12),
    tail_A <= sqrt(pi)[Gamma(2,R²)+Gamma(1,R²)]/2,
    tail_B <= sqrt(pi/8) Gamma(2,R²).

The verifier adds symmetric intervals for these full tails before forming
`v²-A²-B²`, rounds outward to rational endpoints, and then adds the exact
finite one-sided errors. The numerical output therefore does not omit the
unintegrated four small channels or a radial tail.

The retained replay gives

    c=b=119623/500000:
      s5_infinity = -0.0040430863489843264 +/- 3.35e-20;
    c=b=14953/62500:
      s5_infinity = -0.0040437656457987513 +/- 6.46e-20.

Its exact rational finite endpoints imply the interval stated above for both
profiles. Every convex mixture of their finite payoff coordinates stays in
the same strict interval, provided its actual mixing weight belongs to
`[0,1]`. This observation does not itself establish the cubic-zero mixing
weight; that is a separate input from the cubic construction.

## 7. Reproduction, negative controls, and Lean boundary

The verifier has not been changed by this audit. Its SHA-256 is
`a989516e1897739318ac5337b61b76b959f1968210da9173d1b8b45b472b1bf7`.
The input certificate SHA-256 is
`fe17f1eee9a1dd84fbbe30c74b552df449887fa5fd6b33ba4528b253cba0ae50`.

Run the actual verifier and controls with the isolated Python interpreter:

    /Users/alingalatan/Documents/Codex/2026-10-23/w-e/work/lift_certification/venv/bin/python -I /Users/alingalatan/Documents/Codex/2026-10-23/w-e/work/quintic_projection_audit/check_negative_controls.py

`negative-controls.json` records a passing two-profile baseline and thirteen
rejections. The false strict lower bound `-1/1000` and false strict upper bound
`-1/100` recompute the actual Arb integrals and fail the corresponding final
directed inequality. The other controls cover `b=0`, `b=-1/10`, nonpositive
`m`, noncanonical/noninteger `m`, and invalid precisions including a Boolean.
No monkey patch, cached replacement of the integrator, or weakened assertion
is used. Seven integer angular controls in the core verifier independently
replay the rational Taylor identities, including `m=1,2,3,2^20,10^12`.

`QuinticTransferAudit.lean` was compiled from the assigned worktree with

    lake env lean /Users/alingalatan/Documents/Codex/2026-10-23/w-e/work/quintic_projection_audit/QuinticTransferAudit.lean

The command exited zero. Its seven theorems are `diagonal_error_bound`,
`diagonal_one_sided_bounds`, `negative_of_error_bound`,
`strict_interval_convex_mix`, `signed_step_decreases`, `signed_step_margin`,
and `cramer_three_column_cancellation`.
Each `#print axioms` result is exactly

    [propext, Classical.choice, Quot.sound].

There is no `sorry`, `native_decide`, declared axiom, Gaussian formalization,
or formal import of the external numerical coefficient. The supplied
nonnegative energy weights, their total budget, and the individual error
bounds remain explicit hypotheses of the Lean algebra. The analytic Mehler
identity, Hermite Bessel budget, conditional Bessel formulas, and directed
Arb result are the separate external components described in this audit.

## 8. Generic three-column Cramer cancellation

The added Cramer theorem takes arbitrary real `k,x0,x1,y1,x2,y2` and defines

    a1=y1-k*x1,
    a2=y2-k*x2,
    X=a2*x1-a1*x2,
    D=x0*(a2-a1)-X.

Under the sole nondegeneracy hypothesis `D != 0`, the weights

    lambda0=-X/D,
    lambda1=x0*a2/D,
    lambda2=-x0*a1/D

sum to one and cancel both coordinates of the columns
`(x0,k*x0)`, `(x1,y1)`, `(x2,y2)`. The three numerator identities are

    -X+x0*a2-x0*a1=D,
    -X*x0+x0*a2*x1-x0*a1*x2=0,
    -X*k*x0+x0*a2*y1-x0*a1*y2=0.

The Lean proof uses `ring` to normalize the common-denominator identities and
uses `div_self hD` for total mass one. It preserves the preceding six generic lemmas.
This establishes the cancellation algebra only. Nonnegative weights, the
numerical coordinate enclosures, the relation for the first column, and any
interpretation as actual response coordinates require separate evidence.
