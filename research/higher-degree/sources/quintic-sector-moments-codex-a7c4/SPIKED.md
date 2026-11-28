# An additional spiked support inequality for an actual pair

Agent-ID: codex-a7c4.

Use the capped degree-five game and the visible coordinate of the predecessor's all-sector argument. Write \(U=P_{2,1}k\), \(A=\|U\|_2^2\), \(t=\|P_{1,0}h\|_2\), and \(\chi=\mathbb E|U|^4/A^2-2\) for \(A>0\). Write \(x_j\) for the five nonremote energies in order \((11,20,10,01,21)\), and take the five positive rational prices \(w_j\) from the predecessor. Suppose
\[
    \sum_j w_j x_j/A \le D.
\]
The sixth sector is the remote one. The vectors involved may share coordinates in arbitrary dimension.

Take \((\ell,\beta)=(1100,2379)/2621\). The Pythagorean identity gives \(\ell^2+\beta^2=1\). Apply the symmetrized spiked support inequality to \(G=\beta U/\sqrt A\). Its normalized fourth excess is exactly \(\chi\). Its five nonremote sector energies \(E_j=\beta^2x_j/A\) satisfy
\[
    \sum_j w_j E_j\le \beta^2 D,\qquad
    \sum_j E_j\le \beta^2 .
\]
The second inequality follows by Parseval, including when the remote component vanishes. The half-plane \(\ell t+\beta\sqrt A\le\phi(\ell,G)\) follows by testing the given unimodular pair in P7 Lemma 1.1. This step uses the same pair in the charge and the support. [Symmetrized spiked support, Lemma 1.1 and §5](../spiked-cubic-radius-gemini-4c4c/PROOF.md)

For each of six contiguous shape slabs, the new data give a P7 pointwise Stein majorant. Replay its knotwise inequalities and polynomial Sturm checks, including the half-line beyond the last knot. In the source's final rational dual objective, write the contribution from the first right-hand side as \(y\beta^2 D\). Evaluating that objective at right-hand sides \((0,\beta^2)\) computes the intercept \(b\); the normalized slope is \(a=y\beta^2\ge0\). This remains valid at every nonnegative \(D\). The input value \(\beta^2 D=.012\) was used to find the potentials. The verifier checks each of them globally on its specified shape slab and obtains its own intercept and slope.

The six models were found with the existing P7 generator. For each adjacent pair in \(2,3.2,4.1,5.3,6.6,8.5,12\), pass the new ray, the two sector rows above, right-hand sides \((.012,\beta^2)\) and the generator’s `peak` knot grid to `make_row`. The solver proposes rational data; the standard-library replay consumes only the checked coefficients. [P7 generator](../../code/spiked-cubic-radius-gemini-4c4c/make_cert.py)

For a fixed actual cubic, freeze its normalized contraction vector and its five sector energies. P7 §5's final convexity argument bounds the objective by a convex function of \(\chi\) for these fixed vectors. At each end of the model's slab substitute the certified upper \(b+aD\). The chord of the two bounds is therefore an upper bound throughout the slab. In a shape interval meeting several slabs take a bound for every nonempty intersection. A subinterval outside the six slabs keeps the previous unrestricted energy bound. No interpolation in dimension, sector direction or physical energy is required.

The one-command replay uses the same normalized charge in the prior ray, in this second ray and in the mixed fourth-moment estimate. A violating pair must also have
\[
     A\ge \frac{\tau-\eta-(1-\eta)t_1^2}{\varepsilon-\eta}
\]
on an amplitude box with upper endpoint \(t_1\), since \(\|k\|_2^2\ge A\). After the small-energy branch, take the maximum of this and the predecessor's \(11/20\). Every charge and elliptic shape interval may use the resulting lower endpoint.

For the refined elliptic step, set \(r=2(179/200)^2-1\) and use the mixed-fourth-moment formula. In the slot order above its cross term is bounded by
\[
   \sum_j d_j x_j/A+8\sqrt2\,r\sqrt{x_{11}x_{20}}/A,\quad
   d=(8,8,4+4r,4,12+8r).
\]
The five diagonals \(99w_j-d_j\) are nonnegative. The product of the first two is at least \(32r^2\), so the real symmetric matrix with these diagonals and off-diagonal entry \(-4\sqrt2r\) in the first block is positive semidefinite. This proves the cross term is at most \(99D\). The older shape-only coefficient \(2\sqrt{3(1+r^2)}\sqrt\chi\) remains available. Both coefficients multiply \(w(1-w)\ge0\), with \(w=(ct)^2/(A+(ct)^2)\). Therefore their minimum is admissible. The proof obtains the cap from this common sector inequality even in cells outside the six added P7 slabs. [Derivation of the mixed coefficients](MOMENTS.md)

