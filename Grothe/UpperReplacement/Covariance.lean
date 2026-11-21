import Grothe.UpperReplacement.Pair
import Grothe.UpperReplacement.CircleCheck
import Grothe.UpperChaos.HardyArcRegion
import Grothe.UpperChaos.HardyArcCircle
import Mathlib.Analysis.Complex.AbsMax

set_option warningAsError true

/-!
# Separate polynomial covariance curves and 1D boundary holomorphy gates

Agent-ID: codex-a7c4, gemini-21d5.

Each mixture channel uses its own coefficient lists, smoothing matrix, and contour radius.
Instead of subdividing a 2D quadtree across the interior of the disc, `CircleCheck.regionOK`
checks `I ± Re R(t) ≻ 0` (`tubeCover`) along the 1D boundary circle `|t| = r`. Applying the
maximum modulus principle to `exp(-g_v(t))` transfers `I ± Re R(t) ≻ 0` to every `|t| < r`,
and real-symmetric quadratic-form positivity yields `det(I ∓ R(t)) ≠ 0` and
`Re((I ∓ R(t))⁻¹) ≻ 0`, hence `KerPos`.
-/

namespace Grothe.UpperReplacement

open UpperChaos UpperChaos.HardyArcSound UpperChaos.HardyArcRegion UpperChaos.HardyArcCircle
open GrotheKernel GrotheKernel.HardyArc Grothe.Upper Sym2R SchurKernel

noncomputable section

def covarianceCurve (M : Sym2R) (p q : List ℚ) (t : ℂ) : Sym2C :=
  let a := t * Polynomial.aeval (t ^ 2) (ofListQ p)
  let b := t * Polynomial.aeval (t ^ 2) (ofListQ q)
  ⟨(M.a : ℂ) ^ 2 * a + (M.b : ℂ) ^ 2 * b,
    (M.a : ℂ) * M.b * a + (M.b : ℂ) * M.c * b,
    (M.b : ℂ) ^ 2 * a + (M.c : ℂ) ^ 2 * b⟩

def covarianceData (M : SR) (p q : List ℚ) : RData :=
  ⟨M.a, M.b, M.c, p.map ofRatI, q.map ofRatI⟩

theorem covarianceCurve_differentiable (M : Sym2R) (p q : List ℚ) :
    Differentiable ℂ (fun t ↦ (covarianceCurve M p q t).a) ∧
    Differentiable ℂ (fun t ↦ (covarianceCurve M p q t).b) ∧
    Differentiable ℂ (fun t ↦ (covarianceCurve M p q t).c) := by
  constructor
  · exact ((differentiable_const _).mul (differentiable_odd _)).add
      ((differentiable_const _).mul (differentiable_odd _))
  constructor
  · exact ((differentiable_const _).mul (differentiable_odd _)).add
      ((differentiable_const _).mul (differentiable_odd _))
  · exact ((differentiable_const _).mul (differentiable_odd _)).add
      ((differentiable_const _).mul (differentiable_odd _))

theorem covarianceCurve_mem {M : Sym2R} {MI : SR} (hM : memSR M MI)
    (p q : List ℚ) {t : ℂ} {T : CI} (ht : memC t T) :
    memSC (covarianceCurve M p q t) (Rbox (covarianceData MI p q) T) := by
  have ht2 := memC_mul ht ht
  have hp : memC (t * Polynomial.aeval (t ^ 2) (ofListQ p))
      (CI.mul T (CI.horner (CI.mul T T) (p.map ofRatI))) := by
    rw [aeval_ofListQ, sq]
    exact memC_mul ht (memC_horner ht2 (forall2_ofRatI p))
  have hq : memC (t * Polynomial.aeval (t ^ 2) (ofListQ q))
      (CI.mul T (CI.horner (CI.mul T T) (q.map ofRatI))) := by
    rw [aeval_ofListQ, sq]
    exact memC_mul ht (memC_horner ht2 (forall2_ofRatI q))
  have ha := memC_ofR hM.1
  have hb := memC_ofR hM.2.1
  have hc := memC_ofR hM.2.2
  refine ⟨?_, ?_, ?_⟩
  · convert memC_add (memC_mul (memC_mul ha ha) hp) (memC_mul (memC_mul hb hb) hq)
      using 1 <;> first | rfl | (simp only [covarianceCurve]; ring)
  · exact memC_add (memC_mul (memC_mul ha hb) hp) (memC_mul (memC_mul hb hc) hq)
  · convert memC_add (memC_mul (memC_mul hb hb) hp) (memC_mul (memC_mul hc hc) hq)
      using 1 <;> first | rfl | (simp only [covarianceCurve]; ring)

