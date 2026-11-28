# A finite five-shell trial at the five Stage 0 witness points

At the stored gA1 gate point $(t,c,\sigma)=(.84,.1,.23953)$, an explicit five-shell attack against both retained cubic defenders gives a numerical share of **0.371740** of the available deficit. The proposed allocation is $7/20=0.35$. At the full row scale $\sigma=.23953361222480435$ the same coefficients give **0.371732**. These are floating-point quadrature results (**N**). The analytic defender-error inequality below holds for the exact integrals (**P, author only**).

## Trial and comparison

Use the [finite two-branch model](../finite-spike-parity-codex-062a/PROOF.md) with the same stored visible quintic shift in both comparisons. The five quintic $h$ coefficients, in order, multiply the fields §3 of the [small-spike calculation](../stage0-retained-gram-gemini-4c4c/PROOF.md) calls p10, p21, p01, p12 and p30. A quintic field with visible index $(i,j)$ has remote index $(3-i,2-j)$. The two cubic $h$-defenders multiply $z e_{11}(y)$ and $\bar z e_{20}(y)$. At gA1 the trial vectors are exactly
\[
 a=10^{-8}(-61641,32309,-38752,15405,5050),\qquad
 d_0=10^{-8}(101431,40741).
\]
The [evaluator](../../code/finite-spike-witness-codex-062a/trial.py) stores all five rows' trial vectors. Two Newton steps starting at zero on a coarse grid supplied the candidates, which were then rounded and held fixed for every replay.

Write $\Phi(a,d)$ for the expected sum of the two moduli at the given spike and scale. The gain against the original zero-amplitude reference is
\[
 J_a(d)=\Phi(a,d)-\Phi(0,0)-\|a\|^2/\eta+\|d\|^2/\varepsilon_1 .
\]
The target for this simultaneous five-shell model is $\sup_a\inf_d J_a(d)/(D+V_{\rm sl})$, with positive denominator. Adding further attacker coordinates while preserving the defender space can only increase its supremum. The [historical Stage 0 statistic](../../code/degree5-gate/pipeline/gate/kappa_h.py) adds separately optimized group gains. Translating the trial to a rule that allocates defense and deficit among individual groups requires a separate argument.

For fixed $a$, the triangle inequality makes $\Phi(a,\cdot)$ convex on the real vector space underlying $\mathbb C^2$. The quadratic defender price gives, for any full real subgradient $g$ of $J_a$ at $d_0$,
\[
 J_a(d_0)-\varepsilon_1\|g\|^2/4
 \ \le\ \inf_{d\in\mathbb C^2}J_a(d)\ \le\ J_a(d_0).
\]
Indeed the affine supporting plane plus $\|d-d_0\|^2/\varepsilon_1$ attains its minimum at $d_0-\varepsilon_1 g/2$. For the real coefficients used here conjugation makes the imaginary gradient zero. The nondegenerate bath at these rows permits differentiation under the integral by domination by the integrable Hermite fields. This controls the full defender optimization at a fixed attack, without assuming concavity in the attacker.

## Numerical integration

Condition on $z=r\ge0$ by joint rotation and write $y=s e^{i\theta}$. Let $A=1-b_A(r^2-1)$, $B=-b_B r^2/\sqrt2$. In projection direction $\phi$, the independent bath has real variance
\[
 v^2=\tfrac12 \sigma^2(1-c^2)\big((A+B)^2\cos^2\phi+(A-B)^2\sin^2\phi\big).
\]
For projected deterministic mean $m$, average the one-dimensional normal exactly using
$m\,\mathrm{erf}(m/(\sqrt2v))+v\sqrt{2/\pi}\exp(-m^2/(2v^2))$. The slope in $m$ is $\mathrm{erf}(m/(\sqrt2v))$. The projection identity averages this expression in $\phi$ with factor $\pi/2$ for each modulus. Sending $y,W$ to $-y,-W$ exchanges the two base branches and preserves all seven perturbations, so a single branch with factor $\pi$ suffices. Integrate each Gaussian radius by Gauss–Legendre on $[0,7]$ with density $2r e^{-r^2}$ and both angles by uniform midpoint sums. Compute the gain by differencing the two folded values before summation. The g84 restriction to p10 and p01 agrees in value and slopes with the [previous three-coefficient evaluator](../../code/finite-spike-codex-a7c4/explore.py).

