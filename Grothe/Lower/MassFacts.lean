import Grothe.Lower.SpecRows
import Grothe.Lower.MassNodes
import Grothe.Lower.Cert.MassRow

/-!
# The mass row: the law-level bound

The mass row (λ = 1/2, the scalar row of the envelope for small `t`) rests on three facts (`MassRowFrame.lean`); this file
proves the third, the law-level bound, and the scalar inequality behind the second:

* `phiMass_ge`, `phiMass_attain`: with `φ_c(r) = ε²r²/c` for `r ≤ c/ε` and `2εr − c` beyond (`ε, c > 0`),
  `2εry − cy² ≤ φ_c(r)` for `0 ≤ y ≤ 1`, with equality at `y = min(εr/c, 1)` (so `φ_c` is the supremum of these affine
  functions of `r`);
* `phiMass_convexOn_mul`, `phiMass_lip_mul`: `s ↦ φ_c(ks)` is convex on `[0, ∞)` and `2εk`-Lipschitz there (`k ≥ 0`);
* `massCaps`: the potential `Ψ(s) = φ_c(s/δ)` of the mass row (`δ = 3/4`, `c = 2ν̂ + λ`, `ε = ε̂ = 25/31`) satisfies the node
  caps, convexity and Lipschitz bound of the row (`CapsHold`), with exact potential values at the nodes (`massCapsOK`);
* `mass_law_bound`: for every law with the moments and the Stein cuts and every `0 ≤ σ ≤ ρ`,
  `E φ_c(σ√U) − ε̂σ² ≤ S`, `S = S(1/2)` of the certificate, from the cell check of the mass row
  (`certMassRow`, `goal_of_specCells`) at `σ' = δσ`, since `κδ² ≤ ε̂`.
-/

open MeasureTheory

namespace Grothe.Lower

noncomputable section

/-- `φ_c(r) = ε²r²/c` for `r ≤ c/ε`, `2εr − c` beyond. -/
def phiMass (e c r : ℝ) : ℝ := if r ≤ c / e then e ^ 2 * r ^ 2 / c else 2 * e * r - c

/-- **The scalar inequality**: `2εry − cy² ≤ φ_c(r)` for `y ≤ 1`. -/
lemma phiMass_ge {e c : ℝ} (he : 0 < e) (hc : 0 < c) {y r : ℝ} (hy1 : y ≤ 1) :
    2 * e * r * y - c * y ^ 2 ≤ phiMass e c r := by
  unfold phiMass
  split_ifs with h
  · rw [le_div_iff₀ hc]
    nlinarith [sq_nonneg (e * r - c * y)]
  · have hr : c < e * r := by
      rw [not_le, div_lt_iff₀ he] at h
      linarith
    nlinarith [mul_nonneg (sub_nonneg.2 hy1) (sub_nonneg.2 hr.le), mul_nonneg hc.le (sq_nonneg (1 - y))]

/-- **The supremum is attained**: at `y = εr/c` for `r ≤ c/ε`, at `y = 1` beyond. -/
lemma phiMass_attain {e c : ℝ} (he : 0 < e) (hc : 0 < c) {r : ℝ} (hr : 0 ≤ r) :
    ∃ y, 0 ≤ y ∧ y ≤ 1 ∧ phiMass e c r = 2 * e * r * y - c * y ^ 2 := by
  unfold phiMass
  split_ifs with h
  · refine ⟨e * r / c, div_nonneg (mul_nonneg he.le hr) hc.le, ?_, ?_⟩
    · rw [div_le_one hc]
      rw [le_div_iff₀ he] at h
      linarith
    · have hc0 := hc.ne'
      field_simp
      ring
  · exact ⟨1, zero_le_one, le_refl _, by ring⟩

lemma phiMass_nonneg {e c : ℝ} (he : 0 < e) (hc : 0 < c) (r : ℝ) : 0 ≤ phiMass e c r := by
  simpa using phiMass_ge (y := 0) (r := r) he hc zero_le_one

