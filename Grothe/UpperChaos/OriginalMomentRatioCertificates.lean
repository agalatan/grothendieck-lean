import Grothe.UpperChaos.OriginalMomentRatios
import Mathlib.Tactic.NormNum
import Lean.Elab.Tactic.Omega
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-!
Rounded certificates for actual positive moment ratios.
Agent-ID: codex-aa04. Refs #21.

Rounded rational checkpoints certify the actual original moment ratios over
an entire parameter interval. This reuses the landed analytic recurrence.
The checker performs multiplication and comparison only; it neither evaluates
an integral nor assumes a terminal ratio. Any finite terminal depth is sound.
-/

namespace Grothe.UpperChaos.OriginalMomentRatioCertificates

open PositiveRatio

noncomputable section

/-- The recurrence step decreases with its nonnegative squared-shift parameter. -/
theorem next_antitone_parameter (h : ℕ) {x y r : ℝ}
    (hx : 0 ≤ x) (hxy : x ≤ y) (hr : r ≤ 1) :
    next h y r ≤ next h x r := by
  have hd := denominator_pos h hx hr
  have hn : (0 : ℝ) ≤ (h : ℝ) + 1 / 2 := by positivity
  have hm := mul_nonneg (sub_nonneg.mpr hxy) (sub_nonneg.mpr hr)
  have hden : denominator h x r ≤ denominator h y r := by
    dsimp only [denominator]
    nlinarith
  exact div_le_div_of_nonneg_left hn hd hden

/-- Two multiplication inequalities enclose one rounded backward step. -/
theorem rounded_step {h : ℕ} {x xlo xhi l r u lower upper : ℝ}
    (hxlo : 0 ≤ xlo) (hxl : xlo ≤ x) (hxh : x ≤ xhi)
    (hlr : l ≤ r) (hru : r ≤ u) (hu : u ≤ 1)
    (hlower : lower * ((h : ℝ) + 2 + xhi - xhi * l) ≤ (h : ℝ) + 1 / 2)
    (hupper : (h : ℝ) + 1 / 2 ≤ upper * ((h : ℝ) + 2 + xlo - xlo * u)) :
    lower ≤ next h x r ∧ next h x r ≤ upper := by
  have hx : 0 ≤ x := hxlo.trans hxl
  have hxhi : 0 ≤ xhi := hx.trans hxh
  have hl : l ≤ 1 := hlr.trans (hru.trans hu)
  have hdl := denominator_pos h hxhi hl
  have hdu := denominator_pos h hxlo hu
  have hlb : lower ≤ next h xhi l := by
    apply (le_div_iff₀ hdl).2
    exact hlower
  have hub : next h xlo u ≤ upper := by
    apply (div_le_iff₀ hdu).2
    exact hupper
  constructor
  · exact hlb.trans ((next_antitone_parameter h hx hxh hl).trans
      (next_monotone h hx hlr (hru.trans hu)))
  · exact (next_monotone h hx hru hu).trans
      ((next_antitone_parameter h hxlo hxl hu).trans hub)

/-- Actual ratios are enclosed by any finite collection of valid checkpoints.
Only the original ratio's proved unit bound is used at the terminal index. -/
theorem ratio_mem_of_checkpoints (H : ℕ) (lo hi : ℕ → ℝ)
    {x xlo xhi : ℝ} (hxlo : 0 ≤ xlo) (hxl : xlo ≤ x) (hxh : x ≤ xhi)
    (hterminal : lo H ≤ 0 ∧ 1 ≤ hi H)
    (hsteps : ∀ k, k < H →
      hi (k + 1) ≤ 1 ∧
      lo k * ((k : ℝ) + 2 + xhi - xhi * lo (k + 1)) ≤ (k : ℝ) + 1 / 2 ∧
      (k : ℝ) + 1 / 2 ≤ hi k * ((k : ℝ) + 2 + xlo - xlo * hi (k + 1)))
    (k : ℕ) (hk : k ≤ H) :
    lo k ≤ OriginalPositiveMoment.ratio k x ∧ OriginalPositiveMoment.ratio k x ≤ hi k := by
  have hx : 0 ≤ x := hxlo.trans hxl
  have hall : ∀ n k, k + n = H →
      lo k ≤ OriginalPositiveMoment.ratio k x ∧ OriginalPositiveMoment.ratio k x ≤ hi k := by
    intro n
    induction n with
    | zero =>
      intro k hkn
      have he : k = H := by omega
      subst k
      have hr := OriginalPositiveMoment.ratio_mem_unit H x
      exact ⟨hterminal.1.trans hr.1.le, hr.2.trans hterminal.2⟩
    | succ n ih =>
      intro k hkn
      have ht := ih (k + 1) (by omega)
      have hs := hsteps k (by omega)
      have hb := rounded_step hxlo hxl hxh ht.1 ht.2 hs.1 hs.2.1 hs.2.2
      rw [← OriginalPositiveMoment.ratio_eq_next k hx] at hb
      exact hb
  exact hall (H - k) k (by omega)

