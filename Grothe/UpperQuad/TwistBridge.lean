import Grothe.UpperQuad.TwistFactsSound
import Grothe.UpperQuad.TwistRadial
import Grothe.UpperQuad.TwistMargins
import Grothe.UpperChaos.FirstSecondCapturedTail
import Grothe.UpperChaos.ThirdCapturedTail
import Grothe.UpperChaos.CompactTaylorBands
import Grothe.UpperChaos.TaylorFirstBandNorms
import Grothe.UpperChaos.TaylorSecondBandNorms
import Grothe.UpperChaos.TaylorBandDefs
import Grothe.UpperChaos.PhaseMomentNorms
import Grothe.UpperChaos.Realise2

/-!
# The bridge: the six band/whole hypotheses from the port facts

Per power `j` the facts (`accOK_of_facts`) bound the exact Gauss–Legendre sums of the committed
partition: the `I_j`-sum `Σ_i c_j(i) â_j(i) ≥ θ_j` and the low band `Σ_{low} (â_j(i) − c_j(i))² ≤
eps_j / 2^{1024}`, where `â_j(q,c,d) = twistGauss j q c d` is the Gauss sum of the radial integrand
of `a_j(q,c,d) = ⟨hvec2 (gradedMode q c d), hpow j⟩` (`twistCoefficient_eq_ofReal`). The one
analytic hypothesis is the Gauss–Legendre remainder in `ℓ²` over the center's support,

    TwistQuadHyp j ρ :  Σ_{q < Q_j} Σ_{c ≤ q+1} Σ_{d ≤ q} (a_j(q,c,d) − â_j(q,c,d))² ≤ ρ²,

used with `ρ_j = 10⁻¹¹, 10⁻¹⁰, 10⁻¹¹`.  Then (`docs/UPPER_CLOSURE.md` §2, §8.4)

* whole: `‖hpow j − c_j‖² = E φ^{2j} − 2 Re⟨c_j, hpow j⟩ + ‖c_j‖²` with
  `Re⟨c_j, hpow j⟩ = Σ_i c_j(i) a_j(i) ≥ θ_j − ‖c_j‖ ρ_j` (Cauchy–Schwarz), and the margins
  `j<j>_whole_margin` of `PortFacts/Margins.lean`;
* low band: `‖P_B (hpow j − c_j)‖² = Σ_{low} (a_j − c_j)² ≤ (ρ_j + √(eps_j)/2^{512})²` (Parseval on
  the band, Minkowski), and the margins `j<j>_low_margin`.

Agent-ID: claude-b9ee. Refs #41, #313.
-/

namespace Grothe.UpperQuad

open MeasureTheory GrotheQuad Grothe.UpperChaos Grothe.UpperQuad.PortFacts
open scoped InnerProductSpace ComplexConjugate

noncomputable section

/-! ### Finite sums over the graded triangle -/

/-- The graded index set `{(q, c, d) : q < Q, c ≤ q + 1, d ≤ q}` as a `Finset`. -/
def idx3 (Q : ℕ) : Finset (Σ _ : ℕ, ℕ × ℕ) :=
  (Finset.range Q).sigma fun q => Finset.range (q + 2) ×ˢ Finset.range (q + 1)

lemma sum3_eq (Q : ℕ) (f : ℕ → ℕ → ℕ → ℝ) :
    ∑ q ∈ Finset.range Q, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1), f q c d =
      ∑ p ∈ idx3 Q, f p.1 p.2.1 p.2.2 := by
  unfold idx3
  rw [Finset.sum_sigma]
  exact Finset.sum_congr rfl fun q _ => (Finset.sum_product _ _ fun p => f q p.1 p.2).symm

/-- Cauchy–Schwarz on the graded triangle. -/
lemma sum3_mul_sq_le (Q : ℕ) (x y : ℕ → ℕ → ℕ → ℝ) :
    (∑ q ∈ Finset.range Q, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
      x q c d * y q c d) ^ 2 ≤
      (∑ q ∈ Finset.range Q, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1), x q c d ^ 2) *
        (∑ q ∈ Finset.range Q, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
          y q c d ^ 2) := by
  rw [sum3_eq, sum3_eq, sum3_eq]
  exact Finset.sum_mul_sq_le_sq_mul_sq _ _ _

