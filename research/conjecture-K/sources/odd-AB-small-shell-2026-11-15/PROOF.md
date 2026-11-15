<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/odd-cubic-core-2026-11-15/small-shell-AB/shell_certificate/PROOF.md, 15 November 2026; delivered by an outside GPT and relayed by the user. -->
<!-- shell_certificate/PROOF.md -->
# A dimension-free small-shell theorem for (P_odd)

This proves a partial result for the stated (P_odd) problem. It does **not** prove
(P_odd) throughout the full capped region, and it gives no counterexample.
All new numerical lemmas used below have been verified by interval arithmetic.

Use the constants and random fields in the question, including the prescribed
shift. Put
\[
\Delta=\mathbb E|r_B-\rho r_A|^2,\qquad
\mathcal R(c)=|c|^2+\mathbb E D(X,O-cZ)-pW.
\]
No independence among remote fields is imposed.

## Results

**Theorem 1 — proved.** Under the original structural hypotheses, without using
the energy caps,
\[
\boxed{\mathcal R(0)\le\frac{22}{5}V-\frac{97}{47275}W.}\tag{1}
\]
An explicit constant providing a further improvement is
\[
c_*=-\frac{30}{203}\operatorname{Re}\nu
-i\frac{15}{58}\operatorname{Im}\nu.
\]
For this constant,
\[
\boxed{\mathcal R(c_*)\le\frac{22}{5}V-\frac{97}{47275}W
-\frac{72}{1421}(\operatorname{Re}\nu)^2
-\frac9{58}(\operatorname{Im}\nu)^2.}\tag{2}
\]

Consequently (P_odd) holds whenever
\[
\frac{22}{5}V\le\frac{97}{47275}W
+\frac{72}{1421}(\operatorname{Re}\nu)^2
+\frac9{58}(\operatorname{Im}\nu)^2
+\frac{\Delta}{100}+s(q)+5\cdot10^{-5}.
\tag{3}
\]
In particular, using only the supplied bound \(s(q)\ge-3.6\cdot10^{-7}\), it
holds with \(c=0\) for
\[
\boxed{V\le V_0:=\frac{1241}{110000000}
=1.12818181818\ldots\cdot10^{-5}.}\tag{4}
\]
This is valid for every dimension and every allowed sharing of variables.

**Theorem 2 — proved.** A second bound is
\[
\boxed{\mathcal R(0)\le\frac{33}{4}V-\frac{417}{18910}W.}\tag{5}
\]
Thus if \(W\ge375V\), the stronger inequality
\(\mathbb E D(X,O)\le pW\) holds, so (P_odd) follows with \(c=0\).
The exact sufficient ratio from (5) is \(W/V\ge104005/278<375\).

The supplied positive slack yields the following uniform sufficient ranges,
without using \(\Delta\), the negative \(W\) term, or the \(\nu\) improvement:

| Range of \(u\) | Sufficient upper bound on \(V\) |
|---|---:|
| \(u\le0.01\) | \(23/88000\approx2.61363636\cdot10^{-4}\) |
| \(u\le0.02\) | \(27/220000\approx1.22727273\cdot10^{-4}\) |
| \(u\le0.03\) | \(3/88000\approx3.40909091\cdot10^{-5}\) |
| \(u\le0.0463\) | \(1241/110000000\approx1.12818182\cdot10^{-5}\) |

These are sufficient regions, not assertions that the boundaries are sharp.
The full cap range remains open in this work.

## 1. A translated-base geometric inequality — proved analytically

For \(K\ge1\), define
\[
\alpha_K=\frac K{2K-1},\qquad
J_K(x,o)=\frac{|o|^2}{|x|}
-\frac{K-1}{2K-1}\frac{(\operatorname{Re}(\bar xo))^2}{|x|^3}.
\]
For every \(x\ne0\) and \(h,o\in\mathbb C\),
\[
\boxed{D(x+h,o)\le J_K(x,o)+K\frac{|h|^2}{|x|}.}\tag{6}
\]
The denominator here is the unperturbed \(|x|\), not \(|x+h|\). Hence (6)
remains useful when the perturbed core has a quadratic zero.

