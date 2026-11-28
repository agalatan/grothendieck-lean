import Grothe.LowerAnalytic.CapPolar
import Grothe.UpperChaos.ComplexMoments
import Mathlib.MeasureTheory.Integral.Gamma

/-! Radial moments of the unit complex Gaussian underlying the visible phase.
Agent-ID: codex-a7c4 -/
namespace Grothe.LowerAnalytic
open MeasureTheory Real
noncomputable section

/-- The integer radial moments include both the polynomial moments and the
half-integer exponential moments needed by a circular phase. -/
theorem visible_radial_moment (m : ℕ) :
    (∫ z : ℂ, ‖z‖ ^ m ∂gaussC) = Real.Gamma (((m : ℝ) + 2) / 2) := by
  rw [integral_gaussC_eq_volume _ (by fun_prop)]
  have h := Complex.integral_rpow_mul_exp_neg_rpow
    (p := 2) (q := (m : ℝ)) (by norm_num) (by linarith [Nat.cast_nonneg (α := ℝ) m])
  simp only [Real.rpow_natCast, Real.rpow_two] at h
  calc
    _ = π⁻¹ * (∫ z : ℂ, ‖z‖ ^ m * Real.exp (-‖z‖ ^ 2)) := by
      rw [← integral_const_mul]
      apply integral_congr_ae
      filter_upwards with z
      rw [Complex.normSq_eq_norm_sq]
      ring
    _ = _ := by rw [h]; field_simp

theorem visible_radial_even (k : ℕ) :
    (∫ z : ℂ, ‖z‖ ^ (2*k) ∂gaussC) = k.factorial := by
  rw [visible_radial_moment, show (((2*k : ℕ) : ℝ) + 2) / 2 = (k : ℝ) + 1 by push_cast; ring,
    Real.Gamma_nat_eq_factorial]

theorem visible_radial_odd (k : ℕ) :
    (∫ z : ℂ, ‖z‖ ^ (2*k + 1) ∂gaussC) =
      ((2*k+1).doubleFactorial : ℝ) * √π / 2^(k+1) := by
  rw [visible_radial_moment, show (((2*k+1 : ℕ) : ℝ) + 2)/2 = (k : ℝ) + 1 + 1/2 by push_cast; ring,
    Real.Gamma_nat_add_one_add_half]
end
end Grothe.LowerAnalytic

/-! The finite scalar tests for the pure phase projection. Agent-ID: codex-a7c4 -/
namespace Grothe.LowerAnalytic
open MeasureTheory Real Grothe.UpperChaos
open scoped ComplexConjugate
noncomputable section

def visiblePhase (z : ℂ) : ℂ := z / (‖z‖ : ℂ)

def visiblePower (j : ℕ) (z : ℂ) : ℂ := z^(j+1) * conj z^j

theorem visible_power_moment (p q j : ℕ) :
    (∫ z : ℂ, conj (z^p * conj z^q) * visiblePower j z ∂gaussC) =
      if p = q+1 then ((p+j).factorial : ℂ) else 0 := by
  have hg : ∀ z : ℂ, conj (z^p * conj z^q) * visiblePower j z =
      z^(q+j+1) * conj z^(p+j) := by
    intro z
    simp only [visiblePower,map_mul,map_pow,Complex.conj_conj,pow_add,pow_one]
    ring
  simp_rw [hg]
  rw [integral_moment]
  split_ifs with hab hpc hpc
  · rw [hab]
  · omega
  · omega
  · rfl

