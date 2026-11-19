<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe-codex-a7c4-cumulant-remainder/handoff/codex-a7c4-cumulant-remainder/JOINT_INTERFACE.md, 16 November 2026. Only this line was added. -->
# Interface with the odd-sector remainder

Agent-ID: codex-a7c4. Refs #467 and #436. 16 November 2026.
This records the interface supplied by codex-91d4 while the scalar
remainder is strengthened after #465. It is not a bound for the full
residual. Source: [coordination comment](https://github.com/agalatan/grothendieck-lean/issues/436#issuecomment-6914973048)
and the reviewed partial-q packet in
`sources/partial-q-2026-11-15-codex-91d4/`.

At fixed visible radius T and projection angle θ let A=Re(e⁻ⁱθq),
B=B₁+B₂ be the retained first/second-chaos projection, v=u/2,
τ=‖DA‖²/3 and Γ=⟨DA,DB⟩/3. This Γ is a *mixed* factor and is
not the normalized scalar factor used in #465. Write

    λ=v(1−t),
    K_t^c(s)=2/√λ [φ((s+c+ell)/√λ)+φ((s+c−ell)/√λ)],
    c_ν=√T(T−2)/√2 [Re(ν)cos θ+Im(ν)sin θ].

The partial-q replacement error is π/4 times the outer (T,θ)
expectation of ∫₀¹ E_remote[(τ−v+Γ/√t)K_t^(c_ν)(√t A+B)]dt.
Subtracting the bare B=0, ν=0 path gives exactly

    Δ_full=−D(q)+R_shared,
    R_shared=(π/4)E_(T,θ)∫₀¹ E_remote{
      (τ−v)[K_t^(c_ν)(√t A+B)−K_t^0(√t A)]
        +(Γ/√t)K_t^(c_ν)(√t A+B)}dt.               (J1)

Against the reviewed anisotropic reference, a sufficient next target is

    R_shared≤σ(u)+D(q)+.075 V+(p−1.25)o+(p−1.06)n+η, (J2)

where σ(u)=S−[B(u)−pu]≥0, V=E_A+E_B, o=E_Q+E_P,
n=|ν|², p=2500/1891 and **η<10⁻⁴**. Each cost is spent once.
The scalar D in (J1)–(J2) is the bare fixed-trial deficit, not a
retained infimum or an independently reusable allowance.

Book Chapter 8 applies to the full joint vector. It does not permit
setting mixed cumulants to zero: E[A B^k]=kE[Γ B^(k−1)], although
E AB=E Γ=0. The exact shared-field examples in `joint_controls.py`
make both the third and fourth mixed cumulants nonzero. The current
absolute estimate for Γ scales as χ^(1/4) times a lower-sector
amplitude; its Young bound scales as √χ, larger than the scalar
deficit's χ scale near zero. Retaining signs and amplitude factors
is therefore substantive, not just a normalization change.

There is also an endpoint obstruction to a naive further integration
by parts. The original kernel bound is integrable:

    ‖K_t‖∞≤4/[√(2πv)√(1−t)].

But its first derivative has only the uniform bound

    ‖K'_t‖∞≤4/[√(2πe)v(1−t)],

whose integral diverges at t=1. A signed mixed expansion needs
averaged cancellation, density control, or a terminal interval handled
with the original kernel. It cannot insert this derivative bound
over the whole interpolation interval and call the remainder finite.
codex-91d4 owns that joint continuation; the present packet improves
the scalar input in (J2), with no bound asserted for R_shared.
