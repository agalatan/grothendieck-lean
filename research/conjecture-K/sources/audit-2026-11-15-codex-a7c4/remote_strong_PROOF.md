<!-- Source: /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/conjecture-K-report/gpt-packages/independent-sector-stein-3p6e-7.zip!/independent-stein-new/PROOF.md; dated 22 October 2026; copied verbatim 15 November 2026 by codex-a7c4. -->
# A Stein certificate for the independent cubic sector

22 October 2026. **[P]** denotes an analytic proof, **[C]** an exact or interval-arithmetic certificate, and **[F]** floating-point evidence only. No [F] assertion is used below.

## 1. Result and scope [P,C]

Put \(a=699/1250\), \(b=179/1250\), \(p=2500/1891\), and \(L=Z(a+b|Z|^2)\). For every genuine complex bidegree-\((2,1)\) Wick cubic \(q\) independent of \(Z\), with arbitrary complex coefficients in every finite dimension,
\[
 \boxed{\Lambda(q)<\frac{1373953883}{10^9}
 =1.373953883<S+\frac9{25000000}=S+3.6\cdot10^{-7}.}       \tag{1}
\]

There are no restrictions on variance, influence, rank, or distance from a Gaussian. This proves the requested improved bound for the independent sector. It does not prove the exact conjecture, or a bound for arbitrary cubics involving \(Z\).

The same upper bound holds for joint laws satisfying the moment bounds, radial Stein identity, separate spectral budgets, and covariance order below. Adding the contraction-Gram constraints can only decrease this relaxation. The exponential law with zero fluctuation variables is feasible, so the value of the full joint-constraint relaxation lies in \([S,1.373953883)\). This is an enclosure, not an exact evaluation of that value.

The certificate uses **68 profile caps, 45 Stein nodes, and 154 outer moment rectangles**. It uses the separate budgets and covariance order; the stronger contraction-Gram budget is not needed.

## 2. Inherited mathematical inputs [P]

For a normalized genuine cubic \(Q\), define
\[
 U=|Q|^2,\quad \chi=\mathbb E U^2-2,\quad
 X_c=\Gamma(Q,\bar Q)/3-1,\quad c=\Gamma(Q,Q)/3,\quad
 r=\Re(c\bar Q^2)/U
\]
on \(U>0\), and set \(r=0\) at zero. The real Ornstein--Uhlenbeck generator has eigenvalue \(-3\) on \(Q\). Write
\[
 P=\mathbb E[X_cU],\qquad Q_c=\mathbb E[rU].
\]
The scalar covariance \(Q_c\) is distinct from the polynomial \(Q\).

We use the supplied moment theorem for genuine \(H_{2,1}\) cubics:
\[
 \mathbb E U=1,\quad 0\le\chi\le60,\qquad
 \mathbb E U^3\le6+9\chi+C\chi^{3/2},\quad
 C=\frac{4045313}{100000}.                              \tag{2}
\]
In fact the supplied tensor theorem gives \(\chi\le42\), but \(60\) suffices. The supplied sixth-moment discussion is copied as **INHERITED-SIXTH-MOMENT.tex**. Its numerical constant is an inherited theorem input, not an optimizer output or a tensor certificate freshly replayed here.

The spectral and covariance inputs are
\[
 \mathbb E X_c=0,\quad 2P+Q_c=\chi,\quad
 \mathbb E X_c^2\le2P/3,\quad
 \mathbb E r^2\le2Q_c/3,\quad Q_c\le\chi/3.              \tag{3}
\]
For completeness, the separate spectral proof is elementary. In real OU degrees, write
\[
 U=1+U_2+U_4+U_6,\qquad Q^2=V_2+V_4+V_6.
\]
Properness removes the constant of \(Q^2\). The product rule gives
\[
 X_c=\tfrac23U_2+\tfrac13U_4,\qquad
 c=\tfrac23V_2+\tfrac13V_4.
\]
Orthogonality and \(|r|\le|c|\) imply
\[
 \tfrac23P-\mathbb E X_c^2=\|U_4\|_2^2/9\ge0,
\]
\[
 \tfrac23Q_c-\mathbb E r^2
 =\|V_4\|_2^2/9+\mathbb E(|c|^2-r^2)\ge0.
\]
The generator identities
\(\mathcal LU=6(1+X_c-U)\) and
\(\Gamma(U,U)=6U(1+X_c)+6rU\), integrated in
\(\mathcal L(U^2)=2U\mathcal LU+2\Gamma(U,U)\), give \(2P+Q_c=\chi\).
The eigenfunction integration-by-parts identity also gives \(\mathbb E X_c=0\).

