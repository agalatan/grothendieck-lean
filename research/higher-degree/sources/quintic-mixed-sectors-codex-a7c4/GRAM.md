# A degree-five payoff bound with five unrestricted cubic sectors

Agent-ID: codex-a7c4. **P + C, author only.** Let $P_{i,j}$ denote orthogonal projection onto complex Wick chaos of bidegree $(i,j)$ in a finite standard proper complex Gaussian space. For a measurable unimodular pair $f,g$, set $h=(f+g)/2$, $k=(f-g)/2$. Choose a unit visible coordinate $Z$ with $P_{1,0}h=tZ$, $t\ge0$. At $t=0$ any unit visible coordinate works. Write $Y$ for the remaining Gaussian coordinates and set
$$
 \varepsilon=39/50,\qquad \eta=779/10000,\qquad
 V=\operatorname{Re}\langle f,(P_{1,0}-\varepsilon P_{2,1}+\eta P_{3,2})g\rangle,\qquad
 x_{00}=\|\mathbb E[P_{2,1}k\mid Y]\|_2^2 .
$$
The inner product is $\langle u,v\rangle=\mathbb E[\bar u v]$. The remote energy $x_{00}$ is measured before multiplication by $\varepsilon$.

**Theorem.** Throughout each closed rectangle below, $V<10000/14025$. The other five components of $P_{2,1}k$ may have arbitrary energies, orientations and shared coordinates. The last column gives lower bounds on $10^{12}(10000/14025-V)$.

| $0\le t\le$ | $0\le x_{00}\le$ | Clearance in trillionths |
|---:|---:|---:|
| .65 | .096217 | 177670 |
| .75 | .057095 | 208920 |
| .81 | .030939 | 286745 |
| .85 | .012384 | 299377 |
| .86 | .007606 | 121996 |
| .87 | .002771 | 370557 |
| .875 | .000333 | 319267 |

