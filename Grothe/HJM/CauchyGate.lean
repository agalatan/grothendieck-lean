import Grothe.HJM.CauchyKernel
import Grothe.HJM.Preprocessors
import Grothe.UpperChaos.HardyArcRegion

/-!
# The gate region of a scalar preprocessor (HJM 6.23–6.24)

The continued preprocessor is `ρ(ζ) = ζ P(ζ²)` (`rhoC`). With `u = ζ²`, `ρ(ζ)² = u P(u)²`, so the gate
`Gate (ρ ζ)` of `CauchyKernel.lean` (`|ρ|² ≤ 9/4`, and `Re ρ² ≤ 39/40` or `(Re ρ²)² ≤ 1500 (Im ρ²)²`) is a
condition on the polynomial `u P(u)²` over the disc `|u| < R²`. A quadtree of complex interval boxes in the
`u`-plane checks it (`gateCover`; every box lies outside the disc or passes `gateBox`), and `gate_rhoC_of_check`
turns an accepted check into `Gate (ρ ζ)` on the ball `‖ζ‖ < R`.
-/

namespace Grothe.HJM.Cauchy

open GrotheKernel GrotheKernel.HardyArc Grothe.Upper Grothe.UpperChaos.HardyArcSound
  Grothe.UpperChaos.HardyArcRegion Polynomial

noncomputable section

/-- A rational coefficient list as reals. -/
def realList (pl : List ℚ) : List ℝ := pl.map fun q : ℚ => (q : ℝ)

/-- The continued preprocessor `ρ(ζ) = ζ P(ζ²)` of the coefficient list `pl`. -/
def rhoC (pl : List ℚ) (ζ : ℂ) : ℂ := ζ * hornerR (ζ ^ 2) (realList pl)

lemma hornerR_ofReal (x : ℝ) : ∀ pl : List ℚ,
    hornerR (x : ℂ) (realList pl) = (((ofListQ pl).eval x : ℝ) : ℂ)
  | [] => by simp [realList, hornerR, ofListQ]
  | a :: l => by
    have ih := hornerR_ofReal x l
    simp only [realList, List.map_cons, hornerR, ofListQ, eval_add, eval_C, eval_mul, eval_X] at ih ⊢
    rw [ih]; push_cast; ring

/-- On the real line `ρ` is the physical preprocessor `t P(t²)`. -/
lemma rhoC_ofReal (pl : List ℚ) (t : ℝ) : rhoC pl t = ((t * (ofListQ pl).eval (t ^ 2) : ℝ) : ℂ) := by
  rw [rhoC, show (t : ℂ) ^ 2 = ((t ^ 2 : ℝ) : ℂ) by push_cast; ring, hornerR_ofReal]; push_cast; ring

lemma differentiable_hornerR_sq : ∀ cs : List ℝ, Differentiable ℂ fun z : ℂ => hornerR (z ^ 2) cs
  | [] => by simp only [hornerR]; exact differentiable_const 0
  | c :: cs => by
    simp only [hornerR]
    exact (differentiable_const _).add ((differentiable_id.pow 2).mul (differentiable_hornerR_sq cs))

lemma differentiable_rhoC (pl : List ℚ) : Differentiable ℂ (rhoC pl) :=
  differentiable_id.mul (differentiable_hornerR_sq _)

/-! ### The box test and the quadtree -/

/-- `u P(u)²` on the box `B`, and the gate on it: `|w²|² ≤ 81/16`, and `Re w² ≤ 39/40` or
`1500 (Im w²)² − (Re w²)² ≥ 0`. -/
def gateBox (PI : List Ival) (B : CI) : Bool :=
  let H := CI.horner B PI
  let W := CI.mul B (CI.mul H H)
  decide ((addI (mulI W.re W.re) (mulI W.im W.im)).hi ≤ ofRatLo (81 / 16)) &&
    (decide (W.re.hi ≤ ofRatLo (39 / 40)) ||
      decide (0 ≤ (subI (mulI (intI 1500) (mulI W.im W.im)) (mulI W.re W.re)).lo))

