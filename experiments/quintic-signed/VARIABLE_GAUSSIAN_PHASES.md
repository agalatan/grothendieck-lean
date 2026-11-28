# A signed fifth for arbitrary conditional Gaussian coefficient fields

Agent-ID: codex-a7c4. Let \(Z,A,R\) be independent finite vectors of standard complex Gaussians. For arbitrary jointly measurable complex vectors \(L(R),M(R)\) of dimensions matching \(Z,A\), assume \(\|L\|^2+\|M\|^2=1\) almost surely. Set
\[
 f=\operatorname{ph}(Z^\top L+A^\top M),\qquad
 g=\operatorname{ph}(Z^\top L-A^\top M).
\]
The coefficient directions, energies, and phases may all depend on \(R\). For the signed witness at \(w=0,\ d=\nu=47/2000,\ e=191/250\), the reciprocal of the supremal absolute payoff on this family satisfies
\[
 1.40360 < \frac{1}{\sup_{Z,A,R,L,M} |\langle f,S_{0,\nu}g\rangle|}
 <1.40397478.
\]
The left inequality is uniform in the three dimensions. The right inequality uses the visible phase pair \(f=g=\operatorname{ph}Z\). This same pair keeps the reciprocal below \(1.4023\) for **every** first-chaos-only weight \(w\) with zero fifth debit. Here \(S_{w,d}=(1-w)[P-eQ+\nu(I-P-Q)]+wP-dF\) uses the physical projections \(P=P_{1,0},Q=P_{2,1},F=P_{3,2}\). Extending the comparison to unrestricted phase responses remains open. At the smaller debit \(d=1/50\), which gives the fifth sector the strictly positive eigenvalue \(7/2000\), the same family has reciprocal above **1.40340**. [Visible obstruction and signed operator](GAUSSIAN_DRIVER_BOUND.md) · [Exact replay](code/variable_gaussian_phases.py)

## Projecting in the fresh coordinates

Write \(u=(L,M)\), \(J=\operatorname{diag}(I,-I)\), \(T_j(u)=u^{\otimes (j+1)/2}\otimes\bar u^{\otimes (j-1)/2}\) for odd \(j\). The fresh Gaussian phase projection of degree \(j\), at a deterministic unit \(u\), is an isometric image of \(\sqrt{a_{(j-1)/2}}T_j(u)\), all in fresh bidegree \(((j+1)/2,(j-1)/2)\). Indeed, the Gram inner product of two such fresh projections at \(u,v\) is the degree-\(j\) coefficient of their Gaussian phase correlator \(\Psi(r\langle u,v\rangle)\), which is \(a_{(j-1)/2}\langle u,v\rangle|\langle u,v\rangle|^{j-1}\) up to conjugation. These are exactly the tensor Gram inner products. The single fresh bidegree follows from common fresh phase rotation. This gives an isometry on their finite-dimensional spans and applies pointwise to the measurable inputs. [Laguerre phase coefficients](PHASE_SERIES.md)

The Gaussian product Hermite basis decomposes each **physical** bidegree into fresh and remote bidegrees. To obtain physical \(Q\) from fresh slots \(j=1,3\), project their remote coefficients onto remote bidegrees \((1,1),(0,0)\), respectively. For physical \(F\) the remote bidegrees for \(j=1,3,5\) are \((2,2),(1,1),(0,0)\). Each ordered component of \(T_j(u)\) contributes a squared norm with sign \((-1)^h\), where \(h\) counts slots from \(M,\overline M\), since the coefficient for \(g\) is \(T_j(Ju)\). This calculation places no phase-equivariance, parity, continuity or independence requirement on \(L,M\). All pairings are real: reflecting the fresh \(A\) coordinates interchanges the two responses and commutes with the projections.

Put \(b=\|\mathbb E L\|,\ m=\|\mathbb E M\|^2,\ l=\|L\|,\ x=l^2,\ p=1-x,\ \alpha=e+\nu\). The linear signed pairing is \(a_0(b^2-m)\), where \(a_0=\pi/4,\ a_1=a_0/8,\ a_2=3a_0/64\). Conditional on the remote sample, the ordinary phase correlation is \(\Psi(2x-1)\).

## A lower bound for both signed tensor means

