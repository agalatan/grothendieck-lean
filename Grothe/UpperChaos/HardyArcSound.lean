import Grothe.Upper.IntervalSound
import GrotheKernel.HardyArc

/-!
# Soundness of the Hardy arc checker: interval layer

Membership lemmas for the operations of `GrotheKernel/HardyArc.lean` beyond those of
`Grothe/Upper/IntervalSound.lean`: subtraction, integer constants, the inverse of a positive interval, and complex
intervals (`memC z I`: real and imaginary parts in `I.re`, `I.im`) with addition, multiplication, inverse and Horner
evaluation. Step 4 of the `hardy` plan.
-/

namespace Grothe.UpperChaos.HardyArcSound

open GrotheKernel GrotheKernel.HardyArc Grothe.Upper

lemma mem_sub {x y : ℝ} {a b : Ival} (hx : mem x a) (hy : mem y b) : mem (x - y) (subI a b) := by
  simpa [subI, sub_eq_add_neg] using mem_add hx (mem_neg hy)

lemma mem_intI (n : ℤ) : mem (n : ℝ) (intI n) := by
  constructor <;> simp [intI]

lemma pos_of_posI {x : ℝ} {a : Ival} (hx : mem x a) (hp : posI a = true) : 0 < x := by
  have hlo : (0 : ℤ) < a.lo := by simpa [posI] using hp
  have h1 : (0 : ℝ) < a.lo := by exact_mod_cast hlo
  have h2 := hx.1
  have hD := D_pos
  nlinarith

/-- The inverse of a positive interval. -/
lemma mem_invPosI {x : ℝ} {a : Ival} (hx : mem x a) (hp : posI a = true) : mem x⁻¹ (invPosI a) := by
  have hxpos := pos_of_posI hx hp
  have hlo : (0 : ℤ) < a.lo := by simpa [posI] using hp
  have hhi : (0 : ℤ) < a.hi := by
    have : (a.lo : ℝ) ≤ a.hi := hx.1.trans hx.2
    exact_mod_cast (show (0 : ℝ) < a.hi from lt_of_lt_of_le (by exact_mod_cast hlo) this)
  have hD := D_pos
  have hloR : (0 : ℝ) < a.lo := by exact_mod_cast hlo
  have hhiR : (0 : ℝ) < a.hi := by exact_mod_cast hhi
  obtain ⟨h1, h2⟩ := hx
  -- x⁻¹ D = D² / (x D)
  have key : x⁻¹ * D = (D : ℝ) * D / (x * D) := by field_simp
  constructor
  · -- ⌊D² / hi⌋ ≤ D² / hi ≤ D² / (x D)
    have hfl : (((D * D) / a.hi : ℤ) : ℝ) ≤ (D : ℝ) * D / a.hi := by
      rw [le_div_iff₀ hhiR]
      have := Int.ediv_mul_le (D * D) hhi.ne'
      exact_mod_cast this
    refine hfl.trans ?_
    rw [key]
    exact div_le_div_of_nonneg_left (by positivity) (by positivity) h2
  · -- D² / (x D) ≤ D² / lo ≤ ⌈D² / lo⌉
    rw [key]
    refine (div_le_div_of_nonneg_left (by positivity) hloR h1).trans ?_
    show (D : ℝ) * D / a.lo ≤ ((-((-(D * D)) / a.lo) : ℤ) : ℝ)
    rw [div_le_iff₀ hloR]
    set q : ℤ := (-(D * D)) / a.lo with hq
    have h3 : q * a.lo ≤ -(D * D) := Int.ediv_mul_le (-(D * D)) hlo.ne'
    have h4 : ((q : ℝ)) * a.lo ≤ -((D : ℝ) * D) := by exact_mod_cast h3
    have : (((-q : ℤ) : ℝ)) = -(q : ℝ) := by push_cast; ring
    rw [this]
    nlinarith

/-! ### Complex intervals -/

/-- `z` lies in the complex interval `I`. -/
def memC (z : ℂ) (I : CI) : Prop := mem z.re I.re ∧ mem z.im I.im

lemma memC_ofR {x : ℝ} {a : Ival} (hx : mem x a) : memC (x : ℂ) (CI.ofR a) := by
  refine ⟨by simpa [CI.ofR] using hx, ?_⟩
  simpa [CI.ofR] using mem_zero

lemma memC_one : memC 1 CI.one := by
  simpa [CI.one] using memC_ofR (mem_intI 1)

lemma memC_add {z w : ℂ} {I J : CI} (hz : memC z I) (hw : memC w J) : memC (z + w) (CI.add I J) :=
  ⟨by simpa [CI.add] using mem_add hz.1 hw.1, by simpa [CI.add] using mem_add hz.2 hw.2⟩

lemma memC_neg {z : ℂ} {I : CI} (hz : memC z I) : memC (-z) (CI.neg I) :=
  ⟨by simpa [CI.neg] using mem_neg hz.1, by simpa [CI.neg] using mem_neg hz.2⟩

lemma memC_sub {z w : ℂ} {I J : CI} (hz : memC z I) (hw : memC w J) : memC (z - w) (CI.sub I J) :=
  ⟨by simpa [CI.sub] using mem_sub hz.1 hw.1, by simpa [CI.sub] using mem_sub hz.2 hw.2⟩

lemma memC_mul {z w : ℂ} {I J : CI} (hz : memC z I) (hw : memC w J) : memC (z * w) (CI.mul I J) :=
  ⟨by simpa [CI.mul] using mem_sub (mem_mul hz.1 hw.1) (mem_mul hz.2 hw.2),
   by simpa [CI.mul] using mem_add (mem_mul hz.1 hw.2) (mem_mul hz.2 hw.1)⟩

lemma mem_normSq {z : ℂ} {I : CI} (hz : memC z I) : mem (Complex.normSq z) (CI.normSq I) := by
  simpa [CI.normSq, Complex.normSq_apply] using mem_add (mem_mul hz.1 hz.1) (mem_mul hz.2 hz.2)

lemma memC_inv {z : ℂ} {I : CI} (hz : memC z I) (hp : posI (CI.normSq I) = true) :
    memC z⁻¹ (CI.inv I) := by
  have hn := mem_invPosI (mem_normSq hz) hp
  refine ⟨?_, ?_⟩
  · simpa [CI.inv, Complex.inv_re, div_eq_mul_inv] using mem_mul hz.1 hn
  · simpa [CI.inv, Complex.inv_im, div_eq_mul_inv, neg_mul] using mem_neg (mem_mul hz.2 hn)

/-- Horner evaluation `c₀ + x (c₁ + x (c₂ + …))` of real coefficients. -/
noncomputable def hornerR (x : ℂ) : List ℝ → ℂ
  | [] => 0
  | c :: cs => (c : ℂ) + x * hornerR x cs

lemma memC_horner {x : ℂ} {X : CI} (hx : memC x X) :
    ∀ {cs : List ℝ} {L : List Ival}, List.Forall₂ mem cs L → memC (hornerR x cs) (CI.horner X L)
  | [], [], _ => by simpa [hornerR, CI.horner] using memC_ofR mem_zero
  | _ :: _, _ :: _, List.Forall₂.cons hc hcs =>
      memC_add (memC_ofR hc) (memC_mul hx (memC_horner hx hcs))

end Grothe.UpperChaos.HardyArcSound
