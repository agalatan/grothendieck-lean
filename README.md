# Lean formalization of the complex Grothendieck constant certificates

Lean 4 / Mathlib formalization of the computations behind the numerical bounds for the
complex Grothendieck constant `K_G^ℂ`:

| target | source | Lean theorem |
|---|---|---|
| `K_G^ℂ < 1.404898554745441` | Heilman–Jones–Malavolta, arXiv:2609.25462v1 (120 modes) | `Grothe.complex_grothendieck_source` |
| `K_G^ℂ < 1.404898426735` | [`refinement/research-note.md`](refinement/research-note.md) (120 modes, sharper tails) | `Grothe.complex_grothendieck_refined` |
| `K_G^ℂ < 1.404898359045958` | [`handoff/upper/proof.md`](handoff/upper/proof.md) (240 modes, common preprocessor, first-order energy) | `Grothe.complex_grothendieck_240` |
| `K_G^ℂ > 1.400813971` | [`handoff/lower/research-note.md`](handoff/lower/research-note.md) (Gaussian witness, 21 coupled profiles) | finite layer: `Grothe.Lower.envelope_bound_data`, `Grothe.Lower.lower_endpoint` |
| `K_G^ℂ > 1.4008970709` | [`handoff/lower-import/research-note.md`](handoff/lower-import/research-note.md) (v2: 18 coupled profiles, 145 imported majorants, sharper `C₆`) | finite layer: `Grothe.Lower.envelope_bound_dataV2`, `Grothe.Lower.lower_endpointV2`, `Grothe.Lower.chords_sound` |

**Prior work.** As of 8 October 2026 no formalization of Grothendieck's inequality or of any
numerical Grothendieck-constant certificate exists in Mathlib, the Isabelle AFP, or Coq; the
only Lean work nearby is a formalization of a Grothendieck-type theorem for Bessel sequences
(Liehr, arXiv:2608.12280). Everything here was written from scratch.

## Building

```sh
lake exe cache get      # Mathlib v4.34.1 (toolchain leanprover/lean4:v4.34.1)
lake build              # whole library; see note on Value.lean below
lake env lean scratch/Axioms.lean   # axiom report
```

No `sorry`, no `axiom`. `Grothe/Cert240/Value.lean` evaluates the 240-mode interval checker by
`native_decide` (about 20 minutes with the precompiled `GrotheKernel` library); keep its
`.olean` cached.

## What `IsGrothendieckBound K` means

`Grothe/Transfer.lean` defines, for a complex matrix `A : Fin m → Fin n → ℂ`, the scalar phase
optimum `C(A) = sup |∑ aᵢⱼ conj(εᵢ) δⱼ|` and the vector optimum
`V(A) = sup |∑ aᵢⱼ ⟪xᵢ, yⱼ⟫|` over unit vectors in finite-dimensional complex Hilbert spaces
`EuclideanSpace ℂ ι`, and `IsGrothendieckBound K := ∀ A, V(A) ≤ K · C(A)`, i.e. `K_G^ℂ ≤ K`.
Conventions follow Mathlib (inner product conjugate-linear in the first slot); conjugating `ε`
shows this is the usual definition.

## The upper bounds

### Fully proved analytic core (standard axioms only)

* `Transfer.lean`: dominated and valid rounding kernels; valid ⇒ dominated (the probabilistic
  argument); convex mixtures; the tensor-power identity
  `⟪x^{⊗(n+1)}⊗x̄^{⊗n}, y^{⊗(n+1)}⊗ȳ^{⊗n}⟫ = z|z|^{2n}`; **the transfer inequality**
  `K_G^ℂ ≤ M/(|c₀| − Σ_{n≥1}|cₙ|)` for a dominated kernel `(1/M)Σ cₙ z|z|^{2n}` (`transfer`).
* `Cert240/Preprocessor.lean`: a real odd polynomial with coefficient norm `≤ 1` is an
  allowable preprocessor (explicit unit feature vectors), so `DominatedKernel Q` implies
  `DominatedKernel (Q ∘ η^phys)` (`DominatedKernel.comp_physPoly`).
* `Cert240/Composition.lean`: `radialKernel c (η^phys z) = radialKernel (c ∘ E) z` on the disc
  (`radialKernel_comp`) and the contraction `Σ|(r∘E)ₙ| ≤ Σ|rₙ|` for `‖E‖_𝒜 ≤ 1`.
