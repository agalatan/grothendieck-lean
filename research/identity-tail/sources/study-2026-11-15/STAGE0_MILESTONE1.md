<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/caps-stage0-2026-11-15/REPORT.md (15 November 2026); a research worker of claude-b9ee. Only this line was added. -->
# Caps stage 0, milestone 1: the decisive unknown, measured (15 November 2026)

Worker of claude-b9ee, 05:58-08:16 Bucharest. Folder `/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/caps-stage0-2026-11-15/` (scripts at the top level, `scalar/` the scalar-lemma experiments, `results/` logs and JSON, `results/droplet/` the droplet run folder, `results/summary_milestone1.json` the numbers, `results/NOTES_results.txt` caveats per file). Nothing in the repository changed; no Lean built; nothing pushed or posted. FLOAT unless marked [outward] (midpoint-radius integration with the rigorous moment tables of cert-0745d, exact Loewner bound, exact LDL, exact quadratic). Saved by claude-b9ee from the worker's final message (workers cannot write report files).

## 1. Verdict

**GO for stage 0, gated by one new scalar lemma, to be proved first.**

- The report's bound ALONE (dual majorant of Psi_nu, no correction) does not give usable caps: the anchored majorant is not concave from u = 0.1 on (block 0) and from u = 0.3 in the odd blocks; restoring concavity by price scaling costs 1.0e-4 (u = 0.2) to 2.7e-2 (u = 0.4).
- A rank-one correction of AF eq. (4) type exists for nu > 0 (section 3.2), with a closed-form coefficient that reduces to AF's 8/D at nu = 0 and is numerically sharp. With it the anchored caps of Psi_nu are as tight as today's caps of |A|+|B| (3.3-3.7e-6 [outward]), the non-concave region is the odd-block pattern that route M handles today, with the same curvature-to-deficit ratios, and a route-M centre piece at u = 0.35 costs +3.78e-6 [outward, 1024 angular cells].
- Model effect of the cap table on the binding row: 4.8e-6 in B (today's witness, same model: 5.2e-6; master measured 5.25e-6). The study's estimator stands: **certifiable B ~ 0.7131983-0.7132058 (K ~ 1.40212-1.40213), margin 6.1-6.9e-5 to 500/701, 4.1-4.9e-5 beyond the go threshold 500/701 - 2e-5 = 0.7132468.**
- Gate: the correction lemma is numerical (sharp, no violation in ~30 million pointwise checks); its proof is the first task of stage 0b. If it cannot be proved, NO-GO (no other cheap fix was found).

## 2. (epsilon, nu) and the rows

Gaussian-optimal rows (run_rows.py) and the SOCP law relaxation (lawsocp.py) at the binding t:

| eps | nu | relaxed, t = 0.84 | 0.845 | 0.85 | relaxed max |
|---|---|---|---|---|---|
| **0.764** | **0.0235** | 0.7131955 | 0.7131979 | 0.7131896 | **0.7131983 (t ~ 0.844)** |
| 0.762 | 0.0235 | 0.7131740 | 0.7131999 | 0.7132149 | >= 0.7132149 |
| 0.766 | 0.0235 | 0.7132151 | 0.7131959 | 0.7131648 | >= 0.7132151 |
| 0.764 | 0.018 | 0.7132328 | 0.7131970 | 0.7131423 | >= 0.7132328 |
| 0.764 | 0.030 | 0.7131941 | 0.7132651 | 0.7133391 | >= 0.7133391 |

Lower eps or higher nu lift the t >= 0.85 side, higher eps or lower nu the t <= 0.84 side; only (0.764, 0.0235) is balanced and every neighbour is >= 1.7e-5 worse (the four corners were not run). **Choice: eps = 191/250, nu = 47/2000** (eps_hat = 25/31, nu_hat = 47/1953).

Whole range for the choice (relaxed value; G = Gaussian value only):

| t | 0.12 | 0.23 | 0.3 | 0.4 | 0.5 | 0.6 | 0.7 | 0.74 | 0.78 | 0.80 | 0.82 | 0.83 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| N | .68459 G | .68332 G | .68246 G | .68260 G | .68626 G | .69424 G | .70411 G | .70821 | .71130 | .71233 | .71296 | .71312 |

| t | 0.835 | 0.84 | 0.845 | 0.85 | 0.855 | 0.86 | 0.87 | 0.88 | 0.89 | 0.90 |
|---|---|---|---|---|---|---|---|---|---|---|
| N | .71317 | .71320 | .71320 | .71319 | .71318 | .71318 | .71317 | .71317 | .70494 | .68335 |

Relaxed maximum over the whole range **0.7131983 at t ~ 0.844**. The plateau t = 0.835-0.88 (8 rows) lies within 3.1e-5 of it (today: 4 binding rows), so all of it needs tight caps; t <= 0.83 is >= 8e-5 lower, t >= 0.89 and t <= 0.74 are far lower. Law losses grow with tau*: 4.1e-5 (t 0.88), 5.5e-5 (0.845), 9.8e-5 (0.83), 2.8e-4 (0.78), 3.2e-4 (0.74).

## 3. Cap tightness of Psi_nu (row t = 0.845, tau* = 0.265; u = tau sqrt U is the fibre argument)

### 3.1 The report's bound alone

Anchored caps with tangent dual prices (capnu.py, quadrant blocks as AF section 3): D = Q - H has a negative block-0 eigenvalue at u = 0.1-0.2 (-0.015), odd blocks from u = 0.3 (-0.10 .. -0.45). The dual majorant over-charges the radial curvature by 1/(l + 2 nu), twice AF's corrected 1/(2l). Price scaling to restore concavity: +6.6e-4 (u 0.1), +1.0e-4 (0.2), +4.6e-3 (0.3), +2.7e-2 (0.4).

### 3.2 The correction (new)

For prices d2, d3 > nu (e_i = d_i - nu, Delta = d2 d3 - nu^2) the KKT relations A = d2 f - nu g, B = d3 g - nu f, A + B = 2L give, on the whole tangent set of d, `4 Re(p conj L) = c0 + c1 |L|^2` with `c1 = -4 nu (d2 - d3)/(e2 e3)`, `c0 = d2^2 - d3^2 + nu (d2 - d3)(e2^2 + e3^2)/(e2 e3)`. The majorant `Phi_d(p) - (g/16) (4 Re(p conj L) - c0 - c1 |L|^2)^2` is still quadratic in p (|L|^2 is a polynomial in z; radial degrees <= 12, harmonics <= 4: today's tables suffice), and equals AF eq. (4) at nu = 0.

- Closed-form coefficient (capnu.gamma_closed): on the radial line in the far regime |p| >= nu + sqrt(nu^2 + l^2), where Psi_nu = 2|p| - nu, the discriminant condition is LINEAR in g (the g^2 terms cancel): `g <= (4 cP k0 - b0^2) / (l c b0 + cP c^2/4 + 4 l^2 k0)`, `cP = (d2+d3-2nu)/(2 Delta)`, `k0 = (d2+d3)/2 + nu + (d2+d3+2nu) l^2/(2 Delta)`, `b0 = (d3-d2) l/Delta -+ 2`, `c = c0 + c1 l^2`, minimum over l in {l_lo, l_hi} and both signs (boundary formula if the vertex leaves the regime; g < cP/l^2).
- Evidence: equals AF's 8/D at nu = 0 (20,000 random prices, ratio 1 to 1e-6); equals the numerically sharp radial value (median 0.9997, never above); 0 violations in 4.1 million pointwise checks on 1,383 random tangent cells (complex p near / far / radial, l across a cell) with the factor 1.00, while 1.05 fails in every case, always on the radial line, so the formula is sharp; anchors with |p0| up to 4 l (6.4 million at 0.95, 4.3 million at 1.00) and 4x wider cells (4.2 million at 1.00) pass too, as do nu_hat = 0.01 and 0.06 (~30 million checks in all, no violation); on the cells of the row 0 violations in 2.0 million checks (1.2 million with no restriction besides min(e2,e3) > 0.2 max(e2,e3); the centre degenerates as e -> 0, ~1 % of the cells get no correction). Logs: results/lemmacheck.log, results/cellcheck_closed*.log.
- Lemma to prove (stage 0b, first): for such prices and every p in C, l in [l_lo, l_hi], the corrected majorant bounds Psi_nu(L+p, L-p). Proof route: as in AF, the binding set is the boundary |a - b| = 2l of the feasible (|A|, |B|) region (the radial line), where Psi_nu is explicit (three regimes); far regime by the discriminant; inner/mid regimes and the l-endpoints to be shown.

(The profile below was computed with a sampled radial coefficient and extra restrictions, l_lo >= nu, rms|p0| <= l_lo: slightly conservative. With the closed form and no restriction: u = 0.1, 0.2: 3.59e-6, 3.43e-6; centre estimates u = 0.3, 0.4, 0.5: 3.82e-6, 5.16e-6, 7.85e-6; same concavity pattern; results/cg_T7640_845_nunumFull_nq128.json.)

### 3.3 Anchored caps with the correction

Profile (capgap.py, 128 angular cells per quarter, 1600 rings; Psi from capmodel/Ultra):

- u = 0 .. 0.25 (62 % of the Gaussian law): all four blocks positive definite, **cap - Psi = 3.51-3.75e-6**.
- u = 0.275 .. 0.7 (34 %; today's corresponding share: 9 %): block 3 indefinite from 0.275, block 2 from 0.4, block 1 from 0.625 (deficits -0.01 .. -0.51); route-M centre-piece estimate (same prices, lam = |eig| + 1e-3 per bad direction, rho0 = 0.003): 3.7e-6 (0.275), 4.6e-6 (0.35), 5.5e-6 (0.4), 8.3e-6 (0.5), 1.11e-5 (0.6), 1.47e-5 (0.7); the lam rho0^2 part dominates at large u (halving rho0 removes 3/4 of it).
- u >= 0.725: block 0 indefinite too (law mass 6e-4).

[outward] capnu_cert.py (256 cells/quarter, rigorous moment tables, exact LDL; min pivots 0.011-0.095, Loewner radii 2e-12): u = 0 with NO correction, **fully certified: cap - Psi = +3.692e-6**; u = 1/10, 1/5 with the correction: +3.570e-6, +3.280e-6 (modulo the lemma). Today's witness, Lean row 13, s = 1/10 (Young, certified): +3.178e-6.

Today (Lean row 13, AF correction, same code and grid): concave up to s = 0.175 with 3.19-3.65e-6; route-M centre estimates 3.5-8.5e-6 on s = 0.2-0.375; block 0 indefinite on 0.4-0.55. Same picture and level.

### 3.4 Route M (localisation)

- Deficit vs TRUE odd curvature kappa (sup over v.m = tau of J = Psi - kappa tau^2, re-optimised): tail row, block 3: u 0.3: kappa 0.17 (deficit -0.04), 0.4: 0.24 (-0.16), 0.5: 0.28 (-0.28), 0.7: 0.28 (-0.49); block 2: 0.62 (-0.01), 0.56 (-0.16), 0.52 (-0.30), 0.43 (-0.43). Today (row 13), block 3: 0.26 (-0.03), 0.34 (-0.20), 0.35 (-0.28), 0.33 (-0.35) at s = 0.2, 0.3, 0.35, 0.4; block 2: 0.65 (-0.03) .. 0.54 (-0.21). Doubling slabs need kappa > |deficit|/3: satisfied throughout.
- Prototype node u = 0.35 (midnu.py, one direction, full circle, [outward] with exact S-lemma quadratics, Lemma 1 of cert-0745d MIDCAPS.md): centre piece **+3.78e-6 with 1024 angular cells** (+7.07e-6 with 256: the angular resolution matters at mid u). At 256 cells the first slab with a re-optimised anchor is +4.94e-6 (scalar/slabprobe.py), below the centre at that resolution (+7.07e-6); slabs from 0.012 outward and the halfspace are far below (-1.3e-5 .. -1.7e-2). So the node closes at its centre value. The 1024-cell run was stopped after 28 CPU-minutes inside its first slab (the noise-robust maximiser is slow).
- Pitfall found: for nu > 0 the 12-dimensional L-BFGS-B constrained maximiser stalls on the slightly noisy J (spin2), so the first slab anchors were not constrained maximisers and their bounds came out +8.4e-6 / +1.5e-5 (+4.2e-5 in the first run); with a reduced-space maximiser (block 0 + v's own block, by the symmetries; oddcurv.PsiNu.conmax2) the first slab is +4.94e-6 at 256 cells, below the centre.

### 3.5 Effect on B

Row-value model (roweffect.py): table = chord interpolant of node caps; node gap = anchored gap where concave, route-M centre estimate elsewhere; chord error Psi'' h^2/12 with Psi'' from second differences; Gaussian law at tau*.

- tail row t = 0.845: E_gap 4.17e-6 + E_chord 0.75e-6 (node spacing h = 0.0025 in u) -> **4.8e-6 in B** (7.0e-6 with h = 0.005).
- today, Lean row 13: 3.36e-6 + 1.85e-6 -> 5.2e-6; the certified table on master gives 5.25e-6 (calib.log). Calibrated.

## 4. Rest of stage 0: effort and compute

- 0b first: correction lemma (closed form done) with proof and an exact checker: 3-5 days (gate). Then the exact anchored-cap generator for Psi_nu (capnu_cert.py to integers, LDL records, bundles): 2 days; route M for nu > 0 (adapt midcaps/midcaps2/replay_midcaps_exact: asymmetric anchors, reduced-space maximiser, 1-3 odd directions, boxes for u >= 0.4): 4-6 days.
- 0a robust (law-aware) rows for the 19 t plus the plateau, mixtures: 3-4 days. 0c law nodes and refined cover (PR #381 format): 3-4 days. 0d integer verifier: 2 days. Total about 3-4 weeks of one agent.
- Compute: rows ~50 CPU-h; anchored caps 19 rows x ~150 nodes ~ 50-80 CPU-h; route M on 8 plateau rows x ~180 nodes (u 0.275-0.72 at 0.0025) x 9-42 pieces = 20-40k pieces at ~15 CPU-s exact each (cert-0745d: 8,991 pieces ~ 37 CPU-h) plus float proposals: 150-350 CPU-h (3-6 days on yo's free half, under a day on a 48-core droplet); law/cover 20-50 CPU-h.
- Stage-2 consequence: about 3-4x today's CapPieces (8 rows, wider u range), so the one heavy Lean build grows from ~100-120 to roughly 300-400 CPU-hours.

## 5. Not done / caveats

Rows are Gaussian-optimal and master's coupled / joint-sixth budgets are not modelled (both only lower the cap); caps measured on one row (t = 0.845); route M prototyped at one node in one direction (two/three-direction boxes needed from u = 0.4, block 1 from 0.625); the correction lemma is numerical only.

## 6. Files and cleanup

Scripts: capnu.py (anchored caps of Psi_nu; correction; closed-form g), capnu_cert.py (outward-rounded caps), capgap.py (gap profile), oddcurv.py (deficits vs true curvature; PsiNu, conmax2), midnu.py (route-M prototype), roweffect.py (row effect); scalar/ (corrtest*, bindtest, closedform, lemmacheck, cellcheck*, excess, eeff, slabprobe, vdebug*, conmaxtest); launch.sh, queue.sh, cfg_job.sh; and the study's capmodel.py, run_rows.py, lawsocp.py, lawcap.py, stein_oct.py, calib.py. Results: results/ (cg_*.json profiles, certcap_v2.log, cellcheck_*.log, lemmacheck.log, oddcurv_*, midnu_*, summary_milestone1.json, NOTES_results.txt) and results/droplet/ (out_*.jsonl rows, lawsocp_results.jsonl, oddcurv2_*.json, every job log).

Cleanup: all droplet jobs stopped (process groups checked empty), results copied to results/droplet/, ~/claude-b9ee-capsstage0 on yo (466 MB with its venv) deleted at 08:15 Bucharest (disk 24 GB free); ~/claude-b9ee-ksector left as it was; no local processes left. The local folder keeps two __pycache__ directories (their deletion was refused by the permission system).
