import Grothe.UpperChaos.Structural
import Grothe.UpperChaos.TaylorPhase

/-!
# The concrete rounding of the upper certificate

From the data of `Grothe/Upper/Data.lean` (`profileQ`, `aQ`, `bQ`, `etaQ`, `phaseEpsQ`, `phaseStrs`):

* the profile `v(s) = Σ_{j<12} x_j L_j^{(−1/2)}(s) / √(Γ(j+½)/j!)` (`vprof`), with the generalised
  Laguerre polynomial `L_j^{(−1/2)}(s) = Σ_k (−1)^k C(j−½, j−k) s^k/k!` (`lagHalf`) and
  `Γ(j+½)/j! = √π (2j)!/(4^j (j!)²)`;
* the base phase `F₀(z, w) = phase(z + √(1+a²) v(|z|²) w)` (`F0`, `phase 0 = 0`);
* the phase `φ = D e^{−ε(U+V)} S(U, V, W)`, `U = |z|²`, `V = |w|²`, `W = Re(z̄w)`, `D = Im(z̄w)` (`phiT`);
* `T = F₀ · P₃(φ)` and its smoothing `G_T(x) = E_Z T(Mx + √(1−η)(I − P_u) Z)`,
  `M = P_u + √η (I − P_u)`, `P_u` the projection on `u = (1, b)` (`GT`).

`G_T` is measurable and of charge one; it is disk-valued as soon as `|φ| ≤ 1` (the certified cover,
kept as the hypothesis `PhiBound`).  `fresh_upper_concrete`: the sharp upper bound from `PhiBound`,
a charge-one `X ∈ L²` and the three numerical fields for `E = energy G_T`, `EX = energy X`.
-/

open MeasureTheory ProbabilityTheory Grothe.LowerAnalytic Grothe.Upper
open scoped ComplexConjugate

namespace Grothe.UpperChaos

noncomputable section

/-! ### Parsing the phase monomials -/

/-- A rational `p/q` from a string. -/
def parseQ (s : String) : ℚ :=
  match s.splitOn "/" with
  | [a] => ((a.toInt?).getD 0 : ℚ)
  | [a, b] => ((a.toInt?).getD 0 : ℚ) / ((b.toNat?).getD 1 : ℚ)
  | _ => 0

/-- A monomial `i,j,k:c`. -/
def parseTerm (s : String) : (ℕ × ℕ × ℕ) × ℚ :=
  match s.splitOn ":" with
  | [p, c] =>
    match p.splitOn "," with
    | [i, j, k] => (((i.toNat?).getD 0, (j.toNat?).getD 0, (k.toNat?).getD 0), parseQ c)
    | _ => ((0, 0, 0), 0)
  | _ => ((0, 0, 0), 0)

/-- The monomials of the phase polynomial `S`. -/
def phaseTerms : List ((ℕ × ℕ × ℕ) × ℚ) := phaseStrs.map parseTerm

/-- `S(U, V, W) = Σ c U^i V^j W^k`. -/
def Sphase (U V W : ℝ) : ℝ :=
  (phaseTerms.map fun t => (t.2 : ℝ) * U ^ t.1.1 * V ^ t.1.2.1 * W ^ t.1.2.2).sum

lemma continuous_Sphase : Continuous fun x : ℝ × ℝ × ℝ => Sphase x.1 x.2.1 x.2.2 := by
  unfold Sphase
  induction phaseTerms with
  | nil => simp; exact continuous_const
  | cons t l ih => simp only [List.map_cons, List.sum_cons]; exact Continuous.add (by fun_prop) ih

/-! ### The profile -/

/-- `C(j − ½, j − k) = Π_{i < j−k} (k + ½ + i)/(i + 1)`. -/
def binHalf (j k : ℕ) : ℝ := ∏ i ∈ Finset.range (j - k), ((k : ℝ) + 1 / 2 + i) / (i + 1)

/-- The generalised Laguerre polynomial `L_j^{(−1/2)}(s)`. -/
def lagHalf (j : ℕ) (s : ℝ) : ℝ :=
  ∑ k ∈ Finset.range (j + 1), (-1) ^ k * binHalf j k * s ^ k / (k.factorial : ℝ)

/-- `√(Γ(j+½)/j!) = √(√π (2j)!/(4^j (j!)²))`. -/
def nrmHalf (j : ℕ) : ℝ :=
  √(√Real.pi * ((2 * j).factorial : ℝ) / (4 ^ j * ((j.factorial : ℝ)) ^ 2))

/-- **The profile** `v(s) = Σ_j x_j L_j^{(−1/2)}(s)/√(Γ(j+½)/j!)`. -/
def vprof (s : ℝ) : ℝ :=
  ∑ j ∈ Finset.range profileQ.length, ((profileQ.getD j 0 : ℚ) : ℝ) * lagHalf j s / nrmHalf j

