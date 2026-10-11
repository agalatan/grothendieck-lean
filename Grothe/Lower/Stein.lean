import Grothe.Lower.Law

/-!
# The Stein cuts from the fluctuation bound and the radial integration by parts

For a normalized cubic chaos `q` of bidegree `(2,1)` and `U = |q|²`, the Stein-cut inequalities
(`SteinCut`) follow from two analytic inputs (`SteinInputs`) by a completion of squares.  With a
test `φ`, its primitive `Φ`, `Y(u) = φ(u) − Φ(u)/u`, `X = φ(U) + β'` and `s = (E U² − 2)/3`,

  `E[X² + 2Y² + 2α(Φ − φ)] + α²s = E[(X + αv)² + 2(Y + αr/2)²] + α²(s − E v² − ½ E r²) ≥ 0`.

`cutPhi`, `cutY`, `cutGap` are `φ`, `Y`, `Φ − φ` on the mesh cells, as functions of `v = √u`.
-/

open MeasureTheory

namespace Grothe.Lower

/-- The cell of the test `(vs, z)` containing `v`. -/
noncomputable def cellAt (vs z : List ℚ) (v : ℝ) : CutCell :=
  (cutCells vs z).getD (pickIdx vs v) ⟨0, 0, 0⟩

/-- The test `φ(v²)`. -/
noncomputable def cutPhi (vs z : List ℚ) (v : ℝ) : ℝ :=
  (cellAt vs z v).A + (cellAt vs z v).B * v ^ 2

/-- `Y(v²) = φ(v²) − Φ(v²)/v²` (zero at `v² = 0`). -/
noncomputable def cutY (vs z : List ℚ) (v : ℝ) : ℝ :=
  if v ^ 2 = 0 then 0 else
    (cellAt vs z v).A + (cellAt vs z v).B * v ^ 2
      - ((cellAt vs z v).e0 + (cellAt vs z v).A * v ^ 2 + (cellAt vs z v).B / 2 * (v ^ 2) ^ 2)
        / v ^ 2

/-- `Φ(v²) − φ(v²)`. -/
noncomputable def cutGap (vs z : List ℚ) (v : ℝ) : ℝ :=
  (cellAt vs z v).e0 + (cellAt vs z v).A * v ^ 2 + (cellAt vs z v).B / 2 * (v ^ 2) ^ 2
    - ((cellAt vs z v).A + (cellAt vs z v).B * v ^ 2)

lemma cutG_eq (vs z : List ℚ) (v : ℝ) :
    cutG vs z v = (cutPhi vs z v + (z.getD vs.length 0 : ℚ)) ^ 2 + 2 * cutY vs z v ^ 2
      + 2 * (z.getD (vs.length + 1) 0 : ℚ) * cutGap vs z v
      + (z.getD (vs.length + 1) 0 : ℚ) ^ 2 / 3 * ((v ^ 2) ^ 2 - 2) := by
  simp only [cutG, cellG, cutPhi, cutY, cutGap, cellAt]

/-! ### Measurability -/

open Classical in
lemma measurable_pickIdx : ∀ vs : List ℚ, Measurable (pickIdx vs)
  | [] => measurable_const
  | t :: rest => by
    have h := measurable_pickIdx rest
    change Measurable fun v : ℝ => if v < (t : ℝ) then 0 else pickIdx rest v + 1
    exact Measurable.ite (measurableSet_lt measurable_id measurable_const) measurable_const
      ((measurable_of_countable (· + 1)).comp h)

/-- A function given cell by cell by measurable pieces is measurable. -/
lemma measurable_cellwise (vs z : List ℚ) (F : CutCell → ℝ → ℝ) (hF : ∀ c, Measurable (F c)) :
    Measurable fun v => F (cellAt vs z v) v := by
  have h : Measurable fun p : ℕ × ℝ => F ((cutCells vs z).getD p.1 ⟨0, 0, 0⟩) p.2 :=
    measurable_from_prod_countable_right fun k => hF ((cutCells vs z).getD k ⟨0, 0, 0⟩)
  exact h.comp ((measurable_pickIdx vs).prodMk measurable_id)

lemma measurable_cutPhi (vs z : List ℚ) : Measurable (cutPhi vs z) :=
  measurable_cellwise vs z (fun c v => c.A + c.B * v ^ 2) fun _ => by fun_prop

