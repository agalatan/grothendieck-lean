import Grothe.UpperQuad.Bridge
import Grothe.UpperChaos.ConditionalCoefficientReflection
import Grothe.UpperChaos.F0ConditionalReality
import GrotheQuadKernel.Omitted

/-!
# The omitted pairs of the cutoffs (part (C) of `hQuad`): the mathematics of one node

A node with cutoff `D` leaves out the terms of the pairs `c + d > D`.  The omitted term at the entry
`(k, j, cIdx)` is `omittedTerm`; added to the node's `nodeTerm` (with the cutoff) it gives the full
term (`nodeTerm_add_omittedTerm`).  The graded coefficients of the omitted raw vector have, mode by
mode, the squared value `F_{row}² · ‖U_{c,d}‖²` with `F` the row factor `ψ_{k,j}(s) e^{−s} W` and `U`
the canonical coefficient of the pair (canonical modes directly, reflected ones through
`canonicalCoefficient_reflection`; `gradeValue_omitted_sq`), so their squared `ℓ²` norm is at most
`rowSum · omittedMass` (`sum_sq_omitted_le`: the map mode ↦ (row, pair) is injective in `q` for a fixed
pair).  The kernel's `factorsSqHi` bounds `rowSum` (`rowSum_le_factorsSqHi`) and its `deficitFx`
bounds `omittedMass` through Bessel over the canonical pairs and their reflections
(`omittedMass_le_deficitFx`), giving `omittedNodeBound_sound`.  The sum over the nodes is
`Grothe/UpperQuad/OmittedTotal.lean`.

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace Grothe.UpperQuad

open GrotheQuad Grothe.UpperChaos Grothe.UpperChaos.F0ConditionalEvaluator

/-! ### The omitted term of a node -/

/-- The row factor `ψ_{k,j}(s) e^{−s} W` of a node. -/
noncomputable def rowFactor (s W : ℝ) (k j : ℕ) : ℝ :=
  RadialLaguerre.radialFactor k j s * (Real.exp (-s) * W)

/-- The omitted term of a node with cutoff `D` at the entry `(k, j, cIdx)`: the exact term of the
pairs beyond the cutoff inside the triangle, zero elsewhere. -/
noncomputable def omittedTerm (s W : ℝ) (D k j cIdx : ℕ) : ℝ :=
  if cIdx < activeCols k j ∧ D < (pairOf k cIdx).1 + (pairOf k cIdx).2 then
    rowFactor s W k j * nodeCoef s (pairOf k cIdx)
  else 0

/-- Every pair of the triangle has degree at most `501`. -/
lemma pairOf_degree_le (k j cIdx : ℕ) (hk : k < numCharges) (hc : cIdx < activeCols k j) :
    (pairOf k cIdx).1 + (pairOf k cIdx).2 ≤ 501 := by
  unfold pairOf activeCols blockSide numCharges at *
  split_ifs at hc ⊢ with h <;> simp only [beq_iff_eq] at h <;> omega

/-- The node term with the cutoff plus the omitted term is the full term (cutoff `531`). -/
lemma nodeTerm_add_omittedTerm (s W : ℝ) (D k j cIdx : ℕ) :
    nodeTerm s W D 0 251 k j cIdx + omittedTerm s W D k j cIdx = nodeTerm s W 531 0 251 k j cIdx := by
  unfold nodeTerm omittedTerm rowFactor
  by_cases hk : k < numCharges
  · by_cases hact : cIdx < activeCols k j
    · have hg := entryGrade_lt k j cIdx hk hact
      have hdeg := pairOf_degree_le k j cIdx hk hact
      by_cases hD : (pairOf k cIdx).1 + (pairOf k cIdx).2 ≤ D
      · have hnot : ¬ D < (pairOf k cIdx).1 + (pairOf k cIdx).2 := not_lt.mpr hD
        simp only [hact, hg, hD, hnot, Nat.zero_le, and_true, and_false,
          ↓reduceIte, show (pairOf k cIdx).1 + (pairOf k cIdx).2 ≤ 531 by omega, add_zero]
      · have hlt : D < (pairOf k cIdx).1 + (pairOf k cIdx).2 := not_le.mp hD
        simp only [hact, hg, hD, hlt, Nat.zero_le, and_true, and_false,
          ↓reduceIte, show (pairOf k cIdx).1 + (pairOf k cIdx).2 ≤ 531 by omega, zero_add]
    · simp only [hact, false_and, ↓reduceIte, add_zero]
  · have hact : ¬ cIdx < activeCols k j := by
      unfold activeCols blockSide numCharges at *
      split_ifs <;> simp only [beq_iff_eq] at * <;> omega
    simp only [hact, false_and, ↓reduceIte, add_zero]

/-! ### The squared coefficient of a mode -/

/-- `nodeCoef s p ^ 2 = ‖U_p(A)‖²`: the sign is `±1` and `U` is real. -/
lemma nodeCoef_sq (s : ℝ) (p : ℕ × ℕ) :
    nodeCoef s p ^ 2 = ‖canonicalCoefficient (profileShift s) p‖ ^ 2 := by
  unfold nodeCoef
  have hsign : (profileSign s ^ (p.1 + p.2)) ^ 2 = 1 := by
    have : profileSign s ^ 2 = 1 := by
      unfold profileSign; split_ifs <;> norm_num
    rw [← pow_mul, mul_comm, pow_mul, this, one_pow]
  have hre := canonicalCoefficient_eq_ofReal_re (profileShift s) p
  rw [mul_pow, hsign, one_mul]
  conv_rhs => rw [hre]
  rw [Complex.norm_real, Real.norm_eq_abs, sq_abs]

