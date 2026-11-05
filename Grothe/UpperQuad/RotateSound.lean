import Grothe.UpperQuad.ContractSound
import Grothe.UpperQuad.EnergySound
import GrotheQuadKernel.Rotate
import Grothe.UpperChaos.ProductionSmoothingApprox
import Grothe.Upper.Bivariate

/-!
# Soundness of the saved smoothing matrices and of the fixed-point rotation (the exact part of S9)

The kernel's `savedEntryNum` computes, with big integers, exactly the numerator over `S = 10²²`
of master's `productionSavedEntryQ n c e = savedEntryQ U V W D S n c e`
(`ProductionSmoothingRounding.lean`, `FixedChaosRoundedEntries.lean`), so the matrices the
rotation uses are master's `productionSavedMatrixQ` (`memFx_savedMatrixFx`).  The fixed-point
operations of the rotation (`addFx`, `roundFx`, `sumPairs`, `sqFxAcc`, `reflectFx`, the matrix
products `mulSA`/`mulBT` and the grade energies `gradeEnergies`) enclose the real operations.

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace Grothe.UpperQuad

open MeasureTheory GrotheQuad Grothe.UpperChaos Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries

lemma powers_getD (base n i : ℕ) (hi : i ≤ n) : (powers base n).getD i 0 = base ^ i := by
  unfold powers
  rw [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn]
  have hi' : i < n + 1 := by omega
  simp only [hi', ↓reduceDIte, Option.getD_some]

/-- The moment numerator from the power tables equals master's, when every exponent stays
within the tables (`a + c ≤ n`, `p ≤ n`). -/
lemma momentNumerator_eq (U V W n p r a c : ℕ) (hp : p ≤ n) (hac : a + c ≤ n) :
    momentNumerator (powers U n) (powers V n) (powers W n) p r a c =
      matrixMomentNumerator U V W p r a c := by
  unfold momentNumerator matrixMomentNumerator
  rw [factNat_eq, factNat_eq, foldl_add_eq_sum]
  congr 1
  rw [← Finset.Ico_succ_right_eq_Icc, Finset.sum_Ico_eq_sum_range]
  apply Finset.sum_congr rfl
  intro i hi
  rw [Finset.mem_range] at hi
  unfold momentSummand matrixMomentSummand
  rw [natChoose_eq, natChoose_eq]
  simp only [Nat.cast_id]
  have hk : p - c + i ≤ min a p := by omega
  rw [powers_getD U n _ (by omega), powers_getD V n _ (by omega), powers_getD W n _ (by omega)]
  rw [Nat.choose_eq_fast_choose]

lemma entryFact_eq (n c e : ℕ) (hc : c < n + 1) (he : e < n + 1) :
    entryFact n c e = entryFactorial n ⟨c, hc⟩ ⟨e, he⟩ := by
  unfold entryFact entryFactorial
  simp only [factNat_eq]
  ring

/-- The kernel's saved matrix entries are master's. -/
theorem savedEntryNum_eq (n c e : ℕ) (hc : c < n + 1) (he : e < n + 1) :
    ((savedEntryNum (powers smU n) (powers smV n) (powers smW n) n c e : ℕ) : ℚ) / (smS : ℚ) =
      productionSavedEntryQ n ⟨c, hc⟩ ⟨e, he⟩ := by
  unfold savedEntryNum productionSavedEntryQ savedEntryQ Grothe.UpperChaos.RationalSqrtFloor.sqrtFloor
  rw [momentNumerator_eq smU smV smW n (n - c) c (n - e) e (by omega) (by omega),
    entryFact_eq n c e hc he]
  rfl

/-! ### Fixed-point enclosures of the rotation -/

lemma memFx_addFx {x y : ℝ} {a b : Fx} (hx : memFx x a) (hy : memFx y b) :
    memFx (x + y) (addFx a b) := by
  unfold memFx addFx at *
  push_cast
  constructor <;> linarith [hx.1, hx.2, hy.1, hy.2]

lemma two_pow_two_mul_KFix : (2 : ℝ) ^ (2 * KFix) = 2 ^ KFix * 2 ^ KFix := by
  rw [two_mul, pow_add]

lemma memFx_roundFx {x : ℝ} {p : ℤ × ℤ} (h : memFx2 x p) : memFx x (roundFx p) := by
  unfold memFx2 at h
  rw [two_pow_two_mul_KFix] at h
  unfold memFx roundFx
  have hpos : (0 : ℝ) < 2 ^ KFix := pow_pos two_pos _
  have h1 := shDown_mul_le KFix p.1
  have h2 := le_shUp_mul KFix p.2
  have h' : (p.1 : ℝ) ≤ x * 2 ^ KFix * 2 ^ KFix ∧ x * 2 ^ KFix * 2 ^ KFix ≤ p.2 := by
    rw [mul_assoc]; exact h
  constructor
  · exact le_of_mul_le_mul_right (h1.trans h'.1) hpos
  · exact le_of_mul_le_mul_right (h'.2.trans h2) hpos

lemma memFx2_sumPairs {f : ℕ → ℝ} {g : ℕ → ℤ × ℤ} (n : ℕ) (h : ∀ k, k < n → memFx2 (f k) (g k)) :
    memFx2 (∑ k ∈ Finset.range n, f k) (sumPairs n g) := by
  induction n with
  | zero => simpa [sumPairs] using memFx2_zero
  | succ n ih =>
    unfold sumPairs at ih ⊢
    rw [foldl_range_succ, Finset.sum_range_succ]
    exact memFx2_addPair (ih fun k hk => h k (by omega)) (h n (by omega))

lemma memFx2_sqFxAcc {x : ℝ} {a : Fx} (hx : memFx x a) : memFx2 (x ^ 2) (sqFxAcc a) := by
  have hsc : x ^ 2 * (2 : ℝ) ^ (2 * KFix) = (x * 2 ^ KFix) * (x * 2 ^ KFix) := by
    rw [two_pow_two_mul_KFix]; ring
  unfold memFx2
  rw [hsc]
  unfold memFx at hx
  obtain ⟨h1, h2⟩ := hx
  unfold sqFxAcc
  split_ifs with hlo hhi <;> push_cast
  · have : (0 : ℝ) ≤ a.lo := by exact_mod_cast hlo
    constructor <;> nlinarith
  · have : (a.hi : ℝ) ≤ 0 := by exact_mod_cast hhi
    constructor <;> nlinarith
  · constructor
    · nlinarith
    · rcases le_total 0 (x * 2 ^ KFix) with hy | hy
      · exact (by nlinarith : x * 2 ^ KFix * (x * 2 ^ KFix) ≤ (a.hi : ℝ) * a.hi).trans
          (by exact_mod_cast le_max_right _ _)
      · exact (by nlinarith : x * 2 ^ KFix * (x * 2 ^ KFix) ≤ (a.lo : ℝ) * a.lo).trans
          (by exact_mod_cast le_max_left _ _)

/-- `√((d+1)/c)` is enclosed by `reflectFx c d` (`c ≥ 1`). -/
lemma memFx_reflectFx (c d : ℕ) (hc : 0 < c) :
    memFx (Real.sqrt (((d + 1 : ℕ) : ℝ) / (c : ℝ))) (reflectFx c d) := by
  have hc' : (0 : ℝ) < c := by exact_mod_cast hc
  have hsq : Real.sqrt (((d + 1 : ℕ) : ℝ) / (c : ℝ)) * (2 : ℝ) ^ KFix =
      Real.sqrt ((((d + 1) * 2 ^ (2 * KFix) : ℕ) : ℝ) / (c : ℝ)) := by
    rw [← Real.sqrt_sq (pow_pos two_pos KFix).le, ← Real.sqrt_mul (by positivity)]
    congr 1
    push_cast
    rw [two_mul, pow_add]
    field_simp
  unfold memFx reflectFx
  simp only
  rw [hsq]
  constructor
  · exact (isqrtDown_le _).trans (Real.sqrt_le_sqrt (Nat.cast_div_le))
  · refine (Real.sqrt_le_sqrt ?_).trans (le_isqrtUp _)
    have hmod := Nat.div_add_mod ((d + 1) * 2 ^ (2 * KFix)) c
    have hlt := Nat.mod_lt ((d + 1) * 2 ^ (2 * KFix)) hc
    rw [div_le_iff₀ hc']
    push_cast
    have : (((d + 1) * 2 ^ (2 * KFix) : ℕ) : ℝ) =
        (c : ℝ) * (((d + 1) * 2 ^ (2 * KFix) / c : ℕ) : ℝ) + (((d + 1) * 2 ^ (2 * KFix) % c : ℕ) : ℝ) := by
      exact_mod_cast hmod.symm
    have hlt' : ((((d + 1) * 2 ^ (2 * KFix) % c : ℕ) : ℝ)) < c := by exact_mod_cast hlt
    push_cast at this
    nlinarith

/-- A numerator over `S` is enclosed by `savedToFx`. -/
lemma memFx_savedToFx (num : ℕ) : memFx ((num : ℝ) / (smS : ℝ)) (savedToFx num) := by
  have hS : (0 : ℝ) < smS := by unfold smS; norm_num
  have hSz : (0 : ℤ) < (smS : ℤ) := by unfold smS; norm_num
  unfold memFx savedToFx
  simp only
  have h1 := fdiv_mul_le ((num : ℤ) * pow2 KFix) smS hSz
  have h2 := le_cdiv_mul ((num : ℤ) * pow2 KFix) smS hSz
  push_cast [pow2_cast] at h1 h2
  constructor
  · rw [div_mul_eq_mul_div, le_div_iff₀ hS]; exact h1
  · rw [div_mul_eq_mul_div, div_le_iff₀ hS]; exact h2

/-- The kernel's saved matrix encloses master's `productionSavedEntryQ`. -/
theorem memFx_savedMatrixFx (n c e : ℕ) (hc : c < n + 1) (he : e < n + 1) :
    memFx ((productionSavedEntryQ n ⟨c, hc⟩ ⟨e, he⟩ : ℚ) : ℝ) (getFx (savedMatrixFx n) c e) := by
  rw [← savedEntryNum_eq n c e hc he]
  push_cast
  unfold savedMatrixFx getFx savedMatrixNums savedMatrixNumsFrom
  simp only [Array.getD_eq_getD_getElem?, Array.getElem?_map, Array.getElem?_ofFn, hc, he,
    ↓reduceDIte, Option.map_some, Option.getD_some]
  exact memFx_savedToFx _

lemma getFx_ofFn (r cols : ℕ) (f : ℕ → ℕ → Fx) (i j : ℕ) (hi : i < r) (hj : j < cols) :
    getFx (Array.ofFn fun i : Fin r => Array.ofFn fun j : Fin cols => f i.val j.val) i j = f i j := by
  unfold getFx
  simp only [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn, hi, hj, ↓reduceDIte, Option.getD_some]

/-- `(S · A)[i][j] = Σ_k S[i][k] A[k][j]` is enclosed entrywise. -/
lemma memFx_mulSA {S A : ℕ → ℕ → ℝ} {S' A' : Array (Array Fx)} (r cols : ℕ)
    (hS : ∀ i k, i < r → k < r → memFx (S i k) (getFx S' i k))
    (hA : ∀ k j, k < r → j < cols → memFx (A k j) (getFx A' k j)) (i j : ℕ) (hi : i < r)
    (hj : j < cols) :
    memFx (∑ k ∈ Finset.range r, S i k * A k j) (getFx (mulSA S' r A' cols) i j) := by
  unfold mulSA
  rw [getFx_ofFn r cols (fun i j => roundFx (sumPairs r fun k => mulFx (getFx S' i k) (getFx A' k j)))
    i j hi hj]
  apply memFx_roundFx
  apply memFx2_sumPairs
  intro k hk
  exact memFx2_mulFx (hS i k hi hk) (hA k j hk hj)

/-- `(B · Tᵀ)[i][j] = Σ_k B[i][k] T[j][k]` is enclosed entrywise. -/
lemma memFx_mulBT {B T : ℕ → ℕ → ℝ} {B' T' : Array (Array Fx)} (rows r : ℕ)
    (hB : ∀ i k, i < rows → k < r → memFx (B i k) (getFx B' i k))
    (hT : ∀ j k, j < r → k < r → memFx (T j k) (getFx T' j k)) (i j : ℕ) (hi : i < rows)
    (hj : j < r) :
    memFx (∑ k ∈ Finset.range r, B i k * T j k) (getFx (mulBT B' rows T' r) i j) := by
  unfold mulBT
  rw [getFx_ofFn rows r (fun i j => roundFx (sumPairs r fun k => mulFx (getFx B' i k) (getFx T' j k)))
    i j hi hj]
  apply memFx_roundFx
  apply memFx2_sumPairs
  intro k hk
  exact memFx2_mulFx (hB i k hi hk) (hT j k hj hk)

/-- The energies of a grade: `E(2q+1−m, m) = Σ_{c+d=m} D[c][d]²` at scale `2^{2K}`. -/
theorem memFx2_gradeEnergies {D : ℕ → ℕ → ℝ} {D' : Array (Array Fx)} (q : ℕ)
    (hD : ∀ c d, c < q + 2 → d < q + 1 → memFx (D c d) (getFx D' c d)) (m : ℕ)
    (hm : m ≤ 2 * q + 1) :
    memFx2 (∑ c ∈ Finset.range (q + 2), if c ≤ m ∧ m - c ≤ q then D c (m - c) ^ 2 else 0)
      ((gradeEnergies D' q).getD m (0, 0)) := by
  unfold gradeEnergies
  rw [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn]
  have hm' : m < 2 * q + 2 := by omega
  simp only [hm', ↓reduceDIte, Option.getD_some]
  apply memFx2_sumPairs
  intro c hc
  by_cases h : c ≤ m ∧ m - c ≤ q
  · have hb : (decide (c ≤ m) && decide (m - c ≤ q)) = true := by
      simp only [Bool.and_eq_true, decide_eq_true_eq]; exact h
    simp only [h, and_self, ↓reduceIte]
    exact memFx2_sqFxAcc (hD c (m - c) hc (by omega))
  · have hb : (decide (c ≤ m) && decide (m - c ≤ q)) = false := by
      simp only [Bool.and_eq_false_iff, decide_eq_false_iff_not]; tauto
    simp only [h, ↓reduceIte, hb, Bool.false_eq_true]
    exact memFx2_zero

/-! ### The grade matrices from the raw accumulator -/

/-- The raw value of the canonical entry `(q, c, d)`, `c ≤ d + 1`: block `k = d + 1 − c`, row
`j = q − d`, column `c` (`c − 1` for `k = 0`), from the exact entries `R k j cIdx` of the triangle. -/
def rawValue (R : ℕ → ℕ → ℕ → ℝ) (q c d : ℕ) : ℝ :=
  R (d + 1 - c) (q - d) (if d + 1 - c = 0 then c - 1 else c)

/-- The value the grade matrix encloses at `(c, d)`: the canonical raw value for `c ≤ d + 1`, the
reflection `√((d+1)/c) · rawValue (d+1, c−1)` otherwise, plus the frozen correction `v q c d`. -/
noncomputable def gradeValue (R v : ℕ → ℕ → ℕ → ℝ) (q c d : ℕ) : ℝ :=
  (if c ≤ d + 1 then rawValue R q c d
    else rawValue R q (d + 1) (c - 1) * Real.sqrt (((d + 1 : ℕ) : ℝ) / (c : ℝ))) + v q c d

/-- The canonical entry `(q, c, d)` sits at the grade `q` of the raw layout. -/
lemma entryGrade_canonical (q c d : ℕ) (hd : d ≤ q) (hc : c ≤ d + 1) :
    entryGrade (d + 1 - c) (q - d) (if d + 1 - c = 0 then c - 1 else c) = q := by
  unfold entryGrade dOff
  split_ifs with h1 h2 <;> simp only [beq_iff_eq] at * <;> omega

lemma memFx_canonicalEntry {R : ℕ → ℕ → ℕ → ℝ} {raw : Raw} {qLo qHi : ℕ}
    (hR : ∀ k j cIdx, k < numCharges → j < blockSide k → cIdx < activeCols k j →
      qLo ≤ entryGrade k j cIdx → entryGrade k j cIdx < qHi → memFx2 (R k j cIdx) (rawGet raw k j cIdx))
    (q c d : ℕ) (hq : q ≤ 250) (hqLo : qLo ≤ q) (hqHi : q < qHi) (hd : d ≤ q) (hc : c ≤ d + 1) :
    memFx (rawValue R q c d) (canonicalEntry raw q c d) := by
  unfold rawValue canonicalEntry
  apply memFx_roundFx
  have hk : d + 1 - c < numCharges := by unfold numCharges; omega
  have hj : q - d < blockSide (d + 1 - c) := by
    unfold blockSide; split_ifs with h <;> simp only [beq_iff_eq] at h <;> omega
  have hcol : (if d + 1 - c = 0 then c - 1 else c) < activeCols (d + 1 - c) (q - d) := by
    unfold activeCols blockSide
    split_ifs with h1 h2 <;> simp only [beq_iff_eq] at * <;> omega
  have hg := entryGrade_canonical q c d hd hc
  have h := hR _ _ _ hk hj hcol (by rw [hg]; exact hqLo) (by rw [hg]; exact hqHi)
  convert h using 2
  split_ifs with h1 h2 <;> simp only [beq_iff_eq] at * <;> first | rfl | omega

/-- The grade matrix `A_q` encloses `gradeValue R v q` entrywise. -/
theorem memFx_gradeMatrix {R v : ℕ → ℕ → ℕ → ℝ} {raw : Raw} {frozen : ℕ → ℕ → ℕ → Fx} {qLo qHi : ℕ}
    (hR : ∀ k j cIdx, k < numCharges → j < blockSide k → cIdx < activeCols k j →
      qLo ≤ entryGrade k j cIdx → entryGrade k j cIdx < qHi → memFx2 (R k j cIdx) (rawGet raw k j cIdx))
    (hv : ∀ q c d, memFx (v q c d) (frozen q c d)) (q : ℕ) (hq : q ≤ 250) (hqLo : qLo ≤ q)
    (hqHi : q < qHi) (c d : ℕ) (hc : c < q + 2) (hd : d < q + 1) :
    memFx (gradeValue R v q c d) (getFx (gradeMatrix raw frozen q) c d) := by
  unfold gradeMatrix
  rw [getFx_ofFn (q + 2) (q + 1) (fun c d => gradeEntry raw frozen q c d) c d hc hd]
  unfold gradeEntry gradeValue
  apply memFx_addFx _ (hv q c d)
  split_ifs with hcd
  · exact memFx_canonicalEntry hR q c d hq hqLo hqHi (by omega) hcd
  · unfold reflectedEntry
    apply memFx_roundFx
    exact memFx2_mulFx (memFx_canonicalEntry hR q (d + 1) (c - 1) hq hqLo hqHi (by omega) (by omega))
      (memFx_reflectFx c d (by omega))

/-! ### The comparison with the table -/

/-- `|E − t| · 2^{2K} ≤ excursion e t'` for `E ∈ e`, `t ∈ t'` (both at scale `2^{2K}`). -/
lemma abs_sub_le_excursion {E t : ℝ} {e t' : ℤ × ℤ} (hE : memFx2 E e) (ht : memFx2 t t') :
    |E - t| * (2 : ℝ) ^ (2 * KFix) ≤ (excursion e t' : ℝ) := by
  unfold memFx2 at hE ht
  have hy : (0 : ℝ) < 2 ^ (2 * KFix) := pow_pos two_pos _
  have h1 : (E - t) * 2 ^ (2 * KFix) ≤ (e.2 : ℝ) - t'.1 := by
    rw [sub_mul]; linarith [hE.2, ht.1]
  have h2 : -((E - t) * 2 ^ (2 * KFix)) ≤ (t'.2 : ℝ) - e.1 := by
    rw [sub_mul]; linarith [hE.1, ht.2]
  rw [← abs_of_pos hy, ← abs_mul]
  unfold excursion
  push_cast
  have hA : ((e.2 : ℝ) - t'.1) ≤ max (max ((e.2 : ℝ) - t'.1) ((t'.2 : ℝ) - e.1)) 0 :=
    le_max_of_le_left (le_max_left _ _)
  have hB : ((t'.2 : ℝ) - e.1) ≤ max (max ((e.2 : ℝ) - t'.1) ((t'.2 : ℝ) - e.1)) 0 :=
    le_max_of_le_left (le_max_right _ _)
  exact abs_le.mpr ⟨by linarith, by linarith⟩

/-- `energyAt` encloses the energy of every head bidegree, given the enclosures of the odd grades
and the vanishing of the even bidegrees. -/
lemma memFx2_energyAt {G : Lp ℂ 2 mu2} {en : Array (Array (ℤ × ℤ))}
    (hen : ∀ q m, q ≤ 250 → m ≤ 2 * q + 1 →
      memFx2 (energy G (2 * q + 1 - m, m)) ((en.getD q #[]).getD m (0, 0)))
    (heven : ∀ n m, (n + m) % 2 = 0 → energy G (n, m) = 0) (n m : ℕ) (h : n + 3 * m ≤ 501) :
    memFx2 (energy G (n, m)) (energyAt en n m) := by
  unfold energyAt
  split_ifs with hodd
  · have hq : (n + m - 1) / 2 ≤ 250 := by omega
    have hm : m ≤ 2 * ((n + m - 1) / 2) + 1 := by omega
    have hn : 2 * ((n + m - 1) / 2) + 1 - m = n := by omega
    have := hen _ m hq hm
    rwa [hn] at this
  · rw [heven n m (by omega)]
    exact memFx2_zero

lemma foldl_ite_add_eq (c : ℕ → Prop) [DecidablePred c] (f : ℕ → ℤ) (N : ℕ) (s0 : ℤ) :
    (List.range N).foldl (fun s m => if c m then s + f m else s) s0 =
      s0 + ∑ m ∈ Finset.range N, if c m then f m else 0 := by
  induction N with
  | zero => simp
  | succ N ih =>
    rw [foldl_range_succ, ih, Finset.sum_range_succ]
    split_ifs <;> ring

lemma foldl_add_eq_sum_int (f : ℕ → ℤ) (N : ℕ) (s0 : ℤ) :
    (List.range N).foldl (fun s n => s + f n) s0 = s0 + ∑ n ∈ Finset.range N, f n := by
  induction N with
  | zero => simp
  | succ N ih => rw [foldl_range_succ, ih, Finset.sum_range_succ, add_assoc]

/-- The ℓ¹ excursion of the head energies bounds the ℓ¹ distance to the table (obligation S7). -/
theorem headExcursion_sound {G : Lp ℂ 2 mu2} {en : Array (Array (ℤ × ℤ))} {tab : ℕ × ℕ → ℝ}
    {table : ℕ → ℕ → ℤ × ℤ}
    (hen : ∀ n m, n + 3 * m ≤ 501 → memFx2 (energy G (n, m)) (energyAt en n m))
    (htab : ∀ n m, n + 3 * m ≤ 501 → memFx2 (tab (n, m)) (table n m)) :
    (∑ p ∈ Grothe.Upper.headIdx 501, |energy G p - tab p|) * (2 : ℝ) ^ (2 * KFix) ≤
      (headExcursion en table : ℝ) := by
  have hinner : ∀ (s : ℤ) (n : ℕ), (List.range 502).foldl
      (fun s m => if n + 3 * m ≤ 501 then s + excursion (energyAt en n m) (table n m) else s) s =
        s + ∑ m ∈ Finset.range 502,
          if n + 3 * m ≤ 501 then excursion (energyAt en n m) (table n m) else 0 :=
    fun s n => foldl_ite_add_eq (fun m => n + 3 * m ≤ 501) _ 502 s
  unfold headExcursion
  simp only [hinner]
  rw [foldl_add_eq_sum_int, zero_add]
  push_cast
  rw [Grothe.Upper.headIdx, Finset.sum_filter, Finset.sum_product, Finset.sum_mul]
  apply Finset.sum_le_sum
  intro n _
  rw [Finset.sum_mul]
  apply Finset.sum_le_sum
  intro m _
  split_ifs with h
  · exact abs_sub_le_excursion (hen n m h) (htab n m h)
  · simp

/-! ### Master's smoothed coefficients and their energies -/

/-- `productionSavedEntryQ n` on `ℕ × ℕ` (zero outside the matrix). -/
def savedQ (n c e : ℕ) : ℚ :=
  if hc : c < n + 1 then if he : e < n + 1 then productionSavedEntryQ n ⟨c, hc⟩ ⟨e, he⟩ else 0
  else 0

lemma memFx_savedQ (n c e : ℕ) (hc : c < n + 1) (he : e < n + 1) :
    memFx ((savedQ n c e : ℚ) : ℝ) (getFx (savedMatrixFx n) c e) := by
  unfold savedQ
  simp only [hc, he, ↓reduceDIte]
  exact memFx_savedMatrixFx n c e hc he

/-- `productionSmoothedCoeff b q c d = ((S_{q+1} · B_q) · S_qᵀ)[c][d]` as range sums. -/
lemma productionSmoothedCoeff_eq_sum (b : ℕ → ℕ → ℕ → ℚ) (q c d : ℕ) (hc : c < q + 2)
    (hd : d < q + 1) :
    productionSmoothedCoeff b q c d =
      ∑ k ∈ Finset.range (q + 1),
        (∑ l ∈ Finset.range (q + 2), savedQ (q + 1) c l * b q l k) * savedQ q d k := by
  unfold productionSmoothedCoeff
  simp only [hc, hd, ↓reduceDIte, Matrix.mul_apply, Matrix.transpose_apply]
  rw [← Fin.sum_univ_eq_sum_range
    (fun k => (∑ l ∈ Finset.range (q + 2), savedQ (q + 1) c l * b q l k) * savedQ q d k) (q + 1)]
  apply Finset.sum_congr rfl
  intro k _
  rw [← Fin.sum_univ_eq_sum_range (fun l => savedQ (q + 1) c l * b q l k) (q + 2)]
  have hk := k.isLt
  congr 1
  · apply Finset.sum_congr rfl
    intro l _
    have hl := l.isLt
    unfold savedQ
    simp only [hc, hl, ↓reduceDIte]
    rfl
  · unfold savedQ
    simp only [hd, hk, ↓reduceDIte]
    rfl

/-- The rotated grade matrix encloses `productionSmoothedCoeff b q` entrywise. -/
theorem memFx_rotated (b : ℕ → ℕ → ℕ → ℚ) (q : ℕ) {A' : Array (Array Fx)}
    (hA : ∀ c d, c < q + 2 → d < q + 1 → memFx ((b q c d : ℚ) : ℝ) (getFx A' c d)) (c d : ℕ)
    (hc : c < q + 2) (hd : d < q + 1) :
    memFx ((productionSmoothedCoeff b q c d : ℚ) : ℝ)
      (getFx (mulBT (mulSA (savedMatrixFx (q + 1)) (q + 2) A' (q + 1)) (q + 2) (savedMatrixFx q)
        (q + 1)) c d) := by
  rw [productionSmoothedCoeff_eq_sum b q c d hc hd]
  push_cast
  exact memFx_mulBT (B := fun i k => ∑ l ∈ Finset.range (q + 2),
      ((savedQ (q + 1) i l : ℚ) : ℝ) * ((b q l k : ℚ) : ℝ)) (T := fun j k => ((savedQ q j k : ℚ) : ℝ))
    (q + 2) (q + 1)
    (fun i k hi hk => memFx_mulSA (S := fun i l => ((savedQ (q + 1) i l : ℚ) : ℝ))
      (A := fun l k => ((b q l k : ℚ) : ℝ)) (q + 2) (q + 1)
      (fun i l hi hl => memFx_savedQ (q + 1) i l hi hl) (fun l k hl hk => hA l k hl hk) i k hi hk)
    (fun j k hj hk => memFx_savedQ q j k hj hk) c d hc hd

/-- The energies of the grade `q ≤ 250` of `gradedHermite 251 (productionSmoothedCoeff b)` are
enclosed by `rotateGrade`, given a grade matrix enclosing `b q`. -/
theorem memFx2_rotateGrade (b : ℕ → ℕ → ℕ → ℚ) (q : ℕ) (hq : q < 251) {raw : Raw}
    {frozen : ℕ → ℕ → ℕ → Fx}
    (hA : ∀ c d, c < q + 2 → d < q + 1 →
      memFx ((b q c d : ℚ) : ℝ) (getFx (gradeMatrix raw frozen q) c d))
    (m : ℕ) (hm : m ≤ 2 * q + 1) :
    memFx2 (energy (gradedHermite 251 (productionSmoothedCoeff b)) (2 * q + 1 - m, m))
      ((rotateGrade raw frozen (savedMatrixFx (q + 1)) (savedMatrixFx q) q).getD m (0, 0)) := by
  rw [energy_gradedHermite 251 _ q m hq hm]
  unfold rotateGrade
  exact memFx2_gradeEnergies q (fun c d hc hd => memFx_rotated b q hA c d hc hd) m hm

lemma savedMatrices_getD (n k : ℕ) (hk : k ≤ n) :
    (savedMatrices n).getD k #[] = savedMatrixFx k := by
  unfold savedMatrices
  rw [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn]
  have hk' : k < n + 1 := by omega
  simp only [hk', ↓reduceDIte, Option.getD_some]

/-- **The energy check is sound (B2).** If `energyOK` accepts, the ℓ¹ distance of the head
energies of `gradedHermite 251 (productionSmoothedCoeff b)` to any table enclosed by `table` is
at most `epsNum / 2^{2K}`, for every rational family `b` enclosed by the grade matrices. -/
theorem energyOK_sound (b : ℕ → ℕ → ℕ → ℚ) {raw : Raw} {frozen : ℕ → ℕ → ℕ → Fx}
    {tab : ℕ × ℕ → ℝ} {table : ℕ → ℕ → ℤ × ℤ} {epsNum : ℤ}
    (hA : ∀ q c d, q ≤ 250 → c < q + 2 → d < q + 1 →
      memFx ((b q c d : ℚ) : ℝ) (getFx (gradeMatrix raw frozen q) c d))
    (htab : ∀ n m, n + 3 * m ≤ 501 → memFx2 (tab (n, m)) (table n m))
    (h : energyOK raw frozen table epsNum = true) :
    (∑ p ∈ Grothe.Upper.headIdx 501,
      |energy (gradedHermite 251 (productionSmoothedCoeff b)) p - tab p|) * (2 : ℝ) ^ (2 * KFix) ≤
      epsNum := by
  unfold energyOK at h
  simp only [decide_eq_true_eq] at h
  refine (headExcursion_sound (G := gradedHermite 251 (productionSmoothedCoeff b)) ?_ htab).trans
    (by exact_mod_cast h)
  intro n m hnm
  apply memFx2_energyAt _ (fun n m he => energy_gradedHermite_even 251 _ n m he) n m hnm
  intro q m hq hm
  unfold allEnergies
  have hq' : q < 251 := by omega
  simp only [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn, hq', ↓reduceDIte, Option.getD_some]
  simp only [← Array.getD_eq_getD_getElem?]
  rw [savedMatrices_getD 251 (q + 1) (by omega), savedMatrices_getD 251 q (by omega)]
  exact memFx2_rotateGrade b q hq' (fun c d hc hd => hA q c d hq hc hd) m hm

/-! ### The widths of the grade matrices -/

/-- The lower end of an entry, as a rational. -/
def loQ (e : Fx) : ℚ := (e.lo : ℚ) / 2 ^ KFix

lemma memFx_loQ {y : ℝ} {e : Fx} (hy : memFx y e) : memFx ((loQ e : ℚ) : ℝ) e := by
  unfold memFx at *
  unfold loQ
  push_cast
  rw [div_mul_cancel₀ _ (by positivity)]
  exact ⟨le_rfl, hy.1.trans hy.2⟩

/-- `(y − lo/2^K)² · 2^{2K} ≤ (hi − lo)²` for `y ∈ e`. -/
lemma sq_sub_loQ_le {y : ℝ} {e : Fx} (hy : memFx y e) :
    (y - ((loQ e : ℚ) : ℝ)) ^ 2 * (2 : ℝ) ^ (2 * KFix) ≤ (((e.hi - e.lo) ^ 2 : ℤ) : ℝ) := by
  unfold memFx at hy
  unfold loQ
  push_cast
  have hpos : (0 : ℝ) < 2 ^ KFix := pow_pos two_pos _
  have h : (y - (e.lo : ℝ) / 2 ^ KFix) ^ 2 * (2 : ℝ) ^ (2 * KFix) = (y * 2 ^ KFix - e.lo) ^ 2 := by
    rw [two_pow_two_mul_KFix]
    field_simp
  rw [h]
  have h1 : (0 : ℝ) ≤ y * 2 ^ KFix - e.lo := by linarith [hy.1]
  have h2 : y * 2 ^ KFix - e.lo ≤ (e.hi : ℝ) - e.lo := by linarith [hy.2]
  nlinarith

lemma gradeWidthSqOf_eq (A : Array (Array Fx)) (q : ℕ) :
    gradeWidthSqOf A q = ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
      ((getFx A c d).hi - (getFx A c d).lo) ^ 2 := by
  unfold gradeWidthSqOf
  simp only [foldl_add_eq_sum_int, zero_add]

lemma gradeWidthSq_eq (raw : Raw) (frozen : ℕ → ℕ → ℕ → Fx) :
    gradeWidthSq raw frozen = ∑ q ∈ Finset.range 251, ∑ c ∈ Finset.range (q + 2),
      ∑ d ∈ Finset.range (q + 1),
        ((getFx (gradeMatrix raw frozen q) c d).hi - (getFx (gradeMatrix raw frozen q) c d).lo) ^ 2 := by
  unfold gradeWidthSq
  rw [foldl_add_eq_sum_int, zero_add]
  simp only [gradeWidthSqOf_eq]

/-- **The width check is sound (B1).** For every family `Y` inside the grade matrices, the squared
ℓ² distance of `Y` to the lower ends `loQ` is at most `gradeWidthSq / 2^{2K}`. -/
theorem gradeWidthSq_sound {raw : Raw} {frozen : ℕ → ℕ → ℕ → Fx} {Y : ℕ → ℕ → ℕ → ℝ}
    (hY : ∀ q c d, q ≤ 250 → c < q + 2 → d < q + 1 →
      memFx (Y q c d) (getFx (gradeMatrix raw frozen q) c d)) :
    (∑ q ∈ Finset.range 251, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
      (Y q c d - ((loQ (getFx (gradeMatrix raw frozen q) c d) : ℚ) : ℝ)) ^ 2) *
        (2 : ℝ) ^ (2 * KFix) ≤ (gradeWidthSq raw frozen : ℝ) := by
  rw [gradeWidthSq_eq]
  push_cast
  rw [Finset.sum_mul]
  apply Finset.sum_le_sum
  intro q hq
  rw [Finset.sum_mul]
  apply Finset.sum_le_sum
  intro c hc
  rw [Finset.sum_mul]
  apply Finset.sum_le_sum
  intro d hd
  rw [Finset.mem_range] at hq hc hd
  have := sq_sub_loQ_le (hY q c d (by omega) hc hd)
  push_cast at this
  exact this

/-! ### The checks of a grade block -/

lemma savedMatricesRange_getD (qLo qHi i : ℕ) (hi : i ≤ qHi - qLo) :
    (savedMatricesRange qLo qHi).getD i #[] = savedMatrixFx (qLo + i) := by
  unfold savedMatricesRange
  rw [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn]
  have hi' : i < qHi - qLo + 1 := by omega
  simp only [hi', ↓reduceDIte, Option.getD_some]

/-- The energies of the block enclose the energies of its grades. -/
lemma memFx2_blockEnergies (b : ℕ → ℕ → ℕ → ℚ) {raw : Raw} {frozen : ℕ → ℕ → ℕ → Fx} (qLo qHi : ℕ)
    (hqHi : qHi ≤ 251)
    (hA : ∀ q c d, qLo ≤ q → q < qHi → c < q + 2 → d < q + 1 →
      memFx ((b q c d : ℚ) : ℝ) (getFx (gradeMatrix raw frozen q) c d))
    (i m : ℕ) (hi : i < qHi - qLo) (hm : m ≤ 2 * (qLo + i) + 1) :
    memFx2 (energy (gradedHermite 251 (productionSmoothedCoeff b)) (2 * (qLo + i) + 1 - m, m))
      (((blockEnergies raw frozen (savedMatricesRange qLo qHi) qLo qHi).getD i #[]).getD m (0, 0)) := by
  unfold blockEnergies
  simp only [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn, hi, ↓reduceDIte, Option.getD_some]
  simp only [← Array.getD_eq_getD_getElem?]
  rw [savedMatricesRange_getD qLo qHi (i + 1) (by omega), savedMatricesRange_getD qLo qHi i (by omega),
    show qLo + (i + 1) = qLo + i + 1 by ring]
  exact memFx2_rotateGrade b (qLo + i) (by omega)
    (fun c d hc hd => hA (qLo + i) c d (by omega) (by omega) hc hd) m hm

/-- The ℓ¹ excursion of a block bounds the ℓ¹ distance over the head bidegrees of its grades. -/
theorem blockExcursion_sound {G : Lp ℂ 2 mu2} {en : Array (Array (ℤ × ℤ))} {tab : ℕ × ℕ → ℝ}
    {table : ℕ → ℕ → ℤ × ℤ} (qLo qHi : ℕ) (hqHi : qHi ≤ 251)
    (hen : ∀ i m, i < qHi - qLo → m < headCount (qLo + i) →
      memFx2 (energy G (2 * (qLo + i) + 1 - m, m)) ((en.getD i #[]).getD m (0, 0)))
    (htab : ∀ n m, n + 3 * m ≤ 501 → memFx2 (tab (n, m)) (table n m)) :
    (∑ i ∈ Finset.range (qHi - qLo), ∑ m ∈ Finset.range (headCount (qLo + i)),
      |energy G (2 * (qLo + i) + 1 - m, m) - tab (2 * (qLo + i) + 1 - m, m)|) * (2 : ℝ) ^ (2 * KFix) ≤
      (blockExcursion en table qLo qHi : ℝ) := by
  have hinner : ∀ (s : ℤ) (i : ℕ), (List.range (headCount (qLo + i))).foldl
      (fun s m => s + excursion ((en.getD i #[]).getD m (0, 0)) (table (2 * (qLo + i) + 1 - m) m)) s =
        s + ∑ m ∈ Finset.range (headCount (qLo + i)),
          excursion ((en.getD i #[]).getD m (0, 0)) (table (2 * (qLo + i) + 1 - m) m) :=
    fun s i => foldl_add_eq_sum_int _ _ s
  unfold blockExcursion
  simp only [hinner]
  rw [foldl_add_eq_sum_int, zero_add]
  push_cast
  rw [Finset.sum_mul]
  apply Finset.sum_le_sum
  intro i hi
  rw [Finset.sum_mul]
  apply Finset.sum_le_sum
  intro m hm
  rw [Finset.mem_range] at hi hm
  have hhead : 2 * (qLo + i) + 1 - m + 3 * m ≤ 501 := by unfold headCount at hm; omega
  exact abs_sub_le_excursion (hen i m hi hm) (htab _ _ hhead)

/-- **The block energy check is sound.** -/
theorem energyOKBlock_sound (b : ℕ → ℕ → ℕ → ℚ) {raw : Raw} {frozen : ℕ → ℕ → ℕ → Fx}
    {tab : ℕ × ℕ → ℝ} {table : ℕ → ℕ → ℤ × ℤ} {epsNum : ℤ} (qLo qHi : ℕ) (hqHi : qHi ≤ 251)
    (hA : ∀ q c d, qLo ≤ q → q < qHi → c < q + 2 → d < q + 1 →
      memFx ((b q c d : ℚ) : ℝ) (getFx (gradeMatrix raw frozen q) c d))
    (htab : ∀ n m, n + 3 * m ≤ 501 → memFx2 (tab (n, m)) (table n m))
    (h : energyOKBlock raw frozen table epsNum qLo qHi = true) :
    (∑ i ∈ Finset.range (qHi - qLo), ∑ m ∈ Finset.range (headCount (qLo + i)),
      |energy (gradedHermite 251 (productionSmoothedCoeff b)) (2 * (qLo + i) + 1 - m, m) -
        tab (2 * (qLo + i) + 1 - m, m)|) * (2 : ℝ) ^ (2 * KFix) ≤ epsNum := by
  unfold energyOKBlock at h
  simp only [decide_eq_true_eq] at h
  refine (blockExcursion_sound qLo qHi hqHi ?_ htab).trans (by exact_mod_cast h)
  intro i m hi hm
  exact memFx2_blockEnergies b qLo qHi hqHi hA i m hi (by unfold headCount at hm; omega)

/-- The even bidegrees of the head: the energy of a graded Hermite vector is `0` there, so the ℓ¹
distance is `Σ |tab p|`, bounded by `evenExcursion`. -/
theorem evenExcursion_sound (a : ℕ → ℕ → ℕ → ℚ) {tab : ℕ × ℕ → ℝ} {table : ℕ → ℕ → ℤ × ℤ}
    (htab : ∀ n m, n + 3 * m ≤ 501 → memFx2 (tab (n, m)) (table n m)) :
    (∑ p ∈ (Grothe.Upper.headIdx 501).filter (fun p => (p.1 + p.2) % 2 = 0),
      |energy (gradedHermite 251 a) p - tab p|) * (2 : ℝ) ^ (2 * KFix) ≤ (evenExcursion table : ℝ) := by
  have hinner : ∀ (s : ℤ) (n : ℕ), (List.range 502).foldl
      (fun s m => if n + 3 * m ≤ 501 ∧ (n + m) % 2 = 0 then s + excursion (0, 0) (table n m) else s) s =
        s + ∑ m ∈ Finset.range 502,
          if n + 3 * m ≤ 501 ∧ (n + m) % 2 = 0 then excursion (0, 0) (table n m) else 0 :=
    fun s n => foldl_ite_add_eq (fun m => n + 3 * m ≤ 501 ∧ (n + m) % 2 = 0) _ 502 s
  unfold evenExcursion
  simp only [hinner]
  rw [foldl_add_eq_sum_int, zero_add]
  push_cast
  rw [Grothe.Upper.headIdx, Finset.filter_filter, Finset.sum_filter, Finset.sum_product, Finset.sum_mul]
  apply Finset.sum_le_sum
  intro n _
  rw [Finset.sum_mul]
  apply Finset.sum_le_sum
  intro m _
  split_ifs with h
  · rw [energy_gradedHermite_even 251 a n m h.2]
    exact abs_sub_le_excursion memFx2_zero (htab n m h.1)
  · simp

/-- `Σ_{q ∈ [qLo,qHi)} Σ_{c,d} (Y − loQ)² · 2^{2K} ≤ gradeWidthSqBlock` for `Y` inside the grade matrices of the block. -/
theorem gradeWidthSqBlock_sound {raw : Raw} {frozen : ℕ → ℕ → ℕ → Fx} {Y : ℕ → ℕ → ℕ → ℝ} (qLo qHi : ℕ)
    (hY : ∀ q c d, qLo ≤ q → q < qHi → c < q + 2 → d < q + 1 →
      memFx (Y q c d) (getFx (gradeMatrix raw frozen q) c d)) :
    (∑ i ∈ Finset.range (qHi - qLo), ∑ c ∈ Finset.range (qLo + i + 2), ∑ d ∈ Finset.range (qLo + i + 1),
      (Y (qLo + i) c d - ((loQ (getFx (gradeMatrix raw frozen (qLo + i)) c d) : ℚ) : ℝ)) ^ 2) *
        (2 : ℝ) ^ (2 * KFix) ≤ (gradeWidthSqBlock raw frozen qLo qHi : ℝ) := by
  unfold gradeWidthSqBlock
  rw [foldl_add_eq_sum_int, zero_add]
  simp only [gradeWidthSqOf_eq]
  push_cast
  rw [Finset.sum_mul]
  apply Finset.sum_le_sum
  intro i hi
  rw [Finset.sum_mul]
  apply Finset.sum_le_sum
  intro c hc
  rw [Finset.sum_mul]
  apply Finset.sum_le_sum
  intro d hd
  rw [Finset.mem_range] at hi hc hd
  have := sq_sub_loQ_le (hY (qLo + i) c d (by omega) (by omega) hc hd)
  push_cast at this
  exact this

end Grothe.UpperQuad
