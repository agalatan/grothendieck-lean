<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/caps-upgrade-study-2026-11-15/REPORT.md (15 November 2026); a research worker of claude-b9ee. Only this line was added. -->
# Can a node-cap rebuild certify K_G^C > 1.402? Feasibility study, 15 November 2026

Worker of claude-b9ee. Study folder: `/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/caps-upgrade-study-2026-11-15/`.
Nothing in the repository was changed or committed, no Lean was built, nothing pushed or posted. Every number below is
a **floating-point model value** unless marked [certified]. (Saved by claude-b9ee from the worker's final report; the
worker could not write this file itself.)

## 1. Verdict

**Plausibly yes, but not with a data-only rebuild.**

- **Witness.** The gain needs the identity-tail witness `P10 − ε P21 + ν(Id − P10 − P21)` at (ε, ν) ≈ (0.764, 0.0235),
  with the tail kept in the **pointwise** form, inside the fibre potential.
- **Estimate.** Gaussian-optimal rows plus the October law relaxation, calibrated against master, give a certifiable
  cap of **B ≈ 0.71320–0.71321**, i.e. **K ≈ 1.40212–1.40213**. That is **(6.1–6.8)·10⁻⁵ below 500/701 = 0.7132668**,
  with an estimated uncertainty of ±2.5·10⁻⁵.
- **Largest uncertainty.** How tight the certified caps of the new potential will be.
- **What has to change:**
  - the witness and its reduction chain;
  - the fibre potential (`|A|+|B|` becomes `Ψ_ν(A,B)`);
  - **the cap kernel `GrotheCapsKernel`**, whose anchored-pair majorant is built for `|A|+|B|`;
  - all 19 rows, the caps (10,229-file caps closure), the law nodes and the refined cover.
- **The cheaper rebuilds do not reach 1.402:**
  - **ε alone (ν = 0).** Best gated Gaussian value 0.71326; after the law loss ≥ 0.71335, i.e. K ≤ 1.40185.
  - **Projection form of the tail** (bound `−2ν̂‖k‖² ≤ −2ν̂(‖P10k‖² + ‖P21k‖²)`, no kernel change): 0.7147 (ε 0.76,
    ν 0.01) and 0.7166 (ε 0.764, ν 0.0235). Worse than today.
- **The margin depends on (ε, ν).** Two neighbouring tail configurations end at the threshold or above it after the
  law loss (§2.2).
- **Recommendation.** Proceed only through the go/no-go gate of §5: a complete, pure-integer Python certificate for
  the new witness with B < 500/701 − 2·10⁻⁵, before any Lean change that touches the caps closure.

## 2. Numbers

Common to all: Gaussian law `U ~ Exp(1)`; rows optimised per t by `run_rows.py` (14-parameter gauge-free rows, gated,
cutting planes, accurate quadrature `Ultra`); N in original units, `N = (1−ν)·cap_hat + ν`. Target:
500/701 = 0.7132668. Master [certified]: `refinedB = 713420886479/10¹²` = 0.7134209, K > 1.401697117301.

### 2.1 Gaussian gated rows (min over rows, max over τ), max over the computed t

