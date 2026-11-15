<!-- Review note, authored at this repository path on 2026-11-15. Agent-ID: claude-b9ee. -->
# Review of the follow-up audit of 15 November (PR #397)

Reviewer: claude-b9ee, 15 November 2026, at the user's request. Refs #395.
Reviewed commit: `f48b5ede007fe0b0372d50fdcc8c409c7c280138`, the audit as codex-a7c4 pushed it. The verdict was
recorded on that commit with `scripts/review.sh` and posted on the PR. Afterwards, also at the user's request, the
reviewer made the changes of section 6 in the same branch. Those changes are the reviewer's own and are not covered
by the verdict.

Labels as in `STATUS.md` §0: **P** re-derived by the reviewer, **C** checker replayed by the reviewer, **N**
numerical, **R** read only.

## 1. Verdict

**Approve. No blocking finding.** The main result stands: at the peak row the remote part of Conjecture K holds
with an allowance of 3.6·10⁻⁷, for every remote cubic, every dimension and every variance. The budget for 1.402 is
about 10⁻⁴, so layer L1 is closed at the peak row for the purpose of 1.402. It is a certificate outside Lean.

## 2. Replayed (C)

Isolated `python3 -I`, Python 3.12, python-flint 0.9.0 from an installation other than the author's.

| check | result |
|---|---|
| `remote_replay.py`, every profile integral recomputed | PASS in 128.5 s: 68 Hermite caps, 45 Stein nodes, 154 outer rectangles, both ends of the variance range, `1.3739535256614 < S < 1.3739535256616`, and `Λ(q) < 1.373953883 < S + 3.6·10⁻⁷` |
| `remote_rational_audit.py` | PASS; the result file is identical to the committed one |
| `claims_exact.py`, `odd_cost_check.py`, `sector_constants.py` | PASS; result files identical |
| `claims_kernels.py` | PASS (finite points only, as it says) |

Not run: `remote_legacy_replay.py` (the weaker package, which no conclusion uses) and `sector_numerics.py` (it
reproduces a table of the reviewer; the two sets of numbers agree to the digits shown).

## 3. Re-derived (P)

For the remote certificate, independently of REMOTE §3:

- The Stein identity `E[U f(U)] = E[(1+X)(f + U f′) + r U f′]`: from `LQ = −3Q` and the product rule,
  `E[U f] = (1/3)E[Γ(Q, Q̄ f(U))]` and `Γ(Q, U) = Q̄ Γ(Q,Q) + Q Γ(Q,Q̄)`.
- `EX = 0`; `2P + R = χ` (take `f(u) = u`); `EX² ≤ 2P/3` and `Er² ≤ 2R/3` from the chaos decompositions
  `X = (2U₂ + U₄)/3`, `c = (2V₂ + V₄)/3` and `|r| ≤ |c|`.
- `E[Φ(U) − φ(U)] = E[Xφ(U) + r d(U)]` (take `f = Φ/u`, so `f + u f′ = φ` and `u f′ = d`).
- The dual identity. Expanding the squares, and using only `EX = 0`, the last identity and `2P + R = χ`,

      E[λ(X − f₀/λ)² + μ(r − g₀/μ)²] + λ(2P/3 − EX²) + μ(2R/3 − Er²) + ν(χ/3 − R)
        = E[f₀²/λ + g₀²/μ] + E[Xφ + r d] − 2t(2P + R) + νχ/3 = E G(U).

  Every term on the left is nonnegative, so `E G(U) ≥ 0`.
- Each two-node cubic Hermite interpolant of `h` is a majorant on the whole half-line: the error is
  `h⁽⁴⁾(ξ)(s−a)²(s−b)²/24` and `h⁽⁴⁾ ≤ 0`, because `h′` is completely monotone (the argument for the density was
  checked).
- The endpoint argument in `x = sqrt(χ)` (a cubic `c₀ + c₂x² + c₃x³` with `c₃ ≥ 0`), the chord correction in `v`
  for a fixed law, and Jensen for `v ≥ 3/20`.
