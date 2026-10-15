import Grothe.Lower.Transfer

/-!
# The transfer in `L²(μ)`: cells of simple functions (H5, stage 2, measure-theoretic part)

Here `H = L²(μ)` for a finite measure `μ` on `Ω`, the admissible class is `Unimod μ`, the a.e.
unimodular elements, and the vector functions are bounded measurable maps
`u : Ω → EuclideanSpace ℂ ι` with `‖u ω‖ ≤ 1`, whose coordinates `coordLp μ hu hu1 ℓ` are elements
of `L²(μ)`.

* For a simple function `s`, the cells `cell s i = s⁻¹{cellVal s i}` (indexed by the range of
  `s`) have indicators `cellLp s μ i ∈ L²(μ)`; `cellFun_cellLp_eq` identifies the cell-constant
  function `∑ᵢ cᵢ 1_{cell i}` with `ω ↦ c (cellIdx s ω)`, so unimodular coefficients give an
  a.e. unimodular function (`cellFamily_cellLp`), and `cellVec_cellLp_eq` identifies the
  cell-constant vector function with values `cellVal s i` with `s` itself.
* `exists_simpleFunc_approx`: a ball-valued measurable `u` is approximated in `L²` by ball-valued
  simple functions (`SimpleFunc.approxOn` on the closed unit ball).
* `approximable_coordLp`: hence `(coordLp u, coordLp v)` is `Approximable (Unimod μ)`.

`TransferInputsL2 B` are the transfer inputs in this concrete form: for every `δ > 0` a
probability space, a bounded operator `T` on `L²(μ)` with the scalar cap `B` over the a.e.
unimodular functions, and bounded measurable vector maps `u, v` with
`1 − δ ≤ ‖∑ₗ ⟪uₗ, T vₗ⟫‖`.  `TransferInputsL2.toTransferInputs` reduces them to
`TransferInputs B`, and `lower_bound_of_transferL2` gives `Llow < K` from
`TransferInputsL2 Bcap` and `IsGrothendieckBound K`.

**What remains hypothetical** is exactly `TransferInputsL2 Bcap` for the Gaussian witness:
(i) the scalar cap `‖⟪f, T g⟫‖ ≤ Bcap` for a.e. unimodular `f, g` (the `L^∞ → L¹` norm bound,
which is the conclusion of the certificate `lower_bound_data` through the Gaussian reduction
hypothesis), and (ii) the value `∑ₗ ⟪uₗ, T uₗ⟫ ≥ 1 − δ` of the witness on `u(z) = z/‖z‖` in
dimension large enough.  Nothing else is assumed.
-/

namespace Grothe.Lower

open MeasureTheory Finset Filter

noncomputable section

variable {Ω : Type} [MeasurableSpace Ω]
variable {ι : Type} [Fintype ι]

/-- The a.e. unimodular elements of `L²(μ)`. -/
def Unimod (μ : Measure Ω) : Set (Lp ℂ 2 μ) := {f | ∀ᵐ ω ∂μ, ‖f ω‖ = 1}

/-! ### Coordinates of bounded measurable vector functions -/

lemma measurable_coord {u : Ω → EuclideanSpace ℂ ι} (hu : Measurable u) (ℓ : ι) :
    Measurable fun ω => u ω ℓ :=
  ((PiLp.continuous_apply 2 (fun _ : ι => ℂ) ℓ).measurable).comp hu

lemma norm_coord_le (x : EuclideanSpace ℂ ι) (ℓ : ι) : ‖x ℓ‖ ≤ ‖x‖ := PiLp.norm_apply_le x ℓ

lemma memLp_coord (μ : Measure Ω) [IsFiniteMeasure μ] {u : Ω → EuclideanSpace ℂ ι}
    (hu : Measurable u) (hu1 : ∀ ω, ‖u ω‖ ≤ 1) (ℓ : ι) : MemLp (fun ω => u ω ℓ) 2 μ :=
  MemLp.of_bound (measurable_coord hu ℓ).aestronglyMeasurable 1
    (ae_of_all _ fun ω => (norm_coord_le _ ℓ).trans (hu1 ω))

/-- The coordinates of a bounded measurable vector function as elements of `L²(μ)`. -/
def coordLp (μ : Measure Ω) [IsFiniteMeasure μ] {u : Ω → EuclideanSpace ℂ ι}
    (hu : Measurable u) (hu1 : ∀ ω, ‖u ω‖ ≤ 1) : ι → Lp ℂ 2 μ :=
  fun ℓ => MemLp.toLp (fun ω => u ω ℓ) (memLp_coord μ hu hu1 ℓ)

/-! ### The cells of a simple function -/

section Cells

variable (s : SimpleFunc Ω (EuclideanSpace ℂ ι))

/-- The number of cells (the cardinality of the range). -/
abbrev ncells : ℕ := s.range.card

