import Grothe.Lower.Rows
import Grothe.Lower.Stein
import Grothe.Lower.Envelope
import Grothe.Lower.Endpoint
import Grothe.Lower.Boxes
import Grothe.LowerAnalytic.Rows

/-!
# From the Gaussian reduction of the rows to the norm cap

The Gaussian reduction of the witness `T = P₁,₀ − ε P₂,₁` for a fixed admissible pair produces
*one* residual `p = Q_w c₁` in the cubic chaos of the remote coordinates, with scale `τ = ‖p‖₂`
and normalized law `U = |p|²/τ²`, and *one* gate variable `X = Q_w(c₁, c_A, conj c_B)` whose
first coordinate is `p`; every row `r` then satisfies, with its own potential `Ψ_r` (node caps up
to `capPad`, convex, `smax`-Lipschitz) and its retained gate square,

  `V ≤ t² − 2ℓt + 2β²/ε + E Ψ_r(δ_r τ √U) − δ_r τ² − E[X*N_r X + 2 Re(conj p (g_r·X))]
       − ε ‖Qh + (β/ε) v‖²`

(`SharedReduction`, one law and one gate variable for all rows).  Completing the square over
`(X₂, X₃)` for one row recovers the per-row reduction with the price `κσ²`, `σ = δ_r τ`
(`RowReduction`, `rowReduction_of_shared`), which `row_valid` combines with the certified row bound
into the retained-square inequality of the scalar envelope; on the central slab of `t` the
mixtures of two rows are evaluated jointly in `(t, τ, x)` on the boxes (`box_sound`).
`lower_bound_main` combines both covers into `V ≤ B`.
-/

open MeasureTheory

namespace Grothe.Lower

open LowerAnalytic

/-- The envelope row of a certified row. -/
def Row.env (r : Row) : EnvRow := ⟨r.ell, r.beta, 2 * r.beta ^ 2 / ε + r.cap + capPad⟩

/-- The crude row `(0, 0, ερ²)`. -/
def crudeRow : EnvRow := ⟨0, 0, ε * ρ ^ 2⟩

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- The retained-square inequality of an `EnvRow` at `ε`. -/
def RowOf (row : EnvRow) (V t : ℝ) (Qh v : E) : Prop :=
  RowHolds (ε : ℝ) row.ell row.beta row.C V t Qh v

/-- **The simultaneous Gaussian reduction of the rows**: one probability space with one normalized
law `U` (moment bounds and the inputs of the Stein cuts), one scale `0 ≤ τ ≤ ρ` and one gate
variable `X = (X₁, X₂, X₃)` with `|X₁|² = τ² U` (its first coordinate is the residual), such that
every row satisfies its inequality with its own potential and the retained gate square
(`RowShared`). -/
def SharedReduction (rows : List Row) (V t : ℝ) (Qh v : E) : Prop :=
  ∃ (Ω : Type) (_ : MeasurableSpace Ω) (μ : Measure Ω) (_ : IsProbabilityMeasure μ)
    (U : Ω → ℝ) (X1 X2 X3 : Ω → ℂ) (τ x : ℝ),
    Moments μ U x ∧ SteinInputs μ U ∧ 0 ≤ τ ∧ τ ≤ ρ ∧ (∀ ω, ‖X1 ω‖ ^ 2 = τ ^ 2 * U ω) ∧
    ∀ r ∈ rows, RowShared r μ U X1 X2 X3 τ V t Qh v

/-- **The Gaussian reduction of one row**: a law of the normalized residual with the moment bounds
and the inputs of the Stein cuts, a potential with the node caps of the row up to `capPad`, and a
scale `0 ≤ σ ≤ δρ`, such that `V` is bounded by the reduced expression with the price `κσ²`. -/
def RowReduction (r : Row) (V t : ℝ) (Qh v : E) : Prop :=
  ∃ (Ω : Type) (_ : MeasurableSpace Ω) (μ : Measure Ω) (_ : IsProbabilityMeasure μ)
    (U : Ω → ℝ) (Ψ : ℝ → ℝ) (σ x : ℝ),
    Moments μ U x ∧ SteinInputs μ U ∧ CapsHold (fun s => Ψ s - capPad) r.nodeList r.smax ∧
    0 ≤ σ ∧ σ ≤ r.delta * ρ ∧ Integrable (fun ω => Ψ (σ * √(U ω))) μ ∧
    V ≤ t ^ 2 - 2 * r.ell * t + 2 * r.beta ^ 2 / ε + ∫ ω, Ψ (σ * √(U ω)) ∂μ - r.kappa * σ ^ 2
      - ε * ‖Qh + ((r.beta : ℝ) / ε) • v‖ ^ 2

