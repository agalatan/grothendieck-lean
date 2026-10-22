# A global spherical dual for a finite Gaussian Hermite game

This is a global analytic reduction [P], with exact supporting checks [C]. It is
not a new numerical Grothendieck endpoint. The scalar truncation and ratio logic
is also proved in Lean [L], but the spherical harmonic/Gaussian bridge below is
not Lean formalized. No assertion of literature novelty is made.

## 1. The target and the distinction from a coordinate core

Let P_k=P_(k+1,k) in standard proper complex Gaussian space, and let

    W_lambda(f,g) = sum_k lambda_k Re <P_k f,P_k g>,
    N_G(lambda) = sup_n sup_(|f|,|g|<=1, charge 1) W_lambda(f,g).

Assume lambda_k=0 for k>D. We seek a cap for this supremum in **all** Gaussian
dimensions. We do not replace a cubic by a new independent Gaussian, truncate
the input coordinates, or assume anything about tensor influence.

On the probability sphere S^(2m-1) in C^m, let H_r be the complex spherical
harmonics of bidegree (r+1,r), with projection Pi_r. Write N_S,m(a) for the
infinity-to-one norm of sum_r a_r Pi_r on charge-one disk-valued functions.

The result constructs an explicit sequence a, depending on lambda and m, such
that

    N_G(lambda) <= N_S,m(a).

The right side is a **global outer problem**, not an equality at finite m. Its
response functions are still constrained pointwise to the complex unit disk.
When m>2D+3, this operator is compact and has an attained norm. Truncating the
operator has an explicit uniform error independent of the response's phase tail.

## 2. Exact stochastic harmonic conversion

Put C_(m,r)=binom(m+r-2,r) and

    q_(m,r)(s) = P_r^(m-2,1)(2s-1)/C_(m,r),
    Phi_(m,r)(z) = z q_(m,r)(|z|^2).

The spherical addition formula normalizes Phi(1)=1. The dimension is

    d_(m,r) = binom(m+r,r+1)binom(m+r-1,r)
              - binom(m+r-1,r)binom(m+r-2,r-1),

with the second term zero for r=0. For every k>=0,

    z|z|^(2k) = sum_(r=0)^k b_(m;k,r) Phi_(m,r)(z),
    b_(m;k,r) = d_(m,r) (m-1)! k!(k+1)! / [(k-r)!(m+k+r)!].             (1)

In particular b>=0 and sum_r b=1. These are exact rational numbers.

Proof: the squared radius s of the first coordinate of a uniform sphere point
has density (m-1)(1-s)^(m-2). Orthogonality gives

    b = d_(m,r)(m-1) integral_0^1 s^(k+1)(1-s)^(m-2)q_(m,r)(s) ds.

Insert shifted Jacobi Rodrigues and integrate by parts r times. The integral
before division by C is binom(k,r) B(k+2,m+r-1). This gives (1). Evaluating the
polynomial identity at z=1 proves row mass one. Boundary terms vanish because
the Rodrigues polynomial has the required endpoint multiplicities.

## 3. Restrict the same actual responses

For independent Gaussian vectors X_1,...,X_m in C^n, define, on the sphere,

    F_X(u)=f(sum_j u_j X_j),    G_X(u)=g(sum_j u_j X_j).

**Both use the same Gaussian matrix X.** They remain disk-valued and charge one.
Every coordinate overlap between f and g is retained. For c_k=Re<P_k f,P_k g>,
the Mehler identity gives their averaged cross kernel

    E_X[conj(F_X(u))G_X(v)] = sum_k <P_k f,P_k g> z|z|^(2k),
    z=<u,v>.

Take the real part of the trace on H_r and use (1). Then

    E_X Re<Pi_r F_X,Pi_r G_X> = sum_(k>=r) b_(m;k,r)c_k.                (2)

The absolute coefficient budget sum|c_k|<=1 follows from Bessel and
Cauchy-Schwarz. Equation (1) and row mass justify every rearrangement for a
bounded sequence a. Thus this is a response-level identity, not a statement
about the marginal distribution or covariance of an isolated cubic.

## 4. The inverse is a derivative functional at zero