lemma measurable_cutGap (vs z : List ℚ) : Measurable (cutGap vs z) :=
  measurable_cellwise vs z
    (fun c v => c.e0 + c.A * v ^ 2 + c.B / 2 * (v ^ 2) ^ 2 - (c.A + c.B * v ^ 2)) fun _ => by
      fun_prop

lemma measurable_cutY (vs z : List ℚ) : Measurable (cutY vs z) :=
  measurable_cellwise vs z
    (fun c v => if v ^ 2 = 0 then 0 else
      c.A + c.B * v ^ 2 - (c.e0 + c.A * v ^ 2 + c.B / 2 * (v ^ 2) ^ 2) / v ^ 2) fun _ =>
    Measurable.ite (measurableSet_eq_fun (by fun_prop) measurable_const) measurable_const
      (by fun_prop)

/-! ### Growth bounds -/

/-- A bound for the coefficients of all cells. -/
noncomputable def cellBound (vs z : List ℚ) : ℝ :=
  ((cutCells vs z).map fun c => |(c.A : ℝ)| + |(c.B : ℝ)| + |(c.e0 : ℝ)|).sum

lemma cellAt_le (vs z : List ℚ) (v : ℝ) :
    |((cellAt vs z v).A : ℝ)| + |((cellAt vs z v).B : ℝ)| + |((cellAt vs z v).e0 : ℝ)|
      ≤ cellBound vs z := by
  have hk : pickIdx vs v < (cutCells vs z).length := by
    rw [cutCells_length]; exact Nat.lt_succ_of_le (pickIdx_le vs v)
  have hm : (cutCells vs z).getD (pickIdx vs v) ⟨0, 0, 0⟩ ∈ cutCells vs z := by
    rw [List.getD_eq_getElem _ _ hk]; exact List.getElem_mem hk
  exact List.single_le_sum (fun x hx => by
    obtain ⟨c, -, rfl⟩ := List.mem_map.1 hx; positivity) _
    (List.mem_map.2 ⟨_, hm, rfl⟩)

lemma cellBound_nonneg (vs z : List ℚ) : 0 ≤ cellBound vs z :=
  le_trans (by positivity) (cellAt_le vs z 0)

lemma cutPhi_le (vs z : List ℚ) (v : ℝ) : |cutPhi vs z v| ≤ cellBound vs z * (1 + v ^ 2) := by
  have h := cellAt_le vs z v
  have hu : (0 : ℝ) ≤ v ^ 2 := sq_nonneg v
  calc |cutPhi vs z v| ≤ |((cellAt vs z v).A : ℝ)| + |((cellAt vs z v).B : ℝ)| * v ^ 2 := by
        unfold cutPhi
        refine (abs_add_le _ _).trans ?_
        rw [abs_mul, abs_of_nonneg hu]
    _ ≤ cellBound vs z * (1 + v ^ 2) := by
        nlinarith [abs_nonneg ((cellAt vs z v).A : ℝ), abs_nonneg ((cellAt vs z v).B : ℝ),
          abs_nonneg ((cellAt vs z v).e0 : ℝ)]

lemma cutGap_le (vs z : List ℚ) (v : ℝ) :
    |cutGap vs z v| ≤ 2 * cellBound vs z * (1 + (v ^ 2) ^ 2) := by
  have h := cellAt_le vs z v
  have hu : (0 : ℝ) ≤ v ^ 2 := sq_nonneg v
  unfold cutGap
  generalize ((cellAt vs z v).A : ℝ) = a at h ⊢
  generalize ((cellAt vs z v).B : ℝ) = b at h ⊢
  generalize ((cellAt vs z v).e0 : ℝ) = e at h ⊢
  generalize v ^ 2 = u at hu ⊢
  have e1 : e + a * u + b / 2 * u ^ 2 - (a + b * u) = e + a * (u - 1) + b * (u ^ 2 / 2 - u) := by
    ring
  rw [e1]
  have h1 : |u - 1| ≤ 1 + u ^ 2 := by rw [abs_le]; constructor <;> nlinarith [sq_nonneg (u - 1)]
  have h2 : |u ^ 2 / 2 - u| ≤ 1 + u ^ 2 := by
    rw [abs_le]; constructor <;> nlinarith [sq_nonneg (u - 1)]
  calc |e + a * (u - 1) + b * (u ^ 2 / 2 - u)|
      ≤ |e| + |a| * |u - 1| + |b| * |u ^ 2 / 2 - u| := by
        refine (abs_add_le _ _).trans ?_
        refine add_le_add ((abs_add_le _ _).trans ?_) (abs_mul _ _).le
        rw [abs_mul]
    _ ≤ 2 * cellBound vs z * (1 + u ^ 2) := by
        nlinarith [abs_nonneg a, abs_nonneg b, abs_nonneg e, mul_le_mul_of_nonneg_left h1
          (abs_nonneg a), mul_le_mul_of_nonneg_left h2 (abs_nonneg b), sq_nonneg u]

