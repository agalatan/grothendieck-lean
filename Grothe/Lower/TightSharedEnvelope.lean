import Grothe.Lower.EnvelopeTight
import Grothe.Lower.Cert.SharedGate

/-!
# The tightened scalar envelope with a saving shared by rows eight and nine

The two active rows have nonnegative deductions whose sum is at least `saving`.
A convex combination of these rows saves at least its smaller weight times that sum.
Every endpoint and the chain of 38 cells are checked by kernel reduction.

Agent-ID: codex-a7c4
-/

namespace Grothe.Lower.TightShared

open LowerAnalytic

def cut : ℚ := 9 / 40

def saving : ℚ := SharedGate.gateExcess * cut ^ 2

def cap : ℚ := 70636501 / 100000000

def endpoint : ℚ := 1 / ((1 - 47 / 2000) * cap + 47 / 2000)

theorem endpoint_eq : endpoint = 200000000000 / 142653086453 := by decide +kernel

def row8 : EnvRow := ({ row08 with cap := cap08Tight } : Row).env

def row9 : EnvRow := ({ row09 with cap := cap09Tight } : Row).env

private def activeCellOK (c : EnvCell) : Bool := decide
  (0 ≤ c.θ ∧ c.θ ≤ 1 ∧ capVal row8 row9 c.θ c.lo c.hi ≤
    cap + min (1 - c.θ) c.θ * saving)

private theorem cells_ok :
    chainTo EnvCell.lo EnvCell.hi 0 (9 / 10) envCellsTight = true ∧
    envCellsTight.all (fun c ↦ envCellOKPure envRowsTight massS cap c || activeCellOK c) = true := by
  decide +kernel

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
variable {V t : ℝ} {Qh v : E}

private theorem mix_bound (a b : EnvRow) (c : EnvCell) (d₁ d₂ : ℝ)
    (hv : ‖v‖ ^ 2 = 2) (hθ0 : (0 : ℝ) ≤ c.θ) (hθ1 : (c.θ : ℝ) ≤ 1)
    (hlo : (c.lo : ℝ) ≤ t) (hhi : t ≤ c.hi)
    (ha : RowHolds ε a.ell a.beta ((a.C : ℝ) - d₁) V t Qh v)
    (hb : RowHolds ε b.ell b.beta ((b.C : ℝ) - d₂) V t Qh v) :
    V + (1 - c.θ) * d₁ + c.θ * d₂ ≤ (capVal a b c.θ c.lo c.hi : ℝ) := by
  have he : (0 : ℝ) < ε := by norm_num [ε]
  have mixed := (RowHolds.mix he hv ha hb c.θ hθ0 hθ1).le he.le
  have upper := quadVal_le_quadMax
    ((1 - c.θ) * a.C + c.θ * b.C - 2 * (1 - c.θ) * c.θ * (a.beta - b.beta) ^ 2 / ε)
    (-2 * ((1 - c.θ) * a.ell + c.θ * b.ell)) 1 c.lo c.hi t hlo hhi
  unfold capVal
  refine le_trans ?_ upper
  push_cast
  convert add_le_add_right mixed ((1 - (c.θ : ℝ)) * d₁ + c.θ * d₂) using 1 <;> ring

/-- The 38 tightened cells cap every profile with the common row deductions. -/
theorem profile_bound (hv : ‖v‖ ^ 2 = 2) (ht0 : 0 ≤ t) (ht1 : t ≤ 9 / 10)
    (hrows : ∀ k m a, envRowAtPure envRowsTight massS m k = some a → RowOf a V t Qh v)
    (hsave : ∃ d8 d9 : ℝ, 0 ≤ d8 ∧ 0 ≤ d9 ∧ (saving : ℝ) ≤ d8 + d9 ∧
      RowHolds ε row8.ell row8.beta ((row8.C : ℝ) - d8) V t Qh v ∧
      RowHolds ε row9.ell row9.beta ((row9.C : ℝ) - d9) V t Qh v) : V ≤ (cap : ℝ) := by
  obtain ⟨c, hc, hlo, hhi⟩ := chainTo_sound EnvCell.lo EnvCell.hi _ 0 (9 / 10) cells_ok.1 t
    (by simpa using ht0) (by push_cast; linarith)
  rcases Bool.or_eq_true_iff.mp (List.all_eq_true.mp cells_ok.2 c hc) with plain | active
  · unfold envCellOKPure at plain
    cases ha : envRowAtPure envRowsTight massS ((c.lo + c.hi) / 2) c.i with
    | none => simp [ha] at plain
    | some a =>
      cases hb : envRowAtPure envRowsTight massS ((c.lo + c.hi) / 2) c.j with
      | none => simp [ha, hb] at plain
      | some b =>
        simp only [ha, hb, decide_eq_true_eq] at plain
        obtain ⟨h0, h1, hcap⟩ := plain
        have bound := mix_bound a b c 0 0 hv (by exact_mod_cast h0) (by exact_mod_cast h1)
          hlo hhi (by simpa only [RowOf, sub_zero] using hrows _ _ _ ha)
          (by simpa only [RowOf, sub_zero] using hrows _ _ _ hb)
        exact (by simpa only [mul_zero, add_zero] using bound : V ≤ _).trans
          ((Rat.cast_le (K := ℝ)).mpr hcap)
  · obtain ⟨h0, h1, hcap⟩ := of_decide_eq_true active
    obtain ⟨d8, d9, hd8, hd9, hsum, H8, H9⟩ := hsave
    have z : (0 : ℝ) ≤ c.θ := by exact_mod_cast h0
    have o : (c.θ : ℝ) ≤ 1 := by exact_mod_cast h1
    have mixed := mix_bound row8 row9 c d8 d9 hv z o hlo hhi H8 H9
    have hj := mul_le_mul_of_nonneg_left hsum (le_min (sub_nonneg.mpr o) z)
    have h₈ := mul_le_mul_of_nonneg_right (min_le_left (1 - (c.θ : ℝ)) (c.θ : ℝ)) hd8
    have h₉ := mul_le_mul_of_nonneg_right (min_le_right (1 - (c.θ : ℝ)) (c.θ : ℝ)) hd9
    have realCap := (Rat.cast_le (K := ℝ)).mpr hcap
    push_cast at realCap
    linarith only [mixed, hj, h₈, h₉, realCap]

end Grothe.Lower.TightShared
