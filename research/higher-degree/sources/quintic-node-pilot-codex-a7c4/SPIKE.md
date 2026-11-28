# Two finite g84 payoff bounds at the stored cubic scales

Agent-ID: codex-a7c4. Rows t=.80 and .85 of g84=(1,−.84,.2552), using the finite three-coefficient objective and its strong concavity from #827. Let σ be the stored row's positive cubic RMS and write q=σ[c e21(y)+sqrt(1−c²)W] with independent proper Gaussians z,y,W. For all three complex quintic coefficients at t=.80, the full finite objective is less than 1/1.4027−10⁻⁵ throughout 0≤c≤.058. At t=.85 the same conclusion holds for all three real coefficients throughout 0≤c≤.052. The proof bounds the supremum over all these coefficients at fixed σ; all other response sectors remain fixed as in this finite family.

## A two-variable integral at c=0

Write η=.2552, ε=.84, and ℓ,β,b_A,b_B,ν₀,σ for the exact decimal values in the corresponding g84 row. Evaluate the trial (ν₀,A,B)=(ν₀,0,0). Put T=r², E=r(T²−6T+6)/sqrt(12), a=1−b_A(T−1), b=−b_BT/sqrt(2). Circularity lets us take z=r. In the projected real direction φ set
```
m=[r(ℓ+β(T−2))+ν₀E] cos φ,      D²=(a−b)²+4ab cos²φ,    s=σ D .
```
The projected bath is Gaussian of variance s²/2 and the two signs have the same expectation. Its absolute-value mean is
```
f(m,s)=m erf(m/s)+(s/sqrt(π)) exp(−m²/s²),       ∂ₘ f=erf(m/s).
```
Use |w|=(π/2)Eφ|Re(exp(−iφ)w)| and reflection symmetry to integrate φ from 0 to π/2. With x=tan(φ/2), cosφ=(1−x²)/(1+x²), the paired expected norm and its ν derivative become the integrals over r∈[0,∞), x∈[0,1] of
```
8r exp(−r²)/(1+x²) times { f(m,s), E cosφ erf(m/s) }.
```
The remaining payoff constant is t²−2ℓt+2β²/ε+σ²[(b_A²+b_B²)/η−1/ε]−ν₀²/η. The remaining derivative is −2ν₀/η. All A and B partial derivatives vanish exactly at this trial when c=0: the norm score is independent of y and both remote Hermite modes are centered. For complex coefficients the imaginary ν derivative vanishes by complex conjugation as well.

On each of 384×192 equal rectangles covering [0,6]×[0,1], cert.cpp encloses the midpoint and the two unmixed second derivatives of each integrand throughout that rectangle. For a C² function on an interval of width h, the difference between the mean and midpoint value lies in (h²/24) times the interval enclosure of the second derivative. Apply this once in each coordinate. For instance, average over r the x-rule error and then apply the r-rule at the x midpoint. There is no mixed-derivative term in this decomposition. The interval derivatives come from the product and chain rules, using pointwise interval enclosures of both derivatives and the argument. D≥1+b_A>0 throughout the domain. For r≥6 the folded mean and the absolute derivative factor are each ≤4r⁵ for these row parameters. Thus each omitted integral has absolute size at most
```
8π∫₆∞r⁷ exp(−r²)dr = 4π exp(−36) (36³+3·36²+6·36+6) < 2·10⁻¹⁰.
```
The paired expected norm has nonnegative tail. All binary64 operations use one representable number of outward widening, with round-to-nearest IEEE arithmetic, gradual underflow, disabled fast-math and disabled FMA contraction. The algebraic square-root calls use correctly rounded sqrt. MPFR evaluates monotone exp and erf endpoints, decimal input conversion, and π with directed rounding. The wrapper checks the hash of the stored data before passing its decimal spellings to the executable. The final comparisons use rational arithmetic on the emitted hexadecimal endpoints.

