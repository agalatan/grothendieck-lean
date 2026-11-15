<!-- Intended filepath: grothendieck-literature-1402/paper07000/PHASE_STATIONARITY_AND_CROSS_AUDIT.md -->
# Independent response-penalty audit

All statements below concern actual response pairs, rather than arbitrary chaos fields. The phase-stationarity idea was proposed by the parent agent; the derivation and numerical coefficient below independently check it. The cross-Gram construction is due to the parallel primal–dual agent; its algebra was independently replayed here.

## Phase-stationarity penalty: proved

Use the inner product \(\langle a,b\rangle=\mathbb E\overline a b\), and write

\[
T=P-eQ,\quad P=P_{1,0},\ Q=P_{2,1},\quad
h=(f+g)/2,\ k=(f-g)/2,\quad Ph=tZ,
\]

\[
G=eQk,\quad H=Z(|Z|^2-2)/\sqrt2,\quad
\nu=\langle H,G\rangle,\quad
r=Qh+\frac{\sqrt2\beta}{e}H,
\quad\Sigma=\|Pk\|_2^2+e\|r\|_2^2.
\]

Assume \(\langle f,Tg\rangle\) is real. This is legitimate in the norm supremum: multiply g by a constant unit phase to make the pairing nonnegative real, and then recompute h,k and rotate the first-chaos direction. No attainment or differentiability assumption is required. Merely writing the objective as a real part would not imply this hypothesis for an arbitrary fixed pair.

Self-adjointness gives

\[
\operatorname{Im}\langle f,Tg\rangle
=-2\operatorname{Im}\langle h,Tk\rangle=0.
\]

Put \(\alpha=\langle Z,Pk\rangle\). Then

\[
\langle h,Tk\rangle
=t\alpha-\langle r,G\rangle+\frac{\sqrt2\beta}{e}\nu.
\]

Since \(\operatorname{Im}\langle G,r\rangle=-\operatorname{Im}\langle r,G\rangle\),

\[
\operatorname{Im}\left(t\alpha+\langle G,r\rangle\right)
=-\frac{\sqrt2\beta}{e}\operatorname{Im}\nu.
\]

Apply Cauchy–Schwarz in the direct sum to the vectors
\((Pk,\sqrt e\,r)\) and \((tZ,G/\sqrt e)\). This proves

\[
\boxed{\displaystyle
\Sigma\ge
\frac{2\beta^2}{e^2}\,
\frac{(\operatorname{Im}\nu)^2}{t^2+\|G\|_2^2/e}.}
\tag{PS}
\]

The denominator-zero case has G=0 and \(\nu=0\); the asserted penalty can then be defined as zero.

**Certified numerical region.** At \(e=1891/2500\), \(\beta=179/1250\), for

\[
0\le t\le863/1000,\qquad\|G\|_2^2\le80051/10^6,
\]

the coefficient in (PS) is at least

\[
\frac{256328000000}{3041646418989}
>\frac{337}{4000}=0.08425.
\]

Both the fraction and its comparison are exact. Thus every such phase-normalized actual response satisfies

\[
\Sigma\ge\frac{337}{4000}(\operatorname{Im}\nu)^2.
\]

In the explicit subregion \(|\operatorname{Im}\nu|\ge1/25\), this gives \(\Sigma\ge337/2500000=0.0001348\). This is a response penalty, not an upper bound for the unconstrained functional \(\Lambda\), and does not alone prove the desired Grothendieck endpoint.

## Avoiding first-chaos double counting

The penalty (PS) spends the full \(\|Pk\|^2\) and cannot simply be subtracted from the already-retained functional \(\widehat\Lambda\). For an explicit allocation, choose \(0<\theta\le1\). The same proof gives

\[
\theta\|Pk\|^2+e\|r\|^2
\ge\frac{2\beta^2}{e^2}
\frac{(\operatorname{Im}\nu)^2}{t^2/\theta+\|G\|^2/e}.
\tag{PS-\theta}
\]

