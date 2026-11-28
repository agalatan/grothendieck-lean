# Absorbing the even price in the lower-shoulder payoff

Agent-ID: codex-a7c4. Task #804. **P + C, author only.**
At $\varepsilon=.752$, every actual six-sector response in every finite dimension
with $.8255\le t\le .82815$ satisfies the 8.13(ii) witness with physical value
strictly below $.713245-10^{-7}$. All even, odd and remote components may share
Gaussian coordinates. The same amplitude interval is used for every fourth
excess $0\le\chi\le42$.

The extension combines the linear even price with the quadratic bound before completing the squares, tries five additional visible prices and continues the score beyond normalized remote energy .06. The original 2.12b energy ellipsoid suffices. An independent replay with only 2.12b accepts 17,279 closed cells with clearance greater than $100068/10^{12}$. Adding four optional radial constraints reduces that count to 16,524 with the same stated clearance. [Independent replay](https://github.com/agalatan/grothendieck-lean/pull/806)

## Optional bounds on the energies of one fixed response

Use the conventions of [the two-price comparison](TWO_PRICES.md), with
$p_0=2500/1891$, $t_0=.8255$ and $H=(\pi_{\rm hi}/4-t_0^2)/p_0^2$.
Use the *same* coordinates $u,V,B,W$ for each search cell: divide the
physical remote, combined even, even $B$ and combined odd energies by
$(\varepsilon p_0)^2$. At a different trial price $p$ all four coordinates
and $H$ acquire the common factor $d_p=(p_0/p)^2$, and $\chi$ is unchanged.

For a rectangle starting at $u=l,V=v$, take any of the four
[certified radial weights in 2.12h](../radial-response-weights-codex-a7c4/PROOF.md).
Write its outward coefficients as $J,I_1,I_0,I_A,I_B,I_\nu$ in the order
used there. Since $I_A>I_B$ and $I_1\ge I_\nu$, every response in the cell
satisfies
$$
R=(J-t_0^2/I_1)/p_0^2-l/I_0,\qquad
V\le I_A R,\quad W\le I_1(R-v/I_A),\quad
B\le (R-v/I_A)/(1/I_B-1/I_A).
$$
Intersect the four upper bounds on each energy with the corresponding
bounds of 2.12b, namely $V\le3H/2-3l/4$,
$W\le H-l/2-2v/3$, and $B\le3H/2-3l/4-v$.
A strict failure $v>V_{\max}(l)$ excludes the whole cell. Equality is retained.
The upper endpoints used here decrease with the lower endpoints $l,v$.
Clipping the right endpoint of a child interval at the updated $V_{\max}$
therefore preserves every feasible response. These operations impose
feasibility only on the actual response; the auxiliary fields in the trials
can have different energies.

## Combine the even price with the quadratic term

Write $U_p,V_p,W_p$ for the energies after rescaling. As in the
[two-price proof](TWO_PRICES.md), keep the remote field fixed in both
convex arms. Send the two even fields to the joint arm at scale $1/\theta$.
Send multiples $h/p_0$ and $h/b$ of the same odd field to the joint and odd-only
arms, respectively, where $b=32/25$ and $h=(\theta/p_0+(1-\theta)/b)^{-1}$.
Their weighted average equals the original odd field and their weighted
odd charge is $hW_p$. The physical trial is $\varepsilon p\theta\xi$.
The charged trial norm is bounded by the joint-arm estimate since
$\varepsilon p\theta\le1$.

After repricing, the even contribution can be bounded by
$(p_0/\theta-p)V_p+\theta G(V_p/\theta^2)$, where $G$ is the even gain in
[the joint estimate](PROOF.md). On a finite energy cell, separately bounding
these two terms may lose the cancellation between their linear coefficients.
With $n=V_p/\theta^2$, the exact identity
$$
(p_0/\theta-p)V_p=\theta(p_0-\theta p)n
$$
puts this charge inside the same quadratic estimate. Add $p_0-\theta p$ to
the coefficient of $n$ *before* completing the two squares. The replay
tests this bound and the separately charged bound, and accepts the smaller.
If the coefficient of $n$ is negative its upper product uses the lower
energy endpoint. The $B$ bound above limits the same joint arm via
$B_p/\theta^2$ in the reverse triangle bound on $\|r_A+.5053r_B\|$.
The extra term $(h-p)W_p$ uses its positive part times the applicable upper
bound on $W_p$. No lower bound on the actual odd energy is required.

## Cover the surviving cells

A cell may use any of $p_0,1.318,1.316,1.317,1.319,1.32,1.31$. At $p_0$ use
$\theta=1$. At the smaller prices also test the odd-neutral fraction
$p_0(p-b)/(p(p_0-b))$ and $\theta=.96$. Only a successful candidate is
needed. For a fixed price the explicit visible cost
$t^2-2\varepsilon p\ell_0t+2(\varepsilon p\beta_0)^2/\varepsilon$ is convex
in $t$, so the larger of its two endpoint values bounds the whole amplitude
slab. At each price the checker splits at the transformed radial and score
boundaries. In particular, beyond normalized energy $.06$ it uses the
all-energy continuation of the angular score from $.0463$, as proved in
[the unrestricted estimate](PROOF.md). The radial calculations use the
published whole-half-line comparisons and validate the supplementary Stein
functions against the compact source pieces and the unbounded tail. The three functions at $u=.06$ are exactly those used in [the harmonic shoulder](TWO_PRICES.md); the comparison uses the same spectral data. Below $.0463$, the tighter angular slopes from 11.49 and 11.62 apply only above their respective lower energy endpoints.

The root boxes cover $[0,H]\times[0,42]$ in $(u,\chi)$ and the whole
feasible even-energy interval at the lower remote endpoint. Each bisection
retains both closed children. A surviving cell is accepted only when one
physical trial works throughout it with clearance greater than $10^{-7}$.
The replay certifies 16,524 closed cells, with physical clearance greater than $100068/10^{12}$. The comparison leaves the simultaneous witness on smaller amplitudes open.

Run `python3 -IB research/conjecture-K/code/uncapped-peak-consumer-codex-a7c4/weighted_shoulder.py`.
The [exact checker](../../code/uncapped-peak-consumer-codex-a7c4/weighted_shoulder.py)
reconstructs the outward weight coefficients before using them. Its geometry
control removes the four weighted inequalities and checks that the old
ellipsoid then admits an even-energy cell excluded by the full family.

At the binding cell the checker holds the price (1.318), mixing fraction (296875/327523) and all energy bounds fixed. Absorbing the linear even price gives clearance above $100068/10^{12}$ for that trial. Charging it separately gives clearance below $-4279504/10^{12}$. The control tests this single trial on the identical closed cell.
