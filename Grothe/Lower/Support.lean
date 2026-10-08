import Grothe.Lower.Profiles
import Grothe.Lower.Envelope
import Grothe.Lower.Endpoint
import Grothe.LowerAnalytic.Rows

/-!
# Support rows at the common witness parameter and the scalar envelope

A *support row* `(ℓ, β, C)` at `ε` is the dilation of a certified profile by a factor
`scale ∈ [1, ε/ε₀]` (which multiplies `ℓ, β, δ, M_E, M_R` and the cap by `scale` and the witness
parameter `ε₀` by `scale`), followed by the transfer from `scale · ε₀` to `ε`
(`rowHolds_transfer`); the crude row `(0, 0, ε₀ρ²)` is transferred directly.  `checkRow`
verifies the identities, the cap and the matrix gates of the dilated profile; `rows_valid` turns
the row inequalities of the dilated profiles into the row inequalities at `ε`, and
`lower_bound_main` combines them with the scalar envelope check into `V ≤ B`.
-/

namespace Grothe.Lower

open LowerAnalytic

structure Row where
  crude : Bool
  prof : ℕ
  scale : ℚ
  ell : ℚ
  beta : ℚ
  C : ℚ
  /-- gates of the dilated profile at `scale · ε₀` -/
  gates : GateCert
  deriving Repr

def Row.env (r : Row) : EnvRow := ⟨r.ell, r.beta, r.C⟩

def dfltRowR : Row := ⟨true, 0, 1, 0, 0, 0, dfltGate⟩

/-- The transferred cap `C + (ε_b − εₐ) ρ² + 2β² (1/ε_b − 1/εₐ)`. -/
def transferC (εa εb beta C : ℚ) : ℚ := C + (εb - εa) * ρ ^ 2 + 2 * beta ^ 2 * (1 / εb - 1 / εa)

def checkRow (C : Ctx) (r : Row) : Bool :=
  if r.crude then (r.ell == 0) && (r.beta == 0) && decide (transferC ε₀ ε 0 (ε₀ * ρ ^ 2) ≤ r.C)
  else
    let p := C.prof r.prof
    decide (r.prof < C.profiles.length) && decide (1 ≤ r.scale) && decide (r.scale * ε₀ ≤ ε) &&
    (r.ell == r.scale * p.ell) && (r.beta == r.scale * p.beta) &&
    decide (transferC (r.scale * ε₀) ε r.beta (r.scale * p.cap) ≤ r.C) &&
    checkGates (r.scale * ε₀) (p.E.scale r.scale) (p.R.scale r.scale) (r.scale * p.delta) r.gates

/-- Everything the checker certifies about a row. -/
structure RowSound (C : Ctx) (r : Row) : Prop where
  crude_case : r.crude = true → r.ell = 0 ∧ r.beta = 0 ∧ transferC ε₀ ε 0 (ε₀ * ρ ^ 2) ≤ r.C
  prof_lt : r.crude = false → r.prof < C.profiles.length
  scale_ge : r.crude = false → 1 ≤ r.scale
  scale_le : r.crude = false → r.scale * ε₀ ≤ ε
  ell_eq : r.crude = false → r.ell = r.scale * (C.prof r.prof).ell
  beta_eq : r.crude = false → r.beta = r.scale * (C.prof r.prof).beta
  C_ge : r.crude = false →
    transferC (r.scale * ε₀) ε r.beta (r.scale * (C.prof r.prof).cap) ≤ r.C
  gates : r.crude = false → GateProp (r.scale * ε₀) ((C.prof r.prof).E.scale r.scale)
    ((C.prof r.prof).R.scale r.scale) (r.scale * (C.prof r.prof).delta)

