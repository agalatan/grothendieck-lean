import Grothe.UpperSelector.Mixture
import Grothe.UpperSelector.PhysicalColumn

/-! # Seven-channel transfer for the certified angular selector -/

open Finset HaagerupKernel Haagerup.Statement

set_option warningAsError true

namespace Haagerup.AngularSelector

/-- Place the new physical channel after the six previously certified channels. -/
def appendChannel {α : Type*} (six : Fin 6 → α) (last : α) : Fin 7 → α :=
  Fin.lastCases last six

@[simp] theorem appendChannel_last {α : Type*} (six : Fin 6 → α) (last : α) :
    appendChannel six last (Fin.last 6) = last := Fin.lastCases_last ..
@[simp] theorem appendChannel_castSucc {α : Type*} (six : Fin 6 → α) (last : α) (i : Fin 6) :
    appendChannel six last i.castSucc = six i := Fin.lastCases_castSucc ..

/-- Any six admissible kernels with certified interval heads and tail allowances can be
mixed with the realized angular selector. The sole quantitative inputs for the enlarged
mixture are finite rational inequalities for the new head and error. -/
theorem mixed_isBound {col : Certificate.Column} {N : ℕ} {w : Fin 7 → ℚ} {h : Fin 6 → ℕ → ℝ}
    {I : Fin 6 → List Ival} {caps : Fin 6 → ℚ} {b t δ : ℚ}
    (hw : ∀ i, 0 ≤ w i) (hw1 : ∑ i, w i = 1)
    (hs : ∀ i, Summable fun n => |h i n|) (hd : ∀ i, DominatedKernel (radialKernel (h i)))
    (hSixLen : ∀ i, (I i).length ≤ N + 1) (hNewLen : col.head.size ≤ N + 1)
    (hm : ∀ i n, n < (I i).length → mem (h i n) ((I i).getD n zeroI))
    (he : ∀ i, ∑' n, |h i (n + (I i).length)| ≤ (caps i : ℝ))
    (hcol : WienerBound (fun n => selectorCoeff linearPreprocessor (17/100) n - (col.head.getD n 0 : ℝ)/2^89)
      ((col.allowance : ℝ)/2^89))
    (hbudget : (col.allowance : ℚ)/2^89 ≤ t)
    (hb : absSum (addL (sumL ((List.finRange 7).map fun i =>
      (appendChannel I col.thinHead i).map (mulI (ofRatI (w i)))))
      [negI (ofRatI 1)]) ≤ ofRatLo b)
    (hδ : b + ∑ i, w i * appendChannel caps t i ≤ δ) (hpos : δ < 1) :
    IsBound (1 / (1 - (δ : ℝ))) := by
  let s := selectorCoeff linearPreprocessor (17/100)
  let a := fun n => (col.head.getD n 0 : ℝ)/2^89
  suffices ht : IsBound (1 / (((1 : ℚ) : ℝ) - (δ : ℝ))) by simpa only [Rat.cast_one] using ht
  apply transfer_of_approximate_heads (δ := (δ : ℝ)) (h := appendChannel h s) (a := appendChannel h a)
    (headI := appendChannel I col.thinHead)
    (e := fun i => ((appendChannel caps t i : ℚ) : ℝ)) (N := N) (w := w) (c := 1) (b := b)
  · exact fun i => by exact_mod_cast hw i
  · exact_mod_cast hw1
  · intro i
    refine Fin.lastCases ?_ (fun p => ?_) i
    · simpa only [appendChannel_last] using (selectorCoeff_wiener linearPreprocessor linearPreprocessor_l1.le (17/100)).1
    · simpa only [appendChannel_castSucc] using hs p
  · intro i
    refine Fin.lastCases ?_ (fun p => ?_) i
    · simpa only [appendChannel_last] using selectorCoeff_dominated linearPreprocessor linearPreprocessor_l1.le (17/100)
    · simpa only [appendChannel_castSucc] using hd p
  · intro i
    refine Fin.lastCases ?_ (fun p => ?_) i
    · simpa only [appendChannel_last, Certificate.Column.thinHead_length] using hNewLen
    · simpa only [appendChannel_castSucc] using hSixLen p
  · intro i
    refine Fin.lastCases ?_ (fun p => ?_) i
    · intro n _
      simpa only [appendChannel_last] using col.thinHead_mem n
    · simpa only [appendChannel_castSucc] using hm p
  · intro i
    refine Fin.lastCases ?_ (fun p => ?_) i
    · simp only [appendChannel_last, a, Certificate.Column.clipped_value]
      have hc : (col.allowance : ℝ)/2^89 ≤ (t : ℝ) := by exact_mod_cast hbudget
      exact ⟨hcol.1, hcol.2.trans hc⟩
    · simpa only [appendChannel_castSucc] using exactHead_error (h p) (I p).length (caps p) (hs p) (he p)
  · exact hb
  · exact_mod_cast hδ
  · exact_mod_cast hpos

end Haagerup.AngularSelector
