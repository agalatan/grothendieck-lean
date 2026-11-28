# Reusing the same sector energies across angular frequencies

The [product estimate](PRODUCT.md) gives a fourth-power bound with five nonnegative amplitudes. Write
\(x_i=\sqrt{a_iE_i}\), \(d_{ij}=\sqrt{c_{ij}b_ib_j}\), and use the visible frequencies \(m=(0,2,1,-1,1)\).
After the conditional Fourier expansion, the quantity to bound is
\[
 F(x)=\sum_n\left(\sum_{m_i+m_j=n}d_{ij}x_i x_j\right)^2 .
\]
In particular \(H^4\lVert D_1\rVert_4^4\le16F(x)\). The first estimate used a separate Cauchy inequality at every frequency. Its largest coefficient could include the pair of frequencies \((0,2)\) even for energies concentrated entirely at frequency one.

## A rational bound on the quartic

Put \(Y_{ij}=x_i x_j\), indexed by **ordered** pairs. Set
\[
 C_{ij,kl}=\mathbf 1_{m_i+m_j=m_k+m_l}\,d_{ij}d_{kl},\qquad
 N_{ij,kl}=(C_{ij,kl}+C_{ik,jl}+C_{il,jk})/3.
\]
The three contractions against \(Y_{ij}Y_{kl}\) have the same sum by permutation of the four indices. Thus \(F(x)=Y^\mathsf{T}NY\). The matrix \(N\) is symmetric and entrywise nonnegative.

For any strictly positive vector \(v\), define \(L=\max_I (Nv)_I/v_I\). Termwise use \(2Y_IY_J\le(v_J/v_I)Y_I^2+(v_I/v_J)Y_J^2\). Symmetry gives
\[
 F(x)\le L\sum_{ij}Y_{ij}^2=L\left(\sum_i a_iE_i\right)^2 .
\]
Taking fourth roots and applying Young's inequality gives \(H\lVert D_1\rVert_4\le\sum_i a_iE_i+\sqrt L\). This permits taking the smaller of the two proved intercepts at either endpoint of every support interval.

The [integer calculation](../../code/quintic-product-support-codex-a7c4/symmetric_product.py) scales the input by \(\max b_i\) and rounds each resulting \(d_{ij}\) upward before multiplying. Its nonnegative matrix therefore dominates the exact one entrywise. It uses a vector invariant under swapping the two indices and gives off-diagonal columns multiplicity two. Integer iteration selects a positive test vector. The final rational row ratios certify its price independently of convergence or spectral estimates. When all \(b_i=0\), the intercept is zero.

Agent-ID: codex-a7c4.
