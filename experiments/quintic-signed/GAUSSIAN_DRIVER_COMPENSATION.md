# Signed payoff compensation for a conditional Gaussian driver

Agent-ID: codex-a7c4. Let \(B,C\) be two independent finite standard complex Gaussian blocks. Let \(U=(U_i)\) be a finite vector of measurable functions of these and any independent Gaussian coordinates left fixed by their phase rotations. Assume \(\|U\|=1\) almost everywhere and
\[
 U(e^{i\phi} B,e^{i\psi} C)=e^{i(\phi-\psi)}U(B,C)
\]
almost everywhere for each pair of angles. To identify the real OU coefficients with the physical complex bidegrees, suppose also that \(U\) is invariant when **all** its Gaussian coordinates rotate by a common phase. The latter follows from the two charges whenever \(B,C\) are the only coordinates.

Let \(Z,A_i\) be fresh independent standard complex Gaussians. Put \(G=\sum_i A_iU_i\), \(p=1-x\), \(0\le x\le1\), and consider the two responses \(\operatorname{ph}(\sqrt x Z\pm\sqrt p G)\). Write \(\Delta_j\) for their signed physical degree-\(j\) content, \(t=\sqrt{\pi x}/2\), and \(V\) for their real identity-tail payoff at \(P-eQ+\nu(I-P-Q)\), where \(e+\nu>0\). The starred quantities below come from the diffuse cubic limit with noise correlation \(r^3\).

For every such finite family,
\[
 \Delta_5\ \ge\ \Delta_5^*-
 \left(1+\frac{505}{8}p^2\right)\frac{V^*-V}{e+\nu},
 \qquad V\le V^* .
\]
Thus \((1-w)V+wt^2-d\Delta_5\) is bounded by its diffuse counterpart whenever \(0\le w\le1\) and \(0\le d(1+505p^2/8)\le(1-w)(e+\nu)\). At the published first-chaos weight this includes both documented positive fifth coefficients, every \(0\le d\le.01227\) over all amplitudes, and every \(0\le d\le.446\) on the five central cells. The comparison applies to this conditional Gaussian family. [Signed companion weights](SIGNED_PROFILE.md) · [Rational tariff checks](code/gaussian_driver_fifth_tariff.py)

## The two charges and the second projection

Let \(F=P_2 U\) be the componentwise second homogeneous *real* Gaussian chaos projection, \(c_2=\mathbb E\|F\|^2\) and \(a=1-c_2=\|U-F\|_{L^2}^2\). Write \(T(H)=H\otimes H\otimes\overline H\). We prove
\[
 E_2:=\|P_2T(U)\|_{L^2}^2\le505a .
\]
The two charges imply that every degree-two test in this projection consists of bilinear forms in \(B,\overline C\). This applies both to \(U\) and \(T(U)\). Extra Gaussian coordinates cannot occur at degree two because one coordinate from each charged family is required.

For a Hilbert-valued bilinear polynomial \(J\) with \(\mathbb E\|J\|^2\le1\), conditioning first on one Gaussian block and then the other gives \(\mathbb E\|J\|^{2k}\le(k!)^2\). Indeed, for a deterministic linear map, \(\|MB\|^2\) has the law of a nonnegative weighted sum of mean-one independent exponentials; convexity gives \(\mathbb E\|MB\|^{2k}\le k!\|M\|_{\rm HS}^{2k}\). The random matrix in the second conditioning is itself a Gaussian linear map into Hilbert–Schmidt space. For any unit bilinear test \(J\), telescoping the three tensor factors gives
\[
 |\langle T(U)-T(F),J\rangle_{L^2}|
 \le\sqrt a\,\|(1+\|F\|+\|F\|^2)\|J\|\|_{L^2}
 \le(1+2+6)\sqrt a .
\]
Here Hölder uses the fourth moments of \(F,J\) for the middle term and their sixth moments for the last. Taking the supremum over those tests controls the projected difference.

## The four Wick contractions

