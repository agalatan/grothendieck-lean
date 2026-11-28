# All physical modes except the purely remote cubic

Use the signed witness $S=\nu I+\alpha P-\beta Q-dF$, with $e=191/250$, $\nu=47/2000$, $\alpha=1-\nu$, $\beta=e+\nu$, $0\le d\le\nu$ and the [one-coordinate price](ONE_COORDINATE.md) $\Lambda$, of mean below $B_d+2\cdot10^{-54}$. For a physical pair of measurable disk-valued functions put $h=(f+g)/2,k=(f-g)/2$ and $t=\|Ph\|$. Choose a unit complex linear coordinate $Z$ along $Ph$, or any such coordinate if $t=0$. Write $Y$ for all orthogonal fresh Gaussian coordinates. Let $R k$ be the projection onto the cubic bidegree $(2,1)$ in $Y$ alone, constant in $Z$, and set $\tau=\|Rk\|$. In dimension one $R=0$.

For every physical dimension and every pair,
\[
 \operatorname{Re}\langle f,Sg\rangle < B_d+2\cdot10^{-54}+\frac{151}{400}\tau^2.
\]
Every mixed cubic, every fifth-chaos component, and the ordinary pairing are unrestricted. For an absolute payoff apply the result after aligning the payoff by a global phase; $t$ and $\tau$ refer to that aligned pair. In the usual aligned row frame $\tau$ is the norm of the cubic projection of the zeroth visible coefficient of $k$.

The bound and the physical Rice inequality $\tau^2\le2\mu(\mu-t)$ give the following sufficient high-amplitude tests. The angular improvement in the final section gives the third column. Each preceding $10^{-8}$ decimal fails this last scalar estimate.

| Fifth debit | Radial price | Radial and tangential price |
|---|---:|---:|
| $1/50$ | $t\ge.88514816$ | $t\ge.88468058$ |
| $47/2000$ | $t\ge.88495558$ | $t\ge.88440557$ |

Alternatively $\tau=0$ passes the target at every amplitude when $d\ge.000394$. This includes pairs with mixed cubic half-difference in many independent coordinates. For $d=1/50$ the criterion permits every $\tau\le.04372$, and for $d=47/2000$ it permits every $\tau\le.04747$.

At the [central amplitude .83835](TILTED_CENTER.md), a tilted version at debit .02 reaches the same target for $\tau\le.137624483$. The [positive fifth version](POSITIVE_REMOTE_MULTIPLIER.md) covers the opposite perturbation sign.

## Proof by the fresh Hermite indices

In Gaussian product Hermites in the variables $(Z,Y)$, split into orthogonal blocks by the exact normalized fresh Hermite multi-index, of bidegree $(a,b)$. Within one block the visible variable is an arbitrary function of $Z$. Multiplication by a radial function of $Z$ respects this orthogonal decomposition. So do $P,Q,F$, since each selects its own total bidegree. Inside a block with total fresh bidegree $(a,b)$, the remaining projection of bidegree $(j,l)$ is the line of the normalized visible Hermite $H_{j-a,l-b}$ when both subscripts are nonnegative, and zero otherwise. The same reasoning follows first on bounded finite polynomial expansions and then by Parseval in $Y$ for the weighted forms of bounded physical responses.

For $h$, all fresh blocks except $(0,0)$ have vanishing first projection by the choice of $Z$. Hence on their sum $\langle h,Sh\rangle\le\nu\|h\|^2\le\mathbb E[\Lambda|h|^2]$, applied to the corresponding component of $h$. On the $(0,0)$ block the positive one-coordinate inequality applies. Thus it suffices to show on all fresh blocks that
\[
 -\langle k,Sk\rangle\le\mathbb E[\Lambda|k|^2]+(\beta-41/100)\|Rk\|^2.
\]
Let $W=\Lambda+\nu$. Dropping the nonnegative first-projection credit where unnecessary, weighted Cauchy–Schwarz bounds the two negative rank-one forms by the trace $\mathbb E[N(T)/W]$ times $\mathbb E[W|u|^2]$, where $u(Z)$ is the fresh coefficient of $k$ and $T=|Z|^2$. The table lists the numerator upper bounds, using $d\le\nu$, and the certified prices. Every price is below one.

| Fresh $(a,b)$ | Numerator $N(T)$ | Price at most |
|---|---|---:|
| $(0,0)$ | $\beta T(T-2)^2/2+\nu T(T^2-6T+6)^2/12$ | .74203 |
| $(0,1)$ | $\beta T^2/2+\nu T^2(T-3)^2/6$ | .58249 |
| $(1,0)$ | $\beta(T-1-c)^2+\nu(T^2-4T+2)^2/4$, $c=-7/20$ | .88829 |
| $(1,1)$ or $(2,0)$ | $\beta T+\nu T(T-2)^2/2$ | .90522 |
| $(2,1)$ | $(41/100)+\nu(T-1)^2$ | .98889 |

In $(1,0)$ the visible first mode is the constant one. Write $T-1=(T-1-c)+c$. Cauchy–Schwarz for the direct sum of weighted $L^2$ and the first-mode scalar charges the additional $\beta c^2/\alpha$ in the displayed price and uses the available $\alpha|\mathbb E u|^2$ on the positive side. In $(2,1)$ the visible cubic mode is the constant one; the table pays $41/100$ of its squared coefficient. Summing the remaining $(\beta-41/100)|\mathbb E u|^2$ over all fresh Hermites of this bidegree gives exactly $(151/400)\tau^2$. If no cubic line exists, the worst possible remaining rank-one debit is $d\|u\|^2\le\nu\|u\|^2\le\mathbb E[W|u|^2]$. This accounts for every fresh multi-index. Sum the estimates and use $|h|^2+|k|^2\le1$ pointwise.

