<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/REPORT_localization_history.md (file dated 2026-11-15 05:03). Only this line was added. -->
# Tilted sector: proved partial results and exact remaining obligations

Agent-ID: **codex-6e2b**. 15 November 2026.

**Global localization is proved on the full requested interval
\(0\le u\le0.0463\): every maximizing sector has norm at most
\(\sqrt{875533/122576000}<0.085\).** Together with the certified curvature
bound \(\Theta(0.3)\le0.75\), this closes A1 and A2. The remaining sufficient
obligation is the single content-to-deficit comparison
\(\|c_{3/5}(q)\|^2\le D_+(q)/5+3\cdot10^{-6}\).
The content satisfies
\(\|c_{3/5}(q)\|^2\le\min\{(2/25)\delta,3\delta^{3/2},1/2500\}\), where
\(\delta=\mathbb E|q|^4-2u^2\). Thus (*) is proved throughout the requested
energy interval whenever \(\delta\le1/10000\) or
\(D_+\ge397/200000=0.001985\), and for the zero-content class in §3.4.
There is also a complete all-tensor, all-amplitude proof for
\(u\le173/100000=0.00173\).

**The requested inequality is still not proved for general tensors on the
full energy interval. No counterexample was found, and no new Grothendieck
constant bound is claimed.** The completed certificates and analytic
reductions were independently audited.

Labels in this report: **P** = complete mathematical proof supplied below;
**C** = an exact-rational or outward-interval computation replayed through
`verify.py`; **N** = floating point only; **O** = unproved. A P proof using a
C constant is marked P+C.
These are research proofs, not new Lean theorems.

## What a reviewer should check first

1. **Scope.** A1 and A2 are closed on the full energy interval. Only B in
   §5 remains **O** for general tensors. The unconditional all-tensor theorem
   reaches \(u\le0.00173\); the explicit classes above reach \(u\le0.0463\).
2. **Structural estimate.** The \((2/25)\delta\) bound uses the
   trace-sensitive Stein budget and shifted Gaussian resolvent in
   [content_profile_proof.md](content_profile_proof.md). The sharper uniform
   norm bound \(1/50\) uses the Gaussian-probe dual estimate in
   [content_next_proof.md](content_next_proof.md). The additional
   \(3\delta^{3/2}\) bound uses the even second-chaos resolvent in
   [content_tensor_next.md](content_tensor_next.md). The envelope does not
   establish B for every tensor.
3. **Finite amplitude.** Check the paired-projection factors and PSD matrix
   comparison in [theta_proof.md](theta_proof.md), then the scalar derivative
   majorant and global ray argument in
   [localization_alternative_proof.md](localization_alternative_proof.md).
   The latter proves localization without relying on sampled optimizers.
4. **Computer certificate.** Run `python3 -I verify.py`. It replays rational
   checks, the directed-rounding C++ curvature and localization certificates,
   and the Arb content/profile certificates. It requires a C++17 compiler and
   python-flint; interpreter selection is explained in §7.
5. **Evidence.** The monomial numbers in §6 and the supplied low-dimensional
   searches are N. They provide candidates, not upper bounds on suprema.

## 1. Sources, scope, and notation

