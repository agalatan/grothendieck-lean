# A 26-coordinate cubic with dimension times fourth excess below 13

Agent-ID: codex-a7c4. Task [#766](https://github.com/agalatan/grothendieck-lean/issues/766).

For a nonzero remote complex Wick cubic $q\in H_{2,1}(\mathbb C^m)$ write $u=E|q|^2$, $\chi(q)=E|q|^4/u^2-2$, $b_m=\min_q\chi(q)$, and $\beta=\inf_m m b_m$. An explicit cubic below gives
$$
 12\le\beta\le\frac{91813293}{7123561}<12.889 .
$$
For the lower bound the influence matrix in 6.3.32 has trace $3u$ and squared Hilbert–Schmidt norm at most $3u^2\chi/4$. Apply Cauchy–Schwarz to its $m$ eigenvalues. In the capped retained peak problem $\beta$ is the dimension factor multiplying $-u_*^2 B''(u_*)/4$ in the leading finite-dimensional gap. [Influence estimate, T7](../influence-calculus-2026-11-16/README.md) · [Peak asymptotics](../peak-window-codex-a7c4/RIGIDITY.md)

## A finite-dimensional lower estimate

For every nonzero $q$ on $m$ remote coordinates,
$$
 m\chi(q)\ \ge\ 12+\frac{12}{m+1}.
$$
In particular $90/91\le b_{13}\le1$. Normalize $F=\sqrt{2/u}\operatorname{Re}q=I_3(f)$ to variance one in the real Gaussian space of dimension $d=2m$. Circularity gives $\kappa_4(F)=3\chi/2$ and $6\|f\|^2=1$. Put $M=f\otimes_2 f$ and $N=\operatorname{sym}(f\otimes_1 f)$. The third-chaos product identity gives $\kappa_4(F)=1296\|M\|^2+1944\|N\|^2$. The positive matrix $M$ has trace $\|f\|^2$, so $\|M\|^2\ge \|f\|^4/d$.

Use the symmetric tensor $J_{ijkl}=(\delta_{ij}\delta_{kl}+\delta_{ik}\delta_{jl}+\delta_{il}\delta_{jk})/3$. Direct contraction gives
$$
 \|J\|^2=d(d+2)/3,\qquad
 \langle N,J\rangle=(\|\operatorname{tr} f\|^2+2\|f\|^2)/3 ,
$$
where $(\operatorname{tr}f)_k=\sum_i f_{iik}$. Projecting onto $J$ gives $\|N\|^2\ge 4\|f\|^4/[3d(d+2)]$. Consequently $\kappa_4(F)\ge36/d+72/[d(d+2)]$, which gives the claim after substituting $d=2m$. [Product identity and normalization](../third-chaos-2026-11-16/gpt/cum3_proof.md)

## Two independent starting blocks

Use the twelve-coordinate cubic $R_4$ on three independent blocks of four proper complex Gaussians from the [three-cluster construction](../../../higher-degree/sources/kappa-three-cluster-2026-11-17/NOTE.md). It is trilinear over the reals, has energy $16$ and fourth moment $800$. Let $T_X,T_Y,T_Z$ be the three squared radii and put $A=T_X+\omega^2 T_Y+\omega T_Z$, where $\omega=e^{2\pi i/3}$. The radii are independent $\Gamma(4,1)$ variables with scale one. Consequently $EA=EA^2=0$, $E|A|^2=12$, and $EA^3=24$. For a fresh proper Gaussian $D$, take
$$
 S=\sqrt3 R_4+D A.
$$
The [archived thirteen-coordinate proposition](../manuscript/legacy/ch15-weighted-content.tex) gives $E|S|^2=60$ and $E|S|^4=10800$ by scaling its witness at $a^2=1/3$. One can also compute these moments directly. For $R_4$ the conditional mean of $|R_4|^2$ at fixed radii is $T_XT_YT_Z/4$, by trilinearity and its energy. Size-biasing all three gamma variables raises their shape from four to five, hence $E|R_4|^2|A|^2=16\cdot15=240$. The fourth cumulant of a single radius is $24$, so $E|A|^4=2\cdot12^2+3\cdot24=360$. Integrating over the proper $D$ gives $9\cdot800+12\cdot240+2\cdot360=10800$. Thus $13\chi(S)=13$. The earlier twelve-coordinate witness has $12\chi(R_4)=27/2$. The squared radii in $A$ have zero total constant term, so $DA$ is pure third chaos. The moments of the archived block are independently checked by the [three-sphere verifier](../../../higher-degree/code/kappa-spheres-gemini-21d5/verify_kappa_spheres.py) and the displayed Gamma computation.

Take two copies numbered $1,2$ with independent original coordinates, including $D_1,D_2$. Introduce two standard independent proper Gaussian coordinates $U,V$ via
$$
 D_1=(U+\overline V)/\sqrt2,\qquad D_2=(U-\overline V)/\sqrt2.
$$
This is an orthogonal change of the four underlying real coordinates. For the new complex structure define
$$
 B=\sqrt3(R_{4,1}+R_{4,2})
   +\big[U(A_1+A_2)+V(\overline A_1-\overline A_2)\big]/\sqrt2,\qquad
 P=2\sqrt2\,\overline U V^2,\qquad Q_t=B+tP .
$$
All terms have bidegree $(2,1)$ and are Wick cubics. The $A_i$ are centered Hermitian quadratics, and $U,V$ and the two triples of blocks are independent. While the complex fields have changed, $F=\operatorname{Re} B$ equals $\operatorname{Re}(S_1+S_2)$ pointwise. Every $Q_t$ is circular by its charge. Thus $E|Q_t|^2=2E(\operatorname{Re}Q_t)^2$ and $E|Q_t|^4=(8/3)E(\operatorname{Re}Q_t)^4$.

## The moment polynomial

Put $J=\operatorname{Re}P$. The complete mixed moment computation is
$$
\begin{array}{c|ccccc}
 & EF^4 & EF^3J & EF^2J^2 & EFJ^3 & EJ^4\\ \hline
 &13500&36&624&0&1152 .
\end{array}
$$
Independence of $S_1,S_2$ and their fourth moments give $EF^4$. Conditionally on $D_1,D_2$, the two real variables $\operatorname{Re}S_i$ are centered. Their variances are $24+6|D_i|^2$, since $R_{4,i}$ is circular and its mixed moment with any radial function vanishes by the sign of one whole input block. Hence $E[F\mid U,V]=0$, $E[F^2\mid U,V]=48+6(|U|^2+|V|^2)$, and $EFJ=EFJ^3=0$. For $J=\operatorname{Re}(2\sqrt2\,\bar U V^2)$, integration over the phases and $E|U|^{2k}=k!$ give $EJ^2=8$, $E[(|U|^2+|V|^2)J^2]=40$, and $EJ^4=1152$.

For the signed term use $P=(\bar D_1+\bar D_2)(\bar D_1-\bar D_2)^2$. Only terms of degree three in $D_1,D_2$ from $F^3$ pair with $J$ under their common phase. In particular all factors of $R_{4,i}$ drop out of this pairing. The mixed monomials from $P$ vanish by independence and $EA_i=0$. Each pure monomial contributes
$$
 E\big[(\operatorname{Re}(D_i A_i))^3\operatorname{Re}(\bar D_i^3)\big]
   =\tfrac18 E|D_i|^6\,\operatorname{Re} EA_i^3=18.
$$
This gives the nonzero coefficient $36$. Expanding in real moments now yields
$$
 E|Q_t|^2=120+16t^2,\qquad
 E|Q_t|^4=36000+384t+9984t^2+3072t^4 .
$$
An independent sum of two optimal archived blocks has $26\chi=13$. In the new coordinates the added monomial changes its fourth moment to first order and its energy only to second order. Taking $t=-6/23$ gives $26\chi=91813293/7123561$, proving the bound. Independent copies of this witness yield the same dimension-times-excess in every dimension divisible by 26. [Exact moment replay](../../code/paired-cubic-codex-a7c4/verify.py)

## Optimality within the original radial-driver family

Keep a single $R=R_4/4$ of unit variance and let $x_i=(T_i-4)/2$ for the three radii. For any number of fresh independent proper drivers $D_j$ and complex linear forms $h_j$ of the real vector $x$, consider
$$
 G=\sqrt v\,R+\sum_j D_j h_j(x).
$$
Write $\sum_j|h_j(x)|^2=x^\top C x$ with $C\succeq0$ real symmetric, and $w=\operatorname{tr}C$. We claim $\chi(G)\ge1$ for every nonzero $G$. The mixed example attaining $13\chi=13$ above is optimal in this family, even with freely chosen linear forms and any number of drivers.

The radial conditional mean of $|R|^2$ is $T_XT_YT_Z/64$ by real trilinearity and the independence of directions and radii. Weighting by this product moves each radius independently to $\Gamma(5,1)$, so under the weight each $x_i$ has mean $1/2$ and variance $5/4$. Unweighted, the $x_i$ have mean zero, unit variance and fourth cumulant $3/2$. Conditioning first on the original blocks and integrating the proper Gaussian drivers gives
$$
 \delta=E|G|^4-2(v+w)^2
 =\tfrac98 v^2+v(w+\mathbf1^\top C\mathbf1)+4\operatorname{tr}(C^2)+3\sum_i C_{ii}^2.
$$
Averaging $C$ over coordinate permutations preserves $w$ and $\mathbf1^\top C\mathbf1$ and decreases the two convex square terms. For $w>0$, put $p=\mathbf1^\top C\mathbf1/(3w)\in[0,1]$. The averaged matrix has eigenvalues $wp,w(1-p)/2,w(1-p)/2$. Substitution shows
$$
 \delta-(v+w)^2\ \ge\ v^2/8+(3p-1)vw+(2-4p+6p^2)w^2 .
$$
If $p\ge1/3$ all terms are nonnegative. For $p\le1/3$ the right side is $(v-4(1-3p)w)^2/8+4p(2-3p)w^2$. At $w=0$ the claim follows from $\chi(R)=9/8$. Equality is attained with a single complex driver, $p=0$, the averaged matrix proportional to the projection onto $\mathbf1^\perp$, and $v=4w$. The two-block construction uses an additional term cubic in the drivers themselves. This is the term responsible for breaking the bound.