| witness | ε | ν | max N | at t | t computed | 1/N |
|---|---|---|---|---|---|---|
| cubic (master's witness family) | 0.745 | 0 | 0.7133457 | 0.855 | 0.84–0.865 | 1.401845 |
| cubic | 0.75 | 0 | 0.7132677 | 0.85 | 0.82–0.85 | 1.401998 |
| cubic | 0.752 | 0 | 0.7132598 | 0.845 | 0.84–0.85 | 1.402014 |
| cubic | 0.7564 | 0 | 0.7132773 | 0.84 | 0.82–0.855 | 1.401979 |
| cubic | 0.76 | 0 | 0.7133143 | 0.84 | 0.83–0.84 | 1.401906 |
| tail, pointwise | 0.7624 | 0.012 | 0.7131935 | 0.84 | 0.84–0.86 | 1.402144 |
| **tail, pointwise** | **0.764** | **0.0235** | **0.7131427** | 0.845 | 0.835–0.85 | **1.402244** |
| tail, pointwise | 0.7681 | 0.0235 | 0.7131728 | 0.835 | 0.83–0.86 | 1.402185 |
| tail, pointwise | 0.7695 | 0.035 | ≥ 0.7132766 | 0.845 | 0.84–0.845 | — |
| tail, projection | 0.76 | 0.01 | 0.7146876 | 0.845 | 0.845 | — |
| tail, projection | 0.764 | 0.0235 | 0.7166224 | 0.845 | 0.845 | — |

Per-t values of the best tail configuration (0.764, 0.0235): t = 0.835: 0.7130861 (τ* 0.295); 0.84: 0.7131274 (0.281);
0.845: 0.7131427 (0.265); 0.85: 0.7131378 (0.258, tied with the τ = 0 branch, 0.7131385).

Gate-free model norms (`gatefree.py`): ε 0.745: 0.71329121; 0.75: 0.71318445; 0.7564: 0.71313565; tail (0.7681,
0.0235): 0.713021 (`handoff/research-degree5/tailgames-2026-11-14/README.md`). So the gates cost about 5.5e-5
(ε 0.745), 8.3e-5 (0.75), 1.4e-4 (0.7564), about 1.2e-4 for the tail.

### 2.2 Law relaxation at fixed rows (`lawsocp.py`, new)

The relaxation of 22 October (`attack-20261022/step4_lawsocp.py`): E U = 1, E U² = 2 + x², E U³ ≤ 6 + 9x² + C6 x³,
E√U ≤ ρ; the radial integration-by-parts identity for every piecewise-linear test on the U-grid; both separate
spectral budgets, 2P + Q = x², and the covariance order. Solved as an SOCP (cvxpy/Clarabel, single-threaded) on 261
U-points up to 30; scan over x and τ with local refinement. Master's coupled and joint-sixth budgets are not
modelled, so this relaxation is weaker than master's.

Checks: at x = 0 it reproduces the Gaussian value to 1e-7 in every run. Large x does not bind (tail row t = 0.845,
U up to 90): the maximum over τ is 0.7131979 (x 0.45), 0.7131396 (1), 0.7130212 (2), 0.7127686 (3), 0.7123167 (4),
0.7116042 (5); x = 6.5 and 7.75 are infeasible on the grid.

| row | t | Gaussian | relaxed | law loss | worst (x, τ) |
|---|---|---|---|---|---|
| Lean row 12, certified table | 0.84 | 0.7133556 | 0.7133988 | 4.3e-5 | (0.66, 0.256) |
| Lean row 13, certified table | 0.845 | 0.7133771 | **0.7134257** | 4.9e-5 | (0.66, 0.255) |
| Lean row 14, certified table | 0.85 | 0.7133832 | 0.7134225 | 3.9e-5 | (0.66, 0.249) |
| Lean row 15, certified table | 0.855 | 0.7134026 | 0.7134107 | 8.1e-6 | (0.71, 0.217) |
| cubic 0.745, Gaussian-optimal | 0.85 | 0.7133287 | **0.7134134** | 8.5e-5 | (0.61, 0.264) |
| cubic 0.745, Gaussian-optimal | 0.855 | 0.7133457 | 0.7134016 | 5.6e-5 | (0.66, 0.242) |
| cubic 0.75 | 0.85 | 0.7132675 | 0.7133516 | 8.4e-5 | (0.61, 0.264) |
| cubic 0.752 | 0.845 | 0.7132597 | 0.7133684 | 1.09e-4 | (0.61, 0.28) |
| cubic 0.7564 | 0.84 | 0.7132771 | 0.7134213 | 1.44e-4 | (0.55, 0.296) |
| tail (0.764, 0.0235) | 0.835 | 0.7130864 | 0.7131723 | 8.6e-5 | (0.40, 0.311) |
| tail (0.764, 0.0235) | 0.84 | 0.7131272 | 0.7131955 | 6.8e-5 | (0.45, 0.296) |
| **tail (0.764, 0.0235)** | 0.845 | 0.7131427 | **0.7131979** | 5.5e-5 | (0.45, 0.276) |
| tail (0.764, 0.0235) | 0.85 | 0.7131378 | 0.7131896 | 5.2e-5 | (0.45, 0.263) |
| tail (0.7681, 0.0235) | 0.835 | 0.7131731 | 0.7132602 | 8.7e-5 | (0.40, 0.311) |
| tail (0.7624, 0.012) | 0.84 | 0.7131932 | 0.7132818 | 8.9e-5 | (0.50, 0.296) |

A parabola through t = 0.84, 0.845, 0.85 gives the tail maximum **0.7131983 at t ≈ 0.8436**. The worst laws are
spread, with no atom at 0; for the tail they put less weight near 0 than the Gaussian. At comparable τ* the tail's
law loss is smaller than the cubic's (τ* 0.28: 6.8e-5 against 1.44e-4 at ε 0.7564; τ* 0.265: 5.5e-5 against 1.09e-4
at ε 0.752): the identity tail damps the law sensitivity. The moments-only relaxation had suggested the opposite
(8.1e-4 for the tail against 5.3e-4 at ε 0.745); it overstates the dependence.

