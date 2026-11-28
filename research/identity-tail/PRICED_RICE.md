# Retuning the identity-tail witness with a physical Rice price

Write $t=\|P_{1,0}h\|_2$, where $h=(f+g)/2$ and $k=(f-g)/2$ are formed from the same unimodular pair. In the aligned frame put $R=P_{2,1}^{Y}\mathbb E_Z k$ and $\tau=\|R\|_2$. Both sparse Stein rows use $\sigma=\delta\tau$. The ordinary quadratic price and the normalization of $\delta$ appear in [the physical-scale proof](PHYSICAL_RICE.md).

For $Z$ standard proper complex Gaussian and $\mu=\sqrt\pi/2$, the improved shift bound is
$$\mathbb E|Z+w|\le\mu(A+C|w|^2/2),\quad A=1+j^2/6,\quad C=1-(2j-j^2)/6,$$
for every real $j$. Indeed the shift gain for the absolute value of the real marginal is $\pi^{-1/2}\int_{-b}^b(b-|x|)e^{-x^2}\,dx$ for shift magnitude $b$. On this interval $1-e^{-x^2}\ge x^2/(1+b^2)$. Integrating the triangle and its second moment gives the upper numerator $b^2-b^4/[6(1+b^2)]$. Its affine majorant $A-1+Cb^2$ has excess $(b^2-j(1+b^2))^2/[6(1+b^2)]$. Rotation and Fubini average the squared real projection to $|w|^2/2$.

Apply this shift to each response on a visible fibre, with the deterministic shift equal to its fibre mean divided by $C\mu$. The resulting two square completions and the parallelogram identity give
$$\|\mathbb E_Z h\|^2+\|\mathbb E_Z k\|^2\le 2C\mu[A\mu-\operatorname{Re}\mathbb E_Z(\bar Z h)].$$
Averaging over the remote variables and contracting by the remote orthogonal projection gives $\tau^2\le 2C\mu(A\mu-t)$. The replay uses $j=1/19$, $A=2167/2166$, and $C=2129/2166$.

Refine the 55 closed amplitude segments by splitting original cell 24 at its midpoint and cell 25 at $0.83835$. The 57 segments use 17 endpoint weights and 27 restricted prices on 13 terminal radii. The certificate checks each requested pair of prices against the same 19 shape slabs. The small-scale curvature correction is the minimum of the two available endpoint margins (each multiplied by four) and the pair curvature at scale $0.21$. The affine-price test uses upper and lower bounds on $\mu$ with the sign appropriate to each term.

The Lean cover splits the segment containing $T=886151109950/10^{12}$ once more to select the estimate on each side. At and above $T$ it uses the signed visible-cubic estimate on the same pair. With $p=25/31-2(47/1953)$ and $e=25/31$ it bounds the hat payoff by $(1-2p)t^2+(7e/32+p/2)\pi-e\mu t$. After first-chaos mixing both variable coefficients are negative, so evaluation at $T$ suffices. With weight $391473741/6250000000000$, the exact rational scalar cap rounded upward is $356626944773/500000000000$. Its reciprocal exceeds $1.4020253021$. The maximum is at $t=0.83835$ in original cell 25. At the same weight, removing the affine price improvement exceeds this cap by more than $284/10^9$ in cell 26, and removing the high estimate exceeds it by more than $69/10^9$ in cell 34. Run `python3 -IB -O research/identity-tail/code/priced_rice_profile.py` to reproduce the finite comparisons.

Agent-ID: codex-a7c4
