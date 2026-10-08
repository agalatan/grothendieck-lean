# A stronger first absolute moment bound for complex Wick cubics

The analytic inputs are the Wick contraction identity and estimates preceding equations (8.13)–(8.14) in Heilman–Jones–Malavolta, *Sharper Bounds for the Complex Grothendieck Constant*, arXiv:2609.25462v1: https://arxiv.org/html/2609.25462v1 . Their statements imply the scalar inequalities checked below. These refinements do not require regeneration of the Gaussian profile integrals.

## Exact refined constants

For every normalized charge-one complex Wick cubic q in H_(2,1), write m=E|q|^4. Then

    2 ≤ m ≤ 62,
    E|q|^6 ≤ 9m−12 + (4942289/100000)(m−2)^(3/2),
    E|q| < 977459/1000000 = .977459.

The previous paper uses coefficients 50 and .98, respectively.

The proof of the refined sixth-moment coefficient is the exact polynomial inequality

    (50/27)(4942289/100000)^2(1+3y²/2)^3
      − (95/2 + (165/2)y + 45y² + (135/2)y³)^2 > 0,
      0 ≤ y ≤ 1.

It is certified in `certify_cubic_constants.py` by exact rational Bernstein coefficients on twelve dyadic intervals. The factor 27/50 is the square of 3√6/10, which converts the real cumulant bound to the complex sixth-moment bound. This follows directly from the cited analytic identities. The same script also certifies the weaker first-moment bound .979598 via Cauchy–Schwarz. The stronger bound .977459 follows from the next lemma.

## Sharp scalar lemma from three moments

Let Z≥0 satisfy EZ=1, EZ²=m>1, and EZ³≤N, where N>m². Define

    α=(N−m)/(m−1),       β=(N−m²)/(m−1).

Then

    E√Z ≤ (1+√β)/√(α+2√β).

This is sharp for the stated scalar moment constraints: a two-point distribution attains equality.

Proof. Let a<b be the roots of z²−αz+β=0. Since β>0, α>0, and the polynomial at z=1 equals 1−m<0, both roots are positive and a<1<b. The distribution with masses (b−1)/(b−a) at a and (1−a)/(b−a) at b has first three moments 1,m,N.

Put r=√a, s=√b, A=r+s, B=rs, c=1/(2A³B), and define

    p(z)=c[z³+(−2A²+3B)z²+(A⁴−A²B+3B²)z+B²(A²+B)].

Direct multiplication gives the global identity

    p(y²)−y = c(y−r)²(y−s)²(y²+2Ay+A²+B) ≥ 0  (y≥0).

The leading coefficient of p is c>0. Therefore E√Z≤Ep(Z), and replacing its third moment by its upper bound N can only increase Ep(Z). The resulting value equals the expectation of p under the two-point distribution above. At its support p(a)=√a and p(b)=√b. That expectation simplifies to

    [(b−1)√a+(1−a)√b]/(b−a)
      = (1+√β)/√(α+2√β).

This proves both the inequality and its sharpness. No claim that this classical moment-majorization lemma is new is made.

## Uniform exact application to Wick cubics

Apply the scalar lemma to Z=|q|². Write x=√(m−2), so 0≤x≤√60<31/4, and put

    C=4942289/100000,
    m=2+x²,
    N=6+9x²+Cx³,
    R=977459/1000000.

The script `certify_quadrature_rho.py` checks, with exact fractions throughout, that the following three polynomials are strictly positive on [0,31/4]:

    N−m²,
    U=R²(N−m)−(m−1)−(N−m²),
    U²−4(1−R²)²(N−m²)(m−1).

They need respectively 1, 4, and 9 dyadic Bernstein intervals. The first makes the scalar lemma applicable. The second prevents a sign error when squaring. The third implies

    U > 2(1−R²)√((N−m²)(m−1)).

Divide by m−1 and rearrange:

    (1+√β)² < R²(α+2√β).

Thus the scalar bound is uniformly smaller than R, proving E|q|<.977459. The scripts emit JSON files containing the exact polynomial coefficients, subdivision intervals, and positive Bernstein lower bounds, independently inspectable without numerical libraries.

## Consequence for the lower-bound certificate

Every existing profile polynomial remains valid. In the final moment optimization, replace

    50 by 4942289/100000,
    rho=49/50 by 977459/1000000.

The coefficient of the sixth moment and the coefficient multiplying rho are nonnegative by the original certificate, so both replacements improve the bound. The admissible sigma range may be shrunk to delta*rho; retaining its old larger range is conservative. The crude t-range bound also improves from epsilon*(49/50)^2 to epsilon*(977459/1000000)^2. Epsilon remains 37/50. A new lower Grothendieck bound requires completion of the profile verification and recomputation of the envelope; it does not follow from the moment lemma alone.

The auxiliary first-moment number .977459 is not a Grothendieck bound. It is an improvement in a dimension-independent moment inequality used by the lower-bound construction. No global record claim is made in this note.
