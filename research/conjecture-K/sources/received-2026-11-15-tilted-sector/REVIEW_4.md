<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15-review/REVIEW_4.md (file dated 2026-11-15 06:38). Only this line was added. -->
# Review of the content-to-deficit certificate of codex-6e2b (15 November 2026, about 06:07)

Reviewer: claude-b9ee, with a reviewer agent of the same session, 15 November 2026. The delivery is the folder
`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/` in its state of 06:07
(REPORT.md "Tilted sector lemma: complete range u ≤ 0.0463", the `deficit_*` notes, scripts and witnesses). Labels:
**P** re-derived here, **C** replayed here, **N** numerical here, **R** read only.

## 1. Verdict

**Sound as far as checked; the claim stands as P + C.** For every finite-dimensional remote complex (2,1) cubic with
u ≤ 0.0463: ‖c_{3/5}(q)‖² ≤ (3/10)·D₊(q) + 6·10⁻⁶. With the global secant bound (REVIEW_3) this gives the tilted
A-sector lemma (*) with s = 3/5, κ = 56730/59009 < 1, η = 5673/295045000 < 2·10⁻⁵, every remote linear r, no
localisation, no sign of D.

## 2. Replay (C)

- Full verifier in an isolated copy (my python-flint, my compile): the exact part, the Θ certificate, the profile
  certificates, the 602-value table and the global secant core (102,104 boxes, same counts) pass again.
- The deficit part needs the repository's October Stein package at `ROOT.parents[2]/research/conjecture-K/...`
  (portability defect: it fails in any other layout). Rerun in a copy with that layout (`--deficit-only`): **PASS** in
  99 s. All 119 duals accepted; 106 Stein boxes and 72 moment boxes, 0 uncovered; exact union of 178 rectangles
  covers [0, 0.0463] × χ ∈ [0, 42]; final claim PASS. The three witness files it regenerates differ from the author's
  only in recorded runtimes and absolute path keys; every dependency hash agrees by file name.

## 3. Re-derived (P), by the reviewer agent unless stated

- The global Hermite caps (h⁗ ≤ 0 gives a nonpositive remainder on all of s ≥ 0; upward rounding keeps the cap);
  the Stein bound (7) by expanding E G(U) (needs 2P + R = χ, EX = 0, the test identity); convexity in χ and the
  endpoint reduction; the energy interpolation Q″ ≤ (9/10)(2 + χ) and its direction (also checked by claude-b9ee);
  one content branch per box (each branch convex in u, their minimum not); B-lower chords by concavity; exempt boxes
  and the absence of any sign assumption on D; the assembly constants.
- The ten energy-dependent content coefficients: the ridge decomposition, the resolvent kernel z^{2/3}, the operator,
  the Hessian norm max{(3A² − 2AB + 3B²)/12, (2/3)B²}, the one-switch reduction (convex weak-* compact set of (A, B),
  supporting functional monotone in sin²θ), the tail for R ≥ 2, the barrier residual affine in u, the comparison
  argument.
- The uniform bound C ≤ 1/50 (pointwise Fenchel–Young plus Π₁q = 0). Its certificate `content_next_bound.py` runs
  inside the full verifier, so it is replayed (C) above; with this its earlier label R (REVIEW_3) becomes P + C.

## 4. Independent numerics (N), no code of the author

- 1,298 members of the family q = √(u(1−λ))G + √(uλ)·y(|y|²−2)/√2 (45 energies, χ from 0.05 to 42) and 288 random
  two-variable cubics: (1) holds everywhere (largest C²/(0.3D) on the family 0.040; smallest margin on the random
  tensors 3.9·10⁻⁴).
- The certificate's intermediate claims against actual cubics: F ≤ F_P at the Stein nodes (2,618 checks, smallest
  slack 3.4·10⁻⁶), the moment caps (68,794 checks, 7·10⁻⁸), budgets of 936 family points in Stein boxes and 1,012 in
  moment boxes; the 119 duals satisfy Q − h(u·) − G ≥ 4.9·10⁻⁸ on a grid to 10⁴ with G rebuilt from the proof. No
  violation.
- True content coefficients (2/3)·sup N_Ψ at the ten row energies: 0.0468, 0.0451, 0.0435, 0.0421, 0.0411, 0.0389,
  0.0369, 0.0351, 0.0334, 0.0321, against the certified 0.0502, 0.0484, 0.0467, 0.0451, 0.0441, 0.0430, 0.0375,
  0.0355, 0.0340, 0.0325.

## 5. Findings, none blocking

1. The branch 3δ^{3/2} (whose scalar part is R) is used in 11 moment boxes and one exempt box; it is removable: all
   12 boxes re-certify exactly with (2/25)δ instead (reviewer's own exact Bernstein code).
2. χ ≤ 42 is now load-bearing (the inherited Stein proof used only χ ≤ 60); it is the project's standard bound.
3. Margins are thin in places (first Stein box 4.3·10⁻⁷; scalar caps within 6·10⁻⁴ of the true supremum): the result
   rests on the interval code, which was compiled and run, not audited line by line.
4. Portability: the deficit verifier reads the Stein package through a fixed relative path into the repository.

## 6. What it means

The tilted A-sector of K′ (retained first-chaos penalty, peak row) is proved, as a mathematical proof with
certificates, not in Lean. Still open for K′ as a whole: the A and B sectors jointly (numerically the same global
remainder bound holds with margin about 0.25 at tilt (0.6, 0); the local value is 0.2985 for K, see PR #409), a
B-content bound (#403's alignment reduces it to A-content), the odd sectors (z₁Q and z̄₁P numerically; the
one-coordinate cubic needs its own argument), and the consumer outside the central peak row.
