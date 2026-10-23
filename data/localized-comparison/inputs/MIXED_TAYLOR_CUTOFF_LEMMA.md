# Different Hermite cutoffs for different Taylor terms

This is a complete analytic comparison lemma. The numerical endpoint depends
on separately supplying all its finite inputs and checking the resulting sum.

Let F have modulus one in Gaussian L². Let phi be real and invariant under
common complex rotation, odd under conjugation. Define

    B = multiplication by i phi,
    G = F exp(i phi),
    T = F + BF + B²F/2 + B³F/6.

Then G is an admissible phase function. If mu_8=E phi^8, the real-variable
Taylor integral remainder gives

    ||G-T||₂ <= sqrt(mu_8)/24 = r.

For every admissible processed Gaussian kernel with Wiener-contractive
preprocessors, the inherited Hermite/energy contraction implies

    ||H_G-H_T||_A <= 2r+r².                                    (1)

Choose three possibly different odd cutoffs D_1,D_2,D_3. For j=1,2,3 let c_j
be an exactly specified finite Hermite vector supported in degree<=D_j.
Put X=F+sum_j c_j/j!. Floating numbers may define the c_j exactly as dyadic
rationals; their method of discovery is irrelevant once their error is bounded.

Let disjoint degree bands I partition [1,D_j], and suppose

    ||P_I(B^j F-c_j)||₂ <= epsilon_(j,I).

Orthogonality, |F|=1, and the reverse triangle inequality show

    ||P_(>D_j) B^jF||₂²
       <= E phi^(2j) - sum_I max(0,||P_I c_j||₂-epsilon_(j,I))².

Denote a nonnegative upper square root of the right side by t_j. The lower
mass must be computed with outward arithmetic, and all finite-input,
omitted-input, and coefficient-arithmetic errors belong in epsilon_(j,I).
It is invalid to subtract a numerical low-degree mass as though exact.

Suppose a_I>=||P_I X||₂ and a_(>D)>=||P_(>D)X||₂. The same comparison may
retain the contractive smoothing on X, if its smaller norms are certified.
Writing E=T-X and decomposing each B^jF-c_j into its low error and high tail,
Cauchy--Schwarz in each region gives

    sum_n ||X_n||₂ ||E_n||₂
      <= sum_(j=1)^3 (sum_I a_I epsilon_(j,I) + a_(>D_j)t_j)/j!.

If epsilon_j bounds the whole low error through D_j, then orthogonality also
gives

    ||E||₂ <= sum_(j=1)^3 sqrt(epsilon_j²+t_j²)/j! = e.

Consequently

    ||H_G-H_X||_A
      <= 2r+r² + e²
         + 2 sum_(j=1)^3 (sum_I a_I epsilon_(j,I)+a_(>D_j)t_j)/j!.    (2)

This does not require estimating the unknown high-degree terms separately
against the full norm of X. Their support forces them to pair only with the
corresponding high-degree part of X. No cancellation between unknown tails is
assumed. Inequality (2) follows by expanding the quadratic kernel, taking
absolute coefficient values, and using its contraction on each total chaos.

If the frozen vector v used to build X differs from the exact sum c_j/j!
by a finite rounding vector w, include its norm/band norms as one additional
error term. Alternatively define v directly through exact rational additions.
The implementation must make this choice explicit.

## Application data already available

The selected phase has source hash
04d581fa45e1d879623a0f233315dcfed39e0aa91c6684d554d0524ac8a71617.
Exact Gaussian moments prove r<9.143e-8. Its phase multiplier satisfies
|phi|<1, so every power B^j has operator norm at most one. The uncertainty
in the inherited finite coefficient vector is therefore amplified by at most
one for each multiplier power, rather than by a monomial coefficient envelope.

Rectangular weighted Bargmann Hilbert--Schmidt bounds supply the omitted-input
part of each epsilon_(j,I). For powers j=2,3 the exact angular decomposition
has a cosine or sine parity according to j. In positive angular charge k,
write the radial polynomial in Laguerre form with coefficients A_k. The two
orientations contribute the factor

    (chi_(z,-)chi_(w,+))^k + (chi_(z,+)chi_(w,-))^k,

times the corresponding transformed radial squared norm. For k=0 the factor
is one, counted once. This is the same finite Wick identity as in
RECTANGULAR_HS_LEMMA.md, with its original sine normalization absorbed into
A_k. Changing the Laguerre argument scale is an exact basis change.

The natural scale 1+2j alpha substantially improves the conditioning of the
parameter search. All final inequalities are nevertheless replayed with
directed arithmetic; floating search output alone is never a certificate.