Choose matrix coordinates \(F_i=B^\top M_i\overline C\). Define \(K_{ij}=\langle M_i,M_j\rangle_{\rm HS}\), \(D_B=\sum_i M_iM_i^*\) and \(D_C=\sum_i M_i^*M_i\). Both \(D\)'s have trace \(c_2\). In \(\|F\|^2\) the centered quadratic part depending only on \(B\) has squared norm \(\operatorname{tr}D_B^2\), and the \(C\) part similarly gives \(\operatorname{tr}D_C^2\). The sector with one centered \((1,1)\) factor in **each** block has squared norm \(\operatorname{tr}K^2\). Indeed its coefficients on the product of \(B_b\overline B_{b'}-\delta_{bb'}\) and \(\overline C_c C_{c'}-\delta_{cc'}\) are \(\sum_i (M_i)_{bc}\overline{(M_i)_{b'c'}}\). Each centered coordinate family is orthonormal for the complex \(L^2\) inner product. The sum of absolute squares of these coefficients is the claimed trace.

The following conditional test bounds estimate all three traces. For a standard complex Gaussian vector \(B\), Hermitian \(H\) and positive \(D\), the complex Wick formula gives
\[
 \mathbb E\big[(B^*DB)(B^*HB-\operatorname{tr}H)^2\big]
 =\operatorname{tr}D\,\operatorname{tr}H^2+2\operatorname{tr}(DH^2)
 \le3\operatorname{tr}D\,\operatorname{tr}H^2 .
\]
For a real normalized test \(J\) in the centered \(B\)-quadratic sector this implies \(\mathbb E(\|F\|^2 J^2)\le3c_2\le3\), by integrating out \(C\); the same holds with \(B,C\) reversed. For a real normalized test in the product of the two centered quadratic sectors the corresponding bound is \(9c_2\le9\). First condition on \(C\) in the displayed Wick formula. The remaining factors are \(\mathbb E_B\|F\|^2\), a positive quadratic in \(C\), and \(\mathbb E_B J^2\), a sum of squares of centered real Hermitian quadratics in \(C\), by expansion in an orthonormal real basis for the \(B\)-quadratics. Apply the same formula again.

For each of the three sectors \(J\) is centered. Since \(\|U\|=1\), Cauchy–Schwarz gives
\[
 |\mathbb E[J\|F\|^2]|
 \le\sqrt a\,\|(1+\|F\|)J\|_{L^2}.
\]
The sector projections of \(\|F\|^2\) are real. Taking the real normalized tests in each sector gives \(\sqrt{\operatorname{tr}K^2}\le4\sqrt a\) and \(\sqrt{\operatorname{tr}D_B^2},\sqrt{\operatorname{tr}D_C^2}\le(1+\sqrt3)\sqrt a\).

In the projection of \(F_iF_j\overline{F_k}\), one contraction is required in each of \(B,C\). There are four ordered choices. Contract both families from \(F_i\) against \(\overline{F_k}\), or contract both from \(F_j\). Each resulting tensor has squared norm \(c_2\operatorname{tr}K^2\). The other two choices have coefficient arrays \(M_iM_k^*M_j\) and \(M_jM_k^*M_i\). For either,
\[
 \sum_{ijk}\|M_iM_k^*M_j\|_{\rm HS}^2
 =\sum_k\operatorname{tr}(D_B M_kD_C M_k^*)
 \le c_2\|D_B\|_{\rm op}\|D_C\|_{\rm op}.
\]
The triangle inequality, including the projected difference already proved, gives \(\sqrt{E_2}\le[9+2\cdot4+2(1+\sqrt3)]\sqrt a\). Its squared coefficient is \(373+76\sqrt3<505\).

## Signed comparison

Write \(a_0=\pi/4,\ a_1=\pi/32,\ a_2=3\pi/256\), \(c_4=\|P_4U\|^2\), \(D_2=\|P_2(U\otimes\overline U)\|^2\). For independent copies let \(m_j=\mathbb E|\langle U,U'\rangle|^j\). Expansion of the conditional complex phase correlator through order five, as in the [finite block calculation](FINITE_BLOCK_RESPONSE.md), gives
\[
\begin{aligned}
 L&=\frac{V^*-V}{e+\nu}=a_0p(1-c_2)+2a_1xp^2m_2,\\
 \Delta_5-\Delta_5^*
 &=-a_0p c_4+a_1[3x^2p(1-c_2)+2xp^2D_2-p^3E_2]
       +a_2[6x^3p^2m_2+3xp^4m_4].
\end{aligned}
\]
Here the independent-copy contraction is circular by the two charges, and the order-two projection of \(U\otimes U\) vanishes by its doubled charges. Under simultaneous physical rotation the two phase responses have charge one. Thus the third and fifth real OU coefficients are precisely their complex \((2,1)\) and \((3,2)\) pairings. The first-chaos projection of the half-difference vanishes by the separate rotations of \(A,B,C\). At noise correlation one their ordinary half-difference norm agrees with the diffuse value since \(G\), conditional on all coordinates other than \(A,Z\), is standard complex Gaussian. These facts give the first equality from the physical payoff identity.

By Bessel \(c_4\le1-c_2\). All other displayed terms except the two signed costs are nonnegative. Therefore \(\Delta_5^*-\Delta_5\le(a_0p+505a_1p^3)(1-c_2)\le(1+505p^2/8)L\). This includes \(p=0\) and \(x=0\) directly.

For the equal normalized triple-product blocks, the sharper identity \(E_2=4c_4\) from the finite block calculation works for every \(n\). At \(n=1\) only the coincident-index coefficient occurs. The same proof replaces \(505\) by \(4\) throughout; the multiplicative cost is \(1+p^2/2\).

~~~sh
python3 -IB -O experiments/quintic-signed/code/gaussian_driver_fifth_tariff.py
~~~