Here is a proof. Scale and rotate so that \(x=1=e_1\), regard complex numbers
as vectors in \(\mathbb R^2\), and put
\(A=\operatorname{diag}(\alpha_K,1)\). We must show
\[
|y+o|+|y-o|-2|y|\le o^{\mathsf T}Ao+K|y-e_1|^2.
\]
By norm duality, take unit vectors \(u,v\), and write
\(m=(u+v)/2\), \(d=(u-v)/2\). Then \(m\perp d\) and
\(|m|^2+|d|^2=1\). Maximizing first over \(o\), then over \(y\), reduces the
assertion to
\[
K\,d^{\mathsf T}A^{-1}d+(|Ke_1+m|-1)_+^2\le K^2.
\tag{7}
\]
Indeed, these two maximizations give, respectively,
\(d^{\mathsf T}A^{-1}d\) and
\((|Ke_1+m|-1)_+^2/K-K\).

Write \(R=|Ke_1+m|\). If \(R\le1\), (7) follows from
\(\|A^{-1}\|=2-1/K\le K\). If \(m=0\), it follows from
\(K(2-1/K)+(K-1)^2=K^2\).
Otherwise put \(r=|m|\), \(k=m_1/r\), so \(|k|\le1\).
For \(R>1\), using \(R\ge K+rk\) and \(m\perp d\), direct expansion gives
\[
K\,d^{\mathsf T}A^{-1}d+(R-1)^2-K^2
\le-2(K-1)\left[r^2-rk+\frac{1-r^2}{2}k^2\right]\le0.
\]
The bracket, as a quadratic in \(r\), has positive leading coefficient
\(1-k^2/2\) and discriminant \(k^2(k^2-1)\le0\). This proves (6).

The coefficient tradeoff is sharp pointwise: for real
\(y=1-1/K\), \(o=2-1/K\), equality holds. No amplitude truncation is used.

In particular,
\[
D(x+h,o)\le\frac{|o|^2}{|x|}
-\frac37\frac{(\operatorname{Re}(\bar xo))^2}{|x|^3}
+4\frac{|h|^2}{|x|}
\tag{8}
\]
when \(K=4\).

## 2. Exact decomposition of the prescribed core — proved analytically

Set
\[
\eta=\frac{11}{20},\quad
w=q+\frac3{20}r_A+\frac35\rho r_B,\quad
H=(T-\eta)r_A+\frac{Z^2\overline{r_B}}{\sqrt2},\quad x=L+w.
\]
Then, exactly,
\[
x+H=L+q+(T-2/5)r_A+(3/5)\rho r_B+Z^2\overline{r_B}/\sqrt2=X.
\tag{9}
\]
This is an algebraic decomposition; the prescribed shift is unchanged.
The new remote variable \(w\) need not be Wick cubic. The kernel estimates below
hold for every complex value of \(w\), so this introduces no extra hypothesis.

## 3. Uniform shell kernel — verified by interval arithmetic

The new shell estimate is
\[
\boxed{
\mathbb E_Z\frac{|(T-11/20)A+Z^2\bar B/\sqrt2|^2}{|L+w|}
\le\frac{11}{10}(|A|^2+|B|^2)
\quad(w,A,B\in\mathbb C).
}\tag{10}
\]
It is independent of any law or centering assumption on the constants \(A,B\).
Conditioning on all remote variables and applying (10) gives
\[
\mathbb E\frac{|H|^2}{|x|}\le\frac{11}{10}V.
\tag{11}
\]

For a precise numerical specification, rotate \(w\) to \(r\ge0\) and define
\[
E(r)=\begin{pmatrix}
\mathbb E_Z[(T-\eta)^2/|L+r|]&
\mathbb E_Z[(T-\eta)\operatorname{Re}(Z^2)/(\sqrt2|L+r|)]\\
\mathbb E_Z[(T-\eta)\operatorname{Re}(Z^2)/(\sqrt2|L+r|)]&
\mathbb E_Z[T^2/(2|L+r|)]
\end{pmatrix}.
\tag{12}
\]
The cross entry is real by conjugation symmetry. Real and imaginary coefficients
produce blocks with opposite cross-entry signs, hence the same eigenvalues.
Thus (10) is exactly the one-parameter inequality
\(E(r)\preceq(11/10)I_2\) for \(r\ge0\).

