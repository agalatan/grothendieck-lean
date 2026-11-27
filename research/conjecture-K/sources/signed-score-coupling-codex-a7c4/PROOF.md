# Cancellation between the peak A and B angular scores

Agent-ID: codex-a7c4. Fix the peak profile \(L=Z(a+b|Z|^2)\) with \((a,b)=(699/1250,179/1250)\) and price \(p_0=2500/1891\). Let \(q\) be a remote complex Wick cubic of bidegree \((2,1)\), \(u=E|q|^2\), \(\delta=E|q|^4-2u^2\), and \(\chi=\delta/u^2\) for \(u>0\). Write \(B_G(u)=2E|L+\sqrt u W|\) for independent standard proper complex Gaussian \(W\) and \(D=B_G(u)-2E|L+q|\). Let \(c_A,c_B\) denote the raw first-chaos content vectors. For \(\rho=5053/10000\),
\[
 \|(m_B-\rho m_A)'''\|_\infty<1.344,\qquad
 \|c_B-\rho c_A\|^2\le .03\,\delta^{3/2}.
\]
For \(r=59/125\) the respective constants are .563 and .00523. The derivative bounds hold on the whole real line. For a sum on disjoint Gaussian coordinate blocks the projected bound holds with \(\sum_j\delta_j^{3/2}\) in place of \(\delta^{3/2}\). The strict comparison for the two even shells below and the [six-sector retained result](SIX.md) use these estimates.

## Coupling the positive measures

Use the positive Laplace measures \(\mu_A,\mu_B,\mu_C\) of the three public radial densities. Set \(s=t(a+bt)^2\), \(A=a+bt\), \(J=a+3bt\). In this coordinate, \(f_A=e^{-t}/A^2\), \(f_B=e^{-t}/(A^3J)\), \(f_C=f_B/A\), and \(-f_A'=f_B+2bf_C\). Uniqueness of Laplace transforms gives \(\lambda\,d\mu_A=d\mu_B+2b\,d\mu_C\). There is also a positive probability measure \(\nu\) on \([0,\infty)\) satisfying
\[
 a\mu_C=\mu_B*\nu.
\]
Indeed \(-\partial_s\) maps \(A^{-i}J^{-j}\) to \(ib A^{-i-2}J^{-j-1}+3jb A^{-i-1}J^{-j-2}\). Starting at \((i,j)=(1,0)\) gives complete monotonicity of \(1/A\). The Laplace measure for \(a/A\) has mass one by evaluation at zero. Multiplying its transform by \(f_B\) gives the assertion. [Radial densities, positive moments and measure identities](../third-audit-2026-11-15-codex-a7c4/CONTENT_KERNELS.md)

Write \(H(y)=(1-4y+4y^2/3)e^{-y}\), \(K_x(\lambda)=\lambda^{-1/2}H(\lambda x^2)\). In the real scores of KRAW, the A atom carries weight \(\lambda^{-1/2}\,d\mu_A\) and the B atom carries \(\lambda^{-3/2}\,d\mu_B/\sqrt2\), with the same angular reconstruction. Three derivatives of \(-x e^{-\lambda x^2}\) give \(6\lambda H(\lambda x^2)\). Thus
\[
 (m_B-rm_A)'''(x)=\frac{6}{\sqrt\pi}\left[
 (1/\sqrt2-r)\int K_x\,d\mu_B-2br\int K_x\,d\mu_C\right].
\]
All displayed moments are finite. KRAW's atom estimate gives \(|H(y)|\le1\). Differentiating with respect to \(\lambda^{-1/2}\) gives \(H(y)-2yH'(y)=(1+6y-12y^2+8y^3/3)e^{-y}\), of modulus at most 2 for every \(y\ge0\). The replay bounds the absolute polynomial by twice the degree-eight lower Taylor polynomial for \(e^y\), verifying both signs on \([0,4]\) and on the translated positive half-line. Consequently for \(\eta\ge0,\lambda>0\)
\[
 |K_x(\lambda)-K_x(\lambda+\eta)|
 \le 2[\lambda^{-1/2}-(\lambda+\eta)^{-1/2}].
\]
[Angular scores, atom maximum and projection estimate, §§3.1–3.3](../raw-content-2026-11-17-gemini-5331/PROOF.md)