The remaining \((1-\theta)\|Pk\|^2\) can be retained via the dual

\[
\widehat\Lambda_{1-\theta}(G)
=\inf_{\xi\in H_{1,0}}
\left\{\frac{\|\xi\|^2}{1-\theta}
+\mathbb E|L+G-\xi|+\mathbb E|L-G+\xi|\right\}
-\frac{\|G\|^2}{e},
\]

for \(\theta<1\). This coefficient follows from completing the square in \(-(1-\theta)\|Pk\|^2\). At \(\theta=1\), use the raw \(\Lambda\) row instead. A certified consumer must evaluate the corresponding changed functional rather than reusing \(\widehat\Lambda_1\) unchanged.

## Additive phase correction to the weighted-Gram penalty

**Independently proved.** The primal–dual agent's stronger formula is valid. Let \(u,E_A,E_B,E_Q,E_P,|\nu|^2\) denote the six orthogonal sector energies of G, and let

\[
a_\lambda=\frac{2(\lambda+2)}{3\lambda+4},\qquad
n_\lambda=\frac{8(\lambda+1)}{7\lambda+6},
\]

\[
J_\lambda=\frac\lambda{e^2}
\left(\frac u2+a_\lambda E_A+\frac43E_B+E_Q+E_P+n_\lambda|\nu|^2\right)
-\lambda\left(\frac\pi4-t^2\right)
+\frac{e\lambda}{2(3e+4\lambda)}\left(t-\frac{4\beta}e\right)^2.
\]

For \(\lambda\ge0\), define

\[
\kappa_\lambda=\sqrt2\left[
\frac{\beta+\lambda t/3}{e+4\lambda/3}
-\frac{\lambda t}{3e(1+7\lambda/6)}\right],
\]

\[
D_\lambda=\frac{t^2}{1+7\lambda/6}
+\frac u{e+\lambda/2}
+\frac{E_A+E_Q+E_P}{e+\lambda}
+\frac{E_B+|\nu|^2}{e+4\lambda/3}.
\]

Then, for the phase-normalized actual responses above,

\[
\boxed{\displaystyle \Sigma\ge J_\lambda+
\frac{\kappa_\lambda^2(\operatorname{Im}\nu)^2}{D_\lambda}.}
\tag{APS}
\]

Here is the independent derivation. The ordinary weighted-Gram argument minimizes \(\Sigma+\lambda(\text{Gram quadratic}-\pi/4)\) over the hidden first- and cubic-chaos coefficients; its unconstrained minimum is \(J_\lambda\). The only nonzero hidden cubic mean at that minimum is

\[
c_0=\langle H,Qh\rangle
=-\frac{\sqrt2(\beta+\lambda t/3)}{e+4\lambda/3},
\]

and the visible first coefficient of k is

\[
\alpha_0=-\frac{\lambda\sqrt2\,\nu}{3e(1+7\lambda/6)}.
\]

The affine phase constraint is \(\operatorname{Im}(t\alpha-\langle Qh,G\rangle)=0\). Its residual at the unconstrained minimum is \(\kappa_\lambda\operatorname{Im}\nu\). In the completed-square metric, the visible k variable has weight \(1+7\lambda/6\), and the h cubic sectors have weights \(e+\lambda/2,e+\lambda,e+4\lambda/3,e+\lambda,e+\lambda,e+4\lambda/3\). The inverse squared norm of this affine functional is exactly \(D_\lambda\). The remote first-chaos coefficients of k do not occur in the phase constraint because \(Ph=tZ\). Minimizing a positive quadratic form subject to one real affine constraint adds its squared residual divided by this inverse norm, proving (APS). At \(\lambda=0\) it is precisely (PS).

**Certified additive region.** For \(0.84\le t\le0.863\), \(\|G\|^2\le0.080051\), the \(\lambda=1\) coefficient is at least

