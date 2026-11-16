<!-- Verbatim from /private/tmp/claude-501/-Users-alingalatan-workspaces-grothe/5cd9b705-6072-44d0-a4e1-13a1e3d002d0/scratchpad/gpt-cubic-chaos4/x/edge3_improved_certificate.md, 16 November 2026; GPT (a ChatGPT session of the user), relayed by the user. -->
# Explicit dimension-free local cubic bound

This proof is rigorous throughout. All constants are numerical and deliberately conservative.

Let F be in the real third Wiener chaos, E F^2=1, and let

    δ=E F^4−3,   κ6=E F^6−15E F^4+30,   c=sqrt(2/pi).

We prove

    |E|F|−c(1−δ/24+κ6/240)| ≤10^64 δ^(3/2).              (1)

Consequently, using the separately established cubic cumulant estimate

    |κ6|≤(485/2)δ^(3/2),                                 (2)

one has

    |E|F|−c+cδ/24| ≤10^65 δ^(3/2).                       (3)

In particular the completely explicit choice

    δ0=10^(−140)

gives

    E|F| ≤ c−cδ/48 < c,       0<δ≤δ0.                    (4)

Indeed 10^65 sqrt(δ0)=1/100000<c/48; the latter follows already from c>1/2.

The exact algebraic expansion used below is Lemma 4.1 and Corollary 6.14 of Mansanarez–Poly–Swan, *Edgeworth expansion on Wiener chaos*, arXiv:2510.14002v2, https://arxiv.org/html/2510.14002v2. The numerical remainder constant is derived here, not taken from an unspecified constant in that paper. Estimate (2) is supplied separately by the cumulant-diagram proof.

## A. Weighted semigroup estimates

Write w_d(x)=(1+|x|)^d and M_d=E w_d(Z) for standard normal Z. For integer d≥1,

    M_d≤2^d d!,   M_0=1,                                (5)

because E|Z|^d≤d! by the Gaussian absolute-moment recurrence.

Let L=∂^2−x∂ and P_t its one-dimensional OU semigroup. If |u|≤Cw_d then

    |P_tu(x)|≤C M_d w_d(x).                              (6)

If in addition E u(Z)=0, then the following global decay estimate holds:

    |P_tu(x)|≤C D_d e^(−t)w_(d+1)(x),
    D_d=3M_(d+1)^2.                                     (7)

For 0≤t≤1, (6) proves (7), since e M_d≤3M_(d+1)^2. For t≥1, Mehler differentiation gives

    |(P_tu)'(x)|≤2e^(−t)C M_(d+1)w_d(x).

Use E P_tu(Z)=0 and subtract P_tu(Z) from P_tu(x). Integrating this derivative along the segment from x to Z, and using

    |x−Z|≤w_1(x)w_1(Z),
    w_d(y)≤w_d(x)w_d(Z) for y on that segment,

gives |P_tu(x)|≤2e^(−t)C M_(d+1)^2 w_(d+1)(x), which is (7).

For α>−1 define the resolvent on mean-zero functions by

    R(α)u=(L−α)^(-1)u=−∫_0^∞e^(−αt)P_tu dt.

Given any finite list α_1,...,α_r>−1, the semigroup law and (7) imply

    |R(α_1)...R(α_r)u(x)|
       ≤C D_d w_(d+1)(x) prod_(i=1)^r(1+α_i)^(-1).       (8)

Proof: write the product as the r-fold integral of
(-1)^r exp(−sum α_i t_i)P_(sum t_i)u(x), then apply (7). The resulting integrand is bounded by
C D_d w_(d+1)(x) prod exp(−(1+α_i)t_i), which is integrable. This also justifies Fubini and the product representation. The identity operator (r=0) satisfies (8) as well, with the empty product equal to 1, since D_d≥1 and w_d≤w_(d+1).

The resolvents preserve Hermite rank; their multiplier on H_k is −1/(k+α). All our inputs have rank at least 2 when a negative shift occurs.

Define S=(L−2)^(-1)∂^2. It acts on H_k as −(k−1)H_(k−2), k≥2, and kills H_0,H_1. On continuous functions of polynomial growth it can be represented by

    S u(x)=u(x)−E u(Z)
       −x∫_0^∞ e^(−t)/sqrt(1−e^(−2t))
              E[Z u(e^(−t)x+sqrt(1−e^(−2t))Z)]dt.

The signs follow from S u=−∫_0^∞(P_tu)''dt and (P_tu)''=∂_tP_tu+x(P_tu)'. Therefore

    |S u(x)|≤C A_d w_(d+1)(x),
    A_d=1+M_d+2M_(d+1),                                (9)

using ∫_0^∞e^(−t)/sqrt(1−e^(−2t))dt=pi/2<2.

