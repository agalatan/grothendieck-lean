import Mathlib.Analysis.InnerProductSpace.Positive
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

set_option warningAsError true

/-! A two-vector estimate for a Hermitian operator with spectrum in [−e,1].
Agent-ID: codex-a7c4 -/
namespace Grothe.LowerAnalytic
open scoped ComplexConjugate
noncomputable section

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E]

private theorem positive_form_cs {T : E →L[ℂ] E} (hT : T.IsPositive) (f g : E) :
    ‖inner ℂ f (T g)‖^2 ≤ (inner ℂ f (T f)).re * (inner ℂ g (T g)).re := by
  let form : PreInnerProductSpace.Core ℂ E :=
    { inner := fun x y => inner ℂ x (T y)
      conj_inner_symm := fun x y => (inner_conj_symm _ _).trans (hT.inner_left_eq_inner_right x y)
      re_inner_nonneg := hT.re_inner_nonneg_right
      add_left := fun x y z => inner_add_left x y (T z)
      smul_left := fun x y r => inner_smul_left x (T y) r }
  have h := InnerProductSpace.Core.inner_mul_inner_self_le (c:=form) f g
  change ‖inner ℂ f (T g)‖ * ‖inner ℂ g (T f)‖ ≤ _ at h
  have hc : conj (inner ℂ g (T f)) = inner ℂ f (T g) :=
    (inner_conj_symm _ _).trans (hT.inner_left_eq_inner_right f g)
  rw [← hc,Complex.norm_conj,sq]
  rwa [← hc,Complex.norm_conj] at h

/-- Simultaneously price two positive shifts of a Hermitian operator. The squared
overlap of the original vectors survives, with its phase unrestricted. -/
theorem spectral_pair_gram (S : E →L[ℂ] E) {e : ℝ} (he : 0 ≤ e)
    (hlo : (S+(e:ℂ) • (1 : E →L[ℂ] E)).IsPositive)
    (hhi : ((1 : E →L[ℂ] E)-S).IsPositive) (f g : E) :
    ‖inner ℂ f (S g)‖^2 ≤ (inner ℂ f (S f)).re*(inner ℂ g (S g)).re +
      e*(‖f‖^2*‖g‖^2-‖inner ℂ f g‖^2) := by
  let z := inner ℂ f (S g)
  let c := inner ℂ f g
  let a := (inner ℂ f (S f)).re
  let b := (inner ℂ g (S g)).re
  let m := ‖f‖^2
  let n := ‖g‖^2
  have hnorm (u : E) : (inner ℂ u u).re = ‖u‖^2 := by rw [inner_self_eq_norm_sq_to_K]; norm_cast
  have ha := positive_form_cs hlo f g
  have hb := positive_form_cs hhi f g
  simp only [add_apply,smul_apply,one_apply_eq_self,
    inner_add_right,inner_smul_right,Complex.add_re,Complex.re_ofReal_mul,hnorm] at ha
  simp only [sub_apply,one_apply_eq_self,inner_sub_right,Complex.sub_re,
    hnorm] at hb
  change ‖z+(e:ℂ)*c‖^2 ≤ (a+e*m)*(b+e*n) at ha
  change ‖c-z‖^2 ≤ (m-a)*(n-b) at hb
  have comb := add_le_add ha (mul_le_mul_of_nonneg_left hb he)
  have identity : ‖z+(e:ℂ)*c‖^2 + e*‖c-z‖^2 = (1+e)*(‖z‖^2+e*‖c‖^2) := by
    simp only [Complex.sq_norm,Complex.normSq_apply,Complex.add_re,Complex.add_im,Complex.sub_re,
      Complex.sub_im,Complex.mul_re,Complex.mul_im,Complex.ofReal_re,Complex.ofReal_im]
    ring
  rw [identity] at comb
  change ‖z‖^2 ≤ a*b+e*(m*n-‖c‖^2)
  apply le_of_mul_le_mul_left _ (show 0 < 1+e by linarith only [he])
  nlinarith only [comb]

end
end Grothe.LowerAnalytic
