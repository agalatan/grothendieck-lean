# An explicit finite lift of the graded mirror response

Agent-ID: codex-a7c4. Write \(P=P_{1,0},Q=P_{2,1},F=P_{3,2}\), \(e=191/250,\nu=d=47/2000,\alpha=e+\nu\). Fix a disk-valued function \(f(Z,W)\) on two independent standard complex Gaussians and put \(g(Z,W)=f(Z,-W)\). Suppose \(f(e^{i\theta}Z,e^{i\theta}W)=e^{i\theta}f(Z,W)\). Assign \(Z\) physical bidegree \((1,0)\) and \(W\) bidegree \((2,1)\). Suppose the graded payoff \(V_{\rm gr}=\langle f,[\nu I+(1-\nu)P-\alpha Q-d F]g\rangle\) is at least \(.7131156728\), with visible amplitude \(t> .8392\). The [central step-pair certificate](GRADED_STEP.md) also proves $t<.8394$ and $\Delta_{5,\mathrm{gr}}<-.00718$.

There is a single physical unimodular pair in dimension **300,001** with
\[
 .8392<t<.8394,\qquad \Delta_5<-.007176,\qquad
 \langle f_{\rm ph},[\nu I+(1-\nu)P-\alpha Q-dF]g_{\rm ph}\rangle
 >10000/14023+10^{-7}.
\]
The visible amplitude is preserved exactly. A simpler estimate gives dimension 540,001 with the same payoff margin. The result rules out the tested payoff cap for this particular full-debit witness. [Graded source](code/graded_step_certificate.py) · [Finite-dimensional replay](code/finite_graded_lift.py)

## A Gaussian coordinate with a specified physical expansion

Take \(N\ge2\) independent triples of fresh complex Gaussians \(A_i,B_i,C_i\) and an independent visible coordinate \(Z\). Almost surely
\[
 V_i=B_i\bar C_i/\sqrt N,\quad T=\|V\|^2>0,\quad U=V/\sqrt T,\quad G=\sum_i A_i U_i.
\]
Conditionally on \(B,C\), the law of \(G\) is standard complex Gaussian. Thus \((Z,G)\) has *exactly* the law of \((Z,W)\), and substituting \(G\) preserves the identity pairing.

For normalized Hermites expand \(f=\sum c_{abjk}H_{a,b}(Z)H_{j,k}(W)\). Only \(a-b+j-k=1\) occur by phase equivariance. At fixed \(B,C\), \(H_{j,k}(G)\) belongs to precise fresh \(A\)-bidegree \((j,k)\); its unit tensor is the separately symmetric \(U^{\otimes j}\otimes\bar U^{\otimes k}\). This follows by expanding its Wick generating function, or by the isometry on these unit tensors with Hermite inner products \(z^j\bar z^k\). The visible and \(A\)-bidegrees distinguish every index \((a,b,j,k)\). The actual physical projections therefore keep different such indices orthogonal, even after summing over the \(B,C\) bidegrees. Every individual pairing has the scalar sign \((-1)^{j+k}\) from reflection of \(G\). The argument extends to the whole expansion by \(L^2\) continuity.

Put \(s=j-k\). The tensor's charges under separate common rotations of \(B\) and \(C\) are \(s,-s\), so its total degree in \(B,C\) is at least \(2|s|\). For \(|s|\ge2\) the total physical degree already exceeds five. When \(s=0\), the visible charge is one. The only \(j=k\ge1\) terms in \(Q,F\) are the three terms in the table. When \(s=\pm1\) all pairing signs are negative. Keeping just the intended three graded negative terms provides an upper bound for the physical signed projections. The other odd contributions can only decrease those projections. The linear projection is exactly the graded visible \(Z\) coefficient, with no leakage. In particular \(t=|c_{1000}|\) is the first projection of both half-sums and incurs no loss.

