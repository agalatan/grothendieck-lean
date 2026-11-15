<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/content_tensor_next.md (file dated 2026-11-15 05:11). Only this line was added. -->
# A third-order tensor bound for the nonlinear tilted content

Agent-ID: **codex-6e2b**. 15 November 2026.

**Status.** Sections 1–4 are **P**, with complete derivations below. The
uniform scalar bound in section 5 is **C**, independently audited and
replayed using `content_next_m3.py`; the resulting nonlinear content bound
and classes in sections 5–6 are **P+C**. No general comparison with the
deficit is inferred from the fourth cumulant alone. The leading polynomial bound
is already recorded in STATUS 6.3.12 with status R; this note independently
supplies its proof and extends it to the full nonlinear response.

## 1. A real third-chaos theorem

Let the underlying real Gaussian coordinates have variance one. Write
`I_k` for the usual multiple Wiener integral, normalized by

\[
\mathbb E I_k(f)^2=k!\|f\|^2.
\]

Let \(F=I_3(f)\) for a real symmetric tensor \(f\), and set
\(\sigma^2=\mathbb EF^2\), \(\kappa=\mathbb EF^4-3\sigma^4\).
Let \(m\) be an odd \(C^3\) function with bounded third derivative. This
implies at most cubic growth of \(m\) and at most quadratic growth of
\(m'\), which justify the integrations below. Put
\(M_3=\sup_{x\in\mathbb R}|m'''(x)|\). Then, for every unit first-chaos
variable \(H=I_1(h)\),

\[
\boxed{|\mathbb E[H m(F)]|^2\le\frac{M_3^2}{16}\kappa^{3/2}.}\tag{1}
\]

This holds in every finite dimension. At \(\sigma=0\), both sides vanish.

Define the positive semidefinite contraction matrix and its Hilbert–Schmidt
norm by

\[
B_{ij}=\sum_{k,l}f_{ikl}f_{jkl},\qquad r=\|B\|_{\mathrm{HS}}.
\]

For unit \(h\), put \(g=f_h\), so
\(\|g\|^2=h^TBh\le\|B\|_{\mathrm{op}}\le r\), and put \(Y=I_2(g)\).
Gaussian integration by parts gives

\[
\mathbb E[H m(F)]=\mathbb E[m'(F)\partial_hF]
 =3\mathbb E[Y m'(F)].                                  \tag{2}
\]

The product formula gives the chaos decomposition

\[
F^2=\sigma^2+J_2+J_4+J_6,\qquad
J_2=18I_2(B),\quad J_4=9I_4(\operatorname{Sym}(f\otimes_1f)).
\]

If \(\Gamma=|\nabla F|^2\), the number-operator product rule yields

\[
\Gamma=3\sigma^2+2J_2+J_4.
\]

Furthermore, integration by parts against \(F^3\), using \(LF=-3F\),
gives \(\mathbb EF^4=\mathbb E[F^2\Gamma]\). Consequently

\[
\kappa=2\|J_2\|_2^2+\|J_4\|_2^2
 =1296r^2+1944\|\operatorname{Sym}(f\otimes_1f)\|^2,
\]

and hence

\[
\kappa\ge1296r^2,\qquad
\mathbb E(\Gamma-3\sigma^2)^2
 =4\|J_2\|_2^2+\|J_4\|_2^2\le2\kappa.                \tag{3}
\]

These are exact identities or direct inequalities, not numerical inputs.

## 2. The even second-chaos resolvent

Let \(T=\sigma^2\partial_x^2-x\partial_x\) be the one-dimensional
Ornstein–Uhlenbeck generator with invariant law \(N(0,\sigma^2)\), and
write \(P_t\) for its semigroup. Define

\[
\psi(x)=\int_0^\infty e^{2t}P_{3t}
 \bigl[m'-\mathbb E_{G\sim N(0,\sigma^2)}m'(G)\bigr](x)\,dt.
\]

Because \(m'\) is even and centered, its first nonconstant Gaussian chaos
has order at least two. Equivalently, the Mehler formula and a second-order
Taylor estimate give decay of order \(e^{-6t}(1+x^2)\). Thus the integral
converges, solves

\[
(3T+2)\psi=-(m'-\mathbb Em'(G)),
\]

and differentiation of the Mehler formula gives

\[
\psi''=\int_0^\infty e^{-4t}P_{3t}m'''\,dt,
\qquad \|\psi''\|_\infty\le\frac{M_3}{4}.             \tag{4}
\]

The chain rule in the original Gaussian coordinates says

\[
L\psi(F)=3(T\psi)(F)+(\Gamma-3\sigma^2)\psi''(F).
\]

Multiply by \(Y\), use \(LY=-2Y\), and integrate by parts. The resolvent
equation and \(\mathbb EY=0\) imply the exact identity

\[
\mathbb E[Y m'(F)]
 =\mathbb E[Y(\Gamma-3\sigma^2)\psi''(F)].             \tag{5}
\]

Combining (2)–(5) and Cauchy–Schwarz yields

\[
\begin{aligned}
|\mathbb E[H m(F)]|
&\le\frac{3M_3}{4}\sqrt{\mathbb EY^2}
              \sqrt{\mathbb E(\Gamma-3\sigma^2)^2}\\
&\le\frac{3M_3}{4}\sqrt{2r}\sqrt{2\kappa}
 \le\frac{M_3}{4}\kappa^{3/4}.
\end{aligned}
\]

This proves (1). The last step uses \(\sqrt r\le\kappa^{1/4}/6\).
The even resolvent is what removes the otherwise unnecessary factor
\((1+\sqrt2)^2\) from a direct iterated integration-by-parts bound.

## 3. The leading polynomial tensor bound

Taking \(m(x)=x^3\), or applying the same identities directly to that
polynomial, gives

\[
\|\Pi_1F^3\|_2^2\le\frac94\kappa^{3/2}.             \tag{6}
\]

For a circular complex cubic \(q\), put
\(\delta=\mathbb E|q|^4-2u^2\), \(u=\mathbb E|q|^2\), and
\(F=\Re q\). Circularity gives
\(\operatorname{Var}F=u/2\) and \(\kappa=3\delta/8\).
Let \(T_q=\Pi_{1,0}(q|q|^2)\). Charge decomposition gives

\[
\Pi_1F^3=\frac34\Re T_q,\qquad
\|\Pi_1F^3\|_2^2=\frac9{32}\|T_q\|_2^2.
\]

Inserting this into (6) proves, in every dimension,

\[
\boxed{\|\Pi_{1,0}(q|q|^2)\|^2
 \le\frac{3\sqrt6}{4}\delta^{3/2}.}                  \tag{7}
\]

Thus the constant recorded in STATUS 6.3.12 follows without importing
its earlier R-status derivation.

## 4. The actual tilted profile

For the peak row, let \(A=T-2/5\), \(L=Z(a+bT)\), and define the odd
one-dimensional response

\[
m_s(x)=\mathbb E_Z[A\operatorname{sign}(\Re L+x)],
\qquad a=699/1250,\quad b=179/1250.
\]

The elementary phase identity

\[
\operatorname{ph}(z)=\frac14\int_0^{2\pi}
 e^{i\theta}\operatorname{sign}(\Re(e^{-i\theta}z))\,d\theta
\]

implies

\[
\Phi(q):=\mathbb E_Z[A\operatorname{ph}(L+q)]
 =\frac14\int_0^{2\pi}e^{i\theta}
 m_s(\Re(e^{-i\theta}q))\,d\theta.
\]

For every complex unit linear form \(X\), simultaneous circularity of
\((q,X)\) makes the expectation of each angular integrand identical. Hence

\[
\mathbb E[\overline X\Phi(q)]
 =\frac\pi2\mathbb E[\overline X m_s(\Re q)].          \tag{8}
\]

Choose the phase of \(X\) so that this coefficient is real and nonnegative,
and set \(H=\sqrt2\Re X\), a unit real first-chaos variable. Formula (8)
becomes

\[
|\mathbb E[\overline X\Phi(q)]|
 =\frac\pi{2\sqrt2}\mathbb E[H m_s(\Re q)].
\]

Taking the supremum over unit \(X\), applying (1), and using
\(\Pi_{1,0}q=0\), which removes the linear subtraction in the definition
of \(h_s\), gives

\[
\boxed{\|c_{3/5}(q)\|^2\le K_3\delta^{3/2},\qquad
K_3=\frac{\pi^2}{128}\left(\frac38\right)^{3/2}
       \sup_x|m_s'''(x)|^2.}                          \tag{9}
\]

The numerical prefactor before the derivative square is approximately
0.01770666119 (**N**, explanatory only). In particular the certified bound \(\sup|m_s'''|<13\) implies
\(K_3<3\). Indeed \(\pi<22/7\), \(\sqrt6<49/20\), and
\[K_3<\frac{507\pi^2\sqrt6}{4096}<\frac{61347}{20480}<3.\]

## 5. A complete one-dimensional certificate

**C.** The certified scalar bound for the clean constant 3 is

\[
\sup_{x\ge0}|m_s'''(x)|\le13.                          \tag{10}
\]

It is a one-dimensional source integral with one nonnegative parameter.
Write \(z=x^2+y^2=t(a+bt)^2\),
\(D(t)=(a+bt)(a+3bt)\), and

\[
f(t)=\frac{(t-2/5)e^{-t}}{\pi D(t)}.
\]

This is the signed density of the weighted visible distribution. Its
projection gives

\[
m_s'''(x)=4\int_0^\infty
 \left[2\frac{f_t(t)}{D(t)}
 +4x^2\frac{f_{tt}(t)D(t)-f_t(t)D'(t)}{D(t)^3}\right]dy.\tag{11}
\]

The checker `content_next_m3.py` verifies (11) on 120 exact rational
parameter boxes covering \([0,3]\). Each source cell uses two-point Gaussian
quadrature with an interval fourth-derivative error bound obtained from
implicit-function Taylor coefficients. The source integral is truncated at
\(\ell(20)\), and its omitted absolute tail is below
\(7.353\cdot10^{-9}\). The largest certified absolute compact bound is
12.945400040542, below 13.

For completeness, the source and large-parameter tail argument is as
follows. Put \(P=a+bt\), \(Q=a+3bt\),
\(R=b/P+3b/Q\), \(S=b^2/P^2+9b^2/Q^2\), and
\[J=1-(t-d)(1+R),\quad
K=(t-d)(1+3R+2R^2+S)-2-3R.\]
Then (11)'s integrand is
\(8e^{-t}[J+2x^2K/D]/(\pi D^2)\). For \(t\ge T\), use
\(x^2/D\le t\), \(R(t)\le R(T)\), and \(S(t)\le S(T)\) to majorize its
absolute value by \(8e^{-t}P_T(t)/(\pi D(T)^2)\), where \(P_T\) is an
explicit degree-two polynomial with positive coefficients. This envelope
is decreasing for \(t\ge T\ge2\), since every \(t^j e^{-t}\), \(j\le2\),
is decreasing there. Integration after the change of variables
\(y=\ell(t)\) uses
\(\ell'(t)\le(a+3bt)/(2\sqrt T)\), so its tails are exact exponential
moments. The checker uses \(T=20\) for source truncation. For every
\(x\ge\ell(4)\), split \(y\) at \(\ell(4)\), use the \(T=4\) envelope
constant on the first segment and integrate it on the rest; the resulting
absolute bound is below 2.519. Since \(\ell(4)<3\), this overlaps the compact
cover. Evenness covers negative \(x\).

The independent audit checked the formulas, both tail arguments,
quadrature errors, and exhaustive rational-box coverage, then replayed
the entire certificate successfully in approximately 0.15 seconds. The
complete output is recorded in `content_next_m3_results.txt`.

**P+C.** Therefore
\(\|c_{3/5}(q)\|^2\le3\delta^{3/2}\), so the desired content budget
\(\|c\|^2\le(1/5)D_++3\cdot10^{-6}\) holds on the all-dimensional class

\[
\boxed{\delta\le\frac1{10000}.}                       \tag{12}
\]

At the upper energy endpoint this means
\((\mathbb E|q|^4/u^2)-2\le10000/214369\), about 0.04665.
With the already certified global radius, curvature, and tail estimates,
this yields the full sector inequality on that specified class. It does
not close the general content/deficit comparison.


## 6. A larger all-tensor energy interval

**P+C.** The tilted-sector statement (*) holds for every dimension, every
remote cubic with

\[
0\le u\le\frac{173}{100000}=0.00173,
\]

and every remote linear \(r\), with

\[
s=\frac35,\qquad\kappa=0,\qquad\eta=\frac1{50000}.
\]

Here is exact rational budget arithmetic. The fourth-moment bound gives
\(\delta\le42u^2\), and hence (9)–(10) give
\(\|c\|^2\le3(42u^2)^{3/2}\). The already certified global derivative
majorant localizes every global maximizer at

\[
\|r_*\|^2\le\frac{u/40}{P-4/5}.
\]

At \(u_0=173/100000\), its right side is
\(v_0=327143/1225760000\). The curvature bound \(\Theta(3/10)\le3/4\)
and completing the square give the gain bound

\[
\mathcal J(q,r_*)\le\frac{250}{53}\,3(42u^2)^{3/2}
 +3\left(\frac3{10}+\frac{v_0}{3/5}\right)
       e^{-(9/100)/v_0},
\]

because \(P-3/4>53/250\) and the historical Gaussian tail estimate in REPORT_localization_history.md
applies. Since \(\sqrt{42}<1621/250\), the first term at \(u_0\) is at most

\[
\frac{528763993191}{26500000000000000}.
\]

The tail prefactor is
\(220963943/245152000<1\), while \((9/100)/v_0>30\). The elementary
inequality \(e>2\) therefore bounds the tail by \(2^{-30}\). Finally,

\[
\frac1{50000}
-\frac{528763993191}{26500000000000000}-\frac1{2^{30}}
=\frac{79385510593999}{1736704000000000000000}>0.
\]

All terms are monotone in the relevant energy/radius bounds, so the same
budget holds below \(u_0\). The zero-energy case follows from the radial
derivative inequality directly. Global maximality then covers every
linear \(r\), not merely the maximizing one.