/-- `φ_c(r) ≤ 2εr` for `r ≥ 0`. -/
lemma phiMass_le {e c : ℝ} (he : 0 < e) (hc : 0 < c) {r : ℝ} (hr : 0 ≤ r) : phiMass e c r ≤ 2 * e * r := by
  obtain ⟨y, hy0, hy1, hy⟩ := phiMass_attain he hc hr
  rw [hy]
  nlinarith [mul_le_mul_of_nonneg_left hy1 (mul_nonneg (mul_nonneg zero_le_two he.le) hr),
    mul_nonneg hc.le (sq_nonneg y)]

lemma measurable_phiMass (e c : ℝ) : Measurable (phiMass e c) := by
  unfold phiMass
  refine Measurable.ite (measurableSet_le measurable_id measurable_const) ?_ ?_ <;> fun_prop

/-- `s ↦ φ_c(ks)` is convex on `[0, ∞)` for `k ≥ 0`. -/
lemma phiMass_convexOn_mul {e c k : ℝ} (he : 0 < e) (hc : 0 < c) (hk : 0 ≤ k) :
    ConvexOn ℝ (Set.Ici 0) (fun s => phiMass e c (k * s)) := by
  refine ⟨convex_Ici 0, fun x hx z hz a b ha hb hab => ?_⟩
  simp only [Set.mem_Ici] at hx hz
  simp only [smul_eq_mul]
  obtain ⟨y, hy0, hy1, hy⟩ := phiMass_attain he hc (mul_nonneg hk (add_nonneg (mul_nonneg ha hx) (mul_nonneg hb hz)))
  rw [hy]
  have h1 := phiMass_ge (r := k * x) he hc hy1
  have h2 := phiMass_ge (r := k * z) he hc hy1
  have e1 : 2 * e * (k * (a * x + b * z)) * y - c * y ^ 2
      = a * (2 * e * (k * x) * y - c * y ^ 2) + b * (2 * e * (k * z) * y - c * y ^ 2) := by
    linear_combination (c * y ^ 2) * hab
  rw [e1]
  exact add_le_add (mul_le_mul_of_nonneg_left h1 ha) (mul_le_mul_of_nonneg_left h2 hb)

/-- `s ↦ φ_c(ks)` is `2εk`-Lipschitz on `[0, ∞)` (from above) for `k ≥ 0`. -/
lemma phiMass_lip_mul {e c k : ℝ} (he : 0 < e) (hc : 0 < c) (hk : 0 ≤ k) {s t : ℝ} (hs : 0 ≤ s)
    (hst : s ≤ t) : phiMass e c (k * t) ≤ phiMass e c (k * s) + 2 * e * k * (t - s) := by
  obtain ⟨y, hy0, hy1, hy⟩ := phiMass_attain he hc (mul_nonneg hk (hs.trans hst))
  rw [hy]
  have h1 := phiMass_ge (r := k * s) he hc hy1
  have h2 : 2 * e * k * (t - s) * y ≤ 2 * e * k * (t - s) :=
    mul_le_of_le_one_right (mul_nonneg (mul_nonneg (mul_nonneg zero_le_two he.le) hk) (sub_nonneg.2 hst)) hy1
  nlinarith [h1, h2]

/-! ### The mass row -/

