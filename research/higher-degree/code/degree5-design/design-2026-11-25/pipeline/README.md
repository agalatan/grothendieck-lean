# Stage 2c: the conditional certificate "K₅ ⇒ V ≤ 500/701" for the game of `game.json`

claude-b9ee worker d5newcap, 16 November 2026. Labels: **P** proof, **C** exact or interval computation with a replay,
**N** floating point. This folder is stage 2b (`degree5-cert/cert2b/`, `CERT_STAGE2B.md`) with the game, the radius input
and the ν-grid taken from one file, the radius input made s-dependent, and one launcher. Nothing in the mathematics of
the certificate changed; §3 lists every edit.

## 1. One command

Copy this folder to the compute machine as `~/claude-b9ee-d5cert2c` (it must contain `rows2c.json`, `game.json`,
`rho_table_N.json` and, if `game.json` has `small_t`, the node files under `smallt/out/`), then inside it:

    bash launch2c.sh rows2c.json CORES [PROCS_PER_ROW] [PYTHON]        # e.g. bash launch2c.sh rows2c.json 44 8 /root/venv/bin/python

It checks the prerequisites in the foreground (python with numpy, scipy, python-flint, cvxpy, clarabel; g++; the
configuration), then starts ONE background job in its own process group and returns:

- `job.pid`: the process-group id. Stop everything: `kill -- -$(cat job.pid)`; check: `pgrep -g $(cat job.pid)`.
- `out/launch.log`: one line per row started and finished, then the assembly and the replay. The last line is
  `STAGE 2C: ALL PASS` or `STAGE 2C: FAILED (...)`.
- `out/logs/row_<TAG>.log`, `out/assemble2c.log` (the tables: envelope, room per row), `out/replay2c.log`.

A stopped run can be relaunched with the same command: rows whose records exist are skipped.
Steps of the job: `g++ -O2 -ffp-contract=off psi5.cpp`; `sched2c.py` (per row `run_row2c.py`: node caps → float LP
target → plain cover → Stein cover for the rows of kind `stein`); `assemble2c.py`; `replay2c_all.py ... --smallt`.

## 2. What is certified, and from what