lemma cutY_le_zero (vs z : List ℚ) (v : ℝ) (hk : pickIdx vs v = 0) :
    |cutY vs z v| ≤ cellBound vs z * (1 + v ^ 2) := by
  have h := cellAt_le vs z v
  have he : ((cellAt vs z v).e0 : ℝ) = 0 := by
    unfold cellAt; rw [hk, cutCells_head_e0]; simp
  have hu : (0 : ℝ) ≤ v ^ 2 := sq_nonneg v
  have hY : cutY vs z v = (cellAt vs z v).B / 2 * v ^ 2 := by
    unfold cutY
    rw [he]
    split_ifs with h0
    · rw [h0]; ring
    · have hv0 : v ≠ 0 := fun hv => h0 (by rw [hv]; ring)
      field_simp
      ring
  rw [hY, abs_mul, abs_of_nonneg hu, abs_div, abs_two]
  nlinarith [abs_nonneg ((cellAt vs z v).A : ℝ), abs_nonneg ((cellAt vs z v).B : ℝ),
    abs_nonneg ((cellAt vs z v).e0 : ℝ),
    mul_nonneg (abs_nonneg ((cellAt vs z v).B : ℝ)) hu]

lemma cutY_le_pos (vs z : List ℚ) (v t : ℝ) (ht : 0 < t) (hv : t ≤ v) :
    |cutY vs z v| ≤ cellBound vs z * (2 + 1 / t ^ 2) * (1 + v ^ 2) := by
  have h := cellAt_le vs z v
  have hu : t ^ 2 ≤ v ^ 2 := pow_le_pow_left₀ ht.le hv 2
  have ht2 : 0 < t ^ 2 := by positivity
  have hu0 : v ^ 2 ≠ 0 := (ht2.trans_le hu).ne'
  unfold cutY
  simp only [hu0, ↓reduceIte]
  generalize ((cellAt vs z v).A : ℝ) = a at h ⊢
  generalize ((cellAt vs z v).B : ℝ) = b at h ⊢
  generalize ((cellAt vs z v).e0 : ℝ) = e at h ⊢
  generalize v ^ 2 = u at hu hu0 ⊢
  have hup : 0 < u := ht2.trans_le hu
  have e1 : a + b * u - (e + a * u + b / 2 * u ^ 2) / u = b / 2 * u - e / u := by
    field_simp; ring
  have hinv : 1 / u ≤ 1 / t ^ 2 := one_div_le_one_div_of_le ht2 hu
  have h3 : |e / u| ≤ |e| * (1 / t ^ 2) := by
    rw [abs_div, abs_of_pos hup, div_eq_mul_one_div]
    exact mul_le_mul_of_nonneg_left hinv (abs_nonneg e)
  have hM : 0 ≤ cellBound vs z := le_trans (by positivity) h
  have hti : 0 ≤ 1 / t ^ 2 := by positivity
  rw [e1]
  calc |b / 2 * u - e / u| ≤ |b| / 2 * u + |e| * (1 / t ^ 2) := by
        refine (abs_sub _ _).trans (add_le_add ?_ h3)
        rw [abs_mul, abs_div, abs_two, abs_of_pos hup]
    _ ≤ cellBound vs z * (2 + 1 / t ^ 2) * (1 + u) := by
        have hb : |b| ≤ cellBound vs z := by linarith [abs_nonneg a, abs_nonneg e]
        have hee : |e| ≤ cellBound vs z := by linarith [abs_nonneg a, abs_nonneg b]
        nlinarith [mul_le_mul_of_nonneg_right hb hup.le, mul_le_mul_of_nonneg_right hee hti,
          mul_nonneg hM hup.le, mul_nonneg hM hti, mul_nonneg (mul_nonneg hM hti) hup.le,
          abs_nonneg b, abs_nonneg e]

