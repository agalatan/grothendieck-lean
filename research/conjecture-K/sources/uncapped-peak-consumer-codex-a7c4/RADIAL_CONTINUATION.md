# Interpolating and extending remote radial prices at the peak

Agent-ID: codex-a7c4. Task #820. **P + C, author only.**

At the peak let $L=Z(699/1250+(179/1250)|Z|^2)$, $h(x)=2\mathbb E|L+\sqrt{x}|$, and $p=2500/1891$. For a unit remote cubic $Q$ put $Y=|Q|^2$, $k=\mathbb EY^2=2+\chi$ and $F(u)=\mathbb E h(uY)-pu$. Each spectral node supplies an upper bound $A_v\ge F(v)$ for every normalized law of the specified shape. Varying $u$ rescales the same cubic. The additional even and odd coordinates of a physical response can share its remote drivers. All scalar transports below apply to any $Y\ge0$ with $\mathbb EY=1$ and finite $k$. The spectral upper price at the starting node uses the cubic hypotheses. [Whole-ray spectral node proof](../peak-window-codex-a7c4/PROOF.md)

## A sharp lower anchor from two moments

Row 2.7 gives complete monotonicity of $h'$. Thus $g(x)=(h(x)-h(0))/x=\int_0^1 h'(tx)\,dt$ is decreasing and convex, with $g(0)=h'(0)$. Under the probability measure $Y\,d\Pr$, the mean of $Y$ is $k$. Jensen gives
\[
 F(s)\ge h(0)+\frac{h(ks)-h(0)}{k}-ps.
\]
The law placing mass $1/k$ at $k$ and the rest at zero attains equality for every $s$. This sharpness concerns the two-moment class. The displayed lower price decreases with $k$, so a box may use its largest second moment. The checker evaluates lower even-order Taylor polynomials of $h$ through orders 2, 4, 6 and 8. Each has nonnegative remainder on the whole positive axis by complete monotonicity. The coefficients are calculated from the existing outward derivative enclosures. Taking the maximum with $h(0)-ps$ gives the lower anchor $L_s$. [Derivative calculation](../raw-content-2026-11-17-gemini-5331/PROOF.md)

## Curvature uniform over the remote law

Write $C=-h''(0)$ and $D=h'''(0)$. The peak profile is a circular Gaussian scale mixture by 2.7. For one component of variance $1/\lambda$, differentiate its Gaussian integral twice and substitute $z=t/(\lambda+t)$. This gives
\[
 -h_{1/\lambda}''(x)=\frac{\lambda^{3/2}}{\sqrt\pi}
 \int_0^1 z^{1/2}(1-z)^{1/2} e^{-\lambda xz}\,dz
 =\frac{\sqrt\pi}{8}\lambda^{3/2}\mathbb E_B e^{-\lambda xB},
 \quad B\sim\mathrm{Beta}(3/2,3/2).
\]
At zero the second and third derivatives give $C=(\sqrt\pi/8)\mathbb E\lambda^{3/2}$ and $D=(\sqrt\pi/16)\mathbb E\lambda^{5/2}$. The positive kernels and monotone convergence give these identities at zero, and the certified finite moments justify differentiating the mixture. Jensen in $\lambda$ under the density proportional to $\lambda^{3/2}$ gives $-h''(x)\ge C\mathbb E_B e^{-(2D/C)xB}$. [Gaussian integral, equation (8)](../audit-2026-11-15-codex-a7c4/remote_strong_PROOF.md) · [Finite derivative moments, §1](../gemini-plan-audit-2026-11-17/NOTE.md)

Let $G$ have a gamma law of shape $3/2$ and scale $7/12$. On $(0,1)$ the density ratio $f_B(z)/f_G(z)$ equals
\[
 \frac{4}{\sqrt\pi}(7/12)^{3/2}e^{12z/7}\sqrt{1-z}.
\]
It starts above one since $16(7/12)^3>22/7>\pi$. Its logarithmic derivative decreases from a positive value to $-\infty$, and the ratio tends to zero at one. The densities cross once, with the beta density larger to the left. Their cumulative distributions satisfy $F_B\ge F_G$ everywhere. The gamma Laplace transform therefore yields
\[
 -h''(x)\ge C(1+7Dx/(6C))^{-3/2}\ge 1.6725(1+5x)^{-3/2}.
\]
The last two numerical inequalities are validated from the same peak derivative calculation.

Now put $t=5u$. Differentiation under the remote law is dominated by $CY^2$. Cauchy–Schwarz and $\mathbb EY=1$ give
\[
 -F''(u)\ge1.6725\,\mathbb E\frac{Y^2}{(1+tY)^{3/2}}
 \ge\frac{1.6725}{\mathbb E(1+tY)^{3/2}}.
\]
For $f(y)=(1+ty)^{3/2}$, interpolate at $0$ and to first order at $k$. Its quadratic Hermite interpolant majorizes $f$ on the full ray because the remainder has the sign of $f'''(\xi)y(y-k)^2\le0$. The interpolant has the same expectation under $Y$ and under the two-point law above. Consequently
\[
 -F''(u)\ge c(u,k):=\frac{1.6725}{1+((1+5uk)^{3/2}-1)/k}.
\]
The denominator increases in $u$ and in $k$ (the secant slope of a convex function increases). In particular $c(.07,44)>.6725$ across the full shape range there.