/-- The reflection identity for the squared coefficients: `‖U(c,d)‖² = ((d+1)/c) ‖U(d+1, c−1)‖²`
for `c ≥ 1`. -/
lemma norm_canonicalCoefficient_sq_reflect (A : ℝ) (c d : ℕ) (hc : 1 ≤ c) :
    ‖canonicalCoefficient A (c, d)‖ ^ 2 =
      (((d + 1 : ℕ) : ℝ) / (c : ℝ)) * ‖canonicalCoefficient A (d + 1, c - 1)‖ ^ 2 := by
  obtain ⟨c', rfl⟩ := Nat.exists_eq_add_one_of_ne_zero (by omega : c ≠ 0)
  rw [canonicalCoefficient_reflection A d c', norm_mul, mul_pow, Complex.norm_real,
    Real.norm_eq_abs, sq_abs, Real.sq_sqrt (by positivity)]
  simp only [Nat.add_sub_cancel]

/-- The raw row of a mode: the canonical entry for `c ≤ d + 1`, the partner's row otherwise. -/
def rowOf (q c d : ℕ) : ℕ × ℕ :=
  if c ≤ d + 1 then (d + 1 - c, q - d) else (c - 1 - d, q + 1 - c)

lemma pairOf_canonical (c d : ℕ) (hc : c ≤ d + 1) :
    pairOf (d + 1 - c) (if d + 1 - c = 0 then c - 1 else c) = (c, d) := by
  unfold pairOf
  split_ifs with h1 h2 h2 <;> simp only [beq_iff_eq] at * <;> ext <;> simp only <;> omega

lemma col_lt_activeCols (q c d : ℕ) (hq : q < 251) (hd : d ≤ q) (hc : c ≤ d + 1) :
    (if d + 1 - c = 0 then c - 1 else c) < activeCols (d + 1 - c) (q - d) := by
  unfold activeCols blockSide
  split_ifs with h1 h2 <;> simp only [beq_iff_eq] at * <;> omega

/-- The squared graded coefficient of the omitted raw vector at a head mode. -/
lemma gradeValue_omitted_sq (s W : ℝ) (D q c d : ℕ) (hq : q < 251) (hc : c < q + 2)
    (hd : d < q + 1) :
    gradeValue (omittedTerm s W D) (fun _ _ _ => 0) q c d ^ 2 =
      if D < c + d then
        rowFactor s W (rowOf q c d).1 (rowOf q c d).2 ^ 2 *
          ‖canonicalCoefficient (profileShift s) (c, d)‖ ^ 2
      else 0 := by
  unfold gradeValue rawValue rowOf
  simp only [add_zero]
  by_cases hcd : c ≤ d + 1
  · simp only [hcd, ↓reduceIte]
    unfold omittedTerm
    rw [pairOf_canonical c d hcd]
    have hcol := col_lt_activeCols q c d hq (by omega) hcd
    by_cases hD : D < c + d
    · simp only [hcol, hD, and_self, ↓reduceIte, mul_pow, nodeCoef_sq]
    · simp only [hcol, hD, and_false, ↓reduceIte, ne_eq, OfNat.ofNat_ne_zero, not_false_eq_true,
        zero_pow]
  · simp only [hcd, ↓reduceIte]
    have hc1 : 1 ≤ c := by omega
    unfold omittedTerm
    have hk : c - 1 + 1 - (d + 1) = c - 1 - d := by omega
    have hj : q - (c - 1) = q + 1 - c := by omega
    have hpair : pairOf (c - 1 - d) (if c - 1 - d = 0 then d else d + 1) = (d + 1, c - 1) := by
      have := pairOf_canonical (d + 1) (c - 1) (by omega)
      rwa [hk, Nat.add_sub_cancel] at this
    have hcol : (if c - 1 - d = 0 then d else d + 1) < activeCols (c - 1 - d) (q + 1 - c) := by
      have := col_lt_activeCols q (d + 1) (c - 1) hq (by omega) (by omega)
      rwa [hk, hj, Nat.add_sub_cancel] at this
    rw [hk, hj, Nat.add_sub_cancel, hpair]
    have hdeg : (d + 1, c - 1).1 + (d + 1, c - 1).2 = c + d := by simp only; omega
    rw [hdeg]
    by_cases hD : D < c + d
    · simp only [hcol, hD, and_self, ↓reduceIte, mul_pow, nodeCoef_sq,
        Real.sq_sqrt (by positivity : (0 : ℝ) ≤ ((d + 1 : ℕ) : ℝ) / (c : ℝ))]
      rw [norm_canonicalCoefficient_sq_reflect _ c d hc1]
      ring
    · simp only [hcol, hD, and_false, ↓reduceIte, ne_eq, OfNat.ofNat_ne_zero, not_false_eq_true,
        zero_pow, zero_mul]

/-! ### The per-node `ℓ²` bound -/

/-- The active rows of the degree-501 triangle. -/
@[irreducible] def activeRows : Finset (ℕ × ℕ) :=
  ((Finset.range numCharges) ×ˢ (Finset.range 252)).filter fun kj =>
    kj.2 < blockSide kj.1 ∧ rowActive 0 251 kj.1 kj.2 = true

/-- `Z = Σ_{(k,j) active} F_{k,j}²`. -/
noncomputable def rowSum (s W : ℝ) : ℝ := ∑ kj ∈ activeRows, rowFactor s W kj.1 kj.2 ^ 2

/-- The pairs of the head modes beyond the cutoff `D`. -/
@[irreducible] def omitPairs (D : ℕ) : Finset (ℕ × ℕ) :=
  ((Finset.range 252) ×ˢ (Finset.range 251)).filter fun p => D < p.1 + p.2