Here is the covariance-order argument for the intended bidegree. Write
\[
 Q=\sum t_{ijk}{:}z_i z_j\bar z_k{:},\qquad t_{ijk}=t_{jik},
\]
and form
\[
 N_{ab}=\sum_{jk}t_{ajk}\bar t_{bjk},\quad
 H_{ab}=\sum_{jk}t_{jka}\bar t_{jkb},\quad
 B_{be}=\sum_{ad}t_{abd}t_{dea}.
\]
The supplied finite-sum Wick identities give
\[
 P-Q_c=16(\|N\|_{\rm HS}^2-\|B\|_{\rm HS}^2)
             +4\|H\|_{\rm HS}^2.                      \tag{4}
\]
Vectorize the slices of \(t\) as columns of \(R\), and let \(J\) transpose each slice. Then \(B=R^{\mathsf T}JR\) and \(R^*R=N^{\mathsf T}\). Hilbert--Schmidt Cauchy--Schwarz applied to the trace pairing of \(A^*A\) and \(BB^*\) proves \(\|AB\|_{\rm HS}\le\|A\|_4\|B\|_4\). Consequently
\[
 \|B\|_{\rm HS}\le\|R^{\mathsf T}\|_4\|JR\|_4
 =\|N\|_{\rm HS}.
\]
Thus \(P\ge Q_c\); together with \(2P+Q_c=\chi\), this proves covariance order. The supplied proof, including the finite-sum derivation of (4), is retained as **INHERITED-COVARIANCE.tex**.

