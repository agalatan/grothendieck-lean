# Finite-spike deficit at the gA1 witness

At $t=.84$ and spike coefficient $c=.1$ on gA1, the loss in the unperturbed two-branch payoff relative to the Gaussian of the same variance satisfies
\[
 1.728\cdot10^{-6} < D(q_c) < 1.732\cdot10^{-6}.
\]
The enclosure holds at both the historical scale $\sigma=.23953$ and the full row scale $.23953361222480435$. With the [diffuse scale bound](../ga1-diffuse-slack-codex-062a/PROOF.md) this gives $0<D(q_c)+V_{\rm sl}<1.735\cdot10^{-6}$. Thus a rigorous lower bound of $6.073\cdot10^{-7}$ on the defender-corrected gain would suffice to put the [simultaneous five-shell trial](../finite-spike-witness-codex-062a/TRIAL.md) above the proposed $7/20$ share. The gain is still numerical.

**P + C, author only (codex-062a, #922).** The [checker](../../code/ga1-spike-deficit-codex-062a/verify.py) uses the two pinned Stage 0 source files, python-flint and 96-bit Arb arithmetic. Run from the repository root.

~~~sh
python3 -IB -O research/higher-degree/code/ga1-spike-deficit-codex-062a/verify.py
~~~

## Separating the visible and remote variables

Use the notation of the diffuse scale proof. After fixing the visible Gaussian phase, the visible radius is $r$, the projection angle is $\phi$, and $m=L(r)\cos\phi$. Write $d=\sqrt{(A+B)^2\cos^2\phi+(A-B)^2\sin^2\phi}$ for the positive projected ellipse width. The normalized visible mean is $x=m/d$. For the remote Gaussian $y=\rho e^{i\theta}$ the projected shift before normalization is
\[
 \frac{\sigma c}{\sqrt2}\rho(\rho^2-2)
 [(A+B)\cos\phi\cos\theta+(A-B)\sin\phi\sin\theta].
\]
The coefficient pair in brackets has Euclidean norm $d$. Conditional on $r,\phi$, rotate the uniform angle $\theta$ by the argument of this pair. The resulting normalized shift
\[
 v=\frac{\sigma c}{\sqrt2}\rho(\rho^2-2)\cos\theta'
\]
has a law independent of $r,\phi$. The two signs have equal expectations by symmetry of $v$ and the Gaussian bath. Define $f_s(x)=x\operatorname{erf}(x/s)+s\exp(-(x/s)^2)/\sqrt\pi$ and $\tau=\sigma\sqrt{1-c^2}$. The diffuse payoff integrates $f_\sigma(x)$ against the positive measure $d\mu=2\pi r e^{-r^2}d\,dr\,du$, where $u=2\phi/\pi\in[0,1]$. The spike payoff integrates $f_\tau(x+v)$ against $d\mu\,d\nu$, with $d\nu=2\rho e^{-\rho^2}d\rho\,dw$ and $\theta'=\pi w$, $0\le w\le1$. Reflection gives the quadrant reduction in $\phi$ since the shift is symmetric. The cosine of the remote angle has the same law on the half and full circles. The difference of these two payoffs is $D(q_c)$.

The same variable change applies to the baseline absolute values. The seven perturbation fields of the attacker/defender trial introduce angular factors that depend on both the visible and the remote variables. Their expectation requires additional work.

## Tensor quadrature and tails

Both radii are cut at 7. The visible tail per payoff is at most $4\pi e^{-49}(49^3+3\cdot49^2+6\cdot49+6)$. Indeed $\mathbb E|v|\le\sigma c$ by the unit norm of the remote cubic and $\mathbb E f_\tau(x+v)\le |x|+1$ at these scales. The radial bound in the diffuse proof applies after taking the remote expectation. For the remote tail, $\int x\,d\mu=B(0)<4$ and $\int d\mu\le\pi\sqrt{1+b_A^2+b_B^2}<4$ by the second moment of the ellipse axes. For $\rho\ge7$, $|v|\le\rho^3$ and $\tau<1$. The tail is at most $5 e^{-49}(49^2+2\cdot49+2)$ by integrating $8+4\rho^3\le5\rho^4$ against the radial density. Each tail bound is less than $10^{-14}$.

The shared order-12 Gauss–Legendre rule bounds the error per coordinate in the panel mean by $10^{-11}$ via the complex Cauchy boxes proved in the diffuse certificate. For a complex argument $z$ and any real width $.23<s<1$, enclose
\[
 |f_s(z)|\le |z|(1+2|\Im z|E/.23)+E,\qquad
 E=\exp\!\left(\frac{\max(0,\,|\Im z|^2-L^2)}{.23^2}\right),
\]
where $L$ is a lower bound for $|\Re z|$. This follows by integrating $\operatorname{erf}'$ vertically from the real axis. On a visible complex box use $z=x+v$ with $v$ real and $|v|<6$ over the retained remote radius; the lower bound is $\max(0,|\Re x|-6)$. Establish $\Re d^2>0$ before taking the analytic square root. The bound includes the visible density and the factor $d$. It applies with $v=0$ to the diffuse value as well. On the remote boxes $x$ is one of the real visible nodes, all checked to lie in $[0,64)$. Use $L=0$ and the complex enclosure of $v$, including the remote radial density.

Write $p=2\cdot7\cdot10^{-11}$ for the two-coordinate error integrated over one rectangle domain. First replace the visible integrals at each fixed real shift; the true retained remote mass is at most one. Next replace the remote integral at each visible node. Its error is multiplied by the positive visible quadrature mass $M<4$, also checked. The total panel error in the difference is at most $(2+M)p$. No independence approximation or estimated grid-convergence rate is used in this bound.

## Computing the weighted sums

Group each quadrature measure on a lattice of step $1/128$, verifying at every point that its offset from its chosen center has magnitude $<1/250$. For each occupied bin keep weighted powers of this offset of orders zero through five. If $P_k$ and $Q_k$ are the coefficient polynomials in the bin index for the two measures, the order-$n$ moments in the sum variable come from
\[
 \sum_{k=0}^n {n\choose k}P_k Q_{n-k}.
\]
The index origins add under multiplication, including negative remote bins. Polynomial products and all later sums carry interval error.

At each resulting center evaluate the degree-five Taylor polynomial for $f_\tau$. The uniform remainder per unit weight is at most $(2/250)^6/(30\sqrt\pi\,\tau^5)$ by the sixth-derivative bound in the diffuse proof. For the Gaussian comparison use the visible bins alone, radius $1/250$, and width $\sigma$. The replay checks the normalization, zero mean, and second moment $\sigma^2c^2/2$ of the remote rule to $10^{-12}$ as numerical controls. It also checks the binned convolution against direct Arb evaluation on signed shifts whose sums include zero. The certified interval includes the panel, tail and Taylor errors independently of these controls.
