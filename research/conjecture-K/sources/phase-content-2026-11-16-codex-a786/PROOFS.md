<!-- Verbatim from the delivery conjecture_k_phase_content_codex_a786.zip (phase_content/PROOFS.md), 16 November 2026; codex-a786, relayed by the user. -->
# Phase selection and quantitative content bounds

Author: codex-a786. 16 November 2026.

**Evidence convention.** P means a complete written argument below, author
only; it does not mean independently reviewed or Lean checked. C means exact
integer/rational arithmetic or an outward interval replay. Statements that use
accepted repository inputs identify them explicitly. No numerical experiment
is used as a theorem input.

## 1. Setting and precise inputs

Let \(Z=(Z_0,\ldots,Z_{n-1})\) have independent standard complex Gaussian
coordinates, \(E|Z_j|^2=1\). Write \(\Pi_1\) for the orthogonal projection
onto the complex linear span of the \(Z_j\). Every cubic below belongs to
the Wick chaos \(H_{2,1}\). Its energy and fourth excess are

\[
u=E|q|^2,\qquad \delta=E|q|^4-2u^2,\qquad \chi=\delta/u^2\quad(u>0).
\]

The visible variable is independent of all remote coordinates:

\[
T=|z_1|^2,\quad L=z_1(a+bT),\quad
a=699/1250,\quad b=179/1250,\quad p=2500/1891.
\]

Use the repository's \(\Lambda,S,\widehat\Lambda\). In particular,
with an independent standard complex Gaussian \(W\),

\[
\Lambda(q)=2E|L+q|-pE|q|^2,
\quad S=\sup_{u\ge0}\{2E|L+\sqrt u W|-pu\}.
\]

The retained functional (ledger 2.10a) is

\[
\widehat\Lambda(G)=\min_{\xi\in H_{1,0}}
\left\{\|\xi\|_2^2+E|L+G-\xi|+E|L-G+\xi|\right\}
-p\|G\|_2^2,
\]

where \(H_{1,0}\) is the full first chaos of the actual visible and remote
coordinates. Taking the trial retained vector \(\xi=-(3/5)r\) is allowed
and gives the tilted input used below.

Let \(\operatorname{ph}(z)=z/|z|\) for \(z\ne0\), with arbitrary value at
zero, and define the tilted profile

\[
\Phi_0(w)=E_{z_1}[(T-2/5)\operatorname{ph}(L+w)],\qquad
\Phi(w)=\Phi_0(w)-(g_0+(3/5)j_0)w.
\]

Then \(c(q)=\Pi_1\Phi(q)=\Pi_1\Phi_0(q)=c_{3/5}(q)\), because
the first and third chaoses are orthogonal. The linear subtraction changes
neither the Hessian nor higher derivatives.

The numbered inputs are pinned to repository commit
`7fe22ca8ba33789f6e87676f920d46146a569e15`:

| Input | Exact use here | Evidence in this delivery |
|---|---|---|
| 3.3 | \(\Lambda(q)<S+9/25000000\), all dimensions and energies | Accepted existing P+C result; its large remote certificate is not rerun here |
| 3.4 | \(E\vert h\vert ^4\le44(E\vert h\vert ^2)^2\) for \(h\in H_{2,1}\) | Existing Lean theorem; not rebuilt here |
| 11.30, `content_profile_proof.md` | \(\sup N_\Phi<1/3\) | The scalar interval certificate is rerun here, 111 boxes plus an analytic half-line |
| 11.30, `content_next_m3_proof.md` | For \(m(x)=E[(T-2/5)\operatorname{sign}(\Re L+x)]\), \(\sup\vert m'''\vert <13\) | The scalar interval certificate is rerun here, 120 boxes plus an analytic half-line; no reliance on the separately questioned tensor-to-complex passage |
| 11.12, 11.39, 11.40 | \(\widehat\Lambda(q+(T-1)r)\le\Lambda(q)+2\|c(q)\|\|r\|-k\|r\|^2\), \(k=59009/189100\) | Accepted existing P+C remainder input; the square completion and rational consumers are checked here |
| 6.2.1, 7.1.1 | Raw A/B costs, only for the separate zero-content corollaries in §8 | Accepted existing results; never applied successively to a core with both shells |

In the Hessian input, at \(w=(R,0)\), set

\[
A=\partial_{11}\Phi_1,\qquad
B=\partial_{22}\Phi_1=\partial_{12}\Phi_2,
\quad N_\Phi=\max\{(3A^2-2AB+3B^2)/8,B^2\}.
\]

For every real symmetric \(2\times2\) matrix \(D\), its elementary metric
inequality is

\[
|D:D^2\Phi(w)|^2\le N_\Phi(|w|)
\big((\operatorname{tr}D)^2+2\|D\|_F^2\big).
\tag{1.1}
\]

Taking \(D=vv^t\), whose metric square is \(3|v|^4\), gives the particularly
useful new consumer of that input:

\[
\boxed{|D^2\Phi_0(w)[v,v]|\le |v|^2\quad\text{for all }w,v\in\mathbb C.}
\tag{1.2}
\]

All profile derivatives in this document are real derivatives on
\(\mathbb C=\mathbb R^2\).

## 2. A phase selection theorem (P)

**Theorem 2.1.** Suppose a compact subgroup \(G\subset U(n)\) fixes a
polynomial \(q\), in the sense \(q(gZ)=q(Z)\), and has no fixed vectors in
the coordinate representation \(\mathbb C^n\). Then

\[
E[\overline Z\,F(q)]=0,\qquad \Pi_1F(q)=0
\tag{2.1}
\]

for every measurable \(F\) for which \(F(q)\in L^2\).

**Proof.** Unitary invariance of Gaussian measure and invariance of \(q\)
imply that the coefficient vector \(v=E[\overline Z F(q)]\) satisfies
\(v=\overline g v\) for every \(g\in G\). Conjugating gives a fixed vector
for the original representation, so \(v=0\). Orthogonality of the
coordinates identifies \(v\) with the coefficients of the projection.
This is the standard invariant-subspace argument; no new general invariant
theory theorem is being claimed. ∎

For a diagonal group this has a finite, exact coefficient test. A Wick
monomial \(H_{\alpha,\beta}(Z)\) has charge \(\alpha-\beta\in\mathbb Z^n\).
Every contraction removed by Wick ordering removes one holomorphic and one
antiholomorphic power of the same coordinate, so the charge is unchanged.
Let \(\mathcal L\subset\mathbb Z^n\) be the lattice generated by the
charges of the nonzero coefficients of \(q\). If

\[
e_j\notin\mathcal L\quad\text{for every }j,
\tag{2.2}
\]

then (2.1) holds. Indeed, take the closed annihilator of \(\mathcal L\)
in the coordinate torus. A character is trivial on that annihilator
exactly when its exponent belongs to \(\mathcal L\). To see the converse
without a duality assumption, put an integer basis matrix for
\(\mathcal L\) in Smith normal form: the quotient is a product of cyclic
groups and free copies of \(\mathbb Z\), and a nonzero quotient element is
separated by a character of one of these factors. Thus each coordinate
character is nontrivial. Applying invariance to each coefficient proves
(2.1). One group element need not separate every coordinate simultaneously.

A simpler sufficient certificate, used in the replay, is an integer \(M\)
and weights \(w_j\not\equiv0\pmod M\) such that

\[
(\alpha-\beta)\cdot w\equiv0\pmod M
\tag{2.3}
\]

for every nonzero Wick coefficient. The diagonal transformation
\(Z_j\mapsto e^{2\pi i w_j/M}Z_j\) then proves (2.1). This certificate is
verified with integers, without approximating roots of unity.

The theorem generalizes the separated-block construction in ledger 11.31.
It applies to every scalar profile of \(q\), not just to the cubic peak
profile. In particular it eliminates both raw first-chaos contents, every
tilt, and first-chaos contents arising from other row profiles. It does not
eliminate arbitrary projections onto higher remote chaoses in degree five.

## 3. Connected cyclic cubics (P; finite controls C)

For \(n\ge2\), set

\[
P_n(Z)=\sum_{j=0}^{n-1} a_j Z_j^2\overline Z_{j+1},
\qquad Z_n=Z_0.
\tag{3.1}
\]

The coefficients \(a_j\) are arbitrary complex numbers. These are Wick
cubics without lower-order corrections. Put \(M=2^n-1\) and \(w_j=2^j\).
The charges obey \(2w_j-w_{j+1}=0\pmod M\), including the last edge, and
none of the weights is zero. Therefore

\[
\boxed{\Pi_1F(P_n)=0\quad\text{for every }F(P_n)\in L^2.}
\tag{3.2}
\]

Every coordinate occurs in both holomorphic and antiholomorphic roles when
all coefficients are nonzero. Thus this is not a separated X/Y-block form
in the displayed coordinates. No assertion is needed about its classification
under arbitrary unitary changes of coordinates.

Here are exact fourth moments. Write \(A_j=|a_j|^2\). For \(n\ge3\),

\[
u=2\sum_j A_j,\qquad
\boxed{\delta=40\sum_j A_j^2+32\sum_j A_jA_{j+1}.}
\tag{3.3}
\]

For \(n=2\), replace the second term by \(128A_0A_1\).

**Proof.** The charge vectors \(v_j=2e_j-e_{j+1}\) are linearly independent
over \(\mathbb R\): \(2c_j-c_{j-1}=0\) cyclically forces \(c=0\).
Consequently a phase-balanced term in \(P_n^2\overline P_n^2\) must have
the same multiplicity of each edge on both sides. A single edge has second
moment 2 and fourth moment 48. Two adjacent edges have squared-modulus
product expectation \(2!3!1!=12\); two nonadjacent edges have expectation
4. The unordered adjacent pairs are precisely the \(n\) cyclic pairs for
\(n\ge3\), including all three pairs when \(n=3\). Expansion yields (3.3).
When \(n=2\), the product expectation is \(3!3!=36\), yielding the stated
exception. ∎

For \(a_j=1\), \(u=2n\), \(\delta=72n\), and \(\chi=18/n\) for \(n\ge3\).
Thus the examples with \(n=3,5,9,18\) have respectively \(\chi=6,18/5,2,1\).
Zero content here is not a small-cumulant estimate.

An exact higher-moment formula, useful for further certificates, is

\[
E|P_n|^{2k}=
\sum_{c_0+\cdots+c_{n-1}=k}
\left(\frac{k!}{\prod_j c_j!}\right)^2
\prod_j |a_j|^{2c_j}(2c_j+c_{j-1})!.
\tag{3.4}
\]

This follows from the same linear independence and
\(E|Z|^{2d}=d!\). Formula (3.4) is a written all-\(k\) identity, not an
infinite numerical test.

## 4. Perturbations whose first variation vanishes (P)

Let \(g\) be diagonal of finite order \(M\), with nonzero coordinate weights
\(w_j\). Let \(p_0\in H_{2,1}\) be invariant under \(g\). Decompose a
perturbation \(h\in H_{2,1}\) by characters of \(g\). Call a character
resonant if it belongs to

\[
\mathcal R=\{w_j,-w_j:0\le j<n\}\pmod M.
\]

**Theorem 4.1.** Suppose \(h\) has no resonant character and 

\(\Phi_0:\mathbb C\to\mathbb C\) is \(C^2\) with
\(|D^2\Phi_0(w)[v,v]|\le M_2|v|^2\). Then

\[
\boxed{\|\Pi_1\Phi_0(p_0+h)\|^2
\le\frac{M_2^2}{4}E|h|^4.}
\tag{4.1}
\]

No independence between \(p_0\) and \(h\), no dimension bound and no bound
on the coefficients of \(p_0\) are required.

**Proof.** The constant term has zero projection by Theorem 2.1. In
Wirtinger notation the first derivative is

\[
D\Phi_0(p_0)[h]=(\partial_z\Phi_0)(p_0)h+
(\partial_{\bar z}\Phi_0)(p_0)\bar h.
\]

The coefficient functions are invariant under \(g\). Neither the characters
of \(h\) nor their negatives are coordinate characters, so every first-chaos
coefficient of this derivative is zero. Taylor's integral remainder is

\[
R=\int_0^1(1-t)D^2\Phi_0(p_0+th)[h,h],dt,
\quad |R|\le(M_2/2)|h|^2.
\]

Projection is an \(L^2\) contraction; hence (4.1). Cubic moments guarantee
all required integrability. ∎

By (1.2), the actual tilted profile has \(M_2=1\). Thus, putting
\(v=E|h|^2\),

\[
\boxed{\|c(p_0+h)\|^2\le E|h|^4/4\le11v^2.}
\tag{4.2}
\]

The last inequality uses ledger 3.4. For a single product of three distinct
complex coordinates, \(h=\varepsilon Z_iZ_j\bar Z_k\), it improves to

\[
\boxed{\|c(p_0+h)\|^2\le2v^2,\qquad v=|\varepsilon|^2,}
\tag{4.3}
\]

since \(E|h|^4=8v^2\).

For the five-cycle weights \(1,2,4,8,16\pmod{31}\), there are 75 Wick
basis monomials: five invariant, 35 nonresonant noninvariant, and 35
resonant. The certificate lists the 35 admissible perturbation monomials.
Any linear combination of these 35 is allowed in (4.2), with arbitrary
sharing. The enumeration is C; (4.1) proves the assertion for their entire
complex span.

### 4.1 A bound allowing all perturbation directions (P+C)

Split \(h=h_{\mathrm r}+h_{\mathrm p}\) orthogonally into its resonant and
remaining characters, with \(v_{\mathrm r}=E|h_{\mathrm r}|^2\) and
\(v=E|h|^2\). Then the same argument gives the computable bound

\[
\boxed{\|c(p_0+h)\|\le
\sqrt{3v_{\mathrm r}/2}+\tfrac12\sqrt{E|h|^4}
\le\sqrt{3v_{\mathrm r}/2}+\sqrt{11}\,v.}
\tag{4.4}
\]

Here is a proof of the Lipschitz constant used in the surviving linear term.
We have \(\|\Phi_0\|_\infty\le E|T-2/5|<3/4\); the strict inequality is
also checked by the profile certificate. For any real unit output vector
\(e\) and unit direction \(v\), the scalar function
\(f(t)=e\cdot\Phi_0(w+tv)\) has \(|f|\le M<3/4\), \(|f''|\le1\).
Its two Taylor estimates at \(\pm t\) give
\(|f'(0)|\le M/t+t/2\). Optimizing over \(t>0\) gives
\(|f'(0)|\le\sqrt{2M}<\sqrt{3/2}\). Take the supremum over \(e,v\).
In the projection of the first derivative only \(h_{\mathrm r}\) remains;
Taylor's remainder uses the total \(h\). This proves (4.4).

This supplies an actual neighborhood in the whole coefficient space,
though the allowed resonant energy is much smaller than the nonresonant
energy. It does not assert that every cubic is close to an invariant one.

## 5. Higher-order phase selection (P)

If \(h(gZ)=\zeta^a h(Z)\), the \(k\)-th Taylor term
\(D^k\Phi_0(p_0)[h,\ldots,h]\) has characters among

\[
\{(2r-k)a\pmod M:0\le r\le k\}.
\tag{5.1}
\]

This is just the real multilinear derivative written as a sum of
\(h^r\bar h^{k-r}\) times functions of \(p_0\). If none is a coordinate
character, the projected \(k\)-th Taylor term vanishes. Suppose this holds
for \(0\le k<d\), and an explicit directional bound
\(|D^d\Phi_0(w)[v,\ldots,v]|\le M_d|v|^d\) is available. Taylor's integral
remainder proves

\[
\boxed{\|\Pi_1\Phi_0(p_0+h)\|^2
\le \frac{M_d^2}{(d!)^2}E|h|^{2d}.}
\tag{5.2}
\]

This is a finite-order bound, not a claim about convergence of an infinite
Taylor series on an unbounded Gaussian domain.

### 5.1 An explicit third-derivative bound for the peak profile

The elementary angular identity

\[
\operatorname{ph}(z)=\frac14\int_0^{2\pi}
e^{i\theta}\operatorname{sign}(\Re(e^{-i\theta}z))\,d\theta
\]

and rotational invariance of \((L,T)\) give

\[
\Phi_0(w)=\frac14\int_0^{2\pi}e^{i\theta}
m(\Re(e^{-i\theta}w))\,d\theta.
\tag{5.3}
\]

Differentiate three times in a real direction \(v\), use the freshly
replayed \(\|m'''\|_\infty<13\), and use
\(\int_0^{2\pi}|\cos\theta|^3d\theta=8/3\). This gives

