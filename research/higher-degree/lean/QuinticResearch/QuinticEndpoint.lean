import QuinticResearch.QuinticVisiblePhase
import QuinticResearch.QuinticTailTransfer
import Grothe.Lower.Cert.SparseEnvelope

/-!
# The signed quintic energy close to the visible phase

The visible Laguerre polynomial is bounded below by `−3`. Its negative part
controls the real cross term against the angular deficit of the physical midpoint.

Agent-ID: codex-a7c4
-/

namespace Grothe.LowerAnalytic

open MeasureTheory Real Grothe.Lower
open scoped ComplexConjugate

noncomputable section

private theorem phase_pairing_right (z : ℂ) : conj (ph z) * z = (‖z‖ : ℂ) := by
  have h := congrArg (starRingEnd ℂ) (conj_mul_ph z)
  simpa only [map_mul,Complex.conj_conj,Complex.conj_ofReal,mul_comm] using h

private theorem quintic_center_cross_point (h z : ℂ) (hh : ‖h‖ ≤ 1) {a : ℝ} (ha : 0 ≤ a) :
    hre (h - ph z) (((a * (‖z‖ ^ 4 - 6 * ‖z‖ ^ 2 + 6) : ℝ) : ℂ) * z) ≤
      3*a*(‖z‖ - hre h z) := by
  have hlow : -3 ≤ ‖z‖^4 - 6*‖z‖^2 + 6 := by nlinarith only [sq_nonneg (‖z‖^2-3)]
  have hbound : hre h z ≤ ‖z‖ := (Complex.re_le_norm _).trans (by
    rw [norm_mul,Complex.norm_conj]; exact mul_le_of_le_one_left (norm_nonneg _) hh)
  have he : hre (h - ph z) (((a * (‖z‖ ^ 4 - 6 * ‖z‖ ^ 2 + 6) : ℝ) : ℂ) * z) =
      (a * (‖z‖^4 - 6*‖z‖^2 + 6)) * (hre h z - ‖z‖) := by
    unfold hre
    rw [map_sub,mul_left_comm,sub_mul,phase_pairing_right,Complex.re_ofReal_mul,Complex.sub_re,Complex.ofReal_re]
  rw [he]
  nlinarith only [mul_nonneg ha (mul_nonneg (sub_nonneg.mpr hbound) (show 0 ≤ (‖z‖^4-6*‖z‖^2+6)+3 by linarith))]

/-- For a visible phase with its degree-five Laguerre projection, the cross term
costs at most three times the scalar prefactor times the first-moment deficit. -/
theorem quintic_center_cross {n : ℕ} {h z : L2G n} (hh : ∀ᵐ x ∂stdGaussian (n+n), ‖h x‖ ≤ 1)
    {a : ℝ} (ha : 0 ≤ a)
    (hproject : ⇑((H32 n).starProjection (unitPhaseL z)) =ᵐ[stdGaussian (n+n)]
      fun x => ((a * (‖z x‖ ^ 4 - 6 * ‖z x‖ ^ 2 + 6) : ℝ) : ℂ) * z x) :
    (inner ℂ (h - unitPhaseL z) ((H32 n).starProjection (unitPhaseL z))).re ≤
      3*a*((∫ x, ‖z x‖ ∂stdGaussian (n+n)) - (inner ℂ h z).re) := by
  have hi := integrable_hre (h - unitPhaseL z) ((H32 n).starProjection (unitPhaseL z))
  have hj := integrable_hre h z
  have hz := ((Lp.memLp z).integrable (by norm_num)).norm
  have hp : ⇑(unitPhaseL z) =ᵐ[stdGaussian (n+n)] fun x => ph (z x) := MemLp.coeFn_toLp _
  have hb := integral_mono_ae hi ((hz.sub hj).const_mul (3*a)) (by
    filter_upwards [hh,hp,hproject,Lp.coeFn_sub h (unitPhaseL z)] with x hh hp hq hs
    change hre ((h-unitPhaseL z) x) (((H32 n).starProjection (unitPhaseL z)) x) ≤ 3*a*(‖z x‖-hre (h x) (z x))
    rw [hs,Pi.sub_apply,hp,hq]; exact quintic_center_cross_point _ _ hh ha)
  change (∫ x, hre _ _ ∂stdGaussian (n+n)) ≤ ∫ x, 3*a*(‖z x‖-hre (h x) (z x)) ∂stdGaussian (n+n) at hb
  rw [integral_const_mul,integral_sub hz hj,← re_inner_eq_integral,← re_inner_eq_integral] at hb
  exact hb

