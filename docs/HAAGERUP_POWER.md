# Hypothesis-free upper bound from a canonical resolvent completion

`Grothe.haagerup_bound` proves **K_G^ℂ ≤ 1.404909140** for every finite complex
matrix, with no Gaussian, integration, or numerical-tail hypotheses.
The sharper conditional upper bound and lower endpoint are separate.

The Gaussian phase identity, tensor realization, complete finite residual,
infinite remainder estimate, checker soundness and matrix transfer are all
in Lean. The finite checks are discharged by kernel proofs. External replay
results are not hypotheses of the theorem.

## Complete monotonicity and the resolvent expansion

Write Δa_k = a_k − a_(k+1). A sequence is completely monotone when
Δ^j a_k ≥ 0 for every j and k. In particular, every difference sequence is
nonnegative and decreasing. If a_k tends to zero, so do all its differences,
since 0 ≤ Δ^j a_k ≤ a_k.

The normalized Haagerup coefficients satisfy

r_0 = 1, r_(k+1) = r_k (2k+1)² / (4(k+1)(k+2)).

Lean proves their complete monotonicity structurally. For the rising-factorial
quotient u(α,β)_k = (α)_k/(β)_k, with 0 ≤ α ≤ β and β > 0,

Δu(α,β) = ((β−α)/β) u(α,β+1).

Repeated differences therefore remain nonnegative. The discrete product rule
Δ(uv)_k = (Δu_k)v_k + u_(k+1)Δv_k preserves complete monotonicity, and
r_k = u(1/2,1)_k u(1/2,2)_k. Summability gives r_k → 0.

Put A = X P², T = X^K P^(2K+1), and E = 1 − R(1 − A). Suppose

- ‖P‖₁ ≤ 1;
- ‖E‖₁ ≤ η < 1;
- ‖RT‖₁ ≤ B;
- ‖RA‖₁ ≤ C.

The geometric-prefix identity (1−A) Σ_(i<n) T A^i = T−T A^n gives
‖Σ_(i<n) T A^i‖₁ ≤ 2B/(1−η). Finite Abel summation then bounds a sum
with decreasing nonnegative weights by its initial weight times this constant.

Let a be completely monotone, with a_k → 0. For
W_n(a) = Σ_(i<n) a_(K+i) T A^i, one summation by parts gives the exact
recurrence

W_n(a) = a_K RT − RA W_n(Δa) + E W_n(a) − a_(K+n) RT A^n.

Iterating this recurrence defines the canonical completion

Q_m = Σ_(j<m) (Δ^j a)_K (−RA)^j RT.

The remaining terms are (−RA)^m W_n(Δ^m a), an inverse-defect contribution
E Σ_(j<m) (−RA)^j W_n(Δ^j a), and the boundary
−Σ_(j<m) (Δ^j a)_(K+n) (−RA)^j RT A^n.

Every fixed coefficient prefix of the composed series sees only finitely
many terms because the kth term contains X^k. Hold that prefix fixed and
let n grow: all boundary weights vanish. Abel summation at each difference
order yields the complete coefficient-norm estimate

‖Σ_(k≥K) a_k X^k P^(2k+1) − Q_m‖₁
≤ 2B/(1−η) · [C^m (Δ^m a)_K + η Σ_(j<m) C^j (Δ^j a)_K].

This holds at every order m. It uses finite polynomial identities and
coefficient locality; it does not require an infinite polynomial inverse.
The finite head and Q_m are added before taking absolute values, preserving
the cancellation between them.

## Complete certificate

The preprocessor p(t) = t P(t²) has degree 29; P has degree 14, coefficient
norm exactly one, and constant coefficient
1020379367568975/1125899906842624. The resolvent R has degree 64 and is
stored as its 65 coefficients, without trailing zero padding.

The exact parameters are:

- K = 64 series terms and m = 6 correction terms;
- coefficient cutoff 2,500; Lean proves the completed residual has degree at most 2,492;
- η = 10⁻¹² for the inverse defect;
- ‖R P^17‖₁ ≤ 249/500, giving B = 1/2 using ‖P‖₁ ≤ 1;
- ‖R−1‖₁ + η ≤ 2, giving C = 2;
- r_64 ≤ 1/10⁴ and Δ^6 r_64 ≤ 37/10¹³;
- completed finite residual ≤ 914/10¹¹ = 9.14·10⁻⁹;
- infinite remainder ≤ 24/10¹¹ = 0.24·10⁻⁹.

Complete monotonicity bounds every Δ^j r_64 by r_64. Since
Σ_(j<6) 2^j = 63, the general remainder estimate is bounded by

[64·(37/10¹³) + 10⁻¹²·(63/10⁴)] / (1−10⁻¹²) < 24/10¹¹.

The finite check bounds the full polynomial

P Σ_(k<64) r_k (XP²)^k + Q_6 − P(0).

The total normalized residual is therefore at most 938/10¹¹ = 9.38·10⁻⁹.
Residual transfer and the proved lower enclosure for π give

K_G^ℂ ≤ 4/[π(P(0) − 938/10¹¹)] < 1.404909140.

The rational polynomial inputs live in
`data/haagerup-resolvent/certificate.json`.
`tools/gen_haagerup_power.py` reproduces
`Grothe/Haagerup/PowerCheck.lean` byte for byte. The canonical completion
parameters and differences are defined in `Grothe/Haagerup/CanonicalData.lean`.
Floating searches propose data and play no role in acceptance. The existing
native fact in `PowerCheck.lean` is unchanged and is not a dependency of the
public bound.

## Sources and replay

- `Grothe/Upper/FiniteDifference.lean`: all-order finite differences and complete monotonicity.
- `Grothe/Haagerup/CompleteMonotone.lean`: the rising-factorial quotient proof for the Haagerup coefficients.
- `Grothe/Upper/ResolventTail.lean`: the finite inverse certificate, Abel estimate and coefficient locality.
- `Grothe/Upper/ResolventCompletion.lean`: the all-order completion identity and infinite remainder estimate.
- `Grothe/Upper/ResolventCertificate.lean`: soundness of the complete finite residual check.
- `GrotheKernel/ResolventCompletion.lean`: outward integer computation of the finite head and correction.
- `Grothe/Haagerup/CanonicalCheck.lean`: the four kernel checks.
- `Grothe/Haagerup/CanonicalProof.lean`: complete composition and matrix transfer from those checks.
- `Grothe/Haagerup/Power.lean`: the public matrix theorem.
- `docs/research/haagerup-power.tex`: full written proof.
- `tools/verify_haagerup_canonical.py`: independent rational and directed-ball replay.

From the repository root, with Python and `python-flint`:

```sh
python3 -I tools/verify_haagerup_canonical.py --out handoff/haagerup-canonical-replay.json
```

The replay checks the complete finite polynomial, seed and inverse defect,
exact coefficient differences, the remainder budget, and the final endpoint.
It checks every coefficient of the completed polynomial.

The focused axiom audit permits only `propext`, `Classical.choice`, and
`Quot.sound` for the canonical route:

```sh
lake env lean scratch/AxiomsPower.lean | python3 scripts/check_axioms.py --haagerup-power
```

Run this from the worktree root. The normal CI audit includes the same
results. The directed replay and source manifest are in
`docs/verification/haagerup-canonical-20261026/`. Work-branch validation is
tracked in issue #113; CI is deferred at the user's request.
The lower node-cap import closure is unchanged.
