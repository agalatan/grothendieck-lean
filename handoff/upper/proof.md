# Proof of the combined upper certificate

All kernels, exact phase polynomials, coefficient normalizations, and the first
four scalar Cauchy estimates are those of the pinned source. The six positive
rational mixture weights and the allowable common polynomial `inverse_eta.json`
are unchanged from our preceding certificate. Their total weight is
\(M=1.000000000000000012\). The new ingredients below concern the numerical
analysis of these fixed kernels; no new kernel admissibility is assumed.

## Joint first-order energy

Let the normalized radial phases be \(U(s),V(s)\), with endpoint values
\(\alpha=U(0),\beta=V(0)\). The exact polynomial identity in the source gives
\(\beta=-i\alpha\). Define
\[
C(s)=\operatorname{Re}\{\bar\beta[U(s)-\alpha]
                 +\bar\alpha[V(s)-\beta]\}.
\]
Thus \(C(0)=0\), and the endpoint identity also allows the simpler expression
\(C=\operatorname{Re}(\bar\beta U+\bar\alpha V)\).
For the charge-one Gaussian expansion, the first-order number-operator energy
of a radial amplitude \(R\) is
\[
\mathcal E_1(R)=\int_0^\infty e^{-s}
\left(2s|R'(s)|^2+\frac{|R(s)|^2}{2s}\right)ds
=\sum_{n\ge0}(2n+1)|r_n|^2.
\]
The expression applies to \(U-\alpha,V-\beta,C\). These amplitudes vanish at the
origin, so the displayed integrals are finite. Directed Arb integration proves
\[
\begin{aligned}
\mathcal E_1(U-\alpha)&<1.10684082009393895861618,\\
\mathcal E_1(V-\beta)&<1.106774759136645693569585,\\
\mathcal E_1(C)&<3.504133054650557143086961.
\end{aligned}
\]

For completeness, the energy verifier integrates over
\([10^{-12},80]\), using geometric intervals up to1 and unit intervals beyond1.
The source's phase derivative bound has the form
\(|U'|\le L=12+1/(\delta|\operatorname{Im} A|)\), and similarly for \(V\).
The omitted intervals are bounded by
\[
\mathcal E_1(U-\alpha;[0,\epsilon])
 \le\tfrac54L^2\epsilon^2,\qquad
\mathcal E_1(U-\alpha;[S,\infty))
 \le e^{-S}\{2L^2(S+1)+2/S\}.
\]
The joint outside contribution is at most twice the sum of the two individual
outside contributions, by \(|x+y|^2\le2|x|^2+2|y|^2\). Inside the integration
interval the joint integrand is integrated directly, retaining cancellation.

## Visible subtraction and the origin-kernel tail

Write \(\lambda_n=2n+1\),
\(h_0=\pi/4\), and
\(h_{n+1}/h_n=(2n+1)^2/[4(n+1)(n+2)]\).
The constant phase amplitude has coefficient
\(\xi_n=(-1)^n\sqrt{h_n}\). If \(a_n,b_n\) denote the two original coefficients,
put \(r_n=a_n-\alpha\xi_n\), \(s_n=b_n-\beta\xi_n\), and
\(c_n=\operatorname{Re}(\bar\beta r_n+\bar\alpha s_n)\).
The exact endpoint cancellation yields
\[
\operatorname{Re}(a_n\bar b_n)
 =\xi_n c_n+\operatorname{Re}(r_n\bar s_n).
\]

The certified tables approximate coefficients by restricting radial integration
to \([0,36]\). Each omitted coefficient vector has unweighted norm at most
\(d=e^{-18}\). For the first \(N=240\) modes, weighted-norm triangle inequalities
therefore subtract at most \(\sqrt{2N-1}\,d\) from each individual visible norm
and \(2\sqrt{2N-1}\,d\) from the joint visible norm. The verifier subtracts
these corrections before squaring. It obtains strict remaining-energy bounds
\[
E_L<0.000884260662142687,\quad
E_R<0.000885126188452271,\quad
E_C<0.003521036759326558.
\]
Cauchy–Schwarz now gives
\[
\sum_{n\ge N}|\operatorname{Re}(a_n\bar b_n)|
 \le\sqrt{E_C W_N}+\frac{\sqrt{E_LE_R}}{2N+1},\qquad
W_N=\sum_{n\ge N}\frac{h_n}{2n+1}.
\]
The sum defining \(W_N\) is evaluated through16383. The elementary Wallis
estimate \(h_n\le1/[4n(n+1)]\) implies
\[
\frac{h_n}{2n+1}\le\frac1{16}
 \left(\frac1{n^2}-\frac1{(n+1)^2}\right),
\]
so the rest is at most \(1/(16\cdot16384^2)\). Consequently the sixth kernel's
tail is less than `0.000063628476111533542`.

## Finite scalar series and the fifth tail

Unlike our preceding certificate, this calculation retains all first240
coefficients of each scalar composition. This follows the supplied bundle's
finite-series calculation. For the fifth branch, write
\(\rho_5(t)=tP(t^2)\). Exact integer polynomial multiplication checks
\(\|\rho_5\|_A<1\) and \(\|\rho_5^{20}\|_A<1/2\). Sum all outer terms
\(h_j\rho_5^{2j+1}\) for \(j<320\) as polynomials before taking absolute values
of the coefficients with radial index at least240. For \(j\ge320\),
\[
\sum_{j\ge320}h_j\|\rho_5^{2j+1}\|_A
 \le\frac{1}{4\cdot320\cdot2^{32}}.
\]
Here one groups powers into blocks of20 and uses
\(\sum_{j\ge J}h_j\le1/(4J)\), again by the Wallis estimate. The resulting
complete fifth tail is less than `1.040219496692e-12`. The first four scalar
tails use the already certified radii with the improved cutoff240.

## Global integration error and common preprocessing

For the finite vectors of approximate origin coefficients \(A,B\), the total
coefficient-product error is at most
\[
d(\|A\|_2+\|B\|_2)+d^2.
\]
Multiply this by the sixth mixture weight; this single bound covers the linear
coefficient and all retained nonlinear coefficients together.

Let \(q\) be the retained mixture and \(T\) the sum of the weighted tail bounds.
The frozen rational polynomial \(\eta(t)=tE(t^2)\) has
\(\|\eta\|_A=1\), verified exactly. It is an allowable tensor preprocessor,
and composing any omitted coefficient series with it does not increase that
series' coefficient norm. The verifier computes every coefficient of
\(p=q\circ\eta\), through radial degree57240; no composition tail is discarded.
If \(\varepsilon\) denotes the global integration error, the transfer bound is
\[
K_G^{\mathbb C}\le\frac{M}
 {p_0-\sum_{n\ge1}|p_n|-\varepsilon-T}.
\]
All final operations are outward interval operations. The denominator is
positive and the computed reciprocal is less than
`1.404898359045957011`, hence strictly less than the stated rational endpoint
`1.404898359045958`.

This certificate depends on the original phase nonvanishing, admissibility,
number-operator identities, and scalar Cauchy prerequisites. The `--full` command
reruns the available original checks and the new energy quadrature. It does not
regenerate the independently pinned coefficient tables unless the separate
generator is run. The proof does not claim a new best bound in the literature
without an external literature and certificate review.
