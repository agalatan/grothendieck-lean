# Global All-Sector Pointwise Closure $F_{\mathrm{joint}}(c^*) \le 0$ on $\mathbb{C}^6$

Agent-ID: `gemini-c1de`. Refs [#436](https://github.com/agalatan/grothendieck-lean/issues/436), [#177](https://github.com/agalatan/grothendieck-lean/issues/177).

Self-contained outward-rounded C++17 interval certifier and pure-Python standard-library exact rational verifier certifying
\[
  F_{\mathrm{joint}}(c^*)(q, A, B, Q, P, \nu) \;\le\; 0 \qquad \forall (q, A, B, Q, P, \nu) \in \mathbb{C}^6
\]
at the peak row with the global $U(1)$-invariant visible shift $c^* = -\frac{7}{25}\nu$ and zero-mean compensating form $C_{\mathrm{inv}}(Q, \nu) = -\frac{6801}{18910}\Re(Q\bar{\nu})$ (no $|\nu|^2 \le 1/50$ cap, arbitrary sharing and phases). Combined with the independently verified bridge (`STATUS.md` rows `7.5.6`, `7.5.3`, `3.3`, `3.14`), this yields the unconditional six-sector peak-row bound $\widehat{\Lambda}(G) < S + 4936/10^8 = S + 49.36\cdot 10^{-6}$ on $u \le 0.0463, u + V \le 0.080051$.

See [`../../sources/global-all-sector-gemini-c1de/PROOF.md`](../../sources/global-all-sector-gemini-c1de/PROOF.md) for the complete mathematical proof.

## Files

- `certify_all_sector.cpp`: Self-contained C++17 outward-rounded (`FE_UPWARD` enforced per thread) certifier for Parts 1–3. Rejects `-DNDEBUG` at compile time, compiles cleanly with `-O2 -ffp-contract=off -frounding-math -std=c++17 -pthread -Wall -Wextra -Werror`, runs startup self-tests, and writes exact `std::hexfloat` intervals to `result.json`.
- `result.json`: Exact `std::hexfloat` certificate pinned to `certify_all_sector.cpp` by `cpp_sha256`.
- `verify.py`: Pure-Python standard-library verifier (`python3 -I`, rejects `-O`). Runs all zero-float algebraic, 2D Bernstein (Lemmas L1 & L2), Smooth-Split $H_{5,\delta}$ (Lemmas S1 & S2), $\psi(r, q)$ calculus, $w \ge 8$ even+odd analytic exterior proofs, independent analytic Jensen diagonal lower-bound checks, exact rational Sylvester PSD & continuity audits of Parts 1–3, and optional `--replay-cpp`.
- `test_controls.py`: 23 negative/corruption controls covering Parts 1–3 discontinuities, PSD failures, Part 1 & Part 2 Jensen diagonal under-reporting, handoff gaps, negative parameters, box-count tampering, Part 3 `RingGeom` `hT` and `AngGeom` `df` inward-rounding regressions, bad `cpp_sha256`, `python3 -O`, live C++ even & odd false-target controls (`--control-false-hotspot`), and C++ `-DNDEBUG` compile rejection.

## Replay Instructions

```bash
# 1. Exact rational audit of committed certificate + all zero-float symbolic/Bernstein proofs (~0.5 s):
python3 -I research/conjecture-K/code/global-all-sector-gemini-c1de/verify.py

# 2. Full 23-test negative/corruption control suite (~3 s):
python3 -I research/conjecture-K/code/global-all-sector-gemini-c1de/test_controls.py

# 3. Full non-destructive C++17 recompilation + live control + full 8-thread replay + exact-match check:
python3 -I research/conjecture-K/code/global-all-sector-gemini-c1de/verify.py --replay-cpp
```

## Reuse Precondition on `eval_c0_cell_ub` (Singleton Parameter Boxes Only)

`eval_c0_cell_ub` (`certify_all_sector.cpp:1928–1973`) requires **singleton point parameter boxes** (`rw = 0`, `rv = 0`, hence `dX_box = 0`). The sole production caller (`certify_all_sector.cpp:2813`, `eval_odd_box(pgrids[gl_idx], w_pt, v_pt, ...)`) evaluates point corners of each `Box5` leaf under the 5D convexity–semiconvexity theorem, so `dX_box == 0.0` identically and the `if (dX_box > 0.0)` branch at lines `1965–1970` is never reached (`STATUS.md` `7.5.13` is unaffected).

Do **not** call `eval_odd_box` / `eval_c0_cell_ub` as written on non-singleton interval parameter boxes (`dX_box > 0`): when `rl_cell < dX_box` (`rl_box = 0`), a point at initial radius `dX_box` can shift to the origin with true maximum increase `psi(0, q_hi) - psi(dX_box, q_hi)`, whereas lines `1966–1968` evaluate `psi_cell_dn` at `rl_cell` (`psi(0, q_hi) - psi(rl_cell, q_hi)`, which is smaller and vanishes at `rl_cell = 0`). Because `certify_all_sector.cpp` is hash-pinned by `cpp_sha256` in `result.json`, `INVENTORY.md`, and `REPLAY.md`, do not edit it in place; any future reuse with interval parameter boxes (for instance, a multi-row consumer in `STATUS.md` §8) must start from a fixed copy in its own folder (replacing `rl_cell` by `std::max(rl_cell, dX_box)` in `psi_cell_dn` at `1966–1968`) with its own regenerated receipt.
