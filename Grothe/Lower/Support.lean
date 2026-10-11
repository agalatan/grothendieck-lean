import Grothe.Lower.Rows
import Grothe.Lower.Stein
import Grothe.Lower.Envelope
import Grothe.Lower.Endpoint
import Grothe.LowerAnalytic.Rows

/-!
# From the Gaussian reduction of the rows to the norm cap

For a row of the certificate the Gaussian reduction of the witness `T = P₁,₀ − ε P₂,₁` provides
(`RowReduction`) a residual `q` in the cubic chaos of remote coordinates with `σ = ‖q‖₂ ≤ δρ`
and

  `V ≤ t² − 2ℓt + 2β²/ε + E Ψ(|q|) − κσ² − ε ‖Qh + (β/ε) v‖²`,

where `Ψ` is the potential of the row (with coupling `e₁ + b`), known through its node caps
(up to the slack `capPad`), its convexity and its Lipschitz constant, and where the law of
`U = |q|²/σ²` satisfies the moment bounds (`Moments`) and the analytic inputs of the Stein cuts
(`SteinInputs`: the fluctuation bound and the radial integration by parts).
`row_valid` combines this with the certified bound `RowBound` into the retained-square
inequality of the row with `C = 2β²/ε + cap + capPad`, and `lower_bound_main` combines the rows
(and the crude row `(0, 0, ερ²)`) with the scalar envelope check into `V ≤ B`.
-/

open MeasureTheory

namespace Grothe.Lower

open LowerAnalytic

/-- The envelope row of a certified row. -/
def Row.env (r : Row) : EnvRow := ⟨r.ell, r.beta, 2 * r.beta ^ 2 / ε + r.cap + capPad⟩

/-- The crude row `(0, 0, ερ²)`. -/
def crudeRow : EnvRow := ⟨0, 0, ε * ρ ^ 2⟩

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- The retained-square inequality of an `EnvRow` at `ε`. -/
def RowOf (row : EnvRow) (V t : ℝ) (Qh v : E) : Prop :=
  RowHolds (ε : ℝ) row.ell row.beta row.C V t Qh v

/-- **The Gaussian reduction of a row**: there are a law of the normalized residual
(`U = |q|²/σ²` on a probability space) with the moment bounds and the inputs of the Stein cuts, a potential
`Ψ` with the node caps of the row up to `capPad` (convex, `smax`-Lipschitz), and a scale
`0 ≤ σ ≤ δρ`, such that `V` is bounded by the reduced expression with the price `κσ²`. -/
def RowReduction (r : Row) (V t : ℝ) (Qh v : E) : Prop :=
  ∃ (Ω : Type) (_ : MeasurableSpace Ω) (μ : Measure Ω) (_ : IsProbabilityMeasure μ)
    (U : Ω → ℝ) (Ψ : ℝ → ℝ) (σ x : ℝ),
    Moments μ U x ∧ SteinInputs μ U ∧ CapsHold (fun s => Ψ s - capPad) r.nodeList r.smax ∧
    0 ≤ σ ∧ σ ≤ r.delta * ρ ∧ Integrable (fun ω => Ψ (σ * √(U ω))) μ ∧
    V ≤ t ^ 2 - 2 * r.ell * t + 2 * r.beta ^ 2 / ε + ∫ ω, Ψ (σ * √(U ω)) ∂μ - r.kappa * σ ^ 2
      - ε * ‖Qh + ((r.beta : ℝ) / ε) • v‖ ^ 2

/-- **A certified row holds** given its Gaussian reduction. -/
theorem row_valid (r : Row) (hb : RowBound r) (V t : ℝ) (Qh v : E)
    (h : RowReduction r V t Qh v) : RowOf r.env V t Qh v := by
  obtain ⟨Ω, _, μ, _, U, Ψ, σ, x, hM, hS, hΨ, h0, h1, hf, hV⟩ := h
  have hf' : Integrable (fun ω => Ψ (σ * √(U ω)) - capPad) μ := hf.sub (integrable_const _)
  have hbd := hb Ω μ U x (fun s => Ψ s - capPad) σ hM (steinCut_of_inputs μ hM hS) hΨ h0 h1
    hf'
  have e : ∫ ω, (Ψ (σ * √(U ω)) - capPad) ∂μ = ∫ ω, Ψ (σ * √(U ω)) ∂μ - capPad := by
    rw [integral_sub hf (integrable_const _), integral_const, probReal_univ, one_smul]
  rw [e] at hbd
  unfold RowOf RowHolds Row.env
  push_cast
  linarith

/-- **Main lower-bound theorem (finite layer).**  Under the retained-square inequality of the
crude row and the Gaussian reductions of the certified rows, every admissible `(V, t)` satisfies
`V ≤ B`; with the Gaussian transfer `K_G^ℂ ≥ 1/B` this is `K_G^ℂ > 1.40148809`
(`lower_endpoint`). -/
theorem lower_bound_main (rows : List Row) (models : List EnvModel) (cells : List EnvCell)
    (hrows : rows.all checkRow = true)
    (henv : checkEnvelope (crudeRow :: rows.map Row.env) models cells Bcap = true)
    (V t : ℝ) (Qh v : E) (hv : ‖v‖ ^ 2 = 2) (ht0 : 0 ≤ t) (ht1 : t ≤ 9 / 10)
    (hcrude : RowOf crudeRow V t Qh v)
    (hred : ∀ r ∈ rows, RowReduction r V t Qh v) : V ≤ Bcap := by
  refine envelope_bound (crudeRow :: rows.map Row.env) models cells Bcap henv t V ht0 ht1 ?_
  intro i j hi hj θ hθ0 hθ1
  have hε : (0 : ℝ) < ε := by norm_num [ε]
  have hmem : ∀ k, k < (crudeRow :: rows.map Row.env).length →
      RowOf ((crudeRow :: rows.map Row.env).getD k dfltRow) V t Qh v := by
    intro k hk
    rcases List.mem_cons.1 (getD_mem_of_lt _ dfltRow k hk) with h | h
    · rw [h]; exact hcrude
    · obtain ⟨r, hr, hre⟩ := List.mem_map.1 h
      rw [← hre]
      exact row_valid r (rowBound_of_check r (List.all_eq_true.1 hrows r hr)).2 V t Qh v
        (hred r hr)
  have := rowHolds_mix (ε : ℝ) _ _ _ _ _ _ V t hε Qh v hv (hmem i hi) (hmem j hj) θ hθ0 hθ1
  simpa only [F] using this

end Grothe.Lower
