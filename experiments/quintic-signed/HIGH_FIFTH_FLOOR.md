# The signed fifth energy at the high crossover

Write $F=P_{3,2}$, $P=P_{1,0}$, $Q=P_{2,1}$, $h=(f+g)/2$, $k=(f-g)/2$, and $\Delta=\|Fh\|^2-\|Fk\|^2$. Let $Z$ be a unit Gaussian along the visible projection of $h$, $t=\operatorname{Re}\langle h,Z\rangle$ and $\mu=\sqrt\pi/2$. On every unimodular physical pair,
$$
\Delta\ge \frac{3\pi}{256}-\frac{\mu}{4}
   \left[\frac{61}{2}(\mu-t)+\frac{199}{177000}\right]
   -3\mu(\mu-t)+\frac12\|Qk\|^2+\frac38\|Pk\|^2.
$$
Indeed the [angular Gram inequality](CENTRAL_FIFTH_FLOOR.md) at angular weight one bounds the three half-difference energies by $3\mu(\mu-t)$. Apply the [clipped fifth projection](lean/QuinticResearch/SignedRadial.lean), theorem `fifth_h_tangent_eleven`, to the half-sum. At $t\ge.88575$ the right-hand side already exceeds $.03207563$ plus the last two energies. At the crossover $t\ge.885773796$ it exceeds $.03229970$ plus those energies.

When the remote cubic component of $k$ has norm $\tau>0$, a separate small-shift argument improves the floor on the following occupied slices of the same physical problem.

| Lower limit on $t$ | Lower limit on $\tau$ | Strict lower limit on $\Delta$ |
|---:|---:|---:|
| .883 | .0754 | .02792893 |
| .885 | .0465 | .03279991 |
| .88575 | .02906 | .03569535 |
| .885773796 | .02800 | .03292783 |
| .885773796 | .02820 | .03417815 |
| .885773796 | .02830 | .03522282 |
| .885773796 | .02833 | .03586562 |

At each displayed pair of lower limits $t_0,\tau_0$, the test below proves the same bound on the half-plane $t+\lambda\tau\ge t_0+\lambda\tau_0$ with $\tau>0$. Each rectangle contains finite examples since $t_0^2+\tau_0^2<\pi/4$ in the [diffuse Gaussian limit](OCCUPIED_FIFTH_SIGN.md).

## Bounds on the conditional Hermite coefficients

Let $q$ be the unit remote cubic in the direction of that projection. For a fixed real shift $a=\lambda|q|$, put $x=a^2$ and $M_j(x)=(-1)^jG^{(j)}(x)$ using the [beta integral for the shifted phase](FULL_FIFTH_PLANES.md). Thus $M_j(0)=\mu(1/2)_j/(2)_j$. Integration by parts against $v^{j+1/2}(1-v)^{1/2}e^{-xv}$ on $[0,1]$ gives $xM_{j+1}(x)\le(j+1/2)M_j(x)$, since the derivative of $(1-v)^{1/2}$ contributes a nonpositive term and both boundary values vanish. Also $0\le M_j(0)-M_j(x)\le xM_{j+1}(0)$.

Denote by $h_*,k_*$ the half-sum and half-difference of the phases of $Z\pm\lambda q$. The normalized visible $H_{32}$ coefficient in $h_*$ has numerator
$$
6M_2(x)-18xM_3(x)+9x^2M_4(x)-x^3M_5(x).
$$
The last two terms sum to a nonnegative number. The numerator is at least $6M_2(0)-24xM_3(0)$. Dividing by $\sqrt{12}$, averaging, and using the tangent to the square at $6M_2(0)/\sqrt{12}$ gives
$$
 \|Fh_*\|^2\ge H=3\mu^2/64-3\mu M_3(0)\lambda^2,
$$
because $\mathbb E|q|^2=1$.

Use the six even visible modes in the [remote cubic subtraction](OCCUPIED_FIFTH_INTERVAL.md). The $11$ and $20$ coefficients have numerator $a[-2M_1(x)+xM_2(x)]$ of absolute value at most $2aM_1(0)$ and squared denominators $1,2$. The $02$ coefficient has absolute value at most $a^3M_2(0)/\sqrt{2}$. For $00$, subtract the orthogonal remote cubic direction with radial coefficient $a\mu$, leaving absolute value at most $a^3M_1(0)$. For $22$ and $31$ subtract their linear terms in $a$, also in orthogonal remote cubic directions. The remaining common numerator is
$$
a\left[x^2M_4(x)-6xM_3(x)+6\{M_2(x)-M_2(0)\}\right].
$$
It lies between $-12a^3M_3(0)$ and zero since $xM_4(x)\le (7/2)M_3(x)$. The squared denominators are $4,6$. Writing $m_6=\mathbb E|q|^6$, the six contributions yield
$$
 \|Fk_*\|^2\le K=6M_1(0)^2\lambda^2+
 \left(\tfrac12 M_2(0)^2+M_1(0)^2+60M_3(0)^2\right)\lambda^6m_6.
$$
The [circular moment bound](SIXTH_RICE_SUPPORT.md) gives $m_6<11500$ in every finite dimension.

The [shifted stability inequality](SHIFTED_FIFTH_STABILITY.md) now gives, for $0<\eta<1$,
$$
 \Delta\ge(1-\eta)H-(1+\eta)K-4\sqrt3(1+1/\eta)
 \left[\mu(1+\lambda^2/2-\lambda^4/8+\lambda^6/16)-t-\lambda\tau\right].
$$
The support term is valid throughout $0\le\lambda\le.345$ by the sixth-order bound. The final four rows use $\lambda=.032$. The [exact rational check](code/high_fifth_floor.py) records the chosen weights and verifies both the strict projection prices and finite occupation. These restricted credits complement the unconditional bound in the first paragraph. A global scalar certificate must also cover the amplitudes below the high crossover.

Agent-ID: codex-a7c4