/-- The value of `s` on the `i`-th cell. -/
def cellVal (i : Fin (ncells s)) : EuclideanSpace ℂ ι := (s.range.equivFin.symm i : _)

/-- The index of the cell containing `ω`. -/
def cellIdx (ω : Ω) : Fin (ncells s) := s.range.equivFin ⟨s ω, s.mem_range_self ω⟩

omit [Fintype ι] in
lemma cellVal_cellIdx (ω : Ω) : cellVal s (cellIdx s ω) = s ω := by
  simp [cellVal, cellIdx]

omit [Fintype ι] in
lemma cellVal_injective : Function.Injective (cellVal s) := fun _ _ h =>
  s.range.equivFin.symm.injective (Subtype.ext h)

omit [Fintype ι] in
lemma cellIdx_eq_iff (ω : Ω) (i : Fin (ncells s)) : cellIdx s ω = i ↔ s ω = cellVal s i := by
  constructor
  · rintro rfl; exact (cellVal_cellIdx s ω).symm
  · intro h; apply cellVal_injective s; rw [cellVal_cellIdx, h]

/-- The `i`-th cell `s⁻¹{cellVal s i}`. -/
def cell (i : Fin (ncells s)) : Set Ω := ⇑s ⁻¹' {cellVal s i}

omit [Fintype ι] in
lemma measurableSet_cell (i : Fin (ncells s)) : MeasurableSet (cell s i) :=
  s.measurableSet_fiber _

omit [Fintype ι] in
lemma mem_cell_iff (ω : Ω) (i : Fin (ncells s)) : ω ∈ cell s i ↔ cellIdx s ω = i := by
  rw [cell, Set.mem_preimage, Set.mem_singleton_iff, cellIdx_eq_iff]

omit [Fintype ι] in
lemma measurable_cellIdx : Measurable (cellIdx s) :=
  measurable_to_countable' fun i => by
    have : cellIdx s ⁻¹' {i} = cell s i := by ext ω; simp [mem_cell_iff]
    rw [this]; exact measurableSet_cell s i

variable (μ : Measure Ω) [IsFiniteMeasure μ]

/-- The indicator of the `i`-th cell in `L²(μ)`. -/
def cellLp (i : Fin (ncells s)) : Lp ℂ 2 μ :=
  indicatorConstLp 2 (measurableSet_cell s i) (measure_ne_top μ _) (1 : ℂ)

omit [Fintype ι] in
lemma memLp_cellIdx_comp (c : Fin (ncells s) → ℂ) : MemLp (fun ω => c (cellIdx s ω)) 2 μ :=
  MemLp.of_bound ((measurable_of_countable c).comp (measurable_cellIdx s)).aestronglyMeasurable
    (∑ i, ‖c i‖) (ae_of_all _ fun _ =>
      Finset.single_le_sum (f := fun i => ‖c i‖) (fun _ _ => norm_nonneg _) (Finset.mem_univ _))

omit [Fintype ι] [IsFiniteMeasure μ] in
/-- The a.e. representative of a finite sum in `Lp`. -/
lemma Lp_coeFn_sum {β : Type} (t : Finset β) (f : β → Lp ℂ 2 μ) :
    (↑↑(∑ b ∈ t, f b) : Ω → ℂ) =ᵐ[μ] fun ω => ∑ b ∈ t, f b ω := by
  classical
  induction t using Finset.induction_on with
  | empty =>
    simp only [Finset.sum_empty]
    exact Lp.coeFn_zero ℂ 2 μ
  | insert a t ha ih =>
    rw [Finset.sum_insert ha]
    filter_upwards [Lp.coeFn_add (f a) (∑ b ∈ t, f b), ih] with ω h1 h2
    rw [h1, Pi.add_apply, h2, Finset.sum_insert ha]

omit [Fintype ι] in
/-- The cell-constant function `∑ᵢ cᵢ 1_{cell i}` is `ω ↦ c (cellIdx ω)`. -/
lemma cellFun_cellLp_eq (c : Fin (ncells s) → ℂ) :
    cellFun (cellLp s μ) c
      = MemLp.toLp (fun ω => c (cellIdx s ω)) (memLp_cellIdx_comp s μ c) := by
  apply Lp.ext
  have h1 := Lp_coeFn_sum μ Finset.univ (fun i => c i • cellLp s μ i)
  have h2 : ∀ i, (↑↑(c i • cellLp s μ i) : Ω → ℂ)
      =ᵐ[μ] fun ω => c i * (cell s i).indicator (fun _ => (1 : ℂ)) ω := by
    intro i
    have hb : (↑↑(cellLp s μ i) : Ω → ℂ) =ᵐ[μ] (cell s i).indicator fun _ => (1 : ℂ) :=
      indicatorConstLp_coeFn
    filter_upwards [Lp.coeFn_smul (c i) (cellLp s μ i), hb] with ω ha hb
    rw [ha, Pi.smul_apply, hb, smul_eq_mul]
  have h3 := ae_all_iff.2 h2
  have h4 := MemLp.coeFn_toLp (memLp_cellIdx_comp s μ c)
  filter_upwards [h1, h3, h4] with ω e1 e3 e4
  rw [e4]
  unfold cellFun
  rw [e1, Finset.sum_congr rfl fun i _ => e3 i, Finset.sum_eq_single (cellIdx s ω)]
  · rw [Set.indicator_of_mem ((mem_cell_iff s ω _).2 rfl), mul_one]
  · intro i _ hi
    rw [Set.indicator_of_notMem, mul_zero]
    exact fun h => hi ((mem_cell_iff s ω i).1 h).symm
  · intro h; exact absurd (Finset.mem_univ _) h