Put \(I_A=\int\lambda^{1/2}d\mu_A\), \(I_B=\int\lambda^{-1/2}d\mu_B\), \(I_C=\int\lambda^{-1/2}d\mu_C\), so \(I_A=I_B+2bI_C\). For \(r\ge0\) couple \(\lambda\) and \(\lambda+\eta\) under \(\mu_B\otimes\nu\). The bound on the difference integrates to \(2(I_B-aI_C)\). With \(R=I_B/I_A\) and \(s_0=1+2b/a\), this proves
\[
 \frac{\|(m_B-rm_A)'''\|_\infty}{\|m_A'''\|_\infty}
 \le h_r:=|1/\sqrt2-r s_0|R+2r(s_0R-1).
\]
Here \(\|m_A'''\|_\infty=6I_A/\sqrt\pi=(32/\pi)g_A'(0)\); equivalently \(R=\sqrt2g_B'(0)/g_A'(0)\). The public half-moment recurrences give \(.6760686<R<.6760687\). Applying the directional OU bound to the signed score gives squared projected content at most \((14/15)(5353/625)h_r^2\delta^{3/2}\). In the disjoint-block case, integration over all other blocks convolves the score with a symmetric probability law. This preserves oddness and bounds its third derivative by the same supremum. Square each block estimate and sum on orthogonal linear spaces. [Directional gain and block projection](../content-509-codex-6d92/BLOCKS.md)

## Same-variance comparison for the two even shells over a price interval

Take \(G=q+(|Z|^2-1)r_A+Z^2\overline{r_B}/\sqrt2\) with arbitrary remote holomorphic linear forms \(r_A,r_B\) and shell energy \(V=\|r_A\|^2+\|r_B\|^2\). Write \(\Lambda_p(G)=E|L+G|+E|L-G|-p\|G\|^2\). The following holds throughout all nine general staircase regions of 6.3.44, its four full-band disjoint-block families, and the three inherited zero-slack rectangles of 7.4.18:
\[
 \Lambda_{p_0}(G)\le B_G(u)-p_0u-.037D,\qquad
 \Lambda_p(G)\le B_G(u)-pu-.001D-(p-p_{\min})V\quad(p\ge p_{\min}),
 \qquad p_{\min}=p_0-17/2000 .
\]
On each region use an envelope \(E\) with \(\|c_A\|^2\le E\le(6/25)D\). On the thirteen general rectangles take \(E=(14/15)K_A^{\rm tab}(u_{\rm left})\delta^{3/2}\) from the exact signed price in 6.3.44. The inherited rectangles pay at least this much in the KRAW/KSLIV or small-energy proof. On the fourteen block rectangles take \(E=7.98 u^3s_{\rm cap}\), where the certified shape cap majorizes \(\sum\delta_j^{3/2}/u^3\); below those rectangles use the inherited general regions. Thus \(E\ge4.2 H_0\), with \(H_0=\delta^{3/2}\) for a general tile or \(H_0=\sum\delta_j^{3/2}\) for a block tile. At \(u=0\) both contents vanish. [Verified staircase prices](../strong-content-blocks-codex-a7c4/PROOF.md) · [Inherited scalar deficit envelopes](../strong-content-blocks-codex-a7c4/JOINT.md)

For \(d=0\) or \(17/2000\), reducing the price to \(p_0-d\) reduces both diagonal entries of the signed shell cost by \(d\). Let \(A_0=1/4-d\), \(B_0=27/100-d\), \(m=59/500\), and \(r=m/A_0\). Completing the squares costs at most
\[
 \frac{E}{A_0}+\frac{(14/15)(5353/625)h_r^2 H_0}{B_0-m^2/A_0}.
\]
The verifier checks positivity of the denominator and bounds this expression by \(.963D\) and \(.999D\), respectively. For higher prices subtract \((p-p_{\min})(u+V)\) from both-shell payoff at \(p_{\min}\). This also proves the comparison with \(S(p)=\sup_v(B_G(v)-pv)\). [Global signed shell cost](../raw-joint-ab-gemini-4c4c/PROOF.md)

From the repository root run `python3 -IB research/conjecture-K/code/signed-score-coupling-codex-a7c4/verify.py`. It reuses the public KRAW interval library and checks the [input hashes](../../code/signed-score-coupling-codex-a7c4/PUBLIC_INPUTS.sha256). The retained six-sector consequence has its own algebra and hypotheses. [Six-sector theorem](SIX.md)
