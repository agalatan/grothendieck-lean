import Grothe.UpperChaos.GradedHermitePhaseSlice

/-!
# Rational four-variable phase invariant

The variables are `(z, conj z, w, conj w)`. The rational polynomial is built
from the actual source-format term list, and evaluation is connected to the
existing conditional phase slice. No numerical or Wick claim is asserted.

Agent-ID: codex-8c4d
-/

open Complex MvPolynomial
open scoped ComplexConjugate

namespace Grothe.UpperChaos.RationalPhaseInvariant

noncomputable section

abbrev RatPoly4 := MvPolynomial (Fin 4) ℚ

/-- Evaluation at `(z, conj z, w, conj w)` after rational coefficient cast. -/
def evalQ (z w : ℂ) : RatPoly4 →+* ℂ :=
  MvPolynomial.eval₂Hom (Rat.castHom ℂ) ![z, conj z, w, conj w]

def normZQ : RatPoly4 := X 0 * X 1
def normWQ : RatPoly4 := X 2 * X 3
def realPartQ : RatPoly4 := C (1 / 2 : ℚ) * (X 1 * X 2 + X 0 * X 3)

/-- One original source term expressed over the rational polynomial ring. -/
def phaseTermQ (t : (ℕ × ℕ × ℕ) × ℚ) : RatPoly4 :=
  C t.2 * normZQ ^ t.1.1 * normWQ ^ t.1.2.1 * realPartQ ^ t.1.2.2

/-- The invariant phase polynomial, using the given source list verbatim. -/
def phaseInvariantQ (ts : List ((ℕ × ℕ × ℕ) × ℚ)) : RatPoly4 :=
  (ts.map phaseTermQ).sum

theorem eval_normZQ (z w : ℂ) : evalQ z w normZQ = (normSq z : ℂ) := by
  simp [evalQ, normZQ, Complex.mul_conj]

theorem eval_normWQ (z w : ℂ) : evalQ z w normWQ = (normSq w : ℂ) := by
  simp [evalQ, normWQ, Complex.mul_conj]

theorem eval_realPartQ (z w : ℂ) :
    evalQ z w realPartQ = ((conj z * w).re : ℂ) := by
  calc
    evalQ z w realPartQ = ev w (phaseRealSlice z) := by
      simp [evalQ, realPartQ, ev, phaseRealSlice, zv]
    _ = _ := ev_phaseRealSlice z w

/-- Each rational source monomial evaluates to the corresponding real phase
monomial, embedded in the complex numbers. -/
theorem eval_phaseTermQ (t : (ℕ × ℕ × ℕ) × ℚ) (z w : ℂ) :
    evalQ z w (phaseTermQ t) =
      (((t.2 : ℝ) * normSq z ^ t.1.1 * normSq w ^ t.1.2.1 *
        (conj z * w).re ^ t.1.2.2 : ℝ) : ℂ) := by
  simp only [phaseTermQ, map_mul, map_pow]
  rw [eval_normZQ, eval_normWQ, eval_realPartQ]
  simp only [evalQ, eval₂Hom_C]
  push_cast
  rfl

/-- The rational source polynomial evaluates to the actual phase sum. -/
theorem eval_phaseInvariantQ (ts : List ((ℕ × ℕ × ℕ) × ℚ)) (z w : ℂ) :
    evalQ z w (phaseInvariantQ ts) =
      (Ssum ts (normSq z) (normSq w) (conj z * w).re : ℂ) := by
  induction ts with
  | nil => simp [phaseInvariantQ, Ssum]
  | cons t ts ih =>
      change evalQ z w (phaseTermQ t + phaseInvariantQ ts) =
        (((t.2 : ℝ) * normSq z ^ t.1.1 * normSq w ^ t.1.2.1 *
          (conj z * w).re ^ t.1.2.2 +
            Ssum ts (normSq z) (normSq w) (conj z * w).re : ℝ) : ℂ)
      rw [map_add, Complex.ofReal_add, eval_phaseTermQ, ih]

/-- The rational four-variable phase invariant agrees with the existing
complex two-variable slice at every pair of complex arguments. -/
theorem eval_phaseInvariantQ_eq_slice
    (ts : List ((ℕ × ℕ × ℕ) × ℚ)) (z w : ℂ) :
    evalQ z w (phaseInvariantQ ts) = ev w (phaseInvariantSlice ts z) := by
  rw [eval_phaseInvariantQ, ev_phaseInvariantSlice]

end
end Grothe.UpperChaos.RationalPhaseInvariant