Let ell(p)=sum_(j=0)^D lambda_j [s^j]p. Define

    a_(m,r) = ell(q_(m,r))
      = 1/C_(m,r) sum_(j=0)^min(D,r)
          lambda_j (-1)^(r-j) (r+m)_j binom(r+1,j+1)/j!.                (3)

Applying ell to the polynomial identity in (1) proves, at **every** k,

    sum_(r=0)^k b_(m;k,r)a_(m,r) = lambda_k.                             (4)

This is an inverse on polynomials, not a numerically inverted finite matrix.
For fixed m,D, (3) gives a_r=O(r^(2D+3-m)). Consequently a is bounded for
m>=2D+3, and tends to zero when m>2D+3.

Combining (2) and (4) proves the exact identity

    W_lambda(f,g)
      = E_X sum_r a_(m,r) Re<Pi_r F_X,Pi_r G_X>.                         (5)

Therefore N_G(lambda)<=N_S,m(a). This is the promised global outer bound.

If a_r tends to zero, the spherical operator is compact on L2: its irreducible
eigenspaces are finite dimensional, and finite spectral truncations converge
in operator norm. The charge-one unit disk of L-infinity is weak-star compact.
On this disk, weak-star convergence implies weak L2 convergence. Compactness
of the operator makes the bilinear objective jointly continuous on the bounded
weak-star product. Its maximum is therefore attained. This supplies compactness
of the outer problem without a coordinate-core assertion about the original
Gaussian response.

## 5. A complete cubic tail certificate

For lambda=(1,-epsilon,0,...), (3) simplifies to

    a_(m,r)=(-1)^r u_(m,r),
    u_(m,r)=(r+1)/binom(m+r-2,r) * [1+epsilon r(r+m)/2].                 (6)

For m>=6 and 0<=epsilon<=1, u_(m,r) is nonincreasing for r>=1. Indeed

    u_(r+1)/u_r = (r+2)/(m+r-1)
                   * [2+epsilon(r+1)(r+m+1)]/[2+epsilon r(r+m)],

and the nonnegative difference of the cross-multiplied denominator and numerator
is exactly

    2(m-6)+6(1-epsilon)
      +epsilon[(m-5)(r-1)(r+m+2)+(m-6)(m+1)].                          (7)

All denominator factors are positive. Let a^L be a through index L and zero
afterward. Bessel gives, for every response pair on this sphere,

    | W_a(F,G) - W_(a^L)(F,G) | <= u_(m,L+1),

and hence

    N_G(1,-epsilon) <= N_S,m(a^L) + u_(m,L+1).                          (8)

There is **no omitted-response-tail hypothesis** in (8). A response can have
the previously proved slow D^(-1/2) phase-energy tail. We truncate the compact
dual operator instead. Equations (4)-(5) also show why retaining a few ordinary
spherical harmonic energies without the inverse multipliers is not equivalent:
ordinary spherical degree and Gaussian chaos degree are not identical.

## 6. Converse: an actual Gaussian lift, not a fake law

For sphere functions F,G, let f(Z)=F(Z/|Z|), g(Z)=G(Z/|Z|), for a standard
Gaussian vector Z in C^m. These are actual bounded charge-one Gaussian responses.
If d_r=Re<Pi_r F,Pi_r G>, their Gaussian coefficients are

    c_k = sum_(r=0)^k v_(m;k,r)d_r,
    v_(m;r+j,r) = gamma_(m,r) (r+1/2)_j^2/[j!(m+2r+1)_j],
    gamma_(m,r)=Gamma(m+r+1/2)^2/[Gamma(m)Gamma(m+2r+1)].                (9)

Each column of v is nonnegative and sums to one. To prove (9), multiply a
spherical harmonic of degree d=2r+1 by the radial Laguerre basis
R^d L_j^(m+d-1)(R^2). Its inner product with the radially constant lift is
computed by

    integral_0^infinity t^(m+d/2-1)e^-t L_j^(m+d-1)(t)dt
       = Gamma(m+d/2)(d/2)_j/j!.

Divide its square by the Laguerre squared norm
Gamma(m+d+j)/(Gamma(m)j!) to obtain (9). Gauss's hypergeometric identity, with
c-2a=m>0, proves column mass one. Different spherical harmonic types remain
orthogonal, including within a single Gaussian chaos, so this holds for mixed
signed coefficients, not only for energies.

