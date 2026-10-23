import Grothe.UpperChaos.PhiHorner

/-!
# The dense array of the phase polynomial

`e3_denseA0`: at `(2^SC U, 2^SC V, 2^SC W)` the array `denseA0 ts` evaluates to
`L 2^{17 SC} Σ_t c_t U^i V^j W^k` (`L = commonDen ts`), provided the terms are admissible
(`termsOK`).
-/

open GrotheKernel Finset

namespace Grothe.UpperChaos

noncomputable section

/-- The phase polynomial of a term list. -/
def Ssum (ts : List ((ℕ × ℕ × ℕ) × ℚ)) (U V W : ℝ) : ℝ :=
  (ts.map fun t => (t.2 : ℝ) * U ^ t.1.1 * V ^ t.1.2.1 * W ^ t.1.2.2).sum

lemma foldl_add_eq {β : Type} (g : β → ℤ) (l : List β) (a : ℤ) :
    l.foldl (fun s t => s + g t) a = a + (l.map g).sum := by
  induction l generalizing a with
  | nil => simp
  | cons t l ih => simp [ih]; ring

lemma sum_map_filter {β : Type} (p : β → Prop) [DecidablePred p] (g : β → ℝ) (l : List β) :
    ((l.filter p).map g).sum = (l.map fun t => if p t then g t else 0).sum := by
  induction l with
  | nil => simp
  | cons t l ih => by_cases h : p t <;> simp [h, ih]

lemma finset_sum_list {β : Type} (s : Finset ℕ) (l : List β) (h : ℕ → β → ℝ) :
    ∑ i ∈ s, (l.map (h i)).sum = (l.map fun t => ∑ i ∈ s, h i t).sum := by
  induction l with
  | nil => simp
  | cons t l ih => simp [Finset.sum_add_distrib, ih]

lemma list_sum_mul {β : Type} (l : List β) (h : β → ℝ) (c : ℝ) :
    (l.map h).sum * c = (l.map fun t => h t * c).sum := by
  induction l with
  | nil => simp
  | cons t l ih => simp [add_mul, ih]

/-- **The dense array evaluates to the scaled phase polynomial.** -/
theorem e3_denseA0 {ts : List ((ℕ × ℕ × ℕ) × ℚ)} (hts : termsOK ts = true) (U V W : ℝ) :
    he3 (denseA0 ts) ((2 : ℝ) ^ SC * U) ((2 : ℝ) ^ SC * V) ((2 : ℝ) ^ SC * W)
      = (commonDen ts : ℝ) * (2 : ℝ) ^ (DEG * SC) * Ssum ts U V W := by
  set L := commonDen ts with hL
  set X := (2 : ℝ) ^ SC * U
  set Y := (2 : ℝ) ^ SC * V
  set Z := (2 : ℝ) ^ SC * W
  have hok : ∀ t ∈ ts, t.1.1 + t.1.2.1 + t.1.2.2 ≤ DEG ∧ (t.2 * (L : ℚ)).den = 1 := by
    intro t ht
    have := List.all_eq_true.1 hts t ht
    simpa [termsOK, hL] using this
  -- the weight of a term in cell `(i, j, k)`
  set w : ((ℕ × ℕ × ℕ) × ℚ) → ℕ → ℕ → ℕ → ℝ := fun t i j k =>
    (((t.2 * (L : ℚ)).num * (2 : ℤ) ^ (SC * (DEG - (i + j + k))) : ℤ) : ℝ) with hw
  have hcell : ∀ i j k,
      (((ts.filter fun t => t.1 = (i, j, k)).foldl (fun s t =>
        s + (t.2 * (L : ℚ)).num * (2 : ℤ) ^ (SC * (DEG - (i + j + k)))) 0 : ℤ) : ℝ)
        = (ts.map fun t => if t.1 = (i, j, k) then w t i j k else 0).sum := by
    intro i j k
    rw [foldl_add_eq, zero_add, Int.cast_list_sum, List.map_map]
    rw [← sum_map_filter]
    rfl
  -- unfold the three Horner levels into sums
  have h3 : he3 (denseA0 ts) X Y Z = ∑ i ∈ range (DEG + 1), ∑ j ∈ range (DEG + 1),
      ∑ k ∈ range (DEG + 1), (ts.map fun t => if t.1 = (i, j, k) then w t i j k else 0).sum
        * Z ^ k * Y ^ j * X ^ i := by
    simp only [denseA0, he3, he2, he1, ← hL]
    rw [evalG_range_map]
    refine sum_congr rfl fun i _ => ?_
    rw [evalG_range_map, sum_mul]
    refine sum_congr rfl fun j _ => ?_
    rw [evalG_range_map, sum_mul, sum_mul]
    refine sum_congr rfl fun k _ => ?_
    rw [hcell]
  rw [h3]
  -- swap the list sum outside
  simp_rw [list_sum_mul, finset_sum_list]
  unfold Ssum
  rw [← List.sum_map_mul_left]
  congr 1
  refine List.map_congr_left fun t ht => ?_
  obtain ⟨hdeg, hden⟩ := hok t ht
  obtain ⟨⟨a, b, c⟩, q⟩ := t
  simp only at hdeg hden ⊢
  have ha : a ∈ range (DEG + 1) := mem_range.2 (by omega)
  have hb : b ∈ range (DEG + 1) := mem_range.2 (by omega)
  have hc : c ∈ range (DEG + 1) := mem_range.2 (by omega)
  rw [sum_eq_single_of_mem a ha (fun i _ hi => by
      refine sum_eq_zero fun j _ => sum_eq_zero fun k _ => ?_
      simp [Prod.ext_iff, Ne.symm hi])]
  rw [sum_eq_single_of_mem b hb (fun j _ hj => by
      refine sum_eq_zero fun k _ => ?_
      simp [Prod.ext_iff, Ne.symm hj])]
  rw [sum_eq_single_of_mem c hc (fun k _ hk => by simp [Prod.ext_iff, Ne.symm hk])]
  simp only [↓reduceIte, hw]
  have hnum : (((q * (L : ℚ)).num : ℤ) : ℝ) = (q : ℝ) * L := by
    have h1 : (((q * (L : ℚ)).num : ℤ) : ℚ) = q * L := Rat.coe_int_num_of_den_eq_one hden
    have h2 := congrArg (fun r : ℚ => (r : ℝ)) h1
    simpa using h2
  push_cast
  rw [hnum]
  have hp : (2 : ℝ) ^ (SC * (DEG - (a + b + c))) * ((2 : ℝ) ^ SC) ^ c * ((2 : ℝ) ^ SC) ^ b
      * ((2 : ℝ) ^ SC) ^ a = (2 : ℝ) ^ (DEG * SC) := by
    rw [← pow_mul, ← pow_mul, ← pow_mul, ← pow_add, ← pow_add, ← pow_add]
    congr 1
    have : a + b + c ≤ DEG := hdeg
    rw [Nat.mul_sub]; simp only [DEG, SC] at this ⊢; omega
  simp only [X, Y, Z, mul_pow]
  linear_combination ((q : ℝ) * L * U ^ a * V ^ b * W ^ c) * hp

end

end Grothe.UpperChaos
