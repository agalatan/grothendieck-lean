<!-- New research note authored for #521 on 17 November 2026. Agent-ID: codex-6d92. -->
# Directional and independent-block content bounds

Agent ID codex-6d92. Refs #509. The analytic statements are **P, author only** and the scalar replay is **C, author only**.

Write \(u=E|q|^2\), \(\delta=E|q|^4-2u^2\) and \(\chi=\delta/u^2\) for \(u>0\). Let \(T_{ij,k}=T_{ji,k}\) be the complex tensor, \(A_1,A_2\) its one-slot Gram matrices, \(M_{ij}=\sum_{kl}T_{ik,l}T_{jl,k}\), and \(W_{iab;c}=\sum_l T_{il,c}T_{ab,l}\). Denote \(a=\|A_1\|_{\rm HS}\), \(b=\|A_2\|_{\rm HS}\), \(m=\|M\|_{\rm HS}\), and \(y=\|\operatorname{Sym}_{i,a,b}W\|_{\rm HS}\). The Wick formulas in CircularFourth.lean give
\[
u=2\|T\|_{\rm HS}^2,\qquad \delta=32a^2+8b^2+32m^2+96y^2.
\]
Schatten Cauchy–Schwarz on the swap of the other two tensor slots gives \(m\le a\). Writing out the norm of \(W\) gives \(\|W\|_{\rm HS}^2\le ab\), so symmetrisation gives \(y^2\le ab\).

## Fourth excess and influence

Put \(\tau_j=2\|A_j\|_{\rm op}/u\) for \(j=1,2\), as in #518. Since \(\operatorname{tr}A_j=u/2\), the Gram bounds are \(a^2\le u^2\tau_1/4\) and \(b^2\le u^2\tau_2/4\). Hence
\[
\chi\le16\tau_1+2\tau_2+24\sqrt{\tau_1\tau_2}\le42\max(\tau_1,\tau_2).
\]
Equal sums of \(N\) independent copies of the one-coordinate Wick cubic attain equality, with \(\chi=42/N\) and \(\tau_1=\tau_2=1/N\). The \(\max(\tau_1,\tau_2)\le1/455\) regime of #518 lies within its \(\chi\le0.2209\) bound.

## Directional improvement of the OU estimate

This estimate was found by the Stein worker for #509 and re-derived by codex-6d92. Rotate coordinates so the unit holomorphic direction is \(X=z_0\), and put \(H=\sqrt2\operatorname{Re}X\), \(F=\operatorname{Re}q\). Let \(p=(A_1)_{00}\), \(s=(A_2)_{00}/2\), \(t=|M_{00}|\), \(A=(a^2-p^2)^{1/2}\), and \(B=(b^2/4-s^2)^{1/2}\). The two phase charges of \(\partial_0q\) and \(\bar\partial_0q\) are \(0\) and \(2\). Using \(E|\partial_0q|^2=4p\), \(E(\partial_0q)^2=4M_{00}\), and \(E|\bar\partial_0q|^2=4s\) gives \(E(D_HF)^2=p+s+\operatorname{Re}M_{00}\le p+s+t\).

Split the index \(l\) in \(W\) into \(l=0\) and \(l\ne0\). For each \(c\), the first piece is a vector times a symmetric matrix. Its squared norm after symmetrizing is at least one third of the original squared norm. To see this, average over the three places for the vector. The cross inner products are squared norms of the matrix applied to the conjugate vector. Summing in \(c\) gives \(2ps/3\) as a lower bound on the symmetrized first squared norm. The remaining part has squared norm at most \(\|(A_1)_{l,l'\ne0}\|_{\rm HS}\|(A_2)_{l,l'\ne0}\|_{\rm HS}\le2AB\), by expanding the norm before symmetrizing. Therefore
\[
\delta/32\ge p^2+s^2+t^2+A^2+B^2+6(\sqrt{ps/3}-\sqrt{AB})_+^2
\ge p^2+s^2+t^2+ps/2.
\]
For the last step set \(x=\sqrt{AB}\) and \(z=\sqrt{ps/3}\). Then \(A^2+B^2\ge2x^2\) and \(2x^2+6(z-x)_+^2\ge3z^2/2\), by completing the square on \(x\le z\) and by \(2x^2\ge2z^2\) on \(x\ge z\). Using \(p^2+s^2+ps/2\ge5(p+s)^2/8\) and weighted Cauchy–Schwarz yields \(E(D_HF)^2\le\sqrt{13\delta/160}\).

For a real odd angular score \(m_*\), let \(\Psi\) be the one-dimensional OU resolvent used in §§3.1–3.3 of [gemini-5331’s #518 proof at b18e47309](https://github.com/agalatan/grothendieck-lean/blob/b18e47309ed0a2f0a76bdda47374f871fbc5552d/research/conjecture-K/sources/raw-content-2026-11-17-gemini-5331/PROOF.md). Those sections give the baseline raw-content bound used below. The directional improvement and the independent-block argument here strengthen that bound. The identity is \(E[Hm_*(F)]=E[D_HF(\Gamma-3EF^2)\Psi''(F)]\), where \(\Gamma=\|DF\|^2\). It follows by one integration by parts and testing the resolvent equation against the second chaos \(D_HF\). Since \(\operatorname{Var}(\Gamma)\le2\kappa_4(F)\) and \(\kappa_4(F)=3\delta/8\), the bound above improves \(E(D_HF)^2\le\sqrt{3\delta/32}\) by the factor \(\sqrt{13/15}\). Thus every \(K(u)\delta^{3/2}\) bound on squared content obtained by that proof improves by the same factor.

## Disjoint independent blocks

If \(q=\sum_j q_j\) uses disjoint coordinate blocks, put \(\delta_j=E|q_j|^4-2(E|q_j|^2)^2\). For a linear direction in block \(j\), integrate out the other blocks. The angular score becomes \(m_*(x)=E[m_A(x+\operatorname{Re}\sum_{i\ne j}q_i)]\) by rotation invariance and Fubini. It is odd and \(\|m_*'''\|_\infty\le\|m_A'''\|_\infty=32g_A'(0)/\pi\). Use \(\|\Psi''\|_\infty\le\|m_*'''\|_\infty/4\) in the real OU estimate and square the angular conversion factor \(\pi/(2\sqrt2)\). Orthogonality of the block linear spaces gives
\[
C_A(q)^2\le\sqrt{13/15}\,\frac{3\sqrt6}{4}\,g_A'(0)^2\sum_j\delta_j^{3/2}
<7.98\sum_j\delta_j^{3/2}
\]
when at least one block has positive energy. The bound allows arbitrary block dimensions and shapes. In particular every sum of \(N\ge95\) equal-energy disjoint blocks satisfies the weak inequality over the full energy band. Use the sharp fourth-moment cap to get \(\sum_j\delta_j^{3/2}\le42^{3/2}u^3/N^2\), then use the inherited remote cap \(S-\Lambda+10^{-4}\ge10^{-4}-3.6\cdot10^{-7}\) of STATUS 3.3. This criterion includes \(\chi=42/95\) from equal Wick blocks.

The python-flint replay is in code/content-509-codex-6d92/verify_blocks.py. It recomputes \(g_A'(0)\) using the positive kernel formula in CONTENT_KERNELS.md. With \(A=a_{\rm vis}+b_{\rm vis}x^2\), substituting \(t=x^2\) gives \(g_A'(0)=(3/8)\int_0^\infty e^{-x^2}(A^{-3}+2b_{\rm vis}A^{-4})\,dx\). The replay bounds the Gaussian tail at \(x=8\) and checks the final comparisons in rational arithmetic.
