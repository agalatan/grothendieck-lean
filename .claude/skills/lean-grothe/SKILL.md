---
name: lean-grothe
description: Working conventions for the Lean 4 / Mathlib formalization of the complex Grothendieck constant certificates in this repo (build commands, module layout, worker protocol, and the Mathlib quirks that cost hours). Use whenever editing or building Lean files here.
---

# Lean workflow for `grothe`

## Build
- Toolchain: `lean-toolchain` = `leanprover/lean4:v4.34.1`, Mathlib tag `v4.34.1` (pinned in
  `lake-manifest.json`). `export PATH="$HOME/.elan/bin:$PATH"` first.
- `lake build Grothe.Foo` builds one module (~75–120 s, dominated by the Mathlib import).
  `lake build` builds the library `Grothe` (every module listed in `Grothe.lean`).
- Filter noise: `lake build X 2>&1 | grep -v "^trace" | grep -v "^warning\|^Hint\|^Note\|linter\|^$\|Omit it"`.
- Quick experiments: put a file in `scratch/` and run `lake env lean scratch/File.lean`.
- Worktrees share Mathlib: `mkdir -p .lake && ln -s /Users/alingalatan/workspaces/grothe/.lake/packages .lake/packages`
  inside the worktree, then `lake build` works without re-downloading anything.
- Axiom check: `lake env lean scratch/Axioms.lean` (`#print axioms`). Only `propext`,
  `Classical.choice`, `Quot.sound` and documented `native_decide` facts are acceptable.
  No `sorry`, no `axiom`.

## Layout
- `Grothe/Transfer.lean`: `scalarOpt`, `vectorOpt`, `IsGrothendieckBound`, `DominatedKernel`,
  `ValidKernel`, `tpow` (tensor powers), `transfer` (the transfer inequality).
- `Grothe/ListPoly.lean`: the Wiener norm `l1` of real polynomials.
- `Grothe/Upper/`: the upper certificate, one two-coordinate rounding kernel
  `H(t) = Σ E[n,m] p(t)^n (−τ(t))^m` compared with `c·t` through the kernel of a truncation
  (tables `E`, `EX`, `E0`). `Residual` (`radialKernel`, `residual_transfer`, `residual_perturb`,
  `tail_add_le`, `hardy_tail`), `Bivariate` (`termOf`, `bivarKernel`, `ℓ¹` contraction
  `tsum_abs_bivarKernel_le`, linearity `bivarKernel_sub`, locality `bivarKernel_eq_head`,
  `head_residual_le`), `IntervalSound` and `Head` (soundness of the
  Mathlib-free precompiled `GrotheKernel/`: `Basic` fixed-point intervals, `Table` truncated
  bivariate composition `bivarT` and the dyadic table parser), generated `Data.lean`
  (`tools/gen_upper_data.py` from `handoff/upper-residual/taylor`: `pList`, `qList`, the stored energies
  as strings), `Final.lean` with `KernelHyps` and `complex_grothendieck_upper` (the `native_decide`
  `head_check`, about 15 s).
- `Grothe/Lower/`: the lower certificate (witness `P₁,₀ − εP₂,₁`, `ε = 149/200`). `Basic`
  (`evalL`, endpoint lemma, `quadMax`), `Poly` (list polynomials, the integer positivity
  certificate `posCert`/`posOn`, Taylor tails), `PSD`, `Gates`, `Moment` (constants `ρ`, `C6`, `ε`;
  `MPoly`, `J`, `checkJ`), `Sweep` (`CapsHold`, the majorant sweep `sweepTop`, `major_sound`),
  `Cuts` (Stein-cut test functions `cutG` and their polynomial pieces), `Law` (`Moments`,
  `SteinCut`, integration lemmas), `Stein` (`SteinInputs`, `steinCut_of_inputs`: the cuts from the
  fluctuation bound and the radial integration by parts), `Rows` (`Row`, parsers, `checkRow`, `rowBound_of_check`),
  `Envelope`, `Endpoint`, `Support` (`RowReduction`, `lower_bound_main`), generated data
  (`RowData01`–`RowData19`, `RowData` from `tools/gen_lower_data.py`; bulk data are strings parsed
  at check time), `RowCheck` (the `native_decide` module, `lower_bound_data`).
