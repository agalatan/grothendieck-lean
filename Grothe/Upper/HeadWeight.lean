import Grothe.Upper.Final
import GrotheKernel.HeadWeight

/-! Certified coefficient costs, rather than a unit price for every energy
error. The short retained part of each high-degree term is evaluated directly.
No new Gaussian input is used. -/
namespace Grothe.Upper

open GrotheKernel Polynomial Finset
noncomputable section

lemma shifted_abs_sum (R : ℝ[X]) (K h : ℕ) :
    ∑ j ∈ range K, |(X ^ h * R).coeff j| =
      ∑ j ∈ range (K - h), |R.coeff j| := by
  induction K with
  | zero => simp
  | succ K ih =>
    rw [sum_range_succ, ih, coeff_X_pow_mul']
    by_cases hh : h ≤ K
    · rw [ite_eq_left hh, show K + 1 - h = (K - h) + 1 by omega, sum_range_succ]
    · rw [ite_eq_right hh, show K - h = 0 by omega,
        show K + 1 - h = 0 by omega]
      simp

lemma headWeight_bounds (N L : ℕ) (pp qq : List (List Ival)) (n m : ℕ) :
    0 ≤ headWeight N L pp qq n m ∧ headWeight N L pp qq n m ≤ 1 := by
  dsimp only [headWeight]
  split_ifs
  · exact ⟨le_min zero_le_one (le_max_left _ _), min_le_left _ _⟩
  · exact ⟨zero_le_one, le_rfl⟩

/-- The interval power tables give a proved upper bound on the retained
coefficient mass of each term. The cutoff only changes computational cost. -/
theorem headWeight_sound (N L : ℕ) (pl ql : List ℚ)
    (hQ : ofListQ ql = X * ofListQ ql.tail)
    (hP1 : l1 (ofListQ pl) ≤ 1) (hQ1 : l1 (ofListQ ql) ≤ 1) (p : ℕ × ℕ) :
    ∑ j ∈ range ((N + 1) / 2), |(termOf (ofListQ pl) (ofListQ ql) p).coeff j| ≤
      (headWeight N L (powsT L (pl.map ofRatI) N)
        (powsT L (ql.tail.map ofRatI) (N / 3)) p.1 p.2 : ℚ) := by
  have hunit := (sum_abs_coeff_le_l1 _ ((N + 1) / 2)).trans
    (l1_termOf_le_one hP1 hQ1 p)
  dsimp only [headWeight]
  split_ifs with hg
  · simp only [Bool.and_eq_true, decide_eq_true_eq] at hg
    obtain ⟨⟨hn, hm⟩, hk⟩ := hg
    let k := (N + 1) / 2 - (p.1 / 2 + p.2 / 2 + p.2)
    have hb := memB_conv
      (memB_pow (memB_ofListQ pl L) N p.1 hn)
      (memB_pow (memB_ofListQ ql.tail L) (N / 3) p.2 hm)
    have hc := absSum_le (memB_take (memB_mono hb hk))
    have heq : termOf (ofListQ pl) (ofListQ ql) p =
        X ^ (shiftOf p + p.2) * (ofListQ pl ^ p.1 * ofListQ ql.tail ^ p.2) := by
      rw [hQ]
      unfold termOf
      rw [mul_pow, pow_add]
      ring
    have hbound : (∑ j ∈ range ((N + 1) / 2),
        |(termOf (ofListQ pl) (ofListQ ql) p).coeff j|) ≤
        ((absSum (weightTerm k (powsT L (pl.map ofRatI) N)
          (powsT L (ql.tail.map ofRatI) (N / 3)) p.1 p.2) : ℚ) / (D : ℚ) : ℚ) := by
      rw [heq, shifted_abs_sum]
      push_cast
      apply (le_div_iff₀ D_pos).2
      exact hc
    push_cast at hbound ⊢
    exact le_min hunit (hbound.trans (le_max_right _ _))
  · exact_mod_cast hunit

end

/-- Only 21 unshifted coefficients are needed to price the last 41 degrees.
All earlier terms keep their existing unit bound. -/
def comparisonPowersP : List (List Ival) := powsT 21 (pList.map ofRatI) 501

def comparisonPowersQ : List (List Ival) := powsT 21 (qList.tail.map ofRatI) (501 / 3)

def comparisonWeightQ (n m : ℕ) : ℚ :=
  headWeight 501 21 comparisonPowersP comparisonPowersQ n m

noncomputable def comparisonWeight (p : ℕ × ℕ) : ℝ := comparisonWeightQ p.1 p.2

lemma comparisonWeight_bounds (p : ℕ × ℕ) :
    0 ≤ comparisonWeight p ∧ comparisonWeight p ≤ 1 := by
  have h := headWeight_bounds 501 21 comparisonPowersP comparisonPowersQ p.1 p.2
  change 0 ≤ ((headWeight 501 21 comparisonPowersP comparisonPowersQ p.1 p.2 : ℚ) : ℝ) ∧
    ((headWeight 501 21 comparisonPowersP comparisonPowersQ p.1 p.2 : ℚ) : ℝ) ≤ 1
  exact ⟨by exact_mod_cast h.1, by exact_mod_cast h.2⟩

lemma comparisonWeight_sound (p : ℕ × ℕ) :
    ∑ j ∈ range 251, |(termOf primaryPoly auxPoly p).coeff j| ≤ comparisonWeight p := by
  exact headWeight_sound 501 21 pList qList (by simp [qList, ofListQ]) l1_primaryPoly l1_auxPoly p

end Grothe.Upper