The certified maximum upper bound on \([0,8]\), including all errors and tails,
was **1.090933195901016**, strictly below 1.1. The analytic parameter-tail bound
for \(r\ge8\) is \(841/1600<1.1\).

## 4. Odd kernel with the weakened radial subtraction — verified

Define, for \(0<\alpha\le1\),
\[
\mathcal J_\alpha(x,o)=\frac{|o|^2}{|x|}
-(1-\alpha)\frac{(\operatorname{Re}(\bar xo))^2}{|x|^3}.
\]
Thus \(J_4=\mathcal J_{4/7}\), and the previous proof used
\(J_\infty:=\mathcal J_{1/2}\).
The new conditional odd-kernel bound is
\[
\begin{aligned}
\mathbb E_Z\mathcal J_{4/7}(L+w,ZQ+\bar ZP+\nu Zd(T))
\le{}&\frac{33}{25}(|Q|^2+|P|^2+|\nu|^2)\\
&-\frac{24}{35}\operatorname{Re}Q\operatorname{Re}\nu
-\frac65\operatorname{Im}Q\operatorname{Im}\nu,
\end{aligned}
\tag{13}
\]
for every deterministic \(w,Q,P,\nu\in\mathbb C\), where
\(d(T)=(T-2)/\sqrt2\).

For an exact matrix formulation, let \(v=(Z,\bar Z,Zd(T))\), \(x=L+r\), and
\[
\mathcal B_{\alpha,x}(v,w)=\frac{\operatorname{Re}(v\bar w)}{|x|}
-(1-\alpha)\frac{\operatorname{Re}(\bar xv)\operatorname{Re}(\bar xw)}{|x|^3}.
\]
Let \(M_{\alpha,+}\) have entries
\(\mathbb E\mathcal B_{\alpha,x}(v_j,v_k)\), and \(M_{\alpha,-}\) entries
\(\mathbb E\mathcal B_{\alpha,x}(iv_j,iv_k)\). Define
\[
C_\gamma=\begin{pmatrix}0&0&-\gamma\\0&0&0\\-\gamma&0&0\end{pmatrix}.
\]
The new verified assertions are
\[
M_{4/7,+}(r)-C_{12/35}\preceq\frac{33}{25}I_3,
\qquad
M_{4/7,-}(r)-C_{3/5}\preceq\frac{33}{25}I_3.
\tag{14}
\]
They imply (13), because mixed real/imaginary blocks vanish under conjugation.
Rotating \(w\) changes only the phase of the \(P\) coefficient; \(Q,\nu\) and
the compensating terms are unchanged.

The largest certified upper bound on \([0,8]\) was
**1.317087984571117**, strictly below 1.32. The parameter-tail bound for
\(r\ge8\) is 1.1.

For reference, the previous kernel certificate, also included in this bundle,
is
\[
M_{1/2,+}-C_{3/10}\preceq\frac{32}{25}I_3,
\qquad M_{1/2,-}-C_{3/5}\preceq\frac{32}{25}I_3.
\tag{15}
\]
Its recorded compact-range maximum upper bound is 1.2794477508577984.
This is a bound for the quadratic kernel, not merely for \(D\).

## 5. Proofs of the partial results — analytic after the kernel checks

Apply (8) with the exact decomposition (9), then apply (11) and (13)
conditionally on the remote variables. The compensating terms have mean zero
because \(\mathbb E Q=0\) and \(\nu\) is constant. Thus
\[
\mathbb E D(X,O)\le\frac{33}{25}W+\frac{22}{5}V.
\]
Since \(p-33/25=97/47275\), this proves (1).