/-- Real symmetric matrix `I - σ Re R`. -/
def tubeMat (R : Sym2C) (σ : ℝ) : Sym2R :=
  Sym2R.add ⟨1, 0, 1⟩ (Sym2R.smul (-σ) (SchurKernel.re R))

private theorem eq_zero_of_sum_sq_nonpos {a b c d : ℝ}
    (h : ¬ 0 < a ^ 2 + b ^ 2 + (c ^ 2 + d ^ 2)) :
    a = 0 ∧ b = 0 ∧ c = 0 ∧ d = 0 := by
  refine ⟨?_, ?_, ?_, ?_⟩ <;> nlinarith [sq_nonneg a, sq_nonneg b, sq_nonneg c, sq_nonneg d]

/-- Pure real-symmetric helper: if `X ≻ 0`, then `X + i Y` is nonsingular and `Re((X + i Y)⁻¹) ≻ 0`. -/
private theorem sym2_inv_re_pd (X Y : Sym2R) (hX : X.PD) :
    let dr := X.a * X.c - Y.a * Y.c - (X.b ^ 2 - Y.b ^ 2)
    let di := X.a * Y.c + Y.a * X.c - 2 * X.b * Y.b
    let ns := dr ^ 2 + di ^ 2
    0 < ns ∧
      (Sym2R.mk ((X.c * dr + Y.c * di) / ns) ((-X.b * dr - Y.b * di) / ns)
        ((X.a * dr + Y.a * di) / ns)).PD := by
  intro dr di ns
  have quad_id : ∀ u1 u2 : ℝ,
      X.q (X.c * u1 - X.b * u2, -X.b * u1 + X.a * u2) +
        X.q (Y.c * u1 - Y.b * u2, -Y.b * u1 + Y.a * u2) =
      (X.c * dr + Y.c * di) * u1 ^ 2 +
        2 * (-X.b * dr - Y.b * di) * u1 * u2 +
        (X.a * dr + Y.a * di) * u2 ^ 2 := by
    intro u1 u2
    simp only [dr, di, Sym2R.q, Sym2R.bil]
    ring
  have hxc_pos : 0 < X.c := by
    have hd := hX.2
    simp only [Sym2R.det] at hd
    nlinarith [sq_nonneg X.b, hX.1]
  have hμ : 0 < X.det / (X.a + X.c) := div_pos hX.2 (by linarith [hX.1])
  have hnum_a : 0 < X.c * dr + Y.c * di := by
    have h1 := q_ge_of_PD hX (X.c, -X.b)
    have h2 := q_ge_of_PD hX (Y.c, -Y.b)
    dsimp only at h1 h2
    have hid := quad_id 1 0
    simp only [mul_one, mul_zero, sub_zero, add_zero, one_pow,
      zero_pow (by decide : 2 ≠ 0)] at hid
    have hpos : 0 < X.det / (X.a + X.c) * (X.c ^ 2 + (-X.b) ^ 2) :=
      mul_pos hμ (by nlinarith [sq_nonneg X.b])
    have hnn : 0 ≤ X.det / (X.a + X.c) * (Y.c ^ 2 + (-Y.b) ^ 2) :=
      mul_nonneg hμ.le (by positivity)
    linarith
  have hns : 0 < ns := by
    dsimp only [ns]
    by_contra hle
    have hdr0 : dr = 0 := by nlinarith [sq_nonneg dr, sq_nonneg di]
    have hdi0 : di = 0 := by nlinarith [sq_nonneg dr, sq_nonneg di]
    rw [hdr0, hdi0] at hnum_a
    linarith
  refine ⟨hns, ?_⟩
  let sa : ℝ := (X.c * dr + Y.c * di) / ns
  let sb : ℝ := (-X.b * dr - Y.b * di) / ns
  let sc : ℝ := (X.a * dr + Y.a * di) / ns
  have hsa_pos : 0 < sa := div_pos hnum_a hns
  refine ⟨hsa_pos, ?_⟩
  let u1 : ℝ := -sb
  let u2 : ℝ := sa
  let p1 : ℝ := X.c * u1 - X.b * u2
  let p2 : ℝ := -X.b * u1 + X.a * u2
  let q1 : ℝ := Y.c * u1 - Y.b * u2
  let q2 : ℝ := -Y.b * u1 + Y.a * u2
  have hadj_re : X.b * p1 + X.c * p2 - (Y.b * q1 + Y.c * q2) = dr * u2 := by
    simp only [p1, p2, q1, q2, dr]; ring
  have hadj_im : Y.b * p1 + Y.c * p2 + (X.b * q1 + X.c * q2) = di * u2 := by
    simp only [p1, p2, q1, q2, di]; ring
  have hpq_pos : 0 < p1 ^ 2 + p2 ^ 2 + (q1 ^ 2 + q2 ^ 2) := by
    by_contra hle
    obtain ⟨hp1, hp2, hq1, hq2⟩ := eq_zero_of_sum_sq_nonpos hle
    rw [hp1, hp2, hq1, hq2] at hadj_re hadj_im
    have hns0 : ns * u2 = 0 := by
      dsimp only [ns]
      linear_combination dr * hadj_re.symm + di * hadj_im.symm
    have hns_pos : 0 < ns * u2 := mul_pos hns hsa_pos
    linarith
  have hsum_pos : 0 < X.q (p1, p2) + X.q (q1, q2) := by
    have h1 := q_ge_of_PD hX (p1, p2)
    have h2 := q_ge_of_PD hX (q1, q2)
    dsimp only at h1 h2
    have hlow : 0 < X.det / (X.a + X.c) * (p1 ^ 2 + p2 ^ 2 + (q1 ^ 2 + q2 ^ 2)) :=
      mul_pos hμ hpq_pos
    linarith
  have hSq : ns * (sa * (sa * sc - sb ^ 2)) = X.q (p1, p2) + X.q (q1, q2) := by
    dsimp only [p1, p2, q1, q2]
    rw [quad_id u1 u2]
    dsimp only [u1, u2, sa, sb, sc]
    have hns_ne : ns ≠ 0 := hns.ne'
    field_simp
    ring
  change 0 < sa * sc - sb ^ 2
  have hmul_pos : 0 < (ns * sa) * (sa * sc - sb ^ 2) := by linarith
  exact pos_of_mul_pos_right hmul_pos (mul_nonneg hns.le hsa_pos.le)

