import Grothe.Lower.Law

/-!
# The Stein cuts from the spectral budgets and the radial integration by parts

For a normalized cubic chaos `q` of bidegree `(2,1)` and `U = |q|²`, the Stein-cut inequalities
(`SteinCut`) follow from two analytic inputs (`SteinInputs`: the separate spectral budgets of
`v = w − 1` and `r`, and the radial integration by parts) by completing squares.  With a
test `φ`, its primitive `Φ`, `Y(u) = φ(u) − Φ(u)/u`, `X = φ(U) + β'` and `s = (E U² − 2)/3`,

  `E[X² + 2Y² + 2α(Φ − φ)] + α²s = E[(X + αv)² + 2(Y + αr/2)²] + α²(s − E v² − ½ E r²) ≥ 0`

(`cut_of_inputs`; `E v² + ½ E r² ≤ s` is the sum of the budgets), and for the spectral cuts
the two squares are completed separately against the two budgets, with the covariance order
`E[rU] ≤ s` as a third nonnegative term (`spec_of_inputs`).  A node citing a further law budget
`λ E v² + μ E r² ≤ a P + b₀ Q` (`GramInputs`: a contraction-Gram certificate or the coupled
one-parameter family of `Gram.lean`) completes the squares with shifted coefficients
(`gspec_of_inputs`).

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
`r = Re(c q̄²/U)`; write `P = E[vU]`, `Q = E[rU]`.

* the separate spectral budgets: `E v = 0`, `E v² ≤ (2/3) P`, `E r² ≤ (2/3) Q` and
  `2P + Q = E U² − 2` (in the chaos expansion the gaps are `‖U₄‖²/9` and
  `‖(q²)₄‖²/9 + E(|c|² − r²)`);
* the covariance order `Q ≤ (E U² − 2)/3`, i.e. `Q ≤ P`;
* the Gaussian integration by parts for the radial test `h = Φ/u`: for every test,
  `E[Φ(U) − φ(U)] = E[v φ(U) + r Y(U)]`, `Y = φ − Φ/u`. -/
structure SteinInputs (μ : Measure Ω) (U : Ω → ℝ) : Prop where
  ex : ∃ v r : Ω → ℝ, MemLp v 2 μ ∧ MemLp r 2 μ ∧ ∫ ω, v ω ∂μ = 0 ∧
    ∫ ω, v ω ^ 2 ∂μ ≤ 2 / 3 * ∫ ω, v ω * U ω ∂μ ∧
    ∫ ω, r ω ^ 2 ∂μ ≤ 2 / 3 * ∫ ω, r ω * U ω ∂μ ∧
    2 * ∫ ω, v ω * U ω ∂μ + ∫ ω, r ω * U ω ∂μ = ∫ ω, U ω ^ 2 ∂μ - 2 ∧
    ∫ ω, r ω * U ω ∂μ ≤ (∫ ω, U ω ^ 2 ∂μ - 2) / 3 ∧
    ∀ vs z : List ℚ, meshOK 0 vs = true →
      ∫ ω, cutGap vs z (√(U ω)) ∂μ
        = ∫ ω, (v ω * cutPhi vs z (√(U ω)) + r ω * cutY vs z (√(U ω))) ∂μ

/-- **The analytic inputs of all Stein cuts**: the inputs of `SteinInputs` for the same pair
`(v, r)`, together with the two further universal law budgets of genuine circular cubics
(`Gram.lean`):

* every contraction-Gram certificate `g` accepted by `gramCert λ μ g` gives
  `λ E v² + μ E r² ≤ A P + B Q`;
* the coupled family `E v² ≤ a_s P − b_s Q`, `a_s = (s + 5)/9`, `b_s = (s + 1/2 − 3/s)/9`,
  for every rational `s ≥ 2`. -/
