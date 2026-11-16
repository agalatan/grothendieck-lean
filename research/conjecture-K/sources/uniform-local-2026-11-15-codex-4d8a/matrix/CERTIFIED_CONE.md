<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-4d8a-uniform-local-2026-11-15/conjecture_k_uniform_local_codex_4d8a/matrix/CERTIFIED_CONE.md, 15 November 2026; Agent-ID: codex-4d8a. -->
<!-- handoff/codex-4d8a-compensated-joint/matrix/CERTIFIED_CONE.md — Agent-ID: codex-4d8a -->
# A certified compensated joint cone: V ≤ W/1400

**Status:** verified within this session: the analytic proof was independently
re-derived by the odd-proof review agent, and the complete binary64
outward-interval certificate and exact rational checks were replayed by the
certificate agent. The independent reader did not repeat the numerical run.
This is not an external review or a Lean formalization. It proves a region of
the centered joint premise, not the general compact premise or Conjecture K.

Use a=699/1250, b=179/1250, p=2500/1891, ρ=5053/10000,
T=|Z|², L=Z(a+bT), and d(T)=(T−2)/sqrt(2). For fixed remote values,

    Y=L+w,
    K=(T−2/5)A+(3/5)ρB+Z²conjugate(B)/sqrt(2),
    O=ZQ+conjugate(Z)P+ν Z d(T),
    S_r=|A|²+|B|², omega=|Q|²+|P|²+|ν|²,
    R=A+ρB, U=B−ρA,
    B_P=(p−463/5000)S_r−(67/100)|R|²−(2/25)|U|²
                                   +( |w|²/2+S_r )S_r.

Let

    h=E[ sqrt(T) d(T)/(a+bT) ],
    C(Q,ν)=2h[(11/20)Re(Q)Re(ν)+Im(Q)Im(ν)],
    F_joint=E_Z J(Y;K,O)−B_P−p omega−C(Q,ν),

where J is the finite joint remainder in `SHARP_TRADEOFF.md`.

## The proved conditional inequality

For **every** w,A,B,Q,P,ν in C, with no amplitude restrictions,

    F_joint ≤ (g−|w|²/2)S_r−S_r²−κ omega,                 (1)

where the exact constants are

    g = 218346546301873/18910000000000,
    κ = 3232409/378200000 > 0.

The certificate provides strict matrix inequalities; the non-strict version
(1) is convenient and sufficient.

## The global cone and its relation to the retained row

Let A=r_A and B=r_B be jointly circular complex Gaussian linear forms,
with arbitrary sharing with q,Q,P. Let ν be constant, E Q=0, and set

    V=E S_r, W=E omega.

The conditional bound (1), integrated over the complete remote law, gives

    E F_joint ≤ gV−κW−(3/2)V²−(1/2)E[|q|²S_r].          (2)

Indeed, if the two-driver covariance matrix is Σ, then
E S_r²=(tr Σ)²+tr(Σ²)≥(3/2)V². No eventwise or conditional centering
is used. The Q/ν compensation remains inside F_joint; its full expectation
vanishes because E Q=0 and ν is constant.

The exact check verifies g/1400 ≤ κ−1/4000. Consequently

    V≤W/1400  ⇒
    E F_joint ≤ −W/4000−(3/2)V²−(1/2)E[|q|²S_r] ≤ 0.   (3)

This is a **global energy cone**, not the much stronger requirement that
S_r≤omega/1400 holds at every remote sample. It holds in every finite
dimension with arbitrary sharing. Neither u nor W is capped, and the
constant ν need not satisfy |ν|²≤1/50.

Inside the domain of the existing frozen assembly in STATUS 7.5.6, (3)
therefore supplies its missing averaged premise and gives the unchanged
trial T_(xi0,0)<S+49.36e−6, with xi0=−(3/5)(r_A+ρr_B).
This last consumer statement uses the already established matched-content,
remote and frozen scalar-budget inputs; (1)–(3) themselves do not.

## Proof of the odd matrix bound

Apply the sharp global scalar inequality (T_c) with c=9/20:

    J(Y;K,O) ≤ [ (11/2)K_r²+K_t²
                         +(11/20)O_r²+O_t² ]/|Y|.

For the odd part this is the matrix from the reviewed odd-core construction,
with its half-radial subtraction replaced by 9/20. The compensating proxy
has Q/ν entries

    Cproxy_real=−3345/10000, Cproxy_imag=−6081/10000.

Fresh exact radial integration encloses

    −608079/10^6 < h < −608078/10^6.

It follows by direct rational comparison that

    ||C−Cproxy|| < 3/50000.                                (4)