/-- Completing the gate square of one row (with its first coordinate fixed) recovers the per-row
reduction with the stored price `κ`, since `κδ² ≤ δ + gatePrice` (`checkRowPrice`). -/
theorem rowReduction_of_shared (r : Row) (hp : checkRowPrice r = true) {Ω : Type}
    [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ] (U : Ω → ℝ) (X1 X2 X3 : Ω → ℂ)
    (τ x : ℝ) (hM : Moments μ U x) (hS : SteinInputs μ U) (hτ0 : 0 ≤ τ) (hτ1 : τ ≤ ρ)
    (hX : ∀ ω, ‖X1 ω‖ ^ 2 = τ ^ 2 * U ω) (V t : ℝ) (Qh v : E)
    (h : RowShared r μ U X1 X2 X3 τ V t Qh v) : RowReduction r V t Qh v := by
  obtain ⟨Ψ, hΨ, hf, hg, hV⟩ := h
  simp only [checkRowPrice, Bool.and_eq_true, decide_eq_true_eq] at hp
  obtain ⟨⟨hδ, hok⟩, hκ⟩ := hp
  have hδR : (0 : ℝ) ≤ r.delta := by exact_mod_cast hδ.le
  have hG : (gatePrice r.N r.g1 r.g2 r.g3 : ℝ) * τ ^ 2
      ≤ ∫ ω, r.gate (X1 ω) (X2 ω) (X3 ω) ∂μ :=
    gate_integral_ge r.N r.g1 r.g2 r.g3 hok X1 X2 X3 τ hX hM hg
  have hκR : (r.kappa : ℝ) * r.delta ^ 2 ≤ r.delta + gatePrice r.N r.g1 r.g2 r.g3 := by
    exact_mod_cast hκ
  refine ⟨Ω, inferInstance, μ, inferInstance, U, Ψ, r.delta * τ, x, hM, hS, hΨ,
    mul_nonneg hδR hτ0, mul_le_mul_of_nonneg_left hτ1 hδR, hf, ?_⟩
  have hsq := mul_nonneg (sub_nonneg.2 hκR) (sq_nonneg τ)
  nlinarith [hV, hG, hsq]

/-- **A certified row holds** given its Gaussian reduction. -/
theorem row_valid (r : Row) (hb : RowBound r) (V t : ℝ) (Qh v : E)
    (h : RowReduction r V t Qh v) : RowOf r.env V t Qh v := by
  obtain ⟨Ω, _, μ, _, U, Ψ, σ, x, hM, hS, hΨ, h0, h1, hf, hV⟩ := h
  have hf' : Integrable (fun ω => Ψ (σ * √(U ω)) - capPad) μ := hf.sub (integrable_const _)
  have hbd := hb Ω μ U x (fun s => Ψ s - capPad) σ hM (steinCut_of_inputs μ hM hS) hΨ h0 h1
    hf'
  have e : ∫ ω, (Ψ (σ * √(U ω)) - capPad) ∂μ = ∫ ω, Ψ (σ * √(U ω)) ∂μ - capPad := by
    rw [integral_sub hf (integrable_const _), integral_const, probReal_univ, one_smul]
  rw [e] at hbd
  unfold RowOf RowHolds Row.env
  push_cast
  linarith