- `Grothe/LowerAnalytic/`: the lower certificate's analytic lemmas (moment lemma, bivariate
  Bernstein bounds, the `C₆`/`ρ` certificates `Moments`/`SixthMomentData`/`SixthMoment` generated
  by `tools/gen_moment_certs.py`, variance identities, the coupling square completion, Schur
  gate, row mixing, endpoint), and the Gaussian side of the Stein cuts: `Gaussian` (`stdGaussian d`,
  polynomial integrability, `stein_scalar`, `stein_coordinate`), `RadialParts` (`radial_parts`:
  `3E[U H(U)] = E[S H(U)] + 2E[T H'(U)]`), `RadialCut` (`cutPrim_deriv`, `radial_cut`,
  `steinInputs_of_fluctuation`).
- `handoff/` (git-ignored) holds the research archives the generators in `tools/` read; the
  generated Lean data files are committed, the archives are not.
- Only the best bounds are kept in the repo and its docs; superseded certificates are deleted,
  not archived. CI (`.github/workflows/lean.yml`) builds everything, forbids `sorry`, and
  prints `scratch/Axioms.lean`.

## Conventions
- Matrices are `Fin m → Fin n → ℂ` (never `Matrix`: `rw` motives fail under implicit transparency).
- Inner product is Mathlib's (conjugate-linear first slot). Scalar case: `conj (ε i) * δ j`.
- Radial index `n` ↔ odd degree `2n+1`; preprocessors `ρ(t) = t·P(t²)` are stored as lists of `P`.
- Decimal literals like `0.7117964083067696` are exact rationals; `norm_num` handles them.

## Mathlib quirks (v4.34.1) that bit us
- `add_le_add_left h a : h-side + a ≤ …` has the *swapped* convention; use `add_le_add le_rfl h`.
- `RCLike.inner_apply' : ⟪x, y⟫ = conj x * y`; `PiLp.inner_apply`; `WithLp.toLp 2 f` builds
  Euclidean vectors, `PiLp.toLp_apply`, `PiLp.norm_single`, `EuclideanSpace.inner_single_left`.
- `Summable.tsum_eq_zero_add`, `Summable.sum_add_tsum_nat_add`, `Summable.tsum_finsetSum`,
  `Summable.tsum_le_tsum`, `summable_nat_add_iff`, `Real.tsum_le_of_sum_le` (no summability
  needed), `summable_of_sum_range_le`, `tsum_mul_left/right`, `Summable.of_norm_bounded`.
- `Real.sqrt_le_left (hy : 0 ≤ y) : √x ≤ y ↔ x ≤ y^2`; `Real.pi_lt_d20`, `Real.pi_gt_d20`.
- `Real.Wallis.W`, `W_succ`, `W_pos`, `le_W`, `tendsto_W_nhds_pi_div_two`;
  `Nat.succ_mul_centralBinom_succ`; `Monotone.ge_of_tendsto`.
- `MeasureTheory.integral_finsetSum`, `integrable_finsetSum`, `integral_const_mul`,
  `integral_mono_of_nonneg`, `Integrable.mono'`, `probReal_univ`.
- `Finset.sum_range_sub'`, `Finset.prod_univ_sum`, `Fintype.piFinset_univ`, `Fintype.sum_prod_type`.
- Big powers: keep `(10^12)^k` unexpanded; transfer Nat facts with `Nat.cast_le.mpr` then
  `rw [Nat.cast_mul, Nat.cast_pow, Nat.cast_ofNat]`; `generalize` the big power to a variable
  before `nlinarith`. `exact_mod_cast`/`norm_num` on `10^1620` blows the recursion depth.
- Never let unification unfold a concrete large power: make such defs `@[irreducible]`
  (see `nrm` in `FifthTail.lean`) and expose `nrm_def`.
- `set` in long proofs causes whnf timeouts; use `generalize`, `obtain ⟨B, hB⟩ : ∃ B, ∀ k, B k = …`
  or plain terms. Raise `set_option maxHeartbeats 2000000 in` *before* the docstring if needed.
- `simp only [foo]` already runs simprocs (e.g. `Matrix.cons_val`); a second `simp only` may
  fail with "no progress". After `fin_cases i`, use `change _ ≤ <expected>` to evaluate `![…] ⟨4,_⟩`.
- `native_decide` evaluates compiled `List ℤ`/`ℚ` code fast (135th power of a degree-37 integer
  polynomial in seconds); kernel `decide` is fine only for small data.

## Worker protocol (parallel branches)
- Each worker works in its own git worktree/branch `work/<topic>` and only creates/edits files
  it owns (new modules under its topic); never edit shared files owned by others.
- Commit on the branch when a module builds; final report: which theorems compile, axioms,
  what remains as hypotheses. The integrator merges branches into `master`.