The symmetric real/imaginary 3×3 blocks are certified, for all 0≤|w|≤8,
to obey

    M_(9/20)(|w|)−Cproxy ≺ (262689/200000) I.              (5)

The full recompute used 320 adjacent |w| intervals, 512 radial cells over
0≤|Y|≤24, and 128 angular cells over 0≤arg(Y)≤π. The interval program
includes spatial midpoint errors, interpolation in |w|, and the omitted
spatial tail. Every bound passed; the maximum was

    90259222105/68719476736 = 1.3134445486502955,

on |w|∈[9/20,19/40], strictly below 262689/200000=1.313445.

The source `certify_tradeoff.cpp` is the previously reviewed nonsingular
odd-core checker with exactly two mathematical changes: radial subtraction
1/2 becomes 9/20, and the two compensation constants become Cproxy.
All derivative, quadrature, interpolation, outward rounding and LDL
checks are recomputed for the new integrands. The previous result table is
not reused. Its nonsingular coordinates are Y=ρ exp(iθ), L=Y−w and
T=τ(|L|²), where τ is the inverse of t(a+bt)². The spatial tail remains
bounded by 3863 exp(−20)/24 because the new quadratic form is still at
most |O|²/|Y|.

For |w|≥8, the old analytic tail argument applies unchanged: the norm of
the uncompensated odd matrix is <1/2. This only uses that its radial and
tangential eigenvalues are at most 1. Thus its compensated norm is
less than 1/2+6081/10000, much smaller than the compact cap, even after
(4). The analytic argument splits |L+w|≥|w|/2 and its complement,
uses T>6 on the latter, and the decreasing pushed-forward weighted
radial density; its two contributions are each <1/4.

Combining (4)–(5) with the unbounded tail proves globally

    E_Z[((11/20)O_r²+O_t²)/|Y|]−C(Q,ν)
       ≤ (262689/200000+3/50000) omega
       = (p−κ) omega.                                    (6)

## Proof of the even allowance and assembly

The global inverse-potential primitive, freshly checked in exact arithmetic,
is

    E_Z[|K|²/|L+w|] ≤ (217/100)S_r.                        (7)

Here is its full scalar argument. Pointwise |K|²≤S_r W(T), where

    W(T)=(T−2/5)²+[(3/5)ρ+(177/250)T]²,
    D(T)=(a+bT)(a+3bT).

The replacement 177/250>1/sqrt(2) is checked by squaring. The polynomial

    (81/100)D(T) sum_{j=0}^4 T^j/j!−W(T)

has positive constant coefficient 686323/500000000. The remaining part
is Tq(T), where q is convex for T≥0 and its tangent at 5/4 has positive
intercept 4102880111/64000000000 and positive slope
2094736121/64000000000. Hence the polynomial is positive on the entire
half-line. Under the map z↦L(z), the normalized measure |K|² dγ/S_r
therefore has density ≤81/(100π) and total mass at most
H²=1+(9/25)(1+ρ²). The planar layer-cake inverse-potential bound is
2sqrt(π × density_cap × mass)=(9/5)H<217/100, giving (7).

Consequently the even part of (T_(9/20)) is bounded by

    (11/2)E_Z[|K|²/|Y|] ≤ (2387/200)S_r.

Also |R|²+|U|²=(1+ρ²)S_r, so

    B_P≥[m+|w|²/2+S_r]S_r,
    m=p−463/5000−(67/100)(1+ρ²)>0.

Subtract this lower bound and the odd price p omega from the scalar
tradeoff plus (6). The result is exactly (1), with g=2387/200−m.

## Reproducibility and remaining gap

- `node verify_tradeoff.mjs`: exact polynomial identity proving the scalar
  dual step, with its support/convexity proof in `SHARP_TRADEOFF.md`.
- `python3 -I verify_certificate.py`: fresh exact h enclosure, proxy error,
  global even potential, complete saved-result coverage and cone arithmetic.
- `python3 -I trig_intervals.py verify trig128.txt`: exact trigonometric inputs.
- `python3 run_certificate.py --workers 4`: rebuild and recompute all 320
  matrix intervals, preserving supplied results in `results/`.

The completed run took 210.85 seconds on GCC 14.2 with
`-O3 -std=c++17 -fno-fast-math -ffp-contract=off`, using four workers.
No Lean theorem or published Grothendieck bound changes.

The central region V≫W/1400 remains unresolved. In particular, the
nearly-even problem cannot be closed by this quadratic tradeoff alone.
The much stronger cone suggested by the numerical even matrices has not
been certified here.
