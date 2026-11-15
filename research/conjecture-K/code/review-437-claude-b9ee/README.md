# Review of #437 (compact pieces of premise (P))

Agent-ID: claude-b9ee. Task #431. Review comment:
[#437, 15 Nov 2026](https://github.com/agalatan/grothendieck-lean/pull/437#issuecomment-6893325714).

The review re-derived KINT §§1–6 on paper, inspected the three interval checkers of
`../compact-joint-2026-11-15/`, and replayed `verify.py` (exit 0, 202 s; every check PASS; the
corrupted profile table rejected; the regenerated `result.json` equal to the committed one).
This folder holds the two pieces of the review that are new work.

## `curvature_bounds.py` (P + C, claude-b9ee; reviewed by codex-a7c4)

The critical box of KINT §2 needs bounds for F0''(w) = (d/dw)² E|L+w| and β''(w), where
β(w) = E[(T − 2/5) Re ph(L+w)], on 75/128 ≤ w ≤ 79/128. KINT uses F0'' ≤ I₀/2 < 179/125 and
|β''| ≤ 1. Both are proved in `../../sources/received-2026-11-15-tilted-sector/secant_proof.md`
§5 (12). The first follows from the radially decreasing density of L and its projection
density. The second follows from the certified profile bound sup N_Φ < 1/3, taking D = vvᵀ.
Their certificates are `../tilted-sector-2026-11-15/verify.py` (`secant_scalars`:
I₀ ∈ [2.863947582582862, 2.863947582582863]) and `content_profile.certify_global` (111 boxes,
largest upper value 0.3333233). The review replayed both. With these inputs the box's defect
is at most −0.0013909.

This script is an independent alternative with weaker, self-contained inputs. Its docstring
proves, for every real w,

- F0'' ≤ E[1/|L+w|] ≤ 2/a < 3.5766 (radially decreasing density of L, layer cake);
- |β''| ≤ ‖∂₁²((T − 2/5)e^{−T}/(πD))‖_{L¹} ≤ 5.0044, an Arb upper Riemann sum of a one-dimensional
  integral on 21,000 cells of [0, 60], plus an analytic tail ≤ 38e^{−60}.

With these, the box's interpolation error grows by 0.0009906, and its defect bound becomes
−0.0004003 < −1/2500. The script asserts exactly this comparison. The corner maximum and the
author's interpolation error are read from the `critical_box` receipt of
`../compact-joint-2026-11-15/result.json`, which its `verify.py` regenerates.

```sh
python3 -I research/conjecture-K/code/review-437-claude-b9ee/curvature_bounds.py --deps <dir with python-flint>
```

Runs in 0.3 s. It refuses to run under `python3 -O`.

## `crosscheck.py` (N, claude-b9ee)

Floating-point recomputation, with numpy and scipy, of the matrices behind 7.4.11 and 7.4.12, in about 25 minutes.
Results of the review run:

| quantity | value |
|---|---|
| E[1] through the polar change of variables | 1.0000000000000002 |
| H0 and V computed directly in z₁ (adaptive quadrature, singular point as breakpoint) vs the polar formulas of KINT §§4, 6 | agree to ≤ 4·10⁻¹¹ at w = 0, 0.6, 1.5 |
| closed-form K0 (KINT §3) vs polar H0(0) | equal to 8 digits |
| min eig(Q0 − K0), claimed > 7/400 | 0.0175268 |
| (H): min eig(Q0 + (w²/2 − 0.01)S − H0), 161 shifts on [0, 2] | 0.0075 at w = 0 |
| amplitude exterior: min eig(Q0 + (w²/2 + 3/4)S − V) | 0.0163 at w = 0.625 |
| shift exterior: min eig(Q0 + (w²/2)S − V), w ≥ 11/8 | 0.0382 at w = 11/8 |
| shift exterior at w = 1.35 / amplitude exterior with 3/4 replaced by 0.7 | −0.007 / −0.033 (both thresholds are near the limit of V) |
| max e^{−T}M(T)³/D(T), claimed ≤ 16/5 | 3.079 |
| F0'' and β'' on the box (finite differences, noisy) | 0.60–0.64 and −0.23 to 0.47 |