structure GramInputs (μ : Measure Ω) (U : Ω → ℝ) : Prop where
  ex : ∃ v r : Ω → ℝ, MemLp v 2 μ ∧ MemLp r 2 μ ∧ ∫ ω, v ω ∂μ = 0 ∧
    ∫ ω, v ω ^ 2 ∂μ ≤ 2 / 3 * ∫ ω, v ω * U ω ∂μ ∧
    ∫ ω, r ω ^ 2 ∂μ ≤ 2 / 3 * ∫ ω, r ω * U ω ∂μ ∧
    2 * ∫ ω, v ω * U ω ∂μ + ∫ ω, r ω * U ω ∂μ = ∫ ω, U ω ^ 2 ∂μ - 2 ∧
    ∫ ω, r ω * U ω ∂μ ≤ (∫ ω, U ω ^ 2 ∂μ - 2) / 3 ∧
    (∀ vs z : List ℚ, meshOK 0 vs = true →
      ∫ ω, cutGap vs z (√(U ω)) ∂μ
        = ∫ ω, (v ω * cutPhi vs z (√(U ω)) + r ω * cutY vs z (√(U ω))) ∂μ) ∧
    (∀ (lam mu : ℚ) (g : GramData), gramCert lam mu g = true →
      lam * ∫ ω, v ω ^ 2 ∂μ + mu * ∫ ω, r ω ^ 2 ∂μ
        ≤ g.A * ∫ ω, v ω * U ω ∂μ + g.B * ∫ ω, r ω * U ω ∂μ) ∧
    ∀ s : ℚ, 2 ≤ s → ∫ ω, v ω ^ 2 ∂μ
      ≤ (s + 5) / 9 * ∫ ω, v ω * U ω ∂μ - (s + 1 / 2 - 3 / s) / 9 * ∫ ω, r ω * U ω ∂μ

lemma GramInputs.toSteinInputs {μ : Measure Ω} {U : Ω → ℝ} (h : GramInputs μ U) :
    SteinInputs μ U := by
  obtain ⟨v, r, hv, hr, hv0, hbv, hbr, hsum, hcov, hparts, -, -⟩ := h.ex
  exact ⟨v, r, hv, hr, hv0, hbv, hbr, hsum, hcov, hparts⟩

/-- **The cited budget from the inputs**: for a budget `bud` passing its exact check,
`λ E v² + μ E r² ≤ (2λ/3 + 2af) P + (2μ/3 − 2ag) Q` with the shifts `af = bud.af λ`,
`ag = bud.ag μ`. -/
lemma budget_of_bud (lam mu : ℚ) (hlam : 0 ≤ lam) (hmu : 0 ≤ mu) (bud : GBud)
    (hok : bud.ok lam mu = true) (V R P Q : ℝ) (hsepv : V ≤ 2 / 3 * P) (hsepr : R ≤ 2 / 3 * Q)
    (hgram : ∀ (lam mu : ℚ) (g : GramData), gramCert lam mu g = true →
      lam * V + mu * R ≤ g.A * P + g.B * Q)
    (hfam : ∀ s : ℚ, 2 ≤ s → V ≤ (s + 5) / 9 * P - (s + 1 / 2 - 3 / s) / 9 * Q) :
    (lam : ℝ) * V + mu * R ≤ (2 * lam / 3 + 2 * bud.af lam) * P + (2 * mu / 3 - 2 * bud.ag mu) * Q := by
  have hlamR : (0 : ℝ) ≤ lam := by exact_mod_cast hlam
  have hmuR : (0 : ℝ) ≤ mu := by exact_mod_cast hmu
  have h1 := mul_le_mul_of_nonneg_left hsepv hlamR
  have h2 := mul_le_mul_of_nonneg_left hsepr hmuR
  cases bud with
  | sep =>
    simp only [GBud.af, GBud.ag, Rat.cast_zero]
    linarith
  | gram g =>
    have h := hgram lam mu g hok
    simp only [GBud.af, GBud.ag]
    push_cast
    linarith
  | coupled se =>
    simp only [GBud.ok, Bool.and_eq_true, decide_eq_true_eq] at hok
    obtain ⟨hoks, hle⟩ := hok
    have hc := coupled_sum V P Q hfam se hoks
    have hleR : (budSum1 se : ℝ) ≤ lam := by exact_mod_cast hle
    have h3 := mul_le_mul_of_nonneg_left hsepv (sub_nonneg.2 hleR)
    simp only [GBud.af, GBud.ag]
    linarith

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

/-- The cuts `cutG` from the analytic inputs, by completion of squares: with
`s = (E U² − 2)/3 ≥ E v² + ½ E r²`,

  `E[X² + 2Y² + 2α(Φ − φ)] + α²s = E[(X + αv)² + 2(Y + αr/2)²] + α²(s − E v² − ½ E r²)`. -/
theorem cut_of_inputs (hM : Moments μ U x) (hS : SteinInputs μ U) (vs z : List ℚ)
    (hvs : meshOK 0 vs = true) :
    Integrable (fun ω => cutG vs z (√(U ω))) μ ∧ 0 ≤ ∫ ω, cutG vs z (√(U ω)) ∂μ := by
  obtain ⟨v, r, hv, hr, hv0, hbv, hbr, hsum, -, hparts⟩ := hS.ex
  have hfl : ∫ ω, v ω ^ 2 ∂μ + 1 / 2 * ∫ ω, r ω ^ 2 ∂μ ≤ (∫ ω, U ω ^ 2 ∂μ - 2) / 3 := by
    linarith
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