## A curvature ceiling between two spectral nodes

Set $g=-h''$ and $E=-h^{(4)}(0)$. Complete monotonicity gives $g(x)=\int e^{-xT}\,d\nu(T)$ for a positive measure of mass $C$, first moment $D$, and second moment $E$. For $s\ge0$, the inequality $1-e^{-sT}\ge sT/(1+sT)$ and Jensen under $T\,d\nu(T)/D$ give
\[
 g(s)\le C-\frac{Ds}{1+(E/D)s}.
\]
Apply this bound at $s=uY$. For $u>0$, the function $y\mapsto y^2/(1+(E/D)uy)$ is convex, with second derivative $2/(1+(E/D)uy)^3$. Jensen under $Y\,d\Pr$, whose mean is $k$, yields
\[
 -F''(u)=\mathbb E[Y^2g(uY)]\le M(u,k)
 :=Ck-\frac{Duk^2}{1+(E/D)uk}.
\]
The case $u=0$ holds by equality. Only the second moment of $Y$ is used. The bound decreases in $u$. It increases in $k$ because $D^2\le CE$ by Cauchy–Schwarz and
\[
 M(u,k)=(C-D^2/E)k+(D^2/E)\frac{k}{1+(E/D)uk}.
\]
The checker uses an upper endpoint for $C,E$ and a lower one for $D$. The subtracted fraction is $D^2uk^2/(D+Euk)$, increasing in $D$ and decreasing in $E$. The same monotonicity in $k$ holds for the rounded constants by the checked moment inequality.

For bracketing spectral nodes $a<b$ and a certified shape upper bound $k_{\rm hi}$, the function $F(r)+M(a,k_{\rm hi})r^2/2$ is convex throughout $[a,b]$. Thus
\[
 F(u)\le \frac{(b-u)A_a+(u-a)A_b}{b-a}
       +\tfrac12 M(a,k_{\rm hi})(u-a)(b-u).
\]
The checker evaluates $M$ at the left **spectral node**, even when the energy cell starts later. Its linear chord and quadratic error are separately maximized on the closed cell.

## Two outgoing upper estimates

Fix $0\le s<v\le u\le U$. If $c=c(U,k_{\rm hi})$, then $F(r)+cr^2/2$ is concave throughout $[s,U]$. Extrapolating the chord through $s,v$ gives
\[
 F(u)\le A_v+(u-v)\frac{A_v-L_s}{v-s}-\frac{c}{2}(u-v)(u-s).
\]
The upper bound uses a lower anchor because its coefficient is nonpositive. The checker maximizes this concave quadratic over each closed energy interval, including its vertex if it lies inside. At $s=.04$, $v=.06$, $u=U=.07$ and $k\le44$, the curvature term alone saves more than $10^{-4}$ from this secant.