\[
\boxed{|D^3\Phi_0(w)[v,v,v]|\le(26/3)|v|^3.}
\tag{5.4}
\]

The smoothness and domination needed in (5.3) follow from the weighted
visible density and its exponentially decaying derivatives; those formulas
and their tails are in the included upstream proof. This passage is
independent of the real-third-chaos tensor estimate in ledger 11.30.

### 5.2 The perturbed five-cycle

Let \(p_0=\sum_{j=0}^4 a_j Z_j^2\bar Z_{j+1}\) and

\[
h=\varepsilon Z_0Z_2\bar Z_1,\qquad v=|\varepsilon|^2.
\]

The perturbation character is \(1+4-2=3\pmod{31}\). The character sets in
(5.1) avoid \(\{1,2,4,8,16\}\) for \(k=0,1,2,3,4\). At \(k=5\), the
character \(-15=16\pmod{31}\) first appears. Since 31 is prime, this
perturbation destroys the displayed cycle's nontrivial diagonal symmetry
when all five cycle coefficients and \(\varepsilon\) are nonzero. We are
not simply adding another exactly invariant monomial.

For the quantitative estimate only \(k\le2\) is needed. The exact moment
\(E|h|^6=(3!)^3v^3=216v^3\), combined with (5.2) and (5.4), proves