For the game T = P₁,₀ − ε₁P₂,₁ + ηP₃,₂ of `game.json`, under the hypothesis K₅ on every row (CERT_STAGE2.md §1, with
this game's ε₁, η), every unimodular pair has V ≤ max_t min_r [t² − 2ℓ_r t + C_r] on [t₁, √π/2] and V ≤ a·t² + b on
[0, t₁] (the direct bound, no K₅; only if `small_t` is set). The replay prints B and the room 500/701 − max per piece.

Inputs:
- Lean: E U = 1, m = E U² ∈ [2, 44], E U³ ≤ 9m − 12 + C₆(m − 2)^{3/2}, C₆ = 4045313/100000.
- **The radius input (K ledger 3.7), s-dependent**: for q ∈ H₂,₁ with ‖q‖₂ = 1 and s = E|q|⁴ − 2 in a row
  [s_lo, s_hi] of `rho_table_N.json`: E|q| ≤ (1 − θ)B_lo + θB_hi, θ = (s − s_lo)/(s_hi − s_lo), and E|q| ≤ 93/100 for
  every s. Source: certificate N of `handoff/research-degree5/radius-relaxation-2026-11-16/` (`results/cert_N_final.json`,
  sha256 fb7d22b8…f44; proved and reviewed, `REVIEW.md` there; its §1 "convexity in s" and "endpoint" give the chord
  form). The table holds the 23 rows' exact endpoint bounds rounded up to 7 decimals; I replayed the reviewer's verifier
  to produce them (`../radius/rowbounds_N.json`).
- The scalar Stein family of `real-stein-radius.tex`, eq. (real-stein-square), exactly as in stage 2b (it is a statement
  about every cubic; it does not depend on which radius constant is used).
- The node caps of Ψ₅ (C, recomputed by the replay); K₅ on every row (hypothesis).

**Every place where a radius enters** (all read `gamecfg.RHO` or `gamecfg.rho_on_s / rho_on_x`):
1. `law2.py`: `J_coeffs(a, x, rho)`, the term a₁·ρ·σ of the moment bound, with ρ = `rho_on_x(xa, xb)` constant on the
   x-box (x = √(m − 2)), so the endpoint lemma in x is unchanged; `box_bound`; and `Row.sigmax = Lip·RHO/κ` (the outer
   region σ ≥ σ_max, with the constant 93/100, which is valid for every s);
2. `stein2.py`: `J_coeffs_stein`, `box_bound_stein` (the same term in the Stein boxes);
3. `cover2.py`, `cover2s.py`, `replay2c_all.py`: the assertion σ_max·κ ≥ Lip·RHO;
4. `smallt/cert.py`: `bound_exact(cert, s, rho)` with ρ = `rho_iv(sa, sb)` constant on the s-interval (the multiplier
   λ_ρ ≥ 0), used by `run_node.py` and `reverify.py`; `smallt/assemble.py`: the crude ends 2σ·RHO + η′ − σ²/ε₁;
5. selection only (N): `law2.lp_majorants`, `stein2.solve_box`, `lpfloat2.py`, `smallt/cert.solve`.
The cap on λ₁ itself is (500/701)/ρ*²: 0.8247 at 93/100.

## 3. What changed against stage 2b

| file | change |
|---|---|
| `gamecfg.py`, `game.json`, `rho_table_N.json` | new: the game (ε₁, η), the radius input (constant and table), the target, the ν-grid of the node caps, the Stein ν-grid, the small-t bound |
| `law2.py`, `lpfloat2.py`, `caps2.py`, `stein2.py` | constants from `gamecfg`; the radius term takes the box value; `stein2.solve_box` tells Clarabel to use one thread (its default takes every core while the covers already run one process per core) |
| `psi5.cpp`, `glconsts.h`, `gen_consts.py`, `cover2.py`, `cover2s.py`, `envelope.py`, `est_stein.py` | unchanged (byte-identical to stage 2b) |
| `run_row2c.py`, `sched2c.py` | new drivers (from `run_rows2.py`, `run_rows2b.py`, `run_stein2b.py`): one row per call, a scheduler with a core budget |
| `assemble2c.py`, `replay2c_all.py` | from `assemble2b.py`, `replay2b_all.py`: the small-t constants come from `game.json`; a row has a plain cover, a Stein cover or both; the replay also checks that the spec's game equals `game.json` and that B < target |
| `smallt/` | `cert.py`, `run_node.py`, `assemble.py`, `reverify.py` of `degree5-cert/smallt/` with the constants from `gamecfg`, the s-dependent radius, single-threaded Clarabel, s-partitions aligned with the radius rows; `run_nodes2c.sh` |
| `make_rows2c.py` | builds `rows2c.json` from the float row optimisations (`../rows/`), 6-decimal rationals |
| `launch2c.sh` | the launcher |

The ν-grid for η = 33/200: fine nodes −0.004 … 0.044 (step 0.004, fine s-grid) and coarse nodes ±0.165, ±0.1, −0.05,
−0.025, −0.012, 0.05, 0.06, 0.08, 0.125: 24 ν-nodes, 12,654 node caps per row (stage 2b: 18 and 10,194). The rows' ν₅*
is 0 at small t and 0.018–0.032 on t = 0.80–0.886.

## 4. Test and cost

**End-to-end test (C for what it covers), 16 November 2026, 22:18-23:33 Bucharest time, on big, cores 40-47.** Folder there:
`/root/claude-b9ee-d5newcap/cert2c_test` (a copy of this folder), command
`D5_REPLAY_ARGS="--caps 400 --no-target" taskset -c 40-47 bash launch2c.sh rows_test.json 8 4 /root/venv/bin/python`;
`rows_test.json` holds two rows of the game (1, −81/100, 33/200): t = 0.8475 (Gaussian-ideal row, plain cover) and
t = 0.125 (law-aware row with a Stein cover, slack 1/250). Last line of `out/launch.log`: `STAGE 2C: ALL PASS`.

| step | what ran | wall | CPU |
|---|---|---|---|
| row 0.8475 | 12,654 node caps; float LP target; plain cover, 1481 boxes | 595 s on 4 processes | 0.66 CPU-h |
| row 0.1250L | 12,654 node caps; plain cover, 1766 boxes; Stein cover, 1060 boxes of which 102 Stein | 3791 s on 4 processes | 4.2 CPU-h |
| assembly | exact envelope of the two rows (far above the target, as expected with two rows; `--no-target`) | seconds | |
| replay | per row 400 node caps recomputed, every box re-verified, the row constants reproduced (C = 1.4305246991 and 0.7271944520; the Stein cover lowers the constant of the row 0.125 by 1.49·10⁻³) | 692 s on 8 processes | 1.5 CPU-h |

- Certified G⁺ against the float LP at t = 0.8475: 1.3707735 against 1.3707609 (1.3·10⁻⁵ above).
- What the test does NOT cover: the small-t direct bound (`smallt/`, no nodes were computed), an envelope below the target
  (needs all rows), and the full replay (`--caps all`).
- **Cost estimate of a full run** (about 37 rows, 8 of them with Stein covers): rows 29 × 0.66 + 8 × 4.2 ≈ 53 CPU-hours;
  replay with every node cap about 12 CPU-hours; about 65 CPU-hours, 1.5 to 2 hours of wall time on 44 cores. A Stein row
  costs six times a plain row, so the number of Stein rows decides the total.
- The run needs `rows2c.json` (`make_rows2c.py`) for the game finally chosen. It has not been built: on 16-17 November the
  coordinator's allowance question showed that the cap-optimal game (1, −81/100, 33/200) is not the game for the content
  route (`../PROGRESS.md`), and no certificate is to be started.
