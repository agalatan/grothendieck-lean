import Grothe.Lower.TransferLimit

/-!
# The transfer in `L²(μ)` (H5, stage 2, measure-theoretic part)

Here `H = L²(μ)` for a finite measure `μ` on `Ω`, the test class is `Unimod μ`, the a.e.
unimodular elements, and the vector functions are families `u : ι → L²(μ)` with
`∑ₗ |uₗ(ω)|² ≤ 1` for a.e. `ω` (the unit ball of `L^∞(μ; ℓ²_ι)`).

* For a simple function `s : Ω → ℓ²_ι`, `cellIdx s ω` indexes the value `s ω` in the range of `s`,
  and `cellMap s μ c = (ω ↦ c (cellIdx s ω))` is the linear map of the cell-constant functions;
  unimodular coefficients give a.e. unimodular functions (`cellMap_mem_unimod`), and the
  cell-constant vector function with the cell values of `s` has the coordinates of `s`
  (`cellVec_cellMap`).
* `exists_simple_approx`: an a.e. ball-valued `u` is the coordinatewise `L²` limit of the
  coordinates of ball-valued simple functions (`SimpleFunc.approxOn` on the closed unit ball).
* `norm_pairVal_le`: hence, with a Grothendieck bound `K` and the scalar cap `B` of `T` over the
  a.e. unimodular functions, `‖∑ₗ ⟪uₗ, T vₗ⟫‖ ≤ K · B` (finite transfer on the cells of the
  approximations, then `norm_pairVal_le_of_tendsto`).
-/

namespace Grothe.Lower

open MeasureTheory Finset Filter Topology

noncomputable section

variable {Ω : Type} [MeasurableSpace Ω]
variable {ι : Type} [Fintype ι]

/-- The a.e. unimodular elements of `L²(μ)`. -/
def Unimod (μ : Measure Ω) : Set (Lp ℂ 2 μ) := {f | ∀ᵐ ω ∂μ, ‖f ω‖ = 1}

/-- The scalar cap `B` of `T` over the a.e. unimodular functions (the `L^∞ → L¹` cap). -/
def ScalarCap (μ : Measure Ω) (T : Lp ℂ 2 μ →L[ℂ] Lp ℂ 2 μ) (B : ℝ) : Prop :=
  ∀ f ∈ Unimod μ, ∀ g ∈ Unimod μ, ‖inner ℂ f (T g)‖ ≤ B

variable (μ : Measure Ω) [IsFiniteMeasure μ]

/-- The coordinate `ℓ` of a simple vector function, in `L²(μ)`. -/
def simpleCoord (s : SimpleFunc Ω (EuclideanSpace ℂ ι)) (ℓ : ι) : Lp ℂ 2 μ :=
  ((s.map fun x => x ℓ).memLp_of_isFiniteMeasure 2 μ).toLp _

/-! ### The cells of a simple function -/

section Cells

variable (s : SimpleFunc Ω (EuclideanSpace ℂ ι))

/-- The value of `s` on the `i`-th cell. -/
def cellVal (i : Fin s.range.card) : EuclideanSpace ℂ ι := (s.range.equivFin.symm i : _)

/-- The index of the cell containing `ω`. -/
def cellIdx (ω : Ω) : Fin s.range.card := s.range.equivFin ⟨s ω, s.mem_range_self ω⟩

omit [Fintype ι] in
lemma cellVal_cellIdx (ω : Ω) : cellVal s (cellIdx s ω) = s ω := by
  simp [cellVal, cellIdx]

omit [Fintype ι] in
lemma measurable_cellIdx : Measurable (cellIdx s) :=
  measurable_to_countable' fun i => by
    have : cellIdx s ⁻¹' {i} = s ⁻¹' {cellVal s i} := by
      ext ω
      simp only [Set.mem_preimage, Set.mem_singleton_iff]
      constructor
      · rintro rfl; exact (cellVal_cellIdx s ω).symm
      · intro h; simp [cellIdx, h, cellVal]
    rw [this]; exact s.measurableSet_fiber _