| Graded mode | Physical cost incurred relative to the graded payoff, per squared coefficient |
|---|---:|
| \(W\) | at most \(\alpha L_N\) |
| \(H_{1,1}(Z) W,\ H_{2,0}(Z)\bar W\) | at most \(d L_N\) |
| \(Z H_{1,1}(W)\) | at most \((\alpha+2d)/N\) |
| \(H_{2,1}(Z) H_{1,1}(W),\ Z H_{2,2}(W)\) | at most \(d/N\) |

Every purely visible term is exact. For every index outside the table, the physical contribution is at least its graded contribution.

## Matrix projection and radius control

The cubic \(W_N=\sum A_i V_i\) is a unit physical \((2,1)\) vector. Its inner product with \(G\) is \(\mathbb E\sqrt T\), by integrating out \(A\). For its conjugate the corresponding statement holds in \((1,2)\). Multiplication by a normalized visible Hermite transfers both facts to the matching physical bidegree on the product space. Thus the lost relative squared norm in each intended cubic or fifth mode is at most \(1-(\mathbb E\sqrt T)^2\).

Here \(T\) is the mean of iid \(Y_i=|B_iC_i|^2\) with \(\mathbb E Y^j=(j!)^2\). The centered second and fourth moments of \(Y\) are 3 and 453, hence \(\mathbb E(T-1)^4=27/N^2+426/N^3\). Since \(\mathbb E T=1\),
\[
 1-(\mathbb E\sqrt T)^2 \le \mathbb E(\sqrt T-1)^2
 =\mathbb E\frac{(T-1)^2}{(1+\sqrt T)^2}
 \le L_N:=\frac{9}{25}\frac3N+4\left(\frac{27}{N^2}+\frac{426}{N^3}\right).
\]
Indeed \(T\ge1/2\) gives \(\sqrt T\ge2/3\), and on the complement \((T-1)^2\le4(T-1)^4\).

For \(H_{1,1}(G)\), the coefficient tensor is \(UU^*\) with Euclidean Hilbert–Schmidt norm. Its constant mode is \(I/N\) by the independent coordinate phases and permutation symmetry, of squared norm \(1/N\). Every off-diagonal entry has two differing coordinate charges in \(B\) and another two in \(C\), giving degree at least four. Put \(X_i=|U_i|^2\). Only the normalized centered exponentials \(|B_j|^2-1,|C_j|^2-1\) can appear in its degree-two projection, by separate coordinatewise radial symmetry. Against \(|B_j|^2-1\), exponential integration by parts yields
\[
 \mathbb E X_i(|B_j|^2-1)=\mathbb E X_i(\mathbf 1_{i=j}-X_j).
\]
Indeed, with \(x=|B_j|^2\) and all other radii fixed, \(x\partial_x X_i=X_i(\mathbf1_{i=j}-X_j)\); the boundary factor \(xe^{-x}X_i\) vanishes. The same identity holds for \(C\). For fixed \(i\), these coefficients in each block are \(c=1/N-\mathbb EX_i^2\) on the diagonal and \(-c/(N-1)\) elsewhere, since \(\sum_i X_i=1\) and the law is permutation invariant. Jensen and \(0\le X_i\le1\) give \(0\le c\le(N-1)/N^2\). Summing squares yields the degree-two norm bound \(2Nc^2(1+1/(N-1))\le 2/N\). This accounts separately for the cubic zero mode and the fifth degree-two mode in \(Z H_{1,1}(W)\).

