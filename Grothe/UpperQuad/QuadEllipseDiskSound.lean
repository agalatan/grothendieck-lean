import Grothe.UpperQuad.QuadEllipseSound

/-!
# Soundness of the ellipse checker, part 2: one disk

`diskM2_sound`: if the checker accepts the disk `D(x, R)` with the sign `pos` and returns `r`, then
the profile keeps the sign `ε = ±1` on the disk (`devR x R < ε t₀(x)`) and the extended integrand
vector satisfies `‖FextV ε z‖² ≤ B` on the disk for a real `B ∈ r`.

Agent-ID: claude-b9ee. Refs #303.
-/

namespace Grothe.UpperQuad.EllCheck

open GrotheQuad Grothe.UpperQuad Grothe.UpperChaos Grothe.UpperQuad.QuadRem
open Grothe.UpperQuad.TaylorShift

/-- The panel sign as a real. -/
def sgn (pos : Bool) : ℝ := if pos then 1 else -1

lemma sgn_cases (pos : Bool) : sgn pos = 1 ∨ sgn pos = -1 := by
  unfold sgn; split_ifs <;> simp

/-- `π^{1/4}`. -/
noncomputable def q4 : ℝ := Real.sqrt (Real.sqrt Real.pi)

lemma q4_pos : 0 < q4 := Real.sqrt_pos.mpr (Real.sqrt_pos.mpr Real.pi_pos)

lemma q4_sq : q4 ^ 2 = Real.sqrt Real.pi := Real.sq_sqrt (Real.sqrt_nonneg _)

lemma mem_sqrtPiE : mem (Real.sqrt Real.pi) sqrtPiE :=
  mem_sqrtI P Real.pi_pos.le (mem_piMachinI P hP _)

lemma kappa_sq : kappa ^ 2 = 1 + (Grothe.Upper.aQ : ℝ) ^ 2 := by
  unfold kappa; rw [Real.sq_sqrt (by positivity)]

lemma mem_kappa2 : mem (kappa ^ 2) kappa2 := by
  unfold kappa2
  rw [kappa_sq]
  have := mem_addI P (mem_one P) (mem_sqI P (mem_qI Grothe.Upper.aQ))
  convert this using 1; ring

/-- The profile step of the disk check. -/
lemma diskProfile_sound (hc : chatOK = true) {pos : Bool} {x R : ℚ} (hR : 0 ≤ (R : ℝ))
    {at0 e : Ival} (h : diskProfile pos x R = some (at0, e)) :
    ∃ T Dv, mem T at0 ∧ mem Dv e ∧ T = q4 * (sgn pos * tcoef 0 x) ∧
      q4 * devR x R ≤ Dv ∧ 0 < T - Dv ∧ devR x R < sgn pos * tcoef 0 x := by
  unfold diskProfile at h
  simp only [Option.ite_none_right_eq_some, Option.some.injEq, Prod.mk.injEq] at h
  obtain ⟨⟨-, hpos⟩, rfl, rfl⟩ := h
  have ht := mem_taylorI hc (mem_qI x) 0
  obtain ⟨Dv, hDv, hle⟩ := devI_sound hc (mem_qI x) (mem_qI R) hR
  have hT : mem (q4 * (sgn pos * tcoef 0 x))
      (if pos then taylorI (qI x) 0 else negI (taylorI (qI x) 0)) := by
    unfold sgn q4
    cases pos
    · simp only [Bool.false_eq_true, ite_false]
      have := mem_negI ht; convert this using 1; ring
    · simp only [ite_true]; convert ht using 1; ring
  have hsub := pos_of_isPos hpos (mem_subI P hT hDv)
  refine ⟨_, Dv, hT, hDv, rfl, hle, hsub, ?_⟩
  have hle' : q4 * devR x R ≤ Dv := hle
  exact lt_of_mul_lt_mul_left (by linarith) q4_pos.le

/-- The profile data of an accepted disk, as reals. -/
structure ProfileFacts (pos : Bool) (x R : ℚ) (at0 e : Ival) (T Dv : ℝ) : Prop where
  hT : mem T at0
  hD : mem Dv e
  hTeq : T = q4 * (sgn pos * tcoef 0 x)
  hDle : q4 * devR x R ≤ Dv
  hgap : 0 < T - Dv
  hsgn : devR x R < sgn pos * tcoef 0 x