omit [IsProbabilityMeasure μ] in
lemma memLp_U (hM : Moments μ U x) : MemLp U 2 μ :=
  (memLp_two_iff_integrable_sq hM.i1.aestronglyMeasurable).2 hM.i2

lemma specG_eq (vs z : List ℚ) (lam mu t be nu : ℚ) (v : ℝ) :
    specG vs z lam mu t be nu v
      = (-(cutPhi vs z v + be) / 2 + (2 * t + lam / 3) * v ^ 2) ^ 2 / lam
        + (-cutY vs z v / 2 + (t + mu / 3 - nu / 2) * v ^ 2) ^ 2 / mu
        + cutGap vs z v + (nu / 3 - 2 * t) * ((v ^ 2) ^ 2 - 2) := by
  simp only [specG, specCellG, cutPhi, cutY, cutGap, cellAt]

lemma gspecG_eq (vs z : List ℚ) (lam mu t be nu af ag : ℚ) (v : ℝ) :
    gspecG vs z lam mu t be nu af ag v
      = (-(cutPhi vs z v + be) / 2 + (2 * t + lam / 3 + af) * v ^ 2) ^ 2 / lam
        + (-cutY vs z v / 2 + (t + mu / 3 - nu / 2 - ag) * v ^ 2) ^ 2 / mu
        + cutGap vs z v + (nu / 3 - 2 * t) * ((v ^ 2) ^ 2 - 2) := by
  simp only [gspecG, gspecCellG, cutPhi, cutY, cutGap, cellAt]

omit [IsProbabilityMeasure μ] in
lemma integral_add8 (f1 f2 f3 f4 f5 f6 f7 f8 : Ω → ℝ) (h1 : Integrable f1 μ)
    (h2 : Integrable f2 μ) (h3 : Integrable f3 μ) (h4 : Integrable f4 μ) (h5 : Integrable f5 μ)
    (h6 : Integrable f6 μ) (h7 : Integrable f7 μ) (h8 : Integrable f8 μ) :
    Integrable (fun ω => f1 ω + f2 ω + f3 ω + f4 ω + f5 ω + f6 ω + f7 ω + f8 ω) μ ∧
    ∫ ω, (f1 ω + f2 ω + f3 ω + f4 ω + f5 ω + f6 ω + f7 ω + f8 ω) ∂μ
      = ∫ ω, f1 ω ∂μ + ∫ ω, f2 ω ∂μ + ∫ ω, f3 ω ∂μ + ∫ ω, f4 ω ∂μ + ∫ ω, f5 ω ∂μ
        + ∫ ω, f6 ω ∂μ + ∫ ω, f7 ω ∂μ + ∫ ω, f8 ω ∂μ := by
  have g2 : Integrable (fun ω => f1 ω + f2 ω) μ := h1.add h2
  have g3 : Integrable (fun ω => f1 ω + f2 ω + f3 ω) μ := g2.add h3
  have g4 : Integrable (fun ω => f1 ω + f2 ω + f3 ω + f4 ω) μ := g3.add h4
  have g5 : Integrable (fun ω => f1 ω + f2 ω + f3 ω + f4 ω + f5 ω) μ := g4.add h5
  have g6 : Integrable (fun ω => f1 ω + f2 ω + f3 ω + f4 ω + f5 ω + f6 ω) μ := g5.add h6
  have g7 : Integrable (fun ω => f1 ω + f2 ω + f3 ω + f4 ω + f5 ω + f6 ω + f7 ω) μ := g6.add h7
  refine ⟨g7.add h8, ?_⟩
  rw [integral_add g7 h8, integral_add g6 h7, integral_add g5 h6, integral_add g4 h5, integral_add g3 h4,
    integral_add g2 h3, integral_add h1 h2]

/-- The spectral cuts from the analytic inputs: with `f`, `g` as in `specG`, `X = v`, `P = E[vU]`,
`Q = E[rU]` and `χ = E U² − 2`, the exact identity

  `E G(U) = E[λ(X − f/λ)² + μ(r − g/μ)²] + λ((2/3)P − E X²) + μ((2/3)Q − E r²) + ν(χ/3 − Q)`