omit [Fintype ι] in
/-- The cells of a simple function form an admissible family: unimodular combinations are a.e.
unimodular. -/
lemma cellFamily_cellLp : CellFamily (Unimod μ) (cellLp s μ) := by
  intro ε hε
  rw [cellFun_cellLp_eq]
  show ∀ᵐ ω ∂μ, ‖(MemLp.toLp _ (memLp_cellIdx_comp s μ ε) : Lp ℂ 2 μ) ω‖ = 1
  filter_upwards [MemLp.coeFn_toLp (memLp_cellIdx_comp s μ ε)] with ω h
  rw [h]; exact hε _

/-- The cell-constant vector function with values `cellVal s i` is `s` itself. -/
lemma cellVec_cellLp_eq (hs1 : ∀ ω, ‖s ω‖ ≤ 1) (ℓ : ι) :
    cellVec (cellLp s μ) (cellVal s) ℓ
      = MemLp.toLp (fun ω => s ω ℓ) (memLp_coord μ s.measurable hs1 ℓ) := by
  unfold cellVec
  rw [cellFun_cellLp_eq, MemLp.toLp_eq_toLp_iff]
  exact ae_of_all _ fun ω => by simp only [cellVal_cellIdx]

end Cells

/-! ### Approximation by ball-valued simple functions -/

/-- A ball-valued measurable function is approximated in `L²` by ball-valued simple functions. -/
lemma exists_simpleFunc_approx (μ : Measure Ω) [IsFiniteMeasure μ]
    {u : Ω → EuclideanSpace ℂ ι} (hu : Measurable u) (hu1 : ∀ ω, ‖u ω‖ ≤ 1)
    {η : ℝ} (hη : 0 < η) :
    ∃ s : SimpleFunc Ω (EuclideanSpace ℂ ι),
      (∀ ω, ‖s ω‖ ≤ 1) ∧ eLpNorm (⇑s - u) 2 μ ≤ ENNReal.ofReal η := by
  have h0 : (0 : EuclideanSpace ℂ ι) ∈ Metric.closedBall (0 : EuclideanSpace ℂ ι) 1 := by simp
  have hmem : ∀ᵐ ω ∂μ, u ω ∈ closure (Metric.closedBall (0 : EuclideanSpace ℂ ι) 1) :=
    ae_of_all _ fun ω => subset_closure (by simpa using hu1 ω)
  have hfin : eLpNorm (fun ω => u ω - 0) 2 μ < ⊤ := by
    simp only [sub_zero]
    exact (MemLp.of_bound hu.aestronglyMeasurable 1 (ae_of_all _ hu1)).eLpNorm_lt_top
  have ht := SimpleFunc.tendsto_approxOn_Lp_eLpNorm hu h0 (p := 2) (by simp) hmem hfin
  obtain ⟨n, hn⟩ := (ht.eventually_lt_const (ENNReal.ofReal_pos.2 hη)).exists
  refine ⟨SimpleFunc.approxOn u hu _ 0 h0 n, fun ω => ?_, hn.le⟩
  simpa using SimpleFunc.approxOn_mem hu h0 n ω

