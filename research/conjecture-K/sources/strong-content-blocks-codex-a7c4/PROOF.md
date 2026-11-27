# A strong peak content staircase and an independent-block criterion

Agent-ID: codex-a7c4. This paper proof and its rational certificates concern the peak-row raw A-content inequality (ledger 6.3.18).

Let $Z$ be a standard complex Gaussian with density $\pi^{-1}e^{-|z|^2}$. Use the peak visible profile \(L=Z(699/1250+(179/1250)|Z|^2)\). For a cubic $q\in H_{2,1}(\mathbb C^n)$ in independent remote Gaussian coordinates, write \(u=E|q|^2\), \(\delta=E|q|^4-2u^2\), and \(\chi=\delta/u^2\) for \(u>0\). The same-variance deficit is \(D=B(u)-E V(|q|^2)\), where \(V(z)=2E|L+\sqrt z|\) and \(B(u)=E V(uE_0)\) with \(E_0\sim\mathrm{Exp}(1)\) independent. Write \(C=\|\Pi_{1,0}(qg_A(|q|^2))\|_2\) for the raw A-content. Here $\Pi_{1,0}$ projects onto the complex span of the remote Gaussian coordinates, and $w g_A(|w|^2)=E_Z[(|Z|^2-1)\operatorname{ph}(L+w)]$.

## General cubics

For every dimension, \(C^2\le(6/25)D\) throughout each of these rectangles, including their boundaries.

| Maximum energy \(u\) | Maximum excess \(\chi\) |
|---:|---:|
| 0.002 | 42 (all cubics) |
| 0.004 | 10 |
| 0.006 | 4 |
| 0.008 | 2 |
| 0.012 | 1.15 |
| 0.018 | 0.4 |
| 0.024 | 0.2 |
| 0.030 | 0.12 |
| 0.035 | 0.09 |

Both columns are upper bounds. At \(u=0\) both sides vanish. At \(u>0\) use the following public inputs.

* Rows 3.2–3.3 give piecewise cubic upper caps on \(V(z)\) for \(0\le z\le2\) and an affine upper cap for \(z\ge2\). The degree-eight KRAW Rice lower polynomial \(b(u)\le B(u)\) comes from row 6.3.43, §5.2. [Original caps](../../code/audit-2026-11-15-codex-a7c4/remote_stein_original/profile-caps.json) · [Cap audit](../reaudit-2026-11-15-codex-a7c4/REMOTE.md) · [Rice lower bound](../raw-content-2026-11-17-gemini-5331/PROOF.md)
* Row 3.4 gives \(E|q|^6\le u^3(6+9\chi+c\chi^{3/2})\), with \(c=40.45313\). The first two moments of \(|q|^2\) equal \(u\) and \((2+\chi)u^2\). [Fourth-moment estimate](../../../../Grothe/LowerAnalytic/CircularFourth.lean) · [Sixth cumulant](../../../../Grothe/LowerAnalytic/SixthMoment.lean) · [Gaussian moment hypotheses](../../../../Grothe/LowerAnalytic/Bridge.lean)
* The directional refinement in row 6.3.42 and the smoothed bound in row 6.3.43 give \(C^2\le\sqrt{13/15}\,K_A(u)u^3\chi^{3/2}\). Use the public piecewise rational upper caps for \(K_A\). [Directional refinement](../content-509-codex-6d92/BLOCKS.md) · [Smoothed estimate](../raw-content-2026-11-17-gemini-5331/PROOF.md)

For every stored cubic \(P(z)=\sum_{j=0}^3 p_jz^j\), the verifier proves \(p_3>0\) and \(P\ge V\) on the half-line. It compares against the original profile caps using Bernstein coefficients on all finite intervals through 32, and checks all coefficients of the translated difference against the affine ray after 32. Consequently the upper bound on $E V(|q|^2)+(25/6)C^2$ is
\[
 p_0+p_1u+(2+\chi)p_2u^2+
 \left[(6+9\chi+c\chi^{3/2})p_3+
 \frac{25}{6}\frac{14}{15}K_A(u_0)\chi^{3/2}\right]u^3
\]
on a slab starting at \(u_0\), using the cap at its left endpoint. This is convex in \(\chi\). Take both excess endpoints, rounding only the positive \(\chi^{3/2}\) terms upwards. Subtract from \(b(u)\) and check all nine Bernstein coefficients on the energy interval. Five global majorants and thirteen rectangles give a combined margin strictly greater than \(94956704/10^{15}\). The verifier establishes exact coverage.