omit [Fintype ι] in
lemma memLp_cell (c : Fin s.range.card → ℂ) : MemLp (fun ω => c (cellIdx s ω)) 2 μ :=
  MemLp.of_bound ((measurable_of_countable c).comp (measurable_cellIdx s)).aestronglyMeasurable
    (∑ i, ‖c i‖) (ae_of_all _ fun _ =>
      single_le_sum (f := fun i => ‖c i‖) (fun _ _ => norm_nonneg _) (mem_univ _))

/-- The cell-constant functions `c ↦ (ω ↦ c (cellIdx s ω))`. -/
def cellMap : (Fin s.range.card → ℂ) →ₗ[ℂ] Lp ℂ 2 μ where
  toFun c := (memLp_cell μ s c).toLp _
  map_add' x y := MemLp.toLp_add (memLp_cell μ s x) (memLp_cell μ s y)
  map_smul' a x := MemLp.toLp_const_smul a (memLp_cell μ s x)

omit [Fintype ι] in
lemma cellMap_apply (c : Fin s.range.card → ℂ) : cellMap μ s c = (memLp_cell μ s c).toLp _ :=
  rfl

omit [Fintype ι] in
lemma cellMap_mem_unimod {c : Fin s.range.card → ℂ} (hc : ∀ i, ‖c i‖ = 1) :
    cellMap μ s c ∈ Unimod μ := by
  filter_upwards [MemLp.coeFn_toLp (memLp_cell μ s c)] with ω h
  rw [cellMap_apply, h]; exact hc _

omit [Fintype ι] in
/-- The cell-constant vector function with the cell values of `s` has the coordinates of `s`. -/
lemma cellVec_cellMap (ℓ : ι) : cellVec (cellMap μ s) (cellVal s) ℓ = simpleCoord μ s ℓ := by
  rw [cellVec, cellMap_apply, simpleCoord, MemLp.toLp_eq_toLp_iff]
  exact ae_of_all _ fun ω => by simp [cellVal_cellIdx]

end Cells

/-! ### Approximation by ball-valued simple functions -/

/-- An a.e. ball-valued `u` is the coordinatewise limit in `L²` of the coordinates of ball-valued
simple functions. -/
lemma exists_simple_approx (u : ι → Lp ℂ 2 μ) (hu : ∀ᵐ ω ∂μ, ∑ ℓ, ‖u ℓ ω‖ ^ 2 ≤ 1) :
    ∃ s : ℕ → SimpleFunc Ω (EuclideanSpace ℂ ι), (∀ n ω, ‖s n ω‖ ≤ 1) ∧
      ∀ ℓ, Tendsto (fun n => simpleCoord μ (s n) ℓ) atTop (𝓝 (u ℓ)) := by
  -- the vector function `U` with coordinates `uₗ`
  obtain ⟨U, hU⟩ : ∃ U : Ω → EuclideanSpace ℂ ι, U = fun ω => WithLp.toLp 2 fun ℓ => u ℓ ω :=
    ⟨_, rfl⟩
  have hUm : Measurable U := hU ▸ (PiLp.continuous_toLp 2 _).measurable.comp
    (measurable_pi_iff.2 fun ℓ => (Lp.stronglyMeasurable (u ℓ)).measurable)
  have hU1 : ∀ᵐ ω ∂μ, ‖U ω‖ ≤ 1 := by
    filter_upwards [hu] with ω h
    rw [hU, EuclideanSpace.norm_eq, Real.sqrt_le_one]
    simpa using h
  have h0 : (0 : EuclideanSpace ℂ ι) ∈ Metric.closedBall 0 1 := by simp
  have ht := SimpleFunc.tendsto_approxOn_Lp_eLpNorm hUm h0 (p := 2) (by simp)
    (hU1.mono fun ω h => subset_closure (by simpa using h))
    (by simpa using (MemLp.of_bound hUm.aestronglyMeasurable 1 hU1).eLpNorm_lt_top)
  obtain ⟨s, hs⟩ : ∃ s : ℕ → SimpleFunc Ω (EuclideanSpace ℂ ι),
      s = SimpleFunc.approxOn U hUm _ 0 h0 := ⟨_, rfl⟩
  rw [← hs] at ht
  have hs1 : ∀ n ω, ‖s n ω‖ ≤ 1 := fun n ω => by
    simpa [hs] using SimpleFunc.approxOn_mem hUm h0 n ω
  refine ⟨s, hs1, fun ℓ => ?_⟩
  rw [tendsto_iff_norm_sub_tendsto_zero]
  refine squeeze_zero (fun _ => norm_nonneg _) (fun n => ?_)
    ((ENNReal.tendsto_toReal ENNReal.zero_ne_top).comp ht)
  have hfin : eLpNorm (⇑(s n) - U) 2 μ ≠ ⊤ := (MemLp.of_bound
    ((s n).measurable.sub hUm).aestronglyMeasurable 2 (by
      filter_upwards [hU1] with ω h
      exact (norm_sub_le _ _).trans (by linarith [hs1 n ω]))).eLpNorm_ne_top
  rw [Lp.norm_def]
  refine ENNReal.toReal_mono hfin (eLpNorm_mono_ae (Lp.aestronglyMeasurable _) ?_)
  filter_upwards [Lp.coeFn_sub (simpleCoord μ (s n) ℓ) (u ℓ),
    MemLp.coeFn_toLp (((s n).map fun x => x ℓ).memLp_of_isFiniteMeasure 2 μ)] with ω h1 h2
  rw [h1, Pi.sub_apply, simpleCoord, h2]
  simpa [hU] using PiLp.norm_apply_le (s n ω - U ω) ℓ

