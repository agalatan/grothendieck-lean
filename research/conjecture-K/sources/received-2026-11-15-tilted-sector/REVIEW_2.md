<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15-review/REVIEW_2.md (file dated 2026-11-15 05:02). Only this line was added. -->
# Review of the second tilted-sector delivery of codex-6e2b (15 November 2026)

Reviewer: claude-b9ee, 15 November 2026. The delivery is the folder
`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/` in its state of
04:05 (REPORT.md, theta_proof.md, content_profile_proof.md, localization_notes.md, verify.py and the scripts it
runs). My scripts and logs are beside this file. Labels: **P** re-derived here, **C** checker replayed here,
**N** numerical here, **R** read only.

## 1. Verdict

The three new results are right as far as I checked, and two of them are strong. But the next step that was
planned (localisation of the maximiser to ‖r‖ ≤ 0.085) cannot be reached from them and is not needed:
numerically the remainder has a **global** quadratic bound below the cost (section 4). With it the tilted sector
lemma is reduced to one statement, the comparison of content and deficit, and there the certified constants are
at the edge (section 5).

## 2. What I checked

| claim of the delivery | check | status |
|---|---|---|
| full replay `python3 -I verify.py` | run in an isolated copy with my own python-flint and my own compile of `theta_verify.cpp`: PASS, same hashes, the exact part identical to `results.txt` | C |
| localisation `gain ≤ (1273/1250)u − (859/2500)σ²`, radius 0.371 at u = 0.0463 | re-derived: `C(t) ≥ sqrt(4+t²) − 1` (both ranges, the polynomial `32x³+56x²+24x+1`), the convexity of `g_ℓ`, Jensen under the size-biased law, `E|q|⁴ ≤ 44u²` | P |
| `E|q|⁴ ≤ 44u²` | it is the Lean theorem `Circular.fourth_moment_le_variance` (`Grothe/LowerAnalytic/CircularFourth.lean`) | P (Lean) |
| Stein budget `E[(tr 𝒟)² + 2‖𝒟‖_F²] ≤ 6δ` | re-derived: `Γ_ab = ½(L+6)(Q_aQ_b)`, the degree components `2H₂ + H₄`, the identity for δ with the means `2u²` | P |
| radial Hessian norm `N_V = max{(3A²−2AB+3B²)/8, B²}` | re-derived (entries of the Hessian at (R,0), inverse of [[3,1],[1,3]]) | P |
| shifted resolvent `Π₁Φ(Q) = Π₁[⅓ 𝒟:D²Ψ(Q)]` | re-derived, including the origin of the shift 1/3 and the factor (3u/2)·⅓ = u/2 | P |
| `‖c‖² ≤ (6/25) δ sup N_Φ` | re-derived (`D²P_t = e^{−2t}P_tD²`, `∫e^{−5t/3} = 3/5`) | P |
| `sup_R N_Φ(R) < 1/3` | independent numerics, two routes to (A,B) agreeing to 8 digits: **sup = 0.2957 at R = 0.232** (`check_tilt_report_2_part1.log`, `_part2.log`). The certificate's "largest upper enclosure 0.33332" is its stopping rule, not the value | N (C replayed) |
| range `−1/40 < h_{3/5} < 253/1000` | numerics: maximum 0.25188 at v = 1.35, limit −0.02405 at infinity | N (C replayed) |
| curvature formula (5) of `theta_proof.md` | re-derived (`|X| = ½∫|n_θ·X|dθ`, the cubic root, the factor 2/π, the value at the origin) | P |
| exterior region `|w| ≥ 23/4` | re-derived, every constant (masses 34/25, 1316/1375, 277/675; Jacobian; the bound `sqrt(3πDm/2)`) | P |
| pairing θ ↔ π−θ, the two matrix envelopes, the angular bins | read and checked for logic; the certified matrices have largest eigenvalue about 0.7454 and 0.7453; my grid value of Θ(0.3) is 0.7086 | P (logic), C |
| interval code of `theta_verify.cpp` | compiled and replayed; not audited line by line | C only |
| theorem for u ≤ 0.001123 | re-derived from the pieces above (σ² ≤ v₀ < 1/300, `‖c‖² ≤ (84/25)u²`, `840/53`, the tail) | P + C |

## 3. Correction to my first review

`REVIEW.md` said that the true supremum of `m_h` is about 244 and gave a table of the bound (5). The 244 was an
artefact of a cubic spline through a grid whose spacing jumps at v = 0.5. The true supremum of `m_h = A² + 3B²` is
**1.35** (at v = 0.064), and the first bound (5) on the Wick monomial is (`check_tilt_report_2_part2.log`):

