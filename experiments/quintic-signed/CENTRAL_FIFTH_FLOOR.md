# An angular lower bound on the full fifth energy

For any pair of disk-valued physical responses in finite complex Gaussian dimension, let $h=(f+g)/2$, $k=(f-g)/2$, and align the unit Gaussian $Z$ with the first projection of $h$. Put $t=\operatorname{Re}\langle Z,h\rangle$, $\mu=\sqrt\pi/2$ and $F=P_{3,2}$. For every $0\le\lambda\le1$, define
$$
 C_\lambda=\mu\left(1+\frac1{1+\lambda}\right),\qquad J_\lambda=(1-\lambda)C_\lambda .
$$
Let $P=P_{1,0}$ and $Q=P_{2,1}$. The full signed fifth difference satisfies
$$
 \Delta_5=\|Fh\|^2-\|Fk\|^2
 \ \ge\ \frac{J_\lambda}{51\mu/64+J_\lambda}\frac{3\pi}{256}
             -2C_\lambda(\mu-t)+\tfrac12\|Qk\|^2+\tfrac38\|Pk\|^2.
$$
At the two amplitudes that determine the [117-piece price](COMBINED_CENTRAL_CONTACTS.md), this gives $\Delta_5>-.122962$ at $t=.837652587890615$ and $\Delta_5>-.053226$ at $t=.86183138$. The previously used quadratic fifth floor at these amplitudes was below $-.24709$ and $-.16285$, respectively. The angular estimate applies at all amplitudes and does not require row saturation or a lower bound on the remote cubic energy. The [four upper planes](FULL_FIFTH_PLANES.md) use a measured cubic energy to bound the other side of $\Delta_5$.

## Pointwise phase geometry

Put $R=|Z|$, $\phi=\mathrm{ph}(Z)$, and record the two costs
$$
 H=\mathbb E R|h-\phi|^2,\qquad K=\mathbb E R|k|^2.
$$
The inequality $|h|^2+|k|^2\le1$ gives $H+K\le 2(\mu-t)$. Also $\operatorname{Re}(\bar\phi(h\pm k))\le1$, so $|\operatorname{Re}(\bar\phi k)|\le1-\operatorname{Re}(\bar\phi h)\le|h-\phi|$. Consequently the weighted sum of the imaginary and real costs of $k$, with weight $1+\lambda$ on the real coordinate, is bounded by $K+\lambda H$.

## The real covariance of a pure fifth test

For any $u\in H_{3,2}$ the corresponding dual cost is
$$
 \mathbb E\frac{\operatorname{Im}(\bar\phi u)^2+
                 \operatorname{Re}(\bar\phi u)^2/(1+\lambda)}{R}
 \le C_\lambda\|u\|^2 .
$$
Write $u=u_0+u_1$ where $u_0$ is independent of $Z$ and all terms of $u_1$ contain a visible Hermite of positive degree. Over the remote coordinates, these two summands are orthogonal for both terms in the real form. The ordinary Hermitian cross term vanishes by distinct remote bidegrees. For the complex bilinear cross term $\mathbb E_Y[u_0u_1]$ to be nonzero the remote bidegree of part of $u_1$ would have to be $(2,3)$, because $u_0$ has bidegree $(3,2)$. Every component of $u_1$ has remote antiholomorphic degree at most two. The angular weight $\bar\phi^2$ depends only on $Z$.

For $u_0$, uniformity of the phase gives equal radial real and imaginary costs, each equal to $\mu\|u_0\|^2$. For $u_1$ discard the real discount. Remote orthogonality diagonalizes the remaining inverse-radius quadratic form. For visible degrees $p=0,1,2,3$ and $q=0,1,2$ its exact diagonal entries divided by $\sqrt\pi$ are
$$
\begin{pmatrix}
1&1/2&3/8\\
1/2&3/4&7/16\\
3/8&7/16&41/64\\
5/16&11/32&51/128
\end{pmatrix}.
$$
Direct integration of the [normalized complex Hermites](PURE_CHAOS_RADIAL.md) gives this array. Excluding $(0,0)$, its maximum is $3/4$. Since $\lambda\le1$, the bound $3\sqrt\pi/4\le C_\lambda$ completes the estimate. Real Cauchy–Schwarz followed by the supremum over unit fifth tests now gives $\|Fk\|^2\le C_\lambda(K+\lambda H)$.