(using `E X = 0`, the radial integration by parts and `2P + Q = χ`) has every term on the right
nonnegative. -/
theorem spec_of_inputs (hM : Moments μ U x) (hS : SteinInputs μ U) (vs z : List ℚ)
    (lam mu t be nu : ℚ) (hvs : meshOK 0 vs = true) (hlam : 0 < lam) (hmu : 0 < mu)
    (hnu : 0 ≤ nu) :
    Integrable (fun ω => specG vs z lam mu t be nu (√(U ω))) μ ∧
      0 ≤ ∫ ω, specG vs z lam mu t be nu (√(U ω)) ∂μ := by
  obtain ⟨v, r, hv, hr, hv0, hbv, hbr, hsum, hcov, hparts⟩ := hS.ex
  have hlamR : (0 : ℝ) < lam := by exact_mod_cast hlam
  have hmuR : (0 : ℝ) < mu := by exact_mod_cast hmu
  have hU := memLp_U μ hM
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
  obtain ⟨F, hF⟩ : ∃ F : Ω → ℝ,
      F = fun ω => (-1 / 2 : ℝ) * (cutPhi vs z (√(U ω)) + be) + (2 * t + lam / 3) * U ω := ⟨_, rfl⟩
  obtain ⟨Gf, hGf⟩ : ∃ Gf : Ω → ℝ,
      Gf = fun ω => (-1 / 2 : ℝ) * cutY vs z (√(U ω)) + (t + mu / 3 - nu / 2) * U ω := ⟨_, rfl⟩
  have hFm : MemLp F 2 μ := by
    rw [hF]; exact ((hφ.add (memLp_const _)).const_mul _).add (hU.const_mul _)
  have hGm : MemLp Gf 2 μ := by
    rw [hGf]; exact (hY.const_mul _).add (hU.const_mul _)
  have m1 : MemLp (fun ω => v ω - (lam : ℝ)⁻¹ * F ω) 2 μ := hv.sub (hFm.const_mul _)
  have m2 : MemLp (fun ω => r ω - (mu : ℝ)⁻¹ * Gf ω) 2 μ := hr.sub (hGm.const_mul _)
  have ivU : Integrable (fun ω => v ω * U ω) μ := hv.integrable_mul hU
  have irU : Integrable (fun ω => r ω * U ω) μ := hr.integrable_mul hU
  have iv2 := hv.integrable_sq
  have ir2 := hr.integrable_sq
  have iv : Integrable v μ := hv.integrable one_le_two
  have ivφ : Integrable (fun ω => v ω * cutPhi vs z (√(U ω))) μ := hv.integrable_mul hφ
  have irY : Integrable (fun ω => r ω * cutY vs z (√(U ω))) μ := hr.integrable_mul hY
  have i1 : Integrable (fun ω => (lam : ℝ) * (v ω - (lam : ℝ)⁻¹ * F ω) ^ 2) μ :=
    m1.integrable_sq.const_mul _
  have i2 : Integrable (fun ω => (mu : ℝ) * (r ω - (mu : ℝ)⁻¹ * Gf ω) ^ 2) μ :=
    m2.integrable_sq.const_mul _
  have i3 : Integrable (fun ω => (lam : ℝ) * (2 / 3 * (v ω * U ω) - v ω ^ 2)) μ :=
    ((ivU.const_mul _).sub iv2).const_mul _
  have i4 : Integrable (fun ω => (mu : ℝ) * (2 / 3 * (r ω * U ω) - r ω ^ 2)) μ :=
    ((irU.const_mul _).sub ir2).const_mul _
  have ivr : Integrable (fun ω => v ω * cutPhi vs z (√(U ω)) + r ω * cutY vs z (√(U ω))) μ :=
    ivφ.add irY
  have i5 : Integrable (fun ω => cutGap vs z (√(U ω))
      - (v ω * cutPhi vs z (√(U ω)) + r ω * cutY vs z (√(U ω)))) μ := hA.sub ivr
  have i6 : Integrable (fun ω => -(be : ℝ) * v ω) μ := iv.const_mul _
  have iUU : Integrable (fun ω => U ω ^ 2 - 2) μ := hM.i2.sub (integrable_const _)
  have i8 : Integrable (fun ω => (nu : ℝ) * ((U ω ^ 2 - 2) / 3 - r ω * U ω)) μ :=
    ((iUU.div_const 3).sub irU).const_mul _
  have i7 : Integrable (fun ω => 2 * (t : ℝ) * (2 * (v ω * U ω) + r ω * U ω - (U ω ^ 2 - 2))) μ :=
    ((((ivU.const_mul 2).add irU).sub iUU)).const_mul _
  have e : (fun ω => specG vs z lam mu t be nu (√(U ω))) = fun ω =>
      (lam : ℝ) * (v ω - (lam : ℝ)⁻¹ * F ω) ^ 2 + (mu : ℝ) * (r ω - (mu : ℝ)⁻¹ * Gf ω) ^ 2
        + (lam : ℝ) * (2 / 3 * (v ω * U ω) - v ω ^ 2) + (mu : ℝ) * (2 / 3 * (r ω * U ω) - r ω ^ 2)
        + (cutGap vs z (√(U ω)) - (v ω * cutPhi vs z (√(U ω)) + r ω * cutY vs z (√(U ω))))
        + -(be : ℝ) * v ω + 2 * (t : ℝ) * (2 * (v ω * U ω) + r ω * U ω - (U ω ^ 2 - 2))
        + (nu : ℝ) * ((U ω ^ 2 - 2) / 3 - r ω * U ω) := by
    funext ω
    rw [specG_eq, hF, hGf, Real.sq_sqrt (hM.nonneg ω)]
    field_simp
    ring
  obtain ⟨hI, hE⟩ := integral_add8 μ _ _ _ _ _ _ _ _ i1 i2 i3 i4 i5 i6 i7 i8
  rw [e]
  refine ⟨hI, ?_⟩
  rw [hE]
  have n1 : 0 ≤ ∫ ω, (lam : ℝ) * (v ω - (lam : ℝ)⁻¹ * F ω) ^ 2 ∂μ :=
    integral_nonneg fun ω => mul_nonneg hlamR.le (sq_nonneg _)
  have n2 : 0 ≤ ∫ ω, (mu : ℝ) * (r ω - (mu : ℝ)⁻¹ * Gf ω) ^ 2 ∂μ :=
    integral_nonneg fun ω => mul_nonneg hmuR.le (sq_nonneg _)
  have n3 : ∫ ω, (lam : ℝ) * (2 / 3 * (v ω * U ω) - v ω ^ 2) ∂μ
      = lam * (2 / 3 * ∫ ω, v ω * U ω ∂μ - ∫ ω, v ω ^ 2 ∂μ) := by
    rw [integral_const_mul, integral_sub (ivU.const_mul _) iv2, integral_const_mul]
  have n4 : ∫ ω, (mu : ℝ) * (2 / 3 * (r ω * U ω) - r ω ^ 2) ∂μ
      = mu * (2 / 3 * ∫ ω, r ω * U ω ∂μ - ∫ ω, r ω ^ 2 ∂μ) := by
    rw [integral_const_mul, integral_sub (irU.const_mul _) ir2, integral_const_mul]
  have n5 : ∫ ω, (cutGap vs z (√(U ω))
      - (v ω * cutPhi vs z (√(U ω)) + r ω * cutY vs z (√(U ω)))) ∂μ = 0 := by
    rw [integral_sub hA ivr, hparts vs z hvs, sub_self]
  have n6 : ∫ ω, -(be : ℝ) * v ω ∂μ = 0 := by rw [integral_const_mul, hv0, mul_zero]
  have n7 : ∫ ω, 2 * (t : ℝ) * (2 * (v ω * U ω) + r ω * U ω - (U ω ^ 2 - 2)) ∂μ = 0 := by
    have j1 : Integrable (fun ω => 2 * (v ω * U ω)) μ := ivU.const_mul 2
    have j2 : Integrable (fun ω => 2 * (v ω * U ω) + r ω * U ω) μ := j1.add irU
    rw [integral_const_mul, integral_sub j2 iUU, integral_add j1 irU, integral_const_mul,
      integral_sub hM.i2 (integrable_const _), integral_const, probReal_univ, one_smul]
    rw [show 2 * ∫ ω, v ω * U ω ∂μ + ∫ ω, r ω * U ω ∂μ - (∫ ω, U ω ^ 2 ∂μ - 2) = 0 by linarith,
      mul_zero]
  have n8 : ∫ ω, (nu : ℝ) * ((U ω ^ 2 - 2) / 3 - r ω * U ω) ∂μ
      = nu * ((∫ ω, U ω ^ 2 ∂μ - 2) / 3 - ∫ ω, r ω * U ω ∂μ) := by
    rw [integral_const_mul, integral_sub (iUU.div_const 3) irU, integral_div,
      integral_sub hM.i2 (integrable_const _), integral_const, probReal_univ, one_smul]
  have b3 : 0 ≤ (nu : ℝ) * ((∫ ω, U ω ^ 2 ∂μ - 2) / 3 - ∫ ω, r ω * U ω ∂μ) :=
    mul_nonneg (by exact_mod_cast hnu) (by linarith)
  rw [n3, n4, n5, n6, n7, n8]
  have b1 : 0 ≤ (lam : ℝ) * (2 / 3 * ∫ ω, v ω * U ω ∂μ - ∫ ω, v ω ^ 2 ∂μ) :=
    mul_nonneg hlamR.le (by linarith)
  have b2 : 0 ≤ (mu : ℝ) * (2 / 3 * ∫ ω, r ω * U ω ∂μ - ∫ ω, r ω ^ 2 ∂μ) :=
    mul_nonneg hmuR.le (by linarith)
  linarith

