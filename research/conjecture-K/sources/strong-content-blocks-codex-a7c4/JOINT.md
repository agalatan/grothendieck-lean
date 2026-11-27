# Exact peak Conjecture K for the two raw even shells

Agent-ID: codex-a7c4. At the peak let $p=2500/1891$, $L=Z(a+b|Z|^2)$ with $(a,b)=(699/1250,179/1250)$, and $q$ be a remote complex $(2,1)$ Wick cubic. Put $u=E|q|^2$, $\delta=E|q|^4-2u^2$, and $\chi=\delta/u^2$ when $u>0$. For a fresh standard complex Gaussian $W$ write $B_G(u)=2E|L+\sqrt uW|$, $D=B_G(u)-2E|L+q|$, $\Phi(u)=B_G(u)-pu$, and $S=\sup_v\Phi(v)$ over $v\ge0$.

Take $A=(|Z|^2-1)r_A$ and $B=Z^2\overline{r_B}/\sqrt2$ with arbitrary remote holomorphic first-chaos drivers. They can share coordinates with each other and with $q$, and can have arbitrary norms. For $G=q+A+B$ use the raw payoff $\Lambda(G)=E|L+G|+E|L-G|-pE|G|^2$. The three odd shells are zero.

* On every general energy/excess rectangle of 6.3.44, $\Lambda(G)<S$. For each of its four disjoint-block classes, $\Lambda(G)\le S$ throughout $0\le u\le 0.0463$. These classes include 41 equal-energy disjoint blocks of arbitrary shapes, and 28 equal-fourth-excess disjoint blocks. [Exact criteria and staircase](PROOF.md)
* For every cubic in any dimension the sharper same-variance estimate $\Lambda(G)\le\Phi(u)-(3/200)D$ holds on the union of $[0,.0463]\times[0,.0784]$, $[0,.0007]\times[0,42]$, and $[0,.012]\times[0,.25]$ in $(u,\chi)$. At $u=0$ the bound follows directly from the joint shell cost.

## Paying the joint cost away from the Gaussian optimum

Write $C_A=\|c_A(q)\|_2$, where $c_A,c_B$ are the first-chaos projections of the A and B angular responses. By the signed Schur estimate of 7.4.17,
\[
 \Lambda(G)\le \Phi(u)-[D-(25/6)C_A^2]+f,\qquad f=3241/1186575200 .
\]
Indeed its cost is at most $4C_A^2+(31250/6697)((333/10000)C_A+(7/2000)\sqrt{u})^2$. Subtract $(25/6)C_A^2$ from this cost and complete the square over $C_A\ge0$ at $u\le0.0463$ to get $f$. [Signed and diagonal cost estimates, consequences 1–2](../raw-joint-ab-gemini-4c4c/PROOF.md)

Row 2.7c gives $S-\Phi(u)\ge(27/25)(u-u_*)^2$ for $0.00551\le u\le0.0463$, where $.0403448<u_*<.0403449$. At energies outside $I=[.03875,.04194]$ within that band the buffer exceeds $f$. For $u<.00551$, concavity and the location of the maximizer give $\Phi(u)\le\Phi(.00551)$. Thus the strong A-content estimate of 6.3.44 suffices outside $I$, including the entire general staircase. [Gaussian buffer and concavity](../gemini-plan-audit-2026-11-17/NOTE.md)

Inside $I$, clip the fourteen block rectangles of 6.3.44 to the critical interval and keep their original global radial majorants. Their fourth- and sixth-moment costs and block content price depend only on the shape and polynomial. The exact Bernstein check gives $D-(25/6)C_A^2>8965588/10^{12}>f$ throughout the restricted rectangles. The energy-share and fourth-excess criteria have a further lower edge $0\le\chi<.0784$. The following argument covers that edge with unrestricted tensor shape.

## Smoothing the B angular response

