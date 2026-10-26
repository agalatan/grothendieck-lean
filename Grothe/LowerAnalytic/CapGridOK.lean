import Grothe.LowerAnalytic.CapCheckSound
import Grothe.LowerAnalytic.CapNodeDefs

/-!
# Every recipe grid passes the grid check

`gridOK_mkGrid`: for `0 < h`, `0 < N`, `0 < Nr`, the grid `mkGrid` of any recipe satisfies
`gridOK` — the prices are dyadic numerators `≥ 1`, the reciprocal bounds are ceilings, the
correction coefficients are floors of `8/D` with the rounded-up ring bound — so the checker
never has to run `gridOK` (the `Float` steps only choose the numerators).
-/

open GrotheKernel Grothe.Upper

namespace Grothe.LowerAnalytic

lemma dyNum_pos (x : Float) : 1 ≤ dyNum x := by unfold dyNum; exact le_max_left _ _

lemma dyNum_le (x : Float) : dyNum x ≤ 2 ^ 64 := by
  unfold dyNum
  refine max_le (by norm_num) ?_
  split_ifs
  · norm_num
  · norm_num
  · exact (UInt64.toNat_lt_size _).le

/-- The shape of a cell of a recipe grid. -/
lemma mkGrid_cell (ell beta : ℚ) (r : Recipe) {Nr N : ℕ} (h : ℚ) (T : Tables) {i j : ℕ}
    (hi : i < Nr) (hj : j < N) :
    ∃ pA pB : ℕ, 1 ≤ pA ∧ pA ≤ 2 ^ 64 ∧ 1 ≤ pB ∧ pB ≤ 2 ^ 64 ∧
      (mkGrid ell beta r Nr N h T).PA i j = pA ∧ (mkGrid ell beta r Nr N h T).PB i j = pB ∧
      (mkGrid ell beta r Nr N h T).NA i j = (two100 + pA - 1) / pA ∧
      (mkGrid ell beta r Nr N h T).NB i j = (two100 + pB - 1) / pB ∧
      (mkGrid ell beta r Nr N h T).G i j = 8 * two100 * two100 * two50 / majN pA pB (rlNum ell beta h i) ∧
      (mkGrid ell beta r Nr N h T).RL i = rlNum ell beta h i := by
  unfold mkGrid
  dsimp only
  rw [toArray_map_range_getD _ _ _ hi]
  unfold ringCells
  dsimp only
  rw [toArray_map_range_getD _ _ _ hj]
  exact ⟨_, _, dyNum_pos _, dyNum_le _, dyNum_pos _, dyNum_le _, rfl, rfl, rfl, rfl, rfl, rfl⟩

lemma ceil_div_mul (a p : ℕ) (hp : 1 ≤ p) : a ≤ (a + p - 1) / p * p := by
  have := Nat.lt_div_mul_add (a := a + p - 1) (b := p) (by omega)
  have h2 : (a + p - 1) / p * p + p > a + p - 1 := by
    have := Nat.lt_div_mul_add (by omega : 0 < p) (a := a + p - 1)
    linarith
  omega

lemma majN_ge (pA pB R : ℕ) : (pA + pB) ^ 3 ≤ majN pA pB R := by
  unfold majN
  have : (pA + pB) ^ 3 = (pA + pB) * (pA + pB) ^ 2 := by ring
  rw [this]
  exact Nat.mul_le_mul_left _ (by omega)

lemma majDq_eq (pA pB R : ℕ) :
    majDq ((pA : ℚ) / two50) ((pB : ℚ) / two50) ((R : ℚ) / two50) = (majN pA pB R : ℚ) / (two50 : ℚ) ^ 3 := by
  have h50 : (two50 : ℚ) ≠ 0 := by norm_num [two50]
  have hd : absQ ((pA : ℚ) / two50 - (pB : ℚ) / two50) = (natDist pA pB : ℚ) / two50 := by
    rw [absQ_eq, ← sub_div, abs_div, abs_of_pos (by norm_num [two50] : (0 : ℚ) < two50)]
    unfold natDist
    split_ifs with hab
    · have : (pB : ℚ) ≤ pA := by exact_mod_cast hab
      rw [Nat.cast_sub hab, abs_of_nonneg (by linarith)]
    · have : (pA : ℚ) < pB := by exact_mod_cast (by omega : pA < pB)
      rw [Nat.cast_sub (by omega), abs_of_neg (by linarith)]; ring
  unfold majDq majN
  rw [hd]
  push_cast
  field_simp