For the cubic game the lifted Gaussian payoff is

    mu_0 d_0 + mu_1 d_1,
    mu_0=gamma_(m,0)[1-epsilon/(4(m+1))],
    mu_1=-epsilon gamma_(m,1).

Consequently the exact outer norm converges to the Gaussian norm:

    0 <= N_S,m(a)-N_G(1,-epsilon) <= eta_m,                              (10)
    eta_m = max{(1+epsilon)/(4m),
                 2(1+epsilon)/(m-1)+9epsilon/(4m),
                 6[1+epsilon(m+2)]/[m(m-1)]}.

For completeness, 1-gamma_(m,r)<=(2r+1)^2/(4m). First
gamma_(m+1,0)/gamma_(m,0)=1+1/[4m(m+1)], and gamma_(m,0) tends to one
(Wallis). The infinite product and the telescoping sum give
gamma_(m,0)>=1-1/(4m). Next

    gamma_(m,r+1)/gamma_(m,r)
       =(m+r+1/2)^2/[(m+2r+1)(m+2r+2)]

lies in (0,1), and its deficit is at most 2(r+1)/m by cross multiplication.
Sum these deficits and use 1-product(1-x_j)<=sum x_j. Equation (10) now follows
by comparing a with mu: indices 0 and 1 give the first two bounds; all remaining
indices are bounded by u_(m,2), the third bound. The radially lifted pair has
Gaussian payoff at most N_G. This explicitly prices the outer relaxation and
does not assert that every sphere response is a Gaussian random restriction.

## 7. Independent phase calibration

For F(u)=G(u)=phase(u_1), its spherical energies are the exact rationals

    e_r = d_(m,r) I_r^2,
    I_0=2^(2m-1)m!(m-1)!/(2m)!,
    I_(r+1)=-I_r(2r+1)/(2m+2r+1).

They obey

    sum_r a_(m,r)e_r = pi/4-epsilon pi/32,

the ordinary Gaussian phase payoff. One can see this without another
hypergeometric identity: restrict the Gaussian function phase(z_1). Every
nonzero random restriction is a unitary rotation of phase(u_1), so (5) applies
with a deterministic spherical energy sequence. This is a useful calibration
for implementations; ordinary spherical linear energy alone is not pi/4.

## 8. What became finite, and what did not become cheap

For fixed m,L the truncated operator has complex rank

    R_(m,L) = binom(m+L,L+1)binom(m+L-1,L).

It has an attained maximum, and a maximizing response pair can be chosen as
the phases of two polynomials in the finite spherical range. Thus (8) really
replaces the arbitrary-dimension global norm question by a finite coefficient
optimization with an exact error. It does not supply a cheap global optimizer.

For epsilon=149/200:

- m=32, L=12 has error 17513/209010560960 < 8.38e-8, but rank
  796315556846635874048.
- m=64, L=8 has error 7561/229150398400 < 3.30e-8, but rank
  905527955069643276800.

The rank is why brute-force coefficient optimization is rejected. The O(1/m)
outer comparison in (10) is a separate cost: making the operator tail small
does not make the finite-m outer norm close by the same amount. A credible next
step must exploit unitary symmetry in the **norm certificate**, e.g. an exact
positive operator/localizing certificate, rather than declare either error free.

There is an intrinsic dimension floor as well. Let K_C(m) denote the
Grothendieck constant with vector dimension restricted to m. For any bounded
spherical multiplier with a_0=1,

    N_S,m(a) >= 1/K_C(m).                                               (11)

Proof: the vector-valued response u -> u has unit norm at every point, and its
payoff is exactly sum_j <u_j,T_a u_j>=1, because each coordinate is in the first
spherical harmonic. Approximate this map in L2 by unit-valued step maps, using
a finite partition into small sphere cells. The associated finite matrix has
vector value tending to one in C^m and scalar value at most N_S,m(a). The latter
remains true for non-equivariant step phases: circle averaging projects them
onto charge-one disk-valued functions without changing their pairing with T_a.
Apply the finite-dimensional Grothendieck inequality and pass to the limit.

