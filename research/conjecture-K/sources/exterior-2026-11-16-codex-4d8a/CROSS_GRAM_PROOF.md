# A quantified separate-response Gram improvement

Status: **author-derived proof**, with the finite matrix identities and numerical comparisons **certified by exact rational arithmetic** in `certify_cross_gram.py`. The scalar certificate passes. The initial multiplier −1/20 was independently re-derived by the paper07000 agent; that agent also checked the final multiplier −1/35 separately. This has not been translated into Lean. This is a new margin on a specified response subset, **not a proof of $K_G^{\mathbb C}>1.402$**.

## Statement and precise scope

Let $e=1891/2500$, $\beta=179/1250$, $H=Z(|Z|^2-2)/\sqrt2$, and $R=\sqrt\pi/2$. Let $f,g$ be bounded by one, $h=(f+g)/2$, $k=(f-g)/2$, and rotate coordinates so that $P_{1,0}h=tZ$, $t\ge0$. Put $G=eP_{2,1}k$, decomposed into the six sectors in the user's research program, with energies

\[
 u=\|q\|_2^2,\quad E_A=\|A\|_2^2,\quad E_B=\|B\|_2^2,
 \quad E_Q=\|Q\|_2^2,\quad E_P=\|P\|_2^2,\quad E_\nu=|\nu|^2.
\]

Define the **full** discarded-square quantity

\[
 \Sigma=\|P_{1,0}k\|_2^2+
 e\|P_{2,1}h+(\sqrt2\beta/e)H\|_2^2.
\]

The existing summed-Gram penalty at multiplier one is

\[
 J_1={u/2+6E_A/7+4E_B/3+E_Q+E_P+16E_\nu/13\over e^2}
 -(\pi/4-t^2)+{e\over2(3e+4)}(t-4\beta/e)^2.
\]

We construct a new explicit penalty $J_\eta$, with $\eta=-1/35$ when $\Re\nu\ge0$, and $\eta=1/35$ when $\Re\nu<0$, satisfying **unconditionally**

\[
 \Sigma\ge\max(0,J_1,J_\eta).
\]

On the explicit region

\[
 {21\over25}\le t\le{863\over1000},\qquad
 u+E_A+E_B+E_Q+E_P+E_\nu\le{80051\over10^6},\qquad
 |\Re\nu|\ge{3\over50},
\]

we prove the exact improvement

\[
 J_\eta-J_1\ge
 {537363070714908327898093\over1370804246385332741850000000}
 >{39\over100000}.
\]

This difference is useful as a payoff improvement when $J_1\ge0$. One explicit subregion where that is guaranteed is

\[
 {851\over1000}\le t\le {853\over1000},\qquad
 u\ge {3\over100},\qquad E_A\ge {1\over50},
\]

in addition to the displayed conditions. There

\[
 J_1\ge {784508743371\over325405171000000}
 >{24\over10000}.
\]

Thus the usable penalty $\max(0,J_\eta)$ improves $\max(0,J_1)$ by more than $0.00039$ throughout this subregion. Its energy conditions are compatible with the actual-response ellipsoid and the remote-energy chord, as checked at $t=.851,u=.03,E_A=.02,\nu=.06$, other energies zero. This checks nonemptiness of the **energy relaxation**, not realizability of that exact tuple by responses.

The result applies to the raw $\Lambda$ row. **Do not subtract this full penalty from the retained $\widehat\Lambda$ row: the latter has already spent the first-chaos square.** It does not supply the still-missing upper bound on raw $\Lambda$, and by itself closes no full interval in $t$.

## The additional inequality

Use the probability measure $d\mu=|Z|\,d\gamma/R$, and the common feature family consisting of every first and $(2,1)$-chaos polynomial divided by $|Z|$. This finite family is in $L^2(\mu)$. Its blocks, after the normalization by $R$, have inverse Gram matrices