/-- **Every recipe grid passes the grid check.** -/
theorem gridOK_mkGrid (ell beta : ℚ) (r : Recipe) {Nr N : ℕ} {h : ℚ} (T : Tables) (hh : 0 < h)
    (hN : 0 < N) (hNr : 0 < Nr) : gridOK (mkGrid ell beta r Nr N h T) ell beta = true := by
  simp only [gridOK, Bool.and_eq_true, decide_eq_true_eq, List.all_eq_true, List.mem_range]
  refine ⟨⟨⟨⟨hh, hN⟩, by norm_num [GridData.c]⟩, hNr⟩, fun i hi j hj => ?_⟩
  have hi' : i < Nr := hi
  have hj' : j < N := hj
  obtain ⟨pA, pB, hA1, hA2, hB1, hB2, ePA, ePB, eNA, eNB, eG, eRL⟩ := mkGrid_cell ell beta r h T hi' hj'
  have h50 : (0 : ℚ) < two50 := by norm_num [two50]
  have hgh : (mkGrid ell beta r Nr N h T).h = h := rfl
  simp only [cellOK, Bool.and_eq_true, decide_eq_true_eq, GridData.pa, GridData.pb, GridData.na,
    GridData.nb, GridData.gg, GridData.rl, GridData.c, ePA, ePB, eNA, eNB, eG, eRL, hgh]
  have hA : (1 : ℚ) ≤ pA := by exact_mod_cast hA1
  have hB : (1 : ℚ) ≤ pB := by exact_mod_cast hB1
  have hA' : (pA : ℚ) ≤ 2 ^ 64 := by exact_mod_cast hA2
  have hB' : (pB : ℚ) ≤ 2 ^ 64 := by exact_mod_cast hB2
  -- the reciprocal bounds
  have hnA : (two100 : ℚ) ≤ ((two100 + pA - 1) / pA : ℕ) * pA := by
    exact_mod_cast ceil_div_mul two100 pA hA1
  have hnB : (two100 : ℚ) ≤ ((two100 + pB - 1) / pB : ℕ) * pB := by
    exact_mod_cast ceil_div_mul two100 pB hB1
  have hnA' : (((two100 + pA - 1) / pA : ℕ) : ℚ) ≤ 2 * two100 := by
    have : (two100 + pA - 1) / pA ≤ two100 + pA - 1 := Nat.div_le_self _ _
    have h2 : two100 + pA - 1 ≤ 2 * two100 := by
      have : pA ≤ 2 ^ 64 := hA2
      unfold two100 two50; omega
    exact_mod_cast this.trans h2
  have hnB' : (((two100 + pB - 1) / pB : ℕ) : ℚ) ≤ 2 * two100 := by
    have : (two100 + pB - 1) / pB ≤ two100 + pB - 1 := Nat.div_le_self _ _
    have h2 : two100 + pB - 1 ≤ 2 * two100 := by
      have : pB ≤ 2 ^ 64 := hB2
      unfold two100 two50; omega
    exact_mod_cast this.trans h2
  -- the correction coefficient
  set R := rlNum ell beta h i
  have hM8 : 8 ≤ majN pA pB R := (by
    have := majN_ge pA pB R
    have h2 : 8 ≤ (pA + pB) ^ 3 := by
      have : 2 ≤ pA + pB := by omega
      calc 8 = 2 ^ 3 := by norm_num
        _ ≤ (pA + pB) ^ 3 := Nat.pow_le_pow_left this 3
    omega)
  have hGM : (8 * two100 * two100 * two50 / majN pA pB R) * majN pA pB R ≤ 8 * two100 * two100 * two50 :=
    Nat.div_mul_le_self _ _
  have hG : 8 * two100 * two100 * two50 / majN pA pB R ≤ two100 * two100 * two50 := by
    apply Nat.div_le_of_le_mul
    calc 8 * two100 * two100 * two50 = 8 * (two100 * two100 * two50) := by ring
      _ ≤ majN pA pB R * (two100 * two100 * two50) := Nat.mul_le_mul_right _ hM8
  have hGM' : ((8 * two100 * two100 * two50 / majN pA pB R : ℕ) : ℚ) * majN pA pB R
      ≤ 8 * two100 * two100 * two50 := by exact_mod_cast hGM
  have hG' : ((8 * two100 * two100 * two50 / majN pA pB R : ℕ) : ℚ) ≤ two100 * two100 * two50 := by
    exact_mod_cast hG
  -- the ring bound
  have hR : rlb ell beta ((i + 1) * h) ≤ (R : ℚ) / two50 := by
    rw [le_div_iff₀ h50]
    have h1 := Int.le_ceil (rlb ell beta ((i + 1) * h) * two50)
    have h2 : ((⌈rlb ell beta ((i + 1) * h) * two50⌉ : ℤ) : ℚ) ≤ (R : ℚ) := by
      have : ⌈rlb ell beta ((i + 1) * h) * two50⌉ ≤ ((⌈rlb ell beta ((i + 1) * h) * two50⌉).toNat : ℤ) :=
        Int.self_le_toNat _
      have e : R = (⌈rlb ell beta ((i + 1) * h) * two50⌉).toNat := by
        simp only [R, rlNum]; rfl
      rw [e]; exact_mod_cast this
    exact h1.trans h2
  rw [majDq_eq]
  have e1 : (two100 : ℚ) = two50 * two50 := by simp [two100]
  refine ⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨div_pos (by linarith) h50, div_pos (by linarith) h50⟩, ?_⟩, ?_⟩, by positivity⟩, hR⟩, ?_⟩, ?_⟩, ?_⟩, ?_⟩, ?_⟩, ?_⟩
  · rw [div_mul_div_comm, le_div_iff₀ (by norm_num [two100, two50]), one_mul, ← e1]; exact hnA
  · rw [div_mul_div_comm, le_div_iff₀ (by norm_num [two100, two50]), one_mul, ← e1]; exact hnB
  · rw [div_mul_div_comm, div_le_iff₀ (by norm_num [two100, two50])]
    calc _ ≤ (8 * two100 * two100 * two50 : ℚ) := hGM'
      _ = 8 * (two100 * two50 ^ 3) := by rw [e1]; ring
  · rw [div_le_iff₀ h50]; calc (pA : ℚ) ≤ 2 ^ 64 := hA'
      _ ≤ 2 ^ 151 * two50 := by norm_num [two50]
  · rw [div_le_iff₀ h50]; calc (pB : ℚ) ≤ 2 ^ 64 := hB'
      _ ≤ 2 ^ 151 * two50 := by norm_num [two50]
  · rw [div_le_iff₀ h50]; exact hnA'.trans (by norm_num [two100, two50])
  · rw [div_le_iff₀ h50]; exact hnB'.trans (by norm_num [two100, two50])
  · rw [div_le_iff₀ (by norm_num [two100, two50])]; exact hG'.trans (by norm_num [two100, two50])