Thus choosing a small m is not a free dimension reduction. A proposed target
B is impossible in this outer problem whenever B<1/K_C(m), regardless of L or
tail accuracy. This is a conceptual cost in addition to the coefficient rank;
the small-m tail examples are calibration data, not evidence for a sharp cap.

## 9. A sharper obstruction: compactness does not give a square-integrable kernel

There is an exact identity, not merely a dimension-count estimate:

    d_(m,r)|a_(m,r)|^2
      = (m+2r)(m+r-1)(r+1)/(m-1)
          * [1+epsilon r(r+m)/2]^2.                                    (12)

Indeed the dimension formula gives

    d_(m,r)/C_(m,r)^2 = (m+2r)(m+r-1)/[(m-1)(r+1)],

which cancels the squared binomial denominator in (6). For epsilon>0,
(12) is a degree-seven polynomial in r with leading coefficient
epsilon^2/[2(m-1)]. Even at epsilon=0 it grows cubically. In particular

    sum_r d_(m,r)|a_(m,r)|^2 = infinity

for every fixed m in the compact regime. The inverse spherical operator is
**not Hilbert--Schmidt**, and cannot be represented by a square-integrable
kernel on the product sphere. The truncated squared Hilbert--Schmidt norm
grows as epsilon^2 L^8/[16(m-1)] for epsilon>0, even though the omitted
operator norm tends to zero as O(L^(5-m)).

This identifies a second concrete failure of a tempting numerical route:
kernel quadrature followed by an unsigned Hilbert--Schmidt estimate cannot
certify this operator. A useful certificate must exploit its signed action
on the bounded response body. This statement concerns the transmuted inverse
operator, not every Hilbert--Schmidt comparison used elsewhere in the project.

The obstruction is not special to the cubic. If lambda_D is the highest
nonzero coefficient of a finite witness, (3) and the dimension formula give

    d_(m,r)|a_(m,r)|^2 ~
       2 lambda_D^2 / [(m-1)(D!)^2((D+1)!)^2] * r^(4D+3).

Increasing m makes each individual multiplier decay faster, but the growing
harmonic multiplicities exactly preserve this divergent exponent. Increasing
the witness degree increases the exponent. This explains a limitation of this
whole certificate route, rather than just one regional family of cubics.

## 10. Dependencies, formalization, and sources

- Analytic inputs: complex Mehler, spherical addition/orthogonality and Jacobi
  Rodrigues, radial Gaussian/Laguerre decomposition, weak-star compactness.
- No moment theorem, independent Gaussian buffer, coordinate-core reduction,
  Conjecture K, or numerical global maximization is used in (1)-(12).
- The fresh exact replay recomputes polynomial reconstruction, inversion, ratio
  factorization, gamma/Laguerre checks, and the reported costs. It is not a
  substitute for the analytic proofs of identities between measures.
- Lean proves (7), its all-index monotonicity implication, the signed finite and
  countable Bessel-budget defect bound, and the conditional cap assembly in (8).
  It does not prove (1)-(5), compactness, or a value for N_S,m. Those are explicit
  paper/interface obligations, not new assumptions in the master endpoint.

Primary sources followed:

- Heilman--Jones--Malavolta, *Primal/Dual Method for the Grothendieck Constant*,
  https://arxiv.org/html/2610.10477v1 (duality, graded limits, certification issue).
- Naor--Regev, *Krivine schemes are optimal*, https://arxiv.org/abs/1205.6415
  (completeness, not optimality of a particular rounding family).
- Defant--Galicer--Mansilla--Mastylo--Muro, *Ryll-Wojtaszczyk formulas for
  bihomogeneous polynomials on the sphere*, https://arxiv.org/abs/2411.12579
  and https://doi.org/10.1016/j.jfa.2026.111360 (spherical kernels).
- NIST DLMF 18.37(i), https://dlmf.nist.gov/18.37 (disk/Jacobi polynomials).
- Peterson--Sengupta, *Polynomials and High-Dimensional Spheres*,
  https://arxiv.org/abs/1903.07697 (the classical harmonic-to-Hermite limit).

This builds a project-specific explicit response/certificate interface from
classical harmonic analysis. It is not a claim to have invented the sphere to
Gaussian limit or a proof of a new numerical Grothendieck bound.