\[
 M_0=\begin{pmatrix}7/6&\sqrt2/3\\\sqrt2/3&4/3\end{pmatrix}
 \quad\text{on }(Z,H),\qquad
 M_A=\begin{pmatrix}3/4&1/2\\1/2&1\end{pmatrix}
 \quad\text{on }(Y_j,(T-1)Y_j),
\]

and scalar inverse Gram factors $1/2,4/3,1,1$ on the remote cubic, $B,Q,P$ sectors, respectively. These are the same Gaussian half-moment calculations as in the existing response-penalty proof. Different blocks are orthogonal by visible angular charge and remote chaos orthogonality; arbitrary sharing of remote coefficients is permitted.

Let $a,b$ denote the ordinary Gaussian coefficient vectors of $h,k$ in this common family, and let $M$ be the block inverse Gram. Apply Bessel separately to $f=h+k$ and $g=h-k$:

\[
 (a+b)^*M(a+b)\le R^2,\qquad
 (a-b)^*M(a-b)\le R^2.
\]

Consequently, for every real $|\eta|\le1$,

\[
 a^*Ma+b^*Mb+2\eta\Re(a^*Mb)\le R^2.\tag{1}
\]

The earlier summed-Gram inequality uses only $\eta=0$. The cross term in (1) survives even though $\Re(h\overline k)=0$ pointwise for unimodular $f,g$: the *projected* cross term need not vanish. The derivation above also works for disk-valued $f,g$, and does not need exact unimodularity.

Add the left side of (1) minus $R^2$ to the expression for $\Sigma$, and minimize over all unknown cubic coefficients of $h$ and first-chaos coefficients of $k$, keeping $P_{1,0}h=tZ$ and $P_{2,1}k=G/e$ fixed. Every Hessian below is positive definite. This gives a lower bound for $\Sigma$, with no assumption that the unconstrained minimizers are actual responses.

## Fully explicit formula for $J_\eta$

For a scalar inverse Gram factor $s>0$, define

\[
 d_s(\eta)=s-{s^2\eta^2\over e+s}.
\]

For the $A$ sector set

\[
 M_A(\eta)=\begin{pmatrix}e+1&\eta/2\\\eta/2&7/4\end{pmatrix},\qquad
 d_A(\eta)=1-(\eta,1/2)M_A(\eta)^{-1}(\eta,1/2)^T.
\]

Put $z=\nu/(\sqrt2e)$, and define the rational positive matrix

\[
 M_0(\eta)=\begin{pmatrix}2e+8/3&2\eta/3\\2\eta/3&13/6\end{pmatrix}.
\]

The real and imaginary linear coefficient vectors are

\[
 v_R=\binom{2t/3+2\beta+8\eta\Re z/3}{2\Re z/3+7\eta t/6},\qquad
 v_I=\binom{8\eta\Im z/3}{2\Im z/3}.
\]

Set

\[
 m_\eta(t,z)={7t^2\over6}+{8|z|^2\over3}
 +{4\eta t\Re z\over3}+{2\beta^2\over e}
 -v_R^TM_0(\eta)^{-1}v_R-v_I^TM_0(\eta)^{-1}v_I.
\]

Then

\[
 J_\eta=m_\eta(t,z)-\pi/4+
 {d_{1/2}(\eta)u+d_A(\eta)E_A+d_{4/3}(\eta)E_B+
 d_1(\eta)(E_Q+E_P)\over e^2}.\tag{2}
\]

At $\eta=0$, (2) equals the displayed $J_1$. The nomenclature differs: the subscript on the older $J_1$ is its Lagrange multiplier $\lambda=1$; the subscript on (2) is the new cross multiplier $\eta$.

For $\eta=-1/35$, the exact mean gain is

\[
\begin{aligned}
 m_\eta-m_0={}&-{1025312\over1303902304775}
 +{47595384\over1303902304775}t
 -{1104698169\over2607804609550}t^2\\
 &+\left({160384\over16638835}+{564328\over116471845}t\right)\Re z
 -{51200\over43260971}|z|^2.
\end{aligned}
\]