For sharper constants we compute the needed weighted Gaussian moments explicitly. With c=sqrt(2/pi)<1, the ordinary absolute moments of orders 0,...,9 are

    1,c,1,2c,3,8c,15,48c,105,384c.

The binomial theorem therefore yields

    M_5=26+33c<59,
    M_6=76+94c<170,
    M_7=232+293c<525,
    M_8=764+952c<1716,
    M_9=2620+3297c<5917.

In particular the four numerical bounds needed below are

    A_5<400,
    D_6<3·525^2=826875,
    A_7<3958,
    D_8<3·5917^2=105032667.                            (10)

## B. The two algebraic operators and their explicit bound

For d=4 or 8, define

    P_d(z)=z(z+1)...(z+d)=sum_(α=1)^(d+1)a_(d,α)z^α.

All coefficients are nonnegative, and their sums are

    sum a_(4,α)=5!=120,
    sum a_(8,α)=9!=362880.

Set Y=L−2, and, for j=0,...,d, put

    Q_(d,j)(L)=3^(−j−1)Y^(−j)
       −sum_(α=1)^j a_(d,α)3^(α−j−1)Y^(α−j)P_d(3Y)^(-1),
    T_(d,j)=−Q_(d,j)(L)S.                              (11)

This is the p=3 specialization of MPS Lemma 6.6. The denominator factors as

    P_d(3(L−2))^(-1)=3^(−d−1)prod_(i=0)^dR(2−i/3).      (12)

Every scalar power of 3 in (11),(12) is at most 1.

For d=4, every resolvent in a term of Q_(4,j) has positive shift, namely 2−i/3 for i=0,...,4, possibly with extra shifts 2. Hence the product in (8) is at most 1. Summing coefficients in (11) gives, whenever E u(Z)=0,

    |u|≤Cw_e  implies
    |Q_(4,j)u|≤121 C D_e w_(e+1).                       (13)

For d=8, the denominator shifts are

    2,5/3,4/3,1,2/3,1/3,0,−1/3,−2/3.

All extra shifts are 2. The positive shifts contribute factors ≤1 to (8), while the three nonpositive shifts contribute

    1 · (3/2) · 3=9/2<5.

Therefore, for the relevant mean-zero inputs,

    |u|≤Cw_e  implies
    |Q_(8,j)u|≤5·362881 C D_e w_(e+1).                  (14)

If ||b||∞≤1 and ψ=Proj_(≥6)b, then

    |ψ(x)|≤200w_5(x).                                  (15)

For verification, the sums of absolute polynomial coefficients of H_0,...,H_5 are 1,1,2,4,10,26, and |E[b(Z)H_k(Z)]/k!|≤1/sqrt(k!)≤1. In fact 45w_5 is sufficient.

The rank of ψ is at least 6. The first S lowers rank by at most 2, then all Q resolvents preserve it; thus T_(4,j1)ψ has rank at least 4. The second S produces rank at least 2, and again all inverses in Q preserve it and are legitimate. Applying (9), (13), (9), (14) in that order gives

    |T_(8,j2)T_(4,j1)ψ(x)|
       ≤200·121·5·362881·A_5 D_6 A_7 D_8 w_9(x)
       ≤C_* w_9(x),                                   (16)

where the integer

    C_*=200·400·121·826875·3958·5·362881·105032667
       =6037395629020145575069500000000.

This bound holds for all 45 choices j1=0,...,4 and j2=0,...,8 and scales linearly with ||b||∞.

## C. Random factors and the exact remainder

Let L_n be the Gaussian OU generator on the original probability space, and set

    G=||DF||^2−3,
    v=E G^2,
    W_(j1,j2)=G L_n^j2(G L_n^j1G).

Then G belongs to chaoses ≤4, and G L_n^j1G belongs to chaoses ≤8. Hypercontractivity, the spectral bound ||L_n^jU||_2≤d^j||U||_2 on chaoses ≤d, and Hölder imply

    ||W_(j1,j2)||_2
       ≤3^10·4^j1·8^j2 v^(3/2)
       ≤W_* v^(3/2),
    W_*=3^10·4^4·8^8=253613523861504.                   (17)

Explicitly: ||G||_4≤9sqrt(v); ||G L_n^j1G||_2≤81·4^j1v; and applying L_n^j2 and the L4 bound on degrees ≤8 adds the factor 81·8^j2. Multiplication by G and Hölder gives the stated factor 9·81·81=3^10.

Also,

    ||w_9(F)||_2≤(1+||F||_18)^9
                 ≤(1+17^(3/2))^9<72^9
                 =51998697814228992.                   (18)