For $B(s^2)=\Phi(0,0)$ at diffuse scale $s$ and $k=1/\varepsilon_1-(b_A^2+b_B^2)/\eta$, set $H(s)=B(s^2)-ks^2$. Then $D=B(\sigma^2)-\Phi(0,0)$ at the trial spike and $V_{\rm sl}=\sup_{s\ge0}H(s)-H(\sigma)$. In the first term of $D$ the bath is diffuse and in the second term it has spike coefficient $c$. The two terms use the same visible shift.

The norm inequality gives $|B(s^2)-B(u^2)|\le 2\sqrt{1+b_A^2+b_B^2}|s-u|$ by the second moment of the unit-scale bath field. Hence a maximizing scale is at most $\sqrt{1+b_A^2+b_B^2}/k$, below 2 on these rows. Convexity of $s\mapsto B(s^2)$ gives an upper bound on $H$ over each interval $[a,b]$ of $\max(H(a),H(b))+k(b-a)^2/4$. The program bisects the interval with the largest upper endpoint until its excess above the best sample is at most $2\cdot10^{-13}$. This controls the scale mesh given the endpoint evaluations. The Gaussian integrals, radial truncation, and floating-point rounding still need outward error bounds.

## Results

The table uses quadrature orders $(68,58,48,104)$ for visible radius, remote radius, remote azimuth and projection angle. The share uses the defender-corrected trial gain and the upper scale-slack estimate. A small trial share on any row permits larger attacks there.

| Game | $t$ | Gate $\sigma$ | $D$ | $J_a(d_0)$ | Trial share |
|---|---:|---:|---:|---:|---:|
| g83 | .80 | .31601 | $8.46272\cdot10^{-6}$ | $3.71405\cdot10^{-7}$ | .043887 |
| g84 | .80 | .31987 | $7.80054\cdot10^{-6}$ | $9.81118\cdot10^{-7}$ | .125776 |
| gA2 | .80 | .32293818… | $7.27320\cdot10^{-6}$ | $1.49787\cdot10^{-6}$ | .205943 |
| gA1 | .84 | .23953 | $1.72981\cdot10^{-6}$ | $6.43039\cdot10^{-7}$ | .371740 |
| gA | .80 | .32344 | $7.20776\cdot10^{-6}$ | $1.56727\cdot10^{-6}$ | .217442 |

At gA1 the computed defender correction is $2.38\cdot10^{-16}$. The excess of the corrected gain above $0.35(D+V_{\rm sl})$ is about $3.76\cdot10^{-8}$. On grids $(52,44,32,72)$, $(68,58,48,104)$ and $(72,64,56,120)$ the estimated shares are .37173987, .37173975 and .37173975. To decide this point rigorously it would suffice, for example, to enclose the corrected gain from below by $6.4\cdot10^{-7}$ and the positive denominator from above by $1.8\cdot10^{-6}$. These are outward-integration targets. Issue #922 still needs interval integration to decide the finite gate.

Run the [controls](../../code/finite-spike-witness-codex-062a/controls.py) and the following grids from the repository root with NumPy and SciPy installed.

```sh
python3 -IB research/higher-degree/code/finite-spike-witness-codex-062a/controls.py
python3 -IB research/higher-degree/code/finite-spike-witness-codex-062a/trial.py
python3 -IB research/higher-degree/code/finite-spike-witness-codex-062a/trial.py --grid 68 58 48 104
python3 -IB research/higher-degree/code/finite-spike-witness-codex-062a/trial.py --grid 72 64 56 120 --game gA1
python3 -IB research/higher-degree/code/finite-spike-witness-codex-062a/trial.py --grid 72 64 56 120 --game gA1 --row-scale
```

Agent-ID: codex-062a.
