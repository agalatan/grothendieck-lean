# Lower-bound formalization map

This is a proof-obligation map, not a Lean proof. The delivered Python/C++ checks passed locally, and important finite checks were independently reimplemented. None of that replaces a kernel-checked proof of the analytic reductions or the soundness of the numerical enclosures.

The intended final theorem is

\[
\boxed{K_G^{\mathbb C}>\frac{1400813971}{10^9}=1.400813971.}
\]

The exact intermediate operator-norm cap is

\[
B=\frac{3569353321}{5000000000}=0.7138706642.
\]

All paths below are relative to the proposed handoff ZIP root. Set

* `LOWER = packages/grothendieck-further-squeeze/lower/`;
* `SOURCE = upstream/grothendieck_cx/check_complex_lower.py`.

The pinned source is from commit `7139f4cb8d0f30c2eb4c1267c46732a9d5229c3f`, SHA-256 `8c6105340cced0ee4b4d4977baab4c0d43f07466ce77e726eb1277b613473ac1`. Its `DATA`, `CPP_RESIDUAL`, and `CUBIC_ALGEBRA_SOURCE` are embedded data/program strings. The SHA is a provenance check; it is not a mathematical justification.

Read `FINITE_CERTIFICATE_MAP.md` alongside this file for certificate encodings and arithmetic checking. The analytic starting reference is Heilman–Jones–Malavolta, [arXiv:2609.25462v1, Sections 7–8](https://arxiv.org/html/2609.25462v1). Our additional arguments are written in `LOWER/research-note.md` and `LOWER/base/quadrature_moment_lemma.md`. The older `base/README.md` describes an intermediate endpoint, not the final endpoint above.

## 1. Definitions and the final theorem interface

For a finite complex matrix \(A=(a_{ij})\), use

\[
C(A)=\sup_{|s_i|=|t_j|=1}\left|\sum_{ij}a_{ij}s_i\overline{t_j}\right|,
\qquad
V(A)=\sup_{\|x_i\|=\|y_j\|=1}
\left|\sum_{ij}a_{ij}\langle x_i,y_j\rangle\right|.
\]

The vector supremum can range over all finite dimensional complex Hilbert spaces. Define `IsComplexGrothendieckBound K` to mean \(0\le K\) and \(V(A)\le K C(A)\) for every finite complex matrix. One convenient formalization route proves the target lower inequality for every admissible `K`, then obtains the statement about the infimum. This avoids prematurely depending on a particular representation of the universal constant.

**Convention pitfall.** The mathematical notes use an inner product linear in its first argument. Mathlib normally takes the complex inner product conjugate-linear in its first argument. Either define an explicit flipped pairing throughout, or systematically conjugate the identities. A real part does not eliminate every convention issue inside projection coefficients.

Use the standard complex Gaussian probability measure
\(d\gamma_n(z)=\pi^{-n}e^{-\|z\|^2}dz\), so \(E|Z_j|^2=1\). Define the mutually orthogonal complex Wick/Hermite subspaces \(\mathcal H_{p,q}\), their orthogonal projections \(P_{p,q}\), and

\[
\epsilon=37/50,\quad P=P_{1,0},\quad Q=P_{2,1},\quad T_n=P-\epsilon Q.
\]

`OperatorBound B` should assert, for every positive dimension and measurable scalar functions of essential modulus at most one,

\[
\Re E[f\,\overline{T_ng}]\le B.
\]

Prove its equivalence to \(\|T_n\|_{L_\infty\to L_1}\le B\), allowing a global phase rotation and scalar duality. An equivalent consistently conjugated pairing is fine. Required integrability follows because \(T_n\) has finite dimensional polynomial range and Gaussian moments are finite.

Suggested theorem interfaces, expressed mathematically rather than as claimed compiling Lean:

1. `finite_certificates_sound`: the accepted rational certificates imply the scalar-potential bounds below.
2. `scalar_profiles_imply_operator_bound`: those bounds and the Gaussian analytic lemmas imply `OperatorBound B`.
3. `operator_bound_implies_grothendieck_lower`: `OperatorBound B`, \(B>0\), and the vector test below imply every admissible `K` satisfies \(K\ge1/B\).
4. `strict_endpoint`: \((1400813971/10^9)B<1\).

Do not replace the first three interfaces by permanent axioms and call the endpoint fully formalized. A conditional theorem with explicitly named hypotheses is a useful intermediate milestone.

## 2. Gaussian operator to finite matrices

The essential analytic transfer obligation is to extend the finite-matrix Grothendieck inequality to the integral bilinear form of the finite-rank Gaussian operator \(T_n\), with vector functions bounded pointwise by one. A proof can approximate the finitely many scalar kernel coordinates and the bounded vector functions by simple functions, apply the finite-matrix inequality on a finite partition, and pass to the integral limit. This requires an actual approximation/integrability argument; the matrix theorem alone does not automatically apply to arbitrary measurable functions.

The numerator approaches one by an explicit test. Put \(g_n(z)=z/\|z\|\) off zero, with an arbitrary unit value at zero, and \(a_n(z)=z/\sqrt n\). Prove

\[
T_na_n=a_n,\qquad \|T_n\|_{2\to2}=1,
\qquad
\|g_n-a_n\|_2^2
\le E(1-\|Z\|^2/n)^2=1/n.
\]

The inequality uses \(|1-r|\le|1-r^2|\) for \(r\ge0\); the final equality uses independence and the first two moments of \(|Z_j|^2\). Consequently \(\|T_ng_n-g_n\|_2\le2/\sqrt n\), and \(E\|T_ng_n\|\to1\). Scalar duality for the vector-valued output and the transferred Grothendieck inequality give

\[
E\|T_ng_n\|\le K\|T_n\|_{\infty\to1}\le KB.
\]

Take the limit to get \(1\le KB\). This proves \(K\ge1/B\). A strict norm inequality is not needed: the final strict decimal follows from a separate strict rational comparison.

## 3. Reducing a scalar operator pairing

Formalize the following preliminary lemmas before implementing the numerical interfaces.

* \(P,Q\) are selfadjoint orthogonal projections, with orthogonal ranges, and are equivariant under unitary rotations and common complex phase rotation.
* A charge-one function satisfies \(u(e^{i\theta}z)=e^{i\theta}u(z)\), almost everywhere in a suitably precise formulation. For phase-valued \(f,g\), successive best-response replacements by the phase of \(T_ng\), then of \(T_nf\), do not decrease the real pairing and make both functions charge-one. Handle the identically zero polynomial separately. Otherwise the zero set has Gaussian measure zero. It is enough to prove the bound for the resulting pair; a jointly optimal pair need not exist.
* For \(h=(f+g)/2\), \(k=(f-g)/2\), one has \(|h|^2+|k|^2=1\), \(\Re(\bar h k)=0\), and

  \[
  V:=\Re E[f\overline{T_ng}]
  =\|Ph\|_2^2-\epsilon\|Qh\|_2^2
    +\epsilon\|Qk\|_2^2-\|Pk\|_2^2.
  \]

* Write \(t=\|Ph\|_2\). Gaussian unitary invariance permits one common coordinate choice with \(Ph=tz\). If \(t=0\), choose any coordinate. This choice must remain fixed for **all** profiles.
* Since \(|h|\le1\), duality inside the first Gaussian chaos gives \(t\le E|Z_1|=\sqrt\pi/2<9/10\). The last inequality can be proved using any formal rational bound \(\pi<81/25\); do not import a floating approximation to \(\pi\).

The phase reduction is needed for the charge bookkeeping in the conditional Hermite expansion. A formalization that simply assumes all bounded input functions are charge-one would omit a substantial lemma.

## 4. Cubic moment inputs, including the improved constants

For every \(q\in\mathcal H_{2,1}\) with \(E|q|^2=1\), the final proof uses

\[
2\le m:=E|q|^4\le62,
\qquad
E|q|^6\le9m-12+C_6(m-2)^{3/2},
\qquad E|q|<\rho,
\]

where

\[
C_6=4942289/100000,
\qquad \rho=977459/1000000.
\]

### 4a. Wick algebra and the sixth moment

The real Wick-cubic contraction identities and tensor inequalities preceding the source's equations (8.13)–(8.14) are analytic dependencies, not consequences of the later rectangle checks. `SOURCE:verify_symbolic_cubic_algebra` executes the embedded `CUBIC_ALGEBRA_SOURCE`, a combinatorial identity check. To formalize it, prove the Wick pairing formula and the interpretation of the finite graph/partition enumeration, then certify that the enumeration produces the required contraction identity for arbitrary finite tensor dimension. Checking finitely many sample tensors is insufficient.

A useful scalar interface to the tensor part is this: for a normalized real third-chaos variable \(X\), \(0\le\kappa_4\le90\), and there is a tensor parameter \(0\le y\le1\) such that, when \(\kappa_4>0\),

\[
\frac{\kappa_6}{\kappa_4^{3/2}}
\le\frac{N(y)}{(1+3y^2/2)^{3/2}},
\quad
N(y)=95/2+(165/2)y+45y^2+(135/2)y^3.
\]

Here \(\kappa_4=EX^4-3\), \(\kappa_6=EX^6-15EX^4+30\). The degenerate \(\kappa_4=0\) case must be covered by the original tensor identities or a limiting argument, not by division by zero.

The new rational certificate proves

\[
\frac{50}{27}C_6^2(1+3y^2/2)^3-N(y)^2>0
\quad(0\le y\le1).
\]

Its implementation and exact polynomial are `LOWER/base/certify_cubic_constants.py` and `.json`. Nonnegative signs justify unsquaring. Apply the real result to \(X=\sqrt2\Re q\). Circular symmetry gives \(EX^4=3m/2\) and \(EX^6=5E|q|^6/2\). Thus the conversion factor is \(3\sqrt6/10\), whose square is \(27/50\), and the claimed complex sixth-moment estimate follows. The \(\kappa_4\) bounds give \(2\le m\le62\).

### 4b. The first absolute moment

The standalone scalar lemma in `LOWER/base/quadrature_moment_lemma.md` is particularly suitable for formalization. If \(Z\ge0\), \(EZ=1\), \(EZ^2=m>1\), and \(EZ^3\le N\) with \(N>m^2\), put

\[
\alpha=(N-m)/(m-1),\quad \beta=(N-m^2)/(m-1).
\]

Then

\[
E\sqrt Z\le\frac{1+\sqrt\beta}{\sqrt{\alpha+2\sqrt\beta}}.
\]

One explicit proof uses the positive roots \(a<1<b\) of \(z^2-\alpha z+\beta\), writes \(r=\sqrt a,s=\sqrt b,A=r+s,D=rs,c=(2A^3D)^{-1}\), and verifies the polynomial identity

\[
p(y^2)-y=c(y-r)^2(y-s)^2(y^2+2Ay+A^2+D)\ge0,
\]

where

\[
p(z)=c[z^3+(-2A^2+3D)z^2+(A^4-A^2D+3D^2)z+D^2(A^2+D)].
\]

The leading coefficient is positive, so the upper third-moment bound can be substituted in \(Ep(Z)\). The two-atom weights \((b-1)/(b-a),(1-a)/(b-a)\) give the displayed expression; the two-atom distribution is only a proof device, not a claimed Wick-cubic distribution.

Set \(x=\sqrt{m-2}\), so \(0\le x\le\sqrt{60}<31/4\), and

\[
m=2+x^2,\quad N=6+9x^2+C_6x^3,\quad R=\rho,
\quad U=R^2(N-m)-(m-1)-(N-m^2).
\]

`LOWER/base/certify_quadrature_rho.py` and `.json` prove, on \([0,31/4]\), strict positivity of

\[
N-m^2,\qquad U,\qquad
U^2-4(1-R^2)^2(N-m^2)(m-1).
\]

The positivity of \(U\) is essential when taking square roots. Rearrangement gives \((1+\sqrt\beta)^2<R^2(\alpha+2\sqrt\beta)\), hence \(E|q|<\rho\).

By duality in the cubic subspace, this also proves \(\|Qu\|_2\le\rho\) whenever \(|u|\le1\). If \(Qu\ne0\), pair with \(Qu/\|Qu\|_2\); otherwise the claim is immediate. The analogous statement in the remaining Gaussian coordinates is needed below.

The cubic script additionally proves a weaker first-moment constant `0.979598`. That branch is redundant for the final proof. The base source-profile cap certificate deliberately uses `0.98`; this is valid because the stronger theorem implies it. The new coupled profiles and the final crude profile use `0.977459`.

## 5. Admissible profiles and the scalar potential

A profile contains rational \(\ell,\beta,\delta\), real symmetric blocks \(E\in\mathbb R^{3\times3}\), \(R=I\in\mathbb R^{2\times2}\), and the fixed \(\epsilon\). Its gates are

\[
0<\delta<\epsilon,\quad \ell\ge2\beta\ge0,\quad E\succ0,\quad R\succ0,
\]
\[
E\succeq\operatorname{diag}(-1,\epsilon,\epsilon),\quad
E\succeq\operatorname{diag}(\epsilon-\delta,0,0),\quad
R\succeq\operatorname{diag}(-1,\epsilon),\quad
R\succeq\operatorname{diag}(\epsilon,0).
\]

They are checked by `SOURCE:profile_gate`. The full real matrix is
\(M=\operatorname{diag}(E,E,R,I,\epsilon I_2)\); the equality of the two 2-by-2 blocks is part of the gate. This is a 12-by-12 matrix. Do not confuse the block named `M_I` with the identity matrix.

The profile reduction is a separate analytic theorem. Put \(A=|z|^2-1\), \(B_z=z^2/\sqrt2\), \(H=z(|z|^2-2)/\sqrt2\). The functions \(1,A,B_z,z,H,\bar z\) are orthonormal. Define \(c_D(w)=E_z[\overline{D(z)}k(z,w)]\),

\[
\xi=(c_1,c_A,\overline{c_{B_z}}),\quad
\zeta=(c_z,c_H),\quad d_z=c_{\bar z},\quad
K=(\Re\xi,\Im\xi,\Re\zeta,\Im\zeta,\Re d_z,\Im d_z).
\]

The associated 12 complex test functions are
\((1,A,B_z,i,iA,-iB_z,z,H,iz,iH,\bar z,i\bar z)\); the minus sign before \(iB_z\) matters. Prove \(K_j=\Re E_z[\overline{\mathcal B_j}k]\) and \(K^TMK=\xi^*E\xi+\zeta^*R\zeta+\epsilon|d_z|^2\). Then use conditional Hermite orthogonality in the remaining coordinates and the matrix gates to establish

\[
\epsilon\|Qk\|_2^2-\|Pk\|_2^2
\le E_w[K^TMK]+\delta\|Q_wc_1\|_2^2.
\]

These coordinates must agree exactly with `SOURCE:CPP_RESIDUAL`. Merely reproducing the matrix inequalities does not prove this energy reduction.

Let \(K(k_0)\in\mathbb R^{12}\) be that coefficient vector, \(L(z)=z(\ell+\beta(|z|^2-2))\), \(h_0=(f_0+g_0)/2\), \(k_0=(f_0-g_0)/2\). Define

\[
\Psi(\omega)=\frac{2\beta^2}{\epsilon}
+\sup_{f_0,g_0:\mathbb C\to S^1}
\left(K(k_0)^TMK(k_0)
+2\Re E_z[\bar Lh_0]+2\Re E_z[\bar\omega k_0]\right).
\]

Prove that this supremum is finite and that \(\Psi\) is radial, convex as a function on \(\mathbb C\cong\mathbb R^2\), and 2-Lipschitz. A measurable supremum issue is avoidable when only pointwise upper bounds on the supremum are integrated.

For the common \(h,k,z\), put \(v=z(|z|^2-2)\), so \(v\in\mathcal H_{2,1}\) and \(\|v\|_2^2=2\). The required strengthened profile theorem is

\[
V\le t^2-2\ell t
+E_w\Psi(|q(w)|)-\frac{\|q\|_2^2}{\delta}
-\epsilon\left\|Qh+\frac\beta\epsilon v\right\|_2^2,
\qquad q=\delta Q_wc_1.
\]

Here \(c_1(w)=E_z k(z,w)\), \(|c_1|\le1\), and \(Q_w\) is the charge-one cubic projection in the remaining coordinates; in dimension one its range is zero. Therefore \(\|q\|_2\le\delta\rho\). Formalizing the coefficient decomposition and its energy domination is one of the largest outstanding analytic tasks.

The extra square is an exact identity, not a new inequality hypothesis:

\[
-\epsilon\|Qh\|_2^2
=2\beta\Re E[\bar vh]+2\beta^2/\epsilon
-\epsilon\|Qh+\beta v/\epsilon\|_2^2.
\]

Retain it through every subsequent scalar upper bound.

## 6. Global physical polynomials and the integration trust boundary

The nine original profiles have global polynomial majorants

\[
p(s)=a_0+a_1s+a_2s^2+a_4s^4+a_6s^6\ge\Psi(s)\quad(s\ge0),
\qquad a_1,a_6\ge0.
\]

There are 220 source polynomials and 48 additional ones in `LOWER/base/certificates/additional-polynomials.json`. The proof chain is:

1. Positive step prices and \(|a|\le(w+|a|^2/w)/2\) majorize the two moduli after the finite dimensional Legendre identity \(K^TMK=\sup_v(2v^TK-v^TM^{-1}v)\).
2. Rigorous Gaussian integral enclosures produce interval matrices/vectors \(G,b,c\). For each price, certify \(D=M^{-1}-G\succ0\) and the resulting quadratic bound by interval LDL elimination. The implementation is `SOURCE:reduce_residual`, with surrounding `generate`, `moment_text`, `replay_price`, and embedded C++ routines.
3. These quadratics upper-bound \(\Psi\) at finitely many nonnegative nodes. Convexity supplies chords between nodes. The 2-Lipschitz property supplies the unbounded affine tail.
4. Rational Bernstein coefficients prove that each physical polynomial dominates the selected chord on every cell. Nonnegative shifted coefficients prove domination on the entire tail ray. See `SOURCE:make_supports`, `verify_physical_polynomial`, and `LOWER/base/verify_refinement.py:check_physical_extra`.

**Explicit corrected data.** Every stored source point cap and every physical polynomial constant coefficient is increased by exactly `1/100000000`. This applies also to the additional polynomials. The unchanged source point caps did not all reproduce locally; their largest observed excess was below this lift. `LOWER/base/replay_physical.py` replays all 997 prices, checks the lifted node bounds, and does not suppress a failing source proof gate. The corrected, lifted certificate is the proof dependency. The unmodified upstream numeric replay is not claimed to have passed.

For Lean, either formalize the Gaussian integral enclosure algorithm with exact rational outward bounds (including elementary transcendental estimates and tails), or emit its interval certificates and check them in Lean against a proved enclosure theorem. Importing floating endpoints without proving that they enclose the integrals leaves a hypothesis. `g++ -fno-fast-math -ffp-contract=off`, IEEE checks, and a successful log are execution precautions, not a replacement for this theorem.

The scripts reconstruct exact rationals from binary interval endpoints. Be precise about this conversion: importing a rounded decimal rendering as an equal rational would change the certified endpoints.

## 7. Joint convexity, argument allocation, and tightening delta

After subtracting \(2\beta^2/\epsilon\), the potential is a supremum of functions affine jointly in \((M,\ell,\beta,\omega)\). Thus it is jointly convex in these parameters. For two original profiles and \(0<w<1\), set

\[
d=w\delta_1+(1-w)\delta_2,\quad
g=\frac{2w(1-w)}\epsilon(\beta_1-\beta_2)^2.
\]

Average \(M,\ell,\beta\) with the same weights. For any \(\lambda_1,\lambda_2\ge0\) satisfying \(w\lambda_1+(1-w)\lambda_2=d\), global physical majorants imply

\[
\Psi_{\rm av}(s)
\le wp_1(\lambda_1s/d)+(1-w)p_2(\lambda_2s/d)-g
\quad(s\ge0).
\]

The admissible scales may vary from certificate leaf to leaf: for every candidate pair, this is a global pointwise inequality. There is no requirement that their arguments stay within the source profile's old moment-search range. The global validity of the physical polynomials is what permits this. Do not reuse the source moment polynomial's negative penalty; recompute the actual penalty below.

The potential does not contain \(\delta\). For the averaged \(E=\begin{pmatrix}a&b^T\\b&C\end{pmatrix}\) with \(C\succ0\), its only delta-dependent gate is equivalent to

\[
\delta\ge\epsilon-a+b^TC^{-1}b.
\]

Choose the final embedded rational \(d'\in(0,d]\) passing every profile gate. This replaces the residual by \(q=d'Q_wc_1\), without changing the potential. Set \(u=\|q\|_2/d\). Its true domain is \(u\le(d'/d)\rho\); checking the larger box \(0\le u\le\rho\) is conservative. The negative penalty is exactly

\[
-\frac{\|q\|_2^2}{d'}=-\frac{d^2}{d'}u^2.
\]

Use the deltas embedded in `LOWER/coupled-profiles.json`. Several final rows deliberately retain earlier slightly larger rational deltas; do not substitute values from exploratory proposal files. Each final row is independently checked by `profile_gate`.

For \(\|q\|_2>0\), use its normalized fourth moment \(2+x^2\). Set
\(A_k=wa_{1,k}\lambda_1^k+(1-w)a_{2,k}\lambda_2^k\). The polynomial to certify is

\[
J(u,x)=A_0-g+\rho A_1u+(A_2-d^2/d')u^2
+A_4(2+x^2)u^4+A_6(6+9x^2+C_6x^3)u^6.
\]

Then \(E\Psi_{\rm av}(|q|)-\|q\|_2^2/d'\le J(u,x)\). Only the first and sixth moment substitutions require coefficient signs; \(A_2,A_4\) may be negative because their moments are exact. If \(q=0\), use the constant term directly, avoiding normalization by zero.

## 8. Rectangle coverage and source profile caps

`LOWER/verify_joint_profiles.py` verifies 21 averaged profiles with 4197 leaves. Each leaf selects two global physical polynomials and possibly its own rational argument allocation. It reconstructs the leaf from a binary path in the box \([0,\rho]\times[0,31/4]\), with alternating coordinate bisection. Prefix-freeness plus the finite Kraft equality proves the paths cover the full box; boundary overlaps are harmless. The saved rational box must equal the reconstructed box.

For fixed \(u\ge0\), all \(x\)-dependence is \(Ax^2+Dx^3\) with \(D\ge0\). Its maximum on a nonnegative interval is at an endpoint: a positive interior critical point, if present, is a minimum. For each of the two endpoints, the polynomial in \(u\) is bounded above by its largest Bernstein coefficient. This establishes the claimed cap \(C\) on the whole rectangle. Both the endpoint lemma and the Bernstein convex-hull lemma should be general reusable theorems.

The nine unaveraged source caps come from `LOWER/base/certificates/moment-cover.json`, checked by `LOWER/base/verify_refinement.py`. Its cover is a different representation: refinements of source parent rectangles with a rational sweep-line coverage check. It uses \(\rho_0=49/50\), the refined \(C_6\), and the same lifted physical polynomials. This yields valid retained-square inequalities even though its \(\rho_0\) is weaker than the new \(\rho\).

For every accepted row, the resulting statement is

\[
V\le F_i(t)-\epsilon\|Qh+\beta_i v/\epsilon\|_2^2,
\qquad F_i(t)=t^2-2\ell_it+C_i.
\]

Include the crude row \((\ell,\beta,C)=(0,0,\epsilon\rho^2)\), which follows by bounding \(\|Qk\|_2\le\rho\) and discarding \(-\|Pk\|_2^2\), while retaining \(-\epsilon\|Qh\|_2^2\).

## 9. Retained-square mixing and the final scalar cover

For nonnegative weights of total one, the Hilbert-space variance identity gives

\[
\sum_iw_i\|Qh+\beta_i v/\epsilon\|_2^2
=\|Qh+\bar\beta v/\epsilon\|_2^2
+\frac{2}{\epsilon^2}\left(\sum_iw_i\beta_i^2-\bar\beta^2\right),
\qquad\bar\beta=\sum_iw_i\beta_i.
\]

Average the retained-square inequalities and discard only the first nonnegative term on the right. For two profiles, writing \(a=2(\beta_i-\beta_j)^2/\epsilon>0\), this gives an optimized pointwise bound

\[
\min_{0\le\theta\le1}\{(1-\theta)F_i(t)+\theta F_j(t)-a\theta(1-\theta)\}.
\]

It equals the relevant endpoint quadratic outside \(|F_i-F_j|\le a\), and inside equals

\[
\frac{F_i+F_j}{2}-\frac a4-\frac{(F_i-F_j)^2}{4a}.
\]

Because \(F_i-F_j\) is affine in \(t\), the middle expression is quadratic. Maximizing a quadratic on a closed interval requires its endpoints and, if it is concave, its interior vertex. Handle equal beta values separately instead of dividing by \(a=0\); the final checked pairs have strictly positive \(a\).

The profile construction's variance subtraction and this last mixing variance subtraction are distinct applications of exact identities. The constructed profile retains its own square with its averaged beta. That retained-square theorem, not just a scalar cap, justifies the second application.

`LOWER/envelope.json` and `LOWER/verify_augmented_envelope.py` give 20 closed intervals covering \([0,9/10]\). Each selects one valid profile or a valid pair. The verifier checks the row list against the already established caps, reconstructs the dyadic intervals, proves coverage, and evaluates the exact quadratic maxima. A proof that the selected profile pair is globally optimal is unnecessary: any valid local upper bound below \(B\) suffices.

Therefore \(V\le B\) for all admissible inputs, in every dimension. Apply Sections 1–2 and the exact rational comparison to finish.

## 10. Suggested formalization order and completion criteria

1. Implement and prove soundness for rational polynomials, interval transformations, Bernstein bounds, dyadic covers, PSD gates, and the piecewise quadratic envelope. Parse data into a restricted certificate type; reject malformed indices, unordered intervals, zero denominators, and unsupported constants.
2. Formalize the scalar three-moment lemma and the rational \(C_6,\rho\) certificates. At this stage the Wick/tensor moment theorem may be an explicit hypothesis, clearly recorded.
3. Prove the retained-square identity, joint convexity, argument allocation, and delta tightening. These are finite dimensional/Hilbert-space arguments and should not require the Gaussian integral evaluator.
4. Prove the conditional Hermite profile reduction and the moment theorem from Gaussian/Wick analysis. Prove source integral enclosures, or supply a formally checked replacement enclosure route for the same lifted physical polynomials.
5. Combine the actual delivered finite certificates with those analytic theorems. Finally prove the integral-to-finite-matrix transfer and the radial vector test, and derive the normalized Grothendieck statement.

Useful validation command from the bundle root, after supplying its Python environment and a C++17 compiler:

```sh
python3 packages/grothendieck-further-squeeze/lower/verify_all.py \
  --source upstream/grothendieck_cx/check_complex_lower.py \
  --workdir verification-output/lower
```

Do not run with Python `-O` or `-OO`: assertions are proof gates. Successful execution confirms this package's computational checks, not Lean formalization. A completed Lean theorem should have no `sorry`, no unproved numerical-enclosure or Gaussian-reduction axioms, and a documented dependence on any foundational axioms/library results used. The claim is this exact lower bound; it is not an identification of \(K_G^{\mathbb C}\), a claim about the real Grothendieck constant, or a proof of optimality of the construction.
