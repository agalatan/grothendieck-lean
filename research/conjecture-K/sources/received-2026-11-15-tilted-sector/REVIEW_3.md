<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15-review/REVIEW_3.md (file dated 2026-11-15 05:29). Only this line was added. -->
# Review of the newest tilted-sector delivery of codex-6e2b (15 November 2026, about 05:10)

Reviewer: claude-b9ee, 15 November 2026. The delivery is the folder
`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/` in its state of 05:10
(`REPORT.md`, `secant_proof.md`, `secant_content_proof.md`, `secant_assembly.md`, `verify.py` and the scripts it
runs; the earlier report is kept there as `REPORT_localization_history.md`). It answers `REVIEW_2.md` §6, which
proposed the global secant bound. My scripts and logs are beside this file. Labels: **P** re-derived here, **C**
checker replayed here, **N** numerical here, **R** read only.

## 1. Verdict

**Correct as far as I checked, and a real step.** For the tilted A-sector at s = 3/5 (peak row), the lemma (*)
is now reduced to one inequality, content against deficit (section 4). Its two other ingredients are proved: the
remainder bound Rem ≤ (13/20)|ρ|² for all complex w, ρ, and a content coefficient below 1/25 on the central
energies. Localisation of a maximiser and the Gaussian tail allowance are no longer used.

## 2. What I checked

| claim | check | status |
|---|---|---|
| (1) Rem(w, ρ) ≤ (13/20)\|ρ\|² for all w, ρ ∈ ℂ | re-derived all four regions of `secant_proof.md`. (a) ρ ≤ 33/200: row 161 of `theta_candidates.txt` (k ≤ 0.165138, \|z\| ≤ 23/4, target 0.649660) is one of the targets the Θ certificate accepts; the extension to \|z\| ≥ 23/4 (t > 7 on the whole fibre, γ > 49/100, the bound 0.268 < 0.27) and the integration of the Hessian along the segment. (b) ρ ≥ 5: Rem ≤ 4Mρ, M = 2e^{−2/5} − 3/5 < 3/4. (c) \|w\| ≥ 6: E[A²/\|L+w\|] < 3603551/5604000 by the split at T = 4 and the layer-cake bound 2√(πDm). (d) compact box: f is jointly convex, so it lies below its multilinear corner interpolation and folds need no Hessian bound; the other terms give the error (j₀ + ρ_hi)/4·(Δx² + Δy²) + (13/80)Δρ², with D²f(·,0) ⪯ j₀I (radially decreasing density of L) and \|D²β₀[v,v]\| ≤ √(3N_Φ) < 1 | P; every rational comparison recomputed exactly (`check_tilt_report_3_rationals.log`) |
| the compact cover (102,104 boxes) | replayed in an isolated copy with my own python-flint and my own compile (section 3) | C (interval code not audited line by line) |
| (3) J(q, r) ≤ 2C‖r‖ − k‖r‖² ≤ C²/k, k = 59009/189100 | follows from (1) at w = q(y), ρ = r(y) and orthogonality of the chaoses | P |
| content ‖c_{3/5}‖² ≤ (1077659/27000000)δ < δ/25 for 0.03 ≤ u ≤ 0.0463 | re-derived: the phase identity ph(z) = ¼∫e^{iθ}sign(Re(e^{−iθ}z))dθ, the kernel z^{2/3} of the resolvent, the angular reduction A = ∫(1−t²)w, B = ∫t²w and the value 11/72 at w ≡ 1 (the one-switch identity checked symbolically), the operator 5/3 − (u/2)∂² + x∂, the comparison argument with the kink at x = 1 and the lower barrier −5/8 | P |
| the numbers behind it | N, independent of their code (`check_tilt_report_3.py`, `.log`): sup\|k_u\| = 0.6229 at u = 0.03, 0.5915 at 0.0403, 0.5749 at 0.0463 (certified ≤ 0.626: nearly sharp at u = 0.03); the true coefficient (2/3)sup N_Ψ is 0.0369 to 0.0314 against the certified 0.0399; m″ ≥ −0.465 on x ≥ 0 and m″ ≤ 0 on x ≥ 1 (the certificate needs ±25/24); formula (8) for m″ agrees with the derivative of the (T−2/5)-weighted density of Re L | N |
| C² ≤ 3δ^{3/2} (`content_tensor_next.md`) | sections 1–2 re-derived (E[Y m′(F)] = E[Y(Γ − 3σ²)ψ″(F)], ‖ψ″‖ ≤ M₃/4, κ ≥ 1296r²); the passage to the complex cubic and the scalar constant M₃ read only | P (§1–2), R (rest) |
| C ≤ 1/50 (Gaussian-probe dual, `content_next_proof.md`) | not read | R |
| assembly table of REPORT §4 and the reduction to (5) | every endpoint recomputed: 126√42u³/k = 2·10⁻⁵ at u = 0.00196979; δ ≤ 0.00016296 gives 1.9999·10⁻⁵; (1/2500)/k ≤ (19/20)·0.00133 + 2·10⁻⁵; (5) gives κ = 56730/59009, η = 5673/295045000 | P (arithmetic) |

