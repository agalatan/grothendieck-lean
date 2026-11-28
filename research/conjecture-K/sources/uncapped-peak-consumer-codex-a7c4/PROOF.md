# Unrestricted six-sector witness below the capped peak shoulder

Agent-ID: codex-a7c4. Task #795. The following is a mathematical and exact computer-assisted result. It concerns one amplitude interval of the simultaneous witness at $\varepsilon=94/125$.

**Proposition.** At every visible amplitude $.8297\le t\le .8393$, every actual response in every dimension satisfies the 8.13(ii) witness inequality with upper bound $.713245-1.9\cdot10^{-6}$. Both even sectors and all three odd sectors may share the remote coordinates arbitrarily.

## Normalization and projected scores

Use one visible profile throughout. Its visible coefficients are $(\mu\ell_0,\mu\beta_0)$ with $\ell_0=.8456$, $\beta_0=.1432$, $p_0=2500/1891$, $\mu=\varepsilon p_0<1$. Divide the physical response by $\mu$. Write $u=E|q|^2$ for its normalized remote energy, $V$ for its two even driver energies combined and $W$ for the three odd energies. The physical energies are $\mu^2(u,V,W)$. Put $H=(\pi_{\rm hi}/4-.8297^2)/p_0^2<.055496$, $\pi_{\rm hi}=3.141592653589794$. By 3.5a and 2.12b, $u\le H$ and $3u/4+V\le3H/2$. The price correction $p=\mu/\varepsilon-p_0$ is identically zero. The cost correction $(\mu-1)\|\xi\|^2$ is nonpositive for every trial. Thus the outer bound is
$$
t^2-2\mu\ell_0t+2(\mu\beta_0)^2/\varepsilon+\mu\widehat\Lambda(G).
$$
The fixed-trial bound below also applies on taking its physically rescaled trial. On $u\le .0463$, $u+V\le .080051$, apply 7.5.16 directly, using an infimizing sequence for the retained payoff if necessary. Convexity in $t$ makes it sufficient to check both endpoints for the explicit quadratic. [Physical homothety and radius](../priced-peak-consumer-codex-a7c4/PROOF.md) · [Capped peak theorem](../peak-window-codex-a7c4/PEAK.md)

At all remaining energies let $\delta=E|q|^4-2u^2$, $\chi=\delta/u^2$ for $u>0$, taking $\chi=0$ at $u=0$. Write $C=\|c_{3/5}\|$, $e=\|c_B-.5053c_A\|$. The global bounds $C^2\le .08\delta$, $C^2\le 2.8\delta^{3/2}$, $C\le .139\sqrt u$, $e^2\le .03\delta^{3/2}$, $e\le .0035\sqrt u$ come from the projected scores before any energy restrictions are used to absorb them. The Gaussian-probe dual of 11.30 has energy coefficient $13/50$ and a constant independent of $u$. Its certified value at $u_0=.0463$ is below $.02$. Therefore $C\le .02+.26(u-u_0)_+$ for every energy. [Signed-score projection bounds](../signed-score-coupling-codex-a7c4/SIX.md) · [Uniform plain score](../received-2026-11-15-tilted-sector/content_profile_proof.md) · [Gaussian-probe dual, equation (2)](../received-2026-11-15-tilted-sector/content_next_proof.md)