**All amplitudes at small remote energy.** For $x_{00}\le5/3042$ the second rectangle covers $0\le t\le .75$. The existing free-tangent estimate covers $.6863\le t\le\sqrt\pi/2$ at the same target and priced energy $u=\varepsilon^2 x_{00}\le .001$. Indeed $(39/50)^2(5/3042)=1/1000$. The intervals overlap and $t=|\langle Z,h\rangle|\le\mathbb E|Z|=\sqrt\pi/2$. The free-tangent estimate was [independently reviewed in #831](https://github.com/agalatan/grothendieck-lean/pull/831#issuecomment-7232433349). A separate weight extends the all-amplitude allowance to $x_{00}\le .003113$. [Free-tangent table and proof](../quintic-node-pilot-codex-a7c4/FREE_TANGENT.md) · [Stronger all-amplitude estimate](SHOULDER.md)

## 1. Conditional moments and their energies

Let $e_{ij}(Z)$ denote the unit one-coordinate Wick polynomial. Tensor-product orthogonality gives
$$
 P_{2,1}k=\sum_{i=0}^2\sum_{j=0}^1 e_{ij}(Z)Q_{ij}(Y),
 \qquad Q_{ij}\in\mathcal H_{2-i,1-j}(Y),\qquad x_{ij}=\|Q_{ij}\|_2^2 .
$$
For $x_{ij}>0$ take $v_{ij}=Q_{ij}/\sqrt{x_{ij}}$ and $F_{ij}(Z)=\mathbb E_Y[\bar v_{ij}k]$. Omit slots of zero energy. The six remote bidegrees are distinct, so the $v_{ij}$ are orthonormal even if their coordinate supports overlap. Testing in the direction of the whole vector $Q_{ij}$ captures its full energy in $\langle e_{ij},F_{ij}\rangle=\sqrt{x_{ij}}$, regardless of the dimension of its remote bidegree. With $A(Z)=\mathbb E_Yh$, conditional Bessel and the pointwise phase identity $|h|^2+|k|^2=1$ give
$$
 |A(Z)|^2+\sum_{ij}|F_{ij}(Z)|^2\le1,\qquad \langle Z,A\rangle=t .
 \tag{1}
$$

Retain the upper moment $\gamma_{ij,+}=\langle e_{i+1,j+1},F_{ij}\rangle$ for each slot and the lower moment $\gamma_{ij,-}=\langle e_{i-1,j-1},F_{ij}\rangle$ when $i,j\ge1$. Multiplication by the unit remote direction $v_{ij}$ puts the tests in the global quintic and first chaos respectively. Different slots remain orthogonal within each global projection. Thus their squared coefficients are jointly bounded by $\|P_{3,2}k\|^2$ or $\|P_{1,0}k\|^2$. In the average field retain $\alpha=\langle e_{2,1},A\rangle$ and $b=\langle e_{3,2},A\rangle$. Separating the purely visible part of $h$ gives
$$
 \|P_{3,2}h\|^2\le |b|^2+\|h\|^2-\|A\|^2 .
$$
Self-adjointness gives $V=\langle h,Th\rangle-\langle k,Tk\rangle$ for the displayed game operator $T$. In this identity insert the quintic bound, $\|h\|^2=1-\|k\|^2$ and $\|k\|^2\ge\sum\|F_{ij}\|^2$. These inequalities yield
$$
 V\le\eta+t^2+\varepsilon\sum x_{ij}
 -\eta\left(\|A\|^2+\sum\|F_{ij}\|^2\right)+\eta|b|^2
 -\varepsilon|\alpha|^2-\sum_{ij}\left(\eta|\gamma_{ij,+}|^2+|\gamma_{ij,-}|^2\right).
 \tag{2}
$$
Absent lower moments contribute zero. In particular the visible quintic of $h$ enters with a positive sign.

## 2. Weighted moment prices

Write $S=|Z|^2$, of exponential law with mean one. Set $L=.553$, $c=.1$, $w=(S+c)/(1+c)$. Multiplying (1) by $Lw$ and averaging bounds the additional total cost by $L$. The density in front of every squared conditional field in (2) becomes
$$
 D=\eta+Lw=Mw',\qquad M=L+\eta,\qquad w'=(S+c')/(1+c'),\qquad c'=c+\eta(1+c)/L .
$$
Use $G(u,v)=\mathbb E[\bar u v/w']$. For a difference field $F$ with primary test $u$ and unit adjacent tests $u_j$ of prices $d_j\in\{\eta,1\}$, any real trial coefficients $\beta_j$ give
$$
 \mathbb E[D|F|^2]+\sum_j d_j|\langle u_j,F\rangle|^2
 \ \ge\
 \frac{M|\langle u,F\rangle|^2}{G(p,p)+M\sum_j\beta_j^2/d_j},
 \qquad p=u-\sum_j\beta_j u_j .
 \tag{3}
$$
Decompose the primary pairing as $\langle p,F\rangle+\sum_j\beta_j\langle u_j,F\rangle$ and apply Cauchy–Schwarz in the direct sum of weighted $L^2$ and the finite coefficient space. This also treats complex moments with arbitrary phases.

For $A$ the cost is $\mathbb E[D|A|^2]-\eta|\langle e_{3,2},A\rangle|^2+\varepsilon|\alpha|^2$. The first two terms form a **positive** quadratic form because $D\ge\eta+Lc/(1+c)>\eta$ and $v=e_{3,2}$ has norm one. Inverting the rank-one subtraction adds a positive term to the dual norm. For $u=e_{1,0}$ and $p=u-\beta e_{2,1}$ the denominator of (3) becomes
$$
 G(p,p)+\frac{|G(p,v)|^2}{M/\eta-G(v,v)}+\frac{M\beta^2}{\varepsilon}.
 \tag{4}
$$
Indeed, conjugating the form by $D^{-1/2}$ leaves the identity minus the outer product of $\sqrt\eta D^{-1/2}v$, a vector of norm strictly below one. This proves the plus sign in (4) and positivity of its denominator.

## 3. Radial computation and rectangle endpoints

Let $m=\min(i,j)$ and $d=|i-j|$. The visible mode and its two neighbors have the common angular factor $e^{\mathrm i(i-j)\arg Z}$. Their unnormalized radial parts are $S^{d/2}(-1)^m L_m^{(d)}(S)$, of squared norm $N_m=(m+d)!/m!$. Removing the common phase retains the signs of all radial cross terms. In the checker, each trial coefficient multiplies the **unnormalized** neighboring mode. Formula (3) then uses numerator $MN_m$ and charges $M\beta_j^2 N_j/d_j$. In the visible-average row $N_0=1$, $N_1=2$, $N_2=3$. The raw visible cubic costs $2M\beta^2/\varepsilon$, and the rank-one denominator for the raw visible quintic becomes $3M/\eta-G(v_{\rm raw},v_{\rm raw})$.

Every Gram entry is affine in $J=\mathbb E[(S+c')^{-1}]$. Indeed $I_0=J$ and $I_k=\mathbb E[S^k/(S+c')]=(k-1)!-c'I_{k-1}$. The 100-mode generalized Laguerre resolvents for charges 0 and 1 bound $J$ and $1-c'J$ from below respectively. For either charge $d$, restricting the supremum of $\int_0^\infty[2p-(S+c')p^2]S^de^{-S}\,dS$ to polynomials of degree below 100 gives a lower bound by completing the square. The Jacobi matrix of multiplication by $S+c'$ has diagonal $c'+2j+1+d$ and squared off-diagonal $j(j+d)$ between modes $j-1$ and $j$. Its finite continued fraction supplies both rational bounds. The verifier evaluates each Gram self-pairing at both endpoints of the resulting $J$ interval. In (4) it separately upper-bounds the absolute cross term and the quintic self-pairing and checks the resulting denominator is positive. [Weighted-sector argument and resolvent derivation](../spiked-radius-sectors-codex-a7c4/PROOF.md)

The rational prices for $A,00,10,01,11,20,21$, rounded down in millionths, are respectively
$$
 892918,\quad396801,\quad780373,\quad780373,\quad876331,\quad1227351,\quad1146603 .
$$
All five nonremote prices exceed $\varepsilon=.78$. Summing (3) and (4) in (2) gives
$$
 V\le\eta+L+(1-p_A)t^2+(\varepsilon-p_{00})x_{00}.
$$
Both remaining coefficients are positive, so the upper right corner proves each closed rectangle. The checker uses the rational prices before rounding. Increasing any listed remote-energy cap by one millionth loses that corner test. Omitting the lower moment in slot $11$, or the upper moment in slot $10$, makes the price in that slot fall below $\varepsilon$. [Exact rational replay](../../code/quintic-mixed-sectors-codex-a7c4/sector_gram.py)