/-- Every box is outside the disc `|u|² < r2/D` or passes the gate, else split in four (at most `depth` times). -/
def gateCover (PI : List Ival) (r2 : Int) : Nat → Int → Int → Int → Int → Bool
  | depth, xlo, xhi, ylo, yhi =>
    outsideDisc r2 ⟨xlo, xhi⟩ ⟨ylo, yhi⟩ || gateBox PI ⟨⟨xlo, xhi⟩, ⟨ylo, yhi⟩⟩ ||
      match depth with
      | 0 => false
      | d + 1 =>
        let xm := (xlo + xhi) / 2
        let ym := (ylo + yhi) / 2
        gateCover PI r2 d xlo xm ylo ym && gateCover PI r2 d xm xhi ylo ym &&
          gateCover PI r2 d xlo xm ym yhi && gateCover PI r2 d xm xhi ym yhi

/-- The whole check over the square `[−2, 2]²` (which contains the disc `|u| < R²` for `R² < 2`). -/
def gateCheck (pl : List ℚ) (R : ℚ) : Bool :=
  gateCover (pl.map ofRatI) (ofRatHi (R ^ 4)) 30 (-2 * D) (2 * D) (-2 * D) (2 * D)

/-- The gate condition on `w² = s`. -/
def GateSq (s : ℂ) : Prop :=
  Complex.normSq s ≤ 81 / 16 ∧ (s.re ≤ 39 / 40 ∨ s.re ^ 2 ≤ 1500 * s.im ^ 2)

lemma gate_of_gateSq {w : ℂ} (h : GateSq (w ^ 2)) : Gate w := by
  refine ⟨?_, h.2⟩
  have h1 := h.1
  rw [map_pow] at h1
  nlinarith [Complex.normSq_nonneg w]

lemma forall₂_mem_ofRatI : ∀ pl : List ℚ, List.Forall₂ mem (realList pl) (pl.map ofRatI)
  | [] => List.Forall₂.nil
  | a :: l => by
    simp only [realList, List.map_cons]
    exact List.Forall₂.cons (mem_ofRatI a) (forall₂_mem_ofRatI l)

lemma gateSq_of_gateBox {pl : List ℚ} {u : ℂ} {B : CI} (hu : memC u B)
    (h : gateBox (pl.map ofRatI) B = true) :
    GateSq (u * (hornerR u (realList pl) * hornerR u (realList pl))) := by
  set s := u * (hornerR u (realList pl) * hornerR u (realList pl))
  have hH := memC_horner hu (forall₂_mem_ofRatI pl)
  have hW : memC s _ := memC_mul hu (memC_mul hH hH)
  simp only [gateBox, Bool.and_eq_true, Bool.or_eq_true, decide_eq_true_eq] at h
  obtain ⟨hn, hg⟩ := h
  have hD := D_pos
  refine ⟨?_, ?_⟩
  · have hm := (mem_add (mem_mul hW.1 hW.1) (mem_mul hW.2 hW.2)).2
    have h1 : (s.re * s.re + s.im * s.im) * D ≤ ((81 / 16 : ℚ) : ℝ) * D :=
      hm.trans ((Int.cast_le.2 hn).trans (ofRatLo_le _))
    rw [Complex.normSq_apply]
    have := le_of_mul_le_mul_right h1 hD
    push_cast at this; linarith
  · rcases hg with hg | hg
    · left
      have h1 : s.re * D ≤ ((39 / 40 : ℚ) : ℝ) * D :=
        hW.1.2.trans ((Int.cast_le.2 hg).trans (ofRatLo_le _))
      have := le_of_mul_le_mul_right h1 hD
      push_cast at this; linarith
    · right
      have hm := (mem_sub (mem_mul (mem_intI 1500) (mem_mul hW.2 hW.2)) (mem_mul hW.1 hW.1)).1
      have h0 : (0 : ℝ) ≤ ((1500 : ℤ) : ℝ) * (s.im * s.im) - s.re * s.re := by
        have : (0 : ℝ) ≤ _ * D := (by exact_mod_cast hg : (0 : ℝ) ≤ _).trans hm
        exact nonneg_of_mul_nonneg_left this hD
      push_cast at h0; nlinarith