lemma cutY_le (vs z : List ℚ) (hvs : meshOK 0 vs = true) :
    ∃ C : ℝ, ∀ v : ℝ, |cutY vs z v| ≤ C * (1 + v ^ 2) := by
  have hM := cellBound_nonneg vs z
  cases vs with
  | nil => exact ⟨_, fun v => cutY_le_zero [] z v rfl⟩
  | cons t rest =>
    have ht : (0 : ℝ) < t := by
      simp only [meshOK, Bool.and_eq_true, decide_eq_true_eq] at hvs
      exact_mod_cast hvs.1
    refine ⟨cellBound (t :: rest) z * (2 + 1 / (t : ℝ) ^ 2), fun v => ?_⟩
    by_cases hv : v < (t : ℝ)
    · have hk : pickIdx (t :: rest) v = 0 := by simp [pickIdx, hv]
      refine (cutY_le_zero _ z v hk).trans ?_
      have hti : (0 : ℝ) ≤ 1 / (t : ℝ) ^ 2 := by positivity
      nlinarith [mul_nonneg hM hti, sq_nonneg v, mul_nonneg (mul_nonneg hM hti) (sq_nonneg v),
        mul_nonneg hM (sq_nonneg v)]
    · exact cutY_le_pos _ z v t ht (not_lt.1 hv)

/-! ### The inputs and the completion of squares -/

variable {Ω : Type*} [MeasurableSpace Ω]

/-- **The analytic inputs of the Stein cuts** for `U = |q|²`, `q` a normalized cubic chaos of
bidegree `(2,1)`.  With the carré du champ `Γ` of the Ornstein–Uhlenbeck operator,
`w = Γ(q, q̄)/3` and `c = Γ(q, q)/3`, the two real variables are `v = w − 1` and
`r = Re(c q̄²/U)`.

* `mean`, `fluct` (fluctuation bound): `E w = 1` and `Var(w) + ½ E|c|² ≤ (E U² − 2)/3`, whence
  `E v² + ½ E r² ≤ (E U² − 2)/3`.
* `parts` (Gaussian integration by parts for the radial test `h = Φ/u`): for every test,
  `E[Φ(U) − φ(U)] = E[v φ(U) + r Y(U)]`, `Y = φ − Φ/u`. -/
structure SteinInputs (μ : Measure Ω) (U : Ω → ℝ) : Prop where
  ex : ∃ v r : Ω → ℝ, MemLp v 2 μ ∧ MemLp r 2 μ ∧ ∫ ω, v ω ∂μ = 0 ∧
    ∫ ω, v ω ^ 2 ∂μ + 1 / 2 * ∫ ω, r ω ^ 2 ∂μ ≤ (∫ ω, U ω ^ 2 ∂μ - 2) / 3 ∧
    ∀ vs z : List ℚ, meshOK 0 vs = true →
      ∫ ω, cutGap vs z (√(U ω)) ∂μ
        = ∫ ω, (v ω * cutPhi vs z (√(U ω)) + r ω * cutY vs z (√(U ω))) ∂μ

variable (μ : Measure Ω) [IsProbabilityMeasure μ] {U : Ω → ℝ} {x : ℝ}

/-- A measurable function of `√U` of quadratic growth in `√U` is square integrable. -/
lemma memLp_of_growth (hM : Moments μ U x) (f : ℝ → ℝ) (hf : Measurable f) (C : ℝ)
    (hC : ∀ v, |f v| ≤ C * (1 + v ^ 2)) : MemLp (fun ω => f (√(U ω))) 2 μ := by
  have hm : AEStronglyMeasurable (fun ω => f (√(U ω))) μ :=
    (hf.comp_aemeasurable hM.i1.aestronglyMeasurable.aemeasurable.sqrt).aestronglyMeasurable
  rw [memLp_two_iff_integrable_sq hm]
  have hg : Integrable (fun ω => C ^ 2 * (1 + 2 * U ω + U ω ^ 2)) μ :=
    (((integrable_const 1).add (hM.i1.const_mul 2)).add hM.i2).const_mul _
  refine hg.mono' (hm.pow 2) (Filter.Eventually.of_forall fun ω => ?_)
  have h := hC (√(U ω))
  rw [Real.sq_sqrt (hM.nonneg ω)] at h
  have h0 : 0 ≤ C * (1 + U ω) := (abs_nonneg _).trans h
  rw [Real.norm_eq_abs, abs_pow, show C ^ 2 * (1 + 2 * U ω + U ω ^ 2) = (C * (1 + U ω)) ^ 2 by
    ring]
  exact pow_le_pow_left₀ (abs_nonneg _) h 2