For \(Z H_{2,2}(W)\) only the constant \(B,C\) mode enters the fifth projection. Its squared tensor norm equals \(\mathbb E|\langle U,U'\rangle|^4\), with \(U'\) independent. This is at most \(\mathbb E|\langle U,U'\rangle|^2=\mathrm{tr}[(I/N)^2]=1/N\).

## One bounded pair, one unimodular pair

The sum of all coefficient squares other than the visible \(Z\) is at most \(1-t^2\). The table's largest entry times \(1-t^2\) therefore bounds the total payoff loss. For the one-sided increase in signed fifth pairing alone its largest entry is \(\max(L_N,2/N)\). At \(N=180000\), the enclosed payoff loss is below \(.0000014\) and the fifth error below \(.0000033\). The participating physical dimension before rounding is \(1+3N\).

Use two independent extra standard complex Gaussians, one per response, and the uniform thresholds \(u=\{6\arg X/(2\pi)\},v=\{6\arg Y/(2\pi)\}\) where braces mean fractional part. For each bounded output \(b\), return \(+\operatorname{ph}b\) when its threshold is at most \((1+|b|)/2\), and \(-\operatorname{ph}b\) otherwise, taking \(\operatorname{ph}0=1\). The conditional average is \(b\). The centered residual is invariant under rotation by \(2\pi/6\) in its new coordinate, has zero angular average at every radius, and therefore has no projection in degrees zero through five. Indeed its nonzero angular Fourier frequencies are nonzero multiples of six, while a Hermite of total degree at most five has angular frequency of absolute value at most five. Consequently both physical linear, cubic and quintic projections are preserved individually. The ordinary pairing is preserved by conditional independence of the thresholds. The rounded functions are a single physical unimodular pair realizing every estimate above.

The same two thresholds can be extracted in the original $1+3N=540001$ coordinates. Use $u=\{6\arg A_1/(2\pi)\}$ and $v=\{6\arg B_1/(2\pi)\}$. The Gaussian-preserving two-torus acts by $(A,B,C)\mapsto(e^{i\alpha}A,e^{i\beta}B,e^{i(\alpha+\beta)}C)$. It fixes $Z,T,G$, and therefore fixes both original outputs. Haar averaging on this torus independently uniforms the two thresholds, preserving their ordinary paired integral by Fubini. Along the $\alpha$ orbit the first rounding discrepancy is sixfold periodic and has zero average on every orbit where $A_1\ne0$. Every product Hermite of total degree at most five transforms with $\alpha$ frequency of magnitude at most five, as each contributing coordinate weight is zero or one. The discrepancy is therefore orthogonal to all these Hermites. The $\beta$ orbit gives the identical argument for the second discrepancy; the two exceptional zero-coordinate sets are null. This construction directly preserves the same physical projections and identity without increasing dimension.

A second uniform estimate reduces the dimension to **300,001**, retaining payoff $>10000/14023+10^{-7}$ and signed fifth loss below $.000004$. In the original two-variable Gaussian law every normalized complex linear combination of $Z,W$ has absolute mean $\mu=\sqrt\pi/2$. Duality gives $|c_{1000}|^2+|c_{0010}|^2\le\mu^2$, so the tested $W$ term has energy at most $s=\mu^2-t^2$. Separately $|\mathbb E_Z[\bar Z f(Z,W)]|\le\mu$ pointwise. Parseval in $W$ shows $\sum_{(j,k)\ne(0,0)} |c_{10jk}|^2\le s$, hence also $|c_{1011}|^2\le s$. These bound the two *disjoint* most expensive modes in the table. Put $u=1-t^2$ and $b=d\max(L_N,1/N)$. Every other nonsilent cost is at most $b$. Bounding all coefficients first by this baseline and charging the two nonnegative excesses gives total loss at most
\[
 bu+[\alpha L_N+(\alpha+2d)/N-2b]s.
\]
Similarly the one-sided increase of the signed fifth pairing is at most $\ell u+(2/N-\ell)s$ where $\ell=\max(L_N,1/N)\le2/N$. At $N=100000$ these bounds yield the stated result; the same-dimension torus rounding applies verbatim. Dropping both Gaussian coefficient estimates loses the payoff test at this smaller dimension.

From the repository root run

~~~sh
VECLIB_MAXIMUM_THREADS=1 OPENBLAS_NUM_THREADS=1 python3 -BO experiments/quintic-signed/code/graded_step_certificate.py --pair central
python3 -IB -O experiments/quintic-signed/code/finite_graded_lift.py
~~~

The second replay checks the two physical dimensions and propagates the graded fifth inequality to the strict physical bound. Removing the visible norm reserve or the fourth-moment improvement fails the simpler estimate at its stated dimension. Removing the separate Gaussian coefficient bounds fails the cap at the smaller dimension.