The payoff cover starts by assuming a pair with \(V\ge 1/K-10^{-5}\). Every upper-energy update is an implication for that same pair. When the charge is negative or the upper energy falls below a necessary lower endpoint the cell is empty under that assumption. The rectangular checks bound the physical payoff at the upper energy using the verified monotonicity of each combined payoff-and-mass objective. This proves a dimension-uniform gap of \(10^{-5}\) to \(1/K\) on the stated strip. The finite cell clearance is extra room in the contradiction.

## Certified strips

| \(K\) | Amplitude strip added to the predecessor | Closed cells | Extra contradiction clearance in trillionths |
|---:|---:|---:|---:|
| 1.4023 | [.388, .408] | 478 | 704560 |
| 1.4025 | [.3875, .407] | 314 | 2570180 |
| 1.403 | [.386, .405] | 216 | 467250 |

Each row proves \(V<1/K-10^{-5}\) for every dimension on its closed strip. For the first target, at \(t=.407,\sqrt\chi=2.49\), removing the fresh spiked ray makes the cell comparison fail by more than .00361; using it gives contradiction clearance above .00124. At \(t=.42,\sqrt\chi=1.86\), removing the sector-sensitive elliptic term makes the comparison fail by more than .00361; using it gives clearance above .00215. The second control lies outside the unconditional strip and illustrates a further shape-resolved implication. A final control at \(t=.4085,\sqrt\chi=2.305\) exceeds the target by more than .00207 in this specific relaxation. It makes no assertion about the value of a physical pair.

## Repricing a fixed Stein potential

Task [#855](https://github.com/agalatan/grothendieck-lean/issues/855) extends the unrestricted 1.4023 comparison through $t=.40869$. It reuses the potential on $\chi\in[5.3,6.6]$, the same support direction and the same five sector weights. At each of the two shape endpoints, replace the five positive Hölder coefficients and the nonnegative Gram multiplier by the rationals in `repriced_model`. Keep the original price bank as an additional option. The initial fit used a normalized sector right-hand side of $.012$; the comparison near the old failing cell uses about $.020$. The validity of a price depends only on its exact dual inequalities.

The verifier checks the rational replacement with the original Sturm and endpoint tests before using its chord. At any fixed shape and sector budget both the original and the repriced chord bound the same response, so either can tighten the energy. The [cover](../../code/quintic-sector-moments-codex-a7c4/cover.py) applies this pointwise choice only on subintervals where the corresponding model is valid, and checks every shape up to the maximum excess of 42. The exact cover checks $[.408,.40869]$ at the 1.4023 target, $[.407,.40825]$ at 1.4025, and $[.405,.40705]$ at 1.403. These use 520, 698 and 604 closed cells respectively. At $t=.4085$, $\sqrt\chi=2.305$, the old comparison exceeds its target by more than $.00207$, while the replacement gives contradiction clearance above $.00039$. A failing comparison after repricing still identifies an open region for this relaxation. Each certified strip has the same $10^{-5}$ payoff reserve.

At $t=.408694$, $\sqrt\chi=3.464102$, the comparison exceeds the target. This control is just beyond $\chi=12$, the end of the six checked shape intervals. A search confined to the central shape near $5.3$ misses it. The cover on $[.408,.40869]$ includes this high-excess region at every certified amplitude.

The [fixed-price test](../../code/quintic-sector-moments-codex-a7c4/fixed_prices.py) isolates why repricing helped. At $t=.4085$, $\sqrt\chi=2.305$ and trial energy $A=.695$, write $p_i\cdot E\le D_i$ for each of the six Gram inequalities in the spiked-support normalization, alongside $\sum E_j\le\beta^2$. Taking only $E_{10}=\min(\beta^2,\min_i D_i/p_{i,10})$ nonzero gives a feasible vector for this sector relaxation. With the original Hölder coefficients and all other potential and contraction parameters fixed, the two endpoint sector objectives are affine in $E$. The checker extracts the constant intercepts by using the identity constraint matrix at zero right-hand sides and verifies each original sector coefficient lies in $[0,1]$. Their chord at this feasible vector exceeds the required support by more than $0.000013197$. Using all six sector constraints instead of the single compressed one can lower that frozen chord price by less than $0.000000004751$. The example identifies a loss in this specific optimization; it requires no cubic realizing the trial data.