## Paying the cubic and first projections from the same cost

The exact stronger dual estimate is
$$
 \mathbb E\frac{\operatorname{Im}(\bar\phi u)^2+
                 \operatorname{Re}(\bar\phi u)^2/(1+\lambda)}{R}
 \le C_\lambda\big(\|u_5'\|^2+2\|u_3\|^2+\tfrac83\|u_1'\|^2\big),
 \qquad u=u_5'+u_3+u_1',
$$
where the three terms belong to $H_{3,2},H_{2,1},H_{1,0}$ respectively. Duality now gives
$$
 \|Fk\|^2+\tfrac12\|Qk\|^2+\tfrac38\|Pk\|^2 \le C_\lambda(K+\lambda H).
$$
Thus the fifth floor keeps both physical energies with a favorable sign. In particular it always gains at least half the squared norm of the purely remote cubic part of $k$.

Here are the finite real quadratic forms proving the stronger estimate. Expand each test into an unnormalized visible Hermite $H_{a,b}(Z)$ times a remote Wick basis vector in bidegree $(r,s)$. The unweighted squared norm of the visible factor is $a!b!$. In each conjugate pair of remote bidegrees choose conjugate orthonormal bases. A self-conjugate space admits a real orthonormal basis by orthonormalizing its real fixed subspace. Different basis indices are orthogonal both for the usual pairing and for the bilinear pairing with the conjugate. It thus suffices to consider one basis index and one unordered pair $\{r,s\}$ at a time.

After division by $C_\lambda$, the dual cost becomes the usual inverse-radius Gram form in units of $\sqrt\pi$, minus $b_\lambda=\lambda/(2+\lambda)$ times the real part of the bilinear Gram form with angular weight $\bar\phi^2$. For two visible modes $H_{a,b},H_{c,d}$ in such a block let
$$
 M_{ab,cd}
 =\sum_{i,j} h_{ab,i}h_{cd,j}\,
 \frac{\Gamma((a+b+c+d)/2-i-j+1/2)}{\sqrt\pi},\quad
 h_{ab,i}=(-1)^i i!\binom ai\binom bi .
$$
The ordinary Gram entry is $M_{ab,cd}$ when the remote bidegrees agree, and zero otherwise. The bilinear entry is $M_{ab,cd}$ when the remote bidegrees are conjugate, and zero otherwise. In both cases the indicated angular power is zero after pairing because every total mode has charge one. The real and imaginary coefficients split into separate real symmetric forms; their bilinear signs are opposite. With $D$ the diagonal $a!b!$ times the corresponding price $1,2,8/3$, the required matrices are therefore $D-M_{\rm ordinary}\pm b_\lambda M_{\rm bilinear}$.

There are nine unordered remote bidegree pairs. The [rational replay](code/central_fifth_floor.py) constructs both endpoint matrices at $b_\lambda=\pm1/3$ and tests positive semidefiniteness by exact symmetric elimination. For a zero pivot it requires the full pivot row to vanish. The affine interpolation includes every allowed $b_\lambda$. All entries are rational, including the half-integer Gamma ratios. This computation checks the quadratic forms for every ambient dimension at once.

## Recovering fifth energy in the half-sum

Use the unit visible test $u_5=Z(R^4-6R^2+6)/\sqrt{12}$. Its phase coefficient $a=\operatorname{Re}\langle\phi,u_5\rangle$ is positive and satisfies $a^2=3\pi/256$ by the radial Gaussian moments. The bottom-right entry of the displayed array gives $C_h=\mathbb E|u_5|^2/R=51\mu/64$. For $x=\operatorname{Re}\langle h,u_5\rangle$, Cauchy–Schwarz gives $H\ge(a-x)^2/C_h$ and $\|Fh\|^2\ge x^2$. Thus
$$
 \Delta_5\ge x^2+\frac{J_\lambda}{C_h}(a-x)^2-2C_\lambda(\mu-t).
$$
Adding the cubic and first energies from the preceding section and minimizing the real quadratic gives the stated bound, including $\lambda=1$. Setting $\lambda=0$ already gives the central floors $-.145866$ and $-.060154$. The two stronger displayed floors use $\lambda=.692$ and $.473$. The [exact replay](code/central_fifth_floor.py) verifies the array, both endpoints of all nine joint Gram blocks, Gaussian radii, and outward bounds.

Agent-ID: codex-a7c4
