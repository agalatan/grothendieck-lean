# Averaging the phase circle over the visible radius

Agent-ID: codex-a7c4. Task [#618](https://github.com/agalatan/grothendieck-lean/issues/618).

At the peak row, write $W=\mathbb E|Q|^2+\mathbb E|P|^2+|\nu|^2$. With the single trial $c=0$, arbitrary sharing of the remote fields is allowed. We prove
\[
 \mathbb E\Psi(X,O)-pW\le \tfrac9{20}W+\tfrac{109}{40}W^{3/4},
 \qquad \mathbb E\Psi(X,O)\le 37000\,W^{11/12}.                         \tag{1}
\]
The first bound gives $(P_\Psi)$ for every $W\le 1/2{,}100{,}000$. This gives $\widehat\Lambda(G)<S+99\cdot10^{-6}$ on that strip when $u\le0.0463$ and $u+V\le0.080051$. The second bound improves the order at zero. Its constant makes the first estimate stronger at the stated strip endpoint. These are peak-row estimates. The general odd-sector premise and the multirow transfer to a lower bound on $K_G^{\mathbb C}$ remain open. [Angular estimate](../angular-odd-strip-codex-a7c4/PROOF.md) · [Six-sector transfer](../all-sector-peak-2026-11-15-codex-91d4/analytic/P_ALL_REDUCTION.md)

## A signed radial moment and a wider strip

Let $T\sim\operatorname{Exp}(1)$, independent of the remote fields, and let $\zeta$ be the independent uniform visible phase. Put $a=699/1250$, $b=179/1250$, $p=2500/1891$, $d(t)=(t-2)/\sqrt2$ and $g(t)=\sqrt{t/(a+bt)}$. The odd field is $O=\sqrt T[(Q+\nu d(T))\zeta+P\bar\zeta]$, with $\mathbb EQ=0$. The angular estimate gives
\[
 \mathbb E\Psi(X,O)\le {W\over2\sqrt{ab}}+
 {4I\over\pi}\mathbb E[g(T)M^{3/2}],\qquad
 M=|Q+\nu d(T)|+|P|,\quad I={1\over2\sqrt2}\int_0^1 v^{-3/4}\sqrt{1-v}\,dv .
\]
The formula includes the entire large-value event and the small-value term bounded using the phase circle. [Angular proof, equations (2) and (3)](../angular-odd-strip-codex-a7c4/PROOF.md)

For $W>0$ set $\lambda=|\nu|^2/W$. Conditional on $T=t$, the second-moment bound for $M$ gives
\[
 \mathbb E[M^{3/2}\mid t]\le(2W)^{3/4}
 [1+\lambda(d(t)^2-1)]^{3/4}
 \le(2W)^{3/4}[1+\tfrac34\lambda(d(t)^2-1)].
\]
The first inequality uses $M^2\le2(|Q+\nu d|^2+|P|^2)$ and centering of $Q$. The second uses the tangent to $x^{3/4}$ at $1$. The coefficient of $\lambda$ after radial averaging is nonpositive. Indeed,
\[
 \mathbb E[g(T)(d(T)^2-1)]
 =\tfrac12\int_0^\infty (t^2e^{-t})''g(t)\,dt
 =\tfrac12\int_0^\infty t^2e^{-t}g''(t)\,dt\le0.                       \tag{2}
\]
Here $g'(t)=a/(2\sqrt t(a+bt)^{3/2})$ is decreasing. At zero $g=O(\sqrt t)$ and $g'=O(t^{-1/2})$, so both boundary terms vanish. The exponential controls the upper endpoint. Consequently $\mathbb E[g(T)M^{3/2}]\le(2W)^{3/4}\mathbb E g(T)$. For $W=0$ both increments vanish.

For completeness, the one-dimensional upper sum giving $\mathbb E g(T)<513/500$ uses mesh $h=1/256$ up to $16$. At each cell use the value of the increasing function $g$ at the right endpoint, rounded upwards. On the last ray use $1/\sqrt b$, also rounded upwards. If the successive upper heights are $u_1,\ldots,u_N,u_{N+1}$ and $u_0=0$, the expectation of this step function is $\sum_{i=0}^N (u_{i+1}-u_i)e^{-ih}$. Every increment is nonnegative. The verifier bounds $e^{-ih}$ from above by iterating $(1+h+h^2/2)^{-1}$ with upward rounding. Integer square roots give the upper heights.

For the beta integral define $c_1=1/2$, $c_{j+1}=c_j(2j-1)/(2j+2)$. The degree-eight Taylor upper bound $\sqrt{1-v}\le1-\sum_{j=1}^{8}c_jv^j$ follows from the negative ninth derivative for $0<v<1$ and continuity at $1$. Thus $I\le D/(2\sqrt2)$ for $D=4-\sum_{j=1}^{8}4c_j/(4j+1)$. Using $\pi>157/50$, the fourth power of the coefficient of $W^{3/4}$ is bounded by $32(D\cdot513/(500\pi))^4 < (109/40)^4$. Also $1/(2\sqrt{ab})-p<9/20$. This proves the first inequality in (1).

At $W_0=1/2{,}100{,}000$ the verifier checks $(109/40)^4W_0^3 < (1241/25{,}000{,}000-9W_0/20)^4$ with a positive right-hand base. Monotonicity gives the odd charge below $49.64\cdot10^{-6}$ throughout the strip. The remote allowance $\sigma-D_->-0.36\cdot10^{-6}$ follows directly from ledger rows 3.3 and 3.14. The slack $0.01\|U\|^2$ is nonnegative. The odd premise and the six-sector conclusion follow with the same global trial as in row 7.5.4a. [Remote allowance](../angular-odd-strip-codex-a7c4/PROOF.md)

## A cubic controls radii near an angular tangency

Fix all remote fields. For $T=t>0$ write $Y=|X|/\sqrt t$ and $L=a+bt$. The visible formula gives
\[
 \Re {X\over\sqrt t\,\zeta}= L+\Re\!\left({C+Et\over\sqrt t}\zeta\right),\quad
 C=\overline{q-2A/5+3\rho B/5},\quad E=\overline{A+B/\sqrt2},
 \quad\rho=5053/10000.
\]
After a phase rotation the real part is $L-R\cos\theta$, where $R=|C+Et|/\sqrt t$. Define
\[
 P_3(t)=t(a+bt)^2-|C+Et|^2=t(L^2-R^2).
\]
This is a real cubic with leading coefficient $b^2$, independently of every remote value. For $x>0$, its real sublevel set has length at most $6b^{-2/3}x^{1/3}$. To see this, factor the cubic over $\mathbb C$. At a sublevel point at least one root lies within $(x/b^2)^{1/3}$, and projecting the three disks to the real line gives the asserted length. [Visible formula](../all-sector-peak-2026-11-15-codex-91d4/analytic/ODD_RADIAL_QUADRATURE.md)

On $k\le t\le k+1$ put $m=k+1$, $A_k=a+bm$ and $D_k=6mA_k$. Suppose first $0<s\le a/2$. On $|P_3|\le D_ks$ the conditional angular probability of $Y\le s$ is at most $(2/\pi)\sqrt{s/a}$ by the fixed-radius phase estimate. Integrating over this set gives the coefficient $12D_k^{1/3}/(\pi\sqrt a)$ times $b^{-2/3}s^{5/6}$.

If $P_3>D_ks$, then $R<L-s$ because $t(2L-s)s<D_ks$. The angular event is empty. If $P_3<-D_ks$, then
\[
 R^2-(L+s)^2\ge {|P_3|\over2t}>0
\]
because $t(2L+s)s\le(5/2)mA_ks<D_ks/2$. Integrating the arcsine density on $[L-s,L+s]$ bounds the probability by $2\sqrt{2m}\,s/(\pi\sqrt{|P_3|})$. Tonelli and the cubic sublevel bound give, on any unit bin $J$ and for $h>0$,
\[
 \int_{J\cap\{|P_3|>h\}} |P_3|^{-1/2}dt
 \le \tfrac12\int_h^\infty x^{-3/2}\,|\{t\in J:|P_3(t)|\le x\}|\,dx
 \le18 b^{-2/3}h^{-1/6}.
\]
For $s>a/2$ use the unit length of the bin. Combining the three ranges,
\[
 \int_k^{k+1}\Pr_\theta(Y\le s)\,dt\le C_k s^{5/6},\qquad
 C_k=\max\!\left\{(2/a)^{5/6},\,
 b^{-2/3}\left({12D_k^{1/3}\over\pi\sqrt a}
       +{36\sqrt{2m}\over\pi D_k^{1/6}}\right)\right\}.
\]
Since $a>1/2$, $b>1/8$, $a+b<1$ and $3m<D_k\le6m^2$, we have $C_k\le120m^{2/3}$. The two terms in parentheses after scaling by $b^{-2/3}$ are at most $48m^{2/3}$ and $72m^{1/2}$, respectively.

## From small values of the core to the odd increment

Set $J=(|Q|^2+|P|^2+|\nu|^2)^{1/2}$. On this bin, Cauchy–Schwarz gives $|O|/\sqrt t\le(k+2)J$ because $2+d(t)^2\le2+(k+2)^2/2\le(k+2)^2$. Set $H=(k+2)J$. Dropping the nonnegative directional subtraction gives $\Psi(X,O)\le2\sqrt t(\sqrt{Y^2+H^2}-Y)$. The derivative with respect to $Y$ gives, by Tonelli applied at fixed remote data, a factor $H^{11/6}I_{5/6}$ after integration of the sublevel estimate. Here
\[
 I_\alpha=\int_0^\infty x^\alpha(1-x/\sqrt{1+x^2})\,dx
 \le {1\over1+\alpha}+{1\over2(1-\alpha)},\qquad I_{5/6}\le39/11 .
\]
The upper bounds on the derivative factor are $1$ for $x\le1$ and $1/(2x^2)$ for $x\ge1$. When $H=0$ the increment vanishes. On the bin $\sqrt t e^{-t}\le\sqrt m\,e^{-k}$. Since $\mathbb E J^2=W$, concavity yields $\mathbb E J^{11/6}\le W^{11/12}$. Therefore
\[
 \mathbb E\Psi(X,O)
 \le {78\over11}\sum_{k\ge0}\sqrt m e^{-k} C_k(k+2)^{11/6} W^{11/12}
 \le {78\cdot120\over11}\sum_{k\ge0}(k+2)^3(3/8)^k W^{11/12}.
\]
Here $e>8/3$, and the series equals $27176/625$ by differentiating the geometric series. Its prefactor is $50873472/1375<37000$, giving (1).

## Why a uniform conditional linear estimate fails

The rank-one zero circle already identified in the discriminant analysis also tests the directional term in $\Psi$. Choose real $A=-2b$, $B=\sqrt2 A$ and $q=2A/5-3\rho B/5$ at one fixed remote value. Then $X=bz(|z-2|^2-R_0^2)$ with $R_0^2=4-a/b=17/179>0$. For the conditional odd choice $Q=ih$, $P=\nu=0$, one has $O=ihz$ and $\Re(X\bar O)=0$. Put $v=|z-2|^2-R_0^2$. On $h/b\le v\le 1/4$, for $0<h<b/4$,
\[
 \Psi(X,O)={2|z|h^2\over\sqrt{b^2v^2+h^2}+bv}
 \ge {2|z|h^2\over(1+\sqrt2)bv}.
\]
The annulus lies in a compact region away from $z=0$. Its Gaussian density and $|z|$ have positive lower bounds independent of $h$, and area about the center $2$ is $dv\,d\theta/2$. The visible expectation is therefore at least a positive constant times $h^2\log(b/(4h))$. A bound linear in $h^2$ with a constant uniform in fixed remote values cannot hold, even for the directional $\Psi$. The distribution of the remote variables still enters the open fully averaged linear question. [Earlier rank-one example](../all-sector-peak-2026-11-15-codex-91d4/analytic/DISCRIMINANT_FEASIBILITY.md)

[Exact rational replay](../../code/radial-phase-power-codex-a7c4/verify.py)