For independent copies \(u,u'\) put \(z=\langle u,J u'\rangle\). Then \(|z|\le1\), and \(\mathbb E\operatorname{Re}z=b^2-m\). The signed constant coefficient from the \(j\)-slot mean is \(\mathbb E\operatorname{Re}(z|z|^{j-1})\). For \(j=3,5\), take \(r\le1\) with \(jr^{j-1}+(j-1)r^j\ge1\) and \(r\ge0\). Then
\[
 \operatorname{Re}(z|z|^{j-1})\ge jr^{j-1}\operatorname{Re}z-(j-1)r^j.
\]
For nonnegative real part use the tangent to \(s^j\) on \(s\ge0\). For negative real part the left side is at least \(\operatorname{Re}z\), and the tangent lies below the identity at both \(-1\) and zero. Define \(D_j(y)=jr^{j-1}y-(j-1)r^j\) with \(r=\max(y,r_j)\), \(r_3=1/2,\ r_5=2/3\). The hypothesis holds for both choices. The mean therefore contributes at least \(D_j(b^2)-jm\). Each \(D_j\) is increasing on \([0,1]\).

Let \(E_2=\|P_{1,1}M\|_{L^2}^2\) and \(E_4=\|P_{2,2}M\|_{L^2}^2\). Write \(\Delta_3,\Delta_5\) for the real signed physical pairings. Applying the tensor accounting above and discarding positive terms,
\[
\begin{aligned}
 \Delta_3&\ge -a_0 E_2+a_1[D_3(b^2)-3m],\\
 \Delta_5&\ge -a_0 E_4-a_1\mathbb E(3x^2p+p^3)+a_2[D_5(b^2)-5m].
\end{aligned}
\]
At the intermediate fifth tier there are three single-\(M\) terms, each with total unprojected energy \(\mathbb E x^2p\), and one triple-\(M\) term with energy \(\mathbb Ep^3\). The three-slot and five-slot means include every odd component through the supporting-line bound.

## Four scalar upper bounds

In \(\nu\mathbb E\Psi(2x-1)+(1-\nu)a_0(b^2-m)-\alpha\Delta_3-d\Delta_5\), the coefficient of \(m\) is negative since \(1-\nu>3\alpha/8+15d/64\). Because \(d\le\alpha\), orthogonality gives \(\alpha E_2+dE_4\le\alpha\mathbb E p\). The real payoff is thus at most
\[
 a_0\!\left[(1-\nu)b^2-\frac{\alpha}{8}D_3(b^2)-\frac{3d}{64}D_5(b^2)\right]
 +\mathbb E h(l),
 \quad
 h(l)=\nu\Psi(2l^2-1)+\alpha a_0p+d a_1(3l^4p+p^3).
\]
For each of the following four nonnegative slopes, the replay proves \(h(l)+s l\le c\) on the closed unit interval. Since \(\mathbb E l\ge b\), it follows that \(\mathbb E h(l)\le\min(c-sb)\).

| \(s\) | \(c\) | Closed intervals checked |
|---:|---:|---:|
| .4 | .66916 | 60 |
| .8 | .87632 | 90 |
| 1 | 1.03123 | 113 |
| 1.07793 | 1.101439 | 264 |

On each radius interval the replay uses monotonicity of \(\Psi\), the exact maximum of the concave radius quadratic plus the line, and outward endpoint products for the remaining nonnegative factors. Nonnegative phase arguments use the positive series and its retained tail bound. Negative phase arguments use the first 32 negative terms, rounded upward. After inserting the least of the four affine lines, 3,957 closed intervals in \(b\) give the strict uniform bound \(2500/3509\). Deleting the last supporting line loses the certificate already at \(b=.9781\). The radius majorant increases with \(d\), so the same four lines apply at the smaller debit \(1/50\). Updating the explicit fifth-degree polynomial there gives a reciprocal above 1.40340 in 4,652 closed intervals.

Finally \(-g=\operatorname{ph}(A^\top M-Z^\top L)\) almost everywhere; its exception is null conditionally on \(R\). Interchanging the unrestricted slots gives the same upper bound for the negative real payoff. Constant independent phase rotations do not change its magnitude.

~~~sh
python3 -IB -O experiments/quintic-signed/code/variable_gaussian_phases.py
~~~
