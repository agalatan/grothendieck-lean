# An odd-sector price that depends on remote energy and fourth excess

Agent-ID: codex-a7c4. Task #813. **P + C, author only.**

For $\varepsilon=.752$, every six-sector response on $.825\le t\le.8255$ clears the 8.13(ii) physical target $.713245$ by more than $10^{-7}$. All dimensions and $0\le\chi\le42$ are included. The even and odd fields may depend on the same remote Gaussian coordinates. The extension uses the same four weighted response inequalities, three supplemental Stein models and visible trials as the [weighted shoulder](WEIGHTED_SHOULDER.md).

**The conditional odd bound.** Let $u=\mathbb E|q|^2$, $\delta=\mathbb E|q|^4-2u^2$, and $\chi=\delta/u^2$ (zero if $u=0$). The odd field is $O=ZQ+\bar ZP+\nu Z(|Z|^2-2)/\sqrt2$, with $Q\in H_{1,1}$, $P\in H_{2,0}$ and $\nu$ deterministic. Set $S=|Q|^2+|P|^2+|\nu|^2$ and $W=\mathbb ES$. The [odd-sector certificate](../odd-cubic-core-2026-11-15/PROOF.md), equations (4)–(7), bounds the paired raw odd gain conditionally on all remote fields by $k_i S+C(Q,\nu)$ whenever $i/40\le|q|\le(i+1)/40$. Here $k_i$ is the certified upper eigenvalue bound for both compensated matrices on this closed interval. The additive compensator always has mean zero since $\mathbb E Q=0$ and $\nu$ is deterministic; changing the upper bound on the matrix does not scale the compensator. At $|q|\ge8$, section 5 of the same proof gives $\lambda_{\max}(M_\pm-C_\pm)<11/10$. [Committed eigenvalue bounds](../../code/odd-cubic-core-2026-11-15/results/all_bounds.txt)

Take the upper concave hull of $((i/40)^2,k_i)$ through its first maximum, then extend it constantly. The resulting function $H$ is the least nondecreasing concave majorant of the ordinates and covers every squared-radius interval and the ray. Its eight vertices have indices $0,11,12,13,14,15,16,17$. For $W>0$, Jensen under the probability density $S/W$ bounds the gain by
\[
       W H\bigl(\mathbb E(|q|^2S)/W\bigr).
\]
When $W=0$ the gain vanishes identically. The compensation term is averaged under the original Gaussian law before applying Jensen to the matrix price. The change of measure applies only to the product of the price with $S$.

**The weighted second moment.** Put $h=\|P_{1,1}|q|^2\|_2^2$, $z=\|P_{2,2}|q|^2\|_2^2$, $s=\|J\|_{\rm HS}^2+\|I\|_{\rm HS}^2$, $b=\|P_{2,0}q^2\|_2^2$ and $c=\|P_{3,1}q^2\|_2^2$. The influence identities give $\delta=2s+b+c$, $h=s+2\operatorname{tr}(JI)$ and $z=s+b/2+c-4\operatorname{tr}(JI)$. Thus
\[
  h+z=\delta-b/2-2\operatorname{tr}(JI)\le\delta,\qquad
  h+z/2=3\delta/4-b/2-c/4\le3\delta/4 .
\]
The trace is nonnegative since $J,I$ are positive. Only these two nonconstant projections can pair with the squared fields $|Q|^2$ and $|P|^2$. [Corollaries 13.1 and 13.3](../influence-calculus-2026-11-16/ADDENDUM.md) · [Projection identities in the six-sector normalization](../uncapped-six-sector-codex-a7c4/PROOF.md)