For all \(u\le0.0007\) use the earlier all-shapes result 3.19a. For \(u\le0.012,\chi\le0.25\), and for \(u\le0.0463,\chi\le0.0784\), use the zero-slack content bound in 6.3.43(c). These regions supply the lower edges of the table. [All-shapes small-energy proof](../peak-energy-codex-a7c4/PROOF.md) · [Zero-slack regions, Theorem 2](../sliver-closure-2026-11-24-gemini-21d5/PROOF.md)

## Independent blocks, including the top of the peak band

Let $q=\sum_{j=1}^N q_j$ with each $q_j$ a charge-one $(2,1)$ cubic on its own Gaussian coordinate block. Disjoint coordinate blocks give independence and orthogonality of their linear spaces. Write \(u_j=E|q_j|^2\), \(\delta_j=E|q_j|^4-2u_j^2\), and
\[
 s=\frac{\sum_j\delta_j^{3/2}}{u^3}.
\]
Each of the following conditions gives the same strong bound for every \(0<u\le0.0463\).

1. Every block has energy at most \(u/41\). In particular, 41 or more equally energetic independent blocks suffice with arbitrary block shapes.
2. The unnormalized fourth excesses satisfy \(28(\sum_j\delta_j^{3/2})^2\le(\sum_j\delta_j)^3\). It suffices that each block contributes at most \(1/28\) of the total fourth excess. This includes any sum of at least 28 equal-excess blocks, in particular iid blocks on disjoint coordinates.
3. \(0.65\le\chi\le1.4\) and \(s\le0.21\chi\), or \(1\le\chi\le1.4\) and \(s\le0.22\chi\).

Independence makes the charge-balanced fourth and sixth cumulants additive. One way to verify the constants is to use the formal series \(A_j(t)=\sum_{k=0}^3 E|q_j|^{2k}t^k/(k!)^2\) modulo \(t^4\). Circularity and independence give \(A=\prod_j A_j\) for the sum by the binomial theorem. The quantities \(4[t^2]\log A\) and \(36[t^3]\log A\) are respectively \(\delta\) and \(E|q|^6-9uE|q|^4+12u^3\). Apply row 3.4 separately to each block to get
\[
 \delta=\sum_j\delta_j,\qquad E|q|^6/u^3\le 6+9\chi+c s.
\]
The same \(s\) bounds the content by row 6.3.42, \(C^2\le7.98 u^3s\). Thus the previous price replaces \(c\chi^{3/2}\) by \(cs\), and replaces the directional OU term by \((25/6)7.98s\).

Write \(m=\max_j(u_j/u)\). Since \(0\le\delta_j\le42u_j^2\), one has \(s\le\sqrt{42}\,m\chi\) and \(\chi\le42m\). Under condition 1 use \(s\le(6481/41000)\chi\) and \(\chi\le42/41\). For condition 2, the zero-excess case follows from 6.3.43(c). Otherwise set \(w_j=\delta_j/\delta\) and \(t=\sum_j w_j^{3/2}\). Then \(s=t\chi^{3/2}\) and the hypothesis gives \(t\le1/\sqrt{28}<189/1000\). Since \(u_j\ge\sqrt{\delta_j/42}\) and \(1=(\sum_j w_j)^2\le(\sum_j\sqrt{w_j})t\) by Cauchy–Schwarz,
\[
 \chi\le\frac{42}{(\sum_j\sqrt{w_j})^2}\le42t^2\le3/2.
\]
The sufficient single-block cap follows from \(t\le\sqrt{\max_j w_j}\). Under condition 3 use its stated linear bound for \(s\). A shared Gaussian bath creates dependencies for which the cumulant and projection arguments above require a separate proof. Each price is convex in \(\chi\). Four global majorants and fourteen rectangles give a combined margin strictly greater than \(461567833/10^{15}\) on \(0.008\le u\le0.0463\) and the specified shape bands, down to \(\chi=0.0784\) for conditions 1–2. For smaller excess take 6.3.43. For smaller energies take the general staircase up to \(\chi=2\) at \(u=0.008\).

## An obstruction for scalar radial moments and Gaussian linear orthogonality

At \(u=0.0463,\chi=1\), there exists a charge-one circular function \(q\) of two standard complex Gaussian coordinates with \(\Pi_{1,0}q=0\) and
\[
 E|q|^6/u^3=136/9,\qquad D(q)<1336/10^6,\qquad C(q)^2=7/20000>(6/25)D(q).
\]
The function takes two different absolute values with positive probabilities. A polynomial on a Gaussian space with this property would have a nonconstant real polynomial $|q|^2-A$ vanishing on a set of positive Lebesgue measure, which is impossible. Thus the construction lies outside homogeneous cubic chaos. This gives a limitation of a proof that uses only the stated scalar second, fourth and sixth moment constraints, Gaussian first-chaos orthogonality and the published numerical scalar content caps. Cubic derivative identities, tensor contractions and matrix Stein constraints supply additional information beyond this relaxation. The example therefore leaves the proposed inequality for true $(2,1)$ cubics open.