/-- Termwise equality on the graded triangle. -/
private lemma sum3_congr {M : Type*} [AddCommMonoid M] {Q : ℕ} {f g : ℕ → ℕ → ℕ → M}
    (h : ∀ q c d, q < Q → c < q + 2 → d < q + 1 → f q c d = g q c d) :
    ∑ q ∈ Finset.range Q, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1), f q c d =
      ∑ q ∈ Finset.range Q, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1), g q c d :=
  Finset.sum_congr rfl fun q hq ↦ Finset.sum_congr rfl fun c hc ↦ Finset.sum_congr rfl fun d hd ↦
    h q c d (Finset.mem_range.mp hq) (Finset.mem_range.mp hc) (Finset.mem_range.mp hd)

/-- Minkowski on the graded triangle: `Σ (x + y)² ≤ (√X + √Y)²` from `Σ x² ≤ X²`, `Σ y² ≤ Y²`. -/
lemma sum3_add_sq_le (Q : ℕ) (x y : ℕ → ℕ → ℕ → ℝ) {X Y : ℝ} (hX : 0 ≤ X) (hY : 0 ≤ Y)
    (hx : ∑ q ∈ Finset.range Q, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
      x q c d ^ 2 ≤ X ^ 2)
    (hy : ∑ q ∈ Finset.range Q, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
      y q c d ^ 2 ≤ Y ^ 2) :
    ∑ q ∈ Finset.range Q, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
      (x q c d + y q c d) ^ 2 ≤ (X + Y) ^ 2 := by
  have hcs := sum3_mul_sq_le Q x y
  set Sx := ∑ q ∈ Finset.range Q, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
    x q c d ^ 2
  set Sy := ∑ q ∈ Finset.range Q, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
    y q c d ^ 2
  set Sxy := ∑ q ∈ Finset.range Q, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
    x q c d * y q c d
  have hsx : 0 ≤ Sx := Finset.sum_nonneg fun _ _ => Finset.sum_nonneg fun _ _ =>
    Finset.sum_nonneg fun _ _ => sq_nonneg _
  have hsy : 0 ≤ Sy := Finset.sum_nonneg fun _ _ => Finset.sum_nonneg fun _ _ =>
    Finset.sum_nonneg fun _ _ => sq_nonneg _
  have hexp : ∑ q ∈ Finset.range Q, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
      (x q c d + y q c d) ^ 2 = Sx + 2 * Sxy + Sy := by
    simp only [Sx, Sy, Sxy, Finset.mul_sum, ← Finset.sum_add_distrib]
    exact sum3_congr fun _ _ _ _ _ _ ↦ by ring
  rw [hexp]
  have hxy : Sxy ≤ X * Y := by
    have h1 : Sxy ^ 2 ≤ (X * Y) ^ 2 :=
      (hcs.trans (mul_le_mul hx hy hsy (by positivity))).trans_eq (mul_pow X Y 2).symm
    exact abs_le_of_sq_le_sq' h1 (by positivity) |>.2
  nlinarith

lemma sum3_le_of_le {Q Q' : ℕ} (hQ : Q ≤ Q') (f : ℕ → ℕ → ℕ → ℝ) (hf : ∀ q c d, 0 ≤ f q c d) :
    ∑ q ∈ Finset.range Q, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1), f q c d ≤
      ∑ q ∈ Finset.range Q', ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1), f q c d := by
  exact Finset.sum_le_sum_of_subset_of_nonneg (Finset.range_subset_range.mpr hQ) fun q _ _ =>
    Finset.sum_nonneg fun c _ => Finset.sum_nonneg fun d _ => hf q c d

/-! ### The exact Gauss sums and the remainder hypothesis -/

/-- The exact Gauss–Legendre sum over the committed partition of the radial integrand of
`a_j(q,c,d)`: `Σ_n W_n e^{−s_n} ψ_{(q,c,d)}(s_n) J^{(j)}_{c,d}(s_n)`. -/
def twistGauss (j q c d : ℕ) : ℝ := specsLow j partitionSpecs q c d

