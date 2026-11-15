<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-odd-over-AB-core-2026-11-15/phase1/certification/PROOF.md, 2026-11-15 11:39; Agent-ID: codex-91d4. -->
# A certified counterexample to the common-trial odd premise

Agent-ID: **codex-91d4**. Refs #430. 15 November 2026.
**P+C by author**, with separate-reader checks within this session.
Opposite-side external review and Lean formalization have not occurred.

For the exact genuine one-remote-coordinate fields below, the fixed
common-trial increment satisfies

    J_odd − (1/100)‖r_B−ρr_A‖² − 1/20000 > 1/10000.   (1)

Thus the proposed `(O_U)` with `κ=0` is false on the stated genuine-chaos
energy/ellipsoid relaxation. This does not assert that these coefficient
fields arise from an actual bounded common response. Nor does it assert
a violation of the absolute Conjecture K payoff or of a comparison in
which the remote trial is independently reoptimized after adding O.

## 1. Exact fields and the functional being bounded

Let `Y,Z` be independent standard proper complex Gaussians, `S=|Y|²`,
`T=|Z|²`, and `L=Z(a+bT)` with `a=699/1250`, `b=179/1250`,
`p=2500/1891`, `ρ=5053/10000`. Define

    q=(57/5000)Y(S−2),
    r_A=(133/1000)Y,        r_B=(21√2/200)Y,
    E=q+(T−1)r_A+Z² conj(r_B)/√2,
    O=−i[(63/1000)Z(S−1)+(53/10000)conj(Z)Y²
                                  +(7/5000)Z(T−2)].

These have exactly the required complex Gaussian chaos degrees. Put
`R=r_A+ρr_B`, `U=r_B−ρr_A`, and use the same remote trial as the A/B
premise: `ξ₀=−3R/5`. For `X=L+E−ξ₀`, the functional is

    J_odd=inf_(c∈C) {|c|²+E[|X+O−cZ|+|X−O+cZ|−2|X|]
                                                    −pW},
    W=‖O‖²=(63/1000)²+2(53/10000)²+2(7/5000)².

The infimum is over one global complex visible coefficient. The proof
below bounds that full infimum, not only a numerical trial value.

The exact energies, checked independently by the parent task, are

    ‖q‖²=2(57/5000)²=.00025992,
    total energy=2201401/50000000=.04402802,
    ellipsoid left side=6802843/150000000=.045352286666….

They satisfy the remote, total, and strengthened ellipsoid constraints
at first-chaos size `.84`; the ellipsoid slack is greater than `.0003035`.
The scalar certificate does not prove the converse assertion that a
bounded common response realizes them.

## 2. A norm-support dual for the full visible infimum

Choose any measurable complex functions `σ₊,σ₋` with `|σ±|≤1`, and set

    A=Re E[(X+O)conj(σ₊)+(X−O)conj(σ₋)],
    K=E[conj(Z)(σ₊−σ₋)].

The elementary support inequality `|v|≥Re(v conj σ)` gives, for every c,

    |c|²+E[|X+O−cZ|+|X−O+cZ|]
       ≥ |c|²−Re(c conj K)+A.

Completing the single complex square therefore proves

    J_odd ≥ A−|K|²/4−2E|X|−pW.                       (2)

There is no inverse norm or differentiated phase in this argument.
Zeros of either norm argument cause no exception. The supporting
functions may be chosen using an approximate optimizer; their unit-disc
membership is the only acceptance requirement.

For comparison, taking the exact phases at a trial `c₀` gives (2) equal
to `J(c₀)−|∇J(c₀)|²/4` whenever that gradient is justified. The present
checker does not need to integrate those exact phases or bound that
gradient.

## 3. Three independent real variables and reflection

All displayed fields have common charge one under simultaneous phase
rotation of Y and Z. Quotienting by the phase of Y permits `Y=r≥0`
and `Z=x+iy`, with independent measure

    (e^(−x²)/√π) dx · (e^(−y²)/√π) dy · (2r e^(−r²)) dr.

Write `c_q=57/5000`, `α=133/1000`, `β=21/200`, and

    k₀=−2c_q−α+(3/5)(α+ρ√2β).

The exact real polynomials used by the checker are

    Re X=b x³+bxy²+ax+c_q r³+k₀r+(α+β)rx²+(α−β)ry²,
    Im X=ay+bx²y+by³+2βrxy.

Put `d=63/1000`, `e=53/10000`, `n=7/5000`. Then

    Re O=y[(d−e)r²−d−2n+n(x²+y²)],
    Im O=−x[(d+e)r²−d−2n+n(x²+y²)].

Reflection `y↦−y` gives `X↦conj X`, `O↦−conj O`. The supports on the
negative half are defined by swapping and conjugating the supports on
the positive half. Consequently A and `E|X|` double, and K is purely
imaginary with its imaginary part doubled. This is an exact symmetry
of the supporting functions, not an assumption about an optimizer.
In fact convexity and the same reflection also show an optimizer may
be chosen purely imaginary, but (2) already covers the full complex c.

## 4. Rectangular moments and support acceptance