private theorem visible_phase_diag (q : ℕ) :
    (∫ z : ℂ, conj (z^(q+1) * conj z^q) * visiblePhase z ∂gaussC) =
      ((∫ z : ℂ, ‖z‖^(2*q+1) ∂gaussC : ℝ) : ℂ) := by
  rw [← integral_complex_ofReal]
  apply integral_congr_ae
  filter_upwards with z
  by_cases hz : z = 0
  · simp [hz,visiblePhase]
  have hr : (‖z‖ : ℂ) ≠ 0 := by exact_mod_cast norm_ne_zero_iff.mpr hz
  have hzz : conj z * z = ((‖z‖ : ℂ)^2) := by
    rw [← Complex.normSq_eq_conj_mul_self,Complex.normSq_eq_norm_sq,Complex.ofReal_pow]
  simp only [visiblePhase,map_mul,map_pow,Complex.conj_conj,pow_succ]
  field_simp
  calc
    _ = (conj z * z)^q * (conj z * z) := by ring
    _ = _ := by rw [hzz]; push_cast; ring

/-- A quarter turn separates every off-diagonal charge in the 3 × 2
quintic rectangle. This holds pointwise with the zero-valued phase at zero. -/
theorem visible_phase_moment (p q : ℕ) (hp : p ≤ 3) (hq : q ≤ 2) :
    (∫ z : ℂ, conj (z^p * conj z^q) * visiblePhase z ∂gaussC) =
      if p = q+1 then ((∫ z : ℂ, ‖z‖^(2*q+1) ∂gaussC : ℝ) : ℂ) else 0 := by
  split_ifs with he
  · subst p; exact visible_phase_diag q
  let f : ℂ → ℂ := fun z => conj (z^p * conj z^q) * visiblePhase z
  let c := (conj Complex.I)^p * Complex.I^q * Complex.I
  have hrot (z : ℂ) : f (Complex.I * z) = c * f z := by
    simp only [f,c,visiblePhase,map_mul,map_pow,Complex.conj_conj,
      norm_mul,Complex.norm_I,one_mul,mul_pow]
    ring
  have hn : c ≠ 1 := by
    dsimp only [c]
    interval_cases p <;> interval_cases q <;>
      norm_num [Complex.I_sq,Complex.conj_I,Complex.ext_iff,Complex.mul_im,Complex.mul_re,pow_succ] at *
  have eqn := integral_rot_gaussC Complex.I Complex.norm_I f
  simp_rw [hrot, integral_const_mul] at eqn
  exact Or.resolve_left (mul_eq_zero.mp (show (c-1) * ∫ z : ℂ, f z ∂gaussC = 0 by
    linear_combination eqn)) (sub_ne_zero.mpr hn)
end
end Grothe.LowerAnalytic

namespace Grothe.LowerAnalytic
open MeasureTheory Real Grothe.UpperChaos
open scoped ComplexConjugate
noncomputable section

def visTest (p q : ℕ) (f : ℂ → ℂ) : ℂ := ∫ z:ℂ, conj (z^p * conj z^q) * f z ∂gaussC

theorem visMon_mem (p q : ℕ) : MemLp (fun z:ℂ => z^p * conj z^q) 2 gaussC := by
  rw [memLp_two_iff_integrable_sq_norm (by fun_prop)]
  simp only [norm_mul,norm_pow,Complex.norm_conj,← pow_add,← pow_mul]
  exact integrable_norm_pow _

theorem visPower_mem (j : ℕ) : MemLp (visiblePower j) 2 gaussC := visMon_mem _ _

theorem visPhase_mem : MemLp visiblePhase 2 gaussC := by
  apply MemLp.of_bound (C := 1) (measurable_id.div (Complex.measurable_ofReal.comp measurable_norm)).aestronglyMeasurable
  filter_upwards with z
  change ‖z / (‖z‖:ℂ)‖ ≤ 1
  simp only [norm_div,Complex.norm_real,Real.norm_eq_abs,abs_norm]
  by_cases h : z = 0 <;> simp [h]

private theorem visTest_int (p q : ℕ) {f : ℂ → ℂ} (hf : MemLp f 2 gaussC) :
    Integrable (fun z:ℂ => conj (z^p * conj z^q) * f z) gaussC := by
  have h : MemLp (fun z:ℂ => conj (z^p * conj z^q)) 2 gaussC := by
    simpa [map_mul,map_pow,mul_comm] using visMon_mem q p
  exact h.integrable_mul hf

