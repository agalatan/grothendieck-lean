# Shared phase approximation: analytic ingredients

Agent-ID: codex-cf82, building on codex-alternate-gaussian. These written
arguments are not Lean theorems. The current parameters and quantitative
error allocation are in `SHARED_SOFT_MIXTURE.md`.

For independent standard complex Gaussians z,w, let
Z=z+κ(|z|²)w, with real measurable κ. The following bound is uniform in κ,
including κ=0: for 0<r≤1/2,

    P(|Z|≤r) ≤ 8r²(1+log(1/r)).

Indeed, P(|z|≤2r)≤4r². Conditional on |z|>2r, κ≠0 and |y|≤r, the
conditional density of Z at y is at most

    exp(-(|z|-r)²/κ²)/(πκ²) ≤ 4/(πe|z|²),

because max_{v>0} v exp(-cv)=1/(ec). For κ=0 the conditional probability
is zero in this region. Integrating over the radius-r disk and then over
s=|z|² yields

    P(|Z|≤r) ≤ 4r²+(4r²/e)∫_{4r²}^∞ e^(-s) ds/s
                ≤ 8r²(1+log(1/r)).

For 0<η≤1/2, let x=|Z|²+η². The pointwise difference between phase(Z) and
Z/√x is bounded by min(1,η²/(2|Z|²)). Separate |Z|≤η and the dyadic
shells 2^jη<|Z|≤2^(j+1)η. For shells whose upper radius exceeds 1/2,
use the probability bound 1; the same estimate below dominates it. The
small-ball bound then gives

    E|phase(Z)-Z/√x|² ≤ (56/3)η²(1+log(1/η)).

The actual profile obeys ||Z||₂<2. `check_profile_l2.py` verifies the finite
rational part: for the 12 exact coefficients, the L²(e^(-s)ds) norm squared
of each L_j^(-1/2) is <4/3, binom(2j,j)/4^j ≥1/(2j+1), |a|<1, and

    ||v||₂ ≤ (6/5)|x₀| + 6 Σ_{j=1}^{11}|x_j| < 0.584.

Together with π>1 and the profile normalization, this yields
E|Z|²=1+(1+a²)E[v(|z|²)²]<4. The Gaussian identity and the profile-norm
inequalities still require in-kernel proofs for a Lean conclusion.

For x>0, the Laplace identity and exponential substitution give

    x^(-1/2) = (1/√π)∫_R exp(u/2-x exp(u)) du.

For the infinite trapezoidal rule of spacing h, Poisson summation and
|Γ(1/2+it)|²=π/cosh(πt) bound the relative aliasing error by

    2√2 exp(-π²/h)/(1-exp(-π²/h)).

Both tails of a finite sum are bounded by a geometric sum at the left and,
once the integrand decreases, the corresponding incomplete Gaussian
integral at the right. Positive weights and normalization by an upper bound
on the relative alias error give a disk-valued finite mixture. The actual
finite cutoffs, root-region omission, and directed numeric replay are in
`SHARED_SOFT_MIXTURE.md` and `check_soft_shared_budget.py`.
