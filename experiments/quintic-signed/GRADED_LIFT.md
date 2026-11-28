# Lifting a fixed graded Gaussian response to finite physical witnesses

Agent-ID: codex-a7c4. Consider two independent standard proper complex Gaussians $(Z,W)$. Give $Z$ bidegree $(1,0)$ and $W$ bidegree $(2,1)$. A product $H_{a,b}(Z)H_{j,k}(W)$ of normalized complex Hermites has physical bidegree $(a+2j+k,b+j+2k)$. Write $D_{p,q}^{\rm gr}$ for the orthogonal projection onto all products with that bidegree.

For any finite set of bidegrees, any coefficients $c_{p,q}$ and any $\nu$, let
\[
 S_{\rm gr}=\nu I+\sum c_{p,q}D_{p,q}^{\rm gr},\qquad
 S_n=\nu I+\sum c_{p,q}D_{p,q}^{(n)}
\]
where the latter uses the actual homogeneous complex Gaussian chaoses on $\mathbb C^n$. For **every** measurable pair $|f|,|g|\le1$ on the graded space,
\[
 |\langle f,S_{\rm gr}g\rangle|\le
 \sup_{n\ge1}\ \sup_{|u|=|v|=1}|\langle u,S_nv\rangle|.
\]
In particular a certified graded payoff exceeding $10000/14023$ would obstruct that cap for the actual witness in some finite dimension. This statement concerns the specific operator whose coefficients are tested.

## Proof

First suppose $f,g$ are continuous and take values in the closed disk. On $1+3N$ independent standard complex Gaussian coordinates, form
\[
 W_N=N^{-1/2}\sum_{i=1}^N A_i B_i\bar C_i.
\]
Use $u_N=f(Z,W_N)$ and $v_N=g(Z,W_N)$. For each $z$ in the closed unit disk let each noisy coordinate be $X'=zX+\sqrt{1-|z|^2}\,\widetilde X$, independently across coordinates. The pair of block summands $U_i=A_iB_i\bar C_i$, $U_i'=A_i'B_i'\bar C_i'$ is centered with unit variances, zero pseudo-covariance matrix by joint circular symmetry, and $\mathbb E\bar U_i U_i'=z^2\bar z$. Applying the real multivariate central limit theorem to the independent block pairs yields a proper Gaussian pair $(W,W')$ with exactly this correlation. The pair $(Z,Z')$ is independent of all blocks. Thus the bounded continuous correlation $F_N(z)=\mathbb E\overline{u_N(X)}v_N(X')$ tends to $F(z)=\mathbb E\overline{f(Z,W)}g(Z',W')$ for each $z$, including $1$.

Let $a_{p,q}^{(N)}=\langle D_{p,q}^{(1+3N)}u_N,D_{p,q}^{(1+3N)}v_N\rangle$. The complex Mehler expansion gives $F_N(z)=\sum a_{p,q}^{(N)}z^p\bar z^q$, and Bessel and Cauchy--Schwarz give $\sum|a_{p,q}^{(N)}|\le1$. The corresponding expansion of $F(z)$ uses $z$ for the $Z$ coordinate and $z^2\bar z$ for the $W$ coordinate. Its coefficients are exactly $\langle D_{p,q}^{\rm gr}f,D_{p,q}^{\rm gr}g\rangle$.

To see that each individual coefficient converges, take any subsequence and extract a further subsequence on which every coefficient converges by diagonal compactness. On $|z|\le r<1$ the tail of total degree $>m$ is bounded by $r^{m+1}$ uniformly in $N$. The limiting coefficients therefore expand $F$. Uniqueness follows by Fourier integration over the argument of $z$ (fixing $p-q$), followed by uniqueness of the convergent power series in its radius (fixing $p+q$). Every subsequential coefficient limit agrees, which proves convergence. The finite linear combination and the identity payoff, obtained separately at $z=1$, converge as claimed.

For measurable disk-valued $f,g$, approximate in Gaussian $L^2$ by bounded continuous disk-valued functions: use density of continuous compactly supported functions, then metric projection onto the disk, which is 1-Lipschitz. The pairing is continuous since $S_{\rm gr}$ is bounded. Finally any disk-valued function $u$ is the pointwise expectation of measurable unimodular functions: use $\operatorname{ph}(u)$ with probability $(1+|u|)/2$ and its negative otherwise, using one common uniform threshold over the whole domain. Round the two inputs independently. Bounded linearity and Fubini give their original pairing as the average of the rounded pairings. Consequently its magnitude is bounded by the supremum over physical unimodular responses in that same dimension. Approximation and passage to the supremum prove the assertion.

## Preserving the individual low moments when rounding

There is a stronger transfer when $t$ or the signed fifth energy is also specified. Apply the coefficient argument to all four pairings of $u,v$ with themselves and each other. This gives convergence of their low-sector Gram matrices, also after continuous approximation. To round a physical disk-valued function $u$ while keeping every low projection exactly, add one independent complex Gaussian $Y$. Use the uniform variable $V=(M\arg Y\bmod 2\pi)/(2\pi)$ with integer $M>5$ in the sign threshold above. At each fixed original sample, the difference between this rounded function and $u$ has zero constant Fourier coefficient in $\arg Y$ and has only nonzero angular frequencies divisible by $M$. It is radially constant in $Y$. Hence it is orthogonal to every Hermite polynomial of total degree at most five: after conditioning on the original variables and the radius of $Y$, each polynomial in $Y,\bar Y$ has angular frequencies of magnitude at most five. The embedded projection of $u$ is unchanged. Use two independent fresh coordinates for the two roundings, giving the original cross identity exactly by conditional independence. The output functions are unimodular. This proves simultaneous approximation of all low-sector Gram entries and the cross identity by a *single actual physical pair*, so strict moment and payoff inequalities survive in a sufficiently large finite dimension.

For the [fixed nonlinear phase iteration](GRADED_PAIR_PROBE.md), the numerical quadrature itself still has no error bound. A separate [certified step-function pair](GRADED_STEP.md) proves an obstruction with the same sign on a central interval.