**Sensitivity.** The loss grows fast with the τ* of the binding row. (0.7681, 0.0235) binds at t = 0.835 (τ* 0.295)
and (0.7624, 0.012) at t = 0.84 with a weaker tail; after calibration both are at or above the threshold (about
0.713268 and 0.713289). So (ε, ν) must be chosen against the relaxed law, not the Gaussian.

### 2.3 Calibration against master, and the estimate

1. **Same rows** (Lean rows 12–15, certified tables): the single-row maximum is 0.7134257; master certifies
   0.7134209, 4.8e-6 lower (mixtures, stronger budgets).
2. **Gaussian-optimal rows of the model** (true potential): the maximum over the computed t is 0.7134134; master is
   7.5e-6 higher (table slack `calib.log`: certified table − true potential = +4.9 to +5.3e-6 on rows 12–15; the
   finite cover in t; un-sampled t).

Estimator: certifiable cap ≈ (max over t of the relaxed value of Gaussian-optimal rows) + 0 to 7.5e-6.

| case | estimate | K | margin to 500/701 |
|---|---|---|---|
| tail (0.764, 0.0235) | **0.7131985 – 0.7132058** | **1.40212–1.40213** | **6.1–6.8e-5** |
| cubic, best ε | ≥ 0.71335 | ≤ 1.40185 | fails |

Uncertainty of the tail estimate (assessed, not computed): calibration transfer ±1e-5; sharpness of the new
potential's certified caps +0 to +2e-5 if route-M-quality pieces are rebuilt, more with anchored caps only (15 Oct:
old caps loose by 1e-4..3e-3 in the mid-range of s; the sharper caps gained 1.2e-5 in B); completeness of the ν > 0
fibre maximisation ±1e-5 (first-order branch switch, multi-start only); t outside 0.83–0.86 small; robust row
re-optimisation and a finer (ε, ν) only lower the cap (not done).

## 3. The Stein-LP numbers (`lawcap.py`, 10-October technology): status

The broadcasting bug (`dual_check` got 39 duals for a 40-cut bank) came from the caller: `solve_cp` adds the last
round's cuts after its last solve; fixed in `lawcap.py` by re-solving with the final bank. The re-runs then produced
invalid bounds (A7450 t = 0.855: 0.7166071 at x = 7.75; T7681 t = 0.84: 0.7397846 at x = 7.75; both above their own
moments-only bounds, 0.7138774 and 0.7139770), because the `max(dv, 0)` dual-infeasibility term of `dual_check` blows
up at the domain edge x = 31/4. Replaced by the SOCP of §2.2, which contains these cuts exactly plus the spectral
budgets. Valid moments-only values: A7450 t = 0.855: 0.7138774; A7564 t = 0.84: 0.7141131; T7681 t = 0.84: 0.7139770.

## 4. What a rebuild must change (survey of master 5a5e9e8e4, read-only)

**The chain.** `main_bounds` ← `lower_target` ← `lowerTarget_of_nodeCaps` ←
`RefinedLowerCheck.lower_bound_of_refined_cover_data` (Grothe/Research/RefinedCoverResult.lean) ←
`LawNodeLower.lower_bound_of_law_nodes` = `transfer_lower (transferInputs_of_witnessCap 2 (witnessCap_of_law_nodes …))`.
`transfer_lower` does not depend on the witness.

**The witness and ε are fixed in the code:** `witnessOf n K := P10 − ε•P_K`, `witness n := witnessOf n (H21 n)`
(Grothe/LowerAnalytic/Witness.lean:308, 440); `def ε : ℚ := 149/200` (Grothe/Lower/RowDataTypes.lean:22, in the caps
closure); the generators assert ε = 0.745 (tools/gen_lower_data.py:156, tools/gen_row_gates.py:31,
tools/needle_cover_refine.py:19).

**Witness-specific steps:** `norm_pairVal_witness` (Witness.lean), `VOf_eq` (t² − ε‖Qh‖² − ‖Pk‖² + ε‖Qk‖²,
WitnessCap.lean:102), `ReductionHyp` (Reduction.lean), `sharedReduction_frame` (RowGaussian.lean), `hside_identity`
(Lower/RowReduction.lean), `fibreExprC_le_pot` (FibreRot), `fibreExpr_le_Jpot` (FibreSup), `sharedReduction_of_gaussian`
(Bridge.lean), the k-side forms (KSide.lean), `RowSharedWith` (Boxes.lean), the gate completion (Gate.lean).