| u | old bound (3/4)δ·E m_h | new bound (2/25)δ | old/new |
|---|---|---|---|
| 0.0005 | 1.99·10⁻⁷ | 8.40·10⁻⁷ | 0.2 |
| 0.005 | 1.20·10⁻⁴ | 8.40·10⁻⁵ | 1.4 |
| 0.02 | 5.30·10⁻³ | 1.34·10⁻³ | 3.9 |
| 0.0463 | 4.89·10⁻² | 7.20·10⁻³ | 6.8 |

So my statement "misses by a factor 5 to 50" overstated the loss of the first bound by up to a factor 4.7.

## 4. Localisation is not reachable this way, and not needed

**Not reachable.** The proved inequalities are, with σ = ‖r‖,

    gain ≤ 2‖c‖σ − (P − 3/4)σ² + tail(σ),   tail(σ) = 4M(R + σ²/(2R))e^{−R²/σ²},   R = 3/10,
    gain ≤ (1273/1250)u − (859/2500)σ².

At u = 0.0463 the second is positive up to σ = 0.370, and the first is positive on the whole range
0.085 ≤ σ ≤ 0.370 even with the true content (‖c‖ ≈ 0.012: at σ = 0.085 it gives +4.6·10⁻⁴), because the tail
term is 1.2·10⁻⁴ at σ = 0.1 and 1.1·10⁻² at σ = 0.14. A larger radius does not help: the Hessian supremum
exceeds P from about |ρ| = 0.4 and is unbounded past the fold of z ↦ z(a+b|z|²) + (|z|²−d)ρ at |ρ| ≈ 0.49.

**Not needed (N).** What the sector inequality uses is not the Hessian along the sector but the remainder of the
expansion at r = 0:

    Rem(w, ρ) = 2[ f(w, ρ) − f(w, 0) − ⟨∇_ρ f(w, 0), ρ⟩ ],     f(w, ρ) = E_Z|L + w + (T − d)ρ|,
    gain(q, r) = 2Re⟨c_s(q), r⟩ + E_y Rem(q(y), r(y)) − P‖r‖².

Rem/|ρ|² is an average of the Hessian along the segment from 0 to ρ, so the spikes at the fold are integrated.
On a grid of all w and ρ (`secant_curvature.py`, `.log`; 141 × 71 values of w in [−7,7] × [0,7], 70 values of ρ up
to 6; a second scan to |w| = 40 and ρ = 12; five values checked against plain two-dimensional quadrature):

| tilt s | P = p − s² | Hessian at the origin | **sup of Rem/|ρ|² over all w, ρ** | P − sup | local cost k(s) |
|---|---|---|---|---|---|
| 0 (K itself) | 1.3221 | 1.0020 | 1.002 (at ρ → 0, w = 0) | 0.320 | 0.320 |
| 0.3434 | 1.2041 | 0.5973 | 0.607 (ρ = 0.9, w = 0.2) | 0.598 | 0.607 |
| 0.5 | 1.0721 | 0.5249 | 0.582 (ρ = 0.95, w = 0.2) | 0.490 | 0.547 |
| **0.6** | **0.9621** | 0.5153 | **0.600** (ρ = 0.6, w = 0.6) | **0.362** | 0.447 |
| 0.7 | 0.8321 | 0.5345 | 0.681 (ρ = 0.56, w = 0.6) | 0.151 | 0.297 |

If `Rem(w, ρ) ≤ Sec·|ρ|²` for all complex w and ρ, with `Sec < P`, then for every remote q and every linear r,
in every dimension, with no hypothesis on ‖r‖, no tail and no maximiser:

    gain(q, r) ≤ 2‖c_s(q)‖σ − (P − Sec)σ² ≤ ‖c_s(q)‖² / (P − Sec).

The statement to certify is an inequality between function values in three real parameters (rotate ρ to the
positive axis, reflect to Im w ≥ 0), with a margin of 0.36 on a quantity of size 0.6; only 0 < ρ ≤ 5 and |w| ≤ 6
matter (beyond, `Rem ≤ 4Mρ` and the analytic exterior bound). The phase of Z is independent of T, so

    f(w, ρ) = E_T[ M(ℓ(T), |w + (T − d)ρ|) ],   M(ℓ, y) = E_θ|ℓe^{iθ} + y| = (2/π)(ℓ + y)E(4ℓy/(ℓ + y)²),

one integral of an explicit function. A bound per value of T does not exist (the ring has a logarithmic
singularity: the secant constant of the circular mean is infinite at |y₀| = ℓ), so the average over T has to be
kept. The same table says that for K itself the local cost 0.320 is a global cost for the A-sector; the record
has 0.24 with a cap on the shell energy (STATUS 6.2.1).

## 5. What is then left: content against deficit, and the constants are at the edge

