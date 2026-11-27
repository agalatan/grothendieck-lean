# The sharp retained peak value on the capped energy domain

Agent-ID: codex-a7c4.

Fix the peak parameters $a=699/1250$, $b=179/1250$, $p=2500/1891$. Let $Z,W$ be independent standard proper complex Gaussians, let $L=Z(a+b|Z|^2)$, and write
$$
 B(u)=2E|L+\sqrt{u}W|,\qquad \Phi(u)=B(u)-pu,\qquad S=\sup_{u\ge0}\Phi(u).
$$
For the six-sector cubic $G$ of 7.5.13 let $q$ denote its remote part, $u=E|q|^2$, $V$ the sum of the two even-shell energies, and $W_{\rm odd}$ the total odd-sector energy. Use the retained functional of §1.6,
$$
 \widehat\Lambda(G)=\min_{\xi\in H_{1,0}}
 \bigl(\|\xi\|_2^2+E|L+G-\xi|+E|L-G+\xi|\bigr)-p\|G\|_2^2.
$$

**Theorem.** Every finite-dimensional $G$ with $u\le0.0463$ and $u+V\le0.080051$ satisfies $\widehat\Lambda(G)<S$. The three odd energies and all sharing among the six sectors are arbitrary. The supremum over all finite dimensions subject to these two caps equals $S$.

## Proof of the upper bound

The verified transfer from 7.5.13 gives strict inequality on $0\le u\le0.0354$ and $0.0456\le u\le0.0463$, including $u=0$, with no shape condition. [All-sector transfer, §1.B](../all-sector-transfer-gemini-c1de/PROOF.md)

For $0.0354\le u\le0.0456$, set $\chi=E|q|^4/u^2-2$. The complex fourth-moment bounds give $0\le\chi\le42$. The following closed intervals cover this entire range.

| Normalized fourth excess | Peak estimate |
|---|---|
| $0\le\chi\le49/625$ | Row 7.5.14 gives $\widehat\Lambda(G)\le\Phi(u)-(41/125)D(q)$, where $D(q)=B(u)-2E|L+q|>0$ at positive energy by 3.3a. [Diffuse same-variance proof](../signed-score-coupling-codex-a7c4/SIX.md) |
| $49/625\le\chi\le3$ | The spectral dual and shell certificate in this packet gives a uniform strict gap. [Intermediate-excess proof](PROOF.md) |
| $3\le\chi\le42$ | Row 7.5.15 gives $\widehat\Lambda(G)<S-146939/10^{12}$. [High-excess proof](../peak-high-excess-codex-a7c4/PROOF.md) |

All four applications use the original peak price, the same two energy caps and the same six-sector normalization. They give the upper bound for the retained functional of every admissible cubic.

The [characterization of maximizing sequences](RIGIDITY.md) shows that their remote energies tend to the Gaussian optimizer, their normalized fourth excesses tend to zero, and the energies in all five other sectors vanish. These conditions are also sufficient.

## Sharpness

The Gaussian optimizer satisfies $.0403448<u_*<.0403449$ by 2.7c. On fresh independent standard complex Gaussian triples $(X_j,Y_j,T_j)$ take
$$
 q_N=\sqrt{u_*/N}\sum_{j=1}^N X_jY_j\overline{T_j}
$$
and set every shell to zero. Every $q_N$ has energy $u_*$ and satisfies both caps. Its summands before scaling are centered, circular, independent and have unit variance. The planar central limit theorem gives convergence to $\sqrt{u_*}W$ in law. Uniform second moments give uniform integrability of $|L+q_N|$, so $2E|L+q_N|\to B(u_*)$. [Remote Gaussian approximation](../peak-remote-deficit-codex-a7c4/PRICE.md)

For these particular cubics the first-chaos minimization has zero cost exactly. Rotate all the triples by $(X_j,Y_j,T_j)\mapsto(e^{i\theta}X_j,e^{i\theta}Y_j,e^{2i\theta}T_j)$. Their joint law and $q_N$ are invariant and the average of every remote linear form under this rotation is zero. For a trial $cZ+r$, convexity and averaging show that $cZ$ has at most the same cost. The law of $q_N$ conditional on $Z$ is symmetric, so the two absolute moments for $cZ$ exchange when $c$ changes sign. A convex even function of $c$ is minimized at zero. Hence $\widehat\Lambda(q_N)=2E|L+q_N|-pu_*\to S$. This argument also applies after positive homothetic scaling of the visible profile and the remote cubic. [Retained functional and the disjoint-block limit, §1.6](../../MONOGRAPH.md)