/-- `m = Σ_{(c,d) omitted} ‖U_{c,d}(A)‖²`. -/
noncomputable def omittedMass (A : ℝ) (D : ℕ) : ℝ :=
  ∑ p ∈ omitPairs D, ‖canonicalCoefficient A p‖ ^ 2

lemma rowSum_nonneg (s W : ℝ) : 0 ≤ rowSum s W :=
  Finset.sum_nonneg fun _ _ => sq_nonneg _

lemma omittedMass_nonneg (A : ℝ) (D : ℕ) : 0 ≤ omittedMass A D :=
  Finset.sum_nonneg fun _ _ => sq_nonneg _

/-- The row of a head mode is active. -/
lemma rowOf_mem_activeRows (q c d : ℕ) (hq : q < 251) (hc : c < q + 2) (hd : d < q + 1) :
    rowOf q c d ∈ activeRows := by
  unfold activeRows rowOf
  rw [Finset.mem_filter, Finset.mem_product, Finset.mem_range, Finset.mem_range]
  unfold rowActive blockLo blockHi activeCols blockSide dOff numCharges
  split_ifs <;> simp only [beq_iff_eq, decide_eq_true_eq] at * <;> omega

/-- For a fixed pair, the row of the mode determines `q`. -/
lemma rowOf_injective (c d : ℕ) : Set.InjOn (fun q => rowOf q c d)
    ↑((Finset.range 251).filter fun q => c < q + 2 ∧ d < q + 1) := by
  intro q hq q' hq' h
  rw [Finset.mem_coe, Finset.mem_filter, Finset.mem_range] at hq hq'
  unfold rowOf at h
  split_ifs at h with hcd <;> simp only [Prod.mk.injEq] at h <;> omega