/-- If `I - σ Re R ≻ 0`, then `det(I - σR) ≠ 0` and `Re((I - σR)⁻¹) ≻ 0`. -/
private theorem invIm_gates_of_tubeMat_pd {R : Sym2C} (σ : ℝ) (hX : (tubeMat R σ).PD) :
    dpm R (σ : ℂ) ≠ 0 ∧ (SchurKernel.re (HardyArcSound.invIm R (σ : ℂ))).PD := by
  let X := tubeMat R σ
  let Y : Sym2R := ⟨-(σ * R.a.im), -(σ * R.b.im), -(σ * R.c.im)⟩
  have hxa : X.a = 1 - σ * R.a.re := by simp [X, tubeMat, Sym2R.add, Sym2R.smul, SchurKernel.re]; ring
  have hxb : X.b = -(σ * R.b.re) := by simp [X, tubeMat, Sym2R.add, Sym2R.smul, SchurKernel.re]
  have hxc : X.c = 1 - σ * R.c.re := by simp [X, tubeMat, Sym2R.add, Sym2R.smul, SchurKernel.re]; ring
  let d : ℂ := dpm R (σ : ℂ)
  have hdr : d.re = X.a * X.c - Y.a * Y.c - (X.b ^ 2 - Y.b ^ 2) := by
    simp [d, dpm, pow_two, hxa, hxb, hxc, Y]
  have hdi : d.im = X.a * Y.c + Y.a * X.c - 2 * X.b * Y.b := by
    simp [d, dpm, pow_two, hxa, hxb, hxc, Y]
    ring
  have hns_eq : Complex.normSq d = d.re ^ 2 + d.im ^ 2 := by
    rw [Complex.normSq_apply]; ring
  obtain ⟨hns_pos, hpd⟩ := sym2_inv_re_pd X Y hX
  rw [← hdr, ← hdi, ← hns_eq] at hns_pos hpd
  have hd_ne : d ≠ 0 := Complex.normSq_pos.mp hns_pos
  refine ⟨hd_ne, ?_⟩
  have hS : SchurKernel.re (HardyArcSound.invIm R (σ : ℂ)) =
      ⟨(X.c * d.re + Y.c * d.im) / Complex.normSq d,
        (-X.b * d.re - Y.b * d.im) / Complex.normSq d,
        (X.a * d.re + Y.a * d.im) / Complex.normSq d⟩ := by
    simp only [SchurKernel.re, HardyArcSound.invIm]
    congr 1 <;> simp [Complex.div_re, hxa, hxb, hxc, Y, d] <;> ring
  rwa [hS]