The finite domain is

    −5≤x≤5,   0≤y≤5,   0≤r≤5.

It is partitioned into `320×160×160=8,192,000` rectangular cells. On
each one the Gaussian measure is a product. The fresh Arb script computes
its positive mass and conditional moments of each coordinate through
degree six. First moments of X,O,Z and the second moment `E_cell|X|²`
are consequently exact polynomial expressions in these enclosed moments.

For a cell of mass m, choose dyadic supporting numbers σ± near the
phases of the conditional means of `X±(O−c₀Z)`, using
`c₀=−.001374806264635 i` only as a proposal. Every proposed support is
accepted only after outward interval arithmetic proves `|σ±|²≤1`.
Neither the proposed phase nor c₀ is a trusted numeric premise.
The contributions to A and K are then linear expressions in the cell
means, with these fixed admissible support numbers.

The baseline contribution has the unconditional Cauchy–Schwarz bound

    ∫_cell |X| dμ ≤ m sqrt(E_cell|X|²).               (3)

This works even on cells containing zeros or critical points. The
checker assembles the squared polynomial exactly by monomial products;
it does not replace this second moment by sampled values.

### Fresh one-dimensional moment construction

For the normal density `e^(−x²)/√π` on `[l,h]`, let `I_j` denote its
unnormalized jth moment. Arb evaluates

    I₀=(erf h−erf l)/2,
    I₁=(e^(−l²)−e^(−h²))/(2√π),
    I_j=[l^(j−1)e^(−l²)−h^(j−1)e^(−h²)]/(2√π)
                                                   +(j−1)I_(j−2)/2.

For radial density `2r e^(−r²)`, the corresponding moments are

    M₀=e^(−l²)−e^(−h²),
    M₁=l e^(−l²)−h e^(−h²)+(√π/2)(erf h−erf l),
    M_j=l^j e^(−l²)−h^j e^(−h²)+(j/2)M_(j−2).

Dividing by the strictly positive mass gives the conditional moments.
Arb runs at 160-bit precision. Each endpoint is extracted as an exact
dyadic rational and converted outward to binary64, checked by rational
comparison. The input file stores the binary64 bit patterns as integers,
so decimal parsing cannot move a moment endpoint inward.

## 5. The complete tail is included

Set both supports to zero outside the finite box, including its
reflection. This is admissible and gives no omitted A or K contribution.
The full negative baseline term in (2) still needs its tail upper bound.

Use `|X|≤|Re X|+|Im X|` and the eleven displayed real monomials. If
`G_j=E|x|^j`, `R_j=Er^j`, and `GT_j,RT_j` are their tails beyond 5,
the tail integral of an absolute monomial is at most

    GT_i G_j R_k + G_i GT_j R_k + G_i G_j RT_k.

This is the union bound for `|x|>5`, `|y|>5`, or `r>5`; any overlap is
overcounted safely. Multiplying by the absolute polynomial coefficients
and summing bounds the baseline norm tail. The moments and their tails
are freshly computed using the standard integration-by-parts recurrences
in `make_moments.py`. Their upper bound is

    E[|X| outside box] < 1.367518·10⁻¹⁰.

Twice this entire tail is subtracted in (2). No Gaussian region or
singular neighborhood is discarded.

## 6. Outward arithmetic, acceptance, and replay

The C++ checker uses IEEE binary64 in `FE_UPWARD`, with downward endpoints
obtained by sign reversal. Products use all four endpoint combinations;
square roots are rounded upward with the lower endpoint additionally
moved outward. It rejects `NDEBUG` and fast math, checks rounding at
entry and exit, and checks that every generated cell was visited.
An incomplete run returns nonzero and cannot print PASS.

The accepted interval computation gives the following decimal displays
(the exact acceptance uses the enclosed binary values, not these prints):

    A lower                    1.3785990335163759,
    Im K interval             [−.002747511974343655,−.0027475119702065346],
    baseline compact upper     .68652588060877951,
    odd gain lower display     .00021870581398379229,
    allowance upper display    .00011607661566045215,
    residual lower display     .00010262919832334015.

The acceptance test compares the residual lower endpoint against an
outward upper enclosure of the exact rational `1/10000`. This proves
(1) without interpreting a rounded decimal print as an exact bound.
The C++ loop takes about one second on this machine; the entire fresh
wrapper takes a few seconds. No heavy computation was necessary.

Run with Python 3.12 and python-flint available at the dependency path:

    python3 -I verify.py --dependency-dir /path/to/python-flint/site-packages
    python3 -I negative_controls.py

`verify.py` recompiles with the recorded strict flags, freshly generates
every moment, checks the generator's output digest and expected cell
count, runs the outward checker, and records source/output hashes,
compiler details and runtime in `certificate_result.json`. Saved moment
files or saved PASS flags are never mathematical acceptance inputs to
this wrapper. The standalone C++ executable is conditional on the
correctness of its moment input; the fresh wrapper discharges that part.

The separate exact energy and response-domain arithmetic is recorded by
the parent task's `phase1/verify_candidate_inputs.py`. The author and
other workers have independently checked the dual, moment recurrences,
reflection, and tails within this session; external review remains open.