The claim concerns the retained functional on the displayed energy domain. The raw Conjecture K inequality at the peak, the other profile rows, and a full fixed-witness Grothendieck bound are separate open problems.

### Rate for the independent-product sequence

Larsson-Cohn uses sums of independent Wick powers to compare a candidate extremizer with a Gaussian limit. For the complex block sequence above one can compute which side it approaches from and at what rate. For these blocks the first-order payoff coefficient also follows from the monograph’s [independent-sum expansion, §3](../audit-2026-11-13/diffuse_asymptotic.md). The direct calculation below gives an additional finite-size bound for the radius. [Larsson-Cohn, Proposition 5.1](https://doi.org/10.1007/BF02384506)

Write $U_j=|X_jY_j|^2$ and $M_N=N^{-1}\sum_j U_j$. Given all $X_j,Y_j$, the remote sum is proper complex Gaussian with variance $u_* M_N$. Thus its retained payoff gap at the optimizing energy is exactly $B(u_*)-E B(u_*M_N)$. Since $U_j$ is a product of two independent mean-one exponentials, $E U_j^k=(k!)^2$, $E M_N=1$, and $E(M_N-1)^2=3/N$. It follows that
$$
 N\bigl(S-\widehat\Lambda(q_N)\bigr)\longrightarrow -\tfrac32 u_*^2 B''(u_*)>0 .
$$
Indeed $B(v)=E h(vE)$ for standard exponential $E$. The curvature bound in the [window proof](PROOF.md) makes $B''$ bounded and continuous on the positive ray and bounded at zero. The positive Gaussian variance-mixture representation of the visible profile gives $B''(u_*)<0$. In Taylor's formula about $u_*$ the linear term has mean zero. The random variables $N(M_N-1)^2$ are uniformly integrable by their bounded second moments, using $EU_j^4<\infty$. Since $M_N\to1$ in probability, the averaged Taylor remainder after multiplication by $N$ tends to zero. [Visible variance mixture, equation (7)](../third-audit-2026-11-15-codex-a7c4/CONTENT_KERNELS.md)

For the unsmoothed radius in 3.6, $E|q_N|/(\sqrt{\pi u_*}/2)=E\sqrt{M_N}$. The exact identity
$$
 1-E\sqrt{M_N}=\tfrac12 E\frac{(M_N-1)^2}{(1+\sqrt{M_N})^2}
$$
gives $N(1-E\sqrt{M_N})\to3/8$ by the same uniform integrability. It also gives the finite bound $1-E\sqrt{M_N}\ge 9/(24N+104)$. Apply Cauchy–Schwarz with weight $(M_N-1)^2$, use $(1+\sqrt{M_N})^2\le2(1+M_N)$, and substitute $E(M_N-1)^3=26/N^2$. This quantifies the Gaussian comparison for this particular family of cubics.

## Exact homothetic rows

For $0<\lambda\le1$, scale the visible coefficients, the witness parameter $\varepsilon=1/p$, and the entire cubic by $\lambda$. If $G=\lambda G_0$, substitution of $\xi=\lambda\xi_0$ in the variational definition gives
$$
 \widehat\Lambda_{\lambda}(G)
 =\lambda\min_{\xi_0}\left(\lambda\|\xi_0\|_2^2
 +E|L+G_0-\xi_0|+E|L-G_0+\xi_0|-p\|G_0\|_2^2\right)
 \le\lambda\widehat\Lambda(G_0)<\lambda S .
$$
Here $u\le\lambda^2(0.0463)$ and $u+V\le\lambda^2(0.080051)$. The Gaussian benchmark on this exact ray is $\lambda S$ by changing the Gaussian variance. The scaled sequence $\lambda q_N$ still has exact minimizer zero, and its payoffs tend to $\lambda S$. Thus the scaled bound is sharp on the scaled energy domain. [Homothetic comparison and energy normalization](../all-sector-transfer-gemini-c1de/PROOF.md)
