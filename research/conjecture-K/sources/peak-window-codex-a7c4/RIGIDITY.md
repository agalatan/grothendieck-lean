# Which sequences approach the retained peak?

Fix the peak parameters and the two energy caps of the [peak theorem](PEAK.md). For a sequence of admissible cubics $G_n=q_n+H_n+O_n$, write $u_n=E|q_n|^2$, $V_n=\|H_n\|_2^2$ for the two even shells together, and $W_n=\|O_n\|_2^2$ for the three odd shells. Write $\chi_n=E|q_n|^4/u_n^2-2$ when $u_n>0$ and $g_n=S-\widehat\Lambda(G_n)$. Let $u_*$ be the unique maximizer of $\Phi$.

**Characterization.** $g_n\to0$ if and only if $u_n\to u_*$, $\chi_n\to0$, and $V_n+W_n\to0$. The excess condition applies from the first index after which $u_n>0$. Under these conditions $G_n$ converges in law to a centered proper complex Gaussian of variance $u_*$. Every sequence of first-chaos trials whose cost is within $o(1)$ of the minimum has norm tending to zero. Along a maximizing sequence the estimates are dimension independent:
$$
 |u_n-u_*|=O(\sqrt{g_n}),\qquad \chi_n+V_n+W_n=O(g_n).
$$

## Necessity

Suppress the sequence index. The signed exterior cover in 7.5.13 has finitely many strictly negative strip bounds. The central intermediate- and high-excess pieces of the [peak theorem](PEAK.md) also have uniform positive gaps. Thus $g\to0$ forces $.0354\le u\le .0456$ and $\chi<.0784$ eventually. Set $\delta=u^2\chi$, $\sigma=S-\Phi(u)$ and $D=B(u)-2E|L+q|$. On this rectangle 7.5.14 gives $g\ge\sigma+(41/125)D$ and $D\ge(75/4)\delta^{3/2}$. By 2.7c, $\sigma\ge(27/25)(u-u_*)^2$. This gives the energy rate and $\delta\to0$. Since $u\ge.0354$, eventually $\chi\le1/250$, where 3.19 gives $D\ge(7/50)\delta$. In particular $\delta\le(6250/287)g$ and $\chi=O(g)$. [Signed exterior verification](../../code/all-sector-transfer-gemini-c1de/verify.py) · [Diffuse comparison](../signed-score-coupling-codex-a7c4/SIX.md) · [Gaussian curvature](../gemini-plan-audit-2026-11-17/NOTE.md) · [Small-excess deficit, Theorem 1](../sliver-closure-2026-11-24-gemini-21d5/PROOF.md)

For the even energy, return to the trial before completing its squares in 7.5.14. With $\rho=.5053$, $d=1+\rho^2$, $R=r_A+\rho r_B$, $U=r_B-\rho r_A$, we have $\|R\|^2+\|U\|^2=dV$. The quadratic contribution to the payoff is at most $-kV$ with $k=.08d-.067502>.0329$. The linear contribution is at most $2(\sqrt d\|C\|+\|e\|)\sqrt V$, where $\|C\|^2\le(14/5)\delta^{3/2}$ and $\|e\|^2\le(3/100)\delta^{3/2}$. Therefore, with $a_0=\sqrt{14d/5}+\sqrt{3/100}$, Young's inequality gives
$$
 (k/2)V\le g-\sigma-D+(2a_0^2/k)\delta^{3/2}.
$$
This gives $V=O(g)$. [Uncompleted trial and score estimates](../signed-score-coupling-codex-a7c4/SIX.md)

For the odd energy let $J(F)=E|L+F|+E|L-F|$. With $t=1/100$, convexity yields
$$
 J(q+H+O)\le tJ(q+H/t)+(1-t)J(q+O/(1-t)).
$$
On the low-excess rectangle the raw two-even-shell estimate allows arbitrary driver amplitudes, so $J(q+H/t)\le B(u)-.037D+pV/t^2$. The odd-core theorem gives $J(q+O/(1-t))\le B(u)-D+(32/25)W/(1-t)^2$. Here the visible sign change identifies the raw paired moment with the centered odd increment about $L+q$. The zero trial bounds the retained functional by $J(G)-p(u+V+W)$. Since $\sigma,D\ge0$, we obtain
$$
 \left(p-\frac{32}{25(1-t)}\right)W\le g+p(t^{-1}-1)V.