The local checkout and the GitHub `master` branch were read at
[`d0bd91a1b2eeabaa0cdbb22fcf8907c5414f1a75`](https://github.com/agalatan/grothendieck-lean/commit/d0bd91a1b2eeabaa0cdbb22fcf8907c5414f1a75).
The principal references are
[`STATUS.md`, especially §11(c)](https://github.com/agalatan/grothendieck-lean/blob/d0bd91a1b2eeabaa0cdbb22fcf8907c5414f1a75/research/conjecture-K/STATUS.md),
the [research README](https://github.com/agalatan/grothendieck-lean/blob/d0bd91a1b2eeabaa0cdbb22fcf8907c5414f1a75/research/conjecture-K/README.md),
and the [15 November numerical record](https://github.com/agalatan/grothendieck-lean/blob/d0bd91a1b2eeabaa0cdbb22fcf8907c5414f1a75/research/conjecture-K/sources/numerics-kprime-2026-11-15/README.md).
The related GitHub work items are [#177](https://github.com/agalatan/grothendieck-lean/issues/177)
and the archive task [#375](https://github.com/agalatan/grothendieck-lean/issues/375).

Only this requested output folder was written. No branch, issue comment,
commit, Lean build, or change to tracked repository files was made. The task's
explicit output-only restriction governs this research handoff.

Use the task's notation, and fix throughout

\[
a=\frac{699}{1250},\quad b=\frac{179}{1250},\quad
p=\frac{2500}{1891},\quad s=\frac35,\quad
A=T-\frac25,\quad P=p-\frac9{25}.
\]

For \(u=\mathbb E|q|^2\), \(\sigma=\|r\|_2\), define the gain at a particular
linear form (not yet optimized) by

\[
\mathcal J(q,r)=2\mathbb E|L+q+Ar|-P\sigma^2-F(q),\qquad
D_+(q)=\max\{B(u)-F(q),0\}.
\]

All statements below are dimension-free unless explicitly described as
numerical monomial tests. We do not assume \(D(q)\ge0\).

**Record check.** The tilt identity and its local cost are already STATUS
11.12–11.13. The circular-mean method underlying §2 is already used at
\(s=0\) in STATUS 6.1.1 and `legacy/lower-bound/sharp-circular.tex`.
The contribution here is an explicit tilted adaptation and its certificate,
not a claim to a new circular-mean method. STATUS 6.3.11–6.3.12 records other
claimed structural content bounds with incomplete derivations or different
scope. The elementary §3 argument supplies its own derivation; the final
stronger application uses the existing Stein-energy budget in
`Grothe/LowerAnalytic/Fluctuation.lean` and `Influence.lean`, re-derived in
the companion note to fix normalizations. No priority claim is made for
that budget or the general Gaussian calculus.

## 2. A complete all-amplitude partial theorem

### 2.1 Theorem (P+C)

For every dimension, every remote \(q\in H_{2,1}\) with
\(0\le u\le463/10000\), and every remote linear form \(r\),

\[
\boxed{\mathcal J(q,r)\le
 \frac{1273}{1250}u-\frac{859}{2500}\|r\|^2.}\tag{1}
\]

Using the final global localization, curvature, and nonlinear tensor-content
certificates, (*) holds for every such \(r\) with the explicit choices

\[
\boxed{s=\frac35,\qquad\kappa=0,\qquad\eta=\frac1{50000},
\qquad 0\le u\le\frac{173}{100000}.}\tag{2}
\]

The proof of this strongest small-energy endpoint is in §2.6. Section 2.5
retains the intermediate endpoint 0.001123 and its direct all-amplitude
argument. Both include \(u=0\), where the gain is nonpositive for every amplitude.
The final improvement uses the dimension-free cubic fourth-moment bound
\(\mathbb E|q|^4\le44u^2\). The preliminary upper estimate in (4) needs
only square integrability, independence from \(Z\), and
\(\mathbb E\bar q r=0\), and remains valid at every energy.

### 2.2 Circular mean lemma (P+C)

For \(t\ge0\),

\[
C(t):=\frac1{2\pi}\int_0^{2\pi}|1+t e^{i\theta}|\,d\theta
\le1+\frac3{10}t^2.\tag{3}
\]

For \(t<1\), expand the two conjugate square roots and average the phase:

\[
C(t)=\sum_{k\ge0}\binom{1/2}{k}^2t^{2k}.
\]

The coefficients are nonnegative. Continuity and monotone convergence at
\(t=1\) give their sum \(C(1)=4/\pi\). Hence for \(0\le t\le1\),

\[
C(t)\le1+\tfrac14t^2+(4/\pi-5/4)t^4
\le1+\tfrac14t^2+\tfrac{15}{628}t^4
\le1+\tfrac3{10}t^2,
\]

where \(\pi>157/50\) is certified. For \(t\ge1\), reciprocity gives
\(C(t)=tC(1/t)\le t+1/(4t)+15/(628t^3)\). Multiplying the desired bound by
\(t^3\) and setting \(x=t-1\), its difference is

\[
Q(x)=\frac3{10}x^5+\frac12x^4-\frac14x^2+\frac{41}{1570}.
\]

For \(x\ge1\), \(x^4/2-x^2/4\ge x^4/4\), so \(Q(x)>0\).
For \(x\in[0,1]\), C1 in `verify.py` transforms \(Q\) to its degree-five
Bernstein basis on each of the 32 closed intervals
\([k/32,(k+1)/32]\). Every coefficient is positive; the least coefficient is
enclosed by \([0.001366753487070,0.001366753487071]\).
Nonnegative Bernstein basis functions summing to one prove positivity
throughout the intervals. This completes (3).

### 2.3 Proof of (1) and (2) (P+C)

Condition on \(T,y\), and average the independent phase of \(Z\) in (3).
With \(\ell(T)=\sqrt T(a+bT)\),

\[
2\mathbb E|L+q+Ar|
\le F(0)+\frac35\mathbb E\frac{|q+Ar|^2}{|L|}
=F(0)+\frac35 I_0u+\frac35 J_s\sigma^2,
\]

where the cross term vanishes by \(\mathbb E\bar q r=0\), and

\[
I_k=\int_0^\infty\frac{t^{k-1/2}e^{-t}}{a+bt}\,dt,
\qquad J_s=I_2-\frac45I_1+\frac4{25}I_0.
\]

Phase averaging also gives \(F(q)\ge F(0)\): rotate the expression to
\(\ell(T)+q e^{-i\theta}\) and apply Jensen. Therefore

\[
\mathcal J(q,r)\le\tfrac35I_0u-
 \bigl(P-\tfrac35J_s\bigr)\sigma^2.\tag{4}
\]

The C2 enclosures include

| constant | certified enclosure |
|---|---|
| \(I_0\) | [2.863947582582862, 2.863947582582863] |
| \(I_1\) | [1.193675717354603, 1.193675717354604] |
| \(I_2\) | [1.527398493771395, 1.527398493771396] |
| \(J_s\) | [1.030689533100970, 1.030689533100971] |
| \((3/5)I_0\) | [1.718368549549717, 1.718368549549718] |
| \(P-(3/5)J_s\) | [0.343638104570935, 0.343638104570936] |

Thus (4) gives the **preliminary**, all-energy bound
\(\mathcal J\le(1074/625)u-(859/2500)\sigma^2\). Its earlier small-energy
threshold was \(1/85920\). The following lower bound on \(F(q)-F(0)\)
improves both conclusions on the requested energy interval.

**Improvement (P+C).** The circular mean also satisfies
\(C(t)\ge\sqrt{4+t^2}-1\). For \(t\le1\), use
\(C(t)\ge1+t^2/4\); for \(t\ge1\), use reciprocity and
\(C(t)\ge t+1/(4t)\). The latter comparison reduces, with \(x=t-1\ge0\),
to the positive polynomial \(32x^3+56x^2+24x+1\).
For fixed \(\ell>0\), the function
\(g_\ell(v)=2/(\sqrt{4\ell^2+v}+2\ell)\) is decreasing and convex.
Jensen under the size-biased law with weight \(|q|^2/u\), followed by
\(\mathbb E|q|^4\le44u^2\), gives

\[
F(q)-F(0)\ge u\,c(u),\qquad
c(u)=\int_0^\infty
\frac{2e^{-t}}{\sqrt{4t(a+bt)^2+44u}+2\sqrt t(a+bt)}\,dt.
\]

The function \(c\) decreases with \(u\). The exact integer checker
`localization_verify.py` proves
\(c(463/10000)>0.702292508353541>7/10\), using a lower right-endpoint sum
on 8192 intervals covering \([0,16]\); the omitted tail is positive.
Also \(c(u)\le I_0/2\) pointwise under the defining integral. Together
with C2, this supplies the explicit full enclosure
\(c(463/10000)\in[0.702292508353541,1.431973791291432]\).
The full proof and rounding details are in
[localization_notes.md](localization_notes.md). Subtracting this lower
bound from the phase-averaged upper bound gives
\(1074/625-7/10=1273/1250\), proving (1). On its own this proves (*)
up to the intermediate endpoint \(1/50920\), since
\((1273/1250)/50920=1/50000\). Sections 2.5–2.6 prove successively larger endpoints, culminating in (2).

**Integral certificate (P+C).** For \(x=a/b\), direct integration gives

\[
I_0=\frac{\pi e^x\operatorname{erfc}(\sqrt x)}{\sqrt{ab}},\quad
I_1=\frac{\sqrt\pi-aI_0}{b},\quad
I_2=\frac{\sqrt\pi/2-aI_1}{b}.
\]

For example, substitute
\((a+bt)^{-1}=b^{-1}\int_0^\infty e^{-(t+x)v}\,dv\) in \(I_0\), integrate
\(t\), then set \(1+v=z^2\). The other formulas are polynomial division.
The checker encloses \(\pi\) with Machin's formula and alternating arctangent
series, square roots with integer square roots at rational precision,
\(e^x\) with a positive series and a geometric tail, and
\(\operatorname{erf}(\sqrt x)=(2\sqrt{x/\pi})
\sum_{k\ge0}(-x)^k/(k!(2k+1))\) with its alternating tail.
All operations are outward rational interval operations. Internal widths for
the \(I_k\) are below \(10^{-60}\); displayed decimals are rounded outward.

### 2.4 Preliminary elementary localization (P+C)

Any \(r\) with nonnegative gain satisfies

\[
\sigma^2\le\frac{2546}{859}u.
\]

At \(u=463/10000\), this gives
\(\sigma\le0.370444467645082<0.371\), as certified by
`localization_verify.py`. The earlier radius \(0.481200477850538\) from
the preliminary C3 bound is superseded. This elementary estimate alone does not imply the
\(0.085\) bound. The final scalar derivative certificate proves that stronger
bound for every global maximizer on the full energy interval; see §5. A \(\varepsilon\)-near maximizer has gain at
least \(-\varepsilon\), since \(r=0\) has zero gain; the corresponding
bound is \(\sigma^2\le[(1273/1250)u+\varepsilon]/(859/2500)\).

### 2.5 Intermediate small-energy theorem at 0.001123 (P+C)

Here is the earlier proof for **every** \(r\) at \(u\le0.001123\), without any unproved
localization hypothesis and without needing existence of a maximizer.
Let \(u_0=1123/10^6\). If \(\mathcal J(q,r)<0\), the conclusion is
immediate. Otherwise (1) implies

\[
\sigma^2\le\frac{2546}{859}u\le v_0,
\qquad v_0=\frac{1429579}{429500000}<\frac1{300}.
\]

The cubic fourth-moment bound gives \(\delta\le42u^2\). By the final
structural estimate (9a),
\(\|c\|^2\le(84/25)u^2\). Apply the proved remainder estimate (14)
with the now-certified \(R=3/10\), \(\Theta=3/4\). Since
\(P-3/4>53/250\), completing the square yields

\[
\mathcal J(q,r)\le\frac{840}{53}u^2+
3\left(\frac3{10}+\frac{v_0}{3/5}\right)
 \exp\left(-\frac{9/100}{v_0}\right).
\]

The tail formula is increasing in \(\sigma^2\), and \(4M<3\), so this
also covers \(\sigma=0\) by continuity. The complete final comparison
can be made rational:

\[
\frac{9/100}{v_0}>27,\qquad
3\left(\frac3{10}+\frac{v_0}{3/5}\right)<\frac{11}{12},\qquad
e^3>\sum_{k=0}^{8}\frac{3^k}{k!}
=\frac{89641}{4480}>20.
\]

Consequently the tail is below \(11/(12\cdot20^9)\), and C7 checks

\[
\frac{840}{53}u_0^2+\frac{11}{12\cdot20^9}
=\frac{26483709}{1325000000000}
 +\frac{11}{6144000000000}
<\frac1{50000}.
\]

Thus (*) holds on \(0\le u\le0.001123\) with \(s=3/5\),
\(\kappa=0\), and \(\eta=2\cdot10^{-5}\), for arbitrary dimension and
all amplitudes. The proof uses no sign assumption on \(D\), no numerical
tensor search, and no content/deficit comparison from §5. This small-energy
argument and its quantifiers were independently checked.

### 2.6 Completed small-energy theorem at 0.00173 (P+C)

The new nonlinear tensor estimate in (9c) gives
\(\|c\|^2\le3\delta^{3/2}\). Together with \(\delta\le42u^2\), the
curvature certificate, and the global localization (16), this proves (2).
Here are the exact constants. Put \(u_0=173/100000\). Every global
maximizer satisfies

\[
\|r_*\|^2\le\frac{u}{40(P-4/5)}\le v_0,
\qquad v_0=\frac{327143}{1225760000}.
\]

Using (14), \(P-3/4>53/250\), and \(4M<3\), completion of the square gives

\[
\mathcal J(q,r_*)\le\frac{250}{53}\,3(42u^2)^{3/2}
 +3\left(\frac3{10}+\frac{v_0}{3/5}\right)e^{-(9/100)/v_0}.
\]

Since \(\sqrt{42}<1621/250\), the main term at \(u_0\) is bounded by
\(528763993191/26500000000000000\). The tail prefactor is
\(220963943/245152000<1\), while \((9/100)/v_0>30\). The inequality
\(e>2\) therefore bounds the tail by \(2^{-30}\), and

\[
\frac1{50000}
-\frac{528763993191}{26500000000000000}-\frac1{2^{30}}
=\frac{79385510593999}{1736704000000000000000}>0.
\]

All bounds are monotone in the energy and radius, so this proves (2)
throughout \(0\le u\le0.00173\). At zero energy the radial derivative
inequality gives nonpositive gain directly. Existence and global maximality
then cover every \(r\). This uses no content/deficit comparison and no
assumption on the sign of \(D\). The complete tensor proof and this
assembly are in [content_tensor_next.md](content_tensor_next.md); C10
checks the rational endpoint arithmetic.

## 3. A structural content estimate

### 3.1 Theorem with a profile-dependent factor (P)

Set \(\delta=\mathbb E|q|^4-2u^2\). Then \(\delta\ge0\). For a real smooth
profile \(h\), suppose \(\Phi(x)=x h(|x|^2)\) and its first two derivatives
have at most polynomial growth. Define

\[
m_h(v)=4v\bigl[(3h'(v)+2vh''(v))^2+3h'(v)^2\bigr].
\]

Then

\[
\boxed{\|\Pi_1[q h(|q|^2)]\|^2
 \le\frac34\delta\,\mathbb E m_h(|q|^2).}\tag{5}
\]

The actual profile \(h_{3/5}\) satisfies these regularity conditions, as the
density argument below verifies. Unlike a direct law-only Cauchy–Schwarz
bound, (5) has no positive residual when \(\delta\to0\).

### 3.2 Proof of (5), including the constants (P)

Write \(y_j=(G_{2j-1}+iG_{2j})/\sqrt2\), with \(G\) real standard Gaussian,
and \(Q=(Q_1,Q_2)=(\Re q,\Im q)\). Each \(Q_a\) is in real chaos three.
Let \(\Gamma_{ab}=\nabla Q_a\cdot\nabla Q_b\), and use the real OU generator
\(\mathcal L=\Delta-G\cdot\nabla\), whose eigenvalue on chaos \(k\) is \(-k\).

For any real third-chaos variable \(V\), write
\(V^2=v_0+J_2+J_4+J_6\), where \(v_0=\mathbb EV^2\), the components are
orthogonal, and \(a_k=\mathbb EJ_k^2\). The product rule gives

\[
|\nabla V|^2=\tfrac12(\mathcal L+6)V^2=3v_0+2J_2+J_4.
\]

Integration by parts, \(\mathbb E[V^3\mathcal LV]
=-3\mathbb E[V^2|\nabla V|^2]\), gives

\[
\mathbb EV^4=3v_0^2+2a_2+a_4,
\qquad \operatorname{Var}|\nabla V|^2=4a_2+a_4
\le2(\mathbb EV^4-3v_0^2).\tag{6}
\]

Global phase equivariance of \(q\in H_{2,1}\) makes its law circular. For
every \(V_\theta=\cos\theta Q_1+\sin\theta Q_2\),

\[
\mathbb EV_\theta^2=u/2,\qquad
\mathbb EV_\theta^4=3\mathbb E|q|^4/8,
\qquad\kappa_4(V_\theta)=3\delta/8.
\]

Equation (6) first proves \(\delta\ge0\) and
\(\operatorname{Var}\Gamma_{11},\operatorname{Var}\Gamma_{22}
\le3\delta/4\). Apply it also to \(V_\pm=(Q_1\pm Q_2)/\sqrt2\).
Since \(\Gamma_{12}=(\Gamma(V_+)-\Gamma(V_-))/2\), and the two latter
quantities have equal means, the squared-norm inequality gives
\(\operatorname{Var}\Gamma_{12}\le3\delta/4\). Hence

\[
\sum_{a,b}\operatorname{Var}\Gamma_{ab}\le3\delta.
\]

Each centered \(\Gamma_{ab}\) has chaos orders two and four, so Gaussian
integration by parts and the OU eigenvalues give

\[
\mathbb E\sum_{a,b}|\nabla\Gamma_{ab}|^2
\le4\sum_{a,b}\operatorname{Var}\Gamma_{ab}\le12\delta.\tag{7}
\]

Now integrate by parts twice. Because \(\partial_i Q_a\) is in chaos two,

\[
\begin{aligned}
\mathbb E[G_i\Phi_\ell(Q)]
 &=\sum_a\mathbb E[\Phi_{\ell,a}(Q)\partial_iQ_a]\\
 &=\tfrac12\mathbb E\sum_{a,b,j}
       \Phi_{\ell,ab}(Q)\partial_{ji}Q_a\partial_jQ_b\\
 &=\tfrac14\mathbb E\sum_{a,b}
       \Phi_{\ell,ab}(Q)\partial_i\Gamma_{ab}.\tag{8}
\end{aligned}
\]

The last factor \(1/2\) comes from symmetry in \(a,b\). Apply
Cauchy–Schwarz to this matrix contraction, summed over \(i,\ell\), and
then (7): the squared norm of the full real first-chaos projection is at most
\((1/16)\mathbb E\|D^2\Phi(Q)\|_F^2\cdot12\delta\).
At \(x=(\sqrt v,0)\), the nonzero Hessian entries are
\(6\sqrt v h'+4v^{3/2}h''\) and three copies of \(2\sqrt v h'\).
Rotation therefore gives \(\|D^2\Phi(x)\|_F^2=m_h(|x|^2)\).

Finally, \(q h(|q|^2)\) has global phase charge one. Its antiholomorphic
first-chaos coefficients \(\mathbb E[y_j qh(|q|^2)]\) vanish under that
rotation. Thus its full real linear projection has exactly the same norm as
its projection onto \(H_{1,0}\). This proves (5).

### 3.3 Final certified bounds for the actual tilted profile (P+C)

For every energy and every finite dimension,

\[
\boxed{\|c_{3/5}(q)\|^2\le
\min\left\{\frac2{25}\delta,\frac{19321}{10^6}u\right\}.}\tag{9a}
\]

The complete structural proof and both profile certificates are in
[content_profile_proof.md](content_profile_proof.md). The sharper
trace-sensitive Stein budget and a Gaussian resolvent with shift \(1/3\)
give
\(\|c\|^2\le(6/25)\delta\sup_R N_\Phi(R)\), where \(N_\Phi\) is the
explicit radial Hessian operator norm defined in that note. The Arb checker
`content_profile.py` certifies \(\sup_R N_\Phi(R)<1/3\): 111 adjacent
rational intervals cover \([0,4]\), and a separate analytic bound covers
every \(R\ge4\). It includes the infinite integration tails. This proves
the first term in (9a), including at \(u=0\).

The separate range certificate `profile_range.py` proves

\[
-\frac1{40}<h_{3/5}(v)<\frac{253}{1000}\qquad(v\ge0).
\]

It covers the compact radius interval \([1/25,3]\) with 158 adjacent
rational intervals and proves the two complementary ranges analytically.
Centering this interval at \(57/500\), using \(\Pi_1q=0\), and applying
orthogonal projection contraction gives
\(\|c\|^2\le(139/1000)^2u=(19321/10^6)u\).
The earlier consequence \(\|c\|<3/100\) at \(u\le463/10000\) remains valid,
but is improved by the following separate certificate:

\[
\boxed{u\le463/10000\quad\Longrightarrow\quad
\|c\|\le\frac1{50},\qquad
\|c\|^2\le\min\left\{\frac2{25}\delta,\frac1{2500}\right\}.}
                                                               \tag{9b}
\]

For any unit holomorphic first-chaos probe \(\ell\), subtracting
\(kq\), where \(k=49/500\), uses \(\mathbb E\overline\ell q=0\).
With \(\lambda=13/50\), pointwise maximization then gives

\[
\|c\|\le\lambda u+
\int_0^\infty e^{-T}\sup_{\rho\ge0}
\{\sqrt T\,\rho|h_{3/5}(\rho^2)-k|-\lambda\rho^2\}\,dT.
\]

This uses only the Gaussian marginal \(|\ell|^2\sim\mathrm{Exp}(1)\);
\(q\) and \(\ell\) need not be independent. The proof and complete domain
reduction are in [content_next_proof.md](content_next_proof.md).
The Arb checker certifies 300 profile intervals covering \(\rho\in[0,3]\),
3200 integration intervals covering \(T\in[0,16]\), and an analytic
infinite tail. Its resulting upper bound is strictly below
\(0.019803664185097<1/50\). The default standalone replay regenerated all
profile enclosures and replayed both scalar dependencies; its proof and
implementation passed independent audit.

A further nonlinear tensor estimate improves the behavior at small
fourth cumulant:

\[
\boxed{\|c_{3/5}(q)\|^2\le3\delta^{3/2}.}\tag{9c}
\]

This inequality holds at every energy. Combining it with (9a)–(9b) gives
\(\|c\|^2\le\min\{(2/25)\delta,3\delta^{3/2},1/2500\}\) throughout the
requested energy interval. Its full proof is in
[content_tensor_next.md](content_tensor_next.md). For a real third-chaos
variable \(F\) with fourth cumulant \(\kappa_4\), an odd \(C^3\) response
\(m\), and any unit real linear probe \(H\), that proof establishes

\[
|\mathbb E[H m(F)]|^2
\le\frac{\|m'''\|_\infty^2}{16}\kappa_4^{3/2}.
\]

The argument combines the exact tensor contraction bound with the even
second-chaos resolvent \((3T+2)\psi=-(m'-\mathbb Em'(G))\), whose second
derivative has norm at most \(\|m'''\|_\infty/4\). Applying it to
\(F=\Re q\), using \(\kappa_4=3\delta/8\), and applying the angular phase
identity gives

\[
\|c\|^2\le
\frac{\pi^2}{128}\left(\frac38\right)^{3/2}
\|m_{3/5}'''\|_\infty^2\delta^{3/2}.
\]

Here \(m_{3/5}(x)=\mathbb E_Z[(T-2/5)
\operatorname{sign}(\Re L+x)]\). The Arb checker `content_next_m3.py`
certifies \(\sup_x|m_{3/5}'''(x)|<13\), using 120 rational parameter
intervals on \([0,3]\), certified source quadrature, and analytic source
and parameter tails. The resulting coefficient is less than 3. Both the
mathematical reduction and scalar certificate were independently audited;
the scalar audit replayed its complete certificate. The recorded leading
polynomial tensor estimate already appears in STATUS 6.3.12; the companion
note supplies a complete derivation and the nonlinear extension.

Equations (9a)–(9c) prove the sufficient content budget
\(\|c\|^2\le D_+/5+3\cdot10^{-6}\) on either of the explicit classes

\[
\boxed{\delta\le\frac1{10000}
\quad\text{or}\quad D_+\ge\frac{397}{200000}=0.001985.}\tag{10a}
\]

The earlier structural condition \(\delta\le3/80000\) is subsumed by the
first class. Neither condition is asserted for every tensor. The
structural terms have no Gaussian-law error floor; the uniform norm term
does not compare content with the actual deficit. For reference, the
stronger earlier target \(\|c\|^2\le D_+/10+3\cdot10^{-6}\) follows when
\(\delta\le1/10000\) or \(D_+\ge397/100000=0.00397\).
That stronger target is no longer required for the assembly in §5.

### 3.3.1 Preliminary elementary profile bound, retained for its proof (P+C)

The following earlier bound remains valid at every energy and dimension,
but is superseded quantitatively by (9a):

\[
\boxed{\|c_{3/5}(q)\|^2\le848\delta.}\tag{9}
\]

In particular, the content task B is proved with
\(\kappa_c=0,\eta_c=3\cdot10^{-6}\) on the dimension-free class

\[
\boxed{0\le\delta\le\frac3{848000000}.}\tag{10}
\]

This earlier small-cumulant class is now enlarged to (10a). The full
all-amplitude inequality still requires localization; proving the content
budget on a class alone does not establish (*).

Here is a self-contained bound on the profile derivatives. Write \(d=2/5\).
The signed planar density of \(L\), weighted by \(T-d\), is

\[
f(z)=\frac{(t-d)e^{-t}}{\pi(a+bt)(a+3bt)},
\qquad |z|=\sqrt t(a+bt).
\]

The radial change of variables has Jacobian \((a+bt)(a+3bt)>0\).
Up to the linear term \(-(g_0+s j_0)x\), the vector field
\(\Phi_s(x)=x h_s(|x|^2)\) is \(\int\operatorname{ph}(x+z)f(z)\,dz\).
The inverse \(t\) is smooth in \(|z|^2\); its defining polynomial
\(t(a+bt)^2\) has positive derivative. The density is smooth at zero and
its derivatives decay integrably at infinity. Differentiating by transferring
one derivative to \(f\), and using
\(\|D\operatorname{ph}(z)\|_F=1/|z|\), gives

\[
\|D^2\Phi_s(x)\|_F
\le\int\frac{|\nabla f(z)|}{|x-z|}\,dz.\tag{11}
\]

The sign of the convolution argument is immaterial here because the density
and its gradient norm are radial. This also justifies the required smoothness
and growth conditions for (5).

Set

\[
C_0=1+d+4bd/a=\frac{1265}{699},\quad
C_1=1+4b/a=\frac{1415}{699},\quad
K=\tfrac{43}{100}C_0+\tfrac{41}{100}C_1=\frac{3747}{2330},\quad
H=C_0+\tfrac32C_1=\frac{6775}{1398}.
\]

Direct differentiation, using
\(\partial_t\log[(a+bt)(a+3bt)]\le4b/a\), gives

\[
|f_t|\le\frac{e^{-t}(C_0+C_1t)}{\pi(a+bt)(a+3bt)}.
\]

As \(dt/dr=2\sqrt t/(a+3bt)\), this yields

\[
\|\nabla f\|_\infty\le A_0:=\frac{2K}{\pi a^3},\qquad
\|\nabla f\|_1\le B_0:=\frac{\sqrt\pi}{a}H.\tag{12}
\]

For the first bound use \(\sup\sqrt t e^{-t}<43/100\) and
\(\sup t^{3/2}e^{-t}<41/100\). Their maxima occur at \(1/2\) and \(3/2\);
C5 certifies the squared inequalities using the rational lower bound
\(e>\sum_{k=0}^7 1/k!\). For the second bound retain the denominator:

\[
\|\nabla f\|_1=2\pi\int_0^\infty r|f_t|\,dt
\le\frac2a\int_0^\infty\sqrt t e^{-t}(C_0+C_1t)\,dt
=\frac{\sqrt\pi}{a}H.
\]

If a nonnegative function \(g\) has supremum at most \(A_0\) and integral
at most \(B_0\), layer-cake integration gives, uniformly in \(x\),

\[
\int\frac{g(z)}{|x-z|}\,dz
\le\int_0^\infty\frac{\min(B_0,\pi A_0R^2)}{R^2}\,dR
=2\sqrt{\pi A_0B_0}.
\]

Thus (11)–(12) imply \(\sup m_{h_s}\le4\pi A_0B_0\). Equation (5) now gives

\[
\|c_s(q)\|^2\le3\pi A_0B_0\delta
=\frac{6\sqrt\pi KH}{a^4}\delta
\le848\delta,
\qquad
\frac{6\sqrt\pi KH}{a^4}
<\frac{406984637451171875}{480017179618707}<848.
\]

C5 checks these rational inequalities with \(\sqrt\pi<1773/1000\), and
the arithmetic implication (10). The non-strict conclusion includes
\(\delta=0\). There is no uncomputed integral constant.

**Limitation (O).** The preliminary constant 848 is no longer the best
available estimate: (9a) replaces it by \(2/25\). Even this improved
structural coefficient, combined with the uniform range bound, has not
been related to \(D_+(q)/5+3\cdot10^{-6}\) for all tensors in the requested
energy interval. The proved classes are (10a) and §3.4. A general
content-to-deficit comparison remains a separate obligation.

### 3.4 A large exact zero-content class (P)

Split the remote coordinates into independent blocks \(X,Y\) and take

\[
q=\sum_{i,j,k}a_{ij,k}X_iX_j\overline{Y_k},
\]

with arbitrary complex coefficients and arbitrary block sizes. This polynomial
belongs to \(H_{2,1}\), since there are no within-monomial contractions across
the independent blocks. Then \(c_s(q)=0\) at every energy and every tilt.

Indeed, the measure-preserving transformation
\((X,Y)\mapsto(e^{it}X,e^{2it}Y)\) fixes \(q\) and every function of \(q\),
whereas every linear coordinate has nonzero character. Its inner product
with that function is zero. Unused independent coordinates also give zero
coefficients. This proves B with \(\kappa_c=\eta_c=0\) on this class. Together with the
completed finite-amplitude and localization certificates, it proves (*)
on this class throughout \(u\le0.0463\); see §5.1. The zero first variation
alone would not exclude a better finite-amplitude value.

## 4. Finite amplitude and its exact tail correction

### 4.1 Conditional remainder theorem (P)

Let

\[
f(w,\rho)=\mathbb E_Z|L+w+A\rho|,\qquad
M=\mathbb E|A|=2e^{-2/5}-3/5.
\]

Suppose \(R>0\), \(0\le\Theta<P\), and the real Hessian in \(\rho\)
satisfies, for all \(w\in\mathbb C\), all \(|\rho|\le R\), and all real
unit directions \(v\),

\[
D_\rho^2 f(w,\rho)[v,v]\le\Theta.\tag{13}
\]

Then, with \(C=\|c_s(q)\|\) and \(\sigma>0\),

\[
\boxed{\mathcal J(q,r)\le2C\sigma-(P-\Theta)\sigma^2
+4M\left(R+\frac{\sigma^2}{2R}\right)e^{-R^2/\sigma^2}.}\tag{14}
\]

For \(\sigma=0\), interpret the tail as zero. This conclusion holds for
arbitrary sharing between \(q\) and \(r\).

**Proof.** Write \(b(w)=\mathbb E_Z[A\operatorname{ph}(L+w)]\).
On \(|r(y)|\le R\), Taylor's integral remainder and (13) give

\[
2[f(q,r)-f(q,0)-\Re(\overline{b(q)}r)]\le\Theta|r|^2.
\]

On the complementary event, \(f\) is \(M\)-Lipschitz in \(\rho\) and
\(|b|\le M\), so the same doubled remainder is at most \(4M|r|\).
The expectation of the first-order term is
\(2\Re\langle r,c_s(q)\rangle\):
\(b(q)=q[g(|q|^2)+s j(|q|^2)]\), and the difference from
\(q h_s(|q|^2)\) is \((g_0+s j_0)q\), orthogonal to \(r\).
Adding \(\Theta|r|^2\) also on the bad event only enlarges the bound.

A complex linear Gaussian \(r\) has \(|r|^2/\sigma^2\sim\mathrm{Exp}(1)\),
even though it need not be independent of \(q\). Tail integration gives

\[
\mathbb E[|r|1_{|r|>R}]
=Re^{-R^2/\sigma^2}
 +\sigma\int_{R/\sigma}^\infty e^{-t^2}\,dt
\le\left(R+\frac{\sigma^2}{2R}\right)e^{-R^2/\sigma^2}.
\]

The last inequality follows by replacing \(1\) with \(t/(R/\sigma)\)
under the tail integral. Cauchy–Schwarz in the first-order term proves (14).
Its tail upper bound is increasing in \(\sigma\).

### 4.2 Existence of maximizers (P)

For fixed finite-dimensional \(q\), \(\mathcal J(q,r)\) is continuous in
the coefficients of \(r\), and the triangle inequality gives

\[
\mathcal J(q,r)\le2M\mathbb E|r|-P\sigma^2
=\sqrt\pi M\sigma-P\sigma^2\longrightarrow-\infty.
\]

Therefore its supremum is attained. This lets a proof use a norm bound for
**some global maximizer**, without assuming one for every near maximizer.
Existence itself gives no small norm bound. The scalar derivative argument
in §5 supplies the final bound for every global maximizer; §2.4 is a
preliminary, weaker estimate.

### 4.3 Uniform curvature is now proved (P+C)

For every complex \(w\), every complex \(\rho\) with \(|\rho|\le3/10\),
and every real unit direction \(v\),

\[
D_\rho^2\mathbb E_Z|L+w+(T-2/5)\rho|[v,v]\le\frac34.   \tag{15}
\]

This is the full uniform statement required by A1, not a value at the
origin or a grid maximum. Its complete proof is
[theta_proof.md](theta_proof.md). A strictly monotone real cubic removes
the apparent Hessian singularity and yields a smooth scalar projection
integral. Pairing opposite projection signs and splitting at
\(\Re w=137/200\) produces two positive-semidefinite matrix envelopes.
The checker certifies 256 triples of scalar upper bounds by a covering of
6,168 accepted rectangles, then verifies both matrix inequalities by
directed intervals. An analytic exterior estimate covers
\(|w|\ge23/4\); Gaussian source tails are included throughout.

`theta_verify.cpp` uses directed IEEE interval arithmetic. Its source and
analytic bridge were independently audited, and the audit recompiled and
replayed the full certificate in approximately 13 seconds. Both final
matrices are strictly below \((3/4)I\); the original run has maximum
subdivision depth 24. The detailed interval output is in
[theta_results.txt](theta_results.txt). Thus (14) may now be used
unconditionally with \(R=3/10\) and \(\Theta=3/4\).

## 5. Global localization is closed; one content comparison remains

### 5.1 Final localization and conditional assembly (P+C)

**A1 is closed** by (15). **A2 is also closed** on the full requested
class \(n<\infty,\ q\in H_{2,1},\ 0\le\|q\|^2\le463/10000\):

\[
\boxed{\text{Every }r_*\in\arg\max_r\mathcal J(q,r)
\text{ satisfies }\|r_*\|^2\le\frac{u}{40(P-4/5)}
\le\frac{875533}{122576000}<\left(\frac{17}{200}\right)^2.}\tag{16}
\]

Here is the analytic implication of the new scalar certificate. Put

\[
\beta(w,\rho)=\Re\mathbb E_Z[A\operatorname{ph}(L+w+A\rho)].
\]

For every \(w\in\mathbb C\) and every real \(\rho>0\), the certificate proves

\[
\beta(w,\rho)\le\frac45\rho+\frac{63}{400}\Re w
                 +\frac{|w|^2}{40\rho}.
\]

Fix a unit remote linear form \(X=R e^{i\phi}\) and write \(r=\sigma X\).
Conditional rotation of the visible Gaussian and dominated differentiation
along this ray give

\[
\frac12\frac d{d\sigma}\mathcal J(q,\sigma X)
=\mathbb E[R\beta(qe^{-i\phi},\sigma R)]-P\sigma
\le-(P-4/5)\sigma+\frac{u}{40\sigma}.
\]

The mixed term vanishes by \(\mathbb E\overline Xq=0\), with no
independence assumption between \(q\) and \(X\). The gain therefore
strictly decreases along every ray beyond the radius in (16), proving the
assertion for all global maximizers. This localization implication needs
only square integrability and orthogonality of \(q\) to remote linear
forms; it does not use the fourth-moment estimate.

The complete proof, compactification, signed source integral, circle-series
bounds, and analytic tails are in
[localization_alternative_proof.md](localization_alternative_proof.md).
The directed-rounding checker accepted 70,373 boxes after 140,745 visits,
including 3,205 analytic prunes, with maximum depth 25. Its largest accepted
upper bound was \(0.79999684962304463<4/5\). The recorded full run finished
in 153.24 seconds with exit status zero. The independent audit reviewed the
analytic reduction and all interval code, recompiled it, and replayed two
rigorous point enclosures; it did not claim a second independent full-cover
run. The complete primary run is recorded in
[localization_majorant_results.txt](localization_majorant_results.txt).

**O-B — The single remaining sufficient content/deficit inequality:**

\[
\boxed{\|\Pi_1[q h_{3/5}(|q|^2)]\|^2
\le\frac15 D_+(q)+\frac3{10^6}.}\tag{17}
\]

This is proved on the classes in (10a) and §3.4, and remains O for general
tensors in the requested energy interval. It is a sufficient obligation,
not a claim of necessity.

**If (17) holds, then (*) holds** with

\[
\boxed{s=\frac35,\qquad\kappa=\frac{50}{53}<1,\qquad
\eta=\frac{18}{10^6}<2\cdot10^{-5}.}\tag{18}
\]

Indeed, apply (14) at a global maximizer with \(R=3/10\),
\(\Theta=3/4\), and use \(P-3/4>53/250\). At the exact radius cap in
(16), the outwardly certified tail upper bound is less than
\(3.2\cdot10^{-6}\). Completing the square gives

\[
\mathcal J(q,r_*)
\le\frac{250}{53}\|c_{3/5}(q)\|^2+3.2\cdot10^{-6}
\le\frac{50}{53}D_+(q)
  +\left(\frac{250}{53}\,3+3.2\right)10^{-6}
<\frac{50}{53}D_+(q)+18\cdot10^{-6}.
\]

Maximality covers every \(r\). C8–C9 check the exact radius, tail, and
assembly arithmetic; no positivity of \(D\) is assumed.

**Proved full-energy classes (P+C).** Equation (18) consequently holds for
all \(0\le u\le0.0463\) whenever either condition in (10a) holds, and for
the zero-content class in §3.4. These are unconditional theorems on specified
classes. They are distinct from the all-tensor small-energy theorem (2),
which needs no content/deficit comparison.

### 5.2 Exactly where the proposed proof stops

**O, not a refutation.** Both finite-amplitude obligations A1 and A2 are
proved. The structural estimates (9a), (9c), and the sharper uniform content norm
(9b) do not establish (17) outside the stated classes. The remaining gap is
therefore precisely the comparison with the actual deficit in (17), or
another argument sufficient to replace it. No inference from the completed
curvature, localization, and profile certificates alone proves (*) for
every tensor up to \(u=0.0463\).

For context, the rigorous tail **upper bound** at \(R=0.3\) is sensitive to
the radius cap:

| \(\sigma\) cap | certified enclosure of tail upper bound |
|---|---|
| \(\sqrt{875533/122576000}\), proved | [0.00000311542247008474, 0.00000311542247008475] |
| 0.085 | [0.000003597353671, 0.000003597353672] |
| 0.09 | [0.000013880672593, 0.000013880672594] |
| 0.10 | [0.000115776181637, 0.000115776181638] |

These are C4/C8 evaluations of a proved upper-bound formula, not actual
errors or lower bounds on errors. The first row now has a global
localization proof; the larger hypothetical caps are retained only to
explain the scale needed in the earlier search.

## 6. Numerical evidence, kept separate (N)

`verify.py --algebra-only --numerical` independently evaluates
\(q=\sqrt{u/2}\,y(|y|^2-2)\), \(r=\alpha y\), at \(s=3/5\), using
two deterministic radial Gauss–Legendre resolutions and the angular formula

\[
\mathbb E_\theta|x+z e^{i\theta}|
=\frac2\pi(x+z)\,\mathrm E\left(\frac{4xz}{(x+z)^2}\right)
\quad(x,z\ge0),
\]

where \(\mathrm E\) is the complete elliptic integral with its parameter
convention. Radii are truncated at 7.5. There is no certified quadrature,
truncation, optimization, or finite-difference error. Optimization is only
over real \(\alpha\in[-0.15,0.15]\); complex directions and all tensors are
not covered. Agreement between resolutions is a diagnostic, not a certificate.

At 600 radial nodes per variable the outputs are:

| \(u\) | \(D(q)\) | found \(\alpha\) | gain/\(D\) | content squared/\(D\) |
|---|---|---|---|---|
| 0.0200 | 0.00384984782315 | 0.0145012044817 | 0.0252814105 | 0.0117074626 |
| 0.0463 | 0.0120634221797 | 0.0247959313675 | 0.0240533673 | 0.0113576080 |

The original full values and the 264-node comparison are retained in
[preliminary_results.txt](preliminary_results.txt). The new `results.txt`
is the full certificate summary, not a transcript of this numerical test.
They agree with the supplied monomial scale and are consistent with (16)–(17)
on those two tensors. The proof of (16) is the separate global certificate;
these numerical tests do not prove (17).

For (15), the task reports a floating-point grid value about 0.7086 at
\(s=0.6,R=0.3\). The uniform upper bound 0.75 is now proved independently
by §4.3; it does not rely on that sampled value. The archived
`tilt_restricted.py` loops only over
\(s=0,0.2,0.3434,0.5\), so the task's extra \(s=0.6\) value should be
identified as supplied evidence, not a result replayed from that script.

The broader two- and three-variable numbers are those of STATUS
11.16/11.19/11.20. Their searched values are lower bounds on the corresponding
suprema. In particular “the true constant is about 0.03” cannot be promoted
to a dimension-free upper bound from this evidence.

## 7. Audit qualifications and reproduction

**Source audit, not a new theorem or rebuild.** The task's claims about the
existing Lean moment inputs are consistent with the source:
`Grothe/LowerAnalytic/Bridge.lean`, `gaussian_moments`, derives the tensor
inputs for normalized circular cubic chaos; the Stein consumer uses
`gaussian_gramInputs` from `GramBudget.lean`. No Lean build was run here.
Neither those moment inputs nor this source inspection establishes (17).

**N/O qualification.** STATUS 11.14 labels the profile signs and decreasing
ratio as numerical observations, including a documented small-argument
quadrature error. No proof above assumes that global monotonicity or those
signs. The local cost \(k(3/5)\in
[0.446707057881032,0.446707057881033]\) is certified by C2, but remains a
local cost. The separate uniform Hessian certificate in §4.3 is the
finite-amplitude input actually used.

From this folder:

```sh
python3 -I verify.py
```

This replays every final C certificate: exact-rational arithmetic, the
directed IEEE interval curvature and radial-gradient engines, the
elementary localization certificate, and the Arb structural content,
profile-range, Gaussian-probe, and third-response-derivative certificates.
It requires a C++17 compiler and an interpreter with python-flint. On this machine the wrapper
can use an existing archived virtual environment as a **read-only**
fallback; an interpreter may also be selected explicitly with the
`TILTED_FLINT_PYTHON` environment variable. No installation or change to
that environment is required. The output records source SHA-256 hashes
and completed certificate summaries.

For the preliminary and new exact-algebra checks alone:

```sh
python3 -I verify.py --algebra-only
```

The recorded verification ran the full curvature, localization, and profile
chain, then replayed the additive third-order tensor certificate with
`python3 -I verify.py --tensor-only`. The earlier certificate sources were
unchanged. `results.txt` records both commands, their respective orchestrator
hashes, and the final hashes of all ten certificate sources. The current
default command runs the entire combined set.

To add the optional N monomial test, use an interpreter with NumPy/SciPy:

```sh
OPENBLAS_NUM_THREADS=1 /Library/Frameworks/Python.framework/Versions/3.12/bin/python3 -I verify.py --algebra-only --numerical
```

The full wrapper builds its C++ checkers inside this output folder
and replays the interval certificates; it performs no Lean build or GitHub
write. [results.txt](results.txt) records the new full-certificate summary.
Detailed successful logs are retained in
[theta_results.txt](theta_results.txt),
[content_profile_results.txt](content_profile_results.txt),
[profile_range_results.txt](profile_range_results.txt),
[localization_majorant_results.txt](localization_majorant_results.txt),
[content_next_results.txt](content_next_results.txt), and
[content_next_m3_results.txt](content_next_m3_results.txt); the earlier N output
is [preliminary_results.txt](preliminary_results.txt). The companion proofs
[theta_proof.md](theta_proof.md),
[content_profile_proof.md](content_profile_proof.md),
[content_next_proof.md](content_next_proof.md),
[content_tensor_next.md](content_tensor_next.md),
[content_next_m3_proof.md](content_next_m3_proof.md),
[localization_alternative_proof.md](localization_alternative_proof.md), and
[localization_notes.md](localization_notes.md) specify the mathematical
implications, coverage, and tails. All completed certificates and their
audits passed. In particular, the independent curvature audit recompiled
and replayed its full checker; it did not merely inspect a saved success
line. The independent localization audit recompiled the engine and replayed
point enclosures, while the complete cover is the primary recorded run.
The remaining full-interval tilted-sector claim for general tensors is
still open because (17) is unproved.