lemma ProfileFacts.dev_nonneg {pos : Bool} {x R : ℚ} {at0 e : Ival} {T Dv : ℝ}
    (hR : 0 ≤ (R : ℝ)) (_h : ProfileFacts pos x R at0 e T Dv) : 0 ≤ devR x R := by
  unfold devR
  exact Finset.sum_nonneg fun k _ => mul_nonneg (abs_nonneg _) (pow_nonneg hR _)

lemma ProfileFacts.mk' (hc : chatOK = true) {pos : Bool} {x R : ℚ} (hR : 0 ≤ (R : ℝ))
    {at0 e : Ival} (h : diskProfile pos x R = some (at0, e)) :
    ∃ T Dv, ProfileFacts pos x R at0 e T Dv := by
  obtain ⟨T, Dv, h1, h2, h3, h4, h5, h6⟩ := diskProfile_sound hc hR h
  exact ⟨T, Dv, ⟨h1, h2, h3, h4, h5, h6⟩⟩

lemma rat_abs_add (x R : ℚ) : (((|x| + R : ℚ)) : ℝ) = |(x : ℝ)| + R := by push_cast; rfl

lemma rat_max_sub (x R : ℚ) : (((max 0 (|x| - R) : ℚ)) : ℝ) = max 0 (|(x : ℝ)| - R) := by
  push_cast; rfl

/-- The upper bound of `|A|²`. -/
lemma a2hiI_sound {pos : Bool} {x R : ℚ} (hR : 0 ≤ (R : ℝ)) {at0 e : Ival} {T Dv : ℝ}
    (hf : ProfileFacts pos x R at0 e T Dv) {a : Ival} (h : a2hiI x R at0 e = some a) :
    ∃ Ahi, mem Ahi a ∧
      (|(x : ℝ)| + R) / (kappa ^ 2 * (sgn pos * tcoef 0 x - devR x R) ^ 2) ≤ Ahi := by
  unfold a2hiI at h
  have hnum := mem_mulI P (mem_qI (|x| + R)) mem_sqrtPiE
  have hden := mem_mulI P mem_kappa2 (mem_sqI P (mem_subI P hf.hT hf.hD))
  obtain ⟨hm, hpos⟩ := mem_dv hnum hden h
  refine ⟨_, hm, ?_⟩
  rw [rat_abs_add]
  have hk := kappa_pos
  have hq := q4_pos
  have hgap := hf.hgap
  have hv : 0 < sgn pos * tcoef 0 x - devR x R := by linarith [hf.hsgn]
  have hle : T - Dv ≤ q4 * (sgn pos * tcoef 0 x - devR x R) := by
    rw [hf.hTeq]; nlinarith [hf.hDle]
  have hsq : (T - Dv) * (T - Dv) ≤ Real.sqrt Real.pi * (sgn pos * tcoef 0 x - devR x R) ^ 2 := by
    rw [← q4_sq]; nlinarith
  have hx : 0 ≤ |(x : ℝ)| + R := by positivity
  rw [div_le_div_iff₀ (by positivity) hpos]
  have hπ : 0 < Real.sqrt Real.pi := Real.sqrt_pos.mpr Real.pi_pos
  calc (|(x : ℝ)| + R) * (kappa ^ 2 * ((T - Dv) * (T - Dv)))
      ≤ (|(x : ℝ)| + R) *
          (kappa ^ 2 * (Real.sqrt Real.pi * (sgn pos * tcoef 0 x - devR x R) ^ 2)) :=
        mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_left hsq (by positivity)) hx
    _ = (|(x : ℝ)| + R) * Real.sqrt Real.pi *
          (kappa ^ 2 * (sgn pos * tcoef 0 x - devR x R) ^ 2) := by
        ring