/-- **The transfer in `L²`.**  A Grothendieck bound `K` and the scalar cap `B` of `T` over the
a.e. unimodular functions bound `‖∑ₗ ⟪uₗ, T vₗ⟫‖` by `K · B` for a.e. ball-valued `u, v`. -/
theorem norm_pairVal_le {K B : ℝ} (hK : IsGrothendieckBound K) {T : Lp ℂ 2 μ →L[ℂ] Lp ℂ 2 μ}
    (hcap : ScalarCap μ T B) {u v : ι → Lp ℂ 2 μ} (hu : ∀ᵐ ω ∂μ, ∑ ℓ, ‖u ℓ ω‖ ^ 2 ≤ 1)
    (hv : ∀ᵐ ω ∂μ, ∑ ℓ, ‖v ℓ ω‖ ^ 2 ≤ 1) : ‖pairVal T u v‖ ≤ K * B := by
  obtain ⟨s, hs1, hs⟩ := exists_simple_approx μ u hu
  obtain ⟨t, ht1, ht⟩ := exists_simple_approx μ v hv
  have hval : ∀ s : SimpleFunc Ω (EuclideanSpace ℂ ι), (∀ ω, ‖s ω‖ ≤ 1) →
      ∀ i, ‖cellVal s i‖ ≤ 1 := fun s hs i => by
    obtain ⟨ω, hω⟩ := SimpleFunc.mem_range.1 (s.range.equivFin.symm i).2
    rw [cellVal, ← hω]; exact hs ω
  have e : ∀ s : SimpleFunc Ω (EuclideanSpace ℂ ι),
      simpleCoord μ s = cellVec (cellMap μ s) (cellVal s) :=
    fun s => funext fun ℓ => (cellVec_cellMap μ s ℓ).symm
  refine norm_pairVal_le_of_tendsto T hs ht fun n => ?_
  show ‖pairVal T (simpleCoord μ (s n)) (simpleCoord μ (t n))‖ ≤ K * B
  rw [e, e]
  exact finite_transfer hK T _ _ (fun ε δ hε hδ => hcap _ (cellMap_mem_unimod μ _ hε) _
    (cellMap_mem_unimod μ _ hδ)) (hval _ (hs1 n)) (hval _ (ht1 n))

end

end Grothe.Lower