Let $K_A^{\rm tab}(u)$ denote the decreasing piecewise-constant cap used by KRAW. We prove
\[
 \frac{\|c_A\|_2^2+\|c_B\|_2^2}{7/25}
 \le \frac{197}{200}\frac{25}{6} K_A^{\rm tab}(u)\delta^{3/2},
 \qquad 0\le u\le .0463 .
\]
The real angular scores $m_A,m_B$ of KRAW (3.4) are positive mixtures of the same signed Gaussian atoms. The measures are $\mu_A$ and $d\mu_B/(\sqrt2\lambda)$ respectively. Applying the Gaussian convolution in KRAW (3.5) to the latter gives the OU resolvent norm
\[
 \|\psi_{B,u}''\|_\infty=\frac{2}{\sqrt\pi}\int_0^1 z^{1/3}
 \int_0^\infty\frac{\lambda^{-1/2}}{\sqrt2(1+\lambda u(1-z^2))^{5/2}}\,d\mu_B\,dz .
\]
Each atom attains its largest absolute derivative at zero with the same sign. Positivity gives monotonicity in $u$. Set $K_B(u)=(3\sqrt6/256)\pi^2\|\psi_{B,u}''\|_\infty^2$, and use the analogous $K_A(u)$. The directional OU inequality gives $\|c_i\|_2^2\le\sqrt{13/15}\,K_i(u)\delta^{3/2}$ for each score. [KRAW, §§3.1–3.3](../raw-content-2026-11-17-gemini-5331/PROOF.md) · [Directional improvement, 6.3.42](../content-509-codex-6d92/BLOCKS.md)

Integrating KRAW's algebraic Radau majorants $Q_4(y)\ge (1+y)^{-5/2}$ at each left energy endpoint needs the five moments
\[
 L_j=\frac{1}{\sqrt2}\int\lambda^{j-1/2}d\mu_B
 =\frac1{\sqrt{2\pi}}\int_0^\infty s^{-1/2}(-\partial_s)^j f_B(s)\,ds,
 \qquad 0\le j\le4 .
\]
The equality follows by Tonelli, the Laplace representation of $f_B$, and $\Gamma(1/2)=\sqrt\pi$. For $H(t)=t(a+bt)^2$ one has $f_B(H(t))=e^{-t}/((a+bt)^3(a+3bt))$. Thus KRAW's rational recurrence starts at the pair $(3,1)$ and differentiates once per step. After the change of variables its helper returns half the last integral without its prefactor. Multiply by $2/\sqrt{2\pi}$ and use $Z_0=3/4$, $Z_j=(3j)/(3j+2)Z_{j-1}$ for the moments of $(1-z^2)^jz^{1/3}dz$. At zero energy we separately check the normalization $(3\sqrt6/4)g_B'(0)^2$. [Moment identity (13)](../third-audit-2026-11-15-codex-a7c4/CONTENT_KERNELS.md)

| Left energy | 0 | .01 | .02 | .03 | .035 | .04 | .044 |
|---|---:|---:|---:|---:|---:|---:|---:|
| $K_A^{\rm tab}$ | 8.5648 | 7.154 | 6.117 | 5.323 | 5 | 4.71 | 4.5 |
| Upper cap $K_B^{\rm tab}$ | 1.958 | 1.647 | 1.416 | 1.238 | 1.164 | 1.099 | 1.050 |

Every column satisfies $(13/15)[6(K_A^{\rm tab}+K_B^{\rm tab})]^2 < [7(197/200)K_A^{\rm tab}]^2$. Together with the directional inequality this proves the claimed joint cost.

On the three rectangles in the same-variance statement, the published deficit certificates establish $K_A^{\rm tab}(u)\delta^{3/2}\le(6/25)D$. Their numerical estimates bound the whole envelope. Specifically, the zero-slack Maclaurin cells and Cover C in KRAW subtract the left-endpoint A envelope, KSLIV's small-excess estimates subtract the unsmoothed or tabulated envelope, and 3.19a uses the unsmoothed cap $5353/625$ on $u\le.0007$. Since the diagonal joint gain of 7.4.17 is at most $(\|c_A\|^2+\|c_B\|^2)/(7/25)$, at most $197D/200$ is spent. Adding the base payoff $\Phi(u)-D$ gives the same-variance assertion. [KRAW, Theorem 4(c)](../raw-content-2026-11-17-gemini-5331/PROOF.md) · [KSLIV, Theorem 2](../sliver-closure-2026-11-24-gemini-21d5/PROOF.md) · [All-shapes small-energy estimate](../peak-energy-codex-a7c4/PROOF.md)

Run both replays from the repository root.

```sh
python3 -IB research/conjecture-K/code/strong-content-blocks-codex-a7c4/verify.py
python3 -IB research/conjecture-K/code/strong-content-blocks-codex-a7c4/joint.py
```

The joint replay checks the B caps, both Gaussian buffer endpoints, the full critical-band partition and its signed margin. It also checks the failure of the rounded diagonal budget at $u=.04$ when the directional gain is dropped. [Joint verifier](../../code/strong-content-blocks-codex-a7c4/joint.py)
