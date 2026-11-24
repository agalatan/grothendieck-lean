import Grothe.Lower.AffineEnvelope
import Grothe.Lower.MassFacts
import Grothe.Lower.RowData

set_option warningAsError true

/-!
# The sharp scalar envelope of the identity-tail rows

Fourteen fixed mixtures and one affine mixture cover the full profile interval.
The two rows at 0.835 and 0.845 determine the interior maximum.

Agent-ID: codex-a7c4
-/

namespace Grothe.Lower.SharpEnvelope

private def fixed (lo hi : ℚ) (i j : ℕ) (θ : ℚ) : AffineEnvCell :=
  ⟨lo / 2000, hi / 2000, i, j, θ, 0⟩

/-- For each t in the central cell, solve the quadratic minimization over the mixture weight. -/
def central : AffineEnvCell :=
  let a := row08.env
  let b := row09.env
  let k := (2 / ε) * (b.beta - a.beta) ^ 2
  ⟨1672 / 2000, 1675 / 2000, 8, 9, (k - (b.C - a.C)) / (2 * k), (b.ell - a.ell) / k⟩

def cells : List AffineEnvCell := [
  fixed 0 511 0 0 0,
  fixed 511 570 0 0 0,
  fixed 570 1043 1 1 0,
  fixed 1043 1416 3 2 (7 / 20),
  fixed 1416 1583 4 5 (1 / 20),
  fixed 1583 1614 5 6 (3 / 4),
  fixed 1614 1642 6 7 (9 / 20),
  fixed 1642 1669 7 8 (3 / 4),
  fixed 1669 1672 8 9 (7 / 20),
  central,
  fixed 1675 1686 8 9 (176567 / 250000),
  fixed 1686 1712 9 10 (4 / 5),
  fixed 1712 1742 10 12 (13 / 20),
  fixed 1742 1774 12 13 (3 / 5),
  fixed 1774 1800 14 14 0]

/-- The maximum of the central quadratic is the cap for the entire interval. -/
def hatCap : ℚ := affineCellCap row08.env row09.env central

theorem check : checkAffineEnvelope rowData massS hatCap cells = true := by
  decide +kernel

/-- Exact reciprocal of the witness cap in the original units. -/
def endpoint : ℚ := 1 / ((1 - 47 / 2000) * hatCap + 47 / 2000)

theorem endpoint_eq : endpoint =
    909157856627679665006951532318493526757143019079598080000000000000000000000000000000 /
    648513273363107644808393943072300421164120888939497691860404687721820234278296395631 := by
  decide +kernel

theorem rounded_lt : (14019109461 : ℚ) / 10000000000 < endpoint := by
  rw [endpoint_eq]
  decide +kernel

/-- Critical mixture weight at the interior maximum. -/
private def contactWeight : ℚ :=
  let a := row08.env
  let b := row09.env
  let d := b.ell - a.ell
  let k := 2 / ε * (b.beta - a.beta) ^ 2
  (a.ell * d + (k - (b.C - a.C)) / 2) / (k - d ^ 2)

def contactT : ℚ := row08.env.ell + contactWeight * (row09.env.ell - row08.env.ell)

def contactBeta : ℚ := row08.env.beta + contactWeight * (row09.env.beta - row08.env.beta)

private def rowAtContact (r : EnvRow) : ℚ :=
  contactT ^ 2 - 2 * r.ell * contactT + r.C - 2 / ε * (r.beta - contactBeta) ^ 2

private theorem contact_data :
    0 ≤ contactT ∧ contactT ≤ 9 / 10 ∧
    rowData.all (fun r => decide (hatCap ≤ rowAtContact r.env)) = true ∧
    hatCap ≤ rowAtContact (massTangent massS contactT) := by
  decide +kernel

/-- The peak cap is attainable in the abstract scalar row system, including the retained squares. -/
theorem scalar_contact {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (v : E) (hv : ‖v‖ ^ 2 = 2) :
    (0 : ℝ) ≤ contactT ∧ (contactT : ℝ) ≤ 9 / 10 ∧
    ∀ k m a, envRowAt rowData massS m k = some a →
      RowOf a (hatCap : ℝ) (contactT : ℝ) ((-(contactBeta : ℝ) / (ε : ℝ)) • v) v := by
  obtain ⟨h0, h9, hrows, hmass⟩ := contact_data
  have ht9 : (contactT : ℝ) ≤ ((9 / 10 : ℚ) : ℝ) := Rat.cast_le.mpr h9
  refine ⟨by exact_mod_cast h0, by simpa only [Rat.cast_div, Rat.cast_ofNat] using ht9, ?_⟩
  intro k m a ha
  have hq : hatCap ≤ rowAtContact a := by
    cases k with
    | zero =>
      cases ha
      apply hmass.trans
      dsimp [rowAtContact, massTangent]
      nlinarith [sq_nonneg (m - contactT)]
    | succ j =>
      obtain ⟨r, hr, rfl⟩ := Option.map_eq_some_iff.1 ha
      exact of_decide_eq_true (List.all_eq_true.mp hrows r (List.mem_of_getElem? hr))
  have hreal : (hatCap : ℝ) ≤ (rowAtContact a : ℝ) := by exact_mod_cast hq
  refine hreal.trans_eq ?_
  change ((rowAtContact a : ℚ) : ℝ) =
    (contactT : ℝ) ^ 2 - 2 * (a.ell : ℝ) * contactT + a.C -
      (ε : ℝ) * ‖(-(contactBeta : ℝ) / (ε : ℝ)) • v + ((a.beta : ℝ) / (ε : ℝ)) • v‖ ^ 2
  rw [← add_smul, norm_smul, mul_pow, Real.norm_eq_abs, sq_abs, hv]
  unfold rowAtContact
  push_cast
  have he : (ε : ℝ) ≠ 0 := by norm_num [ε]
  field_simp
  ring

/-- The exact greatest value permitted by the full set of reduced scalar inequalities. -/
theorem exact_scalar_cap {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (v : E) (hv : ‖v‖ ^ 2 = 2) :
    IsGreatest {V : ℝ | ∃ (t : ℝ) (Qh : E), 0 ≤ t ∧ t ≤ 9 / 10 ∧
      ∀ k m a, envRowAt rowData massS m k = some a → RowOf a V t Qh v} (hatCap : ℝ) := by
  constructor
  · obtain ⟨h0, h9, hr⟩ := scalar_contact v hv
    exact ⟨(contactT : ℝ), _, h0, h9, hr⟩
  · rintro V ⟨t, Qh, h0, h9, hr⟩
    exact affineEnvelope_bound rowData massS hatCap cells check hv h0 h9 hr

end Grothe.Lower.SharpEnvelope