/-- **Main lower-bound theorem (finite layer).**  Under the retained-square inequality of the
crude row and the simultaneous Gaussian reduction of the certified rows, every admissible `(V, t)`
satisfies `V ≤ B`: outside the slab `[slabLo, slabHi]` of `t` by the scalar envelope of the rows'
certified caps, on the slab by the boxes of the regions of the joint `(t, τ, x)` cover; with the
Gaussian transfer `K_G^ℂ ≥ 1/B` this is `K_G^ℂ > 1.401674103` (`lower_endpoint`). -/
theorem lower_bound_main (rows : List Row) (models : List EnvModel) (cells : List EnvCell)
    (batches : List JBatch) (regions : List Region) (slabLo slabHi : ℚ)
    (hrows : rows.all checkRow = true) (hprices : rows.all checkRowPrice = true)
    (hout : checkOuter (crudeRow :: rows.map Row.env) models cells Bcap slabLo slabHi = true)
    (hbatches : batches.all (checkBatch rows) = true)
    (hslab : checkSlab rows batches Bcap slabLo slabHi regions = true)
    (V t : ℝ) (Qh v : E) (hv : ‖v‖ ^ 2 = 2) (ht0 : 0 ≤ t) (ht1 : t ≤ 9 / 10)
    (hcrude : RowOf crudeRow V t Qh v) (hred : SharedReduction rows V t Qh v) : V ≤ Bcap := by
  obtain ⟨Ω, _, μ, _, U, X1, X2, X3, τ, x, hM, hSI, hτ0, hτ1, hX, hshared⟩ := hred
  have hS : SteinCut μ U := steinCut_of_inputs μ hM hSI
  have hrows' : ∀ r ∈ rows, checkRow r = true := List.all_eq_true.1 hrows
  have hbatches' : ∀ b ∈ batches, checkBatch rows b = true := List.all_eq_true.1 hbatches
  -- the envelope outside the slab (everywhere when the slab is degenerate)
  have houter : t < slabLo ∨ (slabHi : ℝ) < t ∨ slabLo = slabHi → V ≤ Bcap := by
    intro hout'
    refine outer_bound (crudeRow :: rows.map Row.env) models cells Bcap slabLo slabHi hout t V
      ht0 ht1 hout' ?_
    intro i j hi hj θ hθ0 hθ1
    have hε : (0 : ℝ) < ε := by norm_num [ε]
    have hmem : ∀ k, k < (crudeRow :: rows.map Row.env).length →
        RowOf ((crudeRow :: rows.map Row.env).getD k dfltRow) V t Qh v := by
      intro k hk
      rcases List.mem_cons.1 (getD_mem_of_lt _ dfltRow k hk) with h | h
      · rw [h]; exact hcrude
      · obtain ⟨r, hr, hre⟩ := List.mem_map.1 h
        rw [← hre]
        exact row_valid r (rowBound_of_check r (hrows' r hr)).2 V t Qh v
          (rowReduction_of_shared r (List.all_eq_true.1 hprices r hr) μ U X1 X2 X3 τ x hM hSI
            hτ0 hτ1 hX V t Qh v (hshared r hr))
    have := rowHolds_mix (ε : ℝ) _ _ _ _ _ _ V t hε Qh v hv (hmem i hi) (hmem j hj) θ hθ0 hθ1
    simpa only [F] using this
  by_cases hemp : regions = []
  · -- no regions: the slab is degenerate
    subst hemp
    simp only [checkSlab, List.isEmpty_nil, ↓reduceIte, beq_iff_eq] at hslab
    exact houter (Or.inr (Or.inr hslab))
  by_cases hin : (slabLo : ℝ) ≤ t ∧ t ≤ slabHi
  · -- the slab: a region contains `t`, and a box of its cover contains `(t, τ, x)`
    have hregs : checkRegions rows batches Bcap slabLo slabHi regions = true := by
      have hne' : regions.isEmpty = false := by
        cases regions with
        | nil => exact absurd rfl hemp
        | cons _ _ => rfl
      simpa only [checkSlab, hne', Bool.false_eq_true, ↓reduceIte] using hslab
    have hne : regions ≠ [] := hemp
    obtain ⟨reg, _, hlo, hhi, hboxes, hcover⟩ :=
      regions_sound rows batches Bcap slabLo slabHi regions hregs hne t hin.1 hin.2
    have hmem : Dom.mem (reg.lo, reg.hi, 0, ρ, 0, xMax) t τ x :=
      ⟨hlo, hhi, by simpa using hτ0, hτ1, by simpa using hM.x0, hM.x1⟩
    obtain ⟨d, hd, hdm⟩ := coverOK_sound _ _ _ hcover t τ x hmem
    obtain ⟨s, hs, rfl⟩ := List.mem_map.1 hd
    have hchk := List.all_eq_true.1 hboxes s hs
    cases hbb : boxBound rows batches (parseBox s) with
    | none => simp [hbb] at hchk
    | some val =>
      simp only [hbb, decide_eq_true_eq] at hchk
      obtain ⟨h1, h2, h3, h4, h5, h6⟩ := hdm
      have := box_sound rows batches hrows' hbatches' (parseBox s) val hbb X1 X2 X3 τ hX hM hS
        V t Qh v hv hshared ⟨h1, h2⟩ ⟨h3, h4⟩ ⟨h5, h6⟩
      exact this.trans (by exact_mod_cast hchk)
  · -- outside the slab: the scalar envelope of the certified rows
    refine houter ?_
    rcases not_and_or.1 hin with h | h
    · exact Or.inl (not_le.1 h)
    · exact Or.inr (Or.inl (not_le.1 h))

end Grothe.Lower