Write $Q=\sum A_{ij}:z_i\bar z_j:$, so $w_Q=\mathbb E|Q|^2=\|A\|_{\rm HS}^2$. In $|Q|^2$ the two single Wick contractions represent the quadratic projection; each has Hilbert–Schmidt norm at most $w_Q$. The fourth-order projection separately symmetrizes the two holomorphic and the two antiholomorphic slots of $A\otimes\bar A$. Its squared norm is at most $2!2! w_Q^2$. Thus $\||Q|^2-w_Q\|_2\le\sqrt8\,w_Q$. For $P=\sum D_{ij}z_i z_j$ with $D$ symmetric, $w_P=2\|D\|_{\rm HS}^2$. The first projection has coefficient matrix $4D^*D$ up to transposition and has norm at most $2w_P$; the biquadratic projection has norm at most $2\|D\|_{\rm HS}^2=w_P$. Cauchy–Schwarz with $h+z$ for $Q$ and $h+z/2$ for $P$ gives
\[
 \mathbb E(|q|^2S)\le
 (u+\sqrt{8\delta})w_Q+(u+3\sqrt{\delta/2})w_P+u|\nu|^2
 \le u(1+\sqrt{8\chi})W .
\]
This proves the scalar odd price $b(u,\chi)=H(u(1+\sqrt{8\chi}))$. For example, $b(.043,.43)\le1.274054601$ and $b(.043,.1)\le1.260062371$.

**Prices for the three odd sectors.** Split the single expectation of $H(|q|^2)S$ into three terms. For the first two, apply Jensen with respective densities $|Q|^2/w_Q$ and $|P|^2/w_P$ when the denominators are positive. For the deterministic sector use the original Gaussian law. The three simultaneous prices are
\[
 b_Q=H(u+\sqrt{8\delta}),\qquad b_P=H(u+3\sqrt{\delta/2}),\qquad b_\nu=H(u).
\]
The odd gain is at most $b_Qw_Q+b_Pw_P+b_\nu|\nu|^2$. At $u=.043$ and $\chi=.43$ the respective upper bounds are 1.274054601, 1.268498855 and 1.242234447. With one common mixing fraction $\theta$, set $h_j=(\theta/p_0+(1-\theta)/b_j)^{-1}$. For each field the arm multipliers $h_j/p_0$ and $h_j/b_j$ average to one and together charge $h_j w_j$. The two multipliers on $Q$ and $\nu$ in the odd arm are deterministic, so their product preserves the zero expectation of the cross term. This refinement allows later comparisons to use separate odd energies. The slab below uses the common upper price $b_Q$ on all three.

The Jensen price reaches the maximum matrix price at sufficiently large excess. At normalized remote energy at most .06 a separate event-mass inequality gives an odd price of at most 1.278521949 uniformly in the fourth excess. [Small-ball estimate and exact replay](ODD_SMALL_BALL.md)

**Use in the six-sector trial.** On a closed cell with normalized remote energy $u\le u_h$ at the candidate price and fourth excess $\chi\le\chi_h$, choose $b=b(u_h,\chi_h)$. Both arguments enter monotonically. The harmonic mixing coefficient becomes $h_\theta=(\theta/p_0+(1-\theta)/b)^{-1}$; scales $h_\theta/p_0$ and $h_\theta/b$ reconstruct the same odd fields, and the balanced choice $\theta=p_0(p-b)/(p(p_0-b))$ cancels the odd price. The upper bounds on the even charges and the physical-energy restrictions are those of the [weighted shoulder](WEIGHTED_SHOULDER.md). The replay checks the published conditional intervals, every hull segment, the tail and the rejection of a deleted peak vertex before covering the full physical domain. It accepts 10,519 closed boxes and certifies physical clearance greater than $101721/10^{12}$. The stored 17-significant-digit entries round-trip to the outward binary64 endpoints of the upstream interval calculation. The replay recovers those endpoints as exact rationals and checks the input file against its upstream SHA-256 manifest. [Replay and arithmetic](../../code/uncapped-peak-consumer-codex-a7c4/odd_response.py)

    python3 -IB research/conjecture-K/code/uncapped-peak-consumer-codex-a7c4/odd_response.py
