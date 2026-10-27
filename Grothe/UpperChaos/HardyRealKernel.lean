import Grothe.UpperChaos.HardyKernel
import Grothe.UpperChaos.HardyRealAlg

/-!
# The holomorphic kernel at a real cross covariance (Hardy step 1(b))

For a real symmetric `R = [[a, b], [b, c]]` with `K = I − R² ≻ 0`, the exponent of `kHol` is real and equals
`−(‖x‖² + ‖S⁻¹(y − Rx)‖²)/2` (`kExp_real`), and `det(I − R²) = det K` (`detIm_real`). So `kHol R` is the
product of standard Gaussian densities of `x` and of `S⁻¹(y − Rx)`, divided by `det S² = det K` per pair of real
copies: the density of `(u, Ru + Sw)`.
-/

open Complex

namespace Grothe.UpperChaos.HardyReal

noncomputable section

/-- The complex symmetric matrix with real entries `a, b, c`. -/
def Rre (a b c : ℝ) : Sym2C := ⟨a, b, c⟩

variable {a b c : ℝ}

lemma detIm_real : (Rre a b c).detIm = (kdet a b c : ℂ) := by
  simp only [Sym2C.detIm, Sym2C.sq, Rre, kdet, k11, k12, k22]; push_cast; ring

/-- **The exponent at a real cross covariance.** -/
theorem kExp_real (h : 0 < k11 a b) (hd : 0 < kdet a b c) (x y : ℝ × ℝ) :
    kExp (Rre a b c) x y = ((-(x.1 ^ 2 + x.2 ^ 2 + (solveS a b c (y - mulR a b c x)).1 ^ 2
      + (solveS a b c (y - mulR a b c x)).2 ^ 2) / 2 : ℝ) : ℂ) := by
  rw [chol_quad h hd]
  have hdc : (kdet a b c : ℂ) ≠ 0 := by exact_mod_cast hd.ne'
  have e : (Rre a b c).detIm = (kdet a b c : ℂ) := detIm_real
  simp only [kExp, Sym2C.Amat, Sym2C.Cmat, Sym2C.form, e]
  simp only [Sym2C.sq, Rre, qf, kdet, k11, k12, k22] at hdc ⊢
  push_cast
  field_simp
  ring

end

end Grothe.UpperChaos.HardyReal