/-- **The twisted Gauss–Legendre remainder hypothesis** of the power `j`: in `ℓ²` over the center's
support `q < Q_j`, the coefficients `a_j(q,c,d) = ∫_{s>0} twistIntegrand j q c d` differ from
their exact Gauss sums by at most `ρ`. -/
def TwistQuadHyp (j : ℕ) (ρ : ℝ) : Prop :=
  ∑ q ∈ Finset.range (twistParams j).Q, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
    ((∫ s in Set.Ioi (0 : ℝ), twistIntegrand j q c d s) - twistGauss j q c d) ^ 2 ≤ ρ ^ 2

lemma twistGauss_eq (j : ℕ) (hj : j = 1 ∨ j = 2 ∨ j = 3) (q c d : ℕ) :
    twistGauss j q c d =
      (partitionSpecs.map fun nd => nodeWR nd * twistIntegrand j q c d (nodeSR nd)).sum := by
  unfold twistGauss specsLow
  congr 1
  apply List.map_congr_left
  intro nd _
  unfold nodeLowTerm twistIntegrand
  rw [twistParams_j j hj]
  ring

/-! ### The `I`-sum as the center contraction of the Gauss sums -/

lemma sum_range_sub_shift (m Q : ℕ) (F : ℕ → ℝ) :
    ∑ i ∈ Finset.range (Q - m), F (m + i) = ∑ q ∈ Finset.range Q, if m ≤ q then F q else 0 := by
  rw [← Finset.sum_filter, ← Finset.sum_Ico_eq_sum_range]
  congr 1
  ext q
  simp only [Finset.mem_Ico, Finset.mem_filter, Finset.mem_range]
  omega

lemma sum_range_filter_le (N q : ℕ) (hq : q + 1 ≤ N) (F : ℕ → ℝ) :
    ∑ d ∈ Finset.range N, (if d ≤ q then F d else 0) = ∑ d ∈ Finset.range (q + 1), F d := by
  rw [← Finset.sum_filter]
  congr 1
  ext d
  simp only [Finset.mem_filter, Finset.mem_range]
  omega