/-- `I ± Re R ≻ 0` gives `KerPos R`. -/
theorem kerPos_of_tubeMat_pd {R : Sym2C}
    (hm : (tubeMat R 1).PD) (hp : (tubeMat R (-1)).PD) :
    ∃ l > 0, KerPos R l := by
  obtain ⟨hd1, hS1⟩ := invIm_gates_of_tubeMat_pd 1 hm
  obtain ⟨hd2, hS2⟩ := invIm_gates_of_tubeMat_pd (-1) hp
  exact kerPos_of_gates (by simpa using hd1) (by push_cast at hd2; exact hd2)
    (by simpa using hS1) (by push_cast at hS2; exact hS2)

private theorem tubeOK_sound {R : Sym2C} {RI : SC} (hR : memSC R RI) (hg : tubeOK RI = true) :
    (tubeMat R 1).PD ∧ (tubeMat R (-1)).PD := by
  simp only [tubeOK, Bool.and_eq_true] at hg
  have hone : memSR ⟨1, 0, 1⟩ ⟨intI 1, zeroI, intI 1⟩ :=
    ⟨by simpa using mem_intI 1, mem_zero, by simpa using mem_intI 1⟩
  have hre := memSR_re hR
  have h1 := PD_of_gate (memSR_add hone (memSR_smul mem_neg_one hre)) hg.1
  have h2 := PD_of_gate (memSR_add hone hre) hg.2
  refine ⟨h1, ?_⟩
  have heq : tubeMat R (-1) = Sym2R.add ⟨1, 0, 1⟩ (SchurKernel.re R) := by
    simp [tubeMat, Sym2R.smul]
  rwa [heq]

private theorem tubeCover_sound {M : Sym2R} {MI : SR} (hM : memSR M MI)
    (p q : List ℚ) {r : ℝ} {rI : Ival} (hr : mem r rI) (neg : Bool) :
    ∀ (depth : ℕ) (lo hi : ℤ),
      tubeCover rI (covarianceData MI p q) neg depth lo hi = true →
      ∀ s : ℝ, mem s ⟨lo, hi⟩ →
        (tubeMat (covarianceCurve M p q (chartPt r neg s)) 1).PD ∧
          (tubeMat (covarianceCurve M p q (chartPt r neg s)) (-1)).PD
  | 0, lo, hi, h, s, hs => by
    simp only [tubeCover, Bool.or_false, Bool.and_eq_true] at h
    exact tubeOK_sound
      (covarianceCurve_mem hM p q (memC_circleBox hr hs h.1 neg)) h.2
  | d + 1, lo, hi, h, s, hs => by
    simp only [tubeCover, Bool.or_eq_true, Bool.and_eq_true] at h
    rcases h with ⟨hp, ht⟩ | ⟨h1, h2⟩
    · exact tubeOK_sound
        (covarianceCurve_mem hM p q (memC_circleBox hr hs hp neg)) ht
    · let mid : ℤ := (lo + hi) / 2
      rcases le_total (s * D) (mid : ℝ) with hmid | hmid
      · exact tubeCover_sound hM p q hr neg d lo mid h1 s ⟨hs.1, hmid⟩
      · exact tubeCover_sound hM p q hr neg d mid hi h2 s ⟨hmid, hs.2⟩

