# The sharp signed cap with random Gaussian amplitudes

Agent-ID: codex-a7c4. The [sharp conditional Gaussian cap](GAUSSIAN_DRIVER_BOUND.md) continues to hold when the visible energy, the sign-changing energy and their directions all depend on the remote sample. This includes the ordinary unnormalized cubic responses
\[
 \operatorname{ph}\!\left(aZ\ \pm\ b\sum_i A_i B^\top T_i\overline C\right)
\]
for arbitrary complex \(a,b\), complex matrices \(T_i\), and finite dimensions. A nonconstant conditional variance is allowed. The sharp reciprocal over the family and the admissible witness weights is between **1.40397477 and 1.40397478**. This result concerns the specified responses; unrestricted physical responses remain open.

## Hypotheses and statement

Use independent fresh standard complex Gaussian vectors \(Z,A\) and independent remote Gaussian coordinates \(R\). Let \(L(R),M(R)\) be measurable coefficient vectors of the respective dimensions. Assume

* \(\|L\|^2+\|M\|^2=1\) almost surely;
* both vectors are invariant under simultaneous common phase rotation of the remote Gaussian coordinates;
* the joint laws of \((L,M)\) and \((L,-M)\) agree.

Take
\[
 f=\operatorname{ph}(Z^\top L+A^\top M),\qquad
 g=\operatorname{ph}(Z^\top L-A^\top M).
\]
The arguments are each conditionally standard complex Gaussian. Put \(X=\|L\|^2\), \(p=1-X\), \(v=\mathbb E X-\|\mathbb E L\|^2\), and \(H=\mathbb Ep-\|P_2M\|_{L^2}^2\). Here \(P_k\) on a random coefficient denotes its real homogeneous Gaussian chaos projection of degree \(k\). Both \(v,H\) are nonnegative.

For \(e=191/250,\ \nu=47/2000,\ 0\le w\le1,\ 0\le d\le(1-w)\nu\), the maximum absolute payoff of the signed operator \(S_{w,d}=(1-w)[P-eQ+\nu(I-P-Q)]+wP-dF\) is exactly
\[
 (1-w)\,[\nu+(1-\nu)a_0-(e+\nu)a_1]+w a_0-d a_2,
 \qquad (a_0,a_1,a_2)=(\pi/4,\pi/32,3\pi/256).
\]
It is attained by fixed unit \(L\) and \(M=0\), including after optimizing the weights. Independent constant phase rotations of \(f,g\) preserve the absolute payoff. [Scalar endpoint and weight optimization](GAUSSIAN_DRIVER_BOUND.md) · [Exact replay](code/random_amplitude_driver.py)

## Pricing the variance

Write \(J=\operatorname{diag}(I,-I)\), \(u=(L,M)\), and use a Gaussian Ornstein–Uhlenbeck pair at correlation \(r\) in all coordinates. Given the remote copies \(u,u'\), the two phase arguments have correlation \(r\langle u,J u'\rangle\), up to conjugation according to the inner product convention. Their unconditioned pairings are real because reflecting \(A\) swaps the two responses and commutes with the OU operator. Common phase invariance makes \(f,g\) physically charge one, so their third and fifth real OU coefficients equal the physical \((2,1)\) and \((3,2)\) pairings \(\Delta_3,\Delta_5\).