\[
\frac{39833305514955537750000}{8635708981270059066648179}
>\frac{23}{5000}=0.0046.
\]

For this comparison \(\kappa_1\) is positive and decreases with t, while
\(D_1\le(863/1000)^2/(13/6)+(80051/10^6)/(e+1/2)\). Every step is exact rational arithmetic; `audit_cross_gram.py` replays it. One may therefore use

\[
\Sigma\ge\max\left\{0,\ J_1+\frac{23}{5000}(\operatorname{Im}\nu)^2,
\ \frac{337}{4000}(\operatorname{Im}\nu)^2\right\}.
\]

This is an additive correction to \(J_1\), not merely the difference between two possibly negative penalties. It retains the full-\(\Sigma\) scope and does not authorize subtracting it again from the unmodified retained functional.

## Cross-Gram formula: independently verified

The proposed construction applies Bessel separately to f and g in the same weighted feature space, and takes their convex combination. This is legitimate for \(|\eta|\le1\): the weights are \((1+\eta)/2\) and \((1-\eta)/2\). All complex coefficients must be retained before minimization. Its inverse-Gram blocks are

\[
M_0=\begin{pmatrix}7/6&\sqrt2/3\\\sqrt2/3&4/3\end{pmatrix},\qquad
M_A=\begin{pmatrix}3/4&1/2\\1/2&1\end{pmatrix};
\]

the remaining factors are \(1/2,4/3,1,1\) for q,B,Q,P. Minimizing the full \(\Sigma\) plus the \(\eta=-1/20\) Gram constraint reproduces exactly the primal–dual agent's rational formula for \(J_{\rm cross}-J_1\). `audit_cross_gram.py` checks the formula and every positive-definite minimization Hessian by exact rational symbolic arithmetic.

However, \(J_{\rm cross}-J_1>0\) is not a positive improvement in \(\max(0,J)\) when both are negative. The following point satisfies the stated numerical caps:

\[
t=1057/1250,\quad u=1/25,\quad
z=\nu/(\sqrt2e)=7/125,\quad
E_A=E_B=E_Q=E_P=0.
\]

Here \(|\nu|^2=175218169/48828125000\). Arb at 80 digits certifies

\[
-0.027212332<J_1<-0.027212331,
\qquad
-0.026749361<J_{\rm cross}<-0.026749360,
\]

although \(J_{\rm cross}-J_1>0.00046297\). Both useful positive-part penalties therefore vanish. This is an energy-feasible tuple; realizability by responses is not asserted. It shows why the gain alone is insufficient for a uniform consumer on the advertised energy box.

**Updated cross parameter and a genuinely positive subset.** The agent's improved choice \(\eta=-1/35\) also passed the independent exact audit. For \(0.84\le t\le0.863\), total sector energy at most \(0.080051\), and \(\operatorname{Re}\nu\ge0.06\),

\[
J_{\rm cross}-J_1\ge
\frac{537363070714908327898093}{1370804246385332741850000000}
>0.00039.
\]

The proof bounds the quadratic energy losses by the B-sector coefficient, verified to be the largest of all six coefficients, and minimizes the remaining concave quadratic in t at the two explicit endpoints. The implication \(\operatorname{Re}\nu\ge0.06\Rightarrow\operatorname{Re}(\nu/(\sqrt2e))>7/125\) is checked by squaring positive rational quantities. Negative real parts use the opposite sign of eta.

On the explicit smaller region \(0.851\le t\le0.853\), \(u\ge0.03\), \(E_A\ge0.02\), \(|\operatorname{Re}\nu|\ge0.06\), one has

\[
J_1\ge\frac{784508743371}{325405171000000}>0.0024.
\]

This follows from \(\pi<22/7\) and dropping the last nonnegative square in \(J_1\). Thus the cross gain really improves the positive-part penalty on this subset. No uniform upper bound for \(\Lambda\) on this subset has been supplied, so this remains a certified response cut rather than a completed Grothendieck row.