private theorem chartPt_eq_exp (r : ℝ) (neg : Bool) {θ : ℝ}
    (h1 : -Real.pi < θ) (h2 : θ < Real.pi) :
    HardyArcSound.sig neg * (r : ℂ) * Complex.exp (θ * Complex.I) =
      chartPt r neg (Real.tan (θ / 2)) := by
  rw [exp_eq_chart h1 h2]
  simp only [chartPt]
  push_cast
  ring

private theorem tube_on_sphere {M : Sym2R} {MI : SR} (hM : memSR M MI)
    (p q : List ℚ) {r : ℚ} (hr0 : 0 < r)
    (hc : CircleCheck.regionOK (covarianceData MI p q) r = true) :
    ∀ z ∈ Metric.sphere (0 : ℂ) (r : ℝ),
      (tubeMat (covarianceCurve M p q z) 1).PD ∧
        (tubeMat (covarianceCurve M p q z) (-1)).PD := by
  have hD := D_pos
  have hrR : (0 : ℝ) < r := by exact_mod_cast hr0
  have hr_mem : mem (r : ℝ) (ofRatI r) := mem_ofRatI r
  unfold CircleCheck.regionOK at hc
  simp only [CircleCheck.tubeCover_trimRData, Bool.and_eq_true] at hc
  obtain ⟨⟨⟨hc1, hc2⟩, hc3⟩, hc4⟩ := hc
  have e_neg : 2 * Real.arctan (((-D : ℤ) : ℝ) / D) = -(Real.pi / 2) := by
    rw [Int.cast_neg, neg_div_self hD.ne', Real.arctan_neg, Real.arctan_one]; ring
  have e_zero : 2 * Real.arctan (((0 : ℤ) : ℝ) / D) = 0 := by simp
  have e_pos : 2 * Real.arctan ((D : ℝ) / D) = Real.pi / 2 := by
    rw [div_self hD.ne', Real.arctan_one]; ring
  have arc_bound : ∀ (neg : Bool) (θ : ℝ), -(Real.pi / 2) ≤ θ → θ ≤ Real.pi / 2 →
      (tubeMat (covarianceCurve M p q (sig neg * ((r : ℝ) : ℂ) * Complex.exp ((θ : ℂ) * Complex.I)))
        1).PD ∧
      (tubeMat (covarianceCurve M p q (sig neg * ((r : ℝ) : ℂ) * Complex.exp ((θ : ℂ) * Complex.I)))
        (-1)).PD := by
    intro neg θ hlo hhi
    rw [chartPt_eq_exp (r : ℝ) neg (by linarith [Real.pi_pos]) (by linarith [Real.pi_pos])]
    rcases le_total θ 0 with hθ0 | hθ0
    · have ht := tan_half_mem (e_neg.trans_le hlo) (hθ0.trans_eq e_zero.symm)
      have hs : mem (Real.tan (θ / 2)) ⟨-D, 0⟩ := by
        constructor
        · have := (div_le_iff₀ hD).mp ht.1; linarith
        · have := (le_div_iff₀ hD).mp ht.2; linarith
      cases neg
      · exact tubeCover_sound hM p q hr_mem false 20 (-D) 0 hc1 _ hs
      · exact tubeCover_sound hM p q hr_mem true 20 (-D) 0 hc3 _ hs
    · have ht := tan_half_mem (e_zero.trans_le hθ0) (hhi.trans_eq e_pos.symm)
      have hs : mem (Real.tan (θ / 2)) ⟨0, D⟩ := by
        constructor
        · have := (div_le_iff₀ hD).mp ht.1; linarith
        · have := (le_div_iff₀ hD).mp ht.2; linarith
      cases neg
      · exact tubeCover_sound hM p q hr_mem false 20 0 D hc2 _ hs
      · exact tubeCover_sound hM p q hr_mem true 20 0 D hc4 _ hs
  intro z hz
  rw [Metric.mem_sphere, dist_zero_right] at hz
  have hz_exp : ((r : ℝ) : ℂ) * Complex.exp ((z.arg : ℂ) * Complex.I) = z := by
    rw [← hz]
    exact Complex.norm_mul_exp_arg_mul_I z
  have harg_lo := Complex.neg_pi_lt_arg z
  have harg_hi := Complex.arg_le_pi z
  rcases lt_or_ge z.arg (-(Real.pi / 2)) with hlt | hge
  · let θ : ℝ := z.arg + Real.pi
    have hz_eq : sig true * ((r : ℝ) : ℂ) * Complex.exp ((θ : ℂ) * Complex.I) = z := by
      simp only [θ, Complex.ofReal_add, sig_true, add_mul, Complex.exp_add, Complex.exp_pi_mul_I]
      linear_combination hz_exp
    rw [← hz_eq]
    exact arc_bound true θ (by dsimp [θ]; linarith) (by dsimp [θ]; linarith)
  · rcases le_or_gt z.arg (Real.pi / 2) with hle | hgt
    · have hz_eq : sig false * ((r : ℝ) : ℂ) * Complex.exp ((z.arg : ℂ) * Complex.I) = z := by
        rw [sig_false, one_mul, hz_exp]
      rw [← hz_eq]
      exact arc_bound false z.arg hge hle
    · let θ : ℝ := z.arg - Real.pi
      have hz_eq : sig true * ((r : ℝ) : ℂ) * Complex.exp ((θ : ℂ) * Complex.I) = z := by
        have hexp : Complex.exp ((θ : ℂ) * Complex.I) * (-1) =
            Complex.exp ((z.arg : ℂ) * Complex.I) := by
          rw [← Complex.exp_pi_mul_I, ← Complex.exp_add]
          congr 1
          simp only [θ, Complex.ofReal_sub]
          ring
        rw [sig_true]
        linear_combination ((r : ℝ) : ℂ) * hexp + hz_exp
      rw [← hz_eq]
      exact arc_bound true θ (by dsimp [θ]; linarith) (by dsimp [θ]; linarith)

/-- Maximum-modulus transfer of `I - σ Re R ≻ 0` from `|z| = r` to `|t| < r`. -/
private theorem tubeMat_pd_on_ball (M : Sym2R) (p q : List ℚ) {r σ : ℝ} (hr : 0 < r)
    (hsph : ∀ z ∈ Metric.sphere (0 : ℂ) r, (tubeMat (covarianceCurve M p q z) σ).PD) :
    ∀ t ∈ Metric.ball (0 : ℂ) r, (tubeMat (covarianceCurve M p q t) σ).PD := by
  obtain ⟨hda, hdb, hdc⟩ := covarianceCurve_differentiable M p q
  have hq_pos : ∀ t ∈ Metric.ball (0 : ℂ) r, ∀ v : ℝ × ℝ, 0 < v.1 ^ 2 + v.2 ^ 2 →
      0 < (tubeMat (covarianceCurve M p q t) σ).q v := by
    intro t ht v hv
    let g : ℂ → ℂ := fun w ↦
      ((v.1 ^ 2 : ℝ) : ℂ) * (1 - (σ : ℂ) * (covarianceCurve M p q w).a) +
        (2 * ((v.1 * v.2 : ℝ) : ℂ)) * ((-(σ : ℂ)) * (covarianceCurve M p q w).b) +
        ((v.2 ^ 2 : ℝ) : ℂ) * (1 - (σ : ℂ) * (covarianceCurve M p q w).c)
    have hgre : ∀ w : ℂ, (g w).re = (tubeMat (covarianceCurve M p q w) σ).q v := by
      intro w
      simp [g, pow_two, tubeMat, Sym2R.q, Sym2R.bil, Sym2R.add, Sym2R.smul, SchurKernel.re]
      ring
    let h : ℂ → ℂ := fun w ↦ Complex.exp (-g w)
    have hg_diff : Differentiable ℂ g :=
      (((differentiable_const _).mul
        ((differentiable_const 1).sub ((differentiable_const _).mul hda))).add
        ((differentiable_const _).mul ((differentiable_const _).mul hdb))).add
        ((differentiable_const _).mul
          ((differentiable_const 1).sub ((differentiable_const _).mul hdc)))
    have hh_diff : Differentiable ℂ h := Complex.differentiable_exp.comp hg_diff.neg
    have hne : (Metric.sphere (0 : ℂ) r).Nonempty :=
      ⟨(r : ℂ), by simp [abs_of_pos hr]⟩
    obtain ⟨z₀, hz₀, hmax⟩ := (isCompact_sphere (0 : ℂ) r).exists_isMaxOn hne
      (continuous_norm.comp hh_diff.continuous).continuousOn
    have hpd₀ := hsph z₀ hz₀
    have hxc₀ : 0 < (tubeMat (covarianceCurve M p q z₀) σ).c := by
      have hd := hpd₀.2
      simp only [Sym2R.det] at hd
      nlinarith [sq_nonneg (tubeMat (covarianceCurve M p q z₀) σ).b, hpd₀.1]
    have hpos₀ : 0 < (g z₀).re := by
      rw [hgre]
      exact (mul_pos (div_pos hpd₀.2 (by linarith [hpd₀.1])) hv).trans_le (q_ge_of_PD hpd₀ v)
    have hnorm₀ : ‖h z₀‖ < 1 := by
      simp only [h, Complex.norm_exp, Complex.neg_re, Real.exp_lt_one_iff]
      linarith
    have hfront : ∀ z ∈ frontier (Metric.ball (0 : ℂ) r), ‖h z‖ ≤ ‖h z₀‖ := by
      rw [frontier_ball (0 : ℂ) hr.ne']
      exact fun z hz ↦ hmax hz
    have hle : ‖h t‖ ≤ ‖h z₀‖ :=
      Complex.norm_le_of_forall_mem_frontier_norm_le Metric.isBounded_ball
        hh_diff.diffContOnCl hfront (subset_closure ht)
    have hlt : Real.exp (-(g t).re) < 1 := by
      simpa only [h, Complex.norm_exp, Complex.neg_re] using hle.trans_lt hnorm₀
    rw [← hgre]
    linarith [Real.exp_lt_one_iff.mp hlt]
  intro t ht
  set X := tubeMat (covarianceCurve M p q t) σ
  have ha : 0 < X.a := by
    have h10 := hq_pos t ht (1, 0) (by norm_num)
    simpa only [Sym2R.q, Sym2R.bil, mul_zero, zero_pow (by decide : 2 ≠ 0), add_zero, one_pow,
      mul_one] using h10
  refine ⟨ha, ?_⟩
  have hdet := hq_pos t ht (-X.b, X.a) (by nlinarith [sq_nonneg X.b])
  have hid : X.q (-X.b, X.a) = X.a * X.det := by
    simp only [Sym2R.q, Sym2R.bil, Sym2R.det]
    ring
  rw [hid] at hdet
  nlinarith

theorem covariance_kerPos_on_ball {M : Sym2R} {MI : SR} (hM : memSR M MI)
    (p q : List ℚ) {r : ℚ} (hr0 : 0 < r) (_hr2 : r ≤ 2)
    (h : CircleCheck.regionOK (covarianceData MI p q) r = true) :
    ∀ t ∈ Metric.ball (0 : ℂ) (r : ℝ), ∃ l > 0, KerPos (covarianceCurve M p q t) l := by
  have hrR : (0 : ℝ) < r := by exact_mod_cast hr0
  have hsph := tube_on_sphere hM p q hr0 h
  have hm := tubeMat_pd_on_ball M p q hrR (fun z hz ↦ (hsph z hz).1)
  have hp := tubeMat_pd_on_ball M p q hrR (fun z hz ↦ (hsph z hz).2)
  exact fun t ht ↦ kerPos_of_tubeMat_pd (hm t ht) (hp t ht)

end

end Grothe.UpperReplacement
