import Grothe.Lower.Stein
import Grothe.Lower.Boxes
import Grothe.Lower.Endpoint

/-!
# From the Gaussian reduction of the rows to the norm cap

The Gaussian reduction of the witness `T = P₁,₀ − ε P₂,₁` for a fixed admissible pair produces
*one* residual `p = Q_w c₁` in the cubic chaos of the remote coordinates, with scale `τ = ‖p‖₂`
and normalized law `U = |p|²/τ²`, and *one* gate variable `X = Q_w(c₁, c_A, conj c_B)` whose
first coordinate is `p`; every row `r` then satisfies, with its own potential `Ψ_r` (node caps up
to `capPad`, convex, `smax`-Lipschitz) and its retained gate square,

  `V ≤ t² − 2ℓt + 2β²/ε + E Ψ_r(δ_r τ √U) − δ_r τ² − E[X*N_r X + 2 Re(conj p (g_r·X))]
       − ε ‖Qh + (β/ε) v‖²`

(`SharedReduction`, one law and one gate variable for all rows).  Completing the square over
`(X₂, X₃)` and the certified row cap give the scalar inequality of every row (`rowOf_of_shared`);
the regions and boxes of the certificate then bound `V` at every `(t, τ, x)` (`box_sound`).
`checkCert` collects all exact checks, and `lower_bound_main` combines them into `V ≤ B`.
-/

open MeasureTheory

namespace Grothe.Lower

open LowerAnalytic

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- **The simultaneous Gaussian reduction of the rows**: one probability space with one normalized
law `U` (moment bounds and the inputs of the Stein cuts), one scale `0 ≤ τ ≤ ρ` and one gate
variable `X = (X₁, X₂, X₃)` with `|X₁|² = τ² U` (its first coordinate is the residual), such that
every row satisfies its inequality with its own potential and the retained gate square
(`RowShared`). -/
def SharedReduction (rows : List Row) (V t : ℝ) (Qh v : E) : Prop :=
  ∃ (Ω : Type) (_ : MeasurableSpace Ω) (μ : Measure Ω) (_ : IsProbabilityMeasure μ)
    (U : Ω → ℝ) (X1 X2 X3 : Ω → ℂ) (τ x : ℝ),
    Moments μ U x ∧ SteinInputs μ U ∧ 0 ≤ τ ∧ τ ≤ ρ ∧ (∀ ω, ‖X1 ω‖ ^ 2 = τ ^ 2 * U ω) ∧
    ∀ r ∈ rows, RowShared r μ U X1 X2 X3 τ V t Qh v

/-- **A certified row holds in the shared reduction**: completing the gate square with its first
coordinate fixed costs `gatePrice · τ² ≥ (κδ² − δ) τ²`, and the certified row bound at
`σ = δτ ≤ δρ` gives `V ≤ t² − 2ℓt + 2β²/ε + cap + capPad − ε‖Qh + (β/ε)v‖²`. -/
theorem rowOf_of_shared (r : Row) (hr : checkRow r = true) {Ω : Type} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ] {U : Ω → ℝ} {X1 X2 X3 : Ω → ℂ} {τ x : ℝ}
    (hM : Moments μ U x) (hS : SteinCut μ U) (hτ0 : 0 ≤ τ) (hτ1 : τ ≤ ρ)
    (hX : ∀ ω, ‖X1 ω‖ ^ 2 = τ ^ 2 * U ω) {V t : ℝ} {Qh v : E}
    (h : RowShared r μ U X1 X2 X3 τ V t Qh v) : RowOf r.env V t Qh v := by
  obtain ⟨Ψ, hΨ, hf, hg, hV⟩ := h
  have hb := rowBound_of_check r hr
  simp only [checkRow, Bool.and_eq_true, decide_eq_true_eq] at hr
  obtain ⟨⟨⟨⟨⟨hδ, hok⟩, hκ⟩, -⟩, -⟩, -⟩ := hr
  have hδR : (0 : ℝ) ≤ r.delta := by exact_mod_cast hδ.le
  have hG : (gatePrice r.N r.g1 r.g2 r.g3 : ℝ) * τ ^ 2 ≤ ∫ ω, r.gate (X1 ω) (X2 ω) (X3 ω) ∂μ :=
    gate_integral_ge r.N r.g1 r.g2 r.g3 hok X1 X2 X3 τ hX hM hg
  have hκR : (r.kappa : ℝ) * r.delta ^ 2 ≤ r.delta + gatePrice r.N r.g1 r.g2 r.g3 := by
    exact_mod_cast hκ
  have hbd := hb Ω μ U x (fun s => Ψ s - capPad) (r.delta * τ) hM hS hΨ (mul_nonneg hδR hτ0)
    (mul_le_mul_of_nonneg_left hτ1 hδR) (hf.sub (integrable_const _))
  rw [integral_sub hf (integrable_const _), integral_const, probReal_univ, one_smul] at hbd
  have hsq := mul_nonneg (sub_nonneg.2 hκR) (sq_nonneg τ)
  unfold RowOf RowHolds Row.env
  push_cast
  nlinarith [hV, hG, hsq, hbd]