The [rational verifier](code/remote_cubic_multiplier.py) partitions $0\le r\le6$ into intervals of length $1/512$. On each, the smaller of the two endpoint-debit polynomials $p_0(r^2),p_\nu(r^2)$ at its left edge gives a valid lower price because both increase throughout the window. Rational interval arithmetic encloses the numerator on the whole cell. For a cell $u\le T\le v$, the probability is at most $e^{-u}(v-u)$; consecutive upper bounds use $e^{-s}\le1-s+s^2/2$ and upward rounding. On $T\ge36$ the numerator is at most $T^5$ and $W\ge2\nu$.

To verify the physical Rice step directly, when $\tau>0$ test the physical phase pair on $Z$ and the independent, centered, unit-norm remote function $r=Rk/\tau$. For any real $s\ge0$, $t+s\tau\le\tfrac12\mathbb E(|Z+sr|+|Z-sr|)\le\mu+\mu s^2/2$. Indeed $\mathbb E|Z-a|\le\mu+\mu |a|^2/2$ for each fixed complex $a$. This follows by inserting $\mathbb E e^{-y|Z-a|^2}=e^{-y|a|^2/(1+y)}/(1+y)$ into the Laplace integral for $\sqrt{x}$ and applying $1-e^{-v}\le v$. The resulting coefficient is $(2\sqrt\pi)^{-1}\int_0^\infty y^{-1/2}(1+y)^{-2}dy=\sqrt\pi/4$. Take $s=\tau/\mu$; the case $\tau=0$ follows from $t\le\mu$.

For the additional first-chaos mixture $(1-w)S_0+wP-dF$, take $0\le w<1$ and $0\le d/(1-w)\le\nu$. Applying the estimate with base debit $d/(1-w)$ and using $\operatorname{Re}\langle f,Pg\rangle=t^2-\|Pk\|^2$ gives the price
\[
 (1-w)\bigl(B_{d/(1-w)}+2\cdot10^{-54}+(151/400)\tau^2\bigr)+w t^2-w\|Pk\|^2.
\]

## Retaining the phase defect of the half-sum

A second uniform estimate is
\[
 \operatorname{Re}\langle f,Sg\rangle < B_d+2\cdot10^{-54}+\alpha(\mu-t)^2+\frac{21}{80}\tau^2.
\]
Here $A=|L|$ with $L$ from the one-coordinate proof and $W=2\nu+A$. The previously certified block estimates used only the lower bound $W\ge2\nu+\mu\sqrt T\min(p_0(T),p_\nu(T))$ on the finite window and still apply. Put $u_0=\operatorname{ph}L$. Completing the squares of the two visible negative projections at the coefficients $a,b$ of $\operatorname{ph}Z$ gives
\[
 \langle h,Sh\rangle\le\nu\|h\|^2+2\operatorname{Re}\langle L,h\rangle+\alpha(\mu-t)^2-M .
\]
The identity $2\operatorname{Re}(\bar Lh)=A(1+|h|^2-|h-u_0|^2)$ retains a loss. For **unimodular** $f,g$, $\operatorname{Re}(\bar h k)=0$ pointwise, so $|\operatorname{Re}(\overline{u_0}k)|^2\le|h-u_0|^2 |k|^2\le|h-u_0|^2$. The square is unchanged if $u_0$ is replaced by $\operatorname{ph}Z$, since $p_d(T)$ is real. For disk-valued pairs of unequal pointwise moduli this orthogonality need not hold; the radial estimate above still applies to them. The angular estimate below is asserted for unimodular pairs. Its additive slack is $2(\mathbb E A-M)<2\cdot10^{-54}$.

The resulting negative price is $W|k|^2+A[\operatorname{Re}(e^{-i\theta}k)]^2$, with $\theta=\arg Z$. Use the extra square only on fresh Hermites of bidegrees $(2,1)$ and $(1,2)$. They form a conjugation-invariant sum, so all other angular terms are nonnegative and have no cross terms with this sum. For one such normalized pair of conjugate Hermites let $u,v$ be their coefficient functions of $Z$. In the variables $(u,e^{2i\theta}\bar v)$ the $2\times2$ price matrix is $W I+(A/2)\left(\begin{smallmatrix}1&1\\1&1\end{smallmatrix}\right)$. This follows by integrating the square over the fresh variables. Unitary orthogonality of different multi-indices and vanishing expectation of the square of a charged Hermite leave only the conjugate pair. The inverse matrix has both diagonal entries $D(T)=(1/W+1/(W+A))/2$. Each projection test lives on one of the two components, so weighted Cauchy–Schwarz charges its ordinary squared Hermite against $D(T)$. Complex conjugation in the second component only conjugates the corresponding linear functional and preserves its modulus.

In $(2,1)$ pay $21/40$ of the constant cubic mode and the fifth mode $T-1$. In its conjugate $(1,2)$ the only mode is the fifth one $Z^2/\sqrt2$. The full trace is bounded by
\[
 \mathbb E\left[D(T)\bigl(21/40+\nu((T-1)^2+T^2/2)\bigr)\right]\le .99043.
\]
The same whole-cell rational integration verifies this figure. Thus the sole unabsorbed coefficient is $\beta-21/40=21/80$. Inserting the same Rice estimate gives the improved amplitude cutoffs. For a first-chaos mixture multiply this bound at $d/(1-w)$ by $1-w$ and add $w(t^2-\|Pk\|^2)$ as above.

~~~sh
python3 -IB -O experiments/quintic-signed/code/remote_cubic_multiplier.py
~~~

Agent-ID: codex-a7c4