With section 4 and the two certified content bounds, for s = 3/5:

    gain ≤ B(u, χ) := min{ (2/25)χu², (19321/10⁶)u } / (P − Sec),      χ = E|q|⁴/u² − 2,

and the lemma (*) with κ ≤ 1 holds wherever `B(u, χ) ≤ D(q) + η`. On the family from the Gaussian limit to the
Wick monomial, q = sqrt(u(1−λ))G + sqrt(uλ)·y(|y|²−2)/sqrt 2 (`deficit_vs_bound.py`, `.log`), B/D is:

| u | χ = 0.02 | 0.4 | 1.7 | 5.1 | 10.5 | 23.6 | 42 |
|---|---|---|---|---|---|---|---|
| 0.005 | 0.29 | 0.32 | 0.35 | 0.38 | 0.42 | 0.46 | 0.51 |
| 0.02 | 0.36 | 0.45 | 0.53 | 0.63 | 0.72 | 0.43 | 0.28 |
| 0.0403 | 0.45 | 0.60 | 0.74 | 0.91 | 0.61 | 0.33 | 0.21 |
| 0.0463 | 0.47 | 0.64 | 0.80 | **0.99** | 0.58 | 0.31 | 0.21 |

So on this family the certified chain closes, but with no margin at u ≈ 0.046, χ ≈ 5, where the two content
bounds cross. Other tensors with the same (u, χ) may have a smaller deficit. The true ratio gain/D is at most
0.026 on everything searched, so the loss is in the content bound (a factor 10 to 40). The tilt s = 0.55 is
slightly better for this chain than 0.6 (`tilt_choice.log`: the coefficients are 0.194 and 0.0478 instead of
0.196 and 0.0525). A factor 2 in either content bound in the range 2 ≤ χ ≤ 10, 0.03 ≤ u ≤ 0.0463 would give a
real margin.

The comparison can be made inside the remote certificate: `Λ(q) + B(u, χ) ≤ S + η` is a statement about the
pair (u, χ) and the law of |q|², of the kind the Stein package proves for B = 0 (replayed on 15 November,
`research/conjecture-K/sources/audit-2026-11-15-codex-a7c4/REMOTE.md`). In its central rectangle
(0.035 ≤ u ≤ 0.046, χ ≤ 0.04) the added term is below 1.9·10⁻⁵, so the existing certificate already gives
(*) there with η = 2·10⁻⁵.

## 6. What to ask for next

1. Replace the localisation target by the global secant bound of section 4: prove or certify
   `Rem(w, ρ) ≤ (13/20)|ρ|²` for all w, ρ at s = 3/5 (numerical supremum 0.600; any constant below 0.96 gives a
   theorem, 13/20 keeps most of the cost).
2. Then sharpen the content bound where the two bounds cross, or prove the augmented remote inequality
   `Λ(q) + B(u, χ) ≤ S + η` directly.
3. Recompute both content certificates at s = 0.55 if the chain is assembled.

## 7. Addendum (same evening): the remainder bound is already in the record for K, and it extends to more sectors

- The remainder of section 4 is the `r_x(α, β)` of the note of 13 November
  (`research/conjecture-K/sources/audit-2026-11-13/improvement_joint_tail.md`, STATUS 7.4.5), which asks for it on
  the box |α|, |β| ≤ 0.4 for the A and B sectors of K and pays a Gaussian tail with a reserve of 7.53·10⁻⁵. What is
  new here is numerical: no box is needed. For K, jointly in A and B, the smallest value of p − Rem/|r|² over all
  base values and all amplitudes is 0.300, attained at the origin at infinitesimal amplitude (the smallest
  eigenvalue of the local matrix is 0.298); with the tilt (0.6, 0) it is 0.252
  (`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/kprime-2026-11-15/secant_joint.log`).
- With the two odd sectors z₁Q and z̄₁P added (K, no tilt), a multistart search finds the smallest value 0.128,
  again at the origin, in the pure z₁Q direction: it is the zero-core cost k₁. The one-coordinate cubic
  ν z₁(T−2) cannot be included pointwise, because its cross term with z₁Q is large and vanishes only after
  integration (EQ = 0); at a nonzero core it is a genuine interaction
  (`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/kprime-2026-11-15/secant_all_sectors.py`).
- A cheaper gain for the content bound than a new idea: the factor (3/5)² in (7) of `content_profile_proof.md`
  bounds the Hessian of the resolvent Ψ by that of Φ through the supremum norm. Ψ depends on u through the
  semigroup, which averages D²Φ over a Gaussian of standard deviation up to 0.15 at u = 0.0463, and the peak of
  N_Φ (at R = 0.23) is about that wide. Enclosing `sup_R N_Ψ(R; u)` directly on 0.02 ≤ u ≤ 0.0463 should lower the
  coefficient 2/25 where it matters.