/-- The general spectral cut for explicit `v`, `r`: with the shifted `f`, `g` of `gspecG`,

  `E G(U) = E[λ(X − f/λ)² + μ(r − g/μ)²] + (2λ/3 + 2af) P − λ E X² + (2μ/3 − 2ag) Q − μ E r²
            + ν(χ/3 − Q)`

(using `E X = 0`, the radial integration by parts and `2P + Q = χ`), nonnegative under the budget
`λ E X² + μ E r² ≤ (2λ/3 + 2af) P + (2μ/3 − 2ag) Q`. -/
theorem gspec_of_vr (hM : Moments μ U x) (v r : Ω → ℝ) (hv : MemLp v 2 μ) (hr : MemLp r 2 μ)
    (hv0 : ∫ ω, v ω ∂μ = 0)
    (hsum : 2 * ∫ ω, v ω * U ω ∂μ + ∫ ω, r ω * U ω ∂μ = ∫ ω, U ω ^ 2 ∂μ - 2)
    (hcov : ∫ ω, r ω * U ω ∂μ ≤ (∫ ω, U ω ^ 2 ∂μ - 2) / 3)
    (hparts : ∀ vs z : List ℚ, meshOK 0 vs = true →
      ∫ ω, cutGap vs z (√(U ω)) ∂μ
        = ∫ ω, (v ω * cutPhi vs z (√(U ω)) + r ω * cutY vs z (√(U ω))) ∂μ)
    (vs z : List ℚ) (lam mu t be nu af ag : ℚ) (hvs : meshOK 0 vs = true) (hlam : 0 < lam)
    (hmu : 0 < mu) (hnu : 0 ≤ nu)
    (hbud : (lam : ℝ) * ∫ ω, v ω ^ 2 ∂μ + mu * ∫ ω, r ω ^ 2 ∂μ
      ≤ (2 * lam / 3 + 2 * af) * ∫ ω, v ω * U ω ∂μ + (2 * mu / 3 - 2 * ag) * ∫ ω, r ω * U ω ∂μ) :
    Integrable (fun ω => gspecG vs z lam mu t be nu af ag (√(U ω))) μ ∧
      0 ≤ ∫ ω, gspecG vs z lam mu t be nu af ag (√(U ω)) ∂μ := by
  have hlamR : (0 : ℝ) < lam := by exact_mod_cast hlam
  have hmuR : (0 : ℝ) < mu := by exact_mod_cast hmu
  have hU := memLp_U μ hM
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
  obtain ⟨F, hF⟩ : ∃ F : Ω → ℝ,
      F = fun ω => (-1 / 2 : ℝ) * (cutPhi vs z (√(U ω)) + be) + (2 * t + lam / 3 + af) * U ω :=
    ⟨_, rfl⟩
  obtain ⟨Gf, hGf⟩ : ∃ Gf : Ω → ℝ,
      Gf = fun ω => (-1 / 2 : ℝ) * cutY vs z (√(U ω)) + (t + mu / 3 - nu / 2 - ag) * U ω :=
    ⟨_, rfl⟩
  have hFm : MemLp F 2 μ := by
    rw [hF]; exact ((hφ.add (memLp_const _)).const_mul _).add (hU.const_mul _)
  have hGm : MemLp Gf 2 μ := by
    rw [hGf]; exact (hY.const_mul _).add (hU.const_mul _)
  have m1 : MemLp (fun ω => v ω - (lam : ℝ)⁻¹ * F ω) 2 μ := hv.sub (hFm.const_mul _)
  have m2 : MemLp (fun ω => r ω - (mu : ℝ)⁻¹ * Gf ω) 2 μ := hr.sub (hGm.const_mul _)
  have ivU : Integrable (fun ω => v ω * U ω) μ := hv.integrable_mul hU
  have irU : Integrable (fun ω => r ω * U ω) μ := hr.integrable_mul hU
  have iv2 := hv.integrable_sq
  have ir2 := hr.integrable_sq
  have iv : Integrable v μ := hv.integrable one_le_two
  have ivφ : Integrable (fun ω => v ω * cutPhi vs z (√(U ω))) μ := hv.integrable_mul hφ
  have irY : Integrable (fun ω => r ω * cutY vs z (√(U ω))) μ := hr.integrable_mul hY
  have i1 : Integrable (fun ω => (lam : ℝ) * (v ω - (lam : ℝ)⁻¹ * F ω) ^ 2) μ :=
    m1.integrable_sq.const_mul _
  have i2 : Integrable (fun ω => (mu : ℝ) * (r ω - (mu : ℝ)⁻¹ * Gf ω) ^ 2) μ :=
    m2.integrable_sq.const_mul _
  have i3 : Integrable (fun ω => (2 * (lam : ℝ) / 3 + 2 * af) * (v ω * U ω) - lam * v ω ^ 2) μ :=
    (ivU.const_mul _).sub (iv2.const_mul _)
  have i4 : Integrable (fun ω => (2 * (mu : ℝ) / 3 - 2 * ag) * (r ω * U ω) - mu * r ω ^ 2) μ :=
    (irU.const_mul _).sub (ir2.const_mul _)
  have ivr : Integrable (fun ω => v ω * cutPhi vs z (√(U ω)) + r ω * cutY vs z (√(U ω))) μ :=
    ivφ.add irY
  have i5 : Integrable (fun ω => cutGap vs z (√(U ω))
      - (v ω * cutPhi vs z (√(U ω)) + r ω * cutY vs z (√(U ω)))) μ := hA.sub ivr
  have i6 : Integrable (fun ω => -(be : ℝ) * v ω) μ := iv.const_mul _
  have iUU : Integrable (fun ω => U ω ^ 2 - 2) μ := hM.i2.sub (integrable_const _)
  have i8 : Integrable (fun ω => (nu : ℝ) * ((U ω ^ 2 - 2) / 3 - r ω * U ω)) μ :=
    ((iUU.div_const 3).sub irU).const_mul _
  have i7 : Integrable (fun ω => 2 * (t : ℝ) * (2 * (v ω * U ω) + r ω * U ω - (U ω ^ 2 - 2))) μ :=
    ((((ivU.const_mul 2).add irU).sub iUU)).const_mul _
  have e : (fun ω => gspecG vs z lam mu t be nu af ag (√(U ω))) = fun ω =>
      (lam : ℝ) * (v ω - (lam : ℝ)⁻¹ * F ω) ^ 2 + (mu : ℝ) * (r ω - (mu : ℝ)⁻¹ * Gf ω) ^ 2
        + ((2 * (lam : ℝ) / 3 + 2 * af) * (v ω * U ω) - lam * v ω ^ 2)
        + ((2 * (mu : ℝ) / 3 - 2 * ag) * (r ω * U ω) - mu * r ω ^ 2)
        + (cutGap vs z (√(U ω)) - (v ω * cutPhi vs z (√(U ω)) + r ω * cutY vs z (√(U ω))))
        + -(be : ℝ) * v ω + 2 * (t : ℝ) * (2 * (v ω * U ω) + r ω * U ω - (U ω ^ 2 - 2))
        + (nu : ℝ) * ((U ω ^ 2 - 2) / 3 - r ω * U ω) := by
    funext ω
    rw [gspecG_eq, hF, hGf, Real.sq_sqrt (hM.nonneg ω)]
    field_simp
    ring
  obtain ⟨hI, hE⟩ := integral_add8 μ _ _ _ _ _ _ _ _ i1 i2 i3 i4 i5 i6 i7 i8
  rw [e]
  refine ⟨hI, ?_⟩
  rw [hE]
  have n1 : 0 ≤ ∫ ω, (lam : ℝ) * (v ω - (lam : ℝ)⁻¹ * F ω) ^ 2 ∂μ :=
    integral_nonneg fun ω => mul_nonneg hlamR.le (sq_nonneg _)
  have n2 : 0 ≤ ∫ ω, (mu : ℝ) * (r ω - (mu : ℝ)⁻¹ * Gf ω) ^ 2 ∂μ :=
    integral_nonneg fun ω => mul_nonneg hmuR.le (sq_nonneg _)
  have n3 : ∫ ω, ((2 * (lam : ℝ) / 3 + 2 * af) * (v ω * U ω) - lam * v ω ^ 2) ∂μ
      = (2 * lam / 3 + 2 * af) * ∫ ω, v ω * U ω ∂μ - lam * ∫ ω, v ω ^ 2 ∂μ := by
    rw [integral_sub (ivU.const_mul _) (iv2.const_mul _), integral_const_mul, integral_const_mul]
  have n4 : ∫ ω, ((2 * (mu : ℝ) / 3 - 2 * ag) * (r ω * U ω) - mu * r ω ^ 2) ∂μ
      = (2 * mu / 3 - 2 * ag) * ∫ ω, r ω * U ω ∂μ - mu * ∫ ω, r ω ^ 2 ∂μ := by
    rw [integral_sub (irU.const_mul _) (ir2.const_mul _), integral_const_mul, integral_const_mul]
  have n5 : ∫ ω, (cutGap vs z (√(U ω))
      - (v ω * cutPhi vs z (√(U ω)) + r ω * cutY vs z (√(U ω)))) ∂μ = 0 := by
    rw [integral_sub hA ivr, hparts vs z hvs, sub_self]
  have n6 : ∫ ω, -(be : ℝ) * v ω ∂μ = 0 := by rw [integral_const_mul, hv0, mul_zero]
  have n7 : ∫ ω, 2 * (t : ℝ) * (2 * (v ω * U ω) + r ω * U ω - (U ω ^ 2 - 2)) ∂μ = 0 := by
    have j1 : Integrable (fun ω => 2 * (v ω * U ω)) μ := ivU.const_mul 2
    have j2 : Integrable (fun ω => 2 * (v ω * U ω) + r ω * U ω) μ := j1.add irU
    rw [integral_const_mul, integral_sub j2 iUU, integral_add j1 irU, integral_const_mul,
      integral_sub hM.i2 (integrable_const _), integral_const, probReal_univ, one_smul]
    rw [show 2 * ∫ ω, v ω * U ω ∂μ + ∫ ω, r ω * U ω ∂μ - (∫ ω, U ω ^ 2 ∂μ - 2) = 0 by linarith,
      mul_zero]
  have n8 : ∫ ω, (nu : ℝ) * ((U ω ^ 2 - 2) / 3 - r ω * U ω) ∂μ
      = nu * ((∫ ω, U ω ^ 2 ∂μ - 2) / 3 - ∫ ω, r ω * U ω ∂μ) := by
    rw [integral_const_mul, integral_sub (iUU.div_const 3) irU, integral_div,
      integral_sub hM.i2 (integrable_const _), integral_const, probReal_univ, one_smul]
  have b3 : 0 ≤ (nu : ℝ) * ((∫ ω, U ω ^ 2 ∂μ - 2) / 3 - ∫ ω, r ω * U ω ∂μ) :=
    mul_nonneg (by exact_mod_cast hnu) (by linarith)
  rw [n3, n4, n5, n6, n7, n8]
  linarith