Set \(A=5u/9, B=11u/2, p=8/89\). Assign squared amplitudes \(A,B\) probabilities \(1-p,p\). Their normalized first three moments are \(1,3,136/9\), and the last is below the row 3.4 upper bound \(15+40.45313\). To bound \(D\) above, \(V'\) is completely monotone (KRAW §5.2). Even-degree Taylor polynomials through degree eight give global lower bounds on \(V\), and the odd-degree polynomials give upper bounds. The odd-degree polynomials can be averaged against \(uE_0\) termwise using \(E E_0^j=j!\). The verifier evaluates these with directed rational bounds on the public moments.

Let \(g=g_A\) and write \(-g(v)=\int e^{-tv}\nu(dt)\) with moments \(M_1,M_2\). Jensen's inequality under the probability measure \(t\,d\nu/M_1\) gives \(g'(v)\ge M_1\exp(-vM_2/M_1)\). Integrate from \(A\) to \(B\), using the lower endpoint of \(M_1\) and upper endpoint of \(M_2\) in this integrand. The checker obtains \(\Delta=g(B)-g(A)>0.2464\). It uses odd and even Taylor polynomials for the lower and upper endpoints of each negative exponential.

Let \(X,W\) be independent standard complex Gaussians, \(R=|X|\), and \(r\) satisfy \(e^{-r^2}=p\). On \(J=\{R\ge r\}\), take the radius of \(q\) to be \(\sqrt B\). On its complement take radius \(\sqrt A\). Set its phase to \(\operatorname{ph}(X)\sigma\), where \(\sigma\) is a real random sign with conditional means
\[
 E[\sigma\mid J]=\frac{t}{\sqrt B E[R1_J]},\qquad
 E[\sigma\mid J^c]=\frac{-t}{\sqrt A E[R1_{J^c}]},
 \qquad t=\frac{\sqrt{7/20000}}{\Delta}.
\]
Use the continuous uniform variable \(1-e^{-|W|^2}\) and a fixed threshold on each event to implement these means independently of the value of \(R\) within the event.

To show the two means have modulus below one, the checker brackets \(1.55<r<1.56\). On the high event \(E[R1_J]=rp+\int_r^\infty e^{-s^2}ds\). Bound the integral below by eight right-endpoint rectangles of width \(1/8\) starting at 1.56. On the low event bound \(R\) below by each left endpoint on the intervals partitioned by \(1/4,1/2,1,3/2\). The directed rational comparisons yield \(B(E[R1_J])^2\Delta^2>7/20000\) and the corresponding inequality for \(A,J^c\).

By construction \(E[\bar X q]=t-t=0\) and \(E[\bar Xqg(|q|^2)]=t\Delta\). Both pairings against \(W\) vanish by angular symmetry. The function has charge one under simultaneous rotation and the announced squared content follows. It also meets the ordinary explicit caps \((58/125)u^2\) and \(\sqrt{13/15}(9/2)u^3\) at this energy. The latter is the published numerical OU cap, with \(9/2\) bounding the smoothed kernel functional.

The Gaussian variance loss and the smoothed B-response estimate give exact joint raw A+B on the staircase and all four block classes. [Joint proof, 7.4.18](JOINT.md)

## Exact replay

From the repository root run

```sh
python3 -IB research/conjecture-K/code/strong-content-blocks-codex-a7c4/verify.py
```

The verifier reads all nine rational cubic polynomials and their assignments. It checks the whole radial half-line and the closed parameter domains using rational arithmetic, then verifies the two-radius construction and rejects four deliberately corrupted certificates. Numerical linear programming proposed the coefficients. Replay requires only the Python standard library and uses the public KRAW interval and Bernstein routines, which require assertions enabled. [Verifier](../../code/strong-content-blocks-codex-a7c4/verify.py) · [General certificate](../../code/strong-content-blocks-codex-a7c4/cover.json) · [Block certificate](../../code/strong-content-blocks-codex-a7c4/blocks.json) · [Input SHA-256 manifest](../../code/strong-content-blocks-codex-a7c4/PUBLIC_INPUTS.sha256)

The rational replay takes the published profile envelope, the cubic moment inequalities and the analytic content bounds as inputs. The upstream numerical routine recomputes the Rice lower polynomial and directed Laplace moment enclosures. [KRAW arithmetic](../../code/raw-content-2026-11-17-gemini-5331/verify_raw_content.py) · [Independent-block content estimate](../content-509-codex-6d92/BLOCKS.md) · [Ledger of analytic inputs](../../STATUS.md)