$$
The coefficient on the left is $5452/187209>0$, so $W=O(g)$. All five shells therefore vanish in $L^2$. [Raw two-shell estimate, final section](../signed-score-coupling-codex-a7c4/PROOF.md) · [Odd-core estimate, equation (1)](../odd-cubic-core-2026-11-15/PROOF.md)

## Sufficiency and the varying linear trial

Now suppose $u_n\to u_*$, $\chi_n\to0$ and $V_n+W_n\to0$. The real and imaginary parts of a remote Wick cubic belong to the third real Wiener chaos. Circularity gives unit variance and fourth cumulant $3\chi_n/2$ for $\sqrt{2/u_n}\operatorname{Re}q_n$ and for its imaginary counterpart. Their covariance is zero. The fourth-moment theorem and its multivariate version give $q_n\Rightarrow Q$, where $Q$ is proper complex Gaussian of variance $u_*$. Embed the finite Gaussian coordinate spaces in a countable Gaussian space if the dimensions vary. Orthogonality gives $\|G_n-q_n\|_2^2=V_n+W_n$, hence $G_n\Rightarrow Q$ as well. [Nourdin and Peccati, Theorems 5.2.7 and 6.2.3](https://doi.org/10.1017/CBO9781139084659)

Replacing $G_n$ by $q_n$ changes the pair of absolute moments by at most $2\sqrt{V_n+W_n}$ at every common trial and changes the energy price by $p(V_n+W_n)$. It suffices to consider $q_n$. Choose trials $\xi_n=c_n Z+r_n$ within $o(1)$ of the minimum, with $r_n$ a remote holomorphic linear form. Competing with zero bounds $\|\xi_n\|_2$ since the absolute moments are nonnegative and the zero-trial moments are bounded. From every subsequence extract one on which $c_n\to c$ and $\|r_n\|_2\to s$. The real components of $r_n$ are first-chaos Gaussians, orthogonal to both real components of $q_n$. Theorem 6.2.3 applied to these four components gives $(q_n,r_n)\Rightarrow(Q,sR)$ with $R$ a standard proper complex Gaussian independent of $Q$. For $s=0$ the linear block tends to zero in $L^2$. The visible $Z$ is independent of the pair at every index.

Uniform second moments allow passage to expectations in both absolute moments. Conditionally on $Z,R$, symmetry of $Q$ makes $x\mapsto E_Q(|L+Q-x|+|L-Q+x|)$ convex and even. Its value at $x=cZ+sR$ is at least its value at zero. Thus the limiting cost including the price is at least $S+|c|^2+s^2$. The zero trial has limiting cost $B(u_*)-pu_*=S$. Consequently $c=s=0$ on every convergent subsequence, the trial norms tend to zero, and the retained values tend to $S$. This argument permits a different linear form sharing remote coordinates with the cubic at every index.

## A two-sided estimate for the retained gap

Write $g=S-\widehat\Lambda(G)$ and $W=\|O\|_2^2$. On the capped domain, as $(u,\chi,V,W)\to(u_*,0,0,0)$,
$$
 g\asymp (u-u_*)^2+\delta+V+W
$$
with constants independent of dimension and sharing. For small $g$ the necessity estimates above give the lower bound. If $g$ is bounded below while the right side is small, it holds after reducing the constant. Row 12.8(ii) previously gave a local lower bound for the raw gap. [Earlier local results](../../STATUS.md)

For the reverse bound put $J(H)=E|L+H|+E|L-H|$ and $\mu=\Pi_{1,0}E_Z\operatorname{ph}(L+q)$. At the supporting plane of $J$ at $q$, the odd sector and the visible linear trial have zero derivative by $Z\mapsto-Z$. The two even derivatives are the raw content pairings. For a remote linear trial $r$, the derivative on $-r$ is $-2\operatorname{Re}\langle\mu,r\rangle$. Completing its square against the trial penalty therefore gives
$$
 \widehat\Lambda(G)\ge\Phi(u)-D-p(V+W)
   -2(\|c_A\|^2+\|c_B\|^2)^{1/2}\sqrt V-\|\mu\|^2 .
$$
The raw and tilted scores give $c_{3/5}=c_A+(3/5)\mu$. The two scores $c_A,c_{3/5}$ and the signed difference $c_B-.5053c_A$ have norm $O(\delta^{3/4})$. Thus the last two costs are $O(V+\delta^{3/2})$. [Trial derivatives](../progress-2026-11-15-codex-a7c4/JOINT_TARGET.md) · [Raw and tilted estimates](../signed-score-coupling-codex-a7c4/SIX.md) · [Raw A estimate](../raw-content-2026-11-17-gemini-5331/PROOF.md)

Indeed the two-sided Edgeworth expansion gives $D=-B''(u)\delta/4+O(\delta^{3/2})$ uniformly near $u_*>0$. To check the sign issue, set $F=\sqrt{2/u}\operatorname{Re}q$. Circularity gives $\kappa_4(F)=3\delta/(2u^2)$ and $\kappa_6(F)=5\kappa_6^{\mathbb C}/(2u^3)$. Every connected sixth-cumulant diagram has a matching of three proper contractions. Their norm product bounds its absolute contribution, giving $|\kappa_6(F)|\le(485/2)\kappa_4(F)^{3/2}$. Thus the signed sixth correction and the expansion remainder are both $O(\delta^{3/2})$. Taylor expansion of $\Phi$ at $u_*$ finishes the reverse bound. [Expansion and normalization](../edgeworth-codex-a7c4/PROOF.md) · [Absolute diagram estimate](../third-chaos-2026-11-16/gpt/cum3_proof.md)

For $V=W=0$, the same supporting plane and the zero trial trap the raw-to-retained loss between zero and $\|\mu\|^2$. Consequently as $u\to u_*,\ \delta\to0$,
$$
 S-\widehat\Lambda(q)=-B''(u_*)\left(\frac{(u-u_*)^2}{2}+\frac{\delta}{4}\right)
 +o\big((u-u_*)^2+\delta\big).
$$

## The leading finite-dimensional gap

Let $S_m$ be the supremum with at most $m$ remote complex coordinates in addition to the one visible coordinate. Let $b_m$ be the minimum of the normalized fourth excess among unit-variance remote cubics in those coordinates. The minimum exists by compactness of the finite-dimensional coefficient sphere. Then
$$
 \lim_{m\to\infty}m(S-S_m)=-\tfrac14 u_*^2 B''(u_*)\,\beta,\qquad
 \beta=\inf_{m\ge1}m b_m,\qquad 12\le\beta\le152/9 .
$$
In particular the dimension required to get within $g$ of the retained peak has order $1/g$. The coefficient is expressed through a quartic tensor minimum.

For a unit cubic, the influence matrix has trace $3$ and squared Hilbert–Schmidt norm at most $3\chi/4$. Cauchy–Schwarz gives $\chi\ge12/m$. On independent blocks of sizes $m,n$, give the two attaining cubics variance shares $\lambda,1-\lambda$. Independence and circularity make the combined excess $\lambda^2 b_m+(1-\lambda)^2 b_n$. Minimizing in $\lambda$ gives $1/b_{m+n}\ge1/b_m+1/b_n$. The superadditive sequence $1/b_m$ therefore satisfies $\lim m b_m=\inf m b_m$ by Fekete's lemma. The Clifford cubic in sixteen variables has $\chi=19/18$, giving the displayed upper bound. [Influence matrix, T7](../influence-calculus-2026-11-16/README.md) · [Clifford cubic, row 11.60](../../STATUS.md)

At $u=u_*$ take a quartic minimizer and set all five shells to zero. The shell-free expansion above bounds $S-S_m$ from above by $-u_*^2 B''(u_*) b_m/4+O(b_m^{3/2})$. Conversely, take admissible cubics within $o(1/m)$ of $S_m$. Their gaps are $O(1/m)$, hence $\delta=O(1/m)$ and $u\to u_*$. Before absorbing the deficit, the completed squares in 7.5.14 give $g\ge\sigma+D-(63/5)\delta^{3/2}$. Substitute $D=-B''(u)\delta/4+O(\delta^{3/2})$, use $\sigma\ge0$ and $\delta=u^2\chi\ge u^2 b_m$, and take the lower limit after multiplication by $m$. This agrees with the upper limit above. [Completed squares, equations (1)–(3)](../signed-score-coupling-codex-a7c4/SIX.md)