lemma phiQ_cast (e c r : ℚ) : ((phiQ e c r : ℚ) : ℝ) = phiMass e c r := by
  unfold phiQ phiMass
  have hiff : ((r : ℝ) ≤ (c : ℝ) / (e : ℝ)) ↔ r ≤ c / e := by rw [← Rat.cast_div, Rat.cast_le]
  by_cases h : r ≤ c / e
  · have h' : (r : ℝ) ≤ (c : ℝ) / (e : ℝ) := hiff.2 h
    simp only [h, h', ↓reduceIte]
    push_cast
    ring
  · have h' : ¬ (r : ℝ) ≤ (c : ℝ) / (e : ℝ) := fun h'' => h (hiff.1 h'')
    simp only [h, h', ↓reduceIte]
    push_cast
    ring

lemma massRow_delta : massRow.delta = 3 / 4 := rfl

lemma massRow_kappa : massRow.kappa = 358422939 / 250000000 := rfl

lemma massRow_smax : massRow.smax = 2151 / 1000 := rfl

lemma massRow_cap :
    massRow.cap = 3798855002692619656161170986221578569 / 22939068096000000000000000000000000000 := rfl

/-- The potential of the mass row: `Ψ(s) = φ_c(s/δ) = φ_c(4s/3)`. -/
def massPot (s : ℝ) : ℝ := phiMass ε massC ((4 / 3 : ℝ) * s)

lemma epsR_pos : (0 : ℝ) < (ε : ℝ) := by norm_num [ε]

lemma massC_pos : (0 : ℝ) < (massC : ℝ) := by norm_num [massC]

/-- **`CapsHold` for the mass row**: convexity, the node caps and the Lipschitz constant `smax`. -/
theorem massCaps : CapsHold massPot massNodes massRow.smax := by
  refine ⟨phiMass_convexOn_mul epsR_pos massC_pos (by norm_num), fun n hn => ?_, fun s t hs hst => ?_⟩
  · apply le_of_eq
    rw [massCapsOK hn, massRow_delta, phiQ_cast, massPot]
    congr 1
    push_cast
    ring
  · have h := phiMass_lip_mul (k := 4 / 3) epsR_pos massC_pos (by norm_num) hs hst
    unfold massPot
    have hk : 2 * (ε : ℝ) * (4 / 3) ≤ (massRow.smax : ℝ) := by
      rw [massRow_smax]
      norm_num [ε]
    nlinarith [mul_le_mul_of_nonneg_right hk (sub_nonneg.2 hst)]

/-- **The law-level bound of the mass row** (fact 3 of the certificate's mass row): for every law with the moments and the
Stein cuts and every `0 ≤ σ ≤ ρ`, `E φ_c(σ√U) − ε̂σ² ≤ S(1/2)`. -/
theorem mass_law_bound {Ω : Type} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ] {U : Ω → ℝ}
    {x : ℝ} (hM : Moments μ U x) (hS : SteinCut μ U) {σ : ℝ} (h0 : 0 ≤ σ) (h1 : σ ≤ ρ)
    (hf : Integrable (fun ω => phiMass ε massC (σ * √(U ω))) μ) :
    ∫ ω, phiMass ε massC (σ * √(U ω)) ∂μ - (ε : ℝ) * σ ^ 2 ≤ massS := by
  have e1 : ∀ ω, massPot ((3 / 4 : ℝ) * σ * √(U ω)) = phiMass ε massC (σ * √(U ω)) := by
    intro ω
    unfold massPot
    congr 1
    ring
  have hδ : ((massRow.delta : ℚ) : ℝ) = 3 / 4 := by rw [massRow_delta]; norm_num
  have h := goal_of_specCells μ massRow certMassRow hM hS massCaps (σ := (3 / 4 : ℝ) * σ)
    (by positivity)
    (by rw [hδ]; exact mul_le_mul_of_nonneg_left h1 (by norm_num))
    (by simpa only [e1] using hf)
  simp only [e1] at h
  have hκ : ((massRow.kappa : ℚ) : ℝ) * (3 / 4) ^ 2 ≤ (ε : ℝ) := by
    rw [massRow_kappa]
    norm_num [ε]
  have hcap : ((massRow.cap : ℚ) : ℝ) ≤ (massS : ℝ) := by
    have : massRow.cap ≤ massS := by rw [massRow_cap]; norm_num [massS]
    exact_mod_cast this
  have hsq : 0 ≤ σ ^ 2 := sq_nonneg σ
  nlinarith [mul_le_mul_of_nonneg_right hκ hsq]

end

end Grothe.Lower