**The potential:** `Jpot = ∫(‖L+p‖ + ‖L−p‖)dγ − Fib.quad E R y`, M = diag(E, E, R, R, εI₂) (FibreSup.lean:186–190,
FibrePotential.lean:180).

**Node caps:** 15 legacy `CapRowKK` modules, 60 `rangeOK … := by native_decide` facts of 49 nodes each; rows 12–15:
25 `AnchorRange` facts each plus about 9,000 piece facts (CapPieces). The kernel (`GrotheCapsKernel`: Basic, CapCheck,
CapPoly) encloses the integrated matrix of the anchored-pair majorant of `|L+p| + |L−p|`; `L` and the basis are
hard-coded in the kernel; ε enters only on the Grothe side, via `mMat` (CapNodeDefs/CapPieceDefs, in the closure).

**Caps closure** (`python3 scripts/caps_stamp.py --list`, 10,229 files): CapPieces 9,371; the CapRow12–15 folders;
the 15 CapRowKK modules; `Grothe/Lower/{RowData01–19, RowData, RowDataTypes, RowGateData}`;
`Grothe/LowerAnalytic/{CapChordData, CapChords, CapConstrDefs, CapCoverDefs, CapCoverFast, CapLinAlgDefs, CapNodeDefs,
CapPieceDefs, CapPieceRange, CapPieceRepairDefs, CapPolar, CapRangeDefs, CapRecipeData, CapTablesData,
ComplexGaussianCore, Fluctuation, Gaussian, GaussianRadial, CapNodes}`; `Grothe/{Transfer, ListPoly}.lean`;
GrotheCapsKernel; the lake files and `data/caps-m/plan/row-certificates/row12-build.json`; upper-side files the rebuild
does not touch. The reduction chain and the Research cover/law modules are outside the closure.

**Why the kernel must change.** Any ε change edits `RowDataTypes` and every row: a full cap rebuild either way. The
pointwise tail replaces the fibre maximum by `Ψ_ν(A,B) = max over unit f, g of Re(f̄A) + Re(ḡB) + ν̂ Re(f̄g)`, which is
not of `|A|+|B|` form. A design for the kernel extension, checked numerically here: for all d₂, d₃ > 0 with
d₂d₃ > ν̂²,

    Ψ_ν(A,B) ≤ ½ [ d₂ + d₃ + (d₃|A|² + d₂|B|² + 2ν̂ Re(A B̄)) / (d₂d₃ − ν̂²) ]

(the Schur complement of the 3×3 dual of the tail-games README), with equality at the optimal (d₂, d₃). Check: 12
random cases, the minimum over (d₂, d₃) equals Ψ_ν to 3e-10 and no grid point falls below it. At ν̂ = 0 it is the AM–GM
anchored bound ½(d₂ + |A|²/d₂ + d₃ + |B|²/d₃). With A = L + p, B = L − p one has Re(AB̄) = |L|² − |p|², so for fixed
anchors the majorant stays **quadratic in the fibre multipliers y**, the shape of today's checked object. The kernel
integrand and the soundness lemma (CapMajorant `anchored_pair`, CapGrid, CapCheckSound, FibreSup) gain a cross term
and a 2×2 Schur denominator: a kernel change, so every module importing GrotheCapsKernel recompiles (which a full cap
rebuild does anyway).

## 5. Batched plan

### Stage 0: no repository changes