/-- **All exact checks of the certificate**: the rows, the batches of mixed node certificates,
and the regions of boxes covering `[0, 9/10]` against the bound `B` (the three in parallel). -/
def checkCert (rows : List Row) (batches : List JBatch) (regions : List Region) : Bool :=
  let r := Task.spawn fun _ => allPar checkRow rows
  let b := Task.spawn fun _ => allPar (checkBatch rows) batches
  let c := Task.spawn fun _ => checkCover rows batches Bcap regions
  r.get && b.get && c.get

lemma checkCert_eq (rows : List Row) (batches : List JBatch) (regions : List Region) :
    checkCert rows batches regions
      = (rows.all checkRow && batches.all (checkBatch rows)
        && checkCover rows batches Bcap regions) := by
  simp only [← allPar_eq]
  rfl

/-- **Main lower-bound theorem (finite layer).**  Under the retained-square inequality of the
crude row and the simultaneous Gaussian reduction of the certified rows, every admissible `(V, t)`
satisfies `V ≤ B`: the point `(t, τ, x)` lies in a box of the cover, and the box bounds `V`; with
the Gaussian transfer `K_G^ℂ ≥ 1/B` this is `K_G^ℂ > 1.40168487551` (`lower_endpoint`). -/
theorem lower_bound_main (rows : List Row) (batches : List JBatch) (regions : List Region)
    (hcert : checkCert rows batches regions = true)
    (V t : ℝ) (Qh v : E) (hv : ‖v‖ ^ 2 = 2) (ht0 : 0 ≤ t) (ht1 : t ≤ 9 / 10)
    (hcrude : RowOf crudeRow V t Qh v) (hred : SharedReduction rows V t Qh v) : V ≤ Bcap := by
  obtain ⟨Ω, _, μ, _, U, X1, X2, X3, τ, x, hM, hSI, hτ0, hτ1, hX, hshared⟩ := hred
  have hS : SteinCut μ U := steinCut_of_inputs μ hM hSI
  simp only [checkCert_eq, Bool.and_eq_true, List.all_eq_true] at hcert
  obtain ⟨⟨hrows, hbatches⟩, hcover⟩ := hcert
  have hscal : ∀ k a, envRowAt rows k = some a → RowOf a V t Qh v := by
    rintro (_ | k) a h
    · cases h; exact hcrude
    · obtain ⟨r, hr, rfl⟩ := Option.map_eq_some_iff.1 h
      have hm := List.mem_of_getElem? hr
      exact rowOf_of_shared r (hrows r hm) hM hS hτ0 hτ1 hX (hshared r hm)
  obtain ⟨b, hb, h1, h2, h3, h4, h5, h6⟩ :=
    cover_sound rows batches Bcap regions hcover t τ x ht0 ht1 hτ0 hτ1 hM.x0 hM.x1
  unfold boxOK at hb
  cases hbb : boxBound rows batches b with
  | none => simp [hbb] at hb
  | some val =>
    simp only [hbb, decide_eq_true_eq] at hb
    exact (box_sound rows batches hrows hbatches b val hbb X1 X2 X3 τ hX hM hS V t Qh v hv hshared
      hscal ⟨h1, h2⟩ ⟨h3, h4⟩ ⟨h5, h6⟩).trans (by exact_mod_cast hb)

end Grothe.Lower