theorem visTest_add {p q : ℕ} {f g : ℂ → ℂ} (hf : MemLp f 2 gaussC) (hg : MemLp g 2 gaussC) :
    visTest p q (f+g) = visTest p q f + visTest p q g := by
  simp only [visTest,Pi.add_apply,mul_add,integral_add (visTest_int p q hf) (visTest_int p q hg)]

theorem visTest_sub {p q : ℕ} {f g : ℂ → ℂ} (hf : MemLp f 2 gaussC) (hg : MemLp g 2 gaussC) :
    visTest p q (f-g) = visTest p q f - visTest p q g := by
  simp only [visTest,Pi.sub_apply,mul_sub,integral_sub (visTest_int p q hf) (visTest_int p q hg)]

theorem visTest_smul (p q : ℕ) (a : ℂ) (f : ℂ → ℂ) :
    visTest p q (a • f) = a * visTest p q f := by
  simp only [visTest,Pi.smul_apply,smul_eq_mul,mul_left_comm _ a,integral_const_mul]

def visMu : ℂ := ((√π/2 : ℝ) : ℂ)
def visCubic : ℂ → ℂ := (3*visMu/2) • visiblePower 0 - (visMu/4) • visiblePower 1
def visFifth : ℂ → ℂ := (6*visMu/16) • visiblePower 0 -
    (6*visMu/16) • visiblePower 1 + (visMu/16) • visiblePower 2

theorem visCubic_mem : MemLp visCubic 2 gaussC :=
  ((visPower_mem 0).const_smul _).sub ((visPower_mem 1).const_smul _)

theorem visFifth_mem : MemLp visFifth 2 gaussC :=
  (((visPower_mem 0).const_smul _).sub ((visPower_mem 1).const_smul _)).add
    ((visPower_mem 2).const_smul _)

private theorem visTest_power (p q j : ℕ) :
    visTest p q (visiblePower j) = if p = q+1 then ((p+j).factorial : ℂ) else 0 :=
  visible_power_moment _ _ _

theorem visFifth_orth_cubic (p q : ℕ) (hp : p ≤ 2) (hq : q ≤ 1) :
    visTest p q visFifth = 0 := by
  simp only [visFifth,visTest_add (((visPower_mem 0).const_smul _).sub
    ((visPower_mem 1).const_smul _)) ((visPower_mem 2).const_smul _),
    visTest_sub ((visPower_mem 0).const_smul _) ((visPower_mem 1).const_smul _),visTest_smul,
    visTest_power]
  interval_cases p <;> interval_cases q <;> norm_num <;> ring

theorem visFifth_last_moment : visTest 3 2 visFifth = 3*visMu/4 := by
  simp only [visFifth,visTest_add (((visPower_mem 0).const_smul _).sub
    ((visPower_mem 1).const_smul _)) ((visPower_mem 2).const_smul _),
    visTest_sub ((visPower_mem 0).const_smul _) ((visPower_mem 1).const_smul _),visTest_smul,
    visTest_power]
  norm_num
  ring

theorem visPhase_orth_five (p q : ℕ) (hp : p ≤ 3) (hq : q ≤ 2) :
    visTest p q (visiblePhase-visCubic-visFifth) = 0 := by
  rw [visTest_sub (visPhase_mem.sub visCubic_mem) visFifth_mem,
    visTest_sub visPhase_mem visCubic_mem,show visTest p q visiblePhase = _ from visible_phase_moment p q hp hq]
  simp only [visFifth,visCubic,visTest_add (((visPower_mem 0).const_smul _).sub
    ((visPower_mem 1).const_smul _)) ((visPower_mem 2).const_smul _),
    visTest_sub ((visPower_mem 0).const_smul _) ((visPower_mem 1).const_smul _),visTest_smul,
    visTest_power,visible_radial_odd,visMu]
  interval_cases p <;> interval_cases q <;> norm_num [Nat.doubleFactorial,pow_succ] <;> ring
end
end Grothe.LowerAnalytic
