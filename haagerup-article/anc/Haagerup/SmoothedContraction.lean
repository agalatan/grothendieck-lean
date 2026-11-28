/-
Copyright (c) 2026 Alin Galatan. Released under Apache 2.0 license as described in the file LICENSE.
Authors: Alin Galatan
-/
import Haagerup.SmoothedEnergy

/-!
# The energies of the smoothed map: the inner and the outer sum

Steps (3) and (4) of Appendix A.4 (the energies of the smoothed map) of the article. For fixed `n = k` the amplitude
`𝒯 = ∑_{j₁} χ(a₁, a₂; j₁) ∑_{j₂} g_{j₁,j₂} χ(b₁, b₂; j₂)` (`outerAmp`, with the inner sum `innerAmp`) is computed
by two integer dot products of midpoints, each with the error bound (A.1). `kBlock_dot` states that the result
(`rowDot`, `rowError`) encloses `𝒯` at scale `2⁻⁸⁰⁰`.
-/

set_option warningAsError true
set_option exponentiation.threshold 2048

namespace Haagerup
open Finset HaagerupKernel HaagerupKernel.Cell
noncomputable section

/-- The inner sum `∑_{j₂ ≤ k} g_{j₁,j₂} χ(q₁, q₂; j₂)` of step (3) of Appendix A.4, for `n = k`; `χ` is `bCoeff` with
the parameters `(ct, -se st, st, se ct)` and `g` is `gScaled`. -/
def innerAmp (cr ci : Array Int) (ct st se : ℝ) (k q1 q2 j1 : ℕ) : ℂ :=
  ∑ j2 ∈ range (k+1), gScaled cr ci k j1 j2 * (bCoeff ct (-(se*st)) st (se*ct) q1 q2 j2 : ℝ)

/-- The outer sum `𝒯 = ∑_{j₁ ≤ k+1} χ(p₁, p₂; j₁) * innerAmp … j₁` of step (4) of Appendix A.4: the amplitude whose
squared modulus gives the term of the energy formula (A.5) with `(a₁, a₂) = (p₁, p₂)` and `(b₁, b₂) = (q₁, q₂)`. -/
def outerAmp (cr ci : Array Int) (ct st se : ℝ) (k p1 p2 q1 q2 : ℕ) : ℂ :=
  ∑ j1 ∈ range (k+2), (bCoeff ct (-(se*st)) st (se*ct) p1 p2 j1 : ℝ) *
    innerAmp cr ci ct st se k q1 q2 j1

/-- The exact integer dot product `∑_{j < k+2} aⱼ bⱼ` of the midpoints of two rows. -/
def rowDot (k : Nat) (a b : MidRow) : Int :=
  sumInt (k+2) fun j => a.1.getD j 0 * b.1.getD j 0

/-- The error bound (A.1) for `rowDot k a b`: the sums of the absolute values of the two families of midpoints (the
second components of the rows) plus the number `k + 2` of terms. -/
def rowError (k : Nat) (a b : MidRow) : Int := a.2 + b.2 + Int.ofNat (k+2)

/-- For every `j₁ < k + 2`, the sum over `j₂ ≤ k` of the absolute values of the component `f` (real or imaginary part)
of the midpoints `gLookup704 gm k j₁ j₂`. -/
private def gammaAbs (gm : GammaMids) (k : Nat) (f : Int × Int → Int) : Array Int :=
  Array.ofFn fun (j1 : Fin (k+2)) => sumInt (k+1) fun j2 =>
    Int.ofNat (f (gLookup704 gm k j1.val j2)).natAbs

/-- The block `qBlock` of step (3) for the pair `(k, q)`, with the sums of absolute values computed by `gammaAbs`. -/
private def stageQ (gm : GammaMids) (bt : MidTable) (k q : Nat) : QBlock :=
  qBlock gm bt k q (gammaAbs gm k Prod.fst) (gammaAbs gm k Prod.snd)

attribute [local irreducible] Array.ofFn sumInt qBlock dotCells