\[
\boxed{\|c(p_0+h)\|^2\le
\min\left\{2v^2,\frac{1352}{3}v^3\right\}.}
\tag{5.5}
\]

This holds for every complex coefficient \(a_j,\varepsilon\). No claim is
made that the fifth-order coefficient is nonzero: (5.1) is a selection
rule, not a sufficiency theorem for nonvanishing.

### 5.3 A fifth-order bound (P+C, new scalar certificate)

The complete argument in FIFTH_DERIVATIVE.md and its outward Arb replay
establish

\[
\sup_{x\in\mathbb R}|m^{(5)}(x)|<1000.
\tag{5.6}
\]

The replay covers 240 adjacent rational boxes on \([0,3]\), and a proved
analytic tail overlapping them. It differentiates the weighted density by
an exact rational recurrence, rather than by numerical differences.

For real unit vectors \(e,v\), Hölder's inequality gives

\[
\int_0^{2\pi}|e\cdot e_\theta|\,|v\cdot e_\theta|^5\,d\theta
\le \left(\int|\cos\theta|^6d\theta\right)^{1/6+5/6}
=5\pi/8.
\]

Applying this to (5.3), then taking the supremum over the output vector
\(e\), proves

\[
|D^5\Phi_0(w)[v,v,v,v,v]|\le(625\pi/4)|v|^5.
\]

