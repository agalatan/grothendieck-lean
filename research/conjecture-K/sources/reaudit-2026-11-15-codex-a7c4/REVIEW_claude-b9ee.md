<!-- Review note, authored at this repository path on 2026-11-15. Agent-ID: claude-b9ee. -->
# Review of the second audit of 15 November (PR #399)

Reviewer: claude-b9ee, 15 November 2026, at the user's request. Refs #398.
Reviewed commit: `fc85514af84cf5f7e0e12abff717c24150f01e36`, the audit as codex-a7c4 pushed it. The verdict was
recorded on that commit with `scripts/review.sh` and posted on the PR. The changes of section 5 were then made by
the reviewer in the same branch; they are the reviewer's own and are not covered by the verdict.

Labels as in `STATUS.md` §0: **P** re-derived by the reviewer, **C** checker replayed by the reviewer, **N**
numerical, **R** read only.

## 1. Verdict

**Approve. No blocking finding, and no error found.** Every finding of AUDIT §1 that I re-derived is right, and
three of them correct text that I or my worker wrote (the response energy without its threshold in the README,
the `steinCut_of_inputs` route and the two options for the mesh in the first audit's REMOTE §3a, the anchor count
of REMOTE §4). The corrections are accepted.

## 2. Replayed (C)

Isolated `python3 -I`, Python 3.12; python-flint 0.9.0 from an installation other than the author's.

| checker | result |
|---|---|
| `foundations_exact.py` | PASS |
| `content_constants.py` | PASS |
| `sectors_exact.py` | PASS |
| `remote_disjoint_cost.py` | PASS in 8 s: 12 profile intervals, 278 scale intervals, maximum `2188027284403/2^40 < 199/100` |
| `remote_benchmark_crosscheck.py` | PASS in 14 s |

No committed result file changes when the checkers are run.

## 3. Re-derived (P)

- FOUNDATIONS §2. The response inequality `2t + 2ε⁻¹Re⟨U,F⟩ ≤ E|Z+U| + E|Z−U|`; the six weights
  `(2, 3/2, 3/4, 1, 1, 7/8)` as Gamma integrals; the ellipsoid (2); the Rice step `e ≤ 4ε²B(A−t)`; the total cap
  (3) and its six numbers at the peak. The response `f = −g = ph(X(|X|²−2))` has `t = 0` and
  `‖F‖² = ε²I²/2` with `I = E[sqrt(T)|T−2|]`.
- FOUNDATIONS §3. `−‖Pk‖² ≤ ‖a‖² − 2Re⟨a,k⟩` and the substitution that gives `Λ′ ≤ Λ̂ ≤ Λ`; the bound
  `‖a*‖ ≤ sqrt(π)/2` (the norm part is `2R`-Lipschitz on the first chaos); the subgradient `2(a − Pk_a)` and the
  two consequences of strong convexity.
- FOUNDATIONS §4. The row value at `t = 21/25` and `851/1000`, the allowance, and the sign at `5000/7011`.
- SECTORS §§2 to 4. `|L ± iτZV| = sqrt(T)·sqrt((a+bT)² + τ²V²)`, the limits `k₁`, `k₃`, the inequality
  `sqrt(1+x) ≥ 1 + x/2 − x²/8`, `E(|Y|²−1)⁴ = 9`, `E[sqrt(T)(T−2)⁴] = (193/32)sqrt(π)`, and both final rational
  numbers (`7.356·10⁻⁶` and `5.03·10⁻⁷`).
- SECTORS §6. Both scope tests: `Λ(cZ(T−2)) = Λ(0) − 2pc²` for small c, and the cusp
  `|τ|E[sqrt(T)|T−2|] − 2pτ²` at the even base `L·sign(Re Z)`.
- SECTORS §7. The positive-part assembly, with the two hypotheses the audit adds to my variant in STATUS 11.23
  (`κ > 0` for the division, `η_R ≥ 0` for the uniform conclusion). They are needed.
- CONTENT §2. Both cancellations, the two Taylor steps, `E|ℓ||h|² ≤ 2e`, the bound `C(p) < 123/1000`, and the
  final budget `91789/62500 < 3/2`.
- REMOTE §2, the bridge only: the heat equation `∂_s M_s = K_s/4`, the two signs, and the energy identity. The
  bound on the potential was replayed, not re-derived.
- REMOTE §4. The five uniform estimates and the bound on `E|G_n − G|`; with `EG_n ≥ 0` this gives every cut with
  rational knots from the Lean family. So the 45 duals can be kept: my REMOTE §3a had named only two options.
- REMOTE §5. Convexity of `Λ_θ(q)` in `θ = (a, b)`, the supporting plane of the convex minorant `J ≤ S`, and
  concavity of the lower support built from the gradient enclosures.

## 4. Tested numerically (N), and not checked

`../../code/reaudit-2026-11-15-codex-a7c4/review_claude-b9ee_spot_checks.py` (with its `.log`) recomputes by plain
quadrature, with no code of the audit: `k₁` at the corner and the gain `7.53·10⁻⁶` of the cubic there; `k₃` at the
flank and the violation `6.45·10⁻⁷`; the sharp one-coordinate cost; the tangent constants A and B and the six
response caps; the allowance of the central consumer; `M₀`, `M₁`, `φ′(0)`; the disjoint cost at three bases and
four variances (largest bracket found 0.975, the theorem allows 1.1767); the benchmark and its gradient. All agree
with the audit. The true energy of the response at `t = 0` is 0.273; the audit's 0.0939738 is a lower bound.

Not checked: the special-function estimates behind the potential bound of REMOTE §2 (the three bounds on
`rK_w(r)`), the complete monotonicity inherited by CONTENT §3, the Arb code of `remote_benchmark_crosscheck.py`
beyond reading it, and the literature point of FOUNDATIONS §5.

## 5. Changes made by the reviewer in this branch

1. `STATUS.md`: rows 3.12 (dense-test extension), 3.13 (convex-cell transfer) and 3.14 (direct benchmark and
   support plane). AUDIT §2 lists them as completed results, but the ledger had no row for them.
2. `sources/audit-2026-11-15-codex-a7c4/REMOTE.md`, in the two passages written by this reviewer on #397 (§3a and
   "How far the transfer reaches"): dated notes that record the audit's corrections where the text stands.
3. This file, the spot-check script with its log, AUDIT §4a, and the README index and INVENTORY entries for them.

## 6. For the next update of this folder

- Issue #396 (the tilted-sector reports and the three-variable search) adds rows after 11.24 and items after
  13.8/72 and 14/37.
- A result that belongs there and bears on AUDIT §5 item 3: numerically, the remainder of the tilted A-sector at
  `r = 0` has a global quadratic bound below the cost (`Rem(w,ρ) ≤ 0.60|ρ|²` at `s = 3/5`, against `P = 0.962`;
  for K itself the supremum is the Hessian at the origin, 1.002). If certified, the Gaussian amplitude tails and
  the localisation of the maximiser are not needed. **N**, not in this PR.
