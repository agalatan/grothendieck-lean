# A small certified refinement of a complex Grothendieck bound

Research draft, 8 October 2026. This note records a derivation made during this conversation. It has computational checks and an internal independent review, but no external peer review or established priority claim.

**Result.** Refining the numerical certificate of Heilman, Jones, and Malavolta gives

\[
\boxed{K_G^{\mathbb C}<1.404898426735.}
\]

Their September 2026 preprint reports \(K_G^{\mathbb C}<1.404898554746\). The improvement in these displayed upper endpoints is \(0.000000128011\). All six rounding kernels come from their construction; this note sharpens two tail estimates and adjusts the six mixing weights. With their original weights, the two tail estimates already give \(K_G^{\mathbb C}<1.404898427462\). See [the preprint, version 1](https://arxiv.org/html/2609.25462v1) and [the source repository at the audited commit](https://github.com/sheilman77/grothendieck_cx/tree/7139f4cb8d0f30c2eb4c1267c46732a9d5229c3f).

The contribution is a small strengthening of that certificate. The major construction and most numerical inputs remain those of the authors. No improvement to the real constant is claimed. No claim is made that the elementary estimates used below are themselves new in analysis, or that this is a globally optimal choice of weights.

For checking dependencies against the source: kernel validity and definitions are in Sections 3–5; the original prefix is in (6.2); the sixth-tail energy argument is in Section 6.2; the fifth finite contribution and discarded-block reserve are in (6.19)–(6.20); the first-four tails are in Section 6.4; the original mass is in (6.28). Equations numbered (1)–(7) below belong to this note.

**How the numerical certificate controls the constant.** For a finite complex matrix \(A=(a_{ij})\), define

\[
C(A)=\sup_{|\varepsilon_i|=|\delta_j|=1}
\left|\sum_{ij}a_{ij}\varepsilon_i\overline{\delta_j}\right|,
\qquad
V(A)=\sup_{\|x_i\|=\|y_j\|=1}
\left|\sum_{ij}a_{ij}\langle x_i,y_j\rangle\right|.
\]

The vectors in \(V(A)\) may lie in any complex Hilbert space. Equivalently, dimension at most the number of vectors suffices, by taking their span. The constant \(K_G^{\mathbb C}\) is the least \(K\) such that \(V(A)\le K C(A)\) for every \(A\).

Call \(Q\) a valid rounding kernel if every finite set of such vectors admits jointly distributed unit complex random variables with

\[
\mathbb E[\varepsilon_i\overline{\delta_j}]
=Q(\langle x_i,y_j\rangle).
\]

Suppose

\[
q(z)=\sum_{n\ge0}q_n z|z|^{2n},\qquad
q_0> S:=\sum_{n\ge1}|q_n|,
\]

and \(q/M\) is a valid rounding kernel, for \(M>0\). Then

\[
\boxed{K_G^{\mathbb C}\le\frac{M}{q_0-S}.}\tag{1}
\]

Here is a direct proof. Validity gives
\(\left|\sum a_{ij}q(\langle x_i,y_j\rangle)\right|\le M C(A)\).
The monomial \(z|z|^{2n}\) is an inner product of unit tensor vectors:

\[
\langle x^{\otimes(n+1)}\otimes\overline{x}^{\otimes n},
y^{\otimes(n+1)}\otimes\overline{y}^{\otimes n}\rangle
=\langle x,y\rangle|\langle x,y\rangle|^{2n}.
\]

Consequently every nonlinear monomial contributes at most \(V(A)\) in absolute value. The triangle inequality, followed by the supremum over the original vectors, gives

\[
q_0V(A)\le M C(A)+S V(A).
\]

Rearrangement proves (1). Absolute summability justifies the series manipulation. This argument is for the unrestricted constant: tensor powers can raise dimension, so it does not give the corresponding assertion for a fixed-dimensional constant without additional work.

Formula (1) explains the objective. Retain a large linear coefficient, certify a small total nonlinear coefficient norm, and account for the exact normalization mass. A smaller rigorous bound on an omitted tail improves the final universal constant even when the kernel is unchanged.

**The first new estimate: retain cancellation in powers of the fifth polynomial.** Work in the Wiener algebra of absolutely summable power series, with

\[
\|f\|_A=\sum_{k\ge0}|[t^k]f(t)|,
\qquad \|fg\|_A\le\|f\|_A\|g\|_A.
\]

Use all power series here, including even ones. The analytic representative of the complex Gaussian phase correlation is

\[
h(t)=\sum_{j\ge0}h_jt^{2j+1},\qquad
h_j=\frac{\pi}{4(j+1)}\frac{\binom{2j}{j}^2}{16^j}.
\]

The fifth source polynomial is \(\rho(t)=tP(t^2)/10^{12}\), where the nonzero integer coefficients of \(P\) are

```text
degree : coefficient
 0 :   94626045381       1 : -856254413568
10 :    1274576105      13 :    8312996734
14 :    1885453067      15 :    1662844635
16 :    9295485863      17 :    9399425108
18 :    8540450681      19 :     847985940
20 :    3771690693      21 :     873880329
27 :    -419180236      29 :    -311954497
30 :    -455650279      31 :    -996284704
35 :    -865568525      37 :     206113648
```

Exact integer convolution proves

\[
\|\rho\|_A=1-7\cdot10^{-12},\qquad
\|\rho^{20}\|_A<\frac12,\qquad
\|\rho^{135}\|_A<\frac1{300}.\tag{2}
\]

For orientation, the last two norms are approximately \(0.49016269479075966\) and \(0.0033145383583956453\). These decimals are not the certificate: the script computes integer numerators and compares them with the exact powers of \(10^{12}\).

The useful point is that multiplication permits cancellation before absolute values are summed. Merely using \(\|\rho^m\|_A\le\|\rho\|_A^m\) would miss nearly all this decay, because \(\|\rho\|_A\) is so close to one.

Write every omitted outer index as \(j=67+10k+r\), where \(k\ge0\) and \(0\le r<10\). Submultiplicativity and (2) give

\[
\|\rho^{2j+1}\|_A
\le\|\rho^{135}\|_A\|\rho^{20}\|_A^k\|\rho\|_A^{2r}
<\frac1{300}2^{-k}.
\]

The Wallis estimate \(h_j\le1/[4j(j+1)]\), for \(j\ge1\), now yields

\[
\begin{aligned}
\sum_{j\ge67}h_j\|\rho^{2j+1}\|_A
&<\frac1{300}\frac1{4\cdot67\cdot68}
\sum_{r=0}^{9}\sum_{k\ge0}2^{-k}\\
&=\boxed{\frac1{273360}}.\tag{3}
\end{aligned}
\]

This replaces the source's omitted-block reserve \(1/(4\cdot67)=1/268\), a factor of 1020 larger. The retained outer terms \(0\le j\le66\) have maximum mode \(75j+37\le4987\), so the source's calculation through mode 5000 contains each retained polynomial in full. There is no unaccounted polynomial truncation.

The source's certified contribution of those retained terms to modes \(120\) and higher is less than \(2.699176355797438\cdot10^{-12}\), including its original fifth weight \(w_5^{\rm old}=0.0000169358532612748746\). Thus, for any positive fifth weight \(w_5\), the complete fifth tail is bounded by

\[
T_5<w_5\left(
\frac{2.699176355797438\cdot10^{-12}}{w_5^{\rm old}}
+\frac1{273360}\right).\tag{4}
\]

This remains valid even though the omitted outer blocks also contribute some low modes: bounding their entire coefficient norm safely overestimates the part belonging to the tail.

**The second new estimate: a sharper weighted Wallis tail.** Define

\[
W_N=\sum_{n=N}^{\infty}\frac{h_n}{(2n+1)^2}.
\]

For every integer \(N\ge1\),

\[
\boxed{W_N<\frac1{48(N+1/16)^3}.}\tag{5}
\]

To prove this, put \(p_n=\binom{2n}{n}/4^n\) and \(b_n=\pi(n+1/4)p_n^2\). The central-binomial asymptotic gives \(b_n\to1\), whereas

\[
\frac{b_{n+1}}{b_n}
=\frac{(4n+5)(2n+1)^2}{(4n+1)(2n+2)^2}>1,
\]

because the numerator minus the denominator equals one. Therefore \(b_n<1\), and

\[
h_n<\frac1{4(n+1/4)(n+1)}.
\]

For \(r=1/16\), a rational comparison gives

\[
\frac1{4(n+1/4)(n+1)(2n+1)^2}
<\frac1{48}\left[\frac1{(n+r)^3}-\frac1{(n+1+r)^3}\right].\tag{6}
\]

For completeness, after multiplying by positive denominators, the difference on the required side is

\[
\begin{aligned}
&4(n+1/4)(n+1)(2n+1)^2[3(n+r)^2+3(n+r)+1]
-48(n+r)^3(n+1+r)^3\\
&=\frac{263}{8}n^4+\frac{1197}{16}n^3
+\frac{222067}{4096}n^2+\frac{440847}{32768}n
+\frac{1242733}{1048576}>0.
\end{aligned}
\]

Summing (6) telescopes and proves (5). The script verifies this identity with rational polynomial arithmetic; the central-binomial asymptotic is the analytic ingredient supplied by the proof, not by the script.

The sixth source kernel has endpoint-subtracted radial energies bounded by \(a=1.174\) and \(b=1.176\). Its unweighted coefficient tail satisfies

\[
T_6^{\rm unweighted}
\le\sqrt{aW_{120}}+\sqrt{bW_{120}}+\frac{\sqrt{ab}}{241^2}.
\]

Substituting (5) gives the strict rational upper bound

\[
\boxed{T_6^{\rm unweighted}<\frac{258088051054978}{10^{18}}.}\tag{7}
\]

To check every rounding direction, upper bounds on the three radicals have common denominator \(10^{18}\) and numerators

\[
118878237195126,\quad118979453251942,\quad20230360607910.
\]

Squaring each rational proves the claimed direction, with no floating-point square roots in the new certificate. The former unweighted reserve was \(0.0002615\).

**Combination with the original weights.** With the source's unchanged linear coefficient, nonlinear prefix, first-four tails, and mass, (4) and (7) give the entirely rational bound

\[
K_G^{\mathbb C}
<1.4048984274616495803357431366854786593\ldots
<1.404898427462.
\]

Thus the improvement does not depend on successful optimization. It already follows from the two inequalities proved above together with the checked source inputs.

**A further adjustment of the six weights.** Keep all six kernels fixed and take the following exact terminating decimals:

\[
\begin{aligned}
w_1&=0.983543458398378100,&w_2&=0.012416654023174663,\\
w_3&=0.003031585753026536,&w_4&=0.000593628184609741,\\
w_5&=0.000016934659448514,&w_6&=0.000397738981362458.
\end{aligned}
\]

Their sum is \(M=1.000000000000000012\); use probabilities \(w_i/M\). Positivity makes validity follow from convexity of the source kernels. The third source-code row and its old weight are both negated relative to the paper. The verifier reverses that row when using the positive weights above; oddness of \(h\) makes this an exact equivalence.

The weights were located by a numerical search of a piecewise-linear objective. The search is not used as evidence for the inequality: exact rational weights are then tested with directed interval arithmetic. No assertion of global optimization is needed.

Let \(q=\sum_iw_iK_i\), using the physical radial coefficient representatives of the six kernels. Directed interval arithmetic, deliberately rounded outwards here, gives

\[
q_0>0.7117964083067696,\qquad
\sum_{n=1}^{119}|q_n|<1.0747148914\cdot10^{-6}.
\]

For the first four tails use the unchanged source Cauchy estimates

\[
T_{1:4}\le\sum_{i=1}^{4}
w_i\frac{10R_i^{-241}}{1-R_i^{-2}},\qquad
(R_1,R_2,R_3,R_4)=(1.2,1.11,1.11,1.11).
\]

Together with (4) and (7), these give

\[
\sum_{n\ge120}|q_n|
<1.027264992\cdot10^{-7}.
\]

All inequalities use an upper bound for the **entire** omitted tail, not just sampled coefficients. Substitution into (1), with the exact mass \(M\), proves

\[
\frac{M}{q_0-\sum_{n\ge1}|q_n|}<1.404898426735.
\]

Using the tighter interval endpoints internally yields approximately \(1.4048984267346525646201650881\). This decimal describes an upper endpoint of the certificate, not the unknown value of the constant. The reweighting accounts for only about \(7.27\cdot10^{-10}\) of the improvement; the two tail estimates account for almost all of it.

**What was verified.** The upstream nonvanishing, energy, Cauchy, finite-tail, coefficient, normalization, and final-arithmetic verification suite passed locally. Both upstream interval coefficient tables were regenerated from the authors' Arb quadrature programs; the resulting files were byte-for-byte identical to the pinned tables. The revised bound passed with those regenerated inputs as well. Exact integer/rational checks verify (2), the algebra in (5)–(7), and both final upper bounds. A second internal review checked the reweighting, sign convention, tail indexing, normalization, and direct transfer proof.

The verification uses Python and Arb; it is not a formal proof checked by a proof assistant. Regeneration uses the authors' integration implementation, not an independently written quadrature implementation. See `verification-results.txt` for provenance and the separate status of an unrelated lower-bound exploration. The original kernel validity and energy reductions remain mathematical dependencies of the result. The code alone is not a self-contained substitute for those arguments.

**Files.** `verify_exact.py` checks the new finite arithmetic using only the Python standard library. `verify_intervals.py` checks the reweighted prefix and tail assembly against the pinned upstream source, with an option to rerun source prerequisites. `README.md` explains how to reproduce both layers. The separation is deliberate: one should not mistake a finite exact-arithmetic check for a verification of numerical assumptions it merely consumes.