Write F^2=1+B_2+B_4+B_6 in orthogonal chaoses. The diffusion rule gives G=2B_2+B_4, while E F^4=E[F^2||DF||^2] by Gaussian integration by parts. Consequently

    δ=2||B_2||_2^2+||B_4||_2^2,
    v=4||B_2||_2^2+||B_4||_2^2≤2δ.                     (19)

The exact MPS double expansion reads

    E[(Proj_(≥6)b)(F)G]
       =sum_(j1=0)^4 sum_(j2=0)^8
          E[(T_(8,j2)T_(4,j1)Proj_(≥6)b)(F) W_(j1,j2)].

Combining (16)–(18),

    |E[(Proj_(≥6)b)(F)G]|
       ≤45 C_* W_* 72^9 ||b||∞ v^(3/2).                (20)

For a bounded 1-Lipschitz h, the Gaussian Stein solution obeys

    φ'_h(x)=−∫_0^∞ e^(−2t)/sqrt(1−e^(−2t))
        E[Z h'(e^(−t)x+sqrt(1−e^(−2t))Z)]dt,

so ||φ'_h||∞≤c<1: the scalar integral equals 1. Lipschitz functions follow by smooth approximation. Lemma 4.1 of MPS, with M=6,p=3, gives the exact identity

    E h(F)−E[h(Z)(1+δH_4(Z)/24+κ6H_6(Z)/720)]
       =−(1/3)E[(Proj_(≥6)φ'_h)(F)G].

All odd correcting coefficients vanish because F is symmetric. From (19),(20), and 2^(3/2)<3, the absolute difference is at most R_*δ^(3/2), where

    R_*=45 C_* W_*72^9
       =3582836798419111730714888692678936887882154137008209920000000000
       <10^64.

Take h_M(x)=min(|x|,M). The preceding bound is independent of M. Dominated convergence as M→∞ is justified by E|F|<∞ and the Gaussian integrability of |Z| times the correcting polynomial. The identities

    E|Z|H_4(Z)=−c,
    E|Z|H_6(Z)=3c

prove (1). Combining (1),(2) proves (3), because c(485/2)/240<2 and 10^64+2<10^65.

The file `edge3_check_constants.js` verifies all displayed weighted-moment coefficients, all four numbers in (10), and the exact products C_*,W_*,72^9,R_* using Node.js BigInt arithmetic. It also checks R_*+2<10^65 and the final comparison 10^(-5)<1/96<c/48.

For completeness, this also gives an explicit value for the MPS total-variation constant. For ||h||∞≤1, the usual Stein estimate is ||φ'_h||∞≤4. The total variation normalization adds the factor 1/(2p)=1/6. Thus

    d_TV(Law(F),correcting measure)
       ≤30 C_*W_*72^9 v^(3/2)<10^64 v^(3/2).

Therefore C_(3,2)=10^64 is a valid explicit constant in their theorem with the unnormalized carré du champ Γ=||DF||^2.

## D. Exact algebra identity: rank and analytic justification

For smooth u of polynomial growth, self-adjointness and the diffusion identity give

    E[(3Lu)(F)W]=E[u(F)L_nW]−E[u''(F)GW].

Iterating this identity through the annihilating polynomial P_d(L_n), and using P_d(L_n)W=0 when W belongs to chaoses ≤d, gives

    E[(P_d(3L)u)(F)W]
       =−sum_(j=0)^dE[(P_(d,j)(3L)u)''(F)G L_n^jW],

where P_(d,j)(z)=sum_(α=j+1)^(d+1)a_(d,α)z^(α−j−1). Put u=P_d(3L)^(-1)ψ and use ∂^2L=(L−2)∂^2. The result is

    E[ψ(F)W]=sum_(j=0)^dE[(T_(d,j)ψ)(F)G L_n^jW].

The unshifted inverse P_d(3L)^(-1) is legitimate on rank r>d/3. In our two applications the ranks are respectively 6>4/3 and 4>8/3. Existence in the class of smooth functions of polynomial growth follows from the rank-resolvent statement in MPS Proposition 3.15 and Proposition 3.19 (or their higher-derivative Mehler proof). This auxiliary existence step does not involve any constant used above; all evaluated T operators are bounded explicitly in A–B using only shifts >−1.

For continuous inputs, approximate ψ by P_εψ. This preserves rank, gives uniform polynomial bounds by (6), and converges pointwise. The integral formulas for S and all combined resolvents provide dominated convergence and uniform polynomial growth for the T operators. Polynomial moments of F and W then allow the exact identity to pass to the limit. Applying it first with d=4,W=G and then with d=8,W=G L_n^j1G proves the double expansion used in C.

The proof extends from finite-dimensional chaos polynomials to elements of the closed third chaos by finite-dimensional approximation and hypercontractivity. All estimates are independent of dimension.