lemma continuous_vprof : Continuous vprof := by
  unfold vprof lagHalf
  fun_prop

/-! ### The rounding -/

/-- **The base phase** `F₀(z, w) = phase(z + √(1+a²) v(|z|²) w)`. -/
def F0 (u : ℂ × ℂ) : ℂ :=
  Haag.ph (u.1 + ((√(1 + (aQ : ℝ) ^ 2) * vprof (‖u.1‖ ^ 2) : ℝ) : ℂ) * u.2)

/-- **The phase** `φ = D e^{−ε(U+V)} S(U, V, W)`. -/
def phiT (u : ℂ × ℂ) : ℝ :=
  (conj u.1 * u.2).im * Real.exp (-(phaseEpsQ : ℝ) * (‖u.1‖ ^ 2 + ‖u.2‖ ^ 2))
    * Sphase (‖u.1‖ ^ 2) (‖u.2‖ ^ 2) (conj u.1 * u.2).re

/-- **The unsmoothed rounding** `T = F₀ · P₃(φ)`. -/
def Tround (u : ℂ × ℂ) : ℂ := F0 u * P3 (phiT u)

lemma measurable_F0 : Measurable F0 := by
  unfold F0
  exact Haag.measurable_ph.comp (by
    have := continuous_vprof
    fun_prop)

lemma continuous_phiT : Continuous phiT := by
  unfold phiT
  have h := continuous_Sphase
  have h2 : Continuous fun u : ℂ × ℂ => Sphase (‖u.1‖ ^ 2) (‖u.2‖ ^ 2) (conj u.1 * u.2).re :=
    h.comp (show Continuous fun u : ℂ × ℂ => (‖u.1‖ ^ 2, ‖u.2‖ ^ 2, (conj u.1 * u.2).re) by fun_prop)
  fun_prop

lemma continuous_P3 : Continuous P3 := by unfold P3; fun_prop

lemma measurable_Tround : Measurable Tround :=
  measurable_F0.mul (continuous_P3.comp continuous_phiT).measurable

/-- The certified cover of the phase: `|φ| ≤ 1` everywhere. -/
def PhiBound : Prop := ∀ u, |phiT u| ≤ 1

lemma norm_Tround_le (hφ : PhiBound) (u : ℂ × ℂ) : ‖Tround u‖ ≤ 1 :=
  norm_mul_P3_le_one (Haag.norm_ph_le _) (hφ u)

/-! ### Charge one -/

lemma ph_mul {c : ℂ} (hc : ‖c‖ = 1) (a : ℂ) : Haag.ph (c * a) = c * Haag.ph a := by
  unfold Haag.ph
  rw [norm_mul, hc, one_mul]; ring

lemma F0_rot2 {c : ℂ} (hc : ‖c‖ = 1) (u : ℂ × ℂ) : F0 (rot2 c u) = c * F0 u := by
  simp only [F0, rot2, norm_mul, hc, one_mul]
  rw [← ph_mul hc]; congr 1; ring

lemma conj_mul_rot (c : ℂ) (hc : ‖c‖ = 1) (z w : ℂ) : conj (c * z) * (c * w) = conj z * w := by
  have : conj c * c = 1 := by
    rw [← Complex.normSq_eq_conj_mul_self, Complex.normSq_eq_norm_sq, hc]; simp
  rw [map_mul]; linear_combination (conj z * w) * this

lemma phiT_rot2 {c : ℂ} (hc : ‖c‖ = 1) (u : ℂ × ℂ) : phiT (rot2 c u) = phiT u := by
  simp only [phiT, rot2, conj_mul_rot c hc, norm_mul, hc, one_mul]

lemma Tround_rot2 {c : ℂ} (hc : ‖c‖ = 1) (u : ℂ × ℂ) : Tround (rot2 c u) = c * Tround u := by
  simp only [Tround, F0_rot2 hc, phiT_rot2 hc]; ring

/-! ### The smoothing -/

/-- `1/(1+b²)`. -/
def pu : ℝ := 1 / (1 + (bQ : ℝ) ^ 2)

/-- `M = P_u + √η (I − P_u)` as a real 2 × 2 matrix, entries `m₀₀, m₀₁ = m₁₀, m₁₁`. -/
def m00 : ℝ := pu + √(etaQ : ℝ) * (1 - pu)
def m01 : ℝ := pu * bQ - √(etaQ : ℝ) * (pu * bQ)
def m11 : ℝ := pu * (bQ : ℝ) ^ 2 + √(etaQ : ℝ) * (1 - pu * (bQ : ℝ) ^ 2)