private theorem kBlock_at (gm : GammaMids) (bt : MidTable) (k q : Nat)
    (hq : q ≤ min 167 (250-k)) (hok : (kBlock gm bt k).1 = true) :
    (stageQ gm bt k q).1 = true ∧
      (kBlock gm bt k).2.1.getD q (#[],0) = (stageQ gm bt k q).2.1 ∧
      (kBlock gm bt k).2.2.getD q (#[],0) = (stageQ gm bt k q).2.2 := by
  let rows := Array.ofFn fun (u : Fin (min 167 (250 - k) + 1)) => stageQ gm bt k u.val
  let d : QBlock := (false, (#[],0), (#[],0))
  change ((List.range (min 167 (250-k)+1)).all fun u => (rows.getD u d).1) = true at hok
  have h := List.all_eq_true.mp hok q (List.mem_range.mpr (Nat.lt_succ_of_le hq))
  have atq : rows.getD q d = stageQ gm bt k q := array_ofFn_getD _ _ _ (Nat.lt_succ_of_le hq)
  rw [atq] at h
  refine ⟨h, ?_, ?_⟩
  · change (Array.ofFn (fun u : Fin (min 167 (250-k)+1) => (rows.getD u.val d).2.1)).getD q _ = _
    rw [array_ofFn_getD _ q _ (Nat.lt_succ_of_le hq), atq]
  · change (Array.ofFn (fun u : Fin (min 167 (250-k)+1) => (rows.getD u.val d).2.2)).getD q _ = _
    rw [array_ofFn_getD _ q _ (Nat.lt_succ_of_le hq), atq]

/-- `rowEncloses x scale n r`: the first `n` midpoints of the row `r` are within one unit of `x j * scale`, and the
second component of `r` is the sum of the absolute values of these midpoints. -/
def rowEncloses (x : ℕ → ℝ) (scale : ℝ) (n : ℕ) (r : MidRow) : Prop :=
  (∀ j < n, |x j * scale - (r.1.getD j 0 : ℝ)| ≤ 1) ∧
    r.2 = sumInt n fun j => Int.ofNat (r.1.getD j 0).natAbs

/-- Steps (3) and (4) of Appendix A.4: if the midpoints of the numbers `g` (scale `2⁻⁵¹²`) and of the numbers `χ`
(scales `2⁻⁴⁰⁰` and `2⁻⁵¹²`) are within one unit and the block `kBlock gm bt k` passes its checks, then the
integer dot products `rowDot` approximate `2⁸⁰⁰` times the real and the imaginary part of `outerAmp` with error at
most `rowError`. -/
theorem kBlock_dot {cr ci : Array Int} {gm : GammaMids} {bt : MidTable} {ct st se : ℝ}
    {k q1 q2 p1 p2 : ℕ} {b1 : MidRow}
    (hg : ∀ j1 < k+2, ∀ j2 < k+1,
      |(gScaled cr ci k j1 j2).re * 2^512 - ((gLookup704 gm k j1 j2).1 : ℝ)| ≤ 1 ∧
      |(gScaled cr ci k j1 j2).im * 2^512 - ((gLookup704 gm k j1 j2).2 : ℝ)| ≤ 1)
    (hb1 : rowEncloses (bCoeff ct (-(se*st)) st (se*ct) p1 p2) (2^400) (k+2) b1)
    (hb2 : rowEncloses (bCoeff ct (-(se*st)) st (se*ct) q1 q2) (2^512) (k+1)
      ((bt.getD q2 #[]).getD q1 (#[],0)))
    (hq1 : k-q2 = q1) (hq2 : q2 ≤ min 167 (250-k)) (hok : (kBlock gm bt k).1 = true) :
    let z := outerAmp cr ci ct st se k p1 p2 q1 q2
    let r := (kBlock gm bt k).2.1.getD q2 (#[],0)
    let i := (kBlock gm bt k).2.2.getD q2 (#[],0)
    |z.re * 2^800 - (rowDot k b1 r : ℝ)| ≤ (rowError k b1 r : ℝ) ∧
      |z.im * 2^800 - (rowDot k b1 i : ℝ)| ≤ (rowError k b1 i : ℝ) := by
  obtain ⟨ok,hr,hi⟩ := kBlock_at gm bt k q2 hq2 hok
  dsimp only
  rw [hr,hi]
  unfold stageQ qBlock at ok ⊢
  rw [hq1] at ok ⊢
  cases eq2 : (bt.getD q2 #[]).getD q1 (#[],0) with
  | mk br sb =>
    simp only [eq2] at ok hb2 ⊢
    let cells := dotCells gm k (gammaAbs gm k Prod.fst) (gammaAbs gm k Prod.snd) br sb
    change ((List.range (k+2)).all fun j => (cells.getD j (false,0,0)).1) = true at ok
    let x := bCoeff ct (-(se*st)) st (se*ct) p1 p2
    let f := innerAmp cr ci ct st se k q1 q2
    have hcell (j : ℕ) (hj : j < k+2) (hc : (cells.getD j (false,0,0)).1 = true) :
        |(f j).re * 2^400 - ((cells.getD j (false,0,0)).2.1 : ℝ)| ≤ 1 ∧
        |(f j).im * 2^400 - ((cells.getD j (false,0,0)).2.2 : ℝ)| ≤ 1 := by
      unfold cells at hc ⊢
      unfold dotCells at hc ⊢
      rw [array_ofFn_getD _ j _ hj] at hc ⊢
      have hsg (f : Int × Int → Int) : (gammaAbs gm k f).getD j 0 =
          sumInt (k+1) (fun v => Int.ofNat (f (gLookup704 gm k j v)).natAbs) :=
        array_ofFn_getD _ j 0 hj
      simp only [hsg] at hc ⊢
      exact t1Cell_sound (hg j hj) (fun j2 h => hb2.1 j2 (by omega)) hb2.2 hc
    have hdot := dotT1_sound (b1F := fun j => x j * 2^400) (innerF := f)
      hb1.1 hb1.2 ok hcell
    have hre : (outerAmp cr ci ct st se k p1 p2 q1 q2).re * 2^800 =
        ∑ j ∈ range (k+2), (x j * 2^400) * ((f j).re * 2^400) := by
      unfold outerAmp
      rw [Complex.re_sum, sum_mul]
      apply sum_congr rfl
      intro j _
      rw [Complex.re_ofReal_mul]
      change x j * (f j).re * 2^800 = _
      ring
    have him : (outerAmp cr ci ct st se k p1 p2 q1 q2).im * 2^800 =
        ∑ j ∈ range (k+2), (x j * 2^400) * ((f j).im * 2^400) := by
      unfold outerAmp
      rw [Complex.im_sum, sum_mul]
      apply sum_congr rfl
      intro j _
      rw [Complex.im_ofReal_mul]
      change x j * (f j).im * 2^800 = _
      ring
    rw [hre,him]
    exact hdot

end
end Haagerup
