# The universal charge-one preprocessor norm is exactly its coefficient majorant

23 October 2026. Analytic derivation for the present audit; no novelty claim and no improved Grothendieck endpoint. This is the complex-sphere counterpart of the factorization-norm calculation in Krivine's 1979 paper. Its purpose is to make one limitation of the upper-bound search precise.

## Statement and scope

Use complex inner products linear in the first variable. Let

\[
 \rho(z)=\sum_{k\ge0}c_k z^{k+1}\bar z^k,
 \qquad \sum_{k\ge0}|c_k|<\infty.
\]

For the sphere \(S_n\subset\mathbb C^n\), define \(\gamma_{2,n}(\rho)\) to be the infimum of
\(\sup_x\|U(x)\|\sup_y\|V(y)\|\) over Hilbert spaces and maps satisfying

\[
 \langle U(x),V(y)\rangle=\rho(\langle x,y\rangle)
 \quad(x,y\in S_n).
\]

The maps need not be invariant, continuous, or measurable. Then

\[
 \boxed{\sup_{n\ge1}\gamma_{2,n}(\rho)=\sum_{k\ge0}|c_k|.}
\]

In particular, the scalar kernel \(\rho\) admits unit-vector left/right feature maps in every complex dimension if and only if \(\sum|c_k|\le1\). The left/right features may be different. This conclusion is about a fixed scalar invariant kernel, not a restriction to invariant feature maps.

## 1. The easy direction and the triangle inequality

Put \(\phi_k(x)=x^{\otimes(k+1)}\otimes\bar x^{\otimes k}\). These are unit vectors and
\(\langle\phi_k(x),\phi_k(y)\rangle=\langle x,y\rangle^{k+1}\overline{\langle x,y\rangle}^{k}\).
Taking direct sums with weights \(\sqrt{|c_k|}\), and multiplying the left summand by \(c_k/|c_k|\), gives a factorization with both squared norms equal to \(\sum|c_k|\). Thus \(\gamma_{2,n}(\rho)\le\sum|c_k|\).

Direct-sum factorizations also give the triangle inequality for \(\gamma_2\): first rescale each pair so that its two uniform norm bounds are equal, then take direct sums. If the coefficient sum is at most one, pad the two sides with orthogonal, side-specific unit directions to make their norms exactly one without changing any cross inner product.

## 2. Exact finite-dimensional polynomial norm

Suppose \(\rho\) has degree \(2M+1\), and \(n\ge2\). Equip \(S_n\) with normalized surface probability measure. Let \(\mathcal H_{p,q}(S_n)\) be the restrictions of complex harmonic bihomogeneous polynomials, of dimension \(d_{p,q}\), with an orthonormal basis \(e_{p,q,j}\). The normalized addition formula is

\[
 R_{p,q}^{n-2}(\langle x,y\rangle)
 =\frac1{d_{p,q}}\sum_{j=1}^{d_{p,q}}
 e_{p,q,j}(x)\overline{e_{p,q,j}(y)},\qquad R_{p,q}^{n-2}(1)=1.
\]

The factor \(1/d_{p,q}\) is essential: the unnormalized diagonal sum is the constant \(d_{p,q}\), because its integral is \(d_{p,q}\) and unitary transformations act transitively on the sphere. Distinct \((p,q)\) spaces are orthogonal.

Explicitly,
\[
 d_{p,q}=\frac{p+q+n-1}{n-1}
 \binom{p+n-2}{p}\binom{q+n-2}{q}.
\]
Equivalently it is the dimension of all bihomogeneous \((p,q)\) polynomials minus that of \((p-1,q-1)\) polynomials, with a zero second term when one degree is zero. For example \(d_{1,0}=n\) and \(d_{2,1}=n(n-1)(n+2)/2\).

The charge-one polynomial has a unique finite expansion

\[
 \rho(z)=\sum_{k=0}^{M}a_{k,n}R_{k+1,k}^{n-2}(z).
\]

Its kernel integral operator therefore has eigenvalue \(a_{k,n}/d_{k+1,k}\) on the space of dimension \(d_{k+1,k}\). It is normal, also when the \(a_{k,n}\) are complex, and its nuclear norm is exactly

\[
 \sum_{k=0}^{M} d_{k+1,k}\,
   \left|\frac{a_{k,n}}{d_{k+1,k}}\right|
 =\sum_{k=0}^{M}|a_{k,n}|.
\]