For a constant \(c\), apply the same argument with \(Q-c\) in place of \(Q\).
The exact orthogonality \(\mathbb E(O\bar Z)=\mathbb E Q=0\) gives
\(\mathbb E|O-cZ|^2=W+|c|^2\). Keeping the compensating terms in (13),
\[
\begin{aligned}
\mathcal R(c)\le{}&\frac{22}{5}V-\frac{97}{47275}W
+\frac{58}{25}|c|^2\\
&+\frac{24}{35}\operatorname{Re}c\operatorname{Re}\nu
+\frac65\operatorname{Im}c\operatorname{Im}\nu.
\end{aligned}
\]
Minimizing this explicit quadratic in the two components of \(c\) gives
\(c_*\) and the gains in (2).

For Theorem 2, take \(K=15/2\) in (6). Its radial kernel is exactly the average
of those in (14) and (15), so after the same mean-zero cancellation,
\[
\mathbb E J_{15/2}(x,O)\le\frac{13}{10}W.
\]
Using (11),
\[
\mathbb E D(X,O)\le\frac{13}{10}W+\frac{33}{4}V,
\]
which proves (5). Since
\((33/4)/(p-13/10)=104005/278<375\), \(W\ge375V\) implies the stated stronger
odd inequality.

The threshold (4) follows from
\[
\frac{22}{5}\frac{1241}{110000000}
=5\cdot10^{-5}-3.6\cdot10^{-7}\le\frac\Delta{100}+s(q)+5\cdot10^{-5}.
\]
The other threshold rows follow in the same way from the supplied positive
slack bounds. The total-energy caps and the mixed-moment estimates are not
needed for these sufficient regions.

A continuous interpolation gives an additional useful bound. For every \(K\ge4\),
\[
\mathcal R(0)\le\frac{11K}{10}V
-\left[p-\frac{32}{25}-\frac7{25(2K-1)}\right]W.
\tag{16}
\]
Indeed, the kernel is the convex combination of (14) and (15) with weight
\(7/(2K-1)\) on (14). Minimizing (16) yields, for \(V>0\),
\[
\mathcal R(0)\le
\begin{cases}
\frac{22}{5}V-\frac{97}{47275}W,&W\le\frac{385}{4}V,\\[3pt]
\frac{11}{20}V-\frac{1988}{47275}W+2\sqrt{\frac{77}{500}VW},
&W\ge\frac{385}{4}V.
\end{cases}
\tag{17}
\]
For \(V=0\) the previous theorem gives the corresponding limiting bound.

## 6. Numerical certification and analytic tails

All matrix integrals are evaluated after the change of variables \(\ell=L\).
If \(t=t(s)\), where \(s=|\ell|^2\), then
\[
s=t(a+bt)^2,\qquad f_L(\ell)=\frac{e^{-t}}{\pi(a+bt)(a+3bt)}.
\]
The inverse is single-valued and smooth for \(s\ge0\), since its defining
polynomial has derivative \((a+bt)(a+3bt)>0\).
Use polar coordinates centered at \(\ell+r=0\):
\[
\ell=(R\cos\theta-r,R\sin\theta)=(\xi,\zeta).
\]
The Jacobian \(R\) cancels the factor \(1/|\ell+r|\). Consequently all
integrands used by the checkers are smooth, even at \(R=0\).

For the shell matrix, put
\(f=e^{-t}/[(a+bt)^3(a+3bt)]\). The three entries of the integrand, before the
common measure \((2/\pi)dR\,d\theta\) on \(\theta\in[0,\pi]\), are
\[
f(a+bt)^2(t-\eta)^2,\qquad
\frac{f(t-\eta)(\xi^2-\zeta^2)}{\sqrt2},\qquad
\frac{f(a+bt)^2t^2}{2}.
\tag{18}
\]
This specifies the new scalar kernel computation directly.

The old and translated odd checkers use the same smooth formula as in the
previous certificate, with the radial subtraction changed from \(1/2\) to
\(3/7\) and the real compensator from \(3/10\) to \(12/35\).
Their entrywise formula follows directly by replacing \(Z=\ell/(a+bt)\) in
the bilinear form defining \(M_{\alpha,\pm}\).

The shell computation uses 320 parameter intervals of length 1/40, 512 radial
cells on \([0,24]\), and 128 angular cells on \([0,\pi]\). The translated odd
computation uses the same mesh outside \([1/4,4/5]\), and within that interval
uses parameter intervals of length 1/80 and 1024 radial cells. The resulting
342 parameter intervals cover \([0,8]\) exactly.