/-- The reindexing of the kernel's contraction `Σ_{c,d} V_{c,d} J_{c,d}` by modes. -/
lemma sum_center_reindex (Q Dout : ℕ) (hDQ : Dout + 1 = 2 * Q) (F : ℕ → ℕ → ℕ → ℝ) :
    ∑ c ∈ Finset.range (Dout + 1), ∑ d ∈ Finset.range (Dout + 1 - c),
      ∑ i ∈ Finset.range (Q - max (c - 1) d), F (max (c - 1) d + i) c d =
    ∑ q ∈ Finset.range Q, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1), F q c d := by
  have hin : ∀ c d, ∑ i ∈ Finset.range (Q - max (c - 1) d), F (max (c - 1) d + i) c d =
      ∑ q ∈ Finset.range Q, if max (c - 1) d ≤ q then F q c d else 0 :=
    fun c d => sum_range_sub_shift _ _ (fun q => F q c d)
  simp_rw [hin]
  rw [Finset.sum_congr rfl fun c _ => Finset.sum_comm, Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro q hq
  simp only [Finset.mem_range] at hq
  have hc : ∀ c, ∑ d ∈ Finset.range (Dout + 1 - c), (if max (c - 1) d ≤ q then F q c d else 0) =
      if c ≤ q + 1 then ∑ d ∈ Finset.range (q + 1), F q c d else 0 := by
    intro c
    split_ifs with hcq
    · rw [← sum_range_filter_le (Dout + 1 - c) q (by omega)]
      apply Finset.sum_congr rfl
      intro d _
      congr 1
      apply propext
      omega
    · apply Finset.sum_eq_zero
      intro d _
      exact ite_eq_right_iff.mpr fun h => absurd h (by omega)
  simp_rw [hc]
  exact sum_range_filter_le (Dout + 1) (q + 1) (by omega) _

lemma list_sum_map_sum3 (L : List NodeSpec) (Q : ℕ) (f : NodeSpec → ℕ → ℕ → ℕ → ℝ) :
    (L.map fun nd => ∑ q ∈ Finset.range Q, ∑ c ∈ Finset.range (q + 2),
      ∑ d ∈ Finset.range (q + 1), f nd q c d).sum =
    ∑ q ∈ Finset.range Q, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
      (L.map fun nd => f nd q c d).sum := by
  induction L with
  | nil => simp
  | cons nd L ih =>
    simp only [List.map_cons, List.sum_cons, ih, ← Finset.sum_add_distrib]

lemma list_sum_map_mul_left (L : List NodeSpec) (a : ℝ) (f : NodeSpec → ℝ) :
    (L.map fun nd => a * f nd).sum = a * (L.map f).sum := by
  induction L with
  | nil => simp
  | cons nd L ih => simp only [List.map_cons, List.sum_cons, ih]; ring

/-- The exact `I`-sum is the contraction of the center with the Gauss sums. -/
theorem specsI_eq (j : ℕ) (hj : j = 1 ∨ j = 2 ∨ j = 3) :
    specsI j partitionSpecs =
      ∑ q ∈ Finset.range (twistParams j).Q, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
        centerR (centerInts j) (twistParams j).E q c d * twistGauss j q c d := by
  have hDQ := (paramsOK_twistParams j hj).hDQ
  have hnode : ∀ nd : NodeSpec, nodeITerm (twistParams j) (centerInts j) (nodeSR nd) (nodeWR nd) =
      ∑ q ∈ Finset.range (twistParams j).Q, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
        centerR (centerInts j) (twistParams j).E q c d *
          nodeLowTerm (twistParams j) (nodeSR nd) (nodeWR nd) q c d := by
    intro nd
    unfold nodeITerm centerVR
    rw [← sum_center_reindex _ _ hDQ, Finset.mul_sum]
    apply Finset.sum_congr rfl; intro c _
    rw [Finset.mul_sum]
    apply Finset.sum_congr rfl; intro d _
    rw [Finset.sum_mul, Finset.mul_sum]
    apply Finset.sum_congr rfl; intro i _
    unfold nodeLowTerm
    ring
  unfold specsI twistGauss specsLow
  simp_rw [hnode]
  rw [list_sum_map_sum3]
  simp_rw [list_sum_map_mul_left]

/-! ### The center inner product -/

lemma inner_gradedHermite_left (N : ℕ) (a : ℕ → ℕ → ℕ → ℚ) (F : Lp ℂ 2 mu2) :
    ⟪gradedHermite N a, F⟫_ℂ = ∑ q ∈ Finset.range N, ∑ c ∈ Finset.range (q + 2),
      ∑ d ∈ Finset.range (q + 1), (a q c d : ℂ) * ⟪hvec2 (gradedMode q c d), F⟫_ℂ := by
  rw [gradedHermite, hermiteFinite, sum_inner, sum_gradedSupport,
    ← FixedChaosSmoothing.sum_bounded_graded_eq_range]
  apply Finset.sum_congr rfl; intro q _
  apply Finset.sum_congr rfl; intro c _
  apply Finset.sum_congr rfl; intro d _
  rw [inner_smul_left, map_ratCast]
  congr 2
  simp only [gradedHermiteCoeff, gradedMode]
  rw [Nat.sub_add_cancel (by have := d.isLt; omega)]

lemma chargeOne_hpowL2 (j : ℕ) : ChargeOne (hpowL2 j) :=
  chargeOne_toLp _ fun _c u hc => hpow_rot2 hc j u

/-- `Re⟨c, hpow j⟩ = Σ_i c(i) a_j(i)` for a graded center with `M ≤ Q_j`-many grades. -/
lemma re_inner_center (j N : ℕ) (a : ℕ → ℕ → ℕ → ℚ) :
    Complex.re ⟪gradedHermite N a, hpowL2 j⟫_ℂ =
      ∑ q ∈ Finset.range N, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
        (a q c d : ℝ) * ∫ s in Set.Ioi (0 : ℝ), twistIntegrand j q c d s := by
  simp only [inner_gradedHermite_left, Complex.re_sum]
  refine sum3_congr fun q c d _ hc hd ↦ ?_
  have h := twistCoefficient_eq_ofReal j q c d (by omega) (by omega)
  unfold twistCoefficient at h
  rw [h, ← Complex.ofReal_ratCast, ← Complex.ofReal_mul, Complex.ofReal_re]


/-! ### The two generic consumers -/

/-- The data of the facts of the power `j`, as hypotheses. -/
structure FactsOf (j : ℕ) (bounds : List ℕ) (ts : List PartialTable) (num : ℤ) (den : ℕ) (eps : ℤ) :
    Prop where
  hj : j = 1 ∨ j = 2 ∨ j = 3
  deg : PhaseDegOK
  tablesValid : twistTablesValid P0 (twistParams j) (tables j) = true
  final : finalFact j bounds ts num den eps = true
  ranges : ∀ r, r < ts.length →
    rangeFact j (bounds.getD r 0) (bounds.getD (r + 1) 0) (ts.getD r default) = true

lemma gauss_sums_of_facts {j : ℕ} {bounds : List ℕ} {ts : List PartialTable} {num : ℤ} {den : ℕ}
    {eps : ℤ} (hF : FactsOf j bounds ts num den eps) (hden : 0 < den) :
    (num : ℝ) / den ≤ specsI j partitionSpecs ∧
      ∑ q ∈ Finset.range (qlow j), ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
        (twistGauss j q c d - centerR (centerInts j) (twistParams j).E q c d) ^ 2 ≤
          (eps : ℝ) / 2 ^ (4 * KOut) := by
  obtain ⟨hacc, hI, hL⟩ := accOK_of_facts j hF.hj hF.deg hF.tablesValid hF.final hF.ranges
  exact ⟨iPartialOK_sound hacc.1 hden hI,
    lowBandOK_sound (by have := (paramsOK_twistParams j hF.hj).hE; unfold KOut at *; omega)
      hacc.2 hL⟩

/-- **The whole-error consumer**: `Re⟨c, hpow j⟩ ≥ θ − ‖c‖ ρ`. -/
theorem re_inner_ge_of_facts {j : ℕ} {bounds : List ℕ} {ts : List PartialTable} {num : ℤ}
    {den : ℕ} {eps : ℤ} (hF : FactsOf j bounds ts num den eps) (hden : 0 < den) {ρ : ℝ}
    (hρ : 0 ≤ ρ) (hQ : TwistQuadHyp j ρ) (a : ℕ → ℕ → ℕ → ℚ)
    (ha : ∀ q c d, q < (twistParams j).Q → c < q + 2 → d < q + 1 →
      (a q c d : ℝ) = centerR (centerInts j) (twistParams j).E q c d) :
    (num : ℝ) / den - ‖gradedHermite (twistParams j).Q a‖ * ρ ≤
      Complex.re ⟪gradedHermite (twistParams j).Q a, hpowL2 j⟫_ℂ := by
  obtain ⟨hθ, -⟩ := gauss_sums_of_facts hF hden
  set Q := (twistParams j).Q
  rw [re_inner_center, specsI_eq j hF.hj] at *
  have hsplit : ∑ q ∈ Finset.range Q, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
      (a q c d : ℝ) * ∫ s in Set.Ioi (0 : ℝ), twistIntegrand j q c d s =
      (∑ q ∈ Finset.range Q, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
        centerR (centerInts j) (twistParams j).E q c d * twistGauss j q c d) +
      ∑ q ∈ Finset.range Q, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
        (a q c d : ℝ) *
          ((∫ s in Set.Ioi (0 : ℝ), twistIntegrand j q c d s) - twistGauss j q c d) := by
    simp only [← Finset.sum_add_distrib]
    refine sum3_congr fun q c d hq hc hd ↦ ?_
    rw [← ha q c d hq hc hd]
    ring
  rw [hsplit]
  have hcs := sum3_mul_sq_le Q (fun q c d => (a q c d : ℝ))
    (fun q c d => (∫ s in Set.Ioi (0 : ℝ), twistIntegrand j q c d s) - twistGauss j q c d)
  have hnorm : ‖gradedHermite Q a‖ ^ 2 = ∑ q ∈ Finset.range Q, ∑ c ∈ Finset.range (q + 2),
      ∑ d ∈ Finset.range (q + 1), ((a q c d : ℝ)) ^ 2 := by
    rw [norm_gradedHermite_sq_cast]; push_cast; rfl
  rw [← hnorm] at hcs
  have h2 : (∑ q ∈ Finset.range Q, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
      (a q c d : ℝ) *
        ((∫ s in Set.Ioi (0 : ℝ), twistIntegrand j q c d s) - twistGauss j q c d)) ^ 2 ≤
      (‖gradedHermite Q a‖ * ρ) ^ 2 :=
    hcs.trans ((mul_le_mul_of_nonneg_left hQ (sq_nonneg _)).trans_eq (mul_pow _ _ 2).symm)
  have hb := abs_le_of_sq_le_sq' h2 (by positivity)
  linarith [hb.1]

/-- **The low-band consumer**: `‖P_B (hpow j − c)‖ ≤ ρ + √(eps)/2^{512}` for a band `B` whose
charge-one modes are exactly the grades `q < qlow j`. -/
theorem band_le_of_facts {j : ℕ} {bounds : List ℕ} {ts : List PartialTable} {num : ℤ}
    {den : ℕ} {eps : ℤ} (hF : FactsOf j bounds ts num den eps) (hden : 0 < den) {ρ : ℝ}
    (hρ : 0 ≤ ρ) (hQ : TwistQuadHyp j ρ) (M : ℕ) (hM : qlow j ≤ M) (a : ℕ → ℕ → ℕ → ℚ)
    (ha : ∀ q c d, q < qlow j → c < q + 2 → d < q + 1 →
      (a q c d : ℝ) = centerR (centerInts j) (twistParams j).E q c d)
    (B : Set Idx2) [DecidablePred (· ∈ B)] (hB : ∀ i : GradedIdx (qlow j), gradedIdx i ∈ B)
    (hdegree : ∀ i ∈ B, (bideg i).1 + (bideg i).2 < 2 * qlow j) (heps : 0 ≤ eps) :
    ‖projOn B (hpowL2 j - gradedHermite M a)‖ ≤ ρ + Real.sqrt ((eps : ℝ) / 2 ^ (4 * KOut)) := by
  obtain ⟨-, hlow⟩ := gauss_sums_of_facts hF hden
  have hlowQ : qlow j ≤ (twistParams j).Q := (paramsOK_twistParams j hF.hj).hlow
  rw [← Real.sqrt_sq (add_nonneg hρ (Real.sqrt_nonneg _)), ← Real.sqrt_sq (norm_nonneg _)]
  apply Real.sqrt_le_sqrt
  rw [norm_projOn_chargeOne_sub_graded_sq B (hpowL2 j) (chargeOne_hpowL2 j) (qlow j) M a hdegree]
  have hB' : ∀ (q : Fin (qlow j)) (c : Fin (q.val + 2)) (d : Fin (q.val + 1)),
      gradedMode q c d ∈ B := fun q c d => hB ⟨q, (c, d)⟩
  rw [Fintype.sum_sigma]
  simp only [Fintype.sum_prod_type, gradedIdx, hB', ↓reduceIte]
  rw [FixedChaosSmoothing.sum_bounded_graded_eq_range (qlow j)
    (fun q c d => ‖⟪hvec2 (gradedMode q c d), hpowL2 j⟫_ℂ -
      (if q < M then (a q c d : ℂ) else 0)‖ ^ 2)]
  have hsum : ∑ q ∈ Finset.range (qlow j), ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
      ‖⟪hvec2 (gradedMode q c d), hpowL2 j⟫_ℂ - (if q < M then (a q c d : ℂ) else 0)‖ ^ 2 =
      ∑ q ∈ Finset.range (qlow j), ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
        (((∫ s in Set.Ioi (0 : ℝ), twistIntegrand j q c d s) - twistGauss j q c d) +
          (twistGauss j q c d - centerR (centerInts j) (twistParams j).E q c d)) ^ 2 := by
    refine sum3_congr fun q c d hq hc hd ↦ ?_
    have h := twistCoefficient_eq_ofReal j q c d (by omega) (by omega)
    unfold twistCoefficient at h
    have hqM : q < M := by omega
    simp only [hqM, ↓reduceIte]
    rw [h, ← Complex.ofReal_ratCast, ← Complex.ofReal_sub, Complex.norm_real,
      Real.norm_eq_abs, sq_abs, ha q c d hq hc hd]
    ring
  rw [hsum]
  apply sum3_add_sq_le _ _ _ hρ (Real.sqrt_nonneg _)
  · exact le_trans (sum3_le_of_le hlowQ _ fun _ _ _ => sq_nonneg _) hQ
  · rw [Real.sq_sqrt (by positivity)]
    exact hlow

end

end Grothe.UpperQuad