This quantity is a lower bound for every feature-map factorization, including nonmeasurable ones. To see this without integrating the maps, take any finite sample \(x_1,\ldots,x_N\) on the sphere. If \(K_N=(\rho(\langle x_i,x_j\rangle))\), then the Schatten nuclear norm satisfies

\[
 \|K_N/N\|_{S_1}\le
 \bigl(N^{-1}\sum_i\|U(x_i)\|^2\bigr)^{1/2}
 \bigl(N^{-1}\sum_i\|V(x_i)\|^2\bigr)^{1/2}
 \le\sup_x\|U(x)\|\sup_y\|V(y)\|.
\]

The first inequality is \(\|AB^*\|_{S_1}\le\|A\|_{S_2}\|B\|_{S_2}\). It uses only finitely many vectors.

Choose samples whose empirical second moments converge to the identity on the finite union of the harmonic bases in the expansion; such samples exist by ordinary integration of finitely many continuous functions (or almost surely by the law of large numbers). Write \(B_N\) for the evaluation matrix of this orthonormal basis and \(\Lambda\) for the diagonal matrix of eigenvalues \(a_{k,n}/d_{k+1,k}\), repeated with their multiplicities. Then

\[
 K_N/N=(B_N/\sqrt N)\Lambda(B_N/\sqrt N)^*,
 \qquad B_N^*B_N/N\longrightarrow I.
\]

For sufficiently large \(N\), polar decomposition identifies its nonzero singular values with those of
\((B_N^*B_N/N)^{1/2}\Lambda(B_N^*B_N/N)^{1/2}\), which converge to those of \(\Lambda\). This proves the claimed lower bound. Conversely, normalized harmonic feature maps in the addition formula, and a direct sum weighted by the \(a_{k,n}\), attain it. Consequently

\[
 \boxed{\gamma_{2,n}(\rho)=\sum_{k=0}^{M}|a_{k,n}|.}
\]

## 3. The high-dimensional limit works for signed coefficients

The charge-one disc polynomials have the explicit normalization

\[
 R_{k+1,k}^{n-2}(z)
 =z\,\frac{P_k^{(n-2,1)}(2|z|^2-1)}{P_k^{(n-2,1)}(1)},
 \qquad P_k^{(n-2,1)}(1)=\binom{k+n-2}{k}.
\]

The finite Jacobi identity, with \(s=|z|^2\), is

\[
 \frac{P_k^{(\alpha,1)}(2s-1)}{\binom{k+\alpha}{k}}
 =\sum_{j=0}^{k}
 \frac{\binom{k+\alpha}{j}\binom{k+1}{k-j}}
      {\binom{k+\alpha}{k}}
 (s-1)^{k-j}s^j.
\]

For fixed \(k\), the \(j=k\) term equals \(s^k\) exactly, and every term with \(j<k\) has coefficients \(O_k(\alpha^{j-k})\). Thus these normalized polynomials converge coefficientwise to \(s^k\). For fixed \(M\), their finite triangular change-of-basis matrix converges to the identity, as does its inverse. Hence

\[
 a_{k,n}\longrightarrow c_k\quad(0\le k\le M),
 \qquad
 \gamma_{2,n}(\rho)\longrightarrow\sum_{k=0}^{M}|c_k|.
\]

No positivity of the \(c_k\), interchange of an infinite signed series, or positive-definiteness assumption is used here.

### A quantitative version of the convergence

There is an explicit positive triangular expansion
\[
 z|z|^{2l}=\sum_{j=0}^{l}\gamma_{l,j}^{(n)}R_{j+1,j}^{n-2}(z),
\]
where, for \(n\ge2\),
\[
 \gamma_{l,j}^{(n)}=(n+2j)\binom{n+j-1}{j+1}\binom lj
 B(l+2,n+j-1),\qquad
 \sum_{j=0}^{l}\gamma_{l,j}^{(n)}=1.
\]
One obtains the formula by taking the inner product with the normalized addition kernel. The pushforward of normalized sphere measure under \(y\mapsto\langle x,y\rangle\) is \((n-1)\pi^{-1}(1-|z|^2)^{n-2}\,dz\), and shifted Jacobi Rodrigues followed by \(j\) integrations by parts gives
\[
 \int_0^1s^{l+1}(1-s)^{n-2}P_j^{(n-2,1)}(2s-1)\,ds
 =\binom lj B(l+2,n+j-1).
\]
Boundary terms vanish; the required powers at zero and one are nonnegative integers and supply the needed orders of vanishing. Multiplication by \(d_{j+1,j}(n-1)/P_j^{(n-2,1)}(1)\) gives the displayed coefficient. Positivity is explicit, and evaluation at \(z=1\) gives the sum.

