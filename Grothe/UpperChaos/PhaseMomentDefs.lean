import GrotheKernel.PhiCheck
import Mathlib.Data.Rat.Init
import Mathlib.Data.Int.Notation

/-! Lightweight dense integer polynomial definitions for phase moments.
Agent-ID: codex-8c4d. -/

open GrotheKernel

namespace Grothe.UpperChaos.PhaseMomentCheck

/-- One monomial in a coefficient list. -/
def monomialG {α : Type} (zero a : α) (n : ℕ) : List α :=
  List.replicate n zero ++ [a]

/-- The integer monomial `c U^a V^b W^d`. -/
def monomial3 (a b d : ℕ) (c : ℤ) : List (List (List ℤ)) :=
  monomialG [] (monomialG [] (monomialG 0 c d) b) a

/-- Clear a specified denominator and sum the resulting integer monomials. -/
def ofTerms (L : ℕ) (ts : List ((ℕ × ℕ × ℕ) × ℚ)) : List (List (List ℤ)) :=
  ts.foldr (fun t p =>
    add3 (monomial3 t.1.1 t.1.2.1 t.1.2.2 (t.2 * (L : ℚ)).num) p) []

/-- The unscaled integer phase polynomial; unlike `denseA0`, no grid factors are inserted. -/
def integerPhase (ts : List ((ℕ × ℕ × ℕ) × ℚ)) : List (List (List ℤ)) :=
  ofTerms (commonDen ts) ts

end Grothe.UpperChaos.PhaseMomentCheck
