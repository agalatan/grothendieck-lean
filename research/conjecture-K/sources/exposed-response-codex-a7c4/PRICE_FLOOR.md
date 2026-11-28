# A finite response excludes every peak-ray price at least the original price

Agent-ID: codex-a7c4. Task #795. **P + C, author only.** Write $p_0=2500/1891$, $\varepsilon=94/125$, $m_0=\varepsilon p_0$, and $T_*=.713245$. For every $0\le t\le.82957$ there is an actual unimodular response in at most $3{,}000{,}002$ complex coordinates whose **retained peak-ray row before any further response-square credit** is strictly greater than $T_*$ for every scale $m\ge m_0$. This family has no even or odd drivers and has normalized remote fourth excess $6\cdot10^{-6}$. There is no energy cutoff in the assertion. It identifies a limit of paying all odd sectors by the original common price $m/\varepsilon\ge p_0$.

## Finite realization

Take $N=10^6$ independent triples of standard proper Gaussians and let $T_N=N^{-1/2}\sum_j A_j B_j\overline{C_j}$. Let $v=.0403448$ and $e=m_0^2 v$. Put $S_N=N^{-1}\sum_j|B_j|^2|C_j|^2$, with $ES_N=1$ and $\operatorname{Var}S_N=3/N$. Conditional on all $B,C$, $T_N$ is proper Gaussian of variance $S_N$. Its normalized excess is $2\operatorname{Var}S_N=6/N$. The disjoint-triple construction of 3.5a realizes physical projection $\sqrt e\,T_N$ at the prescribed $t$, since the checker verifies $t^2+e/[\varepsilon(1-3/(2N))]^2<\pi/4$ at the largest $t$. It uses one visible and one auxiliary unimodularizing coordinate. [Finite construction and its torus symmetries](../buffered-rice-codex-a7c4/PROOF.md)

The two absolute values and the squared trial norm are convex functions of the first-chaos trial. Averaging over the block torus and the rotation of the auxiliary coordinate leaves only a multiple of the visible $Z$. Negating all remote coordinates then negates $T_N$, which exchanges the two terms when the trial coefficient changes sign. Averaging these two choices gives the minimum at zero. Consequently the exact retained row value is
$$
F_t(m)=t^2-2m\ell_0t+2m^2\beta_0^2/\varepsilon
          +m\,E B(e S_N/m^2)-e/\varepsilon ,
$$
where $B(v)=2E|L+\sqrt v W|$, $L=Z(.5592+.1432|Z|^2)$, $\ell_0=.8456$ and $\beta_0=.1432$. It is convex in $m>0$ because the nonquadratic term also equals $2E|mL+\sqrt e\,T_N|$.

## A finite two-point test

The peak maximum $S=\sup_{u\ge0}(B(u)-p_0u)$ lies between $1.3739535256614$ and $1.3739535256616$, with stationary maximizer $u_*\in[.0403448,.0403449]$. The radial profile $h(s)=2E|L+\sqrt s|$ satisfies $-1.673\le h''\le0$ everywhere. Writing $B(u)=E h(u|W|^2)$ gives $-3.346\le B''\le0$, since $E|W|^4=2$. Taylor's inequality at $u_*$ and at $v$ gives
$$
E B(v S_N)\ge S+p_0 v-1.673(.0403449-v)^2-1.673\,v^2(3/N).
$$
The opposite estimate $E B(e S_N/m^2)\le S+p_0e/m^2$ holds at every $m$. These two estimates at $m_0$ and $m_1=.99$ give at $t=.82957$
$$
 F_t(m_0)-T_*>122129/10^{12},\qquad
 F_t(m_0)-F_t(m_1)>107220599/10^{12}.
$$
The first increases as $t$ decreases because $m_0\ell_0>.82957$. The second increases because $m_0>m_1$. Convexity makes the secant slope on every interval to the right of $m_0$ positive. Thus the same finite response at a given $t$ excludes the whole half-ray of prices, including $m_0$. This leaves open using a cheaper odd-sector estimate or an actual-response square to prove the target there. [Peak maximum and optimizer](../../MONOGRAPH.md) · [Radial curvature](../peak-window-codex-a7c4/PROOF.md) · [Exact replay](../../code/exposed-response-codex-a7c4/price_floor.py)