/-- A sum over the bounded head modes as a sum over the pairs, with the `q`-sum inside. -/
lemma sum_head_eq_sum_pairs (g : ℕ → ℕ → ℕ → ℝ) :
    ∑ q ∈ Finset.range 251, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1), g q c d =
      ∑ p ∈ (Finset.range 252) ×ˢ (Finset.range 251),
        ∑ q ∈ (Finset.range 251).filter (fun q => p.1 < q + 2 ∧ p.2 < q + 1), g q p.1 p.2 := by
  have hc : ∀ q ∈ Finset.range 251, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1), g q c d =
      ∑ p ∈ (Finset.range 252) ×ˢ (Finset.range 251),
        if p.1 < q + 2 ∧ p.2 < q + 1 then g q p.1 p.2 else 0 := by
    intro q hq
    rw [Finset.mem_range] at hq
    rw [Finset.sum_product, ← Finset.sum_filter_add_sum_filter_not (Finset.range 252) (· < q + 2)]
    have h1 : (Finset.range 252).filter (· < q + 2) = Finset.range (q + 2) := by
      ext c; simp only [Finset.mem_filter, Finset.mem_range]; omega
    have h2 : ∑ c ∈ (Finset.range 252).filter (fun c => ¬ c < q + 2),
        ∑ d ∈ Finset.range 251, (if c < q + 2 ∧ d < q + 1 then g q c d else 0) = 0 := by
      apply Finset.sum_eq_zero
      intro c hc
      simp only [Finset.mem_filter] at hc
      apply Finset.sum_eq_zero
      intro d _
      simp [hc.2]
    rw [h1, h2, add_zero]
    apply Finset.sum_congr rfl
    intro c hc
    rw [Finset.mem_range] at hc
    rw [← Finset.sum_filter_add_sum_filter_not (Finset.range 251) (· < q + 1)]
    have h3 : (Finset.range 251).filter (· < q + 1) = Finset.range (q + 1) := by
      ext d; simp only [Finset.mem_filter, Finset.mem_range]; omega
    have h4 : ∑ d ∈ (Finset.range 251).filter (fun d => ¬ d < q + 1),
        (if c < q + 2 ∧ d < q + 1 then g q c d else 0) = 0 := by
      apply Finset.sum_eq_zero
      intro d hd
      simp only [Finset.mem_filter] at hd
      simp [hd.2]
    rw [h3, h4, add_zero]
    apply Finset.sum_congr rfl
    intro d hd
    rw [Finset.mem_range] at hd
    simp [hc, hd]
  rw [Finset.sum_congr rfl hc, Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro p _
  rw [Finset.sum_filter]

set_option linter.constructorNameAsVariable false in
/-- **The squared `ℓ²` norm of a node's omitted graded coefficients is at most `Z · m`.** -/
theorem sum_sq_omitted_le (s W : ℝ) (D : ℕ) :
    ∑ q ∈ Finset.range 251, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
      gradeValue (omittedTerm s W D) (fun _ _ _ => 0) q c d ^ 2 ≤
      rowSum s W * omittedMass (profileShift s) D := by
  rw [sum_head_eq_sum_pairs]
  unfold omittedMass omitPairs
  rw [Finset.mul_sum, Finset.sum_filter]
  apply Finset.sum_le_sum
  intro p hp
  simp only [Finset.mem_product, Finset.mem_range] at hp
  have hterm : ∀ q ∈ (Finset.range 251).filter (fun q => p.1 < q + 2 ∧ p.2 < q + 1),
      gradeValue (omittedTerm s W D) (fun _ _ _ => 0) q p.1 p.2 ^ 2 =
        if D < p.1 + p.2 then
          rowFactor s W (rowOf q p.1 p.2).1 (rowOf q p.1 p.2).2 ^ 2 *
            ‖canonicalCoefficient (profileShift s) (p.1, p.2)‖ ^ 2
        else 0 := by
    intro q hq
    simp only [Finset.mem_filter, Finset.mem_range] at hq
    exact gradeValue_omitted_sq s W D q p.1 p.2 hq.1 hq.2.1 hq.2.2
  rw [Finset.sum_congr rfl hterm]
  by_cases hD : D < p.1 + p.2
  · simp only [hD, ↓reduceIte, ← Finset.sum_mul]
    apply mul_le_mul_of_nonneg_right _ (sq_nonneg _)
    have hi := Finset.sum_image (f := fun kj : ℕ × ℕ => rowFactor s W kj.1 kj.2 ^ 2)
      (rowOf_injective p.1 p.2)
    rw [← hi]
    unfold rowSum
    apply Finset.sum_le_sum_of_subset_of_nonneg
    · intro kj hkj
      rw [Finset.mem_image] at hkj
      obtain ⟨q, hq, rfl⟩ := hkj
      simp only [Finset.mem_filter, Finset.mem_range] at hq
      exact rowOf_mem_activeRows q p.1 p.2 hq.1 hq.2.1 hq.2.2
    · intros; exact sq_nonneg _
  · simp [hD]

/-! ### The kernel's bounds: the squared node factors -/

lemma sqHiFx_nonneg (v : Fx) : 0 ≤ sqHiFx v :=
  le_max_of_le_left (mul_self_nonneg _)

lemma pow_two_KFix_sq : ((2 : ℝ) ^ KFix) ^ 2 = (2 : ℝ) ^ (2 * KFix) := by
  rw [← pow_mul, mul_comm]

lemma sqHiFx_sound {x : ℝ} {v : Fx} (h : memFx x v) :
    x ^ 2 * (2 : ℝ) ^ (2 * KFix) ≤ (sqHiFx v : ℝ) := by
  obtain ⟨h1, h2⟩ := h
  unfold sqHiFx
  rw [← pow_two_KFix_sq, ← mul_pow]
  push_cast
  rcases le_or_gt 0 (x * 2 ^ KFix) with hy0 | hy0
  · calc (x * 2 ^ KFix) ^ 2 ≤ (v.hi : ℝ) ^ 2 := pow_le_pow_left₀ hy0 h2 2
      _ ≤ max ((v.lo : ℝ) * v.lo) ((v.hi : ℝ) * v.hi) := by rw [sq]; exact le_max_right _ _
  · calc (x * 2 ^ KFix) ^ 2 ≤ (v.lo : ℝ) ^ 2 := by nlinarith
      _ ≤ max ((v.lo : ℝ) * v.lo) ((v.hi : ℝ) * v.hi) := by rw [sq]; exact le_max_left _ _

lemma sqLoFx_sound {x : ℝ} {v : Fx} (h : memFx x v) :
    (sqLoFx v : ℝ) ≤ x ^ 2 * (2 : ℝ) ^ (2 * KFix) := by
  obtain ⟨h1, h2⟩ := h
  unfold sqLoFx
  rw [← pow_two_KFix_sq, ← mul_pow]
  split_ifs with hlo hhi
  · push_cast
    have : (0 : ℝ) ≤ v.lo := by exact_mod_cast hlo
    nlinarith
  · push_cast
    have : (v.hi : ℝ) ≤ 0 := by exact_mod_cast hhi
    nlinarith
  · push_cast
    positivity

lemma factorsSqHi_eq (factors : Array (Array Fx)) :
    (factorsSqHi factors : ℝ) = ∑ k ∈ Finset.range numCharges, ∑ j ∈ Finset.range (blockSide k),
      (sqHiFx ((factors.getD k #[]).getD j default) : ℝ) := by
  unfold factorsSqHi
  rw [foldl_add_eq_sum_int, zero_add]
  push_cast
  apply Finset.sum_congr rfl
  intro k _
  rw [foldl_add_eq_sum_int, zero_add]
  push_cast
  rfl

/-- All rows of the blocks (the summation range of `factorsSqHi`). -/
@[irreducible] def allRows : Finset (ℕ × ℕ) :=
  ((Finset.range numCharges) ×ˢ (Finset.range 252)).filter fun kj => kj.2 < blockSide kj.1

lemma mem_allRows {kj : ℕ × ℕ} :
    kj ∈ allRows ↔ (kj.1 < numCharges ∧ kj.2 < 252) ∧ kj.2 < blockSide kj.1 := by
  unfold allRows
  rw [Finset.mem_filter, Finset.mem_product, Finset.mem_range, Finset.mem_range]

lemma mem_activeRows {kj : ℕ × ℕ} :
    kj ∈ activeRows ↔ (kj.1 < numCharges ∧ kj.2 < 252) ∧
      kj.2 < blockSide kj.1 ∧ rowActive 0 251 kj.1 kj.2 = true := by
  unfold activeRows
  rw [Finset.mem_filter, Finset.mem_product, Finset.mem_range, Finset.mem_range]

lemma activeRows_subset_allRows : activeRows ⊆ allRows := by
  intro kj h
  rw [mem_activeRows] at h
  rw [mem_allRows]
  exact And.intro h.1 h.2.1

lemma sum_allRows (g : ℕ × ℕ → ℝ) :
    ∑ kj ∈ allRows, g kj = ∑ k ∈ Finset.range numCharges, ∑ j ∈ Finset.range (blockSide k), g (k, j) := by
  unfold allRows
  rw [Finset.sum_filter, Finset.sum_product]
  apply Finset.sum_congr rfl
  intro k _
  rw [← Finset.sum_filter]
  have : (Finset.range 252).filter (fun j => j < blockSide k) = Finset.range (blockSide k) := by
    ext j
    simp only [Finset.mem_filter, Finset.mem_range]
    unfold blockSide
    split_ifs <;> omega
  rw [this]

set_option linter.constructorNameAsVariable false in
/-- `Z` is bounded by `factorsSqHi` of any table enclosing the row factors on the active rows. -/
theorem rowSum_le_factorsSqHi_of (F : Array (Array Fx)) {s W : ℝ}
    (hmem : ∀ kj ∈ activeRows,
      memFx (rowFactor s W kj.1 kj.2) ((F.getD kj.1 #[]).getD kj.2 default)) :
    rowSum s W * (2 : ℝ) ^ (2 * KFix) ≤ (factorsSqHi F : ℝ) := by
  have hnn : ∀ kj : ℕ × ℕ, (0 : ℝ) ≤ (sqHiFx ((F.getD kj.1 #[]).getD kj.2 default) : ℝ) :=
    fun kj => Int.cast_nonneg (sqHiFx_nonneg _)
  rw [factorsSqHi_eq]
  unfold rowSum
  rw [Finset.sum_mul]
  calc ∑ kj ∈ activeRows, rowFactor s W kj.1 kj.2 ^ 2 * (2 : ℝ) ^ (2 * KFix)
      ≤ ∑ kj ∈ activeRows, (sqHiFx ((F.getD kj.1 #[]).getD kj.2 default) : ℝ) :=
        Finset.sum_le_sum fun kj hkj => sqHiFx_sound (hmem kj hkj)
    _ ≤ ∑ kj ∈ allRows, (sqHiFx ((F.getD kj.1 #[]).getD kj.2 default) : ℝ) :=
        Finset.sum_le_sum_of_subset_of_nonneg activeRows_subset_allRows fun kj _ _ => hnn kj
    _ = ∑ k ∈ Finset.range numCharges, ∑ j ∈ Finset.range (blockSide k),
          (sqHiFx ((F.getD k #[]).getD j default) : ℝ) :=
        sum_allRows fun kj => (sqHiFx ((F.getD kj.1 #[]).getD kj.2 default) : ℝ)

/-- The kernel's `factorsSqHi` of the node factors bounds `Z` (scale `2^(2 KFix)`). -/
theorem rowSum_le_factorsSqHi (P : ℕ) (hP : 1 ≤ P) {s W : ℝ} {sI wI : Ival} (hs0 : 0 ≤ s)
    (hs : mem s sI) (hw : mem W wI) (hv : nodeFactorsValid P sI = true) :
    rowSum s W * (2 : ℝ) ^ (2 * KFix) ≤ (factorsSqHi (nodeFactors P sI wI 0 251) : ℝ) := by
  apply rowSum_le_factorsSqHi_of
  intro kj hkj
  rw [mem_activeRows] at hkj
  unfold rowFactor
  exact memFx_nodeFactors P hP hs0 hs hw hv 0 251 kj.1 kj.2 hkj.1.1 hkj.2.1 hkj.2.2

/-! ### The kernel's bounds: the Bessel deficit -/

/-- The canonical pairs of degree `≤ D` (`d ≤ 265`). -/
@[irreducible] def canSet (D : ℕ) : Finset (ℕ × ℕ) :=
  ((Finset.range 267) ×ˢ (Finset.range 266)).filter fun p => p.1 ≤ p.2 + 1 ∧ p.1 + p.2 ≤ D

lemma mem_canSet {D : ℕ} {p : ℕ × ℕ} :
    p ∈ canSet D ↔ (p.1 < 267 ∧ p.2 < 266) ∧ p.1 ≤ p.2 + 1 ∧ p.1 + p.2 ≤ D := by
  unfold canSet
  rw [Finset.mem_filter, Finset.mem_product, Finset.mem_range, Finset.mem_range]

/-- The weight `pairWeightNum / (d+1)` of a canonical pair. -/
noncomputable def wt (p : ℕ × ℕ) : ℝ := (pairWeightNum p.1 p.2 : ℝ) / ((p.2 : ℝ) + 1)

/-- `Σ_{p canonical, deg ≤ D} wt p · ‖U_p‖²`: the mass of the retained pairs and their reflections. -/
noncomputable def besselReal (A : ℝ) (D : ℕ) : ℝ :=
  ∑ p ∈ canSet D, wt p * ‖canonicalCoefficient A p‖ ^ 2

lemma int_div_cast_le (a b : ℤ) (hb : 0 < b) : ((a / b : ℤ) : ℝ) ≤ (a : ℝ) / b := by
  have h := Int.ediv_mul_le a hb.ne'
  have hb' : (0 : ℝ) < b := by exact_mod_cast hb
  rw [le_div_iff₀ hb']
  exact_mod_cast h

lemma pairTermLo_sound {s : ℝ} (c d : ℕ) {v : Fx} (h : memFx (nodeCoef s (c, d)) v) :
    (pairTermLo c d v : ℝ) ≤
      wt (c, d) * ‖canonicalCoefficient (profileShift s) (c, d)‖ ^ 2 * (2 : ℝ) ^ (2 * KFix) := by
  unfold pairTermLo wt
  have h1 := int_div_cast_le (sqLoFx v * (pairWeightNum c d : ℤ)) ((d : ℤ) + 1) (by positivity)
  have h2 := sqLoFx_sound h
  rw [nodeCoef_sq] at h2
  have hw : (0 : ℝ) ≤ (pairWeightNum c d : ℝ) := Nat.cast_nonneg _
  calc _ ≤ ((sqLoFx v * (pairWeightNum c d : ℤ) : ℤ) : ℝ) / (((d : ℤ) + 1 : ℤ) : ℝ) := h1
    _ ≤ _ := by
        push_cast
        rw [div_mul_eq_mul_div, div_mul_eq_mul_div, div_le_div_iff_of_pos_right (by positivity)]
        nlinarith [h2, hw]

lemma canonicalPairs_toFinset (D : ℕ) : (canonicalPairs D 265).toList.toFinset = canSet D := by
  ext p
  rw [List.mem_toFinset, Array.mem_toList_iff, mem_canSet]
  constructor
  · intro h
    have := canonicalPairs_mem h
    omega
  · rintro ⟨⟨hc, hd⟩, hcd, hD⟩
    have := canonicalPairs_rank D 265 p.1 p.2 hcd (by omega) hD
    exact Array.mem_iff_getElem?.mpr ⟨_, this⟩

lemma canonicalPairs_nodup (D dMax : ℕ) : (canonicalPairs D dMax).toList.Nodup := by
  unfold canonicalPairs
  show ((List.range (D + 1)).flatMap (levelPairs dMax)).Nodup
  rw [List.nodup_flatMap]
  constructor
  · intro m _
    unfold levelPairs
    apply List.Nodup.map _ List.nodup_range
    intro i j h
    simp only [Prod.mk.injEq] at h
    omega
  · refine List.Pairwise.imp (fun {a b} hab => ?_) List.nodup_range
    intro p hpa hpb
    have h1 := (levelPairs_mem hpa).1
    have h2 := (levelPairs_mem hpb).1
    omega

lemma list_sum_map_eq_sum_fin {α M : Type*} [AddCommMonoid M] (l : List α) (G : α → M) :
    (l.map G).sum = ∑ j : Fin l.length, G (l.get j) := by
  conv_lhs => rw [← List.ofFn_getElem (xs := l)]
  rw [List.map_ofFn, List.sum_ofFn]
  rfl

/-- A sum over the canonical array is a sum over the canonical set. -/
lemma sum_canonicalPairs (D : ℕ) (f : ℕ × ℕ → ℝ) :
    ∑ i ∈ Finset.range (canonicalPairs D 265).size, f ((canonicalPairs D 265).getD i (0, 0)) =
      ∑ p ∈ canSet D, f p := by
  rw [← canonicalPairs_toFinset, List.sum_toFinset _ (canonicalPairs_nodup D 265),
    list_sum_map_eq_sum_fin, ← Fin.sum_univ_eq_sum_range]
  apply Finset.sum_congr rfl
  intro i _
  rw [Array.getD_eq_getD_getElem?, Array.getElem?_eq_getElem i.isLt, Option.getD_some,
    List.get_eq_getElem, Array.getElem_toList]

/-- The kernel's `besselLowerFx` is below the retained mass (scale `2^(2 KFix)`). -/
theorem besselLowerFx_sound (D : ℕ) {s : ℝ} {valsFx : Array Fx}
    (hvals : ∀ i, i < (canonicalPairs D 265).size →
      memFx (nodeCoef s ((canonicalPairs D 265).getD i (0, 0))) (valsFx.getD i default)) :
    (besselLowerFx D valsFx : ℝ) ≤ besselReal (profileShift s) D * (2 : ℝ) ^ (2 * KFix) := by
  unfold besselLowerFx
  rw [foldl_add_eq_sum_int, zero_add]
  push_cast
  unfold besselReal
  rw [← sum_canonicalPairs D (fun p => wt p * ‖canonicalCoefficient (profileShift s) p‖ ^ 2),
    Finset.sum_mul]
  apply Finset.sum_le_sum
  intro i hi
  rw [Finset.mem_range] at hi
  have h := pairTermLo_sound (s := s) ((canonicalPairs D 265).getD i (0, 0)).1
    ((canonicalPairs D 265).getD i (0, 0)).2 (hvals i hi)
  simpa using h

/-- The reflection `(c, d) ↦ (d+1, c−1)`. -/
def reflPair (p : ℕ × ℕ) : ℕ × ℕ := (p.2 + 1, p.1 - 1)

/-- The reflections `(d+1, c−1)` of the canonical pairs `1 ≤ c ≤ d` of degree `≤ D`. -/
@[irreducible] def refSet (D : ℕ) : Finset (ℕ × ℕ) :=
  ((canSet D).filter fun p => 1 ≤ p.1 ∧ p.1 ≤ p.2).image reflPair

lemma mem_refSet {D : ℕ} {p : ℕ × ℕ} :
    p ∈ refSet D ↔ ∃ q ∈ canSet D, (1 ≤ q.1 ∧ q.1 ≤ q.2) ∧ reflPair q = p := by
  unfold refSet
  rw [Finset.mem_image]
  constructor
  · intro h
    obtain ⟨q, hq, hqe⟩ := h
    rw [Finset.mem_filter] at hq
    exact ⟨q, hq.1, hq.2, hqe⟩
  · intro h
    obtain ⟨q, hq, h1, hqe⟩ := h
    exact ⟨q, Finset.mem_filter.mpr ⟨hq, h1⟩, hqe⟩

lemma mem_omitPairs {D : ℕ} {p : ℕ × ℕ} :
    p ∈ omitPairs D ↔ (p.1 < 252 ∧ p.2 < 251) ∧ D < p.1 + p.2 := by
  unfold omitPairs
  rw [Finset.mem_filter, Finset.mem_product, Finset.mem_range, Finset.mem_range]

/-- The weighted canonical mass is the mass of the canonical pairs and of their reflections. -/
lemma besselReal_eq (A : ℝ) (D : ℕ) :
    besselReal A D = ∑ p ∈ canSet D, ‖canonicalCoefficient A p‖ ^ 2 +
      ∑ p ∈ refSet D, ‖canonicalCoefficient A p‖ ^ 2 := by
  have hterm : ∀ p ∈ canSet D, wt p * ‖canonicalCoefficient A p‖ ^ 2 =
      ‖canonicalCoefficient A p‖ ^ 2 +
        (if 1 ≤ p.1 ∧ p.1 ≤ p.2 then ‖canonicalCoefficient A (reflPair p)‖ ^ 2 else 0) := by
    intro p _
    unfold wt pairWeightNum
    split_ifs with h
    · unfold reflPair
      rw [norm_canonicalCoefficient_sq_reflect A (p.2 + 1) (p.1 - 1) (by omega)]
      have e1 : p.1 - 1 + 1 = p.1 := by omega
      have e2 : p.2 + 1 - 1 = p.2 := by omega
      rw [e1, e2]
      push_cast
      field_simp
    · have h1 : ((p.2 + 1 : ℕ) : ℝ) / ((p.2 : ℝ) + 1) = 1 := by
        push_cast; field_simp
      rw [h1, one_mul, add_zero]
  have hinj : Set.InjOn reflPair ↑((canSet D).filter fun p => 1 ≤ p.1 ∧ p.1 ≤ p.2) := by
    intro p hp q hq h
    rw [Finset.mem_coe, Finset.mem_filter] at hp hq
    unfold reflPair at h
    simp only [Prod.mk.injEq] at h
    ext <;> omega
  unfold besselReal
  rw [Finset.sum_congr rfl hterm, Finset.sum_add_distrib, Finset.sum_ite, Finset.sum_const_zero,
    add_zero]
  unfold refSet
  rw [Finset.sum_image hinj]

lemma disjoint_canSet_refSet (D : ℕ) : Disjoint (canSet D) (refSet D) := by
  rw [Finset.disjoint_left]
  intro p hpC hpR
  rw [mem_canSet] at hpC
  obtain ⟨q, -, hq, hqe⟩ := mem_refSet.mp hpR
  rw [← hqe] at hpC
  unfold reflPair at hpC
  simp only at hpC
  omega

lemma disjoint_union_omitPairs (D : ℕ) : Disjoint (canSet D ∪ refSet D) (omitPairs D) := by
  rw [Finset.disjoint_left]
  intro p hp hpO
  rw [mem_omitPairs] at hpO
  rcases Finset.mem_union.mp hp with h | h
  · rw [mem_canSet] at h; omega
  · obtain ⟨q, hqC, hq, hqe⟩ := mem_refSet.mp h
    rw [mem_canSet] at hqC
    rw [← hqe] at hpO
    unfold reflPair at hpO
    simp only at hpO
    omega

/-- Bessel over the canonical pairs, their reflections and the omitted pairs of the head. -/
theorem omittedMass_add_besselReal_le (A : ℝ) (D : ℕ) :
    omittedMass A D + besselReal A D ≤ 1 := by
  have hB := ConditionalSeedNormalization.sum_sq_canonicalCoefficient_le_one A
    (canSet D ∪ refSet D ∪ omitPairs D)
  rw [Finset.sum_union (disjoint_union_omitPairs D), Finset.sum_union (disjoint_canSet_refSet D)]
    at hB
  rw [besselReal_eq]
  unfold omittedMass
  linarith

/-- The kernel's `deficitFx` bounds the omitted mass (scale `2^(2 KFix)`). -/
theorem deficitFx_sound (D : ℕ) {s : ℝ} {valsFx : Array Fx}
    (hvals : ∀ i, i < (canonicalPairs D 265).size →
      memFx (nodeCoef s ((canonicalPairs D 265).getD i (0, 0))) (valsFx.getD i default)) :
    omittedMass (profileShift s) D * (2 : ℝ) ^ (2 * KFix) ≤ (deficitFx D valsFx : ℝ) := by
  have h1 := besselLowerFx_sound D hvals
  have h2 := omittedMass_add_besselReal_le (profileShift s) D
  unfold deficitFx
  push_cast [pow2_cast]
  refine le_trans ?_ (le_max_right _ _)
  nlinarith [h1, h2, (pow_pos (by norm_num : (0 : ℝ) < 2) (2 * KFix))]

lemma deficitFx_nonneg (D : ℕ) (valsFx : Array Fx) : 0 ≤ deficitFx D valsFx := le_max_left _ _

lemma factorsSqHi_nonneg (factors : Array (Array Fx)) : 0 ≤ factorsSqHi factors := by
  have h := factorsSqHi_eq factors
  have : (0 : ℝ) ≤ (factorsSqHi factors : ℝ) := by
    rw [h]
    exact Finset.sum_nonneg fun _ _ => Finset.sum_nonneg fun _ _ => by exact_mod_cast sqHiFx_nonneg _
  exact_mod_cast this

/-! ### The node bound -/

/-- **The kernel's node bound is sound**: the squared `ℓ²` norm of the node's omitted graded
coefficients is at most `(b / 2^(2 KFix))²`. -/
theorem omittedNodeBound_sound (P : ℕ) (hP : 1 ≤ P) {piI : Ival} (hpi : mem Real.pi piI)
    {pd : ProfileData} (hpd : profileAgrees pd) (hpv : profileValid P piI pd = true) (nd : NodeSpec)
    {x : ℝ} (hx : mem x nd.bracket.toIval)
    (hJ : ∀ neg aI, nodeShift P piI pd nd = some (neg, aI) →
      mem (OriginalPositiveMoment.moment 0 (profileShift (specNode nd x) ^ 2))
        (seedJ0I P piI (sqI P aI)))
    {b : ℤ} (hb : omittedNodeBound P piI pd nd = some b) :
    ∑ q ∈ Finset.range 251, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
      gradeValue (omittedTerm (specNode nd x) (specWeight nd x) nd.cutoff) (fun _ _ _ => 0) q c d ^ 2 ≤
      ((b : ℝ) / (2 : ℝ) ^ (2 * KFix)) ^ 2 := by
  unfold omittedNodeBound at hb
  split_ifs at hb with h501
  · simp only [Option.some.injEq] at hb
    subst hb
    simp only [Int.cast_zero, zero_div, ne_eq, OfNat.ofNat_ne_zero, not_false_eq_true, zero_pow]
    apply le_of_eq
    apply Finset.sum_eq_zero
    intro q hq
    apply Finset.sum_eq_zero
    intro c hc
    apply Finset.sum_eq_zero
    intro d hd
    rw [Finset.mem_range] at hq hc hd
    rw [gradeValue_omitted_sq _ _ _ q c d hq hc hd]
    have : ¬ nd.cutoff < c + d := by omega
    simp [this]
  · split at hb
    · exact absurd hb (by simp)
    · rename_i neg aI hshift
      split_ifs at hb with hvalid
      simp only [Option.some.injEq] at hb
      subst hb
      obtain ⟨hs0, hs, hW, -, -, -, -, hvals⟩ :=
        node_sound P hP hpi hpd hpv nd hx hshift hvalid (hJ neg aI hshift)
      obtain ⟨-, -, -, -, -, -, hfv, -, -, -, -⟩ := nodeValid_unpack P nd aI hvalid
      have hZ := rowSum_le_factorsSqHi P hP hs0.le hs hW hfv
      have hvals' : ∀ i, i < (canonicalPairs nd.cutoff 265).size →
          memFx (nodeCoef (specNode nd x) ((canonicalPairs nd.cutoff 265).getD i (0, 0)))
            (((nodeVals P piI nd neg aI).map toFx).getD i default) := fun i hi =>
        memFx_map_toFx _ i (by rw [nodeVals_size]; exact hi) (hvals i hi)
      have hm := deficitFx_sound nd.cutoff hvals'
      have hZ0 : (0 : ℝ) ≤ (factorsSqHi (nodeFactors P (nodeS P nd) (nodeW P nd) 0 251) : ℝ) := by
        exact_mod_cast factorsSqHi_nonneg _
      have hm0 : (0 : ℝ) ≤ (deficitFx nd.cutoff ((nodeVals P piI nd neg aI).map toFx) : ℝ) := by
        exact_mod_cast deficitFx_nonneg _ _
      have hpos : (0 : ℝ) < (2 : ℝ) ^ (2 * KFix) := by positivity
      have hZint : 0 ≤ factorsSqHi (nodeFactors P (nodeS P nd) (nodeW P nd) 0 251) :=
        factorsSqHi_nonneg _
      have hmint : 0 ≤ deficitFx nd.cutoff ((nodeVals P piI nd neg aI).map toFx) :=
        deficitFx_nonneg _ _
      generalize hZdef : factorsSqHi (nodeFactors P (nodeS P nd) (nodeW P nd) 0 251) = Z
        at hZ hZ0 hZint ⊢
      generalize hmdef : deficitFx nd.cutoff ((nodeVals P piI nd neg aI).map toFx) = m
        at hm hm0 hmint ⊢
      have hZm : (0 : ℤ) ≤ Z * m := mul_nonneg hZint hmint
      have hsq : ((Z * m : ℤ) : ℝ) ≤ ((isqrtUp (Z * m).toNat : ℕ) : ℝ) ^ 2 := by
        have h := le_isqrtUp (Z * m).toNat
        have hn : (((Z * m).toNat : ℕ) : ℝ) = ((Z * m : ℤ) : ℝ) := by
          have := Int.toNat_of_nonneg hZm
          exact_mod_cast this
        calc ((Z * m : ℤ) : ℝ) = (((Z * m).toNat : ℕ) : ℝ) := hn.symm
          _ = (Real.sqrt (((Z * m).toNat : ℕ) : ℝ)) ^ 2 := (Real.sq_sqrt (Nat.cast_nonneg _)).symm
          _ ≤ ((isqrtUp (Z * m).toNat : ℕ) : ℝ) ^ 2 := pow_le_pow_left₀ (Real.sqrt_nonneg _) h 2
      calc ∑ q ∈ Finset.range 251, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
            gradeValue (omittedTerm (specNode nd x) (specWeight nd x) nd.cutoff) (fun _ _ _ => 0) q c d ^ 2
          ≤ rowSum (specNode nd x) (specWeight nd x) * omittedMass (profileShift (specNode nd x)) nd.cutoff :=
            sum_sq_omitted_le _ _ _
        _ ≤ ((Z : ℝ) / 2 ^ (2 * KFix)) * ((m : ℝ) / 2 ^ (2 * KFix)) := by
            apply mul_le_mul _ _ (omittedMass_nonneg _ _) (by positivity)
            · rw [le_div_iff₀ hpos]; exact hZ
            · rw [le_div_iff₀ hpos]; exact hm
        _ = ((Z * m : ℤ) : ℝ) / ((2 : ℝ) ^ (2 * KFix)) ^ 2 := by push_cast; ring
        _ ≤ ((isqrtUp (Z * m).toNat : ℕ) : ℝ) ^ 2 / ((2 : ℝ) ^ (2 * KFix)) ^ 2 :=
            div_le_div_of_nonneg_right hsq (by positivity)
        _ = ((((isqrtUp (Z * m).toNat : ℕ) : ℤ) : ℝ) / (2 : ℝ) ^ (2 * KFix)) ^ 2 := by
            push_cast; rw [div_pow]

end Grothe.UpperQuad