/-- The general spectral cuts from the analytic inputs: the cited budget is supplied by
`budget_of_bud`. -/
theorem gspec_of_inputs (hM : Moments μ U x) (hS : GramInputs μ U) (vs z : List ℚ)
    (lam mu t be nu : ℚ) (bud : GBud) (hvs : meshOK 0 vs = true) (hlam : 0 < lam) (hmu : 0 < mu)
    (hnu : 0 ≤ nu) (hok : bud.ok lam mu = true) :
    Integrable (fun ω => gspecG vs z lam mu t be nu (bud.af lam) (bud.ag mu) (√(U ω))) μ ∧
      0 ≤ ∫ ω, gspecG vs z lam mu t be nu (bud.af lam) (bud.ag mu) (√(U ω)) ∂μ := by
  obtain ⟨v, r, hv, hr, hv0, hbv, hbr, hsum, hcov, hparts, hgram, hfam⟩ := hS.ex
  exact gspec_of_vr μ hM v r hv hr hv0 hsum hcov hparts vs z lam mu t be nu _ _ hvs hlam hmu hnu
    (budget_of_bud lam mu hlam.le hmu.le bud hok _ _ _ _ hbv hbr hgram hfam)

/-- **The Stein cuts follow from the analytic inputs.** -/
theorem steinCut_of_inputs (hM : Moments μ U x) (hS : GramInputs μ U) : SteinCut μ U :=
  ⟨cut_of_inputs μ hM hS.toSteinInputs, spec_of_inputs μ hM hS.toSteinInputs,
    gspec_of_inputs μ hM hS⟩

end Grothe.Lower