omit [IsProbabilityMeasure μ] in
/-- Integral of a fixed linear combination of seven integrable functions. -/
lemma integral_comb (P Q F G A V R W : Ω → ℝ) (a : ℝ) (hP : Integrable P μ)
    (hQ : Integrable Q μ) (hF : Integrable F μ) (hG : Integrable G μ) (hA : Integrable A μ)
    (hV : Integrable V μ) (hR : Integrable R μ) (hW : Integrable W μ) :
    Integrable (fun ω => P ω + 2 * Q ω - 2 * a * F ω - 2 * a * G ω + 2 * a * A ω - a ^ 2 * V ω
      - a ^ 2 / 2 * R ω + a ^ 2 / 3 * W ω) μ ∧
    ∫ ω, (P ω + 2 * Q ω - 2 * a * F ω - 2 * a * G ω + 2 * a * A ω - a ^ 2 * V ω
      - a ^ 2 / 2 * R ω + a ^ 2 / 3 * W ω) ∂μ
      = ∫ ω, P ω ∂μ + 2 * ∫ ω, Q ω ∂μ - 2 * a * ∫ ω, F ω ∂μ - 2 * a * ∫ ω, G ω ∂μ
        + 2 * a * ∫ ω, A ω ∂μ - a ^ 2 * ∫ ω, V ω ∂μ - a ^ 2 / 2 * ∫ ω, R ω ∂μ
        + a ^ 2 / 3 * ∫ ω, W ω ∂μ := by
  have h1 : Integrable (fun ω => P ω + 2 * Q ω) μ := hP.add (hQ.const_mul 2)
  have h2 : Integrable (fun ω => P ω + 2 * Q ω - 2 * a * F ω) μ := h1.sub (hF.const_mul _)
  have h3 : Integrable (fun ω => P ω + 2 * Q ω - 2 * a * F ω - 2 * a * G ω) μ :=
    h2.sub (hG.const_mul _)
  have h4 : Integrable (fun ω => P ω + 2 * Q ω - 2 * a * F ω - 2 * a * G ω + 2 * a * A ω) μ :=
    h3.add (hA.const_mul _)
  have h5 : Integrable (fun ω => P ω + 2 * Q ω - 2 * a * F ω - 2 * a * G ω + 2 * a * A ω
      - a ^ 2 * V ω) μ := h4.sub (hV.const_mul _)
  have h6 : Integrable (fun ω => P ω + 2 * Q ω - 2 * a * F ω - 2 * a * G ω + 2 * a * A ω
      - a ^ 2 * V ω - a ^ 2 / 2 * R ω) μ := h5.sub (hR.const_mul _)
  refine ⟨h6.add (hW.const_mul _), ?_⟩
  rw [integral_add h6 (hW.const_mul _), integral_sub h5 (hR.const_mul _),
    integral_sub h4 (hV.const_mul _), integral_add h3 (hA.const_mul _),
    integral_sub h2 (hG.const_mul _), integral_sub h1 (hF.const_mul _),
    integral_add hP (hQ.const_mul _), integral_const_mul, integral_const_mul,
    integral_const_mul, integral_const_mul, integral_const_mul, integral_const_mul,
    integral_const_mul]

