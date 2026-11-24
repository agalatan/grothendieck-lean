# A uniform odd-energy strip from the visible phase circle

Agent-ID: codex-a7c4. Task [#610](https://github.com/agalatan/grothendieck-lean/issues/610). Status **P + C, author only**.

At the peak row of the monograph, the averaged premise $(P_\Psi)$ holds with the single trial $c=0$ for every admissible core with
\[
 W\le \frac1{3\,000\,000}.
\]
There is no restriction on the sharing of the remote fields. The shell energy $V$ can range over the full domain $u\le0.0463$, $u+V\le0.080051$. Combining this strip with global $(P)$ and the six-sector transfer gives $\widehat\Lambda(G)<S+99\cdot10^{-6}$ whenever the core lies in this strip. The threshold is over 541 times the elementary all-core threshold in ledger row 7.5.4. [Global retained inequality](../global-complex-P-gemini-c1de/PROOF.md) · [Six-sector transfer](../all-sector-peak-2026-11-15-codex-91d4/analytic/P_ALL_REDUCTION.md)

## The phase-circle estimate

Let $\zeta=e^{i\theta}$ be uniform on the unit circle, $L>0$, and $X=c_0+L\zeta+c_2\zeta^2$ with arbitrary complex $c_0,c_2$. For $0<s<L$,
\[
 \Pr_\theta(|X|\le s)\le \frac2\pi\arctan\sqrt{s/L}. \tag{1}
\]
Indeed, $\Re(X/\zeta)=L+\Re((\overline{c_0}+c_2)\zeta)$. Set $x=s/L$ and $k=|\overline{c_0}+c_2|/L$. After rotation, the event implies $|1-k\cos\theta|\le x$. For $k<1-x$ this set has zero measure. For $1-x\le k\le1+x$ its measure is $\pi^{-1}\arccos((1-x)/k)$, which is increasing. For $k>1+x$ the measure is
\[
 \frac1\pi\left(\arccos\frac{1-x}{k}-\arccos\frac{1+x}{k}\right).
\]
Its derivative is negative because $y/\sqrt{k^2-y^2}$ increases in $y\in(0,k)$. At $k=1+x$ the measure is $\pi^{-1}\arccos((1-x)/(1+x))$, giving (1). Taking $c_0=c_2=-(L+s)/2$ attains this measure for the original complex field, so this bound is sharp at each fixed $s/L$. In particular, $\Pr(|X|<L)\le1/2$ by continuity from below. The strict cutoff matters for a pure first harmonic, which has $|X|=L$ identically.

## A bound for the odd increment

Use the notation of rows 7.5.2–7.5.4. The standard proper complex Gaussian visible coordinate is $z_1=\sqrt T\,\zeta$, where $T\sim\mathrm{Exp}(1)$ is independent of $\zeta$ and of the remote fields. Set $a=699/1250$, $b=179/1250$, $p=2500/1891$. Conditional on the remote fields and $T>0$, the retained even core has the form above with $L=\sqrt T(a+bT)$, as follows directly from the visible-variable formula. The odd field is
\[
 O=\sqrt T\,\big((Q+\nu d(T))\zeta+P\bar\zeta\big),\qquad
 d(T)=(T-2)/\sqrt2,\qquad
 W=\mathbb E|Q|^2+\mathbb E|P|^2+|\nu|^2.
\]
Here $\mathbb E Q=0$ and $\nu$ is a constant. Set $M=|Q+\nu d(T)|+|P|$ and $H=\sqrt T\,M$. Then $|O|\le H$ at every visible angle. [Visible-variable formula](../all-sector-peak-2026-11-15-codex-91d4/analytic/ODD_RADIAL_QUADRATURE.md)

Write $Y=|X|$. The nonnegative directional term subtracted in $\Psi$ gives
\[
 \Psi(X,O)\le 2\big(\sqrt{Y^2+|O|^2}-Y\big).
\]
On $Y\ge L$ this is at most $|O|^2/L$. Angular orthogonality eliminates the two cross harmonics. Also $\sqrt T/(a+bT)\le1/(2\sqrt{ab})$, $\mathbb E d(T)^2=1$, and centering of $Q$ eliminates the remaining cross term after averaging. Thus
\[
 \mathbb E[\Psi(X,O)\mathbf1_{Y\ge L}]\le
 \mathbb E[|O|^2/L]\le W/(2\sqrt{ab}). \tag{2}
\]

For $Y<L$ use $g_H(y)=2(\sqrt{y^2+H^2}-y)$. Its derivative satisfies $-g'_H(y)=2(1-y/\sqrt{y^2+H^2})\ge0$ for $H>0$. For all $s>0$,
\[
 \Pr_\theta(Y\le s,\ Y<L)\le(2/\pi)\sqrt{s/L}.
\]
For $s<L$ this follows from (1) and $\arctan v\le v$. For $s\ge L$ use $\Pr(Y<L)\le1/2$. Integrating the nonnegative derivative from $Y$ to infinity and using Tonelli gives
\[
 \mathbb E_\theta[g_H(Y)\mathbf1_{Y<L}]
 \le \frac{4I}{\pi}\frac{H^{3/2}}{\sqrt L},\qquad
 I=\int_0^\infty \sqrt y\left(1-\frac{y}{\sqrt{1+y^2}}\right)dy .
 \tag{3}
\]
This also holds at $H=0$ with both sides zero. For the radial average, Hölder with exponents $4$ and $4/3$ gives
\[
 \mathbb E\frac{H^{3/2}}{\sqrt L}
 =\mathbb E\!\left[\sqrt{\frac{T}{a+bT}}\,M^{3/2}\right]
 \le (4ab)^{-1/4}(2W)^{3/4}. \tag{4}
\]
Indeed $T^2/(a+bT)^2\le T/(4ab)$ and $\mathbb E T=1$. Also $M^2\le2(|Q+\nu d(T)|^2+|P|^2)$, whose expectation is $2W$ by the same centering and moment identities as in (2). These estimates hold for arbitrary dependence of $Q,P$ on the remote even core.

## Exact constants and the retained bound

Put $y=\sinh u$, then $v=e^{-2u}$, in (3). This gives
\[
 I=\frac1{2\sqrt2}\int_0^1 v^{-3/4}\sqrt{1-v}\,dv
 \le\frac{D}{2\sqrt2},\qquad
 D=4-\frac25-\frac1{18}-\frac1{52}=\frac{8249}{2340}.
\]
The polynomial $1-v/2-v^2/8-v^3/16$ is positive on $[0,1]$. Its square exceeds $1-v$ by $5v^4/64+v^5/64+v^6/256$. Integrating this upper bound for $\sqrt{1-v}$ gives the displayed $D$.

Combining (2)–(4) yields
\[
 \mathbb E\Psi(X,O)-pW
 \le \left(\frac1{2\sqrt{ab}}-p\right)W+
       \left(\frac{8D^4}{\pi^4ab}\right)^{1/4}W^{3/4}
 \le \frac9{20}W+\frac{71}{20}W^{3/4}. \tag{5}
\]
The rational verifier checks the two coefficients by squaring and taking fourth powers with positive denominators. It uses $\pi>157/50$, which also follows from $\pi=16\arctan(1/5)-4\arctan(1/239)$ and the first two alternating-series terms for the lower estimate at $1/5$.

The last expression in (5) increases on $W\ge0$. At $W_0=1/3\,000\,000$,
\[
 \left(\frac{71}{20}\right)^4 W_0^3
 < \left(\frac{1241}{25\,000\,000}-\frac9{20}W_0\right)^4,
\]
and the quantity in parentheses on the right is positive. Consequently the odd charge is below $49.64\cdot10^{-6}$. Row 7.5.4 gives $\sigma(u)-D_-(q)>-0.36\cdot10^{-6}$ on the admissible domain. Adding the nonnegative $0.01\|U\|^2$ pays the charge in $(P_\Psi)$, and row 7.5.3 gives the stated strict six-sector bound. The rest of the moderate-energy odd sector is still open. [Ledger](../../STATUS.md)

Replay the rational comparisons with `python3 -I research/conjecture-K/code/angular-odd-strip-codex-a7c4/verify.py`. [Exact verifier](../../code/angular-odd-strip-codex-a7c4/verify.py)
