# Bounded grade-(1,5)/(1,7) pricing experiment

23 October 2026. **Floating discovery only. New tails are unpaid.** No new
rounding score, global bound, or endpoint follows from this experiment.

The four prescribed Powell runs were completed with 300 evaluations each,
using all 129 odd coefficients through degree 257 at Cauchy radius `.98` and
2048 FFT points. Every retained proposal was reevaluated at radius `.96`
with 8192 points and at `.98` with 16384 points.

The response family is

```
F(X)=phase(uX) exp(i X* H X),
G(Y)=phase(vY) exp(i Y* K Y),
u=normalize(1,a), v=normalize(1,-b), H=hJ, K=kJ,
J=[[0,-i],[i,0]].
```

The second channel retains original chaos grade five or seven. Its physical
cross-covariance is `t^5` or `t^7`; it is not relabeled an ordinary first-chaos
Gaussian. Separate charge one in the visible coordinate fails, so these
families lie outside the separately equivariant neutral-driver obstruction.
This experiment does not independently certify the graded-limit interpretation.

For each grade the two seeds were `(a,b,h,k)=(.3,.3,-.004,.004)` and
`(.1,.1,0,0)`. Bounds were `.001<=a,b<=.6` and `-.25<=h,k<=.25`.
The evaluation budget was reached in all four runs; no local or global optimum
is claimed. The best valid evaluated point of each run was retained.

## Prices against the frozen 557-column dual

The frozen baseline finite-pool objective is `0.7118917280420627`.

- Grade `(1,5)`, first seed: price `0.7096883568976734`, reduced cost
  `-0.0022033711443893`.
- Grade `(1,5)`, second seed: price `0.7096894295368104`, reduced cost
  `-0.0022022985052523`.
- Grade `(1,7)`, first seed: price `0.7119038117359314`, reduced cost
  `+1.2083693868736e-5`.
- Grade `(1,7)`, second seed: price `0.7119037099394004`, reduced cost
  `+1.1981897337754e-5`.

The best grade-seven parameters are

```
a=0.30949376375115295
b=0.3094486990458364
h=-0.02758829058882649
k=0.027575812880486796.
```

Its price exceeds the current priced grade-three column, under the **same
frozen dual**, by `1.1286688378465e-5`. Its cross-radius coefficient drift
is `1.4837156498983e-12`, and the corresponding price drift is
`2.7482868779622e-12`. These are floating consistency diagnostics, not interval
error bounds.

The parameters are nearly reflected: `a-b≈4.51e-5`, `h+k≈-1.25e-5`.
This points to a higher-grade chirp mechanism rather than a benefit requiring
substantial asymmetry. No fixed symmetry projection or additional pricing
was run after the bounded experiment.

## Reoptimized optimistic pool

All four new proposals were appended to the inherited 557 columns plus the
root's existing 20 new heads, using `fresh_pool_asymmetric.solve`. Every new
tail charge was set to zero, exactly as an optimistic discovery relaxation.

- Recomputed 577-column incumbent objective: `0.7118919138795405`.
- Expanded 581-column optimistic objective: `0.7118919863120672`.
- Optimistic gain over the 577-column incumbent: `7.2432526643240e-8`.
- Optimistic gain over the frozen 557-column baseline: `2.5827000449397e-7`.
- Total new weight: `0.0069619585612486`, entirely on the first-seed
  grade-seven proposal. The other three new weights are zero.
- The expanded floating primal–dual residual is about `3.95e-10`.

Thus the positive old-dual price survives reoptimization, but produces a
small finite-pool gain. This pool is substantially weaker than the actual
incumbent rounding. Positive pricing here does not establish usefulness
against the incumbent's full signed kernel or after paying the infinite tail.

## Files and replay

- `tools/fresh_price_higher_grades.py` owns this bounded experiment; no root
  pricing or pool script was edited.
- `higher-grade-pricing.json` contains all four proposals, 129-entry heads,
  optimizer budgets, branch checks, coefficient/price drifts, input hashes,
  the incumbent and expanded LP outputs, and every mixture weight.
- `higher-grade-pricing.npz` contains the four new heads and frozen dual.

From the isolated worktree root:

```sh
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python3 -B -I \
  tools/fresh_price_higher_grades.py \
  --out handoff/research-third-decimal/fresh-eyes-20261023/barriers/higher-grade-pricing.json \
  --max-evaluations 300
```

The script refuses optimized Python and evaluation budgets above 300 per seed.
Kernel and pool dependencies are existing local discovery tools; their hashes
and all frozen data hashes are saved in the result. Root-owned files were only
read. This experiment was stopped after the stated four runs; no continuing
old-dual parameter search is implied.
