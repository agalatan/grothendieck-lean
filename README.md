# Lean formalization of the complex Grothendieck constant certificate

This repository formalizes, in Lean 4 / Mathlib, the computations behind the upper bound
for the complex Grothendieck constant in

* Heilman, Jones, Malavolta, *Sharper bounds for the complex Grothendieck constant*,
  arXiv:2609.25462v1 — `K_G^ℂ < 1.404898554746`, and
* the refinement in [`refinement/research-note.md`](refinement/research-note.md) —
  `K_G^ℂ < 1.404898426735`.

**Status of prior work.** As of 8 October 2026 no formalization of Grothendieck's
inequality or of any numerical Grothendieck-constant certificate exists in Mathlib, the
Isabelle AFP, or Coq; the only Lean work in the area is a formalization of a different
"Grothendieck-type" theorem for Bessel sequences (Liehr, arXiv:2608.12280). Everything here
was written from scratch.

## What is proved

Build with `lake build` (Lean `v4.34.1`, Mathlib `v4.34.1`; `lake exe cache get` first). No
`sorry`. The two headline theorems are in `Grothe/Main.lean`:

| theorem | conclusion |
|---|---|
| `complex_grothendieck_refined` | `IsGrothendieckBound 1.404898426735` |
| `complex_grothendieck_source`  | `IsGrothendieckBound 1.404898554745441` |

`IsGrothendieckBound K` means `V(A) ≤ K · C(A)` for every finite complex matrix `A`, where
`C(A)` is the scalar phase optimum and `V(A)` the vector (Hilbert-space) optimum, both
defined in `Grothe/Transfer.lean`. In other words `K_G^ℂ ≤ K`.

Both theorems take, as explicit **hypotheses**, exactly the inputs of the certificate that
are *not* formalized (see below). Everything else is proved:

| file | content | status |
|---|---|---|
| `Transfer.lean` | `C(A)`, `V(A)`, `IsGrothendieckBound`; dominated and valid rounding kernels; valid ⇒ dominated (probabilistic argument); convex mixtures; the tensor-power identity `⟪x^{⊗(n+1)}⊗x̄^{⊗n}, …⟫ = z\|z\|^{2n}`; **inequality (1)** of the note: `K_G^ℂ ≤ M/(\|c₀\| − Σ_{n≥1}\|cₙ\|)` | fully proved |
| `Haagerup.lean` | Haagerup's coefficients `hₙ = π/(4(n+1)) · binom(2n,n)²/16ⁿ`; the corrected Wallis estimate `hₙ < 1/(4(n+¼)(n+1))` via the monotone sequence `bₙ = π(n+¼)pₙ² ↑ 1` (limit from Mathlib's Wallis product) | fully proved |
| `WallisTail.lean` | telescoping comparison (6); **equation (5)**: `W_N = Σ_{n≥N} hₙ/(2n+1)² ≤ 1/(48(N+1/16)³)`; the source's Lemma 6.1 (`Σ_{k≥N} h_k ≤ 1/(4N)`, `W_N ≤ 1/(48(N−1)³)`) | fully proved |
| `ListPoly.lean` | coefficient `ℓ¹` norm `‖·‖_𝒜` on `ℝ[X]`, submultiplicativity; executable integer-list polynomial arithmetic and its bridge to `Polynomial ℝ` | fully proved |
| `FifthTail.lean` | `‖P₅‖_𝒜 = 1−7·10⁻¹²`, `‖P₅²⁰‖_𝒜 < 1/2`, `‖P₅¹³⁵‖_𝒜 < 1/300` (equation (2)); the block argument giving **equation (3)**: `Σ_{j≥67} h_j ‖P₅^{2j+1}‖_𝒜 ≤ 1/273360`; the source's weaker reserve `1/268` | proved; the three integer facts use `native_decide` |
| `SixthTail.lean` | **equation (7)**: `√(1.174 W₁₂₀)+√(1.176 W₁₂₀)+√(1.174·1.176)/241² ≤ 258088051054978/10¹⁸`; the source's `≤ 523/2000000` | fully proved |
| `Assembly.lean` | exact rational arithmetic: masses, Cauchy tails `10R⁻²⁴¹/(1−R⁻²)`, weighted tail totals, the source's final constant, the unchanged-weight bound `< 1.404898427462`, the refined bound `< 1.404898426735` | fully proved (`norm_num`) |
| `Main.lean` | generic assembly `bound_of_certificate` and the two headline theorems | fully proved |
| `Contact.lean` | the source's final-audit arithmetic: positivity of the degree-63 partial sum of `Φ(x₊)`, `γ_H < 0.71178980668499814812` from Mathlib's `π < 3.14159265358979323847`, the gain over Haagerup, `1/Γ₀ < 1.404898554745441` | proved (one `native_decide`) |

