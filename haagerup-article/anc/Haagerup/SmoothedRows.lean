/-
Copyright (c) 2026 Alin Galatan. Released under Apache 2.0 license as described in the file LICENSE.
Authors: Alin Galatan
-/
import Haagerup.SmoothedMidpoints
import Haagerup.SmoothedContraction

/-!
# The energies of the smoothed map: the terms of the energy formula

`smoothedTerms_sound` combines steps (3)–(5) of Appendix A.4 (the energies of the smoothed map) of the article
(`kBlock_dot` in `SmoothedContraction.lean`, `energyBox_sound` in `SmoothedEnergy.lean`): the interval
`smoothedTerm` computed by the checker contains the term of the energy formula (A.5) with index
`a₂ = p`, `b₂ = d₂ - p`. `tableEncloses` is the hypothesis on the midpoints of the numbers `χ` of step (1). The sum
over `a₂` and the table of rows are treated in `CellOverlap.lean`.
-/

set_option warningAsError true

namespace Haagerup
open Finset HaagerupKernel HaagerupKernel.Cell
noncomputable section

/-- `tableEncloses ct st se sc bt`: for `b ≤ 167` and `a ≤ 251 - b`, the entry `(b, a)` of the table `bt` is a row of
midpoints at scale `1 / sc` of the numbers `χ(a, b; j)`, `j ≤ a + b` (`rowEncloses`; step (1) of Appendix A.4). -/
def tableEncloses (ct st se sc : ℝ) (bt : MidTable) : Prop :=
  ∀ b ≤ 167, ∀ a ≤ 251-b, rowEncloses (bCoeff ct (-(se*st)) st (se*ct) a b) sc (a+b+1)
    ((bt.getD b #[]).getD a (#[],0))

attribute [local irreducible] Array.ofFn sumInt sumIval kBlock binomArr251 rowDot rowError energyBox

private theorem smoothedTerm_box (binom : Array (Array Nat)) (bt : MidTable) (re im : Array MidRow)
    (k d2 p : Nat) (h : p ≤ k+1 ∧ d2-p ≤ k) :
    let p1 := k+1-p
    let q := d2-p
    let q1 := k-q
    let b1 := (bt.getD p #[]).getD p1 (#[],0)
    let r := re.getD q (#[],0)
    let i := im.getD q (#[],0)
    smoothedTerm binom bt re im k d2 p =
      energyBox k (getBinom binom (k+1) p1 * getBinom binom k q1)
        (rowDot k b1 r) (rowError k b1 r) (rowDot k b1 i) (rowError k b1 i) := by
  dsimp only
  unfold smoothedTerm
  simp only [decide_eq_true h, ite_true]
  unfold energyBox rowDot rowError
  rfl

/-- One term of the energy formula (A.5): for `k ≤ 250`, `d₂ ≤ min 167 (250 - k)` and `p ≤ d₂`, the interval
`smoothedTerm … k d₂ p` contains `choose (k+1) p₁ * choose k q₁ * ‖𝒯‖² / (k + 1)`, where `𝒯 = outerAmp` for `(a₁,
a₂) = (p₁, p) = (k + 1 - p, p)` and `(b₁, b₂) = (q₁, q) = (k - q, q)`, `q = d₂ - p`; the term is `0` (and the
interval is `{0}`) unless `p ≤ k + 1` and `q ≤ k`. -/
theorem smoothedTerms_sound {cr ci : Array Int} {gm : GammaMids} {bt512 bt400 : MidTable}
    {ct st se : ℝ} {k d2 : ℕ} (hk : k ≤ 250) (hd : d2 ≤ min 167 (250-k))
    (hg : ∀ j1 < k+2, ∀ j2 < k+1,
      |(gScaled cr ci k j1 j2).re * 2^512 - ((gLookup704 gm k j1 j2).1 : ℝ)| ≤ 1 ∧
      |(gScaled cr ci k j1 j2).im * 2^512 - ((gLookup704 gm k j1 j2).2 : ℝ)| ≤ 1)
    (hb512 : tableEncloses ct st se (2^512) bt512) (hb400 : tableEncloses ct st se (2^400) bt400)
    (hok : (kBlock gm bt512 k).1 = true) (p : Nat) (hp : p < d2+1) :
    let q := d2-p
    let p1 := k+1-p
    let q1 := k-q
    let z := outerAmp cr ci ct st se k p1 p q1 q
    let block := kBlock gm bt512 k
    mem (if p ≤ k+1 ∧ q ≤ k then ((((k+1).choose p1 * k.choose q1 : Nat) : ℝ) * ‖z‖^2 / (k+1 : ℝ)) else 0)
      (smoothedTerm binomArr251 bt400 block.2.1 block.2.2 k d2 p) := by
  dsimp only
  by_cases h : p ≤ k+1 ∧ d2-p ≤ k
  · rw [ite_eq_left h, smoothedTerm_box _ _ _ _ _ _ _ h]
    let p1 := k+1-p
    let q := d2-p
    let q1 := k-q
    have hp1 : p1+p = k+1 := by dsimp only [p1]; omega
    have hq1 : q1+q = k := by dsimp only [q1,q]; omega
    have hb1 := hb400 p (by omega) p1 (by omega)
    have hb2 := hb512 q (by dsimp only [q]; omega) q1 (by omega)
    rw [hp1] at hb1
    rw [hq1] at hb2
    have hdot := kBlock_dot (q1 := q1) hg hb1 hb2 rfl (show q ≤ min 167 (250-k) by dsimp only [q]; omega) hok
    rw [getBinom_binomArr251 (n := k+1) (k := p1) (by omega) (by omega),
      getBinom_binomArr251 (n := k) (k := q1) (by omega) (by omega)]
    exact energyBox_sound _ _ hdot.1 hdot.2
  · rw [ite_eq_right h]
    simp only [smoothedTerm, decide_eq_false h, Bool.false_eq_true, ite_false]
    exact mem_zero

end
end Haagerup