theorem rowSound_of_check (C : Ctx) (r : Row) (h : checkRow C r = true) : RowSound C r := by
  unfold checkRow at h
  split_ifs at h with hc
  · simp only [Bool.and_eq_true, beq_iff_eq, decide_eq_true_eq] at h
    obtain ⟨⟨h1, h2⟩, h3⟩ := h
    exact ⟨fun _ => ⟨h1, h2, h3⟩, fun h' => absurd hc (by simp [h']), fun h' => absurd hc (by simp [h']),
      fun h' => absurd hc (by simp [h']), fun h' => absurd hc (by simp [h']),
      fun h' => absurd hc (by simp [h']), fun h' => absurd hc (by simp [h']),
      fun h' => absurd hc (by simp [h'])⟩
  · simp only [Bool.and_eq_true, beq_iff_eq, decide_eq_true_eq] at h
    obtain ⟨⟨⟨⟨⟨⟨h1, h2⟩, h3⟩, h4⟩, h5⟩, h6⟩, h7⟩ := h
    exact ⟨fun h' => absurd h' hc, fun _ => h1, fun _ => h2, fun _ => h3, fun _ => h4, fun _ => h5,
      fun _ => h6, fun _ => gateProp_of_check _ _ _ _ _ h7⟩

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- The row inequality of an `EnvRow`. -/
def RowOf (eps : ℚ) (row : EnvRow) (V t : ℝ) (Qh v : E) : Prop :=
  RowHolds (eps : ℝ) row.ell row.beta row.C V t Qh v

/-- The row inequality of a dilated profile at its own witness parameter `scale · ε₀`. -/
def ProfileRow (C : Ctx) (r : Row) (V t : ℝ) (Qh v : E) : Prop :=
  RowHolds ((r.scale * ε₀ : ℚ) : ℝ) ((r.scale * (C.prof r.prof).ell : ℚ) : ℝ)
    ((r.scale * (C.prof r.prof).beta : ℚ) : ℝ) ((r.scale * (C.prof r.prof).cap : ℚ) : ℝ) V t Qh v

lemma transferC_cast (εa εb beta C : ℚ) :
    ((transferC εa εb beta C : ℚ) : ℝ)
      = (C : ℝ) + ((εb : ℝ) - εa) * (ρ : ℝ) ^ 2 + 2 * (beta : ℝ) ^ 2 * (1 / εb - 1 / εa) := by
  simp [transferC]

/-- **A certified row holds at `ε`** given the row inequality of its profile. -/
theorem row_valid (C : Ctx) (r : Row) (hs : RowSound C r) (V t : ℝ) (Qh v : E)
    (hv : ‖v‖ ^ 2 = 2) (hQ : ‖Qh‖ ^ 2 ≤ (ρ : ℝ) ^ 2)
    (hcrude : RowHolds (ε₀ : ℝ) 0 0 ((ε₀ * ρ ^ 2 : ℚ) : ℝ) V t Qh v)
    (hprof : r.crude = false → ProfileRow C r V t Qh v) : RowOf ε r.env V t Qh v := by
  unfold RowOf Row.env
  cases hc : r.crude
  · have hp := hprof hc
    unfold ProfileRow at hp
    have hε0 : (0 : ℝ) < ((r.scale * ε₀ : ℚ) : ℝ) := by
      have : (0 : ℚ) < r.scale * ε₀ := mul_pos (by linarith [hs.scale_ge hc]) (by norm_num [ε₀])
      exact_mod_cast this
    have hle : ((r.scale * ε₀ : ℚ) : ℝ) ≤ ε := by exact_mod_cast hs.scale_le hc
    have ht := rowHolds_transfer _ _ _ _ _ V t (ρ : ℝ) hε0 hle Qh v hv hQ hp
    rw [hs.ell_eq hc, hs.beta_eq hc]
    refine rowHolds_mono _ _ _ _ _ V t Qh v ht ?_
    have := (Rat.cast_le (K := ℝ)).2 (hs.C_ge hc)
    rw [transferC_cast, hs.beta_eq hc] at this
    exact this
  · obtain ⟨h1, h2, h3⟩ := hs.crude_case hc
    rw [h1, h2]
    have hε0 : (0 : ℝ) < ε₀ := by norm_num [ε₀]
    have hle : ((ε₀ : ℚ) : ℝ) ≤ ε := by norm_num [ε₀, ε]
    have ht := rowHolds_transfer _ _ _ _ _ V t (ρ : ℝ) hε0 hle Qh v hv hQ hcrude
    have := (Rat.cast_le (K := ℝ)).2 h3
    rw [transferC_cast] at this
    push_cast at this ht ⊢
    exact rowHolds_mono _ _ _ _ _ V t Qh v ht this

