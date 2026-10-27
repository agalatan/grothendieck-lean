import Mathlib.Analysis.Fourier.ZMod
import Mathlib.Analysis.Fourier.FiniteAbelian.Orthogonality
import Mathlib.Analysis.Normed.Group.InfiniteSum

/-!
# Fourier sampling and modular aliasing

The samples are of an abstract absolutely convergent Fourier series. Its
identification with the
actual Gaussian kernel and numerical sample enclosures are separate tasks.
The indicator formulation retains the whole infinite tail and avoids dividing
it into per-coefficient estimates.
-/

open Finset AddChar ZMod
namespace Grothe.UpperChaos.DirectSample
noncomputable section

/-- Normalized roots-of-unity filter. -/
lemma stdChar_filter (N : ℕ) [NeZero N] (a b : ZMod N) :
    (N : ℂ)⁻¹ * (∑ k : ZMod N,
        ZMod.stdAddChar (-(k * b)) * ZMod.stdAddChar (a * k)) =
      if a = b then 1 else 0 := by
  have hsum (t : ZMod N) : (∑ k : ZMod N, ZMod.stdAddChar (t * k)) =
      if t = 0 then (N : ℂ) else 0 := by
    split_ifs with h
    · simp only [h, zero_mul, map_zero_eq_one, sum_const, card_univ, ZMod.card,
        nsmul_eq_mul, mul_one]
    · exact sum_eq_zero_of_ne_one (isPrimitive_stdAddChar N h)
  have hchar (k : ZMod N) :
      ZMod.stdAddChar (-(k * b)) * ZMod.stdAddChar (a * k) =
        ZMod.stdAddChar ((a - b) * k) := by
    rw [← map_add_eq_mul]
    congr 1
    ring
  simp_rw [hchar]
  rw [hsum]
  by_cases h : a = b
  · subst b
    simp [NeZero.ne (N : ℂ)]
  · have hn : a - b ≠ 0 := sub_ne_zero.mpr h
    simp [h, hn]

/-- The samples of an absolutely convergent series, on characters of `ZMod N`. -/
def seriesSample (N : ℕ) [NeZero N] (a : ℕ → ℂ) (k : ZMod N) : ℂ :=
  ∑' n, a n * ZMod.stdAddChar ((n : ZMod N) * k)

/-- Normalized transform, with the sign convention of `ZMod.dft`. -/
def sampledCoeff (N : ℕ) [NeZero N] (a : ℕ → ℂ) (j : ZMod N) : ℂ :=
  (N : ℂ)⁻¹ * ∑ k : ZMod N,
    ZMod.stdAddChar (-(k * j)) * seriesSample N a k

/-- Sampling recovers all and only the coefficients in the residue class.
This is exact: all omitted aliases remain in the infinite sum. -/
theorem sampledCoeff_eq_residue_tsum (N : ℕ) [NeZero N] (a : ℕ → ℂ)
    (ha : Summable fun n => ‖a n‖) (j : ZMod N) :
    sampledCoeff N a j =
      ∑' n : ℕ, if (n : ZMod N) = j then a n else 0 := by
  classical
  have hs (k : ZMod N) : Summable (fun n =>
      a n * ZMod.stdAddChar ((n : ZMod N) * k)) := by
    apply ha.of_norm_bounded
    intro n
    simp [ZMod.stdAddChar_apply]
  have hs' (k : ZMod N) : Summable (fun n =>
      ZMod.stdAddChar (-(k * j)) * (a n * ZMod.stdAddChar ((n : ZMod N) * k))) :=
    (hs k).mul_left _
  unfold sampledCoeff seriesSample
  simp_rw [← tsum_mul_left]
  rw [← Summable.tsum_finsetSum (fun k _ => hs' k)]
  rw [← tsum_mul_left]
  apply tsum_congr
  intro n
  have hfinite : (∑ k : ZMod N,
      ZMod.stdAddChar (-(k * j)) * (a n * ZMod.stdAddChar ((n : ZMod N) * k))) =
      a n * ∑ k : ZMod N,
        ZMod.stdAddChar (-(k * j)) * ZMod.stdAddChar ((n : ZMod N) * k) := by
    rw [Finset.mul_sum]
    apply sum_congr rfl
    intro k _
    ring
  rw [hfinite]
  rw [show (N : ℂ)⁻¹ * (a n * ∑ k : ZMod N,
      ZMod.stdAddChar (-(k * j)) * ZMod.stdAddChar ((n : ZMod N) * k)) =
      a n * ((N : ℂ)⁻¹ * ∑ k : ZMod N,
        ZMod.stdAddChar (-(k * j)) * ZMod.stdAddChar ((n : ZMod N) * k)) by ring]
  rw [stdChar_filter N (n : ZMod N) j]
  split_ifs <;> simp_all

end
end Grothe.UpperChaos.DirectSample