For each scalar integrand entry, the error allowance on a spatial cell and a
parameter interval is
\[
\frac{\Delta R^2}{24}\sup|\partial_{RR}f|
+\frac{\Delta\theta^2}{24}\sup|\partial_{\theta\theta}f|
+\frac{\Delta r^2}{8}\sup|\partial_{rr}f|.
\tag{19}
\]
The first two terms bound tensor-midpoint quadrature error. The last bounds
linear interpolation error between parameter endpoints, so this is not a
finite-grid assumption. Interval automatic differentiation encloses these
derivatives over entire boxes. Symmetric entrywise error bounds are converted
to an operator bound by their maximum row sum. This and the tail contribution
are added to the diagonal before interval LDL positivity checks.

For \(r\le8\), the omitted integration region \(R\ge24\) has \(|L|\ge16\),
so \(T>20\). The shell operator tail is at most
\[
\frac{1}{24}\cdot\frac32\mathbb E[T^2\mathbf1_{T>20}]
=\frac{663e^{-20}}{24}.
\]
The odd operator tail is at most
\[
\frac1{24}\mathbb E[T(2+d(T)^2)\mathbf1_{T>20}]
=\frac{3863e^{-20}}{24}.
\]
Both are included in the reported bounds.

For the unbounded parameter tail \(r\ge8\), split into
\(|L+r|\ge r/2\) and its complement. Let \(t_0=t(r^2/4)\ge6\).
For shell coefficients of norm one,
\(\mathbb E|H|^2\le481/400\), so the first region contributes at most
\(481/1600\). On the second, the pointwise coefficient bound is
\((t-\eta)^2+t^2/2\le3t^2/2\). The radial dominating density
\((3/2)t^2e^{-t}/[(a+bt)(a+3bt)]\) decreases for \(t\ge6\), so integrating
\(1/|L+r|\) over the disk gives a bound
\[
\frac{3t_0^{5/2}e^{-t_0}}{a+3bt_0}
\le\frac{3\,6^{5/2}e^{-6}}{a+18b}<\frac9{40}.
\]
Therefore \(E(r)\preceq(481/1600+9/40)I_2=(841/1600)I_2\).

For the odd kernels, the first region contributes at most 1/4. The second is
bounded by
\[
\frac{2t_0^{3/2}(2+d(t_0)^2)e^{-t_0}}{a+3bt_0}
\le\frac{20\,6^{3/2}e^{-6}}{a+18b}<\frac14.
\]
The displayed functions decrease for \(t_0\ge6\), by logarithmic differentiation.
Adding the compensator operator norm, at most 3/5, bounds the corrected odd
matrices by 11/10. The elementary estimates used here are
\(\sqrt6<5/2\), \(a+18b>3\), and \(e^6>400\); the last follows from
\(\sum_{j=0}^{13}6^j/j!=10059173/25025>400\).

The checkers round each binary64 operation outwards with `nextafter`, use
verified polynomial brackets for the inverse root, enclose exponentials by
alternating Taylor series and repeated squaring, and use an independently
verified exact-rational trigonometric table. No library exponential or
trigonometric result is trusted as an interval bound. The provided source
requires IEEE binary64 and round-to-nearest mode, and the compilation flags
exclude unsafe reassociation and floating-point contraction.

## Scope remaining

The results above allow all shared variables and use precisely the prescribed
shift. They establish a nonzero uniform neighborhood of \(V=0\), a separate
region where odd energy dominates shell energy, and a further explicit region
from the \(\nu\)-dependent constant \(c_*\).

They do not establish (P_odd) for every point satisfying the original caps.
Near \(u=v_*\), when \(s(q)\) is tiny and \(V\) is substantially above the
sufficient regions above, the loss proportional to \(V\) is still too large.
No claim about the sign of the residual in that remaining region follows from
these estimates. All numerical lemmas used for the partial theorems are
completed; the remaining limitation is mathematical scope, not a pending
numerical check.