- **0a. Rows and parameters.** Fix rational (ε, ν), e.g. ε = 191/250, ν = 47/2000 (ε̂ = 1575/1953, ν̂ = 47/1953),
  chosen with the rows **robustly against the relaxed law** (the SOCP plus master's joint budgets), not the Gaussian.
  Re-optimise all 19 rows, t = 0.12–0.88, with mixtures where the cover binds.
- **0b. Python cap pipeline for Ψ_ν.** Extend `handoff/lower-stein/cert-0745e/tools` (exactint, anchored quadratics,
  route-M pieces) to the majorant above; node caps for all rows (chords, anchors, pieces).
- **0c. Law and cover.** Law nodes (LawNodeData format, cf. PR #381's law witnesses) and the refined cover,
  reproducible from new `data/` inputs.
- **0d. Go/no-go gate.** A pure-integer verifier in the style of `verify_cert.py`. Go only if
  (1 − ν)·B̂ + ν < 500/701 − 2·10⁻⁵.

### Stage 1: Lean on a branch, no closure files

Generalise in place, no parallel copies (no code that `main_bounds` does not use): `witnessOf` gets the tail,
`(1−ν)(P10 − ε̂P21 + ν̂Id)`; `norm_pairVal_witness` (Re⟨u, Tu⟩ ≥ (1+ε)‖P10u‖² − ε‖u‖² still holds, so the value bound is
unchanged); `VOf_eq` gains `+ν̂(1 − 2‖k‖²)`; the reduction chain carries `−2ν̂E|k₀|²` pointwise into
`Jpot_ν = ∫Ψ_ν(L+p, L−p) − quad`; a new lemma for the majorant above (3×3 PSD / Schur, finite-dimensional); the final
step gives N ≤ (1 − ν)·cap + ν; update the Research cover and law modules and `MainResult`. Targeted builds (yo/big
when there is room) or `scripts/cloud.sh lean …`; push with `[skip ci]`.

### Stage 2: the one invalidating change, a single PR

`RowDataTypes` (ε̂, ν̂); RowData01–19, RowData, RowGateData; CapRecipeData, CapChordData, the CapTablesData entries;
`mMat` and the other Cap*Defs (ε̂, the ν̂ cross term); the GrotheCapsKernel majorant; all CapRowKK, CapRow12–15,
CapPieces and CapNodes regenerated by `tools/gen_cap_*` and the generalised generators; the registry
`row12-build.json` regenerated by its generator. The lake files are **not** changed (AGENTS.md §13). Two files lack a
generator: CapTablesData is hand-written today, and `tools/gen_cap_row_anchors.py` (named in the AnchorRange headers)
no longer exists and must be recreated. Before the build: `python3 scripts/caps_stamp.py --digest` must print a sha256,
and a sample of rows is checked with cloud jobs (at most 2 shards). Then one heavy build: `gh workflow run lean.yml
--ref <branch> -f mode=caps` (its branch cache is replayed by the landing check), or the landing check itself after
review.

**CI cost:** about 21 CPU-hours for the 15 legacy rows and CapNodes plus the rows 12–15 piece facts
(docs/CAPS_M_STATUS.md §2: "roughly 25 + 50 + 20 CPU-hours"; 9,040 compute modules in the registry): **about 100–120
CPU-hours**, a day or more on the droplet. Nothing lands meanwhile. The upper-side energy facts are untouched.

**Risks:** certified caps of Ψ_ν looser than today's by more than about 4e-5 in B (gate 0d catches it); the kernel
majorant needs prices and anchors that fit the interval scheme (new trusted `native_decide` code, no threading,
AGENTS.md §13); model gaps in the ν > 0 fibre maximisation (±1e-5); the (ε, ν) sensitivity (§2.2); effort: weeks of
Python, Lean and kernel work; rebases during the PR must not touch the closure again.

### Relation to PR #381

codex-df7b, WIP, scalar cap 0.7134194 (K ≈ 1.401700), checked in Python only. It keeps ε = 149/200 and the cubic
witness; none of its 46 files is in the caps closure; its law-witness data are tied to today's potentials (a tail
rebuild regenerates them); `Grothe.Lower.FiniteMix` (`mixCover_bound`) is witness-agnostic and reusable. Its gain
(1.3e-6) is negligible next to the tail's. It can land on its own; base stage 0c on its format.

## 6. What was not done

No robust (law-aware) re-optimisation of rows (Gaussian-optimal rows only overstate the cap); no certified caps for
Ψ_ν; no tail rows outside t = 0.83–0.86; only a coarse (ε, ν) search; master's coupled and joint-sixth budgets not
modelled; Stein-LP numbers unusable (§3); `gfproj` and `A7520m` not run or stopped (not needed for the verdict).

## 7. Files

All in this folder. Scripts: `capmodel.py`, `run_rows.py`, `gatefree.py`, `calib.py`, `lawcap.py`, `stein_oct.py`,
`summary.py` (first worker); `lawsocp.py` (new: `python3 lawsocp.py out_TAG.jsonl t [xs=..] [taus=..] [ugrid=wide]`
or `python3 lawsocp.py lean K [t=..]`; needs cvxpy and Clarabel); `launch.sh` (now also sets
`RAYON_NUM_THREADS=1`). `results/`: `out_*.jsonl` (rows per t), `outtau_A7564.jsonl`, `lawsocp_results.jsonl`
(18 relaxation results), all logs (`socp*.log`: relaxation tables; `P76*.log`: projection form; `law*.log`:
Stein/moments runs; `calib.log`, `gf0.log`), and `queue.txt`.

Cleanup: all study jobs on yo stopped (queue loop stopped, every process group checked empty);
`~/claude-b9ee-capsstudy` on yo (including a 462 MB cvxpy venv) deleted at 05:53 Bucharest; `~/claude-b9ee-ksector`
(250 MB, the original venv) kept.
