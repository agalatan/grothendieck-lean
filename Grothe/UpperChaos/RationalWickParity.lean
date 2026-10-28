import Grothe.UpperChaos.RationalSourceParity
import Grothe.UpperChaos.RationalWickDefs

/-!
# Even radius powers in the actual Wick compiler

Wick contraction removes two powers at a time. The odd total degree of each
actual unit source therefore becomes even radius degree after multiplication
by the affine phase numerator. No parity assumption is left on production data.

Agent-ID: codex-2ca4
-/

open MvPolynomial

namespace Grothe.UpperChaos.RationalWickParity
open RationalSourceParity RationalWickMonomial RationalWickCompiler
open RationalUnitTaylorSource
noncomputable section

def radiusWeight : Fin 4 → ZMod 2 := ![1, 0, 0, 0]

abbrev RadiusParity (P : WickPoly) (d : ZMod 2) : Prop :=
  IsWeightedHomogeneous radiusWeight P d

private theorem radiusParity_X (i : Fin 4) :
    RadiusParity (X i) (radiusWeight i) :=
  isWeightedHomogeneous_X ℚ radiusWeight i

/-- Contracting a pair leaves the parity of the radius exponent unchanged. -/
theorem radiusParity_wickMomentQ (p q : ℕ) :
    RadiusParity (wickMomentQ p q) ((p + q : ℕ) : ZMod 2) := by
  classical
  unfold wickMomentQ
  apply IsWeightedHomogeneous.sum
  intro k hk
  have hk' : k ≤ min p q := Nat.le_of_lt_succ (Finset.mem_range.mp hk)
  have hkp := hk'.trans (min_le_left p q)
  have hkq := hk'.trans (min_le_right p q)
  have he : p + q - 2 * k + 2 * k = p + q := by omega
  have htwo : (2 : ZMod 2) = 0 := by decide +kernel
  have he' : ((p + q - 2 * k : ℕ) : ZMod 2) = ((p + q : ℕ) : ZMod 2) := by
    have h := congrArg (fun n : ℕ => (n : ZMod 2)) he
    simpa only [Nat.cast_add, Nat.cast_mul, Nat.cast_ofNat, htwo, zero_mul,
      add_zero] using h
  have h := ((((radiusParity_X 2).mul (radiusParity_X 0)).neg.pow
    (p + q - 2 * k)).C_mul
    ((p.choose k : ℚ) * (q.choose k : ℚ) * (k.factorial : ℚ))).mul
    ((radiusParity_X 1).pow (k + 1))
  simpa only [RadiusParity, radiusWeight, Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.cons_val, zero_add, nsmul_one, nsmul_zero, add_zero, he'] using h

/-- The affine numerator adds one to total source-degree parity. -/
theorem radiusParity_wickAffineMonomialQ (A B p q : ℕ) :
    RadiusParity (wickAffineMonomialQ A B p q)
      (((A + B + p + q + 1 : ℕ) : ZMod 2)) := by
  have hl : RadiusParity (X 0 * wickMomentQ p q)
      (((p + q : ℕ) : ZMod 2) + 1) := by
    simpa only [RadiusParity, radiusWeight, Matrix.cons_val_zero, add_comm] using
      (radiusParity_X 0).mul (radiusParity_wickMomentQ p q)
  have hr : RadiusParity (X 3 * wickMomentQ (p + 1) q)
      (((p + q : ℕ) : ZMod 2) + 1) := by
    simpa [RadiusParity, radiusWeight, Nat.cast_add, add_assoc, add_comm, add_left_comm] using
      (radiusParity_X 3).mul (radiusParity_wickMomentQ (p + 1) q)
  have h := ((radiusParity_X 0).pow (A + B)).mul (hl.add hr)
  simpa [RadiusParity, wickAffineMonomialQ, radiusWeight, Nat.cast_add, add_assoc] using h

/-- Compiling any odd rational source produces only even powers of the radius. -/
theorem radiusParity_wickCompileQ {P : MvPolynomial (Fin 4) ℚ}
    (hP : TotalParity P 1) : RadiusParity (wickCompileQ P) 0 := by
  classical
  unfold wickCompileQ
  apply IsWeightedHomogeneous.sum
  intro d hd
  have hs := hP (mem_support_iff.mp hd)
  have hs' : ((d 0 + d 1 + d 2 + d 3 : ℕ) : ZMod 2) = 1 := by
    simpa [Finsupp.weight_eq_sum, Fin.sum_univ_succ, Nat.cast_add,
      add_assoc] using hs
  have he : ((d 0 + d 1 + d 2 + d 3 + 1 : ℕ) : ZMod 2) = 0 := by
    rw [Nat.cast_add, Nat.cast_one, hs']
    decide +kernel
  simpa only [he] using
    (radiusParity_wickAffineMonomialQ (d 0) (d 1) (d 2) (d 3)).C_mul (P.coeff d)

/-- The compiler's production polynomial has even radius degree in every mode. -/
theorem radiusParity_unitWickQ (ts : List ((ℕ × ℕ × ℕ) × ℚ)) {N : ℕ}
    (i : GradedIdx N) (j : ℕ) :
    RadiusParity (wickCompileQ (unitSourceQ ts i j)) 0 :=
  radiusParity_wickCompileQ (totalParity_unitSourceQ ts i j)

/-- Even radius parity is precisely divisibility of each supported radius exponent. -/
theorem two_dvd_radius_exponent {P : WickPoly} (hP : RadiusParity P 0)
    {d : Fin 4 →₀ ℕ} (hd : d ∈ P.support) : 2 ∣ d 0 := by
  have h := hP (mem_support_iff.mp hd)
  have he : ((d 0 : ℕ) : ZMod 2) = 0 := by
    simpa [Finsupp.weight_eq_sum, Fin.sum_univ_succ, radiusWeight] using h
  exact (ZMod.natCast_eq_zero_iff (d 0) 2).mp he

end
end Grothe.UpperChaos.RationalWickParity