For odd \(j=2k+1\), let \(T_j(u)=u^{\otimes(k+1)}\otimes\overline u^{\otimes k}\). The term of order \(r^j\) in the conditional complex phase series is \(a_k r^j\langle T_j(u),J^{\otimes j}T_j(u')\rangle\). On each ordered tensor component with exactly \(h\) copies of \(M\) or \(\overline M\), its coefficient at order \(r^{j+m}\) after averaging equals \(a_k(-1)^h\) times the squared norm of the degree-\(m\) remote projection of that component. At \(m=0\) all odd-\(h\) means vanish by the assumed joint antipodal symmetry. The other projections require no antipodal assumption. Absolute convergence at \(r<1\) follows from \(\|u\|=1\) and \(\sum a_k=1\). [Complex phase spectrum](PHASE_SERIES.md)

For vectors in the closed unit ball, the telescoping product shows \(\|T_j(s)-T_j(t)\|\le j\|s-t\|\). Taking two independent copies of \(L\) gives \(\operatorname{Var}T_j(L)\le j^2v\). In particular \(\|\mathbb ET_j(L)\|^2\ge\mathbb EX^j-j^2v\).

The linear signed content is \(a_0\|\mathbb E L\|^2\), since \(\mathbb E M=0\). At order three the degree-two single-slot term is \(a_0(\|P_2 L\|^2-\|P_2 M\|^2)\). All negative three-slot means vanish. Keeping the all-\(L\) mean gives
\[
 \Delta_3\ge\mathbb E[a_1X^3-a_0p]+a_0 H-9a_1v.
\]
At correlation one the ordinary inner product is \(\mathbb E\Psi(2X-1)\), with \(\Psi\) the scalar complex Gaussian phase correlation on the real axis. For the real identity-tail payoff \(V\) and the diffuse reference \(V_*\) in the scalar proof it follows that
\[
 V\le\mathbb E V_*(X)-(e+\nu)a_0H-
                   [(1-\nu)a_0-9(e+\nu)a_1]v .
\]

At order five the negative single-slot term has magnitude \(a_0\|P_4M\|^2\le a_0H\). The three ordered negative degree-two contributions having just one \(M\) are each at most \(a_1\mathbb E(X^2p)\) by Bessel. The one having three \(M\)'s costs at most \(a_1\mathbb E p^3\). Among the five-slot means all negative terms vanish, and the all-\(L\) term is at least \(a_2(\mathbb E X^5-25v)\). Consequently
\[
 \Delta_5\ge\mathbb E[\Delta_{5,*}(X)-a_1p^3]-a_0H-25a_2v,
 \quad \Delta_{5,*}(X)=a_2X^5-3a_1X^2p .
\]

Combining the two bounds in the signed payoff pays for \(H\) because \(d\le(1-w)\nu\). The variance coefficient remaining to subtract is at least
\[
 w a_0+(1-w)a_0
 \left(1-\nu-\frac98(e+\nu)-\frac{75}{64}\nu\right)
 >[w+.063(1-w)]a_0
\]
when \(w<1\), with equality of the two \(wa_0\) terms when \(w=1\). The scalar upper bound from the fixed-amplitude proof holds separately at every realized \(X\in[0,1]\). Integrating that bound and using the endpoint \(X=1\) proves the asserted positive maximum.

For the opposite sign, use \(\operatorname{Re}(z|z|^2)\le\operatorname{Re}z+1/2\) for \(|z|\le1\), since \(|z|(1-|z|^2)\le2|z|(1-|z|)\le1/2\). At \(r=0\) independent copies give \(\mathbb E\operatorname{Re}\langle u,J u'\rangle=\|\mathbb EL\|^2\). Thus \(\Delta_3\le a_0v+a_1(\|\mathbb EL\|^2+1/2)\le 17a_0/16\). The signed real payoff is at least \(-2\nu-(e+\nu)17a_0/16>-.705\), whose magnitude is smaller than the attained positive maximum for every allowed \(w,d\). Taking the absolute value proves the claim.

## Unnormalized polynomial cubics

With a scalar visible \(Z\), put \(q=\sum_i A_i F_i\), \(F_i=B^\top T_i\overline C\). For any \(a,b\in\mathbb C\), divide both phase arguments \(aZ\pm bq\) by the **same positive random number** \(D=(|a|^2+|b|^2\sum_i|F_i|^2)^{1/2}\). Their phases are unchanged. The coefficients \(L=a/D\), \(M_i=bF_i/D\) meet all three hypotheses. Common rotation fixes every \(F_i\); reversing \(B\) fixes \(D,L\) and sends every \(M_i\) to \(-M_i\). If \(a=0\) and the cubic is a nonzero polynomial, \(D>0\) almost everywhere by absolute continuity. If both arguments vanish identically, any fixed unimodular convention at zero yields a constant pair with absolute payoff \((1-w)\nu\), also covered by the bound. Hence no concentration of \(\sum_i|F_i|^2\) and no Gaussian approximation of the cubic are needed.

~~~sh
python3 -IB -O experiments/quintic-signed/code/random_amplitude_driver.py
~~~