end

/-- Executable finite certificate, with exact rational inputs and checkpoints. -/
def certificateOK (H : ℕ) (lo hi : ℕ → ℚ) (xlo xhi : ℚ) : Bool :=
  decide (0 ≤ xlo ∧ xlo ≤ xhi ∧ lo H ≤ 0 ∧ 1 ≤ hi H ∧
    ∀ k : Fin H,
      hi (k.val + 1) ≤ 1 ∧
      lo k.val * ((k.val : ℚ) + 2 + xhi - xhi * lo (k.val + 1)) ≤
        (k.val : ℚ) + 1 / 2 ∧
      (k.val : ℚ) + 1 / 2 ≤
        hi k.val * ((k.val : ℚ) + 2 + xlo - xlo * hi (k.val + 1)))

/-- The rational check certifies the actual integral ratio for every x in its box. -/
theorem ratio_mem_of_certificate (H : ℕ) (lo hi : ℕ → ℚ) (xlo xhi : ℚ)
    (hcheck : certificateOK H lo hi xlo xhi = true)
    {x : ℝ} (hxl : (xlo : ℝ) ≤ x) (hxh : x ≤ (xhi : ℝ))
    (k : ℕ) (hk : k ≤ H) :
    (lo k : ℝ) ≤ OriginalPositiveMoment.ratio k x ∧
      OriginalPositiveMoment.ratio k x ≤ (hi k : ℝ) := by
  have hc := of_decide_eq_true hcheck
  apply ratio_mem_of_checkpoints H (fun j => (lo j : ℝ)) (fun j => (hi j : ℝ))
    (xlo := (xlo : ℝ)) (xhi := (xhi : ℝ))
  · exact_mod_cast hc.1
  · exact hxl
  · exact hxh
  · constructor
    · exact_mod_cast hc.2.2.1
    · exact_mod_cast hc.2.2.2.1
  · intro j hj
    have hs : hi (j + 1) ≤ 1 ∧
        lo j * ((j : ℚ) + 2 + xhi - xhi * lo (j + 1)) ≤ (j : ℚ) + 1 / 2 ∧
        (j : ℚ) + 1 / 2 ≤ hi j * ((j : ℚ) + 2 + xlo - xlo * hi (j + 1)) :=
      hc.2.2.2.2 ⟨j, hj⟩
    constructor
    · exact_mod_cast hs.1
    · constructor
      · simpa only [Rat.cast_mul, Rat.cast_sub, Rat.cast_add, Rat.cast_div,
          Rat.cast_natCast, Rat.cast_ofNat, Rat.cast_one] using
          (Rat.cast_le (K := ℝ)).mpr hs.2.1
      · simpa only [Rat.cast_mul, Rat.cast_sub, Rat.cast_add, Rat.cast_div,
          Rat.cast_natCast, Rat.cast_ofNat, Rat.cast_one] using
          (Rat.cast_le (K := ℝ)).mpr hs.2.2
  · exact hk

end Grothe.UpperChaos.OriginalMomentRatioCertificates

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.OriginalMomentRatioCertificates.next_antitone_parameter,
      ``Grothe.UpperChaos.OriginalMomentRatioCertificates.rounded_step,
      ``Grothe.UpperChaos.OriginalMomentRatioCertificates.ratio_mem_of_checkpoints,
      ``Grothe.UpperChaos.OriginalMomentRatioCertificates.ratio_mem_of_certificate] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
