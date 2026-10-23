import GrotheKernel.PhiCheck
import Mathlib.Analysis.SpecialFunctions.Exp

/-!
# Soundness of the dense-polynomial kernel of the phase cover

Horner evaluation `evalG ev p x = Σ ev(pᵢ) xⁱ` of coefficient lists; the Taylor shift
`shiftG … m p` evaluates to `p(m + x)` (`evalG_shiftG`), so `shiftAll` shifts all three variables
(`e3_shiftAll`); `absEval3` bounds `|e3 B x y z|` on the box `|x| ≤ r, |y| ≤ s, |z| ≤ t`
(`abs_e3_le`); a dense array built on `range n` evaluates to the triple sum (`evalG_range_map`).
-/

open GrotheKernel Finset

namespace Grothe.UpperChaos

noncomputable section

/-- Horner evaluation of a coefficient list. -/
def evalG {α : Type} (ev : α → ℝ) (p : List α) (x : ℝ) : ℝ :=
  p.foldr (fun a acc => ev a + x * acc) 0

@[simp] lemma evalG_nil {α : Type} (ev : α → ℝ) (x : ℝ) : evalG ev [] x = 0 := rfl

@[simp] lemma evalG_cons {α : Type} (ev : α → ℝ) (a : α) (p : List α) (x : ℝ) :
    evalG ev (a :: p) x = ev a + x * evalG ev p x := rfl

section Generic

variable {α : Type} (ev : α → ℝ) (add : α → α → α) (smul : ℤ → α → α) (zero : α)
  (hadd : ∀ a b, ev (add a b) = ev a + ev b) (hsmul : ∀ m a, ev (smul m a) = m * ev a)
  (hzero : ev zero = 0)
include hadd

lemma evalG_zipAddG (p q : List α) (x : ℝ) :
    evalG ev (zipAddG add p q) x = evalG ev p x + evalG ev q x := by
  induction p generalizing q with
  | nil => cases q <;> simp [zipAddG]
  | cons a p ih =>
    cases q with
    | nil => simp [zipAddG]
    | cons b q => simp only [zipAddG, evalG_cons, hadd, ih]; ring

include hsmul hzero

lemma evalG_mulLinG (m : ℤ) (acc : List α) (x : ℝ) :
    evalG ev (mulLinG add smul zero m acc) x = (m + x) * evalG ev acc x := by
  rw [mulLinG, evalG_zipAddG ev add hadd, evalG_cons, hzero]
  have : evalG ev (acc.map (smul m)) x = m * evalG ev acc x := by
    induction acc with
    | nil => simp
    | cons a p ih => simp only [List.map_cons, evalG_cons, hsmul, ih]; ring
  rw [this]; ring

/-- **The Taylor shift evaluates to `p(m + x)`.** -/
lemma evalG_shiftG (m : ℤ) (p : List α) (x : ℝ) :
    evalG ev (shiftG add smul zero m p) x = evalG ev p (m + x) := by
  induction p with
  | nil => rfl
  | cons a p ih =>
    show evalG ev (zipAddG add (mulLinG add smul zero m (shiftG add smul zero m p)) [a]) x = _
    rw [evalG_zipAddG ev add hadd, evalG_mulLinG ev add smul zero hadd hsmul hzero, ih]
    simp; ring

end Generic

lemma evalG_map {α β : Type} (ev₁ : α → ℝ) (ev₂ : β → ℝ) (f : α → β) (h : ∀ a, ev₂ (f a) = ev₁ a)
    (p : List α) (x : ℝ) : evalG ev₂ (p.map f) x = evalG ev₁ p x := by
  induction p with
  | nil => rfl
  | cons a p ih => simp [h, ih]

/-! ### The three levels -/

/-- One variable. -/
def e1 (p : List ℤ) (x : ℝ) : ℝ := evalG (fun a : ℤ => (a : ℝ)) p x

/-- Two variables (outer index `x`). -/
def e2 (p : List (List ℤ)) (x y : ℝ) : ℝ := evalG (fun a => e1 a y) p x

/-- Three variables (outer index `x`). -/
def e3 (p : List (List (List ℤ))) (x y z : ℝ) : ℝ := evalG (fun a => e2 a y z) p x

lemma e1_add1 (a b : List ℤ) (y : ℝ) : e1 (add1 a b) y = e1 a y + e1 b y :=
  evalG_zipAddG _ _ (fun a b => by push_cast; ring) a b y

lemma e1_smul1 (m : ℤ) (a : List ℤ) (y : ℝ) : e1 (smul1 m a) y = m * e1 a y := by
  induction a with
  | nil => simp [smul1, e1]
  | cons b p ih =>
    simp only [smul1, e1, List.map_cons, evalG_cons] at ih ⊢
    rw [ih]; push_cast; ring

lemma e2_add2 (a b : List (List ℤ)) (y z : ℝ) : e2 (add2 a b) y z = e2 a y z + e2 b y z :=
  evalG_zipAddG _ _ (fun a b => e1_add1 a b z) a b y

lemma e2_smul2 (m : ℤ) (a : List (List ℤ)) (y z : ℝ) : e2 (smul2 m a) y z = m * e2 a y z := by
  induction a with
  | nil => simp [smul2, e2]
  | cons b p ih =>
    simp only [smul2, e2, List.map_cons, evalG_cons] at ih ⊢
    rw [ih, e1_smul1]; ring

lemma e1_shift1 (m : ℤ) (p : List ℤ) (x : ℝ) : e1 (shift1 m p) x = e1 p (m + x) :=
  evalG_shiftG _ _ _ _ (fun a b => by push_cast; ring) (fun m a => by push_cast; ring) (by simp) m p x

