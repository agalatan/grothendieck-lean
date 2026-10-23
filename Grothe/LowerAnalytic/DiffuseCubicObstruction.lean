import Mathlib.Tactic

/-!
Arithmetic of the genuine q_m obstruction. Gaussian invariant-space closure,
the coefficient identity, and the directed Bessel integral are external
analytic/computational inputs. No unconditional Gaussian theorem is added.
-/
namespace Grothe.LowerAnalytic.DiffuseCubicObstruction

noncomputable section

def finitePairing (j remoteEnergy sharedEnergy : ℝ) : ℝ :=
  j-(149/200:ℝ)*remoteEnergy/65537-(149/200:ℝ)*sharedEnergy/2147516416

/-- The exact finite projection identity retains both finite-size losses.
These hypotheses are supplied by the external integral and paper proof. -/
theorem finite_bridge_lower (j remoteEnergy sharedEnergy : ℝ)
    (hj : (71329117/100000000:ℝ) < j)
    (hr : remoteEnergy ≤ (51/1000:ℝ)) (hs : sharedEnergy ≤ 1) :
    (71329/100000:ℝ) < finitePairing j remoteEnergy sharedEnergy := by
  unfold finitePairing
  linarith

theorem above_target : (500/701:ℝ) < 71329/100000 := by norm_num

theorem reciprocal_ceiling : (100000/71329:ℝ) < 1401955/1000000 := by norm_num

#print axioms finite_bridge_lower
#print axioms above_target
#print axioms reciprocal_ceiling

end
end Grothe.LowerAnalytic.DiffuseCubicObstruction