The energy losses $L_j$, so that $J_\eta-J_1$ is its non-$|z|^2$ part minus $\sum_j L_jE_j$, are:

| Sector | Exact loss coefficient |
|---|---:|
| $u$ | $156250000/550360268829$ |
| $A$ | $22500000000/37697262907171$ |
| $B$ | $10000000000/8238583088211$ |
| $Q,P$ | $625000000/769382980079$ |
| $\nu$ | $160000000000/154696084240451$ |

The $B$-loss is the largest. The coefficient of $\Re z$ is positive throughout the stated $t$-interval. The exact inequality $2(e\cdot7/125)^2<(3/50)^2$ gives $\Re z\ge7/125$ from $\Re\nu\ge3/50$. Replacing every loss by the $B$-loss and every positive linear $z$-term by its value at $7/125$ leaves a concave quadratic in $t$. Its minimum is at an endpoint; exact endpoint comparison gives the fraction stated in the theorem. Replacing $k$ by $-k$ proves the case $\Re\nu<0$.

The positive $J_1$ subregion follows simply by dropping its nonnegative square, using $\pi<22/7$, $E_\nu\ge9/2500$, and the lower bounds on $t,u,E_A$. The script proves $\pi<22/7$ from the alternating Machin series with rational arithmetic.

## A stationarity correction that can be added without spending a square twice

This paragraph uses a separate additional hypothesis: the pair has been phase-aligned so that $\Im\langle h,T_ek\rangle=0$, which is legitimate when bounding the supremum of the absolute game value. It does not hold for an arbitrary unaligned response pair.

For every $\lambda\ge0$, let $J_\lambda$ be the existing summed-Gram penalty, and define

\[
 \kappa_\lambda=\sqrt2\left[
 {\beta+\lambda t/3\over e+4\lambda/3}
 -{\lambda t\over3e(1+7\lambda/6)}\right],
\]

\[
 D_\lambda={t^2\over1+7\lambda/6}
 +{u\over e+\lambda/2}
 +{E_A+E_Q+E_P\over e+\lambda}
 +{E_B+E_\nu\over e+4\lambda/3}.
\]

For $D_\lambda>0$,

\[
 \Sigma\ge J_\lambda+
 {\kappa_\lambda^2(\Im\nu)^2\over D_\lambda}.\tag{3}
\]

To prove (3), perform the same quadratic minimization that gives $J_\lambda$, now restricted to the linear stationarity equation

\[
 \Im\bigl(t\alpha-\langle P_{2,1}h,G\rangle\bigr)=0,
 \qquad\alpha=\langle Z,P_{1,0}k\rangle.
\]

The unconstrained minimizers of the mean coefficients are

\[
 c_0=-{\sqrt2(\beta+\lambda t/3)\over e+4\lambda/3},\qquad
 \alpha_0=-{\lambda\sqrt2\nu\over3e(1+7\lambda/6)}.
\]

The residual of the linear constraint there is $\kappa_\lambda\Im\nu$. Its squared dual norm in the inverse quadratic Hessian is exactly $D_\lambda$. Minimizing a positive quadratic on one affine hyperplane adds residual squared divided by this dual norm, proving (3). Remote first-chaos coefficients of $k$ do not occur in the stationarity equation because $P_{1,0}h=tZ$.

At $\lambda=0$, (3) is the root agent's direct stationarity inequality

\[
 \Sigma\ge {2\beta^2(\Im\nu)^2/e^2\over t^2+\|G\|_2^2/e}.
\]

This is an additive correction to $J_\lambda$ derived by a single joint minimization; merely adding two independently obtained lower bounds for $\Sigma$ would not be valid. The correction has not been used to certify a full payoff interval.

## Replay

Run `python3 certify_cross_gram.py`. No packages are needed. The script checks all matrices, derives the gain polynomial from exact quadratic evaluation, checks the loss ordering, proves all region comparisons, and writes `cross_gram_certificate.json`. No floating-point values enter the certificate.