lemma e2_shift2 (m : ℤ) (p : List (List ℤ)) (x y : ℝ) : e2 (shift2 m p) x y = e2 p (m + x) y :=
  evalG_shiftG _ _ _ _ (fun a b => e1_add1 a b y) (fun m a => e1_smul1 m a y) (by simp) m p x

lemma e3_shift3 (m : ℤ) (p : List (List (List ℤ))) (x y z : ℝ) :
    e3 (shift3 m p) x y z = e3 p (m + x) y z :=
  evalG_shiftG _ _ _ _ (fun a b => e2_add2 a b y z) (fun m a => e2_smul2 m a y z) (by simp)
    m p x

/-- **All three shifts.** -/
theorem e3_shiftAll (mU mV mW : ℤ) (A : List (List (List ℤ))) (x y z : ℝ) :
    e3 (shiftAll mU mV mW A) x y z = e3 A (mU + x) (mV + y) (mW + z) := by
  rw [shiftAll, e3_shift3]
  unfold e3
  refine evalG_map _ _ _ (fun row => ?_) A _
  rw [e2_shift2]
  unfold e2
  exact evalG_map _ _ _ (fun a => e1_shift1 mW a z) row _

/-! ### Absolute bounds -/

lemma abs_evalG_le {α : Type} (ev evA : α → ℝ) (hA : ∀ a, |ev a| ≤ evA a) (hA0 : ∀ a, 0 ≤ evA a)
    (p : List α) {x r : ℝ} (hx : |x| ≤ r) : |evalG ev p x| ≤ evalG evA p r := by
  have hr : 0 ≤ r := (abs_nonneg x).trans hx
  have hnn : ∀ q : List α, 0 ≤ evalG evA q r := fun q => by
    induction q with
    | nil => simp
    | cons a q ih => simp only [evalG_cons]; exact add_nonneg (hA0 a) (mul_nonneg hr ih)
  induction p with
  | nil => simp
  | cons a p ih =>
    simp only [evalG_cons]
    calc |ev a + x * evalG ev p x| ≤ |ev a| + |x| * |evalG ev p x| := by
          rw [← abs_mul]; exact abs_add_le _ _
      _ ≤ evA a + r * evalG evA p r :=
          add_le_add (hA a) (mul_le_mul hx ih (abs_nonneg _) hr)

lemma absEval1_eq (r : ℕ) (p : List ℤ) :
    ((absEval1 r p : ℕ) : ℝ) = evalG (fun a : ℤ => ((a.natAbs : ℕ) : ℝ)) p r := by
  induction p with
  | nil => simp [absEval1]
  | cons a p ih => simp only [absEval1, List.foldr_cons, evalG_cons] at ih ⊢; push_cast; rw [ih]

lemma absEval2_eq (r s : ℕ) (p : List (List ℤ)) :
    ((absEval2 r s p : ℕ) : ℝ) = evalG (fun a => ((absEval1 s a : ℕ) : ℝ)) p r := by
  induction p with
  | nil => simp [absEval2]
  | cons a p ih => simp only [absEval2, List.foldr_cons, evalG_cons] at ih ⊢; push_cast; rw [ih]

lemma absEval3_eq (r s t : ℕ) (p : List (List (List ℤ))) :
    ((absEval3 r s t p : ℕ) : ℝ) = evalG (fun a => ((absEval2 s t a : ℕ) : ℝ)) p r := by
  induction p with
  | nil => simp [absEval3]
  | cons a p ih => simp only [absEval3, List.foldr_cons, evalG_cons] at ih ⊢; push_cast; rw [ih]

lemma abs_e1_le (p : List ℤ) {x : ℝ} {r : ℕ} (hx : |x| ≤ r) : |e1 p x| ≤ absEval1 r p := by
  rw [absEval1_eq]
  exact abs_evalG_le _ _ (fun a => by simp [Nat.cast_natAbs]) (fun a => by positivity) p hx

lemma abs_e2_le (p : List (List ℤ)) {x y : ℝ} {r s : ℕ} (hx : |x| ≤ r) (hy : |y| ≤ s) :
    |e2 p x y| ≤ absEval2 r s p := by
  rw [absEval2_eq]
  exact abs_evalG_le _ _ (fun a => abs_e1_le a hy) (fun a => by positivity) p hx

/-- **The absolute bound** on a box. -/
theorem abs_e3_le (p : List (List (List ℤ))) {x y z : ℝ} {r s t : ℕ} (hx : |x| ≤ r)
    (hy : |y| ≤ s) (hz : |z| ≤ t) : |e3 p x y z| ≤ absEval3 r s t p := by
  rw [absEval3_eq]
  exact abs_evalG_le _ _ (fun a => abs_e2_le a hy hz) (fun a => by positivity) p hx

/-! ### Dense arrays on `range n` -/

lemma evalG_append {α : Type} (ev : α → ℝ) (p : List α) (a : α) (x : ℝ) :
    evalG ev (p ++ [a]) x = evalG ev p x + x ^ p.length * ev a := by
  induction p with
  | nil => simp
  | cons b p ih => simp only [List.cons_append, evalG_cons, ih, List.length_cons]; ring

lemma evalG_range_map {α : Type} (ev : α → ℝ) (f : ℕ → α) (n : ℕ) (x : ℝ) :
    evalG ev ((List.range n).map f) x = ∑ i ∈ range n, ev (f i) * x ^ i := by
  induction n with
  | zero => simp
  | succ n ih =>
    rw [List.range_succ, List.map_append, List.map_singleton, evalG_append, ih, sum_range_succ,
      List.length_map, List.length_range]
    ring

end

end Grothe.UpperChaos
