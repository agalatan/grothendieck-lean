<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/REPORT.md (file dated 2026-11-15 03:23). Only this line was added. -->
# Tilted sector: proved partial results and exact remaining obligations

Agent-ID: **codex-6e2b**. 15 November 2026.

**The requested inequality is not proved on the full interval
\(0\le u\le0.0463\). No counterexample was found, and no new Grothendieck
constant bound is claimed.** There is a complete, dimension-free proof of (*)
for \(u\le1/85920\), a structural content estimate with no Gaussian-law error
floor, and a fully quantified conditional reduction for the rest of the task.

Labels in this report: **P** = complete mathematical proof supplied below;
**C** = exact rational computation accepted by `verify.py`; **N** = floating
point only; **O** = unproved. A P proof using a C constant is marked P+C.
These are research proofs, not new Lean theorems.

## What a reviewer should check first

1. **Scope.** The all-\(r\) theorem in §2 only reaches \(u\le1/85920\).
   The three hypotheses in §5 are **O**, not outputs of the verifier.
2. **Structural estimate.** Check the factor \(1/4\) in the double Gaussian
   integration by parts, the bound \(\sum_{ab}\operatorname{Var}\Gamma_{ab}
   \le3\delta\), and the identification of real and complex first-chaos
   projections in §3. All normalizations are written out.
3. **Finite amplitude.** Check the bad-event remainder and its Gaussian tail
   in §4. Observed small optimizers do not prove the localization hypothesis.
4. **Computer certificate.** Run `python3 -I verify.py`. Its interval endpoints
   are `Fraction`s; its polynomial certificate covers closed intervals rather
   than sampled points. It needs no third-party packages.
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
commit, build, or change to tracked repository files was made. The task's
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
scope; §3 supplies its own derivation and proves a weaker quantitative bound.
No priority claim is made for the general Gaussian calculus used there.

## 2. A complete all-amplitude partial theorem

### 2.1 Theorem (P+C)

For every dimension, every remote \(q\in H_{2,1}\), and every remote linear
form \(r\), at **every** energy \(u\ge0\),

\[
\boxed{\mathcal J(q,r)\le
 \frac{1074}{625}u-\frac{859}{2500}\|r\|^2.}\tag{1}
\]

Consequently (*) holds for every such \(r\) with the explicit choices

\[
\boxed{s=\frac35,\qquad\kappa=0,\qquad\eta=\frac1{50000},
\qquad 0\le u\le\frac1{85920}.}\tag{2}
\]

This includes \(u=0\), where the gain is nonpositive for every amplitude.
The proof actually needs only that \(q,r\) are square-integrable, independent
of \(Z\), and \(\mathbb E\bar q r=0\); it does not use a fourth-moment bound.

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

Thus the coefficient of \(u\) is below \(1074/625=1.7184\) and the cost is
above \(859/2500=0.3436\), proving (1). Finally
\((1074/625)/85920=1/50000\), proving (2).

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

### 2.4 What localization this actually establishes (P+C)

Any \(r\) with nonnegative gain satisfies

\[
\sigma^2\le\frac{4296}{859}u.
\]

At \(u=463/10000\), this gives
\(\sigma\le0.481200477850538<0.482\) (C3). It does not imply the
\(0.085\) bound used in §5. A \(\varepsilon\)-near maximizer has gain at
least \(-\varepsilon\), since \(r=0\) has zero gain; the corresponding
bound is \(\sigma^2\le[(1074/625)u+\varepsilon]/(859/2500)\).

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

### 3.3 Explicit bound for the actual tilted profile (P+C)

For every energy and dimension,

\[
\boxed{\|c_{3/5}(q)\|^2\le848\delta.}\tag{9}
\]

In particular, the content task B is proved with
\(\kappa_c=0,\eta_c=3\cdot10^{-6}\) on the dimension-free class

\[
\boxed{0\le\delta\le\frac3{848000000}.}\tag{10}
\]

This is a small absolute-cumulant class. It does not by itself prove (*)
there, because finite-amplitude control is still needed.

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

**Limitation (O).** No comparison strong enough to turn the right side of
(5) or (9) into \(0.1D_+(q)+3\cdot10^{-6}\) has been proved on the full
energy interval. The constant 848 is far too large for the tested monomial.
The structural identity removes an error floor; it does not solve the deficit
comparison. This is distinct from assuming that a fourth-moment estimate
alone proves the content inequality, a route already flagged in STATUS 13.1.

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
coefficients. This proves B with \(\kappa_c=\eta_c=0\) on this class, but
does not establish global sector monotonicity: zero first variation does
not exclude a better finite-amplitude value.

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
Existence itself gives no small norm bound; §2.4 is the certified elementary
localization available here.

## 5. The precise unresolved package