There is also an outgoing cubic from the same node. Let $T_2(u)=h(0)+(h'(0)-p)u-Cku^2/2$. For each deterministic $y\ge0$, the Taylor remainder of $h(uy)$ beyond its quadratic, divided by $u^3$, is nonnegative and decreasing. Indeed it equals $y^3\int_0^1(1-t)^2h'''(tuy)\,dt/2$ and $h'''$ is decreasing. Compare the pointwise remainders at $u$ and $v$ **before taking expectations**. The two values of $h$ and both quadratics are integrable using only $\mathbb EY^2<\infty$. This proves
\[
 F(u)\le T_2(u)+(u/v)^3\bigl(A_v-T_2(v)\bigr),\qquad u\ge v>0.
\]
For this upper use lower endpoints for $h(0), h'(0)$ and upper endpoints for $C,k$. Their coefficients have the indicated signs throughout $u\ge v$. The maximum of the four cubic Bernstein coefficients bounds each closed energy interval. The secant and the cubic agree with the node price at $u=v$.

## Exact comparisons on closed cells

The replay validates the original spectral inputs, including the three models at $v=.06$, and intersects the previous price with the outgoing estimates from the last two available nodes at or below the cell. The table compares **upper bounds on the same cell** for the normalized radial term $F$, before the six-sector physical trial. No new spectral model is required.

| Normalized energy $u$ | Fourth excess $\chi$ | Reduction in the cell upper price, greater than |
|---|---|---:|
| [.0603,.0605] | [.099,.101] | .000150 |
| [.062,.065] | [0,.1] | .000054 |
| [.06,.0604] | [4,4.1] | .001100 |
| [.06,.06001] | [0,42] | .004030 |

## The six-sector cell at amplitude .824

Fix $\varepsilon=.752$, $p_0=2500/1891$, $\mu=\varepsilon p_0$, and $\theta=1$. Write $u$ for the normalized remote energy, $\chi$ for its fourth excess and $V$ for the total normalized energy of the two even sectors. For $u\in[l,h],\ \chi\in[x,y],\ V\in[v,w]$, the physical bound for this trial is
\[
 \max_{t\in\{.824,.8255\}}\bigl[t^2-2\mu(.8456)t+2(\mu\cdot.1432)^2/\varepsilon\bigr]
       +\mu\,[A+G].
\]
Here $A$ is the radial cell price, and $G$ is the original square-completion upper bound from the projected scores with $k_0=\min(4h,h(1+\sqrt{3y/4}))/2-.0926$. Both cells below lie within the calibrated score interval $[.0463,.051]$. Convexity in $t$ covers every intermediate amplitude. The pointwise odd-sector inequality absorbs the three odd energies for this trial, including shared remote drivers, in every finite dimension. [Physical normalization and square completion](PROOF.md)

The table encloses the **certified clearance** $.713245$ minus the displayed upper estimate, multiplied by $10^{12}$. Both columns use the same score bounds, the same node prices and the same physical trial. The smaller cell is the one on which the earlier subdivision stopped.

| $u$ | $\chi$ | $V$ | Previous clearance, in units of $10^{-12}$ | New clearance, in units of $10^{-12}$ |
|---|---|---|---:|---:|
| $[3316841/65536000,6633687/131072000]$ | $[2803/512,179393/32768]$ | $[16707/4096000,6683/1638400]$ | $<625$ | $>1983671$ |
| $[.05060,.05062]$ | $[5.473,5.476]$ | $[.004077,.004081]$ | $<-1450327$ | $>578533$ |

The old price misses the requested $10^{-9}$ clearance in the smaller cell and misses the physical target itself on the larger one. The new estimates certify the target throughout both closed boxes. Covering all normalized energies, shapes and even energies at these amplitudes is a separate open step.

Run `python3 -IB research/conjecture-K/code/uncapped-peak-consumer-codex-a7c4/radial_continuation.py`. The script prints the outward absolute upper prices, verifies the reductions and rejects continuation from a node to its left. Keeping the outgoing bound but restoring the old chord makes the fixed trial miss the $10^{-9}$ threshold on both physical boxes. The unrestricted six-sector payoff on the remaining amplitude interval is still open. [Exact evaluator](../../code/uncapped-peak-consumer-codex-a7c4/radial_continuation.py)