/-- **The Stein cuts follow from the analytic inputs**, by completion of squares. -/
theorem steinCut_of_inputs (hM : Moments μ U x) (hS : SteinInputs μ U) : SteinCut μ U := by
  obtain ⟨v, r, hv, hr, hv0, hfl, hparts⟩ := hS.ex
  intro vs z hvs
  obtain ⟨be, hbe⟩ : ∃ be : ℝ, be = (z.getD vs.length 0 : ℚ) := ⟨_, rfl⟩
  obtain ⟨al, hal⟩ : ∃ al : ℝ, al = (z.getD (vs.length + 1) 0 : ℚ) := ⟨_, rfl⟩
  have hφ : MemLp (fun ω => cutPhi vs z (√(U ω))) 2 μ :=
    memLp_of_growth μ hM _ (measurable_cutPhi vs z) _ (cutPhi_le vs z)
  obtain ⟨CY, hCY⟩ := cutY_le vs z hvs
  have hY : MemLp (fun ω => cutY vs z (√(U ω))) 2 μ :=
    memLp_of_growth μ hM _ (measurable_cutY vs z) _ hCY
  have hA : Integrable (fun ω => cutGap vs z (√(U ω))) μ := by
    have hm : AEStronglyMeasurable (fun ω => cutGap vs z (√(U ω))) μ :=
      ((measurable_cutGap vs z).comp_aemeasurable
        hM.i1.aestronglyMeasurable.aemeasurable.sqrt).aestronglyMeasurable
    refine (((integrable_const 1).add hM.i2).const_mul (2 * cellBound vs z)).mono' hm
      (Filter.Eventually.of_forall fun ω => ?_)
    have h := cutGap_le vs z (√(U ω))
    rwa [Real.sq_sqrt (hM.nonneg ω)] at h
  have hX : MemLp (fun ω => cutPhi vs z (√(U ω)) + be) 2 μ := hφ.add (memLp_const be)
  have hP : MemLp (fun ω => cutPhi vs z (√(U ω)) + be + al * v ω) 2 μ := hX.add (hv.const_mul al)
  have hQ : MemLp (fun ω => cutY vs z (√(U ω)) + al / 2 * r ω) 2 μ := hY.add (hr.const_mul _)
  have iP := hP.integrable_sq
  have iQ := hQ.integrable_sq
  have ivφ : Integrable (fun ω => v ω * cutPhi vs z (√(U ω))) μ := hv.integrable_mul hφ
  have ivX : Integrable (fun ω => v ω * (cutPhi vs z (√(U ω)) + be)) μ := hv.integrable_mul hX
  have irY : Integrable (fun ω => r ω * cutY vs z (√(U ω))) μ := hr.integrable_mul hY
  have iv2 := hv.integrable_sq
  have ir2 := hr.integrable_sq
  have iv : Integrable v μ := hv.integrable one_le_two
  have e : (fun ω => cutG vs z (√(U ω))) = fun ω =>
      (cutPhi vs z (√(U ω)) + be + al * v ω) ^ 2
        + 2 * (cutY vs z (√(U ω)) + al / 2 * r ω) ^ 2
        - 2 * al * (v ω * (cutPhi vs z (√(U ω)) + be))
        - 2 * al * (r ω * cutY vs z (√(U ω)))
        + 2 * al * cutGap vs z (√(U ω))
        - al ^ 2 * v ω ^ 2 - al ^ 2 / 2 * r ω ^ 2 + al ^ 2 / 3 * U ω ^ 2 - 2 * al ^ 2 / 3 := by
    funext ω
    rw [cutG_eq, ← hbe, ← hal, Real.sq_sqrt (hM.nonneg ω)]
    ring
  obtain ⟨hI, hE⟩ := integral_comb μ _ _ _ _ _ _ _ _ al iP iQ ivX irY hA iv2 ir2 hM.i2
  rw [e]
  refine ⟨hI.sub (integrable_const _), ?_⟩
  have eX : ∫ ω, v ω * (cutPhi vs z (√(U ω)) + be) ∂μ
      = ∫ ω, v ω * cutPhi vs z (√(U ω)) ∂μ := by
    have : (fun ω => v ω * (cutPhi vs z (√(U ω)) + be))
        = fun ω => v ω * cutPhi vs z (√(U ω)) + be * v ω := funext fun ω => by ring
    rw [this, integral_add ivφ (iv.const_mul be), integral_const_mul, hv0, mul_zero, add_zero]
  have eA := hparts vs z hvs
  rw [integral_add ivφ irY] at eA
  have nP : 0 ≤ ∫ ω, (cutPhi vs z (√(U ω)) + be + al * v ω) ^ 2 ∂μ :=
    integral_nonneg fun ω => sq_nonneg _
  have nQ : 0 ≤ ∫ ω, (cutY vs z (√(U ω)) + al / 2 * r ω) ^ 2 ∂μ :=
    integral_nonneg fun ω => sq_nonneg _
  rw [integral_sub hI (integrable_const _), hE, integral_const, probReal_univ, one_smul, eX, eA]
  nlinarith [mul_nonneg (sq_nonneg al)
    (sub_nonneg.2 hfl : 0 ≤ (∫ ω, U ω ^ 2 ∂μ - 2) / 3
      - (∫ ω, v ω ^ 2 ∂μ + 1 / 2 * ∫ ω, r ω ^ 2 ∂μ))]

end Grothe.Lower