noncomputable section

/-! ### The node check -/

lemma aFib_vec (r : Grothe.Lower.Row) (j : ℕ) (hj : j < 12) :
    (aFib r.b1 r.b2 r.b3).vec j = avOf r j := by
  interval_cases j <;> simp [Fib.vec, aFib, avOf]

/-- **Soundness of the node check**: `Ψ(s) − capPad ≤ c` for the potential of the row. -/
theorem pot_le_of_nodeOK (r : Grothe.Lower.Row) (Rg : Grothe.Lower.Sym2) (s c : ℚ) (rec : Recipe)
    (Nr N : ℕ) (h : ℚ) (T : Tables) (hT : TablesOK Nr N h T) (hh : 0 < h) (hN : 0 < N)
    (hNr : 0 < Nr) (hchk : nodeOK r Rg s c rec Nr N h T = true) :
    pot r.E Rg r.ell r.beta (aFib r.b1 r.b2 r.b3) s - Grothe.Lower.capPad ≤ c := by
  simp only [nodeOK, Bool.and_eq_true] at hchk
  obtain ⟨hp, hpc⟩ := hchk
  have hok := gridOK_mkGrid r.ell r.beta rec T hh hN hNr
  set gd := mkGrid r.ell r.beta rec Nr N h T with hgd
  have hT' : TablesOK gd.Nr gd.N gd.h T := hT
  have hpot := pot_le_of_pieceOK (r.ell : ℝ) r.beta (gridPrices hok) r.E Rg
    (aFib r.b1 r.b2 r.b3) (avOf r) (aFib_vec r) s (c + Grothe.Lower.capPad) _ _ ?_ hpc
  · push_cast at hpot; linarith
  intro I hI J hJ
  have hM : ((matI r.ell r.beta gd T).getD I #[]).getD J zeroI
      = if I ≤ J then entryOf r.ell r.beta (cwSpec gd T) (tailPolyI T) I J
        else entryOf r.ell r.beta (cwSpec gd T) (tailPolyI T) J I := by
    rw [matI_eq, matOf_getD _ _ _ _ hI hJ]
  have hmem : mem (Tint r.ell r.beta (gridPrices hok) I J)
      (((matI r.ell r.beta gd T).getD I #[]).getD J zeroI) := by
    rw [hM]
    split_ifs
    · exact mem_entryOf hok hp hT' hI hJ
    · rw [Tint_symm]; exact mem_entryOf hok hp hT' hJ hI
  have hsz : I < (matI r.ell r.beta gd T).size := by rw [matI_eq]; simp [matOf, hI]
  have hsz2 : J < ((matI r.ell r.beta gd T).getD I #[]).size := by
    rw [matI_eq]; unfold matOf; rw [toArray_map_range_getD _ _ _ hI]; simp [hJ]
  rw [loQ_at _ hsz hsz2, hiQ_at _ hsz hsz2]
  exact bounds_of_mem hmem

end

end Grothe.LowerAnalytic