In particular,
\[
 \gamma_{l,l}^{(n)}=
 \prod_{r=0}^{l-1}\frac{n-1+r}{n+l+r},
 \quad
 1-\gamma_{l,l}^{(n)}\le\min\left(1,\frac{l(l+1)}{n+l}\right).
\]
For a finite coefficient vector \(c\), the coefficient transform therefore obeys
\[
 \gamma_{2,n}(\rho)\ge\sum_l|c_l|
 -2\sum_l|c_l|\min\left(1,\frac{l(l+1)}{n+l}\right).
\]
Indeed, each column of the triangular transform is a probability vector whose distance from the corresponding coordinate vector is \(2(1-\gamma_{l,l}^{(n)})\). The triangle inequality gives the claim, including arbitrary complex signs. If the infinite series additionally satisfies \(\sum_l l(l+1)|c_l|<\infty\), truncation yields the convenient uniform error bound
\[
 0\le\sum_l|c_l|-\gamma_{2,n}(\rho)
 \le\frac2n\sum_l l(l+1)|c_l|.
\]
The exact-arithmetic companion checks the positive coefficient formula, normalization and polynomial reconstruction for several finite dimensions and degrees. These checks verify the formulas; the argument above supplies the arbitrary-dimensional proof.

## 4. Passage to an absolutely summable infinite series

Let \(\rho_M=\sum_{k\le M}c_k z|z|^{2k}\) and \(\tau_M=\rho-\rho_M\). The tensor feature construction gives
\(\sup_n\gamma_{2,n}(\tau_M)\le\sum_{k>M}|c_k|\). For every \(n\),

\[
 \gamma_{2,n}(\rho_M)
 \le\gamma_{2,n}(\rho)+\sum_{k>M}|c_k|.
\]

Taking the supremum over \(n\), using the polynomial result, and then letting \(M\to\infty\) yields

\[
 \sum_{k\ge0}|c_k|\le\sup_n\gamma_{2,n}(\rho).
\]

Together with Section 1 this proves the statement. The tail inequality also shows exactly why cancellation from infinitely many higher modes cannot invalidate the signed finite-degree limit.

## 5. The dimension quantifier cannot be removed

Take \(\rho(z)=z-z|z|^2\). Its coefficient majorant is 2. In complex dimension one the sphere is the circle, so this kernel vanishes identically and its factorization norm is zero. For \(n\ge2\),

\[
 R_{2,1}^{n-2}(z)=z\frac{(n+1)|z|^2-2}{n-1},
 \qquad
 \rho(z)=\frac{n-1}{n+1}z-
          \frac{n-1}{n+1}R_{2,1}^{n-2}(z).
\]

Thus its exact norm is \(2(n-1)/(n+1)\): \(2/3\) at \(n=2\), 1 at \(n=3\), and tending to 2. In particular it is allowable through complex dimension three despite the raw coefficient sum being 2. This is not an exception to the universal theorem.

## Consequence for the present attack

For a fixed radial rounding kernel, exact scalar inversion produces a particular \(\rho\). If its coefficient sum exceeds one, changing only its Hilbert feature representation cannot make it universally allowable. The usual coefficient majorant is an exact universal factorization cost. An improvement can still come from changing the rounder, mixing kernels before inversion, exploiting a genuinely matrix-dependent construction, or using a weaker domination/transfer argument. The theorem does not establish that the current upper endpoint is optimal in any of those larger classes.

## Sources and status

The underlying complex-sphere normalization is standard; see Berg, Peron and Porcu, [*Schoenberg's theorem for real and complex Hilbert spheres revisited*](https://arxiv.org/abs/1701.07214), Theorem 1.4 and equation (14). The signed factorization calculation above is supplied in full so it does not depend on interpreting a positive-definiteness theorem as a signed norm theorem. The real-sphere predecessor is Krivine's Theorem 4, already summarized in the repository.

Status: analytic argument, checked algebraically at the first nontrivial degree. No Lean formalization and no certified endpoint change are claimed.