/-- One side of the approximation: admissible cells and ball values approximating the
coordinates of `u` in `L²`. -/
lemma exists_cells_approx (μ : Measure Ω) [IsFiniteMeasure μ]
    {u : Ω → EuclideanSpace ℂ ι} (hu : Measurable u) (hu1 : ∀ ω, ‖u ω‖ ≤ 1)
    {η : ℝ} (hη : 0 < η) :
    ∃ (N : ℕ) (e : Fin N → Lp ℂ 2 μ) (x : Fin N → EuclideanSpace ℂ ι),
      CellFamily (Unimod μ) e ∧ (∀ i, ‖x i‖ ≤ 1) ∧
      ∀ ℓ, ‖coordLp μ hu hu1 ℓ - cellVec e x ℓ‖ ≤ η := by
  obtain ⟨s, hs1, hs⟩ := exists_simpleFunc_approx μ hu hu1 hη
  refine ⟨ncells s, cellLp s μ, cellVal s, cellFamily_cellLp s μ, ?_, ?_⟩
  · intro i
    obtain ⟨ω, hω⟩ : ∃ ω, s ω = cellVal s i :=
      SimpleFunc.mem_range.1 (s.range.equivFin.symm i).2
    rw [← hω]; exact hs1 ω
  · intro ℓ
    rw [cellVec_cellLp_eq s μ hs1 ℓ, coordLp, ← MemLp.toLp_sub, Lp.norm_toLp]
    apply ENNReal.toReal_le_of_le_ofReal hη.le
    refine le_trans (eLpNorm_mono ?_ ?_) hs
    · exact ((measurable_coord hu ℓ).sub (measurable_coord s.measurable ℓ)).aestronglyMeasurable
    · intro ω
      calc ‖((fun ω => u ω ℓ) - fun ω => s ω ℓ) ω‖ = ‖(s ω - u ω) ℓ‖ := by
            rw [Pi.sub_apply, PiLp.sub_apply, norm_sub_rev]
        _ ≤ ‖(⇑s - u) ω‖ := norm_coord_le _ ℓ

/-- **Approximability in `L²`.**  The coordinate pairs of bounded measurable vector functions
are approximable by ball-valued cell-constant pairs on admissible cell families. -/
theorem approximable_coordLp (μ : Measure Ω) [IsFiniteMeasure μ]
    {u v : Ω → EuclideanSpace ℂ ι} (hu : Measurable u) (hv : Measurable v)
    (hu1 : ∀ ω, ‖u ω‖ ≤ 1) (hv1 : ∀ ω, ‖v ω‖ ≤ 1) :
    Approximable (Unimod μ) (coordLp μ hu hu1) (coordLp μ hv hv1) := by
  intro η hη
  obtain ⟨N, e, x, he, hx, hux⟩ := exists_cells_approx μ hu hu1 hη
  obtain ⟨M, e', y, he', hy, hvy⟩ := exists_cells_approx μ hv hv1 hη
  exact ⟨N, M, e, e', x, y, he, he', hx, hy, hux, hvy⟩

/-! ### The transfer inputs in `L²` -/

/-- The transfer inputs in measure-theoretic form: for every `δ > 0`, a probability space, a
bounded operator `T` on `L²(μ)` with the scalar cap `B` over the a.e. unimodular functions, and
bounded measurable vector maps `u, v` with `1 − δ ≤ ‖∑ₗ ⟪uₗ, T vₗ⟫‖`. -/
structure TransferInputsL2 (B : ℝ) : Prop where
  pos : 0 < B
  witness : ∀ δ : ℝ, 0 < δ →
    ∃ (Ω : Type) (_ : MeasurableSpace Ω) (μ : Measure Ω) (_ : IsProbabilityMeasure μ)
      (T : Lp ℂ 2 μ →L[ℂ] Lp ℂ 2 μ) (ι : Type) (_ : Fintype ι)
      (u v : Ω → EuclideanSpace ℂ ι) (hu : Measurable u) (hv : Measurable v)
      (hu1 : ∀ ω, ‖u ω‖ ≤ 1) (hv1 : ∀ ω, ‖v ω‖ ≤ 1),
      ScalarCap T (Unimod μ) B ∧ 1 - δ ≤ ‖pairVal T (coordLp μ hu hu1) (coordLp μ hv hv1)‖

/-- The measure-theoretic inputs give the abstract ones. -/
theorem TransferInputsL2.toTransferInputs {B : ℝ} (h : TransferInputsL2 B) :
    TransferInputs B where
  pos := h.pos
  witness := fun δ hδ => by
    obtain ⟨Ω, _, μ, _, T, ι, _, u, v, hu, hv, hu1, hv1, hcap, hval⟩ := h.witness δ hδ
    exact ⟨Lp ℂ 2 μ, inferInstance, inferInstance, T, Unimod μ, ι, inferInstance, _, _, hcap,
      approximable_coordLp μ hu hv hu1 hv1, hval⟩

/-- **The lower transfer in `L²`.**  `1 / B ≤ K` from the measure-theoretic inputs. -/
theorem transfer_lower_L2 {B K : ℝ} (hT : TransferInputsL2 B) (hK : IsGrothendieckBound K) :
    1 / B ≤ K :=
  transfer_lower hT.toTransferInputs hK

/-- The strict lower endpoint from the measure-theoretic inputs at the certified cap. -/
theorem lower_bound_of_transferL2 {K : ℝ} (hT : TransferInputsL2 (Bcap : ℝ))
    (hK : IsGrothendieckBound K) : (Llow : ℝ) < K :=
  lower_bound_of_transfer hT.toTransferInputs hK

end

end Grothe.Lower