## Local radial mean versus global first-chaos norm

The local angular lemma in `READING_AND_TRANSFER.md` uses
\(\tau(r)=\mathbb E_{\theta,Y}[e^{-i\theta}h]\), not the global t. There is nevertheless an exact measure connection. Write \(R=\sqrt\pi/2\) and \(d\mu(r)=r\,d\nu(r)/R\). First-chaos alignment gives

\[
\mathbb E_\mu\operatorname{Re}\tau=t/R.
\]

Since \(|\tau|\le1\), Markov's inequality yields

\[
\mu\{r:|\tau(r)|<3/4\}\le4(1-t/R).
\]

For the explicit global region \(t\ge21/25=0.84\), the complementary good set has \(\mu\)-measure greater than \(79/100\). This numerical statement follows exactly from \(\pi<22/7\): \(R<\sqrt{11/14}<336/379\), the latter inequality being \(1580051<1580544\) after clearing denominators.

One cannot infer that 79% of the remote cubic energy lies in this good set. That energy may concentrate in its complement; the q coefficient also uses a 1/r-weighted functional relative to \(\mu\). A global quantitative transfer must keep these radial weights and couple the remaining variance budget. Replacing global t by local \(|\tau|\) everywhere would be an invalid shortcut.

## Explicit shell-free response consumer

**Proved deduction from the supplied remote and shell-free odd lemmas.** This is an actual-response region for the 1.402 consumer, not an extension of the original (★) central inequality. Assume:

\[
A=B=0\quad\text{in the raw six-sector decomposition},\qquad
u=\mathbb E|q|^2\le0.0463,
\]

\[
\|G\|^2=u+W\le0.080051,\qquad
0.8282\le t\le0.863,\qquad
|\operatorname{Im}\nu|\ge0.037,
\]

and the response is phase-normalized as above. The remote variables may share coordinates arbitrarily; Q is centered and \(\nu\) is constant, as in the problem.

The supplied remote result and shell-free odd theorem give

\[
\Lambda(q)<S+3.6\cdot10^{-7},\qquad
\Lambda(q+O)\le\Lambda(q)-\left(p-\frac{32}{25}\right)W.
\]

The second implication follows by applying the pointwise shell-free estimate conditionally on the remote coefficients and averaging: both Q–\(\nu\) coupling terms vanish because \(\mathbb E Q=0\). This uses the raw paired functional and does not spend the first-chaos square.

Now \(W\ge(\operatorname{Im}\nu)^2\), and the phase penalty gives

\[
\Lambda(G)-\Sigma
<S+\frac{36}{10^8}
-\left(p-\frac{32}{25}+\frac{337}{4000}\right)(\operatorname{Im}\nu)^2
\le S+\frac{36}{10^8}-\frac{955347}{7564000}\left(\frac{37}{1000}\right)^2.
\]

Insert this into the exact raw row

\[
\operatorname{Re}\langle f,T_eg\rangle
\le t^2-2\ell t+\frac{2\beta^2}e+\Lambda(G)-\Sigma,
\quad \ell=\frac{1057}{1250},\ \beta=\frac{179}{1250}.
\]

Using the supplied certified \(S<1.3739535256616\), the quadratic in t has equal values at the two stated endpoints and is convex. Exact rational arithmetic gives, throughout the region,

\[
\boxed{\displaystyle
\operatorname{Re}\langle f,T_eg\rangle
<\frac{500}{701}
-\frac{5830268974361}{3313977500000000000}.}
\]

The reserve is greater than \(1.759\cdot10^{-6}\). `verify_response_constants.mjs` replays the endpoint calculation using only exact BigInt fractions. The two supplied analytical lemmas are inherited inputs, not newly re-certified by this scalar replay. Shells with \(A\ne0\) or \(B\ne0\), small imaginary \(\nu\), and the remaining response intervals are not covered by this statement; consequently it does not prove the unrestricted \(K_G^{\mathbb C}>1.402\).
