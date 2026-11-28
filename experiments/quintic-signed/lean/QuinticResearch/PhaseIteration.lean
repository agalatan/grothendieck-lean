import Grothe.LowerAnalytic.FibreSup

/-! # Stability of the original tail-coupled fibre potential

A measurable finite iteration approximates its two maximizing phases. The
spectral margin permits unequal field sizes, including fields below the tail
coefficient. Agent-ID: codex-a7c4
-/

set_option warningAsError true

namespace Grothe.LowerAnalytic
open MeasureTheory ProbabilityTheory Real Set Grothe.Lower
open scoped ComplexConjugate
noncomputable section

private theorem majEll_left (ν : ℝ) (f g A B : ℂ) :
    majEll ν f g A B = (conj f*(A+(ν:ℂ)*g)).re+(conj g*B).re := by
  simp only [majEll,Complex.add_re,Complex.mul_re,Complex.add_im,Complex.mul_im,Complex.conj_re,
    Complex.conj_im,Complex.ofReal_re,Complex.ofReal_im]
  ring

/-- The supremum defining the identity-tail potential is attained by a pair of phases. -/
theorem psiT_attains (ν : ℝ) (A B : ℂ) :
    ∃ f g : ℂ, ‖f‖=1 ∧ ‖g‖=1 ∧ majEll ν f g A B = psiT ν A B := by
  let S := Metric.sphere (0:ℂ) 1
  have hs : IsCompact S := isCompact_sphere _ _
  have hn : (1:ℂ) ∈ S := by simp [S]
  have hc : Continuous (fun x : ℂ × ℂ => majEll ν x.1 x.2 A B) := by unfold majEll; fun_prop
  obtain ⟨x,hx,hmax⟩ := (hs.prod hs).exists_isMaxOn ⟨(1,1),hn,hn⟩ hc.continuousOn
  have hf : ‖x.1‖ = 1 := by simpa [S,Metric.mem_sphere] using hx.1
  have hg : ‖x.2‖ = 1 := by simpa [S,Metric.mem_sphere] using hx.2
  refine ⟨x.1,x.2,hf,hg,le_antisymm (majEll_le_psiT ν hf hg A B) (psiT_le ?_)⟩
  intro f g hf' hg'
  apply (isMaxOn_iff.mp hmax) (f,g)
  exact ⟨by simpa [S,Metric.mem_sphere] using hf',by simpa [S,Metric.mem_sphere] using hg'⟩