/-- The lower bound of `|A|²`. -/
lemma a2loI_sound {pos : Bool} {x R : ℚ} (hR : 0 ≤ (R : ℝ)) {at0 e : Ival} {T Dv : ℝ}
    (hf : ProfileFacts pos x R at0 e T Dv) {a : Ival} (h : a2loI x R at0 e = some a) :
    ∃ Alo, mem Alo a ∧
      Alo ≤ max 0 (|(x : ℝ)| - R) / (kappa ^ 2 * (sgn pos * tcoef 0 x + devR x R) ^ 2) := by
  unfold a2loI at h
  have hnum := mem_mulI P (mem_qI (max 0 (|x| - R))) mem_sqrtPiE
  have hden := mem_mulI P mem_kappa2 (mem_sqI P (mem_addI P hf.hT hf.hD))
  obtain ⟨hm, hpos⟩ := mem_dv hnum hden h
  rw [rat_max_sub] at hm
  have hk := kappa_pos
  have hq := q4_pos
  have hd0 := hf.dev_nonneg hR
  have hgap := hf.hgap
  have hT0 : 0 < T := by have := hf.hDle; nlinarith [mul_nonneg hq.le hd0]
  have hv : 0 < sgn pos * tcoef 0 x + devR x R := by linarith [hf.hsgn]
  have hge : q4 * (sgn pos * tcoef 0 x + devR x R) ≤ T + Dv := by
    rw [hf.hTeq]; nlinarith [hf.hDle]
  have hsq : Real.sqrt Real.pi * (sgn pos * tcoef 0 x + devR x R) ^ 2 ≤ (T + Dv) * (T + Dv) := by
    rw [← q4_sq, show q4 ^ 2 * (sgn pos * tcoef 0 x + devR x R) ^ 2 =
      (q4 * (sgn pos * tcoef 0 x + devR x R)) * (q4 * (sgn pos * tcoef 0 x + devR x R)) by ring]
    exact mul_self_le_mul_self (mul_nonneg hq.le hv.le) hge
  have hπ : 0 < Real.sqrt Real.pi := Real.sqrt_pos.mpr Real.pi_pos
  have hm0 : 0 ≤ max 0 (|(x : ℝ)| - R) := le_max_left _ _
  refine ⟨_, hm, ?_⟩
  · rw [div_le_div_iff₀ hpos (by positivity)]
    calc max 0 (|(x : ℝ)| - R) * Real.sqrt Real.pi *
          (kappa ^ 2 * (sgn pos * tcoef 0 x + devR x R) ^ 2)
        = max 0 (|(x : ℝ)| - R) * (kappa ^ 2 * (Real.sqrt Real.pi *
            (sgn pos * tcoef 0 x + devR x R) ^ 2)) := by ring
      _ ≤ max 0 (|(x : ℝ)| - R) * (kappa ^ 2 * ((T + Dv) * (T + Dv))) :=
        mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_left hsq (by positivity)) hm0