All Taylor terms of orders zero through four have zero projection by §5.2.
Since \(E|h|^{10}=(5!)^3v^5\), (5.2) now yields

\[
\boxed{\|c(p_0+h)\|^2
\le\frac{375000000\pi^2}{128}v^5
<30000000v^5\quad(v>0).}
\tag{5.7}
\]

The non-strict version covers \(v=0\). The rational comparison uses
\(\pi<22/7\) and \(484/49<10\). For completeness the first inequality
follows from
\[
\frac{22}{7}-\pi
=\int_0^1\frac{x^4(1-x)^4}{1+x^2}\,dx>0.
\]
Polynomial division gives quotient
\(x^6-4x^5+5x^4-4x^2+4\) and remainder \(-4\);
the exact checker verifies this identity and its integral.
Thus the strongest available content estimate here is the minimum of the
two branches in (5.5) and the fifth-power branch (5.7).

## 6. Explicit same-core sector consequences (P+C)

The existing all-amplitude estimate 11.40, with exactly the same \(q\), is

\[
\widehat\Lambda(q+(T-1)r)\le\Lambda(q)+\|c(q)\|^2/k,
\qquad k=59009/189100.
\tag{6.1}
\]

It follows that every perturbation in Theorem 4.1 satisfies

\[
\widehat\Lambda(p_0+h+(T-1)r)
<S+\frac9{25000000}+\frac{11}{k}v^2.
\tag{6.2}
\]

