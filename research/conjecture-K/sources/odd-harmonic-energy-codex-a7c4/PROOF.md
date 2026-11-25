# The two visible odd harmonics and the phase tangency across scales

Agent-ID: codex-a7c4. Task [#630](https://github.com/agalatan/grothendieck-lean/issues/630). The following peak-row estimates are proved on paper and the finite inequalities are checked with exact rational arithmetic (P + C, author only).

Write the odd field at the trial $c=0$ as
$$
 O=\sqrt T\,[(Q+\nu d(T))\zeta+P\bar\zeta],\qquad
 m=\mathbb E|Q|^2,\quad n=\mathbb E|P|^2,\quad v=|\nu|^2,\quad W=m+n+v .
$$
Here $T$ is a mean-one exponential variable, $\zeta$ an independent uniform phase, the pair $(T,\zeta)$ is independent of all remote fields, the remote fields may share coordinates, $\mathbb E Q=0$, and $\nu$ is fixed. Set
$$
 B_o=\left(\sqrt{m+17v/20}+\sqrt n\right)^2 .
$$
For every admissible even core $X$, the averaged odd charge satisfies
$$
 \mathbb E\Psi(X,O)-pW\ \le\ -\frac3{25}W+
              \frac{487}{200}\left(\frac{B_o}{2}\right)^{3/4}.               \tag{1}
$$
Consequently the premise $(P_\Psi)$ holds on each of the following strips. With $u\le0.0463$ and $u+V\le0.080051$ this gives $\widehat\Lambda(G)<S+99\cdot10^{-6}$ for the six-sector core in each strip. [Angular estimate](../angular-odd-strip-codex-a7c4/PROOF.md) · [Radial estimate](../radial-phase-power-codex-a7c4/PROOF.md) · [Six-sector transfer](../all-sector-peak-2026-11-15-codex-91d4/analytic/P_ALL_REDUCTION.md)

| Odd energies | Sufficient strip |
|---|---|
| Every split | $W\le1/1{,}800{,}000$ |
| $\min(m+v,n)\le W/10$ | $W\le1/1{,}440{,}000$ |
| One visible harmonic, $n=0$ or $m+v=0$ | $W\le1/900{,}000$ |
| Pure radial odd mode, $m=n=0$ | $W\le1/765{,}000$ |

The first strip increases the independently checked all-core width $1/2{,}100{,}000$ by $7/6$. The row transfer to a bound on $K_G^{\mathbb C}$ and the odd inequality outside the established regions remain open. [Independent review of the preceding estimate](https://github.com/agalatan/grothendieck-lean/pull/621#issuecomment-7147504001)

## One tangency parameter at all sublevel scales

Condition on the remote fields and $T>0$. Write $Y=|X|$, $a=699/1250$, $b=179/1250$, $d(t)=(t-2)/\sqrt2$, $L=\sqrt T(a+bT)>0$, $M=|Q+\nu d(T)|+|P|$ and $H=\sqrt T M$. The real projection of $X/\zeta$, divided by $L$, is $1-k\cos\theta$ after a rotation, with one fixed $k\ge0$. Write $F(s)=\Pr_\theta(Y\le Ls,\ Y<L)$. For $0<s<1$ the sharp angular estimate gives $F(s)\le(2/\pi)\arctan\sqrt s$. For all $s$, $F(s)\le\Pr(Y<L)\le1/2$. Thus $F(s)\le(2/\pi)\sqrt s$ everywhere. [Angular estimate, equation (1)](../angular-odd-strip-codex-a7c4/PROOF.md)

For $0<s<1$, put $v_0=k-1$. The event requires $u=k(1-\cos\theta)\in[v_0-s,v_0+s]$. If $k<1-s$ it has probability zero, up to endpoints of measure zero. For $k\ge1-s$ the density of $u$ on $(0,2k)$ is $1/(\pi\sqrt{u(2k-u)})$, and over the integration range $2k-u\ge k+1-s\ge2(1-s)$. Integration gives
$$
 F(s)\le\frac{2}{\pi}\sqrt s\,
      \frac{\phi(v_0/s)}{\sqrt{1-s}},\qquad
 \phi(z)=\frac{\sqrt{(z+1)_+}-\sqrt{(z-1)_+}}{\sqrt2}.              \tag{2}
$$
This also covers the empty event. The profile $\phi$ increases to its maximum $1$ at $z=1$ and decreases thereafter. For $z>1$ it equals $\sqrt2/(\sqrt{z+1}+\sqrt{z-1})$.

If $H=0$ the increment is zero. Otherwise put $h=H/L$, $\delta=v_0/h$, and $j(y)=1-y/\sqrt{1+y^2}$. The layer-cake representation from the angular proof, applied to $2(\sqrt{Y^2+H^2}-Y)\mathbf 1_{Y<L}$, gives $2H\int_0^\infty j(y)F(hy)\,dy$. Define $I=\int_0^\infty\sqrt y\,j(y)\,dy$. The deficit below the universal sublevel envelope has the uniform lower bound
$$
 \int_0^\infty j(y)\left(\sqrt y-\frac{\pi F(hy)}{2\sqrt h}\right)dy
 \ \ge\ \frac{13}{100}.                                               \tag{3}
$$
The integrand is nonnegative. For $h\le1/20$, use (2) only on $1/32\le y\le12$. On a bin $[l,r]$ of width $1/32$, its integral is bounded below by
$$
 (r-l)\sqrt l\,j(r)
 \left(1-\frac{\sup_{l\le y\le r}\phi(\delta/y)}{\sqrt{1-r/20}}\right)_+ .
$$
For $\delta\le0$ use $\phi(0)$. On a nonnegative parameter bin $[d,e]$ of width $1/16$, maximize $\phi$ on $[d/r,e/l]$ by monotonicity on either side of $1$. The bins cover $[0,12]$, and for $\delta\ge12$ use the decreasing side starting at $12/r$. For every parameter bin, including both unbounded rays, the sum exceeds $13/100$. The smallest rational lower sum is $138541269/10^9$. Each factor is rounded in the direction that lowers the claimed sum.

For $h\ge1/20$, use $F(hy)\le1/2$ for $y\ge20$. On that ray $j(y)=1/[\sqrt{1+y^2}(\sqrt{1+y^2}+y)]\ge1/[R(R+1)y^2]$ with $R=501/500$. Integrating $(\sqrt y-\pi\sqrt{20}/4)y^{-2}$ from $20$ to infinity yields $(2-\pi/4)/\sqrt{20}$, positive and greater than $(13/100)R(R+1)$. This proves (3) in both ranges. In particular,
$$
 \mathbb E_\theta[\Psi(X,O)\mathbf1_{Y<L}]
 \le \frac{4}{\pi}(I-13/100)\frac{H^{3/2}}{\sqrt L}.                 \tag{4}
$$

## Radial averaging with the two harmonic energies

Set $g(t)=\sqrt{t/(a+bt)}$, $f(t)=\sqrt t/(a+bt)$. Exact one-dimensional enclosures give
$$
 0<\mathbb E g<41/40,\quad
 \mathbb E[g d^2]<(17/20)\mathbb E g,\quad
 \max(\mathbb E f,\mathbb E[f d^2])<6/5.                              \tag{5}
$$
To obtain (5), partition $[0,16]$ in intervals $[l,r]$ of width $h_1=1/1024$. The exponential mass is between $h_1 e^{-r}$ and $h_1e^{-l}$. The increasing $g$ is bounded by its endpoint values, $f\le\sqrt r/(a+bl)$, and $d^2$ by its larger endpoint value. Integer square roots enclose the heights. The survival probability bounds advance by $1-h_1$ and $1/(1+h_1+h_1^2/2)$ with outward rounding. For the tail, $g<3$, $f\le1/(2\sqrt{ab})<2$ and $\mathbb E[d(T)^2\mid T\ge16]=113$ by the exponential memoryless law. Dropping the tail suffices for the lower bound on $\mathbb E g$. [Exact replay](../../code/odd-harmonic-energy-codex-a7c4/verify.py)

On $Y\ge L$ use $\Psi(X,O)\le |O|^2/L$. After discarding the indicator, angular orthogonality and $\mathbb E Q=0$ give the upper bound $(m+n)\mathbb E f+v\mathbb E[f d^2]\le(6/5)W$. For (4) one has $H^{3/2}/\sqrt L=g(T) M^{3/2}$. Under the probability with density $g(T)/\mathbb E g$, the remote variables retain their joint distribution. If $\mathbb E_g$ denotes this expectation, then
$$
 \mathbb E_g|Q+\nu d|^2=m+v\,\frac{\mathbb E[g d^2]}{\mathbb E g},
 \qquad \mathbb E_g |P|^2=n,\qquad \mathbb E_g M^2\le B_o
$$
by Minkowski. Concavity gives $\mathbb E[gM^{3/2}]\le(\mathbb E g)\,B_o^{3/4}$, including cases where one or both harmonics vanish.

The substitution in the angular proof expresses $I$ as $(2\sqrt2)^{-1}\int_0^1 x^{-3/4}\sqrt{1-x}\,dx$. The degree-16 Taylor polynomial at zero majorizes $\sqrt{1-x}$ on $[0,1]$, since every nonconstant coefficient and the next derivative are negative. Integrating this polynomial gives $I<619/500$. The verifier checks $(4/\pi)(619/500-13/100)(41/40)2^{3/4}<487/200$ and $6/5-p<-3/25$. This proves (1).

Finally, $B_o\le2W$. When the smaller of $m+v,n$ is at most $W/10$, their product is at most $9W^2/100$, giving $B_o\le8W/5$. With one harmonic $B_o\le W$, and for the pure radial mode $B_o=17W/20$. Upon dropping the negative linear term, the positive bound at each stated endpoint is strictly below $1241/25{,}000{,}000$, or $49.64\cdot10^{-6}$. The remote allowance exceeds $-0.36\cdot10^{-6}$ and the slack $0.01\|U\|^2$ is nonnegative. These are precisely the quantities in $(P_\Psi)$ for the single trial $c=0$. Both the zero-energy boundary and arbitrary remote sharing are covered. [Remote allowance and budget](../angular-odd-strip-codex-a7c4/PROOF.md)

Run the arithmetic with `python3 -I research/conjecture-K/code/odd-harmonic-energy-codex-a7c4/verify.py`.
