import Grothe.Lower.Envelope

/-!
# Pure structured envelope checker (`decide +kernel`)

A string-free counterpart of `Grothe.Lower.checkEnv` operating directly on `List EnvRow` and
`List EnvCell`, so that compact tightened envelopes can be verified by proof-producing kernel
reduction (`decide +kernel`) with zero `native_decide` axioms.
-/

namespace Grothe.Lower

open LowerAnalytic

/-- Scalar row lookup in a pure `List EnvRow`: `0` is the mass tangent at `m`, `k + 1` is `rows[k]?`. -/
def envRowAtPure (rows : List EnvRow) (S m : ℚ) : ℕ → Option EnvRow
  | 0 => some (massTangent S m)
  | k + 1 => rows[k]?

/-- Check that one structured `EnvCell` is bounded by `B` against `rows` and `massTangent S`. -/
def envCellOKPure (rows : List EnvRow) (S B : ℚ) (c : EnvCell) : Bool :=
  match envRowAtPure rows S ((c.lo + c.hi) / 2) c.i, envRowAtPure rows S ((c.lo + c.hi) / 2) c.j with
  | some a, some b => decide (0 ≤ c.θ ∧ c.θ ≤ 1 ∧ capVal a b c.θ c.lo c.hi ≤ B)
  | _, _ => false

/-- Check that `cells` form a contiguous chain covering `[0, 9/10]` with every cell bounded by `B`. -/
def checkEnvPure (rows : List EnvRow) (S B : ℚ) (cells : List EnvCell) : Bool :=
  chainTo EnvCell.lo EnvCell.hi 0 (9 / 10) cells && cells.all (envCellOKPure rows S B)

/-- **Soundness of `checkEnvPure`**: if every scalar row of `rows` and every mass tangent holds,
then `V ≤ B` for every `t ∈ [0, 9/10]`. -/
theorem envPure_bound {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (rows : List EnvRow) (S B : ℚ) (cells : List EnvCell) (h : checkEnvPure rows S B cells = true)
    {V t : ℝ} {Qh v : E} (hv : ‖v‖ ^ 2 = 2) (ht0 : 0 ≤ t) (ht1 : t ≤ 9 / 10)
    (hscal : ∀ k m a, envRowAtPure rows S m k = some a → RowOf a V t Qh v) : V ≤ B := by
  have hε : (0 : ℝ) < ε := by norm_num [ε]
  simp only [checkEnvPure, Bool.and_eq_true, List.all_eq_true] at h
  obtain ⟨c, hc, hlo, hhi⟩ :=
    chainTo_sound EnvCell.lo EnvCell.hi _ 0 (9 / 10) h.1 t (by simpa using ht0) (by push_cast; linarith)
  have hok := h.2 c hc
  unfold envCellOKPure at hok
  cases ha : envRowAtPure rows S ((c.lo + c.hi) / 2) c.i with
  | none => simp [ha] at hok
  | some A =>
  cases hb : envRowAtPure rows S ((c.lo + c.hi) / 2) c.j with
  | none => simp [ha, hb] at hok
  | some C =>
  simp only [ha, hb, decide_eq_true_eq] at hok
  obtain ⟨hθ0, hθ1, hval⟩ := hok
  have h1 := (RowHolds.mix hε hv (hscal _ _ _ ha) (hscal _ _ _ hb) c.θ (by exact_mod_cast hθ0)
    (by exact_mod_cast hθ1)).le hε.le
  have hq := quadVal_le_quadMax
    ((1 - c.θ) * A.C + c.θ * C.C - 2 * (1 - c.θ) * c.θ * (A.beta - C.beta) ^ 2 / ε)
    (-2 * ((1 - c.θ) * A.ell + c.θ * C.ell)) 1 c.lo c.hi t hlo hhi
  have hB : ((capVal A C c.θ c.lo c.hi : ℚ) : ℝ) ≤ B := by exact_mod_cast hval
  unfold capVal at hB
  refine le_trans (le_trans (le_of_le_of_eq h1 ?_) hq) hB
  push_cast
  ring

end Grothe.Lower
