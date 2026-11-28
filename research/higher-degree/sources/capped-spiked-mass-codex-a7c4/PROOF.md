# The capped degree-five game at target 1.4023 through visible mass 19/50

Agent-ID: codex-a7c4. **P + C, author only.** In every finite complex Gaussian dimension and for all unimodular pairs \(f,g\), put \(h=(f+g)/2\), \(k=(f-g)/2\), \(t=\|P_{1,0}h\|_2\). For the capped operator \(T=P_{1,0}-(39/50)P_{2,1}+(779/10000)P_{3,2}\),
\[
 0\le t\le 19/50=0.38 \quad\Longrightarrow\quad
 \operatorname{Re}\langle f,Tg\rangle<10000/14023.
\]
Every fourth excess and every choice of shared coordinates is allowed. At this target, higher-degree ledger 4.50 ended the sector-free lower interval at 0.36443. This result reduces the interval left for H2 to (0.38,0.649). The remaining parts of the capped-game certificate, including the sector allowances at larger amplitudes, still have to be established. The g84 game has different coefficients.

## Couple the support ray and spectral mass estimates

Use \(e=39/50,\eta=779/10000\) and write \(U=P_{2,1}k, A=\|U\|_2^2, K=\|k\|_2^2\). Expanding the two payoffs in \(h,k\), dropping three nonpositive terms, and using \(\|P_{3,2}h\|^2\le 1-K-t^2\) gives
\[
 V\le\eta+(1-\eta)t^2+eA-\eta K.
\]
If \(A>0\) write \(Q=U/\sqrt A\), \(y=\sqrt{\mathbb E|Q|^4-2}\) and \(0\le y^2\le42\). The following three simultaneous inequalities apply to this same response and the same \(Q\).

1. The exact first spiked support ray in ledger 4.48(i) gives \((84/205)t+(187/205)\sqrt A\le582/625\). Indeed the support inequality applied to the unit cubic \(Q\) aligned with \(U\) gives this half-plane. The source proves it for arbitrary dependence on the visible coordinate. The ray's recorded grade is **P + C, author only**. On the single excess slab from 9/2 to 13/2, the checker strengthens its right side to 0.93091 using the existing spiked Stein dual with a different sector polytope. The details follow below.
2. The reviewed elliptic estimate in 4.18e–f gives \(A+d\le \min(\rho^2,(\pi/4)(1+\gamma s_W)^2)\), with \(\rho=2287/2500\), \(\gamma=26449/5000000\), \(d=(431t/500)^2\), \(w=d/(A+d)\), and \(r=2(179/200)^2-1\). The lifted fourth excess satisfies
   \[
   s_W\le (1-w)^2 y^2+2\sqrt{3(1+r^2)}\,y w(1-w)+2(1+r^2)w^2.
   \]
3. Each of the 24 Lean mass witnesses gives \(mK\ge2\widehat e\,p_j\sqrt A-J_j(y)\), where \(\widehat e=25/31\), \(m=2141/3906\) and each \(J_j(y)=a_j+b_jy^2+c_jy^3\) has \(c_j\ge0\). These are the directed bounds of 4.18f, evaluated before taking the worst fourth excess. The source cell used to generate a witness imposes no shape restriction on its theorem. The replay reads all coefficients from the committed Lean witness data.

## Restrict the spiked half-plane on one shape slab

In the proof of the ray, the spiked field is the sum and difference of the visible test and a normalized cubic test scaled by 187/205. The source's parameter `s_G` is the fourth excess of that cubic after variance normalization; it is exactly the square of our `y` when the test is aligned with the actual projection. The source certificate already has one contiguous Stein slab for 9/2 ≤ s_G ≤ 13/2. To sharpen its radius, assume its spiked support functional exceeds R = 0.93091. The source radial envelope at d_cut = 0.1762 is below 0.930895 < R, so the signed-sector condition is necessary for a counterexample. The Laguerre bounds also constrain its sectors with right sides evaluated at this R. The verifier rebuilds *all* these inequalities using R and d_cut. It evaluates the original dual on that enlarged sector polytope, repeats the pointwise Sturm checks, and obtains an upper bound below 0.930906813538 on the whole closed slab. This contradicts the assumed violation and proves the sharper support price there. On cells crossing a slab boundary the checker uses the original unconditional price.

## Payoff coverage and controls

On \(0\le t\le0.358\), use the global mass inequality \(\widehat e A-mK\le S\) together with the elliptic radius. If \(k_0=e-\eta\widehat e/m\), this gives \(V\le\eta(1+S/m)+k_0\rho^2+(1-\eta-k_0(431/500)^2)t^2\). Both coefficients the substitution requires are positive and the verifier checks the endpoint against the new target. For \(A\le11/20\) the direct bound \(K\ge A\) works throughout the enlarged interval, including at \(A=0\).

For \(0.358\le t\le0.38, A\ge11/20\), take a closed cell \([t_0,t_1]\times[y_0,y_1]\). Start with the smaller upper bound on \(A\) from the ordinary ellipse and the applicable support ray at \(t_0\). Bound \(w\) using that upper bound, \(A\ge11/20\), and both endpoints of the \(t\) interval. The expression in (2) increases with \(y\) and is quadratic in \(w\), so its maximum follows from the endpoints and any interior maximum. Use this to reduce the energy cap twice. For each witness, \(J_j\) reaches its maximum on the shape interval at an endpoint: its sole possible positive interior critical point is a minimum. The payoff after each mass substitution increases in \(A\ge11/20\), as the verifier checks by differentiating \(eA-(2\eta\widehat e p_j/m)\sqrt A\). Hence the computed upper energy and upper visible mass give a valid bound for each witness; take the minimum.

The exact adaptive cover checks 928 closed rectangles and their total area. On the new segment the minimum clearance exceeds \(20226/10^{12}\). Two rational relaxation points at \(t=0.378\) fail the target when the ray or the 24 individual mass cuts are deleted, respectively, retaining the global mass and both elliptic bounds. At \(t=0.38\) a third point obeys the original support ray, all 24 mass constraints, and both elliptic bounds, but violates the sharper shape ray and exceeds the target. At \(t=0.381\) a fourth relaxation point obeys even the new shape-dependent prescription while its computed payoff upper still exceeds the target. They give limitations of this particular relaxation; their realizability by physical pairs is unknown.

**Replay.** Run `python3 -IB research/higher-degree/code/capped-spiked-mass-codex-a7c4/verify.py --repo .` from the repository root. With `--replay-ray` the program additionally rechecks the eight Stein/Sturm shape slabs and the exterior estimate for this single ray directly from the public source certificate. The default replay verifies the refined one-slab ray directly and uses the published ray theorem for the other shapes. All four controls run by default. The proof uses no new floating-point or generated data or full Lean build.

Sources: higher-degree ledger 4.18e–f, 4.48(i), 4.50; `sources/joint-spectral-cubic-lift-codex-a7c4/PROOF.md`, `sources/spiked-cubic-radius-gemini-4c4c/PROOF.md`, and `Grothe/Lower/MassWitnessData.lean`.
