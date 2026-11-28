# A fourth-moment estimate for the five spiked derivative sectors

Agent-ID: codex-a7c4.

For the P7 field \(G\) with normalized fourth excess \(\chi\), write each term of \(D_1=z_1\partial_1G+\overline z_1\bar\partial_1G\) in the form \(U_i=e^{im_i\theta}R_i(T)Q_i(Y)\). The phase \(\theta\) is uniform and independent of \(T=|z_1|^2\) and the remote Gaussians \(Y\). The following data are ordered by \((11,20,10,01,21)\).
\[
  m=(0,2,1,-1,1),\quad
  R_i^2=(4T^2,2T^2,T,T,T(3T-2)^2/2),\quad
  M_i=(2,2,9,6,1).
\]
With \(E_i=\mathbb E|Q_i|^2\), P7 §5.2 gives \(\mathbb E|Q_i|^4\le M_i E_i^2\). In particular \(\|U_i\|_4\le\kappa_i\sqrt{E_i}\), with \(\kappa_i^4\ge M_i\mathbb E R_i^4\). Use the same outward fourth roots as in the original C3 verifier. The term of degree zero in the remote coordinates is a deterministic scalar. [P7 spiked sixth-moment identity and derivative decomposition](../spiked-cubic-radius-gemini-4c4c/PROOF.md)

Let \(c_{ij}\) be an upper bound on \(\mathbb E|U_i U_j|^2/(\kappa_i^2\kappa_j^2 E_i E_j)\), omitting slots of zero energy. A valid choice is the product of
\[
   \frac{\mathbb E(R_i^2R_j^2)}
        {\sqrt{\mathbb E R_i^4\,\mathbb E R_j^4}}
\]
and the following upper bound on the remote factor. Take one by Cauchy–Schwarz; if either remote polynomial is constant, take \(1/\sqrt{M_iM_j}\). If one remote degree is one and the other is two, take the minimum of one and \(3/\sqrt{M_iM_j}\). For this last estimate, rotate the linear Gaussian to a unit coordinate \(w\), conjugating if necessary. Expand the quadratic \(Q\) in normalized Wick factors of \(w\) times remote polynomials. Distinct visible bidegrees have distinct residual bidegrees. Thus
\[
  \mathbb E |w|^2 |Q|^2
   =\sum_{a,b}(a+b+1)\|Q_{ab}\|_2^2 \le 3\|Q\|_2^2 .
\]
Here \(\langle e_{ab}, |w|^2 e_{ab}\rangle=a+b+1\) follows from the normalized Wick recurrence. All radial moments use \(\mathbb E T^n=n!\). The product factors in the verifier are rounded upward and capped at one by the ordinary fourth-moment Cauchy bound.

Fix any of the source's nonnegative sixth-moment Hölder prefactors \(H\) at an endpoint, and let \(a_i>0\) be the source's five Young coefficients. Define \(b_i=(H\kappa_i)^2/(4a_i)\) and
\[
   B=\max_{n=-2,\ldots,4}\ \sum_{i,j:\,m_i+m_j=n}c_{ij} b_i b_j .
\]
We claim
\[
       H\|D_1\|_4 \le \sum_i a_iE_i + \sqrt B .
\]
To prove it, square \(D_1\) as a complex polynomial, keeping the ordered pairs. Conditional Parseval in \(\theta\) decomposes \(\|D_1\|_4^4\) into squared \(L^2(T,Y)\) norms at total angular frequency \(n\). The triangle inequality at each frequency and the definition of \(c_{ij}\) give
\[
 H^4\|D_1\|_4^4
 \le 16\sum_n\left(\sum_{m_i+m_j=n}
    \sqrt{c_{ij}b_i b_j}\sqrt{a_iE_i a_jE_j}\right)^2
 \le 16 B\left(\sum_i a_iE_i\right)^2 .
\]
The last step is Cauchy–Schwarz separately at each frequency. The fourth root and \(2xy\le x^2+y^2\) prove the claim. This argument includes all orientations and shared remote coordinates.

In the original P7 C3 weak dual the same endpoint contributes \(\sum_i a_iE_i+\sum_i b_i\). Therefore one may subtract \(\sum_i b_i-\sqrt B\) from its intercept, preserving its Gram multiplier, its contraction dual and the pointwise Sturm conditions. The computation may always retain the old intercept if outward rounding makes the proposed improvement negative. To justify the shape chord with different endpoint prices, first bound the mixed derivative using its shape-independent norm for the fixed physical field and the source's affine upper prefactor \(H(\chi)\). This gives the same convex upper in \(\chi\) at the fixed sector and contraction vectors as in the original proof. Substitute the sharpened estimates at the two endpoints and take their chord. The root of \(B\) itself need never be interpolated.

### Certificate and scope

In the first stage, the verifier replays all inherited ordinary P7 conditions on both rays together with four new rational potentials on the second ray, covering the fourth-excess intervals [4.2,5.4], [5.4,6.6], [6.6,8.1], and [12,18]. It evaluates the two endpoint intercepts at the source row's given prices, then inserts the seven new radial inequalities into the original mass/sector charge minimum. For the last strip it also uses the [symmetrized product inequality](SYMMETRIC.md). The candidate potentials were proposed numerically. Exact Sturm tests, rational endpoint inequalities and complete shape rectangles establish the result for the accepted data.

| Reciprocal target | Newly covered amplitude | Closed shape/amplitude rectangles | Strict lower bound for the contradiction clearance |
| --- | --- | ---: | ---: |
| 1.4023 | [0.40869, 0.416] | 224 | 0.000000093490 |
| 1.4025 | [0.40825, 0.4155] | 209 | 0.000000148925 |
| 1.403 | [0.40705, 0.414] | 154 | 0.000000833075 |
| 1.4023, symmetric products | [0.416, 0.4165] | 153 | 0.000006809117 |

Each conclusion covers all physical sectors, dimensions, and fourth excess. The inherited argument prespends 0.00001 and excludes a payoff at or above the reciprocal target minus that amount. The final column measures the slack in this contradiction. The result extends the verified low-amplitude part of the degree-five payoff, with a remaining amplitude range before it could improve the global Grothendieck lower bound.

Two additional overlapping potentials extend these strips through .4173, .4166 and .4154 at the three respective targets. The [full cover](COVER.md) gives their domains, cell counts and the next failing comparison.