For $u\le u_0$ retain the published energy-dependent coefficients $C^2\le\gamma\delta$ from 11.49 and 11.62. Above $u_0$, the [shifted scalar barriers](../uncapped-stein-score-codex-a7c4/PROOF.md) give $C^2\le .032\delta$ on $[.0463,.051]$ and $C^2\le .0307\delta$ on $[.051,.06]$. The verifier replays these two complete barriers from their rational inputs. An independent continuation of the old angular bound, valid for every $u\ge u_0$, is
$$
C\le [\sqrt{.0325}+1.04(\sqrt u-\sqrt{u_0})]\sqrt\delta.
$$
In the angular tensor bound of 11.49 the square root of the coefficient is a seminorm of the scalar kernel $k_u=\int_0^\infty e^{-5s/3}P_s^{u/2}m''\,ds$. This follows from the supremum of the two Euclidean seminorms of the linear angular integrals $A,B$ in the cited equation (2). At $u_0$ its value is at most $\sqrt{.0325}$. For a perturbation it is at most $\sqrt{11/108}\|k_u-k_{u_0}\|_\infty$ by the cited equation (7), valid for every odd bounded kernel. Couple the two OU steps using the same real standard normal. The means agree and the standard deviations differ by $(\sqrt u-\sqrt{u_0})\sqrt{(1-e^{-2s})/2}$. Since $\|m'''\|_\infty<13$ and $E|N|=\sqrt{2/\pi}$, the kernel difference is bounded by
$$
\frac{13}{\sqrt\pi}(\sqrt u-\sqrt{u_0})
\int_0^\infty e^{-5s/3}\sqrt{1-e^{-2s}}\,ds.
$$
Cauchy–Schwarz for the probability density $(5/3)e^{-5s/3}$ bounds the integral by $(3/5)\sqrt{6/11}$. The resulting coefficient $39/(5\sqrt{18\pi})$ is below $1.04$. [Angular coefficient at the old endpoint](../received-2026-11-15-tilted-sector/deficit_angular_proof.md) · [Kernel equations (2) and (7)](../received-2026-11-15-tilted-sector/secant_content_proof.md) · [Score derivative](../phase-content-2026-11-16-codex-a786/PROOFS.md) · [Energy-dependent coefficients](../ab-sector-2026-11-15-codex-91d4/route2/a_content/A_CONTENT_PROOF.md)

## The energy and shape certificate

For $\rho=.5053$, $d=1+\rho^2$, $R=r_A+\rho r_B$, $U=r_B-\rho r_A$, write $a=C+\rho e/d$ and $b=e/d$. The global pointwise inequality of 7.5.13, applied to its trial $-.6R-.28\nu Z$, gives an upper of $J(q)-p_0u$ plus
$$
2a\|R\|+2b\|U\|-.31\|R\|^2-.08\|U\|^2+kV,\qquad
k=\tfrac12\min(4u,u+\sqrt{3\delta/4})+2V-.0926.
$$
Here $J(q)=2E|L+q|$ and $\|R\|^2+\|U\|^2=dV$. Indeed $S_r=|r_A|^2+|r_B|^2$ satisfies $\|S_r-V\|_2\le V$, being a Gaussian linear-shell quadratic with nonnegative eigenvalues summing to $V$. It is centered in bidegree $(1,1)$ after subtracting $V$. Theorem 7(b) gives $\|\Pi_{1,1}|q|^2\|_2^2\le3\delta/4$, hence $E|q|^2S_r\le(u+\sqrt{3\delta/4})V$ in addition to $4uV$. The odd covariance cost is nonpositive after expectation and the original $p_0W$ cancels exactly. [Joint pointwise inequality](../global-all-sector-gemini-c1de/PROOF.md) · [Shared moments and their coefficients](../progress-2026-11-15-codex-a7c4/JOINT_TARGET.md) · [Projection bound, Theorem 7](../influence-calculus-2026-11-16/NOTE2.md)

For $V\in[v,w]$ take upper bounds on $a,b,k$. The checker uses the least of three square bounds. The two elementary ones bound the gain by $(k-.08d)V$ plus either $2\sqrt{a^2+b^2}\sqrt{dw}$ or $a^2/.23+2b\sqrt{dw}$. For any selected $m$ with $A=.31-k/d+m>0$, $B=.08-k/d+m>0$, completing both squares gives $a^2/A+b^2/B+mdV$. Each signed multiple of $V$ uses the appropriate endpoint.

For $Y=|q|^2/u$ the first three moments are bounded by $1,2+\chi,6+9\chi+40.45313\chi^{3/2}$, with the first two equalities. Use the ten whole-ray Hermite polynomials from 3.3a or a new spectral cap at each bracketing energy node. The verifier replays all 91 Stein polynomial inequalities on the entire ray using the public profile caps. The thirteen energy anchors run from $.022$ through $.057$. Their 7 candidate shapes per node only select the proposals. Every accepted dual is valid at every actual shape. Each shape price $P_0+P_1+P_2(2+\chi)+P_3(6+9\chi+40.45313\chi^{3/2})$ is convex in $\chi$ since $P_3\ge0$. On an energy interval $[i,j]$ and shape interval $[x,y]$ the chord between endpoint upper prices for $J(q)-p_0u$ costs at most $1.673(2+y)(u-i)(j-u)/2$ by $h''\ge-1.673$ for the radial profile $h$. This comparison fixes the normalized cubic law as energy varies. [Moment and spectral derivation, including curvature](../peak-window-codex-a7c4/PROOF.md) · [Whole-ray Hermite caps](../peak-remote-deficit-codex-a7c4/PROOF.md)

The checker bisects closed intervals until every cell clears its target. For $u\in[l,h]$ with $h\le u_0$, any response outside the old capped domain has $V\ge\max(0,.080051-h)$. In all cells the physical inequality gives $V\le3H/2-3l/4$. The cover includes equality at all retained boundaries, all $0\le\chi\le42$, and $q=0$. The final witness clearance includes the scale $\mu$. The controls reject a damaged whole-ray dual, a displaced score breakpoint, a lowered witness target, and a replay with all new Stein duals removed. [Certificate and replay](../../code/uncapped-peak-consumer-codex-a7c4/verify.py)

```sh
python3 -IB research/conjecture-K/code/uncapped-peak-consumer-codex-a7c4/verify.py
```
