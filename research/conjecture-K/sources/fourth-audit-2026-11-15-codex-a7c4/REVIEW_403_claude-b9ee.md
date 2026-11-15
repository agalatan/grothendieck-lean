<!-- Verbatim PR #403 review comment, 15 November 2026; archived by codex-a7c4 for issue #406. -->
Source: https://github.com/agalatan/grothendieck-lean/pull/403#issuecomment-6888765068
Reviewed commit: `8bd28e91d9ce8298e65b52f343aac3a2a64177a3`.

[claude-b9ee] Independent review of `8bd28e91d9ce8298e65b52f343aac3a2a64177a3`, requested by the user.

**Verdict: approve.** No blocking finding. The kernel alignment 7.1.4 (open since the November audits) is certified at the peak row.

**Alignment** (ALIGNMENT.md, `kernel_alignment.py`)

| item | result |
|---|---|
| definitions | all four angular coefficients re-derived from the binomial expansion of the phase. The minus sign and the 1/√2 of g_B match the B shell z₁²·conj(r)/√2 of STATUS 7.1.1; g_B(0)/g(0) = +0.50534 |
| interpolation | a cell's bound is its largest endpoint value plus M(h−l)²/8, with \|R″\| ≤ ρA″ + B″. On a cell starting at l > 0 the curvature bound is the smaller of ρA″(0) + B″(0) and 4e⁻²(ρA(0) + B(0))/l²; both are valid because A and B are Laplace transforms. Finite differences give A″(0) ≈ 11.692062 and B″(0) ≈ 5.367695, as claimed |
| coverage | the 79 cells are the leaves of a bisection of [0, 16], sorted and adjacent |
| tail | A and B are nonnegative and decreasing, so for v ≥ 16, R(v) lies in [−ρA(16), B(16)] = [−0.00295, 0.00326] |
| L² step | ‖Π(q·h(\|q\|²))‖ ≤ sup\|h\|·‖q‖ for every remote q |
| margins | worst certified cell [15/32, 61/128]: bound 0.0069993610, margin 6.4·10⁻⁷ |
| independent numerics | none of the PR's code used. Closed forms checked against angular quadrature: max \|g_B − 0.5053g\| = 0.006986331 at v ≈ 0.496 over 2,889 values of v in [10⁻⁶, 4000] (true margin 1.37·10⁻⁵); the value at v = 1/2 matches the first audit's enclosure to 2·10⁻¹¹; a second implementation by direct (r, θ) quadrature agrees with the Laplace forms to about 10⁻¹³ |

**Re-derived elsewhere**
- **CONTENT_KERNELS:**
  - recurrence (1), H′ = AJ, the density of L and its scale-mixture form (3);
  - (4), (5), (8), (10)–(13), and (16)–(17) with the three ranges of x;
  - the occupancy argument for finding 2: allowed occupancies (0,0), (1,0), (0,1), (2,0), (1,1) with weights 1/2, 3/4, 3/4, 15/16, 7/8 (times √π), the maximum 15√π/16 attained, and a valid non-cubic example;
  - budget (20), 8429832706429/6250000000000 < 27/20, and the conclusion D(p)/90.
- **POTENTIAL:**
  - the Gaussian-to-Bessel reduction, the ODEs, and the crossing argument for m(1) > 1;
  - Lv = 3(3−x)/(20x³) and W′ = −e^{2x}U·Lv, the endpoint argument, and the far-field subtraction;
  - the cost 3/152;
  - on a grid, max U = 1.17516 < 147/125 and sup x(U−1) = 0.1924 < 1/5.
- **SECTORS:**
  - the majorant 169x² − 391x + 240 (discriminant −9359), and the Z → iZ symmetry giving Λ̂ = Λ on the pure P axis;
  - the bound (R) and its sharpness;
  - the Q-axis residual (9/4)τ⁶/a⁶ and both rational numbers;
  - k̂₃, the P cost and the tilt at all five profiles; a brute-force retained minimisation at the corner converges to 0.39243.

**Replayed** (isolated `python3 -I`, python-flint 0.9.0 from another installation): all six checkers exit 0 and reproduce the committed JSON byte for byte. `kernel_alignment.py` took 139 s and `potential_full_box.py` 18 s; the others are under 1 s. No script writes files.

**Ledger.** Only 17 files are added, all in the two new folders; the 277 existing source files and the monograph body are unchanged. The new rows 2.6a, 2.7a, 5.4b, 5.4c and 6.3.9b, items 73–74 and §14 rows 38–40 are consistent with the notes.

**Comments, none blocking**
1. README.md:125 (L2) and :128 (L5) call the 3/152 cost and the alignment plain **P + C**, while STATUS 4.2 and 7.1.4 say "P by author + C, external review pending". With this review both are P + C, re-derived by claude-b9ee: please make the two places agree.
2. STATUS 6.3.9a says "kernel input derived in A15T". The derivation is the author's own; this review now covers it, so it can say so.
3. Items 73–74 of 13.9 and §14 rows 38–40 take numbers that my pending update #396 also uses. If this PR lands first, #396 will renumber; nothing to do here.
4. ALIGNMENT.md:47–48 writes B(v) = −g_B(v), but :165 uses B(u) for the Gaussian benchmark.
5. README.md:222: "below1.97" is missing a space.
6. For the record: of my "Not checked" list on #399 this PR closes the two analytic items. The Arb code of `remote_benchmark_crosscheck.py` and the literature point of FOUNDATIONS §5 remain unchecked; the PR does not claim them.

**Not checked:** the Arb and python-flint internals; the inherited 220-bit interval library; the exact Bernstein arithmetic; the flank and upper-row constants Mⱼ; the citations for Bernstein's theorem; STATUS rows 3.12–3.14.

