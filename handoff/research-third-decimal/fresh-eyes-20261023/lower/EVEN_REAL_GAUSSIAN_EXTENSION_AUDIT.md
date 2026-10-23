# Independent audit: global-even ordinary-real-Gaussian extension

23 October 2026. This audits the proposed extension of the upper agent's
neutral obstruction; it adds no numerical input and no Grothendieck endpoint.

## Verdict

The extension is valid with the stated two symmetries. Let z be one standard
proper complex Gaussian and V any finite standard real Gaussian vector,
independent of z. Let F,G be measurable disk-valued functions satisfying

`F(e^(i theta) z,V)=e^(i theta) F(z,V)`,
`F(z,-V)=F(z,V)`,

and the same identities for G. Couple both underlying Gaussian classes with
ordinary physical correlation t: `E[z conj(z')]=t`, `E[V V'^T]=t I`.
Then the existing neutral proof and the same numerical certificate give

`Re(c0)-sum_(n>=1)|c_n| <= (99993/100000) gamma_dagger`.

The conclusion holds for a finite or countable independent real Gaussian
family, interpreted using its product probability space. No identity-covariance
Gaussian random vector in l2 is required.

## 1. Grading and coefficient phases

Let P_k denote the charge-one z sector of bidegree (k+1,k), and E_d the total
ordinary real Hermite degree-d projection in V. Global V reflection multiplies
E_d by (-1)^d. Thus only E_(2j) occurs. Under physical correlation t the tensor
sector has eigenvalue

`t^(2k+1) t^(2j) = t^(2(k+j)+1)`.

Consequently the odd kernel has exactly

`c_n=sum_(k+j=n) <(P_k tensor E_(2j))F,(P_k tensor E_(2j))G>`.

This is a projection identity for the original Gaussian coordinates, not a
Gaussian approximation for the law of a quadratic driver. Orthogonality and
Cauchy-Schwarz give `sum_n |c_n| <= ||F||_2 ||G||_2 <= 1`.
The c_n may be complex. Every real multiplier lambda_n in [-1,1] still gives

`Re(c0)-sum_(n>=1)|c_n| <= Re sum_n lambda_n c_n`

when lambda_0=1. No common coefficient phase, positivity, or same-response
condition is needed.

## 2. The auxiliary sign operator does not need to preserve the disk

On the global-even V subspace define

`J_V=sum_(j>=0) (-1)^j E_(2j)`.

This is a selfadjoint unitary. It is generally not pointwise reflection and
is not asserted to be a Markov operator or disk-preserving map. None of those
properties is used in the radial operator proof. In particular it must not be
introduced by claiming a physical Gaussian correlation i for real V.

Write q=1-epsilon, epsilon=1/1000, s=1/500. The admissible multiplier game is

`T=q Gamma_z tensor J_V + epsilon P0 tensor E0`
`  -2s(P2 tensor E0 + P1 tensor E2 + P0 tensor E4)`.

Its multiplier on (k,j) is

`q(-1)^(k+j) + epsilon 1_(k=j=0) -2s 1_(k+j=2)`.

This gives lambda_0=1, lambda_2=199/200 and all other lambda_n=q(-1)^n,
precisely the existing game. The E_(2j) blocks are therefore exactly the old
T_j, with unchanged radial operators and arbitrary multiplicities.

## 3. Weighted-space normalization

Charge one in z alone gives `F(re^(i theta),V)=e^(i theta) f(r,V)`. With the
upper proof's mu(r), V_rad(r), Q and u_k, set

`U(r,V)=sqrt(V_rad(r)) f(r,V)`.

The Hilbert space is `L2(dr tensor Gaussian_V)`, restricted to global-even V
functions. Since |f|<=1 and the Gaussian measure has mass one,

`||U||_2^2 <= integral V_rad(r) dr = gamma_dagger`.

Multiplication by this radial weight commutes with every E_(2j). The radial
bilinear forms become Q and `u_k u_k*`, so the existing block bounds imply
the norm of the whole orthogonal direct sum is at most 99993/100000. No
dimension or multiplicity factor occurs. Thus the bilinear form is bounded
by `(99993/100000) ||U||||W|| <= (99993/100000) gamma_dagger`.

The radial change is a congruence of bilinear forms, not an asserted unitary
map between the original and weighted L2 spaces. If a domain justification
is needed, first cut f,g to compact radial annuli; the identities hold there.
Pass to the limit in original Gaussian L2 and weighted L2 using the bounded
original multiplier and the certified bounded weighted block operator.

Countably many V coordinates follow by conditional expectation onto finite
coordinate sets. This preserves the disk, charge-one condition, and global
evenness: integrate the omitted coordinates after changing their signs too.
The conditional expectations converge in L2. Alternatively, finite-coordinate
Hermite polynomials are dense in the Gaussian product space.

## 4. Exact new scope and caveats

Any finite collection of real quadratic forms

`Q_alpha(V)=V^T A_alpha V + c_alpha`

is jointly invariant under V -> -V. Therefore arbitrary bounded nonlinear
responses `F(z,Q_1(V),...,Q_m(V))`, charge one in z alone, are covered. The
quadratic forms may share all their underlying coordinates, may be indefinite,
need not be independent, and need not have Gaussian laws. Centering and
normalization are immaterial. The proof works in the original Gaussian V
space rather than treating each Q_alpha as a Gaussian of grade two.

The stronger actual scope is every globally even F(z,V), including higher
even-order or non-polynomial V dependence. A general quadratic polynomial
with a nonzero linear part need not be even; it is covered only if the final
composed response nevertheless obeys the required global-even symmetry.

There is no claim for a general function of several charge-carrying complex
coordinates with only simultaneous charge-one symmetry. The condition here
rotates z while holding all of V fixed. On the other hand, a blanket exclusion
of every visible/remote coupling would be too strong: arbitrary dependence
on |z| together with V is already allowed. The precise tests are the two
displayed symmetries, not whether an intermediate formula is called coupled.
Terms that introduce angular charge in V relative to the singled-out z
generally fail the first symmetry and remain outside the theorem.

Separate linear Gaussian contractions may be absorbed into the responses
provided they preserve this structure. Real Gaussian Markov operators on V
preserve global evenness and the disk; complex scalar contractions of z
preserve its charge-one condition. Nonlinear final correlation preprocessing
does not follow from this argument.

No numerical recomputation is required for this extension: only the auxiliary
Hermite indexing changes from E_j of grade-two Y to E_(2j) of ordinary V.