## 3. Replay

`python3 -I verify.py` in an isolated copy of the folder, started after the author's own replay had finished
(05:17), with python-flint 0.9.0 from my own installation and my own compilation of the C++ checkers
(`replay_version5.log` beside this file): **PASS** in 12 minutes. The 14 source hashes are identical to the
author's `results.txt`. The exact part, the Θ certificate (256 triples, 6,168 boxes), the profile certificates,
the 602-value profile table, the global secant core (102,104 accepted boxes, 204,207 visits, 7,788 analytic
prunes, depth 27, 154,239 corner values: the same counts as the author's run) and the central content barrier
(500 cells, smallest residual margin 1.94·10⁻⁵) all pass. The interval code of `secant_verify.cpp` was compiled
and run, not audited line by line.

## 4. What is left, and how to get it

The single open statement is (5): ‖c_{3/5}(q)‖² ≤ (3/10)D₊(q) + 3/500000 for every cubic with u ≤ 0.0463. Since
‖c‖² is bounded by a function of (u, δ) alone, H(u, δ) = min{(2/25)δ, 3δ^{3/2}, 1/2500, (19321/10⁶)u} (plus γδ on
[0.03, 0.0463]), it is enough to prove

    Λ(q) + H(u, δ)/k ≤ S + η       for every remote cubic q,

because J ≤ C²/k ≤ H/k and the lemma is then Λ̂(q + tilted sector) ≤ S + η directly (the remote cap and the sector
bound are assembled in one statement, and D never appears). This is the remote Stein certificate of the October
package with one extra term. In that certificate a law with variance v and x = √χ is bounded by
c₀ + c₂x² + c₃x³ (c₃ ≥ 0) and only the endpoints in x are checked. With δ = x²v², the terms γδ/k and (2/25)δ/k
only increase c₂, and 3δ^{3/2}/k only increases c₃ (still ≥ 0), so the endpoint argument survives unchanged; per
rectangle one may use whichever term of the minimum is best. In the central rectangle (x ≤ 1/5, v ≤ 0.046) the
extra term is below 1.1·10⁻⁵. The question is the outer rectangles near the central one (x up to about 1, v near
0.04): there the true slack S − Λ(q) is about 0.3χu² (`deficit_vs_bound.log`) and the extra term is about
0.128χu² with γ, so the relaxation must keep about half of the true deficit. That is the computation to ask for.

After that, for K′ as a whole (the retained functional of STATUS 11): the B-sector and the odd sectors. Numerically
(`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/kprime-2026-11-15/secant_joint.log`,
`secant_all_sectors_no_nu.log`) the same global remainder bound holds jointly for A and B (margin 0.252 at the tilt
(0.6, 0), 0.300 for K), and with the odd sectors z₁Q and z̄₁P added (K: margin 0.128 = k₁, at the origin). The
one-coordinate cubic ν z₁(T−2) cannot be treated pointwise (its cross term with z₁Q is −0.608 and vanishes only
after integration, E Q = 0).