/-- **All certified rows hold at `ε`.** -/
theorem rows_valid (C : Ctx) (rows : List Row) (hchk : rows.all (checkRow C) = true)
    (V t : ℝ) (Qh v : E) (hv : ‖v‖ ^ 2 = 2) (hQ : ‖Qh‖ ^ 2 ≤ (ρ : ℝ) ^ 2)
    (hcrude : RowHolds (ε₀ : ℝ) 0 0 ((ε₀ * ρ ^ 2 : ℚ) : ℝ) V t Qh v)
    (hprof : ∀ r ∈ rows, r.crude = false → ProfileRow C r V t Qh v) :
    ∀ r ∈ rows, RowOf ε r.env V t Qh v := fun r hr =>
  row_valid C r (rowSound_of_check C r (List.all_eq_true.1 hchk r hr)) V t Qh v hv hQ hcrude
    (hprof r hr)

/-- **The scalar envelope bound**: from the row inequalities at `ε`, `V ≤ B`. -/
theorem lower_envelope (rows : List Row) (models : List EnvModel) (cells : List EnvCell)
    (henv : checkEnvelope (rows.map Row.env) models cells Bcap = true)
    (V t : ℝ) (Qh v : E) (hv : ‖v‖ ^ 2 = 2) (ht0 : 0 ≤ t) (ht1 : t ≤ 9 / 10)
    (hrows : ∀ r ∈ rows, RowOf ε r.env V t Qh v) : V ≤ Bcap := by
  refine envelope_bound (rows.map Row.env) models cells Bcap henv t V ht0 ht1 ?_
  intro i j hi hj θ hθ0 hθ1
  have hε : (0 : ℝ) < ε := by norm_num [ε]
  have hmem : ∀ k, k < (rows.map Row.env).length →
      RowOf ε ((rows.map Row.env).getD k dfltRow) V t Qh v := by
    intro k hk
    obtain ⟨r, hr, hre⟩ := List.mem_map.1 (getD_mem_of_lt _ dfltRow k hk)
    rw [← hre]
    exact hrows r hr
  have := rowHolds_mix (ε : ℝ) _ _ _ _ _ _ V t hε Qh v hv (hmem i hi) (hmem j hj) θ hθ0 hθ1
  simpa only [F] using this

/-- **Main lower-bound theorem (finite layer).**  Under the row inequalities of the crude row
at `ε₀` and of the dilated certified profiles at their witness parameters, every admissible
`(V, t)` satisfies `V ≤ B`; with the Gaussian transfer `K_G^ℂ ≥ 1/B` this is
`K_G^ℂ > 1.4010028168` (`lower_endpoint`). -/
theorem lower_bound_main (C : Ctx) (rows : List Row) (models : List EnvModel)
    (cells : List EnvCell) (hrows : rows.all (checkRow C) = true)
    (henv : checkEnvelope (rows.map Row.env) models cells Bcap = true)
    (V t : ℝ) (Qh v : E) (hv : ‖v‖ ^ 2 = 2) (hQ : ‖Qh‖ ^ 2 ≤ (ρ : ℝ) ^ 2)
    (ht0 : 0 ≤ t) (ht1 : t ≤ 9 / 10)
    (hcrude : RowHolds (ε₀ : ℝ) 0 0 ((ε₀ * ρ ^ 2 : ℚ) : ℝ) V t Qh v)
    (hprof : ∀ r ∈ rows, r.crude = false → ProfileRow C r V t Qh v) : V ≤ Bcap :=
  lower_envelope rows models cells henv V t Qh v hv ht0 ht1
    (rows_valid C rows hrows V t Qh v hv hQ hcrude hprof)

end Grothe.Lower