private theorem optimal_field {ν : ℝ} {u v A B : ℂ} (hu : ‖u‖=1) (hv : ‖v‖=1)
    (eq : majEll ν u v A B = psiT ν A B) :
    (↑‖A+(ν:ℂ)*v‖:ℂ)*u = A+(ν:ℂ)*v := by
  let z := A+(ν:ℂ)*v
  obtain ⟨p,hp,hpz⟩ := exists_unit_re_conj_mul z
  have h := majEll_le_psiT ν hp hv A B
  rw [← eq,majEll_left,majEll_left] at h
  change (conj p*z).re+_ ≤ (conj u*z).re+_ at h
  have hz : (conj u*z).re = ‖z‖ := le_antisymm
    ((Complex.re_le_norm _).trans (by simp [hu])) (by linarith only [h,hpz])
  have hsq := @norm_sub_sq ℂ ℂ _ _ _ ((↑‖z‖:ℂ)*u) z
  rw [RCLike.inner_apply'] at hsq
  change ‖(↑‖z‖:ℂ)*u-z‖^2 = ‖(↑‖z‖:ℂ)*u‖^2-2*(conj ((↑‖z‖:ℂ)*u)*z).re+‖z‖^2 at hsq
  rw [map_mul,Complex.conj_ofReal,mul_assoc,Complex.re_ofReal_mul,hz,norm_mul,
    Complex.norm_real,Real.norm_eq_abs,abs_norm,hu,mul_one] at hsq
  change (↑‖z‖:ℂ)*u = z
  apply sub_eq_zero.mp
  apply norm_eq_zero.mp
  nlinarith only [hsq]

private theorem align_gap {u f : ℂ} (hu : ‖u‖=1) :
    2*(1-(conj f*u).re) = ‖f-u‖^2+1-‖f‖^2 := by
  have h := @norm_sub_sq ℂ ℂ _ _ _ f u
  rw [RCLike.inner_apply',hu] at h
  change ‖f-u‖^2 = ‖f‖^2-2*(conj f*u).re+1^2 at h
  linarith

/-- Exact loss at any physical response relative to a maximizing pair of the original coupled fibre potential. -/
theorem psiT_gap_identity {ν : ℝ} {u v A B : ℂ} (hu : ‖u‖=1) (hv : ‖v‖=1)
    (eq : majEll ν u v A B = psiT ν A B) (f g : ℂ) :
    2*(psiT ν A B-majEll ν f g A B) =
      ‖A+(ν:ℂ)*v‖*(‖f-u‖^2+1-‖f‖^2)+‖B+(ν:ℂ)*u‖*(‖g-v‖^2+1-‖g‖^2)
      -2*ν*(conj (f-u)*(g-v)).re := by
  have he := optimal_field hu hv eq
  have eq' := eq; rw [← majEll_swap,psiT_comm] at eq'
  have he' := optimal_field hv hu eq'
  rw [← eq,← align_gap hu,← align_gap hv]
  have cross (a b : ℂ) (r : ℝ) : (conj a*((r:ℂ)*b)).re=r*(conj a*b).re := by rw [mul_left_comm,Complex.re_ofReal_mul]
  have t1 := congrArg (fun z : ℂ => (conj f*z).re) he
  have t2 := congrArg (fun z : ℂ => (conj u*z).re) he
  have t3 := congrArg (fun z : ℂ => (conj g*z).re) he'
  have t4 := congrArg (fun z : ℂ => (conj v*z).re) he'
  simp only [mul_add,Complex.add_re,cross] at t1 t2 t3 t4
  have self (a : ℂ) (h : ‖a‖=1) : (conj a*a).re=1 := by rw [Complex.conj_mul',h]; norm_num
  rw [self u hu,mul_one] at t2
  rw [self v hv,mul_one] at t4
  simp only [majEll,map_sub,sub_mul,mul_sub,Complex.sub_re]
  have swap (a b : ℂ) : (conj a*b).re=(conj b*a).re := by simp [Complex.mul_re]; ring
  rw [swap g u] at t3
  rw [swap v u] at t4
  linarith only [t1,t2,t3,t4]

/-- Away from small test fields, the slack of the actual tail-coupled row controls the
squared distance to its maximizing pair, for every response in the closed bidisc. -/
theorem psiT_control_distance {ν : ℝ} {u v A B f g : ℂ} (hu : ‖u‖=1) (hv : ‖v‖=1)
    (eq : majEll ν u v A B = psiT ν A B) (hf : ‖f‖ ≤ 1) (hg : ‖g‖ ≤ 1) :
    (min ‖A‖ ‖B‖-2*|ν|)*(‖f-u‖^2+‖g-v‖^2) ≤ 2*(psiT ν A B-majEll ν f g A B) := by
  have field_lower (z p : ℂ) (hp : ‖p‖=1) : ‖z‖-|ν| ≤ ‖z+(ν:ℂ)*p‖ := by
    have h := norm_sub_le (z+(ν:ℂ)*p) ((ν:ℂ)*p)
    rw [add_sub_cancel_right,norm_mul,Complex.norm_real,Real.norm_eq_abs,hp,mul_one] at h
    linarith
  have f2 : ‖f‖^2 ≤ 1 := (pow_le_pow_left₀ (norm_nonneg _) hf 2).trans (by norm_num)
  have g2 : ‖g‖^2 ≤ 1 := (pow_le_pow_left₀ (norm_nonneg _) hg 2).trans (by norm_num)
  have a := mul_le_mul_of_nonneg_right (field_lower A v hv) (sq_nonneg ‖f-u‖)
  have b := mul_le_mul_of_nonneg_right (field_lower B u hu) (sq_nonneg ‖g-v‖)
  have c := mul_nonneg (norm_nonneg (A+(ν:ℂ)*v)) (sub_nonneg.mpr f2)
  have d := mul_nonneg (norm_nonneg (B+(ν:ℂ)*u)) (sub_nonneg.mpr g2)
  have cross : ν*(conj (f-u)*(g-v)).re ≤ |ν| *(‖f-u‖*‖g-v‖) := by
    calc
      _ ≤ |ν*(conj (f-u)*(g-v)).re| := le_abs_self _
      _ ≤ _ := by rw [abs_mul]; apply mul_le_mul_of_nonneg_left _ (abs_nonneg ν)
                  simpa only [norm_mul,Complex.norm_conj] using Complex.abs_re_le_norm (conj (f-u)*(g-v))
  have e := mul_nonneg (abs_nonneg ν) (sq_nonneg (‖f-u‖-‖g-v‖))
  have g1 := mul_le_mul_of_nonneg_right (min_le_left ‖A‖ ‖B‖) (sq_nonneg ‖f-u‖)
  have g2 := mul_le_mul_of_nonneg_right (min_le_right ‖A‖ ‖B‖) (sq_nonneg ‖g-v‖)
  rw [psiT_gap_identity hu hv eq]
  linarith only [a,b,c,d,cross,e,g1,g2]

/-- Thus a four-parameter physical response on a fibre always admits a maximizing
reference pair at the stated distance price. -/
theorem psiT_exists_near_optimum (ν : ℝ) (A B : ℂ) :
    ∃ u v : ℂ, ‖u‖=1 ∧ ‖v‖=1 ∧ majEll ν u v A B=psiT ν A B ∧
      ∀ f g : ℂ, ‖f‖ ≤ 1 → ‖g‖ ≤ 1 →
      (min ‖A‖ ‖B‖-2*|ν|)*(‖f-u‖^2+‖g-v‖^2) ≤ 2*(psiT ν A B-majEll ν f g A B) := by
  obtain ⟨u,v,hu,hv,hv'⟩ := psiT_attains ν A B
  exact ⟨u,v,hu,hv,hv',fun _ _ hf hg => psiT_control_distance hu hv hv' hf hg⟩

/-- The normalized response is a phase, including at the origin. -/
private lemma phase_unit (z : ℂ) : ‖ph z‖ = 1 := by
  by_cases hz : z = 0
  · simp [ph,hz]
  · rw [ph,ite_eq_right hz,norm_div,Complex.norm_real,Real.norm_eq_abs,abs_norm,
      div_self (norm_ne_zero_iff.2 hz)]

private lemma scaled_phase (z : ℂ) : (‖z‖:ℂ)*ph z=z := by
  by_cases hz : z=0
  · simp [hz]
  have hh : (‖z‖:ℂ) ≠ 0 := by exact_mod_cast norm_ne_zero_iff.2 hz
  rw [ph,ite_eq_right hz]
  field_simp

private lemma phase_annulus {x y : ℂ} {r : ℝ} (hr : 0 ≤ r) (hx : r ≤ ‖x‖) (hy : r ≤ ‖y‖) :
    r*‖ph x-ph y‖ ≤ ‖x-y‖ := by
  have h := @norm_sub_sq ℂ ℂ _ _ _ x y
  have hp := @norm_sub_sq ℂ ℂ _ _ _ (ph x) (ph y)
  rw [RCLike.inner_apply'] at h hp
  rw [phase_unit,phase_unit] at hp
  have hxy : (conj x*y).re = ‖x‖*‖y‖*(conj (ph x)*ph y).re := by
    calc
      _ = (conj ((‖x‖:ℂ)*ph x)*((‖y‖:ℂ)*ph y)).re := by rw [scaled_phase,scaled_phase]
      _ = _ := by
        rw [map_mul,Complex.conj_ofReal,show (‖x‖:ℂ)*conj (ph x)*((‖y‖:ℂ)*ph y) =
          (‖x‖:ℂ)*((‖y‖:ℂ)*(conj (ph x)*ph y)) by ring,Complex.re_ofReal_mul,Complex.re_ofReal_mul]
        ring
  change ‖x-y‖^2 = ‖x‖^2-2*(conj x*y).re+‖y‖^2 at h
  change ‖ph x-ph y‖^2 = 1^2-2*(conj (ph x)*ph y).re+1^2 at hp
  rw [hxy] at h
  have h_id : ‖x-y‖^2 = (‖x‖-‖y‖)^2+‖x‖*‖y‖*‖ph x-ph y‖^2 := by
    rw [h,hp]
    ring
  have hm := mul_le_mul_of_nonneg_right (mul_le_mul hx hy hr (norm_nonneg _)) (sq_nonneg ‖ph x-ph y‖)
  apply (sq_le_sq₀ (mul_nonneg hr (norm_nonneg _)) (norm_nonneg _)).mp
  nlinarith only [hm,h_id,sq_nonneg (‖x‖-‖y‖)]

private lemma field_radius {ν L : ℝ} {A u : ℂ} (hA : L ≤ ‖A‖) (hu : ‖u‖=1) :
    L-|ν| ≤ ‖A+(ν:ℂ)*u‖ := by
  have h := norm_sub_le (A+(ν:ℂ)*u) ((ν:ℂ)*u)
  rw [add_sub_cancel_right,norm_mul,Complex.norm_real,Real.norm_eq_abs,hu,mul_one] at h
  linarith

private lemma response_contract {ν L : ℝ} {A u v : ℂ} (hL : |ν| < L) (hA : L ≤ ‖A‖)
    (hu : ‖u‖=1) (hv : ‖v‖=1) :
    ‖ph (A+(ν:ℂ)*u)-ph (A+(ν:ℂ)*v)‖ ≤ |ν|/(L-|ν|)*‖u-v‖ := by
  have h := phase_annulus (sub_pos.mpr hL).le (field_radius hA hu) (field_radius hA hv)
  rw [show A+(ν:ℂ)*u-(A+(ν:ℂ)*v)=(ν:ℂ)*(u-v) by ring,norm_mul,Complex.norm_real,Real.norm_eq_abs] at h
  rw [div_mul_eq_mul_div]
  apply (le_div_iff₀ (sub_pos.mpr hL)).mpr
  simpa only [mul_comm] using h

/-- A finite approximation to the maximizing phases with an explicit deterministic initial pair. -/
def phaseIterate (ν : ℝ) (A B : ℂ) : ℕ → ℂ × ℂ
  | 0 => (1,1)
  | n+1 => let p := phaseIterate ν A B n; (ph (A+(ν:ℂ)*p.2),ph (B+(ν:ℂ)*p.1))

theorem measurable_phaseIterate {Ω : Type*} [MeasurableSpace Ω] {A B : Ω → ℂ}
    (hA : Measurable A) (hB : Measurable B) (ν : ℝ) (n : ℕ) :
    Measurable (fun z ↦ (phaseIterate ν (A z) (B z) n).1) ∧
    Measurable (fun z ↦ (phaseIterate ν (A z) (B z) n).2) := by
  induction n with
  | zero => exact ⟨measurable_const,measurable_const⟩
  | succ n ih =>
    exact ⟨measurable_ph.comp (hA.add (measurable_const.mul ih.2)),
      measurable_ph.comp (hB.add (measurable_const.mul ih.1))⟩

private lemma phaseIterate_unit (ν : ℝ) (A B : ℂ) (n : ℕ) :
    ‖(phaseIterate ν A B n).1‖=1 ∧ ‖(phaseIterate ν A B n).2‖=1 := by
  cases n with
  | zero => simp [phaseIterate]
  | succ n => exact ⟨phase_unit _,phase_unit _⟩

private lemma fixed_field {ν L : ℝ} {A B u v : ℂ} (hL : |ν| < L) (hA : L ≤ ‖A‖)
    (hu : ‖u‖=1) (hv : ‖v‖=1) (eq : majEll ν u v A B=psiT ν A B) :
    ph (A+(ν:ℂ)*v)=u := by
  have hn : 0 < ‖A+(ν:ℂ)*v‖ := lt_of_lt_of_le (sub_pos.mpr hL) (field_radius hA hv)
  have hz : A+(ν:ℂ)*v ≠ 0 := norm_ne_zero_iff.mp hn.ne'
  have hR : (‖A+(ν:ℂ)*v‖:ℂ) ≠ 0 := by exact_mod_cast hn.ne'
  rw [ph,ite_eq_right hz,div_eq_iff hR]
  rw [mul_comm u (‖A+(ν:ℂ)*v‖:ℂ)]
  exact (optimal_field hu hv eq).symm

theorem phaseIterate_error {ν L : ℝ} {A B u v : ℂ} (hL : 2*|ν| < L)
    (hA : L ≤ ‖A‖) (hB : L ≤ ‖B‖) (hu : ‖u‖=1) (hv : ‖v‖=1)
    (eq : majEll ν u v A B=psiT ν A B) (n : ℕ) :
    ‖(phaseIterate ν A B n).1-u‖ ≤ 2*(|ν|/(L-|ν|))^n ∧
    ‖(phaseIterate ν A B n).2-v‖ ≤ 2*(|ν|/(L-|ν|))^n := by
  have hL' : |ν| < L := by linarith [abs_nonneg ν]
  have hq := div_nonneg (abs_nonneg ν) (sub_pos.mpr hL').le
  have hA' := fixed_field hL' hA hu hv eq
  have eq' := eq; rw [← majEll_swap,psiT_comm] at eq'
  have hB' := fixed_field hL' hB hv hu eq'
  induction n with
  | zero =>
    constructor
    · simpa [phaseIterate,hu,one_add_one_eq_two] using norm_sub_le (1:ℂ) u
    · simpa [phaseIterate,hv,one_add_one_eq_two] using norm_sub_le (1:ℂ) v
  | succ n ih =>
    obtain ⟨hu',hv'⟩ := phaseIterate_unit ν A B n
    rcases ih with ⟨i,j⟩
    constructor
    · change ‖ph (A+(ν:ℂ)*(phaseIterate ν A B n).2)-u‖ ≤ _
      rw [← hA']
      calc
        _ ≤ _ := response_contract hL' hA hv' hv
        _ ≤ _ := mul_le_mul_of_nonneg_left j hq
        _ = _ := by ring
    · change ‖ph (B+(ν:ℂ)*(phaseIterate ν A B n).1)-v‖ ≤ _
      rw [← hB']
      calc
        _ ≤ _ := response_contract hL' hB hu' hu
        _ ≤ _ := mul_le_mul_of_nonneg_left i hq
        _ = _ := by ring

/-- Loss of the original tail-coupled row controls the distance to an explicitly
measurable finite phase template. The estimate holds on each fibre with a
positive field margin, without choosing any maximizing phases measurably. -/
theorem psiT_controls_phaseIterate {ν L : ℝ} {A B f g : ℂ} (hL : 2*|ν| < L)
    (hA : L ≤ ‖A‖) (hB : L ≤ ‖B‖) (hf : ‖f‖ ≤ 1) (hg : ‖g‖ ≤ 1) (n : ℕ) :
    ‖f-(phaseIterate ν A B n).1‖^2+‖g-(phaseIterate ν A B n).2‖^2 ≤
    4*(psiT ν A B-majEll ν f g A B)/(L-2*|ν|)+16*((|ν|/(L-|ν|))^n)^2 := by
  obtain ⟨u,v,hu,hv,hmax⟩ := psiT_attains ν A B
  obtain ⟨iu,iv⟩ := phaseIterate_error hL hA hB hu hv hmax n
  have gap := psiT_control_distance hu hv hmax hf hg
  let c := L-2*|ν|
  have hc : 0 < c := sub_pos.mpr hL
  have low : c*(‖f-u‖^2+‖g-v‖^2) ≤ 2*(psiT ν A B-majEll ν f g A B) :=
    (mul_le_mul_of_nonneg_right (sub_le_sub_right (le_min hA hB) _) (by positivity)).trans gap
  have hdist : ‖f-u‖^2+‖g-v‖^2 ≤ 2*(psiT ν A B-majEll ν f g A B)/c :=
    (le_div_iff₀ hc).mpr (by simpa only [mul_comm] using low)
  have tri (a b p : ℂ) : ‖a-p‖^2 ≤ 2*‖a-b‖^2+2*‖p-b‖^2 := by
    have H := norm_sub_le_norm_sub_add_norm_sub a b p
    rw [norm_sub_rev b p] at H
    have hs := pow_le_pow_left₀ (norm_nonneg _) H 2
    nlinarith only [hs,sq_nonneg (‖a-b‖-‖p-b‖)]
  have h1 := tri f u (phaseIterate ν A B n).1
  have h2 := tri g v (phaseIterate ν A B n).2
  have h3 := pow_le_pow_left₀ (norm_nonneg _) iu 2
  have h4 := pow_le_pow_left₀ (norm_nonneg _) iv 2
  change _ ≤ 4*(psiT ν A B-majEll ν f g A B)/c+_
  calc
    _ ≤ 2*(‖f-u‖^2+‖g-v‖^2)+4*(2*(|ν|/(L-|ν|))^n)^2 := by linarith only [h1,h2,h3,h4]
    _ ≤ 2*(2*(psiT ν A B-majEll ν f g A B)/c)+4*(2*(|ν|/(L-|ν|))^n)^2 := by gcongr
    _ = _ := by ring

/-- Integrated stability of the explicit coupled phase iteration. The measure
of small fields is the only uncontrolled part of the fibre space. -/
theorem psiT_integral_controls_phaseIterate {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω)
    [IsProbabilityMeasure μ] {ν L : ℝ} (hL : 2*|ν| < L) {A B f g : Ω → ℂ}
    (hA : Measurable A) (hB : Measurable B) (hf : Measurable f) (hg : Measurable g)
    (hfb : ∀ᵐ z ∂μ, ‖f z‖ ≤ 1) (hgb : ∀ᵐ z ∂μ, ‖g z‖ ≤ 1)
    (hE : Integrable (fun z ↦ psiT ν (A z) (B z)-majEll ν (f z) (g z) (A z) (B z)) μ) (n : ℕ) :
    ∫ z, ‖f z-(phaseIterate ν (A z) (B z) n).1‖^2+‖g z-(phaseIterate ν (A z) (B z) n).2‖^2 ∂μ ≤
      8*μ.real {z | min ‖A z‖ ‖B z‖ < L} +
      (4/(L-2*|ν|))*(∫ z, psiT ν (A z) (B z)-majEll ν (f z) (g z) (A z) (B z) ∂μ) +
      16*((|ν|/(L-|ν|))^n)^2 := by
  let bad := {z | min ‖A z‖ ‖B z‖ < L}
  have hb : MeasurableSet bad := measurableSet_lt (hA.norm.min hB.norm) measurable_const
  let D := fun z ↦ ‖f z-(phaseIterate ν (A z) (B z) n).1‖^2+‖g z-(phaseIterate ν (A z) (B z) n).2‖^2
  let E := fun z ↦ psiT ν (A z) (B z)-majEll ν (f z) (g z) (A z) (B z)
  let c := 4/(L-2*|ν|)
  let rem := 16*((|ν|/(L-|ν|))^n)^2
  have hr : 0 ≤ rem := by dsimp [rem]; positivity
  have hc : 0 ≤ c := div_nonneg (by norm_num) (sub_pos.mpr hL).le
  have hme := measurable_phaseIterate hA hB ν n
  have hDme : Measurable D := ((hf.sub hme.1).norm.pow_const 2).add ((hg.sub hme.2).norm.pow_const 2)
  have dist (a b : ℂ) (ha : ‖a‖≤1) (hb : ‖b‖=1) : ‖a-b‖^2 ≤ 4 := by
    have h := norm_sub_le a b
    rw [hb] at h
    have ha' : ‖a-b‖ ≤ 2 := by linarith
    exact (pow_le_pow_left₀ (norm_nonneg _) ha' 2).trans_eq (by norm_num)
  have Dbound : ∀ᵐ z ∂μ, D z ≤ 8 := by
    filter_upwards [hfb,hgb] with z hz hz'
    obtain ⟨ha,hb'⟩ := phaseIterate_unit ν (A z) (B z) n
    exact (add_le_add (dist _ _ hz ha) (dist _ _ hz' hb')).trans_eq (by norm_num)
  have integrD : Integrable D μ := (integrable_const (8:ℝ)).mono' hDme.aestronglyMeasurable (by
    filter_upwards [Dbound] with z hz
    rw [Real.norm_eq_abs,abs_of_nonneg (show 0 ≤ D z by dsimp [D]; positivity)]
    exact hz)
  have I := (integrable_const (8:ℝ)).indicator hb (μ := μ)
  have j : Integrable (fun z ↦ c*E z) μ := hE.const_mul c
  have comparison : ∀ᵐ z ∂μ, D z ≤ bad.indicator (fun _ : Ω ↦ (8:ℝ)) z + c*E z + rem := by
    filter_upwards [hfb,hgb,Dbound] with z hz hz' hzD
    by_cases hbad : z ∈ bad
    · rw [Set.indicator_of_mem hbad]
      have h₀ : 0 ≤ E z := sub_nonneg.mpr (majEll_le_psiT_of_le ν hz hz' _ _)
      linarith only [hzD,mul_nonneg hc h₀,hr]
    · rw [Set.indicator_of_notMem hbad,zero_add]
      have hgood : L ≤ min ‖A z‖ ‖B z‖ := le_of_not_gt hbad
      have hh := psiT_controls_phaseIterate hL (le_min_iff.mp hgood).1 (le_min_iff.mp hgood).2 hz hz' n
      simpa only [D,c,E,rem,div_mul_eq_mul_div] using hh
  have endb := integral_mono_ae integrD ((I.add j).add (integrable_const rem)) comparison
  simp only [Pi.add_apply] at endb
  have jj : Integrable (fun z ↦ bad.indicator (fun _ : Ω ↦ (8:ℝ)) z + c*E z) μ := I.add j
  rw [integral_add jj (integrable_const rem),integral_add I j,
    integral_indicator hb, setIntegral_const,integral_const_mul,integral_const,
    probReal_univ,one_smul] at endb
  simpa only [smul_eq_mul,mul_comm (μ.real bad) 8] using endb

private lemma annular_field {ν : ℝ} (A u : ℂ) (hu : ‖u‖=1) :
    abs (‖A‖-|ν|) ≤ ‖A+(ν:ℂ)*u‖ := by
  have h := abs_norm_sub_norm_le A (-((ν:ℂ)*u))
  simpa only [sub_neg_eq_add,norm_neg,norm_mul,Complex.norm_real,Real.norm_eq_abs,hu,mul_one] using h

/-- A positive spectral margin of the two response fields controls the full
pair. Each field is allowed to be smaller than the absolute tail coupling. -/
theorem psiT_anisotropic_margin {ν a b γ : ℝ} {A B u v f g : ℂ}
    (hu : ‖u‖=1) (hv : ‖v‖=1) (eq : majEll ν u v A B=psiT ν A B)
    (hf : ‖f‖≤1) (hg : ‖g‖≤1) (hA : a ≤ abs (‖A‖-|ν|)) (hB : b ≤ abs (‖B‖-|ν|))
    (ha : γ < a) (hdet : ν^2 ≤ (a-γ)*(b-γ)) :
    γ*(‖f-u‖^2+‖g-v‖^2) ≤ 2*(psiT ν A B-majEll ν f g A B) := by
  have h1 := mul_le_mul_of_nonneg_right (hA.trans (annular_field A v hv)) (sq_nonneg ‖f-u‖)
  have h2 := mul_le_mul_of_nonneg_right (hB.trans (annular_field B u hu)) (sq_nonneg ‖g-v‖)
  have h3 := mul_nonneg (norm_nonneg (A+(ν:ℂ)*v)) (show 0 ≤ 1-‖f‖^2 by
    nlinarith only [pow_le_pow_left₀ (norm_nonneg _) hf 2])
  have h4 := mul_nonneg (norm_nonneg (B+(ν:ℂ)*u)) (show 0 ≤ 1-‖g‖^2 by
    nlinarith only [pow_le_pow_left₀ (norm_nonneg _) hg 2])
  have h5 : ν*(conj (f-u)*(g-v)).re ≤ |ν| *(‖f-u‖*‖g-v‖) := by
    calc
      _ ≤ |ν*(conj (f-u)*(g-v)).re| := le_abs_self _
      _ ≤ _ := by
        rw [abs_mul]; apply mul_le_mul_of_nonneg_left _ (abs_nonneg _)
        simpa only [norm_mul,Complex.norm_conj] using Complex.abs_re_le_norm (conj (f-u)*(g-v))
  have h6 : 0 ≤ (a-γ)*‖f-u‖^2+(b-γ)*‖g-v‖^2-2*|ν| *‖f-u‖*‖g-v‖ := by
    apply nonneg_of_mul_nonneg_right _ (sub_pos.mpr ha)
    have dd := mul_nonneg (sub_nonneg.mpr hdet) (sq_nonneg ‖g-v‖)
    nlinarith only [dd,sq_abs ν,sq_nonneg ((a-γ)*‖f-u‖-|ν| *‖g-v‖),
      congrArg (fun y : ℝ ↦ y*‖g-v‖^2) (sq_abs ν)]
  rw [psiT_gap_identity hu hv eq]
  linarith only [h1,h2,h3,h4,h5,h6]

end
end Grothe.LowerAnalytic
