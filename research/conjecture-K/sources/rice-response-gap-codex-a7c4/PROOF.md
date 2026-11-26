<!-- Source: codex-a7c4/rice-response-gap, 26 November 2026. -->
# A quantitative Rice Jensen gap for cubic response energies

Ledger 2.12g, **P + C, author only**. Agent-ID: codex-a7c4. The dimension-free moment bound in 3.4 and the curvature of the Rice mean give a uniform cost for replacing a squared cubic magnitude by its mean. At every response with visible first-chaos amplitude $t\ge0.83992$, the peak-normalized remote energy is strictly below $0.0458$ and the peak-normalized total cubic energy is strictly below $0.08005$. The numerical implications use [exact rational arithmetic](../../code/rice-response-gap-codex-a7c4/verify.py).

## The Jensen gap

Write $\rho(x)=\mathbb E|Z+\sqrt x|$ for a standard proper complex Gaussian $Z$. For a circular complex third-chaos field $q$, let $X=c|q|^2$ with $c\ge0$ and $m=\mathbb EX$. Whenever $0\le m\le1/9$,
$$
\rho(m)-\mathbb E\rho(X)\ \ge\frac{\sqrt\pi}{32}\,\frac{e^{-m/2}m^2}{1+3m/4}.
\tag{1}
$$
At $m=0$ both sides vanish. For $m>0$, use the Rice derivative integral from [2.12a](../reaudit-2026-11-15-codex-a7c4/FOUNDATIONS.md),
$$
\rho'(x)=\frac{1}{2\sqrt\pi}\int_0^1 e^{-sx}\sqrt{(1-s)/s}\,ds.
$$
Subtract the value of $\rho(x)$ from its tangent at $m$. Integration of this identity gives an integrand proportional to $e^{-sm}(e^{-z}-1+z)/s$ with $z=s(x-m)$. For all real $z$,
$$
e^{-z}-1+z\ \ge\ \frac{z^2}{2(1+z_+/2)}.
$$
For $z\le0$ this is the quadratic Taylor lower bound for $e^{|z|}$. For $z\ge2$ use $e^{-z}\ge0$ and $z-1\ge z^2/(2+z)$. On $0\le z<2$, the equivalent inequality is $e^{-z}\ge(2-z)/(2+z)$. The derivative of $\log((2+z)/(2-z))$ is $4/(4-z^2)\ge1$.

The remaining weight is $\sqrt{s(1-s)}\,ds$, of mass $\pi/8$ and mean $1/2$ after normalization. For fixed $x$, the positive function $e^{-ms}/(1+s(x-m)_+/2)$ is log-convex in $s$, hence convex. Jensen at $s=1/2$, followed by $(x-m)_+\le x$, bounds the tangent remainder below by
$$
\frac{\sqrt\pi}{32}e^{-m/2}\frac{(x-m)^2}{1+x/4}.
$$
Take expectations. The linear tangent term cancels. All remainder integrands are nonnegative and the moments used below are finite.

Let $\chi=\mathbb EX^2/m^2-2\ge0$. Row 3.4 gives $\mathbb EX^3/m^3\le6+9\chi+(4045313/100000)\chi^{3/2}$. Cauchy–Schwarz with the positive weight $1+X/4$ gives
$$
\mathbb E\frac{(X-m)^2}{1+X/4}
\ \ge\ \frac{(\mathbb E(X-m)^2)^2}{\mathbb E[(X-m)^2(1+X/4)]}
\ \ge\ \frac{m^2(1+\chi)^2}{1+\chi+(m/4)(3+7\chi+41\chi^{3/2})}.
$$
This is at least $m^2/(1+3m/4)$. After multiplication, the difference of the dimensionless cross-products is $\chi[(1-m/4)+(1+3m/4)\chi-(41m/4)\sqrt\chi]$. With $y=\sqrt\chi$, the bracket is bounded below by $35/36+y^2-(41/36)y>0$. This proves (1).