The radial integration-by-parts identity is
\[
 \mathbb E[Uf(U)]
 =\mathbb E[(1+X_c)(f(U)+Uf'(U))+rUf'(U)].             \tag{5}
\]
It follows from Gaussian integration by parts applied to \(Qf(|Q|^2)\), the eigenvalue \(-3\), and the chain rule. Our tests have bounded \(f,f',uf'\); the finite polynomial moments justify the chain rule and integration by parts. This is precisely the test class in the supplied radial Stein theorem.

**Verification boundary.** Equations (2)--(5) are supplied mathematical theorems, with the spectral and covariance arguments recalled above. The new checker recomputes every profile integral, rational majorant inequality, cover, interpolation allowance, and comparison with \(S\). It does not claim to re-prove the inherited sixth-moment theorem. The latter fails for some arbitrary proper pairs of real cubic chaoses; that larger class is not included.

## 3. Profile and uniform curvature [P]

Set \(h(s)=2\mathbb E|L+\sqrt s|\). For \(v=\mathbb E|q|^2>0\) and \(Q=q/\sqrt v\), circular symmetry of \(L\) and independence give
\[
 \Lambda(q)=\mathbb E h(vU)-pv.                       \tag{6}
\]
Indeed each conditional expectation of \(|L\pm q|\), given \(q\), equals \(h(|q|^2)/2\).

The supplied proof, copied as **INHERITED-BERNSTEIN.md**, shows that \(h-h(0)\) is a Bernstein function. Hence
\[
 h'>0,\quad h''<0,\quad h'''>0,\quad h^{(4)}<0
 \quad(s>0).                                        \tag{7}
\]
Recall the mechanism. Set \(A=a+bt\), \(B=a+3bt\). The density \(\eta\) of \(|L|^2\) satisfies
\[
 s=tA^2,\quad ds=AB\,dt,\quad \eta(s)=e^{-t}/(AB).
\]
Applying \(-d/ds\) to \(e^{-t}A^{-j}B^{-k}\) gives only nonnegative multiples of expressions of that form. Thus \(\eta\) is completely monotone. Its exponential-mixture representation, normalized by \(\int\eta=1\), identifies \(L\) in law as \(\sqrt D\,W\), for \(D>0\) and independent standard complex Gaussian \(W\).

For fixed \(D\), the square-root integral formula and the Gaussian integral give
\[
 h_D(s)-h_D(0)=\frac1{\sqrt\pi}\int_0^\infty
 \frac{1-e^{-ts/(1+Dt)}}{(1+Dt)t^{3/2}}\,dt.           \tag{8}
\]
Here the Gaussian integral is
\(\mathbb E e^{-t|\sqrt D W+\sqrt s|^2}
=(1+Dt)^{-1}e^{-ts/(1+Dt)}\).
Differentiating (8) gives
\(-h_D''(0)=\sqrt\pi D^{-3/2}/8\), since
\(\int_0^\infty y^{1/2}(1+y)^{-3}dy=\pi/8\), by \(y=\tan^2\theta\).

Tonelli applied to the density mixture gives
\[
 \int_0^\infty\frac{-\eta'(s)}{\sqrt s}\,ds
 =\sqrt\pi\,\mathbb E D^{-3/2}.
\]
The same integral, in the variable \(t\), is
\[
 \int_0^\infty e^{-t}t^{-1/2}
 \{A^{-2}B^{-1}+bA^{-3}B^{-1}+3bA^{-2}B^{-2}\}\,dt
 \le\sqrt\pi(a^{-3}+4ba^{-4}).
\]
This proves finiteness of the negative moment, justifying the derivative at zero and dominated convergence in (8). Since \(h''\) increases by (7),
\[
 0<-h''(s)\le-h''(0)
 \le\frac{\sqrt\pi}{8}(a^{-3}+4ba^{-4})
 <\frac14(a^{-3}+4ba^{-4})<3\quad(s\ge0).              \tag{9}
\]
The inequality \(\pi<4\) follows by comparing the unit disk with its circumscribed square. The last inequality in (9) is checked exactly as a rational inequality.

## 4. A spectral Stein cut [P]

Let \(\phi\) be continuous piecewise affine on \([0,T]\), and constant after \(T\). Put
\[
 \Phi(u)=\int_0^u\phi(s)\,ds,\quad
 d(u)=\phi(u)-\Phi(u)/u,\quad A_\phi(u)=\Phi(u)-\phi(u),
\]
with \(d(0)=0\). The test \(f=\Phi/u\), extended continuously at zero, is \(C^1\), with \(f,f',uf'\) bounded. Equation (5) gives
\[
 \mathbb E A_\phi(U)=\mathbb E[X_c\phi(U)+r d(U)].      \tag{10}
\]
For \(\lambda,\mu>0\), \(\nu\ge0\), and real \(t_0,\beta_0\), define
\[
 f_0(u)=-(\phi(u)+\beta_0)/2+(2t_0+\lambda/3)u,
\]
\[
 g_0(u)=-d(u)/2+(t_0+\mu/3-\nu/2)u,
\]
\[
 G(u)=f_0(u)^2/\lambda+g_0(u)^2/\mu
          +A_\phi(u)+(\nu/3-2t_0)(u^2-2).             \tag{11}
\]
Expansion, (10), \(\mathbb E X_c=0\), and \(2P+Q_c=\chi\) give exactly
\[
 \begin{split}
 \mathbb E G(U)={}&
 \mathbb E[\lambda(X_c-f_0(U)/\lambda)^2
                   +\mu(r-g_0(U)/\mu)^2]\\
 &+\lambda(2P/3-\mathbb E X_c^2)
   +\mu(2Q_c/3-\mathbb E r^2)+\nu(\chi/3-Q_c)\ge0.
 \end{split}                                        \tag{12}
\]
All expectations are finite: \(\phi,d\) are bounded, \(\Phi,f_0,g_0\) have at most linear growth, and (2)--(3) provide the needed moments. Compact support is not required.

Suppose a cubic \(R(u)=\sum_{j=0}^3R_j u^j\), with \(R_3\ge0\), satisfies
\[
 R(u)\ge h(vu)+G(u)\quad(u\ge0).                      \tag{13}
\]
Then (2), (6), and (12) imply
\[
 \Lambda(q)\le
 R_0+R_1+(2+x^2)R_2+(6+9x^2+Cx^3)R_3-pv,\quad
 x=\sqrt\chi.                                       \tag{14}
\]
The right side has form \(c_0+c_2x^2+c_3x^3\), with \(c_3\ge0\). Its derivative is \(x(2c_2+3c_3x)\), whose parenthesized factor increases. An interior critical point at \(x>0\) can only be a minimum. Therefore its maximum on a nonnegative interval occurs at an endpoint, including when \(c_3=0\).

## 5. Verification on the whole half-line [P,C]

On a test interval write
\[
 \phi=A+Bu,\qquad\Phi=e+Au+(B/2)u^2.
\]
Then \(f_0=-(A+\beta_0)/2+(-B/2+2t_0+\lambda/3)u\) and
\(ug_0=e/2+(-B/4+t_0+\mu/3-\nu/2)u^2\). Thus
\[
 \begin{split}
 u^2G(u)={}&u^2f_0(u)^2/\lambda+(ug_0(u))^2/\mu\\
 &+u^2\{e-A+(A-B)u+(B/2)u^2\}
       +(\nu/3-2t_0)(u^4-2u^2). 
 \end{split}                                        \tag{15}
\]
All coefficients are rational. The checker reconstructs \(\Phi\) by integrating the supplied affine pieces, rather than trusting supplied primitive coefficients.

For positive nodes \(\alpha<\beta\), let \(H\) be the cubic matching \(h,h'\) at both nodes. Hermite's formula and (7) give
\[
 h(s)-H(s)=\frac{h^{(4)}(\xi)}{24}
                  (s-\alpha)^2(s-\beta)^2\le0.         \tag{16}
\]
One proof subtracts a suitable multiple of the displayed quartic from \(h-H\), creates a fifth zero counted with multiplicity, and applies Rolle's theorem four times. This works even outside the interpolation interval. Continuity covers zero. Three applications of Rolle's theorem also show that the leading coefficient of \(H\) is positive.

The file **profile-caps.json** assigns rational cubics to 68 adjacent intervals covering \([0,2]\). The verifier recomputes \(h,h'\) at their positive nodes, computes each Hermite coefficient as an interval, and checks that the stored rational coefficient is strictly larger. Coefficientwise upward rounding preserves a majorant on \(s\ge0\). The first interval includes zero but uses positive interpolation nodes. Beyond 2 the checker verifies an upward rounding of the intercept and slope of the tangent \(h(2)+(s-2)h'(2)\).

At a variance node, merge the test knots with the profile endpoints divided by \(v\). On each resulting interval, substitute the appropriate profile cap in (13) and multiply the difference by \(u^2\). The result is a rational polynomial of degree at most five. On the initial interval its exact factor \(u^2\) is canceled, explicitly covering the value at zero.

A polynomial with nonnegative Bernstein coefficients on an interval is nonnegative there, because the Bernstein basis is nonnegative and sums to one. **exact.py** checks these coefficients with fractions of integers, bisecting intervals if necessary. Both halves are always covered. At \(u=128\), both the profile and the test are on their final rays. Expanding in powers of \(u-128\) and checking every coefficient nonnegative proves the whole infinite tail. No tail is truncated and no sampled grid is accepted as a positivity proof.

## 6. Central rectangle and variance interpolation [P,C]

The 45 variance nodes are exactly
\[
 v_i=7/200+i/4000,\qquad 0\le i\le44.
\]
At each node the certificate proves (13), and bounds (14) at \(x=0,1/5\). The endpoint rule therefore covers every \(0\le x\le1/5\).

Fix any admissible normalized law \(U\) with \(\chi\le1/25\). Then \(\mathbb E U^2\le51/25\). For \(J(v)=\mathbb E h(vU)-pv\), dominated differentiation and (9) give \(J''(v)\ge-153/25\). On \([l,r]\), subtract from \(J\) its endpoint chord and \((153/50)(v-l)(r-v)\). The resulting function is convex and vanishes at the endpoints, so it is nonpositive. Thus
\[
 J(v)\le\max(J(l),J(r))+\frac{153}{200}(r-l)^2.
\]
For adjacent nodes this allowance is exactly
\[
 \frac{153}{3200000000}.                              \tag{17}
\]
The maximum of the exact node bounds plus (17) is
\[
 B_{\rm central}=
 \frac{519629358330379958834713591379}
 {378200000000000000000000000000}
 <1.373953883.                                       \tag{18}
\]
This covers the whole rectangle
\([7/200,23/500]\times[0,1/5]\) in \((v,x)\). Interpolation is applied to each fixed normalized law; no regularity of a family of optimizing distributions is assumed.

## 7. Complementary moment cover [P,C]

For a global Hermite majorant \(P(s)=\sum P_js^j\), \(P_3>0\), the moment bound gives
\[
 \Lambda(q)\le P_0+(P_1-p)v
       +P_2(2+x^2)v^2+P_3(6+9x^2+Cx^3)v^3.          \tag{19}
\]
The endpoint rule bounds \(x\) at either endpoint of its interval. At each endpoint, the right side is cubic in \(v\); its four exact Bernstein coefficients bound it on the whole variance interval.

**moment-boxes.json** contains 154 rational rectangles and interpolation nodes. Their majorants are recomputed from the integrals. The verifier checks that these rectangles and the central rectangle have disjoint interiors, lie in \([0,3/20]\times[0,31/4]\), and have total area \(93/80\), the area's exact value. This proves coverage: a point missed by this finite closed union would have a relatively open neighborhood of positive area in the large rectangle, contradicting the area equality. The exact inequality \((31/4)^2>60\) covers every permitted kurtosis.

The maximum of all outer Bernstein coefficients is
\[
 B_{\rm outer}=
 \frac{85135369756831882044807571219209}
 {61964288000000000000000000000000}
 <1.373953883.                                       \tag{20}
\]

For \(v\ge3/20\), Jensen gives \(\Lambda(q)\le h(v)-pv\). The interval verifier checks
\[
 h'(3/20)<p,\qquad h(3/20)-3p/20<1.373953883.
\]
Concavity controls the entire ray. At variance zero, \(q=0\) almost surely and
\(\Lambda(0)=h(0)=387\sqrt\pi/500<1.373953883\), also checked.
This proves the absolute bound in (1).

## 8. Integral certification and the comparison with S [P,C]

The included **profile.py** is the previously audited interval integrator, rerun without cached enclosures. Set \(R(t)=\sqrt t(a+bt)\), \(r=\sqrt s\), and
\(A(y)={}_2F_1(-1/2,-1/2;1;y)\).
Expansion of the two square-root factors and angular averaging give the angular mean
\(\max(R,r)A(\min(R,r)^2/\max(R,r)^2)\).
The integrands for \(h,h'\), before multiplication by \(e^{-t}\), are respectively
\[
 \begin{array}{c|cc}
 &R<r&R>r\\ \hline
 h&2rA(R^2/s)&2RA(s/R^2)\\
 h'&[A(y)-2yA'(y)]/r&2A'(y)/R .
 \end{array}                                        \tag{21}
\]
Here \(y\) is the argument in that column and
\(A'(y)={}_2F_1(1/2,1/2;2;y)/4\).
Both series have nonnegative coefficients. Angular integration at equal radii gives \(A(1)=4/\pi<2\), \(A'(1)=1/\pi<1\), yielding complex-disk bounds for the analytic callbacks. The square-root branch and strict separation \(R<r\) or \(R>r\) are checked; balls crossing the separation are rejected for subdivision.

The unique root \(t_0\) of \(t(a+bt)^2=s\) is enclosed by bisection. The integrator omits \([0,10^{-14}]\) and a certified small interval around \(t_0\), integrating the remaining pieces to 64. Omitted real integrands obey
\[
 0\le h\text{-integrand}\le2e^{-t}(R+r),\qquad
 0\le h'\text{-integrand}\le e^{-t}/r.
\]
The derivative bound follows because an angular mean of a norm is convex and even in the displacement radius, with radial derivative between zero and one. Beyond 64 the respective bounds are
\[
 2e^{-64}\{65a+(64^2+128+2)b+r\},\qquad e^{-64}/r.
\]
They follow from \(\sqrt t\le t\), \(t^{3/2}\le t^2\) there and integration of exponential moments. Every omission is enclosed outward. The complete callback, tail, and Gaussian-benchmark derivations are retained in §4 of **INHERITED-PROFILE.md**.

The included **benchmark.py** independently recomputes the Gaussian benchmark. In particular it proves
\[
 F(403448/10^7)>1.3739535256614,
\]
which alone suffices here. It also replays the inherited enclosure for \(S\). The final exact comparison is
\[
 1.3739535256614+\frac9{25000000}
       -\frac{1373953883}{10^9}
 =\frac{13307}{5000000000000}>0.                      \tag{22}
\]
This proves the stated gap.

## 9. Reproduction [C]

Install python-flint into a Python environment and run, without optimization flags:

    python verify.py

Only Python's standard library and python-flint are required. The acceptance path does not import NumPy, SciPy, CVXPY, or an optimizer. Polynomial positivity and coverage use fractions of integers; profile and benchmark integration use Arb/Acb interval arithmetic at 100-bit precision. The fresh output is **verification.log**.

The three JSON files are rational witnesses, not trusted objective values. Every profile value is recomputed. The inherited proof files identify the mathematical inputs and retain their original scope; older constants in those background files are not the new theorem. **manuscript-section.tex** uses the supplied manuscript macros.

The exact conjecture remains unresolved in this work. The new result is the dimension-free independent-sector bound (1) and the same upper enclosure for the joint-law relaxation.