/-- Expansion about the pure phase preserves the signed cross term and costs at
most the squared midpoint displacement for the quadratic remainder. -/
theorem quintic_projection_near_center {n : ℕ} (h p : L2G n) :
    ‖(H32 n).starProjection h‖^2 ≤ ‖(H32 n).starProjection p‖^2 +
      2*(inner ℂ (h-p) ((H32 n).starProjection p)).re + ‖h-p‖^2 := by
  let P := (H32 n).starProjection
  have hs : P h = P (h-p) + P p := by rw [map_sub,sub_add_cancel]
  have hp : inner ℂ (P (h-p)) (P p) = inner ℂ (h-p) (P p) := by
    rw [Submodule.inner_starProjection_left_eq_right,
      Submodule.starProjection_eq_self_iff.mpr ((H32 n).starProjection_apply_mem _)]
  have hn := pow_le_pow_left₀ (norm_nonneg _) ((H32 n).norm_starProjection_apply_le (h-p)) 2
  change ‖P h‖^2 ≤ ‖P p‖^2 + 2*(inner ℂ (h-p) (P p)).re + ‖h-p‖^2
  rw [hs,@norm_add_sq ℂ,hp]
  change ‖P (h-p)‖^2 ≤ ‖h-p‖^2 at hn
  change ‖P (h-p)‖^2 + 2*(inner ℂ (h-p) (P p)).re + ‖P p‖^2 ≤ _
  linarith only [hn]

/-- The exact radius `13/200` prices the scalar endpoint of the clipping bound.
The hypothesis `hdis` is the signed quintic projection bound after paying for the
half-difference. -/
private theorem quintic_upper_endpoint_arithmetic {t V : ℝ}
    (ht₀ : 885868 / 1000000 ≤ t) (ht₁ : t ≤ √π / 2)
    (hdis : V ≤ 1209 / 1250 * (Grothe.Lower.SparseEnvelope.cap : ℝ) + 41 / 1250 * t ^ 2 +
      779 / 10000 * (3*π / 256 + (3*(√π/2)/8 + 2/(13/200)) * (√π/2-t) + 4*(13/200)^2/3)) :
    V ≤ 10000 / 14023 - 1 / 100000 := by
  let μ := √π / 2
  have hs : μ^2 = π / 4 := by dsimp [μ]; rw [div_pow,Real.sq_sqrt pi_pos.le]; norm_num
  have hm₀ : 88622/100000 ≤ μ := by
    dsimp [μ]; have h : 2*(88622/100000 : ℝ) ≤ √π := (Real.le_sqrt (by norm_num) pi_pos.le).2
      (by linarith only [Real.pi_gt_d6]); linarith only [h]
  have hm₁ : μ ≤ 886227/1000000 := by
    dsimp [μ]; have h : √π ≤ 2*(886227/1000000 : ℝ) := (Real.sqrt_le_left (by norm_num)).2
      (by linarith only [Real.pi_lt_d6]); linarith only [h]
  change V ≤ _ + _ + 779/10000*(3*π/256+(3*μ/8+2/(13/200))*(μ-t)+4*(13/200)^2/3) at hdis
  norm_num [Grothe.Lower.SparseEnvelope.cap] at hdis
  have hδ : 0 ≤ μ - t := sub_nonneg.mpr ht₁
  have hprod := mul_nonneg hδ (sub_nonneg.mpr hm₁)
  have hmin := mul_nonneg hδ (show 0 ≤ μ+t-(88622/100000+885868/1000000) by linarith only [hm₀,ht₀])
  nlinarith only [hdis, Real.pi_lt_d6, hs, hprod, hmin, ht₀, hm₁]