- CLAIMS §2 and §3: both witnesses are right. They restore hypotheses that the consolidated ledger had dropped;
  neither is a cubic.
- ODD_COST §1: `|x+y| + |x−y| ≤ 2|x| + |y|²/|x|` gives the stated costs; `k₁ = p − J₁ = 0.1284` at the peak agrees
  with the reviewer's constants.
- SECTORS §5 (assembly) and §6 (tail): `E|T − 1 + s| = −s + 2e^(s−1)`, `E[|r|; |r| > R] = sqrt(w) Γ(3/2, R²/w)` and
  `Γ(3/2, x) ≤ e^(−x)(sqrt(x) + 1/(2 sqrt(x)))`; the two numbers `1.33·10⁻¹¹` and `3.46·10⁻⁴` recomputed.

## 4. Tested numerically (N)

The covariance order `P ≥ R` was not re-derived; the tensor proof `P − R = 648‖K − Kᵀ‖²` was read. It was tested
instead, with the other structural inputs, on 42 cubics in two variables by deterministic quadrature
(`../../code/audit-2026-11-15-codex-a7c4/review_claude-b9ee_stein_inputs_check.py` and its `.log`): the Wick
monomial (`χ = 42`, `P = 43/3`, `R = 40/3`, so `P − R = 1`), one structured tensor and 40 random ones.
`EX = 0` and `2P + R = χ` hold to quadrature accuracy; the smallest values found are `P − R = 0.69`,
`2P/3 − EX² = 0.60`, `2R/3 − Er² = 0.82`. The sixth-moment bound has its smallest slack at the monomial, where
`EU³ = 11352` against the bound `11395`.

## 5. Not checked

The internals of the Arb integrator `profile.py` and of the Bernstein subdivision in `exact.py` were read, not
tested separately. The hypergeometric formulas of CLAIMS §5 were not re-derived. The weaker October package was not
replayed. The sixth-moment theorem was not re-proved: it is a Lean theorem of this repository (REMOTE §3a).

## 6. Changes made by the reviewer in this branch

Each is marked where it stands.

1. `remote_replay.py` saves its record only with `--write-result`. Before, every replay rewrote
   `remote_replay_all.json` (the elapsed time changes), so the documented command left the checkout modified.
2. REMOTE §3a, "Where these inputs stand in Lean". The sixth-moment bound, the two spectral budgets, the covariance
   order and the Stein identity are theorems of the Lean development of the lower bound (`Moments`, `SteinInputs`,
   `SteinCut.spec`), proved for every circular cubic. Two differences in the test functions are recorded: the
   constant on the final ray (harmless) and the mesh (Lean's knots are squares of rationals, the package's are
   not, so a port has to choose the duals again or generalise one lemma).
3. REMOTE §4, "How far the transfer reaches": with the allowance 10⁻⁴ one anchor covers a diamond of area about
   10⁻⁹ in the plane of shapes, against 0.0072 for the application box, so transfer alone would need about seven
   million anchors. A consumer does not need the box: the row inequality holds for every row, so finitely many
   rows suffice, each with its own remote cap.
4. STATUS 3.3 (second replay, and the Lean status of the inputs) and STATUS 11.23 (the variant with `max(D, 0)`:
   the fixed-tilt gain is nonnegative, so the signed hypothesis `gain ≤ κD + η_A` forces `D ≥ −η_A/κ`; with
   `gain ≤ κ·max(D, 0) + η_A`, the form in which the target was sent to the prover, the conclusion is
   `S + η_R + η_A`).
5. Monograph errata D.1, AUDIT §4a, the two README index tables, and this file with its script and log.

## 7. For the next update of this folder

- Numbering: issue #396 (the tilted-sector reports of codex-6e2b and the three-variable search) also adds rows
  after 11.20. It will take the numbers after 11.24.
- The wording corrections of the audit to 11.15, 11.17 and 11.18 are accepted by the author of those rows. The
  working notes they were copied from are corrected at the source, so the next copy carries them.
