# A joint cubic and quintic estimate for the degree-five game

Agent-ID: codex-a7c4. Paper proof and rational checks, author only.

Consider the capped game $S=P_{1,0}-eP_{2,1}+\eta P_{3,2}$ with $e=39/50$ and $\eta=779/10000$. The aim is $V=\operatorname{Re}\langle f,Sg\rangle\le 500/701$ for every unimodular pair. Let $h=(f+g)/2$, $k=(f-g)/2$ and $t=\|P_{1,0}h\|_2$. After rotation $P_{1,0}h=tz$, where $z$ is the first complex Gaussian coordinate. Thus $t=\operatorname{Re}\mathbb E[\bar z h]\le\mathbb E|z|=\mu=\sqrt\pi/2$. We prove the target for every pair with $t\ge0.88477644$, and throughout $0.81\le t\le\mu$ when the energy of its remote cubic is at most $3/5000$. The other Gaussian coordinates are denoted by $y$. All estimates below are uniform in the number of coordinates.

## The weighted estimate

Write $T=|z|^2$, with exponential law of mean one, $B(T)=(T^2-6T+6)/\sqrt{12}$ and $e_{32}(z)=zB(T)$. Choose real row multipliers $\ell,\beta,b_A,b_B$ and put
$$
 L=z(\ell+\beta(T-2)),\quad \gamma=\sqrt3/8,\quad
 \nu_*=\eta\mu\gamma,\quad G_* = \nu_* e_{32},\quad
 g_*(T)=\ell+\beta(T-2)+\nu_* B(T).
$$
Suppose $g_*\ge m>0$ on $[0,\infty)$. Define $w=1/(|z|g_*(T))$ and set
$$
 M_*=2\mu(\ell-\beta/2)+\eta\mu^2\gamma^2.
$$
Let $G_3\in H_{2,1}$, $G_5\in H_{3,2}$ be arbitrary, let $q=\mathbb E[G_3\mid y]$, and let $C=b_A q(T-1)+b_B\bar q z^2/\sqrt2$. Write $\Delta=G_5-G_*$. For any $\xi\in H_{1,0}$ the sum of the two expected moduli $\mathbb E|L+G_5\pm(G_3-C-\xi)|$, summed over both signs, minus $\|G_5\|_2^2/\eta$ is bounded above by
$$
 M_* - (1/\eta-\sqrt\pi/m)\|\Delta\|_2^2
       +\mathbb E[w|G_3-C-\xi|^2]. \tag{1}
$$
The fields may share every remote coordinate. Replacing $\sqrt\pi/m$ in (1) by the largest of the twelve exact diagonal expectations $\mathbb E[w|e_{ab}(z)|^2]$, $0\le a\le3$, $0\le b\le2$, also works. This centres the majorant at the optimizer when the cubic vanishes. For a general cubic the optimum of the original modulus can move.

Indeed, for $X=zg_*(T)$ the tangent to the square root at $|X|^2>0$ gives
$$ |X+D|\le |X|+\operatorname{Re}(\overline{\operatorname{ph}z}D)+|D|^2/(2|X|). $$
The exceptional set $z=0$ is null. Apply this twice with $D=\Delta\pm(G_3-C-\xi)$. The mixed quadratic terms cancel pointwise. For the linear term, $P_{3,2}\operatorname{ph}z=\mu\gamma e_{32}(z)$. Indeed, every quintic with positive remote degree has zero remote mean. The remaining coefficient is $\mathbb E[\sqrt T B(T)]=\mu(15/4-9+6)/\sqrt{12}=\mu\gamma$. Thus the linear term cancels the cross term in $-\|G_*+\Delta\|_2^2/\eta$. Since $\mathbb E[\sqrt T(T-2)]=-\mu/2$, the constant is exactly $2\mathbb E|X|-\|G_*\|_2^2/\eta=M_*$.

To bound the remaining quintic quadratic form, expand a field $F\in H_{p,q'}$ as $\sum_{a,b}e_{ab}(z)F_{p-a,q'-b}(y)$ in the normalized one-coordinate Wick basis. Distinct $(a,b)$ have distinct remote bidegrees. Their orthogonality survives multiplication by any weight in $z$. Hence the weighted form is diagonal with coefficient $\mathbb E[w|e_{ab}|^2]$ on each summand. Here are the values of $\mathbb E[|e_{ab}|^2/|z|]/\sqrt\pi$; the cubic rectangle is contained in the quintic one.

| $a$ | $b=0$ | $b=1$ | $b=2$ |
|---|---:|---:|---:|
| 0 | 1 | 1/2 | 3/8 |
| 1 | 1/2 | 3/4 | 7/16 |
| 2 | 3/8 | 7/16 | 41/64 |
| 3 | 5/16 | 11/32 | 51/128 |