### Hypotheses that remain (not formalized)

These are the analytic/numerical inputs of the source paper that this project consumes but
does not re-derive. They appear verbatim as hypotheses of the main theorems, so the Lean
statements make the dependency structure explicit:

1. `hdom` — each of the six source kernels `Kᵢ(z) = Σₙ kᵢₙ z\|z\|^{2n}` is a dominated rounding
   kernel. In the paper this follows from Haagerup's Gaussian phase identity
   `E[phase(X) conj(phase(Y))] = 𝔥(E[X Ȳ])` and the validity of the preprocessed kernels
   (Sections 3–5). The lemma `ValidKernel.dominated` shows that the paper's notion of a valid
   kernel (jointly distributed unimodular random variables) implies domination.
2. `hq0`, `hprefix` — the directed Arb enclosures of the first 120 mixture coefficients
   (`q₀ > 0.7117964083067696`, prefix `< 1.0747148914·10⁻⁶`; for the source weights
   `0.71179640805640433452` and `1.074829404498064·10⁻⁶`). These come from certified
   quadrature tables pinned by SHA-256 upstream.
3. `hcauchy0..3` — the Cauchy-estimate tails of the first four kernels (source Section 6.4).
4. `hfifth` — the retained-block contribution of the fifth kernel through mode 5000
   (source (6.19), `< 2.699176355797438·10⁻¹²` including the old weight), plus the structural
   fact that the omitted blocks contribute at most `Σ_{j≥67} h_j ‖P₅^{2j+1}‖_𝒜` — the quantity
   this project bounds by `1/273360` (note) and `1/268` (source).
5. `hsixth` — the Laguerre energy majorant for the sixth kernel tail (source Section 6.2),
   expressed through `W₁₂₀`, which this project bounds.

Haagerup's identity itself (a Gaussian integral evaluating to a hypergeometric function)
and the Arb quadrature are well outside what is reasonable to formalize here.

### Axioms

All theorems depend only on the standard axioms `propext`, `Classical.choice`,
`Quot.sound`, plus — for the theorems that transitively use the fifth-tail bound — the two
`native_decide` facts `absSum_P5int_pow20` and `absSum_P5int_pow135` in `FifthTail.lean`
(the sums of absolute coefficients of `(10¹²P₅)²⁰` and `(10¹²P₅)¹³⁵`, integers with 240 and
1620 digits; Lean records these as axioms named `…_native.native_decide.ax_1_1`).
`native_decide` trusts the Lean compiler's evaluation of `listPow`; the same numbers are
independently reproduced by `refinement/verify_exact.py`. `Contact.lean` uses one more
`native_decide` for a 63-term rational sum. Run `lake env lean scratch/Axioms.lean` to print
the axiom report.

## Layout

```
Grothe/            the Lean library (import order: ListPoly, Haagerup, WallisTail,
                   FifthTail, SixthTail, Assembly, Transfer, Main, Contact)
refinement/        the research note, Python verifiers and logs (unchanged)
scratch/           helper files not part of the library (axiom report)
```

## Conventions

* Matrices are functions `Fin m → Fin n → ℂ`; the inner product is Mathlib's, conjugate-linear
  in the first slot, so the one-dimensional case reads `conj(εᵢ) δⱼ`. Replacing `ε` by its
  conjugate shows this is the usual `C(A)`.
* `V(A)` is the supremum over all finite-dimensional `EuclideanSpace ℂ ι`; a finite family in
  any Hilbert space spans such a subspace, so this is the usual vector optimum.
* The fifth preprocessor is `ρ₅(t) = t·P₅(t²)`; since `‖ρ₅ᵏ‖_𝒜 = ‖P₅ᵏ‖_𝒜` all statements are
  about `P₅` (degree 37, `Grothe.P5int`).