/-- For an aligned visible phase, its fifth-chaos norm and polynomial identity,
together with the tail cap on the same pair, close the whole upper endpoint. -/
private theorem high_ellipse_endpoint_of_phase_formula {n : ℕ} {f g : L2G (n+1)}
    (hf : f ∈ Unimod (stdGaussian ((n+1)+(n+1)))) (hg : g ∈ Unimod (stdGaussian ((n+1)+(n+1))))
    (ht : 885868 / 1000000 ≤ tOf (n+1) f g)
    (h5 : ‖(H32 (n+1)).starProjection (unitPhaseL (visibleDirection (n+1) f g))‖ ^ 2 = 3*π/256)
    (hproject : ⇑((H32 (n+1)).starProjection (unitPhaseL (visibleDirection (n+1) f g))) =ᵐ[stdGaussian ((n+1)+(n+1))]
      fun x => ((((√π/2)/16) * (‖visibleDirection (n+1) f g x‖^4 -
        6 * ‖visibleDirection (n+1) f g x‖^2 + 6) : ℝ) : ℂ) * visibleDirection (n+1) f g x)
    (hpay : quinticPayoff (n+1) (39/50) (779/10000) f g ≤
      1209/1250*(SparseEnvelope.cap : ℝ) + 41/1250*(tOf (n+1) f g^2 - ‖PkOf (n+1) f g‖^2) +
      611/13125*‖kOf (n+1) f g‖^2 + 779/10000*(‖(H32 (n+1)).starProjection (hOf (n+1) f g)‖^2 -
      ‖(H32 (n+1)).starProjection (kOf (n+1) f g)‖^2)) :
    quinticPayoff (n+1) (39/50) (779/10000) f g ≤ 10000/14023 - 1/100000 := by
  have htpos : 0 < tOf (n+1) f g := by linarith only [ht]
  have hs := visible_phase_stability hf hg htpos (r := 13/200) (by norm_num)
  let z := visibleDirection (n+1) f g
  have hm : (∫ x, ‖z x‖ ∂stdGaussian ((n+1)+(n+1))) = √π/2 := by
    obtain ⟨c,hc⟩ := (Submodule.mem_span_range_iff_exists_fun ℂ).1 (visibleDirection_mem (n+1) f g)
    change (∫ x, ‖visibleDirection (n+1) f g x‖ ∂_) = _
    rw [← hc, integral_norm_linL, hc, norm_visibleDirection_of_pos htpos, mul_one]
  have hc := quintic_center_cross (h := hOf (n+1) f g) (z := z) (norm_hOf_le (n+1) hf hg)
    (a := (√π/2)/16) (by positivity) hproject
  rw [hm,show (inner ℂ (hOf (n+1) f g) z).re = tOf (n+1) f g from re_inner_visibleDirection _ _ _] at hc
  have hp := quintic_projection_near_center (hOf (n+1) f g) (unitPhaseL z)
  dsimp only [z] at hc hp
  apply quintic_upper_endpoint_arithmetic ht (tOf_le_sqrt_pi (n+1) hf hg)
  linarith only [hpay,hs,hc,hp,h5,sq_nonneg ‖kOf (n+1) f g‖,sq_nonneg ‖PkOf (n+1) f g‖,
    sq_nonneg ‖(H32 (n+1)).starProjection (kOf (n+1) f g)‖]

/-- The production lower witness cap, together with the fifth-chaos projection of the
visible phase, removes the entire interval from `0.885868` to the maximum `√π/2`.
All sectors and both phase responses are unrestricted. -/
theorem quinticPayoff_le_visible_endpoint_885868_of_tailNodeCaps {n : ℕ} (hn : 1 ≤ n)
    (hcaps : TailNodeCaps (nuHat (47/2000))) {f g : L2G (n+1)}
    (hf : f ∈ Unimod (stdGaussian ((n+1)+(n+1)))) (hg : g ∈ Unimod (stdGaussian ((n+1)+(n+1))))
    (ht : 885868/1000000 ≤ tOf (n+1) f g) :
    quinticPayoff (n+1) (39/50) (779/10000) f g ≤ 10000/14023 - 1/100000 := by
  have hpos : 0 < tOf (n+1) f g := by linarith only [ht]
  have hu := norm_visibleDirection_of_pos hpos
  have hm := visibleDirection_mem (n+1) f g
  apply high_ellipse_endpoint_of_phase_formula hf hg ht
  · exact normSq_H32_unitPhaseL (Nat.succ_pos _) hm hu
  · filter_upwards [H32_unitPhaseL_ae (Nat.succ_pos _) hm hu] with x hx
    rw [hx]
    unfold visibleFifthPolynomial visMu
    push_cast; ring
  · apply quinticPayoff_le_of_tailWitnessCap _ hf hg
    exact witnessCap_of_circular_profile (@SparseStein.profile) hcaps (n+1) (by omega)

end
end Grothe.LowerAnalytic