The following statements are all **O** on the requested class
\(n<\infty,\ q\in H_{2,1},\ 0\le\|q\|^2\le463/10000\):

**O-A1 — A scalar uniform curvature inequality:**

\[
\boxed{D_\rho^2\mathbb E_Z|L+w+(T-2/5)\rho|[v,v]\le\frac34
\quad\forall w\in\mathbb C,\ |\rho|\le\frac3{10},\ |v|=1.}\tag{15}
\]

**O-A2 — Global localization, with its quantifier stated explicitly:**

\[
\boxed{\text{For every such }q,\ \exists r_*\in\arg\max_r\mathcal J(q,r)
\text{ with }\|r_*\|\le\frac{17}{200}.}\tag{16}
\]

**O-B — The remaining content/deficit inequality:**

\[
\boxed{\|\Pi_1[q h_{3/5}(|q|^2)]\|^2
\le\frac1{10}D_+(q)+\frac3{10^6}.}\tag{17}
\]

Equation (17) is proved in §3 for the cumulant class (10) and for the
zero-content class of §3.4. It remains O on general tensors. It is the
specific missing content inequality after this work; (15) and (16) must
also be resolved before claiming the full lemma. No claim is made that these
sufficient conditions are necessary, or uniquely minimal.

### 5.1 Conditional assembly (P+C)

**If (15)–(17) hold**, then (*) holds on the entire requested interval with

\[
\boxed{s=\frac35,\qquad\kappa=\frac12,\qquad
\eta=\frac{19}{10^6}<2\cdot10^{-5}.}\tag{18}
\]

Indeed, at the maximizer in (16), apply (14) with \(R=3/10\),
\(\Theta=3/4\). C4 checks

\[
P-\tfrac34>\tfrac15,\qquad M<\tfrac34,
\]

and, because \(R^2/(17/200)^2=3600/289\),

\[
4M\left(R+\frac{(17/200)^2}{2R}\right)e^{-3600/289}
<3\left(\frac3{10}+\frac{(17/200)^2}{3/5}\right)e^{-3600/289}
<\frac4{10^6}.
\]

Completing the square gives
\(\mathcal J(q,r_*)\le5\|c_s(q)\|^2+4\cdot10^{-6}\).
Insert (17) to obtain (18), and use maximality to cover every \(r\).
No positivity of \(D\) was used.

### 5.2 Exactly where the proposed proof stops

**O, not a refutation.** A local Hessian computed at \((w,\rho)=(0,0)\)
does not establish (15); a grid supremum does not establish it either.
Even if (15) were certified, it controls only the event \(|r(y)|\le0.3\).
Turning that into a small expectation error requires (16) or another
integrated finite-amplitude argument. The available elementary radius is
0.4812 at the endpoint, not 0.085. Lastly, (5) is a structural identity/bound,
but its replacement by (17) is a separate unproved deficit comparison.

Thus there is no valid chain “positive local cost + small measured content
ratio ⇒ (*)”. The exact missing links are (15), (16), and (17).

The sensitivity of the rigorous tail **upper bound**, at \(R=0.3\), is:

| assumed \(\sigma\) cap | certified enclosure of tail upper bound |
|---|---|
| 0.085 | [0.000003597353671, 0.000003597353672] |
| 0.09 | [0.000013880672593, 0.000013880672594] |
| 0.10 | [0.000115776181637, 0.000115776181638] |

These are C4 evaluations of a proved upper-bound formula, not actual errors
or lower bounds on errors. They explain why localization needs a proof at
an explicit scale.

## 6. Numerical evidence, kept separate (N)

`verify.py --numerical` independently evaluates
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

The full values and the 264-node comparison appear in `results.txt`.
They agree with the supplied monomial scale and are consistent with (16)–(17)
on those two tensors. They do not prove either inequality.

For (15), the task reports a floating-point grid value about 0.7086 at
\(s=0.6,R=0.3\), below the proposed threshold 0.75; it was not independently
certified here. The archived `tilt_restricted.py` loops only over
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
local cost; it is not substituted for a finite-amplitude Hessian bound.

From this folder:

```sh
python3 -I verify.py
```

This regenerates every C acceptance claim using only the standard library.
`python-flint` was not importable from either tested system interpreter;
using exact rational series avoids any installation or external dependency.
The optional N test was run with the existing Python 3.12 NumPy/SciPy:

```sh
OPENBLAS_NUM_THREADS=1 /Library/Frameworks/Python.framework/Versions/3.12/bin/python3 -I verify.py --numerical
```

The script does not write files or contact a network. `results.txt` records
the actual output and commands. Its assertions certify the scalar constants
and polynomial coverage, while the mathematical implications are the P
proofs above. No status in this report asserts that the open full tilted
sector lemma has been solved.