The strong concavity inequality at the trial x₀ gives sup F≤F(x₀)+||∇F(x₀)||²/(2m₀). Specifically, the [Gaussian-bath theorem of #827](../finite-spike-codex-a7c4/PROOF.md) gives an unpriced Hessian upper of 7.712 I at t=.80 for the six real coordinates of all complex triples (0≤c≤.73), and 7.786 I at t=.85 for the three real coordinates (0≤c≤.20). Only c=0 from each theorem is used here. The wrapper sets m₀=2/η−7.712 or 2/η−7.786 respectively. The second-derivative bounds in the integration itself concern r and x and serve solely to enclose the quadrature; they do not establish concavity in ν,A,B. Using outward rounding we obtain

| t | Trial F interval | Scalar gradient interval | Uniform diffuse upper |
|---|---|---|---|
| .80 | [.7121038479,.7121454822] | [−.0000289460,.0000446692] | .712146 |
| .85 | [.7124386491,.7124829165] | [−.0000320697,.0000457834] | .712483 |

## A fourth-order transfer to positive c, uniform in the coefficients

Fix any three coefficients in the indicated field. In each projected direction and at fixed z,y, write M for the projected common mean (including all three quintics). It may depend arbitrarily on y. Put h=σDc/sqrt(2) and s₀=σD sqrt(1−c²)/sqrt(2), and let g(m)=E|N(m,s₀²)|. The two projected branches of the spike give the arithmetic mean of g(M+hX),g(M−hX), where the standardized projection X has the law sqrt(S)(S−2)cosθ for S=|y|² standard exponential and θ uniform. Rotation of θ depending on z,φ preserves its distribution. The comparison with c=0 at those same coefficients is E_Z g(M+hZ) for an independent standard real Z; this exactly restores the removed bath variance. At every z,φ, the spike moments are EX²=1 and EX⁴=66 by the factorial moments of S.

For K=sqrt(2/π), we have 0≤g″≤K/s₀ and
```
−K/s₀³ ≤ g⁽⁴⁾(m) = (K/s₀³)[(m/s₀)²−1] exp(−m²/(2s₀²)) ≤ (.45)K/s₀³ .
```
The maximum is 2 exp(−3/2)<.45. Taylor expansion to order three about M cancels the linear and cubic terms by averaging the two spike signs or the centered Gaussian. Bound the spike remainder above and the Gaussian remainder below. This gives a pointwise upper difference of
```
(h²/2)(X²−1) g″(M) + (K h⁴/(24s₀³)) (.45 X⁴+3).
```
Since g″ is nonnegative and bounded uniformly, the expectation of the first term is at most (K h²/(2s₀)) E(X²−1)₊, even when M and X are dependent. Moreover, E(X²−1)₊=1−E min(X²,1)<.77. Indeed min(X²,1)≥min(S(S−2)²,1)cos²θ. On [1/4,1/2], [1/2,1], [1,3/2] and [3,∞), the radial factor is at least 49/64, 1, 3/8 and 1 respectively. Integrating these disjoint pieces and using E cos²θ=1/2 gives more than .23, by outward Taylor bounds on exp(−s).

Finally the two-projection norm factor is π, and E_{T,φ}D ≤ sqrt(E_{T,φ}D²)=sqrt(1+b_A²+b_B²). With d=sqrt(1−c²), this proves the uniform transfer bound
```
sup F_c ≤ sup F₀ + (sqrt(π)/2)σ sqrt(1+b_A²+b_B²)
                      [ .77 c²/d + (.45·66+3)c⁴/(12d³) ].
```
All prices and norms outside the paired expectation coincide between the two cubics because their σ is fixed. The right-hand side increases in c. The rational wrapper checks sqrt(π)<1.77246 using Machin’s formula and the alternating arctan series. It verifies upper payoffs .712899087 on the first positive interval and .712881421 on the second, and rejects removal of the negative Gaussian variance compensation at both endpoints; it keeps the original finite-family and coefficient-field restrictions.

From the repository root run `python3 -IB research/higher-degree/code/quintic-node-pilot-codex-a7c4/verify.py`. It requires a C++17 compiler, pkg-config, GMP and MPFR.
