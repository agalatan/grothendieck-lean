# A conditional-moment bound for the degree-five game through visible amplitude 0.65

Author codex-a7c4. Research status **P + C, author only**. Task [#835](https://github.com/agalatan/grothendieck-lean/issues/835). The conditional-moment inequality in §2 is analytic and unconditional. The full remote-energy result in §1 uses the five buffered-radius rows specified in §4 from [#832](https://github.com/agalatan/grothendieck-lean/pull/832) and the independently reviewed unbuffered radius. The [exact verifier](../../code/quintic-conditional-debit-codex-a7c4/verify.py) checks the integration and the scalar comparisons. The result concerns one part of the [degree-five witness problem](../degree5-attack-2026-11-25/problems/P3-mid-t-direct-bound.md).

## 1. Statement

Let $f,g$ be unimodular functions of finitely many independent standard proper complex Gaussians, with $\mathbb E|Z|^2=1$. Write $P_{i,j}$ for the orthogonal projection onto complex Wiener chaos of bidegree $(i,j)$ and $\langle u,v\rangle=\mathbb E[\bar u v]$. Set $h=(f+g)/2$, $k=(f-g)/2$. Choose the visible coordinate $Z$ so that the **whole** linear projection is $P_{1,0}h=tZ$, $t\ge0$. When $t=0$, any visible coordinate works. Write $P_{2,1}k=R+H$, where $R$ is the orthogonal projection onto cubics depending only on coordinates other than $Z$. Both $R$ and $H$ are **unpriced**. Put $\sigma=\|R\|_2$, $\varepsilon=39/50$, $\eta=779/10000$ and
$$V=\operatorname{Re}\langle f,(P_{1,0}-\varepsilon P_{2,1}+\eta P_{3,2})g\rangle.$$

At target $1.4025$, (1) below gives the following regions for arbitrary finite-dimensional pairs directly, using only the proved two-coordinate inequality. Here both energy assumptions refer to the actual response pair.

| $t$ | $\|R\|_2$ | $\|H\|_2^2$ |
|---:|---:|---:|
| $[0,.65]$ | $[0,.58]$ | $[0,.030]$ |
| $[0,.70]$ | $[0,.53]$ | $[0,.005]$ |
| $[0,.80]$ | $[0,.28]$ | $[0,.005]$ |

To obtain each row, substitute its four $(t,\sigma)$ corners and its maximum mixed energy in (1), using $D>2.575$ from §3. The right side is convex in each coordinate. These regions are unconditional. The extra radius information in §4 allows the restriction on $\|R\|_2$ to be removed for smaller mixed energies.

Assuming the buffered rows of §4, uniformly for $0\le t\le13/20$,
$$V < 0.71035662725+0.7021\,\|H\|_2^2.$$
In particular $V<10000/14023$ if $\|H\|_2^2\le39/10000$, and $V<10000/14025$ if $\|H\|_2^2\le3/800$. These tolerances permit arbitrary orientations of the mixed or visible cubic. The unrestricted-energy case and assembly of a global Grothendieck lower bound remain open.

## 2. Conditional geometry and retained energy

Take $q=R/\sigma$ when $\sigma>0$. Otherwise take any unit remote cubic, adjoining an unused coordinate if necessary. Conditioning on $Z$ and integrating out the remote variables $y$, put
$$A=\mathbb E_y h,\qquad C=\mathbb E_y[\bar q k].$$
Conditional Cauchy–Schwarz and $|h|^2+|k|^2=1$ give $|A|^2+|C|^2\le1$. For $\lambda\ge0$ independently choose the phases of the two scalar tests to attain $|A|+\lambda|C|$. Substituting $h,k$ and bounding the two pairings pointwise by unimodularity gives
$$|A|+\lambda|C|\le\mathbb E_y M(\lambda|q|),\qquad M(r)=\frac1{2\pi}\int_0^{2\pi}|1+r e^{i\phi}|\,d\phi.$$
Indeed the two tests involve $1\pm\lambda q$ up to phases. The law of $q$ is circular by simultaneous rotation of all remote coordinates.

For $0\le r<1$, $M(r)=\sum_{j\ge0}\binom{1/2}{j}^2r^{2j}$ by binomial expansion and angular integration. By continuity and monotone convergence $M(1)=4/\pi$. Thus $M(r)\le1+(4/\pi-1)r^2$ for $r\le1$. For $r\ge1$, $M(r)=r M(1/r)\le r+(4/\pi-1)/r$. As $4/\pi-1<8/27<5/16$ and
$$5r^3/16-r^2+r-8/27=(r-4/3)^2(5r/16-1/6)\ge0\qquad (r\ge1),$$
it follows that $M(r)\le1+5r^2/16$ on the whole ray. Since $\mathbb E|q|^2=1$, the pair $(A,C)$ belongs to the closed convex set
$$K=\{(x,y)\in\mathbb C^2: |x|^2+|y|^2\le1,\quad |x|+\lambda|y|\le1+5\lambda^2/16\quad(\lambda\ge0)\}.$$

With $T=|Z|^2$, take the unit pure visible cubic $p=Z(T-2)/\sqrt2$ and quintic $e=Z(T^2-6T+6)/\sqrt{12}$. Write $b=\langle e,h\rangle$. For real $a,c,w,g_1$ choose the two trial fields
$$F=aZ+b e+\sqrt2\,c\,p,\qquad G=w+g_1(T-1).$$
Then, for $D=\mathbb E\operatorname{dist}((F,G),K)^2$,
$$
 V\le (1-\eta)t^2+\eta+(\varepsilon-\eta)(\sigma^2+\|H\|_2^2)
 -\eta\{D-(a-t)^2-(w-\sigma)^2-2(1+\eta/\varepsilon)c^2-2g_1^2\}. \tag{1}
$$
To verify the signs put $h_0=h-tZ-P_{3,2}h$ and $k_0=k-R-H$. Self-adjointness and orthogonality give the exact amount subtracted from the first three terms of (1) as
$$\eta(\|h_0\|_2^2+\|k_0\|_2^2)+\varepsilon\|P_{2,1}h\|_2^2+\|P_{1,0}k\|_2^2+\eta\|P_{3,2}k\|_2^2.$$
Conditional projection sends $h_0$ to $A-tZ-b e$. It sends $k_0$ to $C-\sigma$ because every visible or mixed term of $H$ has remote degree below three and is conditionally orthogonal to $q$. These are contractions. The first residual is orthogonal to $Z,e$, the second to $1$. Set $\alpha=\langle p,h\rangle$, $\gamma=\langle(T-1)q,k\rangle$. The second test is unit in $\mathcal H_{3,2}$ by independence and $\|T-1\|_2=1$. Expand $\|A-F\|_2^2+\|C-G\|_2^2\ge D$. Completing the squares in $\varepsilon|\alpha|^2+2\eta\sqrt2\,c\operatorname{Re}\alpha$ and $\eta|\gamma|^2+2\eta g_1\operatorname{Re}\gamma$ gives the penalties in (1). In particular the coefficient of $\|H\|_2^2$ is $\varepsilon-\eta$.

## 3. Exact scalar integration

Choose $(a,c,w,g_1)=(1.79,0.65,0.93,0.185)$. To bound $D$ from below set $r=|Z|$, $B=\operatorname{Re}(b)/\sqrt{12}$, and
$$X=r[a+c(r^2-2)+B(r^4-6r^2+6)],\qquad Y=w+g_1(r^2-1).$$
The real part after visible phase rotation has $|X|\le|F|$. Since $|b|\le\|h\|_2\le1$, the checker may enlarge the domain to $-1\le B\le1$. Distance to the ball and to each supporting half-space gives the convex nonnegative lower integrand
$$L(X,Y)=\max\left\{(\sqrt{X^2+Y^2}-1)_+^2,\quad
 \frac{(|X|+\lambda |Y|-1-5\lambda^2/16)_+^2}{1+\lambda^2}:\quad \lambda=1/5,2/5,\dots,7/5\right\}.$$
Indeed distance to $K$ dominates each distance, and the scalar expression increases with both absolute coordinates.

The density of $r$ is $2r e^{-r^2}$. On each bin $[l,u]$ of width $1/64$ in $[0,6]$, use the lower measure $2r e^{-u^2}(1+u^2-r^2)\,dr$, by $1+x\le e^x$. Drop the nonnegative tail. The mass factor $e^{-u^2}$ is bounded below successively using the degree-seven odd Taylor polynomial of $e^{-(u^2-l^2)}$ and downward rational rounding. Under the normalized polynomial weight on each bin, the means of $X,Y$ use only the exact moments of $r,r^2,r^3,r^5$. Jensen gives a lower bound by bin mass times $L(\mathbb E X,\mathbb E Y)$. Directed rounding and integer square roots preserve this direction. The comparator covers the entire closed interval $[-1,1]$ of $B$ by dyadic subdivision. Every accepted interval exceeds $2.575$ after summing the contributions. The replay takes 260 accepted tilt intervals, giving $D>2.575$ uniformly.

## 4. Buffered inputs and payoff comparison

For a unit remote cubic $q$ and $s>0$, a uniform buffered bound $\mathbb E|Z+\sqrt s q|\le r_s$ yields $t+\sqrt{s}\,\sigma\le r_s$. To see this, test $h$ against $Z$ and $k$ against $\sqrt{s}q$, substitute $h,k$, and apply unimodularity and circular symmetry. This argument applies with arbitrary $H$. The imported rows and their uses are

| Visible amplitude $t$ | $s$ | $r_s$ |
|---|---:|---:|
| $[0.20,0.32]$ | $9/2$ | $2145169/1000000$ |
| $[0.32,0.405]$ | $3$ | $904813/500000$ |
| $[0.405,0.49]$ | $2$ | $77577/50000$ |
| $[0.49,0.55]$ | $3/2$ | $1409699/1000000$ |
| $[0.55,0.65]$ | $1$ | $627047/500000$ |

On $[0,0.20]$ use $\sigma\le\mathbb E|q|\le2287/2500$ from the reviewed radius bound. There and on the next four rows, drop the nonnegative residual energy in §2. The pure-remote comparison is at most $(1-\eta)t^2+\eta+(\varepsilon-\eta)(r_s-t)^2/s$ on each buffered row and uses $(2287/2500)^2$ for the unbuffered energy. These functions are convex in $t$. Their endpoint maxima, rounded up, are respectively $0.702343,0.705123,0.691640,0.694883,0.702776$.

On $0.55\le t\le0.65$ use (1) on the entire region $0\le\sigma\le1.254094-t$. On each fixed $t$ the upper polynomial is convex in $\sigma$, so check both $\sigma=0$ and $\sigma=1.254094-t$. Both give convex quadratics in $t$, hence checking the four vertices suffices. Substituting $2.575$ for $D$, the largest constant term in $V-(\varepsilon-\eta)\|H\|_2^2$ is
$$\frac{26638373521853}{37500000000000}<0.71035662725,$$
attained by the scalar comparison at $t=0.65$, $\sigma=0.604094$. The exact corner bounds give clearances greater than $0.00001935$ and $0.00002297$ at the two targets. The same four-corner calculation proves the estimate on this trapezoid for every physical pair satisfying $\sigma\le1.254094-t$, independently of the proof of the buffered radii.

For comparison, dropping the debit gives $0.7132992604>500/701$ at $t=0.618$, $\sigma^2=0.4034$, $H=0$. At the last vertex it gives $0.7237042946629556>10000/14023$ even with $H=0$. These controls concern the discarded-energy estimate. They make no assertion that an actual unimodular pair attains either estimated payoff.

Run the [checker](../../code/quintic-conditional-debit-codex-a7c4/verify.py) from the repository root with `python3 -IB research/higher-degree/code/quintic-conditional-debit-codex-a7c4/verify.py`.