/-- **The quadtree**: every point of a covered box inside the disc passes the gate. -/
theorem gateCover_sound {pl : List ℚ} {r2 : ℤ} :
    ∀ (depth : ℕ) (xlo xhi ylo yhi : ℤ), gateCover (pl.map ofRatI) r2 depth xlo xhi ylo yhi = true →
      ∀ u : ℂ, mem u.re ⟨xlo, xhi⟩ → mem u.im ⟨ylo, yhi⟩ → Complex.normSq u < (r2 : ℝ) / D →
        GateSq (u * (hornerR u (realList pl) * hornerR u (realList pl))) := by
  intro depth
  induction depth with
  | zero =>
    intro xlo xhi ylo yhi h u hx hy hr
    simp only [gateCover, Bool.or_eq_true, Bool.or_false] at h
    rcases h with h | h
    · exact absurd (outside_sound h hx hy) (not_le.2 hr)
    · exact gateSq_of_gateBox ⟨hx, hy⟩ h
  | succ d ih =>
    intro xlo xhi ylo yhi h u hx hy hr
    simp only [gateCover, Bool.or_eq_true, Bool.and_eq_true] at h
    rcases h with (h | h) | ⟨⟨⟨h1, h2⟩, h3⟩, h4⟩
    · exact absurd (outside_sound h hx hy) (not_le.2 hr)
    · exact gateSq_of_gateBox ⟨hx, hy⟩ h
    · set xm := (xlo + xhi) / 2
      set ym := (ylo + yhi) / 2
      rcases le_total (u.re * D) xm with hxl | hxl <;> rcases le_total (u.im * D) ym with hyl | hyl
      · exact ih _ _ _ _ h1 u ⟨hx.1, hxl⟩ ⟨hy.1, hyl⟩ hr
      · exact ih _ _ _ _ h3 u ⟨hx.1, hxl⟩ ⟨hyl, hy.2⟩ hr
      · exact ih _ _ _ _ h2 u ⟨hxl, hx.2⟩ ⟨hy.1, hyl⟩ hr
      · exact ih _ _ _ _ h4 u ⟨hxl, hx.2⟩ ⟨hyl, hy.2⟩ hr

/-- **The gate on the ball**: an accepted check gives `Gate (ρ ζ)` for `‖ζ‖ < R`. -/
theorem gate_rhoC_of_check {pl : List ℚ} {R : ℚ} (hR : R ^ 2 < 2)
    (h : gateCheck pl R = true) {ζ : ℂ} (hζ : ‖ζ‖ < R) : Gate (rhoC pl ζ) := by
  have hD := D_pos
  set u := ζ ^ 2
  have hnu : ‖u‖ < (R : ℝ) ^ 2 := by
    rw [norm_pow]; exact pow_lt_pow_left₀ hζ (norm_nonneg _) two_ne_zero
  have hR2 : ((R : ℝ)) ^ 2 < 2 := by exact_mod_cast hR
  have hu2 : ‖u‖ < 2 := hnu.trans hR2
  have hx : mem u.re ⟨-2 * D, 2 * D⟩ := by
    obtain ⟨a, b⟩ := abs_lt.1 ((Complex.abs_re_le_norm u).trans_lt hu2)
    constructor <;> push_cast <;> nlinarith
  have hy : mem u.im ⟨-2 * D, 2 * D⟩ := by
    obtain ⟨a, b⟩ := abs_lt.1 ((Complex.abs_im_le_norm u).trans_lt hu2)
    constructor <;> push_cast <;> nlinarith
  have hr : Complex.normSq u < (ofRatHi (R ^ 4) : ℝ) / D := by
    rw [lt_div_iff₀ hD, Complex.normSq_eq_norm_sq]
    refine lt_of_lt_of_le ?_ (le_ofRatHi _)
    push_cast
    have : ‖u‖ ^ 2 < ((R : ℝ) ^ 2) ^ 2 := pow_lt_pow_left₀ hnu (norm_nonneg _) two_ne_zero
    nlinarith
  have hs := gateCover_sound (pl := pl) 30 _ _ _ _ h u hx hy hr
  apply gate_of_gateSq
  have e : rhoC pl ζ ^ 2 = u * (hornerR u (realList pl) * hornerR u (realList pl)) := by
    simp only [rhoC, u]; ring
  rw [e]; exact hs

end

end Grothe.HJM.Cauchy