There is no bound on \(r\) and no independence requirement. For
\(v\le1/2000\), the right side is strictly below

\[
\boxed{S+92/10000000=S+9.2\cdot10^{-6}.}
\tag{6.3}
\]

The fully unrestricted-direction variant (4.4) gives

\[
\widehat\Lambda(p_0+h+(T-1)r)
< S+\frac9{25000000}
+\frac1k\left(\sqrt{3v_{\mathrm r}/2}+\sqrt{11}\,v\right)^2.
\tag{6.4}
\]

For \(v\le1/2000\), \(v_{\mathrm r}\le10^{-8}\), this is below
\(S+11\cdot10^{-6}\). For exact verification bound the two square roots by
\(123/10^6\) and \(1659/10^6\), respectively, and cross-multiply the
resulting rational inequality. These are sufficient explicit radii, not
optimal ones.

For the perturbed five-cycle, (5.7) gives the stronger statement

\[
v\le1/1000\quad\Longrightarrow\quad
\boxed{\widehat\Lambda(p_0+h+(T-1)r)
<S+23/50000000=S+4.6\cdot10^{-7}.}
\tag{6.5}
\]

To exhibit a concrete moderate-kurtosis family, take

\[
p_0=\frac{\sqrt{39}}{100}\sum_{j=0}^4Z_j^2\bar Z_{j+1},
\qquad |\varepsilon|^2\le1/1000.
\tag{6.6}
\]

Then \(u=39/1000+v\le1/25\), and

\[
\delta=360(39/10000)^2+104(39/10000)v+6v^2,
\qquad
\boxed{18/5\le\chi\le7359/2000=3.6795.}
\tag{6.7}
\]

**Verification of (6.7).** Let \(x=39/10000\). Orthogonality gives
\(u=10x+v\). Phase selection eliminates unequal numbers of \(h\) and
\(\bar h\) in the fourth moment. Direct independent Gaussian moments give
\(E|P_5|^2|Z_0Z_2\bar Z_1|^2=12+12+6+2+4=36\).
Thus the fourth excess is \(360x^2+104xv+6v^2\). Its ratio to
\((10x+v)^2\) has derivative with positive numerator
\(320x^2+16xv\); evaluate its two endpoints. The exact checker also
computes the moments directly from ordinary Gaussian polynomials,
including non-real perturbation coefficients. ∎

The bounds (6.2)–(6.5) use the remote cap on the very same cubic \(q\).
They do not replace its law by a worst-case law at another energy.
Nevertheless they are sector-cap results, not a proof of
\(C(q)^2\le0.1D(q)\) with signed deficit. In particular no conclusion
\(D(q)\ge0\) is being smuggled in.