lemma guard'_bind {α : Type} {b : Bool} {f : Unit → Option α} {r : α}
    (h : (guard' b).bind f = some r) : b = true ∧ f () = some r := by
  unfold guard' at h
  split_ifs at h with hb
  · exact ⟨hb, h⟩
  · simp at h

/-- The defect function is monotone in the relative deviation. -/
lemma defect_mono {a r r' : ℝ} (ha : 0 ≤ a) (hr : 0 ≤ r) (hrr : r ≤ r') (hr1 : r' < 1) :
    (a + r * (2 + r)) / (1 - r) ^ 2 ≤ (a + r' * (2 + r')) / (1 - r') ^ 2 := by
  have h1 : 0 < 1 - r' := by linarith
  have h2 : (1 - r') ^ 2 ≤ (1 - r) ^ 2 := pow_le_pow_left₀ h1.le (by linarith) 2
  calc (a + r * (2 + r)) / (1 - r) ^ 2 ≤ (a + r' * (2 + r')) / (1 - r) ^ 2 :=
        div_le_div_of_nonneg_right (by nlinarith) (sq_nonneg _)
    _ ≤ (a + r' * (2 + r')) / (1 - r') ^ 2 :=
        div_le_div_of_nonneg_left (by nlinarith) (pow_pos h1 2) h2

/-- The defect step. -/
lemma defectI_sound {pos : Bool} {x R : ℚ} (hR : 0 ≤ (R : ℝ)) {at0 e : Ival} {T Dv : ℝ}
    (hf : ProfileFacts pos x R at0 e T Dv) {kp : Ival} (h : defectI x R at0 e = some kp) :
    (R : ℝ) < x ∧ ∃ KP, mem KP kp ∧ DiskPoint.kp (sgn pos) x R ≤ KP ∧ KP < 1 ∧ 0 ≤ KP := by
  unfold defectI at h
  obtain ⟨hxR, h⟩ := guard'_bind h
  have hxR' : (R : ℝ) < x := by exact_mod_cast of_decide_eq_true hxR
  refine ⟨hxR', ?_⟩
  simp only [Option.bind_eq_bind, Option.bind_eq_some_iff] at h
  obtain ⟨r2, hr2, u1, hom, kp', hkp', u2, hlt, h⟩ := h
  have hom := guard'_eq hom
  have hlt := guard'_eq hlt
  simp only [Option.pure_def, Option.some.injEq] at h
  subst h
  obtain ⟨hr2m, hT⟩ := mem_dv hf.hD hf.hT hr2
  have hommem := mem_subI P (mem_one P) hr2m
  have hom' := pos_of_isPos hom hommem
  have hrx := mem_qI (R / x)
  have hkm := mem_dv (mem_addI P hrx (mem_mulI P hr2m (mem_addI P (mem_ofInt P 2) hr2m)))
    (mem_sqI P hommem) hkp'
  obtain ⟨hkm, -⟩ := hkm
  set KP := (((R / x : ℚ) : ℝ) + Dv / T * (((2 : ℤ) : ℝ) + Dv / T)) /
    ((1 - Dv / T) * (1 - Dv / T)) with hKP
  refine ⟨KP, hkm, ?_, ?_, ?_⟩
  · -- `dev/(ε t₀) ≤ Dv/T`
    have hq := q4_pos
    have hd0 := hf.dev_nonneg hR
    have he : 0 < sgn pos * tcoef 0 x := lt_of_le_of_lt hd0 hf.hsgn
    have hρ : devR x R / (sgn pos * tcoef 0 x) ≤ Dv / T := by
      rw [hf.hTeq, div_le_div_iff₀ he (by positivity)]
      nlinarith [hf.hDle]
    have hx0 : (0 : ℝ) < x := lt_of_le_of_lt hR hxR'
    unfold DiskPoint.kp
    have := defect_mono (div_nonneg hR hx0.le) (div_nonneg hd0 he.le) hρ (by linarith)
    rw [hKP]
    push_cast
    convert this using 2; ring
  · have := pos_of_isPos hlt (mem_subI P (mem_one P) hkm)
    linarith
  · have hd0 : 0 ≤ Dv := le_trans (mul_nonneg q4_pos.le (hf.dev_nonneg hR)) hf.hDle
    have hx0 : (0 : ℝ) < x := lt_of_le_of_lt hR hxR'
    rw [hKP]
    apply div_nonneg _ (mul_self_nonneg _)
    push_cast
    have h1 : 0 ≤ (R : ℝ) / x := div_nonneg hR hx0.le
    have h2 : 0 ≤ Dv / T := div_nonneg hd0 hT.le
    exact add_nonneg h1 (mul_nonneg h2 (by linarith))

lemma mem_deltaI : mem ((2 : ℝ) ^ (-40 : ℤ)) deltaI := by
  unfold deltaI mem; simp

/-- The off-axis step. -/
lemma upsYI_sound {b2I u : Ival} (h : upsYI b2I = some u) :
    ∃ U, mem U u ∧
      (∑' r, shiftTerm 501 (Real.sqrt (bval b2I) + (2 : ℝ) ^ (-40 : ℤ)) r) ^ 2 ≤ U := by
  unfold upsYI at h
  obtain ⟨-, h⟩ := guard'_bind h
  simp only [Option.bind_eq_bind, Option.bind_eq_some_iff] at h
  obtain ⟨y, hy, h⟩ := h
  simp only [Option.pure_def, Option.some.injEq] at h
  subst h
  set t := Real.sqrt (bval b2I) + (2 : ℝ) ^ (-40 : ℤ) with ht
  have ht0 : 0 ≤ t := by positivity
  have htI : mem t (addI P (sqrtI P (absUpper b2I)) deltaI) :=
    mem_addI P (mem_sqrtI P (bval_nonneg _) (mem_absUpper _)) mem_deltaI
  have h0 : mem (shiftTerm 501 t 0) (ofInt P 1) := by
    unfold shiftTerm raiseProd; simpa using mem_one P
  have hacc : mem (∑ i ∈ Finset.range 0, shiftTerm 501 t i) zeroI := by
    simpa using (mem_zeroI_iff 0).2 rfl
  obtain ⟨Y, hYm, hY⟩ := ySeries_sound ht0 htI 6000 0 _ _ y h0 hacc hy
  have hs0 : 0 ≤ ∑' r, shiftTerm 501 t r := tsum_nonneg fun r => shiftTerm_nonneg 501 ht0 r
  exact ⟨Y * Y, mem_sqI P hYm, by rw [sq]; exact mul_le_mul hY hY hs0 (hs0.trans hY)⟩

/-- The large-`|A|` step. -/
lemma upsKI_sound {kpI a2loI' u : Ival} {KP Alo : ℝ} (hkp : mem KP kpI) (hK0 : 0 ≤ KP)
    (hK1 : KP < 1) (ha : mem Alo a2loI') (h : upsKI gList kpI a2loI' = some u) :
    0 < Alo ∧ ∃ K, mem K u ∧ kB (1 / Real.sqrt (1 - KP ^ 2)) Alo ≤ K := by
  unfold upsKI at h
  obtain ⟨hc2, h⟩ := guard'_bind h
  simp only [Option.bind_eq_bind, Option.bind_eq_some_iff] at h
  obtain ⟨xx, hxx, h⟩ := h
  simp only [Option.pure_def, Option.some.injEq] at h
  subst h
  have hone : 0 ≤ 1 - KP * KP := by nlinarith
  have hc2m : mem (Real.sqrt (1 - KP * KP)) (sqrtI P (subI P (ofInt P 1) (sqI P kpI))) :=
    mem_sqrtI P hone (mem_subI P (mem_one P) (mem_sqI P hkp))
  have hth := mem_invI P hc2m (lo_pos_of_isPos hc2)
  obtain ⟨hxm, hApos⟩ := mem_dv (mem_sqI P hth) ha hxx
  refine ⟨hApos, _, mem_mulI P hth (mem_horner_gList hxm), le_of_eq ?_⟩
  unfold kB
  simp only [sq]

/-- The Mehler step. -/
lemma mehI_sound {tau x R : ℚ} {m : Ival} (h : mehI tau x R = some m) :
    0 < (tau : ℝ) ∧ (tau : ℝ) < 1 ∧ ∃ M, mem M m ∧ mehB tau x R ≤ M := by
  unfold mehI at h
  obtain ⟨htp, h⟩ := guard'_bind h
  simp only [Option.bind_eq_bind, Option.bind_eq_some_iff] at h
  obtain ⟨e1, he1, e2, he2, ex, hex, pre, hpre, h⟩ := h
  simp only [Option.pure_def, Option.some.injEq] at h
  subst h
  have htm := mem_qI tau
  have hτ0 := pos_of_isPos htp htm
  have hx2 := mem_qI ((|x| + R + (x + R)) / 2)
  have hy2 : mem (Y2 x R) (if decide (R < x) then qI (R ^ 2 / (2 * (x - R)))
      else qI ((|x| + R - (x - R)) / 2)) := by
    unfold Y2
    by_cases hxR : R < x
    · have : (R : ℝ) < x := by exact_mod_cast hxR
      simp only [hxR, decide_true, ite_true, this]
      have := mem_qI (R ^ 2 / (2 * (x - R))); push_cast at this; exact this
    · have : ¬ (R : ℝ) < x := by exact_mod_cast hxR
      simp only [hxR, decide_false, Bool.false_eq_true, ite_false, this]
      have := mem_qI ((|x| + R - (x - R)) / 2); push_cast at this; exact this
  obtain ⟨he1m, h1⟩ := mem_dv (mem_mulN P 2 (mem_mulI P htm hx2)) (mem_addI P (mem_one P) htm) he1
  obtain ⟨he2m, h2⟩ := mem_dv (mem_mulN P 2 (mem_mulI P htm hy2)) (mem_subI P (mem_one P) htm) he2
  obtain ⟨v, hvm, hv⟩ := expUp_sound (mem_addI P he1m he2m) hex
  have hinv := mem_invI P htm (lo_pos_of_isPos htp)
  obtain ⟨hprem, h3⟩ := mem_dv (mem_powB hinv 501) (mem_subI P (mem_one P) (mem_sqI P htm)) hpre
  have hτ1 : (tau : ℝ) < 1 := by linarith
  refine ⟨hτ0, hτ1, _, mem_mulI P hprem hvm, ?_⟩
  unfold mehB X2
  have hX : (((|x| + R + (x + R)) / 2 : ℚ) : ℝ) = (|(x : ℝ)| + R + (x + R)) / 2 := by push_cast; rfl
  rw [hX] at hv
  have hpre_eq : (1 / (tau : ℝ)) ^ 501 / (1 - tau * tau) =
      (tau : ℝ)⁻¹ ^ 501 * (1 - (tau : ℝ) ^ 2)⁻¹ := by
    rw [one_div, div_eq_mul_inv, sq]
  rw [hpre_eq]
  have hexp : Real.exp (2 * tau * ((|(x : ℝ)| + R + (x + R)) / 2) / (1 + tau) +
      2 * tau * Y2 x R / (1 - tau)) ≤ v := by
    convert hv using 2; push_cast; ring
  have hpos : 0 ≤ (tau : ℝ)⁻¹ ^ 501 * (1 - (tau : ℝ) ^ 2)⁻¹ := by
    have : 0 < 1 - (tau : ℝ) ^ 2 := by nlinarith
    exact mul_nonneg (pow_nonneg (inv_nonneg.mpr hτ0.le) _) (inv_nonneg.mpr this.le)
  calc (tau : ℝ)⁻¹ ^ 501 * ((1 - (tau : ℝ) ^ 2)⁻¹ *
        Real.exp (2 * tau * ((|(x : ℝ)| + R + (x + R)) / 2) / (1 + tau) +
          2 * tau * Y2 x R / (1 - tau)))
      = (tau : ℝ)⁻¹ ^ 501 * (1 - (tau : ℝ) ^ 2)⁻¹ *
        Real.exp (2 * tau * ((|(x : ℝ)| + R + (x + R)) / 2) / (1 + tau) +
          2 * tau * Y2 x R / (1 - tau)) := by
        ring
    _ ≤ (tau : ℝ)⁻¹ ^ 501 * (1 - (tau : ℝ) ^ 2)⁻¹ * v := mul_le_mul_of_nonneg_left hexp hpos

lemma kB_nonneg {θ a : ℝ} (hθ : 0 ≤ θ) (ha : 0 ≤ a) : 0 ≤ kB θ a := by
  unfold kB
  exact mul_nonneg hθ (Finset.sum_nonneg fun m _ => mul_nonneg (mul_nonneg (Nat.cast_nonneg _)
    (Tm_nonneg m)) (pow_nonneg (div_nonneg (sq_nonneg _) ha) _))

lemma diskPoint_kp_nonneg {ε x R : ℝ} {z ζ : ℂ} (h : DiskPoint ε x R z ζ) (hxR : R < x) :
    0 ≤ DiskPoint.kp ε x R := by
  unfold DiskPoint.kp
  have hd0 : 0 ≤ devR x R := by
    unfold devR; exact Finset.sum_nonneg fun k _ => mul_nonneg (abs_nonneg _) (pow_nonneg h.hR _)
  have he : 0 < ε * tcoef 0 x := lt_of_le_of_lt hd0 h.hsgn
  have hx0 : 0 < x := lt_of_le_of_lt h.hR hxR
  apply div_nonneg _ (sq_nonneg _)
  have h1 : 0 ≤ devR x R / (ε * tcoef 0 x) := div_nonneg hd0 he.le
  have h2 : 0 ≤ R / x := div_nonneg h.hR hx0.le
  exact add_nonneg h2 (mul_nonneg h1 (by linarith))

/-- **The conditional-mass step**: the chosen majorant bounds the integrand on the disk. -/
lemma upsI_sound (_hc : chatOK = true) {pos : Bool} {x R : ℚ} (hR : 0 ≤ (R : ℝ)) {at0 e : Ival}
    {T Dv : ℝ} (hf : ProfileFacts pos x R at0 e T Dv) {a2hi u : Ival} {Ahi : ℝ}
    (hAm : mem Ahi a2hi)
    (hA : (|(x : ℝ)| + R) / (kappa ^ 2 * (sgn pos * tcoef 0 x - devR x R) ^ 2) ≤ Ahi)
    {τ : ℝ} (hτ0 : 0 < τ) (hτ1 : τ < 1)
    (h : upsI gList x R at0 e a2hi = some u) :
    ∃ U, mem U u ∧ 0 ≤ U ∧ ∀ z ζ, DiskPoint (sgn pos) x R z ζ →
      ‖FextV (sgn pos) z‖ ^ 2 ≤ Real.exp (-2 * (x - R)) * mehB τ x R * U := by
  have hδ : (0 : ℝ) < (2 : ℝ) ^ (-40 : ℤ) := by positivity
  have hAle : ∀ z ζ, DiskPoint (sgn pos) x R z ζ → ‖ζ / wC (sgn pos) z‖ ^ 2 ≤ Ahi :=
    fun z ζ hd => hd.norm_shift_sq_le.trans hA
  unfold upsI at h
  cases hdef : defectI x R at0 e with
  | none =>
    rw [hdef] at h
    obtain ⟨U, hUm, hU⟩ := upsYI_sound h
    refine ⟨U, hUm, (sq_nonneg _).trans hU, fun z ζ hd => ?_⟩
    have hb : (ζ / wC (sgn pos) z).im ^ 2 ≤ bval a2hi := by
      have h1 := Complex.abs_im_le_norm (ζ / wC (sgn pos) z)
      have h2 : (ζ / wC (sgn pos) z).im ^ 2 ≤ ‖ζ / wC (sgn pos) z‖ ^ 2 := by
        rw [← sq_abs]; exact pow_le_pow_left₀ (abs_nonneg _) h1 2
      exact h2.trans ((hAle z ζ hd).trans ((le_abs_self _).trans (abs_le_bval hAm)))
    refine (disk_bound_Y hd hτ0 hτ1 hδ hb).trans ?_
    exact mul_le_mul_of_nonneg_left hU (mul_nonneg (Real.exp_pos _).le (mehB_nonneg hτ0 hτ1 _ _))
  | some kp =>
    rw [hdef] at h
    obtain ⟨hxR, KP, hKPm, hkle, hK1, hK0⟩ := defectI_sound hR hf hdef
    simp only at h
    -- the off-axis majorant from `(Im A)² ≤ Ahi KP²/2`
    have hYprop : ∀ {y : Ival}, upsYI (divN P 2 (mulI P a2hi (sqI P kp))) = some y →
        ∃ U, mem U y ∧ 0 ≤ U ∧ ∀ z ζ, DiskPoint (sgn pos) x R z ζ →
          ‖FextV (sgn pos) z‖ ^ 2 ≤ Real.exp (-2 * (x - R)) * mehB τ x R * U := by
      intro y hy
      obtain ⟨U, hUm, hU⟩ := upsYI_sound hy
      refine ⟨U, hUm, (sq_nonneg _).trans hU, fun z ζ hd => ?_⟩
      have hbm := mem_divN P hP (by norm_num : 0 < 2) (mem_mulI P hAm (mem_sqI P hKPm))
      have hb : (ζ / wC (sgn pos) z).im ^ 2 ≤ bval (divN P 2 (mulI P a2hi (sqI P kp))) := by
        obtain ⟨him, -, -⟩ := hd.shift_angle (by exact_mod_cast hxR) (lt_of_le_of_lt hkle hK1)
        have hk0 := diskPoint_kp_nonneg hd (by exact_mod_cast hxR)
        refine him.trans (le_trans ?_ ((le_abs_self _).trans (abs_le_bval hbm)))
        have hA0 := hAle z ζ hd
        have hkk : DiskPoint.kp (sgn pos) x R ^ 2 ≤ KP * KP := by
          rw [sq]; exact mul_le_mul hkle hkle hk0 hK0
        have hn0 := sq_nonneg ‖ζ / wC (sgn pos) z‖
        have : ‖ζ / wC (sgn pos) z‖ ^ 2 * DiskPoint.kp (sgn pos) x R ^ 2 ≤ Ahi * (KP * KP) :=
          mul_le_mul hA0 hkk (sq_nonneg _) (hn0.trans hA0)
        push_cast
        linarith
      refine (disk_bound_Y hd hτ0 hτ1 hδ hb).trans ?_
      exact mul_le_mul_of_nonneg_left hU (mul_nonneg (Real.exp_pos _).le (mehB_nonneg hτ0 hτ1 _ _))
    -- the large-`|A|` majorant
    have hKprop : ∀ {k : Ival}, (a2loI x R at0 e).bind (upsKI gList kp) = some k →
        ∃ U, mem U k ∧ 0 ≤ U ∧ ∀ z ζ, DiskPoint (sgn pos) x R z ζ →
          ‖FextV (sgn pos) z‖ ^ 2 ≤ Real.exp (-2 * (x - R)) * mehB τ x R * U := by
      intro k hk
      simp only [Option.bind_eq_some_iff] at hk
      obtain ⟨a2lo, ha2lo, hk⟩ := hk
      obtain ⟨Alo, hAlom, hAlo⟩ := a2loI_sound hR hf ha2lo
      obtain ⟨hApos, K, hKm, hK⟩ := upsKI_sound hKPm hK0 hK1 hAlom hk
      have hθ : 0 ≤ 1 / Real.sqrt (1 - KP ^ 2) := by positivity
      refine ⟨K, hKm, (kB_nonneg hθ hApos.le).trans hK, fun z ζ hd => ?_⟩
      have hle : Alo ≤ ‖ζ / wC (sgn pos) z‖ ^ 2 := hAlo.trans hd.norm_shift_sq_ge
      refine (disk_bound_K hd hτ0 hτ1 (by exact_mod_cast hxR) (lt_of_le_of_lt hkle hK1) hApos
        hle).trans ?_
      apply mul_le_mul_of_nonneg_left _ (mul_nonneg (Real.exp_pos _).le (mehB_nonneg hτ0 hτ1 _ _))
      refine le_trans ?_ hK
      have hk0 := diskPoint_kp_nonneg hd (by exact_mod_cast hxR)
      have h1 : 0 < 1 - KP ^ 2 := by nlinarith
      have h2 : 1 - KP ^ 2 ≤ 1 - DiskPoint.kp (sgn pos) x R ^ 2 := by nlinarith
      apply kB_mono (by positivity) _ hApos le_rfl
      apply one_div_le_one_div_of_le (Real.sqrt_pos.mpr h1)
      exact Real.sqrt_le_sqrt h2
    -- the choice
    cases hy : upsYI (divN P 2 (mulI P a2hi (sqI P kp))) with
    | none =>
      cases hk : (a2loI x R at0 e).bind (upsKI gList kp) with
      | none => rw [hy, hk] at h; simp at h
      | some k =>
        rw [hy, hk] at h; simp only [Option.some.injEq] at h; subst h; exact hKprop hk
    | some y =>
      cases hk : (a2loI x R at0 e).bind (upsKI gList kp) with
      | none =>
        rw [hy, hk] at h; simp only [Option.some.injEq] at h; subst h; exact hYprop hy
      | some k =>
        rw [hy, hk] at h; simp only [Option.some.injEq] at h; subst h
        split_ifs
        · exact hKprop hk
        · exact hYprop hy

/-- **One accepted disk.** -/
theorem diskM2_sound (hc : chatOK = true) {pos : Bool} {x R tau : ℚ} (hR : 0 ≤ (R : ℝ))
    {r : Ival} (h : diskM2 gList pos x R tau = some r) :
    devR x R < sgn pos * tcoef 0 x ∧ ∃ B, mem B r ∧
      ∀ z : ℂ, ‖z - x‖ ≤ R → ‖FextV (sgn pos) z‖ ^ 2 ≤ B := by
  unfold diskM2 at h
  simp only [Option.bind_eq_bind, Option.bind_eq_some_iff] at h
  obtain ⟨⟨at0, e⟩, hprof, a2hi, ha2, u, hu, m, hm, e2, he2, h⟩ := h
  simp only [Option.pure_def, Option.some.injEq] at h
  subst h
  obtain ⟨T, Dv, hf⟩ := ProfileFacts.mk' hc hR hprof
  obtain ⟨Ahi, hAm, hA⟩ := a2hiI_sound hR hf ha2
  obtain ⟨hτ0, hτ1, M, hMm, hM⟩ := mehI_sound hm
  obtain ⟨U, hUm, hU0, hU⟩ := upsI_sound hc hR hf hAm hA hτ0 hτ1 hu
  obtain ⟨v2, hv2m, hv2⟩ := expUp_sound (mem_qI (-2 * (x - R))) he2
  refine ⟨hf.hsgn, v2 * (M * U), mem_mulI P hv2m (mem_mulI P hMm hUm), fun z hz => ?_⟩
  obtain ⟨ζ, hζ⟩ := IsAlgClosed.exists_pow_nat_eq z (by norm_num : 0 < 2)
  have hd : DiskPoint (sgn pos) x R z ζ := ⟨hR, hz, hζ, sgn_cases pos, hf.hsgn⟩
  refine (hU z ζ hd).trans ?_
  have hexp : Real.exp (-2 * (x - R)) ≤ v2 := by
    have : ((-2 * (x - R) : ℚ) : ℝ) = -2 * ((x : ℝ) - R) := by push_cast; ring
    rw [this] at hv2; exact hv2
  have hmeh0 : 0 ≤ mehB tau x R := by
    unfold mehB; have : 0 < 1 - (tau : ℝ) ^ 2 := by nlinarith
    positivity
  calc Real.exp (-2 * (x - R)) * mehB tau x R * U ≤ v2 * M * U := by
        apply mul_le_mul_of_nonneg_right _ hU0
        exact mul_le_mul hexp hM hmeh0 ((Real.exp_pos _).le.trans hexp)
    _ = v2 * (M * U) := by ring

end Grothe.UpperQuad.EllCheck