/-- `N = √(1 − η) (I − P_u)`. -/
def n00 : ℝ := √(1 - (etaQ : ℝ)) * (1 - pu)
def n01 : ℝ := -√(1 - (etaQ : ℝ)) * (pu * bQ)
def n11 : ℝ := √(1 - (etaQ : ℝ)) * (1 - pu * (bQ : ℝ) ^ 2)

/-- `Mx + NZ` on `ℂ²` (real matrices acting coordinatewise on complex vectors). -/
def smoothArg (x Z : ℂ × ℂ) : ℂ × ℂ :=
  ((m00 : ℂ) * x.1 + (m01 : ℂ) * x.2 + (n00 : ℂ) * Z.1 + (n01 : ℂ) * Z.2,
   (m01 : ℂ) * x.1 + (m11 : ℂ) * x.2 + (n01 : ℂ) * Z.1 + (n11 : ℂ) * Z.2)

lemma smoothArg_rot2 (c : ℂ) (x Z : ℂ × ℂ) :
    smoothArg (rot2 c x) (rot2 c Z) = rot2 c (smoothArg x Z) := by
  simp only [smoothArg, rot2, Prod.mk.injEq]; constructor <;> ring

/-- **The rounding of the certificate**: `G_T(x) = E_Z T(Mx + NZ)`. -/
def GT (x : ℂ × ℂ) : ℂ := ∫ Z, Tround (smoothArg x Z) ∂mu2

lemma measurable_smoothArg : Measurable fun p : (ℂ × ℂ) × (ℂ × ℂ) => smoothArg p.1 p.2 := by
  unfold smoothArg; fun_prop

lemma measurable_GT : Measurable GT := by
  have h : StronglyMeasurable fun p : (ℂ × ℂ) × (ℂ × ℂ) => Tround (smoothArg p.1 p.2) :=
    (measurable_Tround.comp measurable_smoothArg).stronglyMeasurable
  exact (h.integral_prod_right' (ν := mu2)).measurable

lemma norm_GT_le (hφ : PhiBound) (x : ℂ × ℂ) : ‖GT x‖ ≤ 1 := by
  refine (norm_integral_le_of_norm_le_const (C := 1) ?_).trans (by simp)
  exact Filter.Eventually.of_forall fun Z => norm_Tround_le hφ _

/-- **Charge one** of `G_T` (rotation invariance of the noise). -/
theorem GT_rot2 {c : ℂ} (hc : ‖c‖ = 1) (x : ℂ × ℂ) : GT (rot2 c x) = c * GT x := by
  have hm : AEStronglyMeasurable (fun Z => Tround (smoothArg (rot2 c x) Z)) (mu2.map (rot2 c)) :=
    (measurable_Tround.comp (measurable_smoothArg.comp (measurable_const.prodMk
      measurable_id))).aestronglyMeasurable
  have h := integral_map (by unfold rot2; fun_prop : AEMeasurable (rot2 c) mu2) hm
  rw [map_rot2 hc] at h
  rw [GT, h, GT, ← integral_const_mul]
  refine integral_congr_ae (Filter.Eventually.of_forall fun Z => ?_)
  simp only
  rw [smoothArg_rot2, Tround_rot2 hc]

lemma memLp_GT (hφ : PhiBound) : MemLp GT 2 mu2 :=
  MemLp.of_bound measurable_GT.aestronglyMeasurable 1
    (Filter.Eventually.of_forall (norm_GT_le hφ))

/-! ### The headline -/

/-- **The sharp upper bound for the concrete rounding of the certificate**: the remaining
hypotheses are the certified cover `|φ| ≤ 1` and the three numerical comparisons between the
energies of `G_T` and those of a charge-one truncation `X`. -/
theorem fresh_upper_concrete (hφ : PhiBound) {X : ℂ × ℂ → ℂ} (hXL : MemLp X 2 mu2)
    (hXch : ∀ c u, ‖c‖ = 1 → X (rot2 c u) = c * X u)
    (hcompare : ∑' p, |energy ((memLp_GT hφ).toLp GT) p - energy (hXL.toLp X) p|
      ≤ (compareQ : ℝ))
    (hclose : ∑ p ∈ headIdx 501, |energy (hXL.toLp X) p - (energyTable p : ℝ)| ≤ (energyErrQ : ℝ))
    (hhardy : ∀ J, ∑ n ∈ Finset.range J, kernelCoeff (energy ((memLp_GT hφ).toLp GT)) n ^ 2
      * (4149 / 4000 : ℝ) ^ (2 * (2 * n + 1)) ≤ 7 / 4) :
    IsGrothendieckBound (500000000000000000 / 355973576656604491) :=
  fresh_upper_of_rounding measurable_GT (norm_GT_le hφ) (fun _ u hc => GT_rot2 hc u)
    (memLp_GT hφ) hXL hXch hcompare hclose hhardy

end

end Grothe.UpperChaos