## 7. An exact obstruction to improving only the scalar Stein budget (P+C)

Write \(Z_j=(G_{2j}+iG_{2j+1})/\sqrt2\), with real standard Gaussians \(G\).
For a complex cubic define the bilinear real carré du champ

\[
\Gamma(f,g)=\sum_\ell\partial_{G_\ell}f\partial_{G_\ell}g,
\quad
\mathcal B(q)=2E(\Gamma(q,\bar q)-3u)^2+E|\Gamma(q,q)|^2.
\]

The existing input is \(\mathcal B(q)\le6\delta\). Already for
\(q=Z_0^2\bar Z_1\),

\[
u=2,\quad E|q|^4=48,\quad\delta=40,
\quad\boxed{\mathcal B(q)=200=5\delta.}
\tag{7.1}
\]

**Proof.** Put \(X=|Z_0|^2,Y=|Z_1|^2\). In Wirtinger coordinates,

\[
\Gamma(q,\bar q)=4XY+X^2,
\qquad\Gamma(q,q)=0.
\]

Its expectation is 6 and second moment is
\(16E[X^2Y^2]+8E[X^3Y]+E[X^4]=64+48+24=136\).
Thus \(\mathcal B=2(136-36)=200\). The moment statements follow from
\(EX^r=r!\). ∎

Hence any universal replacement \(\mathcal B\le c\delta\) must have
\(c\ge5\). Replacing only the 6 can improve a bound on content squared
or sector gain by at most \(6/5\), not the factor 1.5–3 sought in the
degree-5 band. This conclusion concerns that single coefficient; it does
not preclude correlated refinements of the Hessian and tensor terms.

The exact checker additionally verifies \(\mathcal B(P_n)=5\delta(P_n)\)
for equal-coefficient cycles \(2\le n\le12\). These are finite C controls;
the all-dimensional obstruction needs only the two-coordinate proof above.
The same examples have identically zero nonlinear first-chaos content.
Thus retaining the first-chaos projection can matter much more than
tightening this scalar budget. No unproved optimal constant is claimed.

## 8. Raw content, degree five, and remaining gaps

**P, with the indicated existing costs.** For an invariant cubic of Theorem
2.1, both raw content vectors vanish. Ledger 6.2.1 therefore gives

\[
\Lambda(q+(T-1)r_A)\le\Lambda(q)-(6/25)\|r_A\|^2
\quad(\|r_A\|^2\le113/10000),
\]

and 7.1.1 gives

\[
\Lambda(q+z_1^2\bar r_B/\sqrt2)
\le\Lambda(q)-(13/50)\|r_B\|^2
\]

at every B amplitude. Both are separate one-shell results over a remote
base. They cannot be stacked to infer (P) or the odd premise over A/B.

For degree five, Theorems 2.1 and 4.1 and the selection rule in §5 are
profile-independent. If a degree-5 first-chaos content has profile \(\Phi_5\) with
certified bound \(M_{2,5}\), the immediate replacement is
\(\|\Pi_1\Phi_5(p_0+h)\|^2\le(M_{2,5}^2/4)E|h|^4\).
The theorem supplies the phase part of such a check. This delivery does
not claim a numerical \(M_{2,5}\), coverage of all degree-5 first variations,
or that general adversaries in \(t\in[0.80,0.855]\) satisfy its symmetry
or proximity hypothesis. Those remain open.

The genuinely missing general step is a phase-sensitive decomposition or
estimate that covers every cubic, including the resonant part, at useful
cost against the same-law deficit. The quantitative neighborhood in §4.1
does not provide such a decomposition theorem. General raw content 6.3.18,
joint A/B (P) 7.4, and odd-over-A/B 7.5.5 remain open. No new lower bound
for \(K_G^{\mathbb C}\) follows from this package alone.