* `Haagerup.lean`: Haagerup's coefficients `hₙ = π/(4(n+1))·binom(2n,n)²/16ⁿ` and the
  corrected Wallis estimate `hₙ < 1/(4(n+¼)(n+1))` via the monotone sequence
  `bₙ = π(n+¼)pₙ² ↑ 1` (limit from Mathlib's Wallis product).
* `WallisTail.lean`, `Cert240/JointTail.lean`: telescoping tail bounds
  `W_N = Σ_{n≥N} hₙ/(2n+1)² ≤ 1/(48(N+1/16)³)`, `Σ_{n≥N} hₙ ≤ 1/(4N)`,
  `W'_N = Σ_{n≥N} hₙ/(2n+1) ≤ …`; the weighted Cauchy–Schwarz joint tail
  `Σ_{n≥N}|ξₙcₙ + Re(rₙs̄ₙ)| ≤ √(E_C W'_N) + √(E_L E_R)/(2N+1)` (`joint_tail_bound`).
* `ListPoly.lean`, `FifthTail.lean`, `Cert240/FifthTail240.lean`: the Wiener norm `‖·‖_𝒜` on
  `ℝ[X]`, submultiplicativity, the exact facts `‖P₅²⁰‖ < 1/2`, `‖P₅¹³⁵‖ < 1/300`, and the
  block arguments giving the reserves `1/273360` (120 modes) and `1/(4·320·2³²)` (240 modes).
* `SixthTail.lean`, `Assembly.lean`, `Cert240/Assembly240.lean`, `Main.lean`,
  `Cert240/Final.lean`: radical bounds, box-derived `‖A‖₂,‖B‖₂ ≤ 0.99948`, the coefficient
  error budget `ε`, the weighted tails `T`, and all final rational arithmetic.
* `Contact.lean`: the source's Haagerup contact-point audit (`γ_H < 0.71178980668499814812`
  from Mathlib's 20-digit `π`, partial-sum positivity, gain, reciprocal).

### The finite interval checker (`Cert240/`)

`GrotheKernel/Basic.lean` is a Mathlib-free, precompiled kernel of fixed-point intervals
`[lo/2¹²⁸, hi/2¹²⁸]` with outward-rounded `addI`, `mulI`, list convolution and a truncated Horner
scheme. `Cert240/IntervalSound.lean` proves every operation sound (`mem`, `memB_conv`,
`memB_hornerT`, `dloInt_sound`). `Cert240/CheckerDefs.lean` and `Checker.lean` build the
concrete pipeline — `π` from `Real.pi_gt_d20/pi_lt_d20`, the five exact rational scalar
profiles `sProf` (truncated at 240), the boxed origin coefficients `Re(A conj B)`, the 240
mixture intervals, and the composition with the frozen preprocessor `η` through radial degree
57240 — and prove, **without native evaluation**,
`finite_certificate_240_exact : FiniteCertificate240 (dloIntFinal / 2¹²⁸)`.
`Value.lean` evaluates `dloIntFinal` once by `native_decide`, giving
`Dlo240 = 242211386207595090474349798194917751060 / 2¹²⁸ ≈ 0.71179529047965838`,
which reproduces the handoff's Arb endpoint to 18 digits and exceeds the threshold
`DloNeeded = 0.7117952904796581` by `2.8·10⁻¹⁶`.

### Hypotheses that remain (not formalized)

The main theorems take these as explicit hypotheses, so the dependency structure is visible:

1. domination of the six source kernels (Haagerup's Gaussian phase identity and the validity
   of the preprocessed kernels, source Sections 3–5; `ValidKernel.dominated` shows the paper's
   probabilistic notion implies domination);
2. the Arb enclosures: for 120 modes the directed `q₀`/prefix bounds, for 240 modes the
   containment of the truncated radial coefficient integrals `A_n(0,36)`, `B_n(0,36)` in the
   exact data boxes (`Cert240/Data.lean`, exported from the pinned NPZ tables);
3. the scalar coefficient identification `kᵢₙ = π·sProf(rowᵢ) n` (phase-kernel expansion);
4. the sixth-kernel structure `k₅ₙ = Re(aₙ b̄ₙ)` with truncation error `‖a−A‖₂ ≤ e⁻¹⁸`, and for
   `n ≥ 240` the first-order decomposition `k₅ₙ = ξₙcₙ + Re(rₙs̄ₙ)` with the three energy caps
   (Laguerre/Dirichlet energy quadrature);
5. the Cauchy tails of kernels 1–4 and the finite part of the fifth tail.

### Axioms

All theorems use only `propext`, `Classical.choice`, `Quot.sound`, plus the `native_decide`
facts listed by `scratch/Axioms.lean`: the two integer coefficient sums of `(10¹²P₅)^{20,135}`,
`Σ|η_j| = 1`, the exact rational partial sum `wSum_240_le`, the two box-norm sums, and
`dloIntFinal_ge` (the compiled interval evaluation). Each of these is a finite exact
computation reproduced independently by the Python verifiers in `refinement/` and `handoff/`.

## The lower bound

`handoff/lower/` (v1) and `handoff/lower-import/` (v2) certify
`sup_n ‖T_n‖_{∞→1} ≤ B` for the Gaussian witness `T = P₁,₀ − (37/50)P₂,₁`, hence
`K_G^ℂ ≥ 1/B`: v1 with `B = 3569353321/5000000000` (21 coupled profiles, 4,197 leaves),
v2 with `B = 7138283181/10000000000` (18 coupled profiles, 10,218 leaves, 365 global physical
majorants, sharper `C₆ = 49.42288923`), giving `K_G^ℂ > 1.4008970709`.

* `Grothe/Lower/` (finite layer, sound checkers + data generated by `tools/gen_lower_data*.py`,
  `tools/gen_chord_data.py`): Bernstein upper bounds on intervals (`evalL_le_of_bern`), the
  endpoint lemma for `ax²+bx³`, PSD/PD certificates by exact `LᵀDL` factorizations
  (`psd3_of_check`), dyadic bisection covers (`coversBox_sound`), profile gates and allocations,
  the piecewise-quadratic envelope, and (v2) chord domination: every physical polynomial used
  dominates the piecewise-linear interpolant of the lifted node caps and the slope-2 affine tail
  (`dominates_of_check`, `chords_sound`). Results: `vrecords_sound` / `vrecordsV2_sound` (all
  virtual caps on `[0,ρ]×[0,31/4]`), `envelope_bound` (generic), `envelope_bound_data` /
  `envelope_bound_dataV2 : … → V ≤ B`, `lower_endpoint` / `lower_endpointV2`
  (`1/B ≤ K → L < K`). Taken as data: the nine old source row caps (base moment cover not
  re-verified) and the lifted node caps themselves (Gaussian price enclosures).
* `Grothe/LowerAnalytic/` (analytic lemmas, standard axioms only): the scalar three-moment
  lemma `∫√Z ≤ (1+√β)/√(α+2√β)` (`moment_lemma`), the polynomial positivity certificates for
  `C₆` (old and sharper, `sixthGap_pos`, `sixthGap'_pos`) and `ρ`, the consequence `E|q| < ρ`
  inherited by the sharper constant (`first_moment_lt_rho'`), the weighted variance and
  retained-square identities and the two-row mixing bound (`mix_retained`, `mixing_bound`),
  joint convexity and argument allocation (`allocation_with_beta`), the Schur-complement gate
  (`schur_gate`), and the endpoint/limit arguments (`operator_bound_limit`).

Not formalized (hypotheses of the finite layer): the Gaussian profile reduction
`V ≤ Fᵢ(t) − ε‖Qh + βᵢv/ε‖²`, the node caps of the potentials `Ψᵢ` (Gaussian moment enclosures;
with chord domination the remaining assumption is only that `Ψᵢ` is convex, 2-Lipschitz and
below the lifted caps at the nodes), the Wick sixth-moment identity, and the transfer from the
Gaussian operator to finite matrices.

## Layout

```
Grothe/              main library (see Grothe.lean for the module list)
Grothe/Cert240/      240-mode upper certificate (interface, analytic layer, checker, final)
Grothe/Lower/        lower-bound finite checkers and data (v1 and v2 certificates, chords)
Grothe/LowerAnalytic/ lower-bound analytic lemmas
GrotheKernel/        Mathlib-free precompiled interval kernel
handoff/             curated research handoff (notes, exact data, reference verifiers)
refinement/          the 120-mode research note, Python verifiers and logs
tools/               data generators (JSON → Lean, exact rationals)
scratch/             axiom reports and evaluation drivers (not part of the library)
.claude/skills/      the `lean-grothe` skill: build workflow, conventions, Mathlib quirks
```