For the table, expand $e_{ab}$ using the coefficient $(-1)^k\binom ak\binom bk k!/\sqrt{a!b!}$ on $z^{a-k}\bar z^{b-k}$. The terms indexed by $k,j$ in the squared norm have moment $\Gamma(a+b-k-j+1/2)$ after division by $|z|$. All table entries are at most one. This proves (1).

When $G_3=0$ and $\xi=0$, equality holds at $G_5=G_*$. If $1/\eta>\sqrt\pi/m$, (1) gives uniqueness over the whole complex quintic space and a quadratic loss for moving away. On the 28 published rows with labels $0.150$ and higher the coefficient of this loss exceeds $1.59$. On the 18 rows labelled $0.740$ and higher it exceeds $9.383$. Even on the $0.125$ row the visible scalar alone has a loss coefficient greater than $6.9$, using the last table entry. These statements use the exact rational multipliers in [the row file](../../code/degree5-attack/rows2b.json). For the floor of $g_*$, write it as $aT^2+bT+c$ with $a=\eta\mu/16$, $b=\beta-6a$, $c=\ell-2\beta+6a$, and use $c-\min(0,b)^2/(4a)$.

## From the dual estimate to the actual game

Expanding the self-adjoint quadratic form in $h,k$ gives
$$
 V=t^2-e\|P_{2,1}h\|^2+\eta\|P_{3,2}h\|^2-\|P_{1,0}k\|^2
     +e\|P_{2,1}k\|^2-\eta\|P_{3,2}k\|^2 .
$$
Take $G_3=eP_{2,1}k$ and $G_5=\eta P_{3,2}h$. Complete squares in the three negative terms with $z\beta(T-2)$, $\xi$ and $C$, respectively. For example $-\|P_{1,0}k\|^2\le-2\operatorname{Re}\langle\xi,k\rangle+\|\xi\|^2$, and $-e\|P_{2,1}h\|^2\le 2\operatorname{Re}\langle z\beta(T-2),h\rangle+2\beta^2/e$. For the positive terms use $2\operatorname{Re}\langle G_3,k\rangle-\|G_3\|^2/e$ and its quintic analogue, both exact. Adding and subtracting $2\ell t$, and bounding the pairings with $f,g$ by the respective expected moduli, yields by (1)
$$
\begin{split}
 V\le{}& t^2-2\ell t+2\beta^2/e+M_*-(1/\eta-\sqrt\pi/m)\|\Delta\|^2-\|G_3\|^2/e\\
 &+(b_A^2+b_B^2)\|q\|^2/\eta
    +\inf_{\xi\in H_{1,0}}\{\|\xi\|^2+\mathbb E[w|G_3-C-\xi|^2]\}. \tag{2}
\end{split}
$$
Here $C\in H_{3,2}$ has the indicated squared norm by visible-coordinate orthogonality. This is the same game and row normalization as [Claim 1 in P4](../degree5-attack-2026-11-25/problems/P4-replay-conditional-certificate.md).

For example, take $b_A=b_B=0$, $\xi=0$, $\ell=17/10$ and $\beta=17/100$. The minimum $m=g_*(0)$ exceeds $e\sqrt\pi$, so the same moment table absorbs the full cubic quadratic form into its cost. The resulting parabola
$$
 P_{\ell,\beta}(t)=t^2-2\ell t+2\beta^2/e+2\mu(\ell-\beta/2)+3\eta\mu^2/64 \tag{3}
$$
decreases on the physical interval $0\le t\le\mu$. It is below $500/701$ for every $t\ge0.88527103$ there. At $0.88527102$ this particular parabola exceeds the target. No sector comparison or cubic radius estimate enters this test.

## A larger unconditional endpoint interval

Take $\ell=1.42852$, $\beta=0.172$, $b_A=b_B=0$ and $\xi=0$. In the calculation before (2) put $H=G_5-G_*$, $G=G_3$ and $X=L+G_*$. The cancellation of the quintic linear term survives the following split.

**A two-sign estimate.** For $X\ne0$, put $r=|X|$ and $u+iv=G\overline{\operatorname{ph}(X)}/r$. Then
$$
|X+G|+|X-G|-2r\le (|G|^2-\tfrac12(\Re(G\overline{\operatorname{ph}(X)}))^2)/r .
$$
Indeed $S=(|1+(u+iv)|+|1-(u+iv)|)/2\ge1$. At $S=1$ the assertion holds directly. Otherwise the ellipse equation $u^2/S^2+v^2/(S^2-1)=1$ follows by squaring its focal-distance identity. Consequently $u^2/2+v^2=S^2-1+(1/S^2-1/2)u^2$. When $S\le\sqrt2$ the last expression is at least $S^2-1\ge 2(S-1)$. When $S\ge\sqrt2$, using $u^2\le S^2$ bounds it below by $S^2/2\ge2(S-1)$. Multiplying by $r$ gives the result.

