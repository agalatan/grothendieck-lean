# A Hardy tail for the replacement cell channel

Agent-ID: codex-a7c4. Task #589. **P + C, author only.**

Let F and G be measurable functions on ℂ² bounded in modulus by one. Use the
same preprocessor in both coordinates, with covariance on the real diameter

    r(z) = a z − b z³,     a = 93079/100000,     b = 6921/100000.

For the charge-one cell pair of [row 4.7](https://github.com/agalatan/grothendieck-lean/pull/587), write the analytic kernel on the
diameter as H(t)=Σ_{k≥0} h_k t^(2k+1). Then

    Σ_{k≥126} |h_k| < 3·10⁻¹⁹.

This includes every discarded coefficient from the 126-entry cell head.
The estimate depends on the covariance polynomial and boundedness of the
two maps. The transfer to a global Grothendieck endpoint additionally needs
the mixed head and its identification with the cell kernel.

## 1. An analytic disk for both maps

At a fixed real covariance r∈(−1,1), diagonalize the joint Gaussian law by
U=(X+Y)/√2 and V=(X−Y)/√2. Its density in U,V∈ℂ² continues to

    g_r = π⁻⁴ (1−r²)⁻² exp(−‖U‖²/(1+r)−‖V‖²/(1−r)).

It is holomorphic in the strip |Re r|<1. On every compact subset both
Re(1±r)⁻¹ have positive lower bounds, so the bounded-response integral is
holomorphic there by Gaussian domination. On a circle of radius R, put
x=cos θ. Then Re r = (aR+3bR³)x−4bR³x³. For R=6/5 and also for
R=1201/1000 its derivative is ≥ R(a−9bR²)>0. The maximum of |Re r| is
aR−bR³<1. The harmonic maximum principle gives the entire closed disk in
each case. On the real diameter the integral is the physical covariance kernel. Charge one gives
H(−t)=−H(t) by changing Y to −Y. Thus its Taylor series is odd. Whenever a
Hermite expansion gives this physical kernel near zero, its coefficients are
the same by uniqueness. The numerical candidate still needs that identification
for its computed mixed head.

## 2. The Schur bound on the circle of radius 1.197

Use ρ=1197/1000, j=3/20. On |z|=ρ put v=Re r(z), u=v² and s=|r(z)|². Write

    Δ=(1+s)²−4u=|1−r²|²,         M=1+s−2u,
    A=1−u−jM,                    B=M−jΔ.

The fixed-amplitude Gaussian Schur bound applies to two distinct bounded
response maps, as in the repository theorem
`SchurMainGaussian.norm_HholPair_sq_le`. For equal diagonal covariances,
set p₊=Re(1−r)⁻¹, p₋=Re(1+r)⁻¹ and g₊=p₊−j, g₋=p₋−j. Both g's
are positive once 1−j(1+s)>(1−2j)|v|. The single-coordinate factors of
the determinant bound are

    Z=(g₊+g₋)/2=B/Δ,           T=g₊g₋/Z,
    2E=|r/(1−r²)|²/Z=s/(Δ Z).

Indeed (p₊+p₋)/2=M/Δ and p₊p₋=(1−u)/Δ, so
T+j=A/(ΔZ) and T+2E+j=(A+s)/(ΔZ). Positive g's give positive Z and T,
the two matrix gates in the Schur theorem. Its denominator is 16j² times
the product over the two coordinates of Δ Z (T+j)(T+2E+j).
Substitution of the preceding identities gives

    |H(z)|² ≤ [B/(4jA(A+s))]².

This leaves a univariate polynomial calculation. For y=cos²θ in [0,1],

    u=y[aρ+3bρ³−4bρ³ y]²,       s=(aρ+bρ³)²−4abρ⁴ y.

Set G₀=1−j(1+s). The five polynomials G₀, G₀²−(1−2j)²u, A, B and
48jA(A+s)−B are strictly positive on [0,1]. The replay splits the interval
into eight closed equal subintervals and verifies the Bernstein coefficients
exactly. For a polynomial Σ c_i X^i on a rescaled unit interval and degree d,
the k-th Bernstein coefficient is Σ_{i≤k} c_i binom(k,i)/binom(d,i).
The nonnegative Bernstein basis sums to one, giving strict positivity on
the closed interval. Thus the squared modulus on the entire circle is ≤144.

Orthogonality of the Fourier modes on |z|=ρ now gives
Σ |h_k|² ρ^(4k+2) ≤144. Cauchy–Schwarz against ρ^(−2k−1) gives

    [Σ_{k≥126}|h_k|]² ≤ 144 ρ⁻⁵⁰⁶/(1−ρ⁻⁴) < (3·10⁻¹⁹)².

## 3. An independent check from the Gaussian density

In one complex coordinate pair, integrating the absolute value of the density
in section 1 gives |1−r²|/(1−v²), since p₊p₋=(1−v²)/Δ. There are two coordinate pairs. The joint density therefore
gives |H(z)| ≤ Δ/(1−u)². This uses the boundedness of F,G directly.
On the circle |z|=6/5 the polynomial 1600(1−u)²−Δ is positive on sixteen
rational subintervals. Section 1 gives analyticity past this circle, so
coefficientwise Cauchy and a geometric series give the independent bound

    Σ_{k≥126}|h_k| ≤ 1600 (6/5)⁻²⁵³/[1−(6/5)⁻²] < 5·10⁻¹⁷.

## 4. What this supplies to the candidate

The five old channel allowances and the mixed head in row 4.7, used as
inputs here, give the conditional slope

    7119740836606966286650917986159 / 10³¹.

Its reciprocal is about 1.40454550657. The proposed global endpoint is
still 1.40454551, subject to the head and transfer proof. The new tail
bounds are independent of those assumptions and use all indices ≥126 once.

## Lean and exact replay

From a root worktree with the upper dependencies built, run

```sh
lake build Grothe.UpperSix.Haagerup.SchurHardy
lake env lean scratch/CellContour.lean
python3 research/upper-channels/code/cell_tail.py
```

The Lean replay proves the five angular inequalities by exact polynomial
arithmetic. On each open-right subinterval it substitutes
y=(i+(i+1)z)/(8(1+z)), z≥0, clears the positive denominator, and proves the
resulting coefficients positive. It checks y=1 separately.
`tail_of_circle` takes a holomorphic kernel identified by its real odd
coefficients and a pointwise bound on its circle. It proves the full strict
tail bound using the repository's Parseval and Hardy theorems. Both
theorems use only Lean's standard axioms. The specialization of the Gaussian
Schur determinant to this cell pair is the derivation in section 2.

The independent standard-library replay checks both analytic disks, the two
polynomial certificates, both tail comparisons and the arithmetic at the
proposed six nonzero weights. The Lean proof reads no output from this
script.