The leading coefficient agrees with the diffuse Gaussian benchmark. For an independent standard proper Gaussian $W$, $\mathbb E\rho(m|W|^2)=(\sqrt\pi/2)\sqrt{1+m}$. The derivative integral at zero gives $\rho(m)=(\sqrt\pi/2)(1+m/2-m^2/16+O(m^3))$. Their difference is $(\sqrt\pi/32)m^2+O(m^3)$.

## Actual-response energies

Use $\varepsilon_0=1891/2500$, $\lambda=\varepsilon/\varepsilon_0>0$, remote energy $e=\|q\|_2^2$ and total cubic energy $E$. Set $u=e/\lambda^2$. For the actual response, 2.12a gives $t+he/\varepsilon\le\mathbb E\rho(h^2|q|^2)$ for every $h\ge0$ and $\rho(x)\le A+Bx$ with the rational $A=886762780/10^9$ and $B=432306903/10^9$. Choose $h=1/(2\varepsilon B)$. Now $m=h^2e=u/(4\varepsilon_0^2 B^2)$, and
$$
u\le 4\varepsilon_0^2B\big(A-t-[\rho(m)-\mathbb E\rho(X)]\big).
\tag{2}
$$
For $t\ge t_0=83992/100000$ the original tangent gives $m\le m_h=(A-t_0)/B<1/9$. Suppose $u\ge U=458/10000$ and put $m_l=U/(4\varepsilon_0^2B^2)$. Then (1), $e^{-m/2}\ge1-m/2$, and $\sqrt\pi>177/100$ give a gap greater than $5547/10^7$. Using the unrounded rational bound in (2) gives $u<U$, a contradiction. By [2.12b](../progress-2026-11-15-codex-a7c4/RESPONSE_ELLIPSOID.md), the full energy including the three odd sectors satisfies
$$
E/\lambda^2\le\tfrac32\varepsilon_0^2(\pi/4-t^2)+u/4<0.08005.
$$
The checker bounds $\pi$ by Machin's formula and alternating rational sums. Both energy statements apply to actual responses in arbitrary dimension with arbitrary sharing among sectors.

## Four consumer intervals

For $0<\lambda\le1$, evaluate the retained functional at the exact scaled peak profile $(\lambda\ell_0,\lambda\beta_0)$ with $(\ell_0,\beta_0)=(1057/1250,179/1250)$. In the variational formula 3.17, writing the trial as $\lambda\xi$ multiplies only the nonnegative squared trial norm inside the normalized functional by $\lambda$. Taking the infimum shows that the scaled retained payoff is at most $\lambda$ times its unscaled counterpart.

Use the peak allowance $4936/10^8$ from 7.4.16 for the retained $q+A+B$ family. The same calculation for general six-sector responses **uses 7.5.13** with its ledger evidence grade. For the benchmark use the upper endpoint $13739535256616/10^{13}$ from 3.14. The energy cuts above imply the two hypotheses $u\le0.0463$ and $(e+V)/\lambda^2\le0.080051$, where $V$ is the energy of the two linear drivers in the original scale. The consumer row is a convex quadratic in $t$, so its maximum over each interval is attained at an endpoint.

| $\varepsilon$ | Closed $t$ interval | Strict upper ceiling on the row |
|---|---|---|
| $1891/2500$ | $[0.83992,0.85468]$ | $500/701$ |
| $94/125$ | $[0.83992,0.85047]$ | $500/701$ |
| $3/4$ | $[0.83992,0.84931]$ | $500/701$ |
| $299/400$ | $[0.83992,0.84814]$ | $713263/10^6$ |

The checker evaluates $t^2-2\lambda\ell_0t+2(\lambda\beta_0)^2/\varepsilon+\lambda(S_{\rm hi}+4936/10^8)$ at both endpoints with fractions and prints each reserve. These are partial consumer intervals. The universal Grothendieck lower bound still requires control of the uncovered response ranges.

Replay from the repository root with `python3 -IB -O research/conjecture-K/code/rice-response-gap-codex-a7c4/verify.py`.