Set $\lambda=3e/(3e+4\eta)$. Convexity of each norm gives
$$
|X+H+G|+|X+H-G|
\le 2(1-\lambda)|X+H/(1-\lambda)|
+\lambda\{|X+G/\lambda|+|X-G/\lambda|\}.
$$
The scalar inequality $2|X+Y|\le 2r+2\Re(Y\overline{\mathrm{ph}(X)})+|Y|^2/r$ follows by taking a tangent of the square root. It bounds the first summand. The two-sign estimate bounds the second. Their linear terms sum to $2\Re(H\overline{\operatorname{ph}(X)})$. The quadratic terms are $|H|^2/((1-\lambda)r)$ and $(|G|^2-(\Re(G\overline{\operatorname{ph}(X)}))^2/2)/(\lambda r)$.

**Diagonal bounds.** Here $g(T)=m+dT+cT^2$, where $c=\eta\mu/16$, $m=\ell-2\beta+6c$, and $d=\beta-6c>0$. Thus $g(T)\ge m+dT>0$, and $\operatorname{ph}(X)=\operatorname{ph}(z)$ almost surely. Decompose $H_{3,2}$ in the orthonormal visible Wick polynomials $e_{ab}(z)$, $0\le a\le3,0\le b\le2$, with remote coefficients in the mutually orthogonal spaces $H_{3-a,2-b}$. The integral of $|H|^2/r$ has no mixed terms. The same argument applies to $G\in H_{2,1}$.

Write $G=q+G'$, where $q$ is the visible-constant component. The remote total degrees of the coefficients of $G'$ are at most two, while $q$ and $\bar q$ are remote degree three. Therefore all mixed terms vanish also in the integral of $(\Re(G\overline{\operatorname{ph}(z)}))^2/r$, conditionally on the visible $z$. The uniform angle of $z$ gives $\mathbb E_\theta(\Re(qe^{-i\theta}))^2=|q|^2/2$. Consequently the cubic coefficient on the visible-constant component equals $3/4$ of its isotropic coefficient. Dropping the nonpositive correction on $G'$ is sufficient.

For $n=0,1,2$ write $M_n=\mathbb E[|e_{ab}(z)|^2 T^{n-1/2}]$. Cauchy–Schwarz under the positive measure $|e_{ab}|^2T^{-1/2}d\mathbb P$ gives
$$
\mathbb E\frac{|e_{ab}(z)|^2}{\sqrt T\,g(T)}
\le \frac1m\left(M_0-\frac{dM_1^2}{mM_1+dM_2}\right).
$$
Indeed the square of the integral of $T$ is at most the product of the integrals of $T/(m+dT)$ and $T(m+dT)$. The normalized moments $M_n/\sqrt\pi$ are exact rationals. Expanding the Wick polynomial gives
$$
\frac{M_n}{\sqrt\pi}
= a!b!\sum_{k,j=0}^{\min(a,b)}
 \frac{(-1)^{k+j}(1/2)_{a+b+n-k-j}}
 {k!j!(a-k)!(b-k)!(a-j)!(b-j)!}.
$$
The checker substitutes rational lower bounds for $m,d$ before the integral estimate, so monotonicity follows directly from the integrand. It uses an upper bound for $\sqrt\pi$ in the final moment bound. The largest certified quintic coefficient is $Q_5<1.508511$. After the $3/4$ correction the cubic coefficient is $Q_3<1.131384$. In both cases the largest coefficient occurs for $(a,b)=(0,0)$. The exact comparisons give $Q_5/(1-\lambda)<1/\eta$ and $Q_3/\lambda<1/e$.

The resulting payoff bound is (3), now with the new multipliers. Its smaller crossing of $500/701$ lies strictly between $0.884776432209$ and $0.884776432210$. Consequently every unimodular pair of visible mass $0.88477644\le t\le\sqrt\pi/2$ satisfies $V<500/701$. The lower eight-decimal endpoint $0.88477643$ fails for this particular parabola. The binding mass near $0.848$ remains outside this unconditional interval.

## Positive remote energy on the upper visible-mass interval

Let $u=\|q\|^2$. Every unimodular pair with $0.81\le t\le\mu$ and $u\le 3/5000$ satisfies $V<500/701$. Both the cubic and quintic fields may have arbitrary other components. For the following rows $g_*\ge\ell-2\beta>\eta\sqrt\pi$, so (2) absorbs the entire quintic square. Put $B_0=2\beta^2/e+M_*$.

**The cubic Schur complement.** Write $G_3=\sum_{a=0}^2\sum_{b=0}^1 e_{ab}(z)r_{ab}$, with remote bidegrees $(2-a,1-b)$, and $J_j=\mathbb E[w(T)T^j]$. The cubic contribution is bounded by
\[
 \inf_{\xi\in H_{1,0}}\{\mathbb E[w|G_3-C-\xi|^2]+\|\xi\|^2\}
 -\|G_3\|^2/e + (b_A^2+b_B^2)u/\eta.
\]
Write $\xi=cz+d$, with $d$ remote linear. Radiality of $w$ makes different visible angular frequencies orthogonal. Different remote bidegrees are orthogonal as well. Thus $d$ couples only to $r_{11}$, through $\mathbb E[w(T)(T-1)]=J_1-J_0$, and $c$ couples only to the scalar $r_{21}$, through $(J_2-2J_1)/\sqrt2$. Completing the two squares gives denominators $1+J_0$ and $1+J_1$, respectively. Although $C$ shares $q$ with the remote cubic, that shared component is precisely $(1-b_A(T-1))q$; the $\bar q e_{20}$ component has a distinct angular frequency and is orthogonal to $e_{20}r_{20}$ by remote degree. Consequently, with $R_i$ equal to the displayed coefficient minus $1/e$ in each row of the table,

| Component | Coefficient before subtraction of $1/e$ |
|---|---|
| $q=r_{00}$ | $(1+b_A)^2J_0-2b_A(1+b_A)J_1+(b_A^2+b_B^2/2)J_2+(b_A^2+b_B^2)/\eta$ |
| $r_{11}$ | $J_2-2J_1+J_0-(J_1-J_0)^2/(1+J_0)$ |
| $r_{21}$ | $(J_3-4J_2+4J_1)/2-(J_2-2J_1)^2/[2(1+J_1)]$ |
| $r_{10},r_{01}$ | $J_1$ |
| $r_{20}$ | $J_2/2$ |

we obtain $V\le t^2-2\ell t+B_0+\sum_{a,b}R_{ab}\|r_{ab}\|^2$. This step uses Gaussian orthogonality and does not impose independence between the remote coefficients.

**Two rows suffice.** The selected rational row parameters $(\ell,\beta,b_A,b_B)$ in millionths are $(842397,147989,-51554,-27777)$ for `.845`, and $(869173,156715,-53492,-28642)$ for `.860`. On both rows $R_{00}<1.431$ and all the other $R_{ab}$ are negative. On $[.81,.86]$ use `.845`; on $[.86,.886227]$ use `.860`. The quadratic in $t$ is convex and $\mu<.886227$, so it suffices to check the two endpoints of each interval with $u=.0006$. Using the computed upper endpoints of $R_{00}$ leaves margins above $10^{-5}$ and $8\cdot10^{-5}$ on the respective intervals. At $t=.81$, replacing $.0006$ by $.001$ already makes the `.845` tangent expression exceed the target. This last check concerns the tangent majorant only.

**Exact integration bounds.** `python3 -IB verify_schur.py` certifies these two rows. `--all-rows` certifies all eighteen selected row signs from `.740` to `.886`. The input rows are exact rationals read from the committed row file linked above. Substitute $T=r^2$ to obtain $J_j=2\int_0^\infty e^{-r^2}r^{2j}/g(r^2)\,dr$. On $[0,8]$ the replay uses intervals of width $1/16384$ with separate monotone endpoint bounds for each nonnegative factor. Consecutive exponential values have ratio $e^{-v}$, $v=(2i+1)/16384^2<1$; its cubic and quadratic Taylor truncations bound it below and above. Fixed-point integer operations round the lower endpoints down and the upper endpoints up. For $T\ge64$, use $T^{j-1/2}\le T^j$, $g\ge\ell-2\beta$ and $e^{-64}<2^{-64}$ in the exact incomplete-gamma polynomial. The square-root constant is bracketed by $333/106<\pi<355/113$. The optional rows verify $R_{21}<-.29$ and $R_{20}<-.32$ throughout, $R_{10}=R_{01}<0$ from `.810`, and $R_{11}<0$ from `.845`; the signs on the preceding rows are checked too. On `.840` the lower bound on $R_{11}$ is positive, so the term on $r_{11}$ cannot be discarded by its sign. On each of the eighteen rows the lower bound on $R_{00}$ exceeds $1.27$, so the same sign argument cannot discard the term on $q$.

## Reproduce the bounds

From the repository root run the following commands. Both scripts use only the Python standard library.

```sh
python3 -IB research/higher-degree/code/quintic-tangent-codex-a7c4/verify.py
python3 -IB research/higher-degree/code/quintic-tangent-codex-a7c4/verify_schur.py --all-rows
```

The first script checks the twelve Wick moments, stability on the published rows and both endpoint parabolas. It brackets $\mu$ by Machin's formula, alternating arctangent series and directed integer square roots. The second script bounds four radial integrals with outward rounding. The estimates cover part of the domain of the capped degree-five game. Its full payoff bound and the corresponding improvement to the Grothendieck lower bound remain open.
