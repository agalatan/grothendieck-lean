import Grothe.Lower.EnvelopeData
import Grothe.Lower.PointwiseCheck
import Grothe.Lower.Endpoint
import Grothe.LowerAnalytic.Rows

/-!
# The support rows at the common witness parameter and the scalar envelope

* `baseRows_virtual` links the 18 coupled rows of `baseRows` (at `ε₀`) to the certified coupled
  profiles; `baseRows_crude` checks the crude row `(0, 0, ε₀ρ²)`; the nine source rows carry the
  caps of the source moment covers (data).
* `envRows_check` verifies, by exact arithmetic, that every row of `envRows` (at `ε`) is obtained
  from its provenance: the transfer of a base row from `ε₀` to `ε`, or the dilation of a certified
  pointwise profile by its `scale` followed by the transfer from `scale · ε₀` to `ε` — with the
  cap rounded upward.  `envRows_valid` turns this into the real statement: from the row
  inequalities of the base rows and of the dilated pointwise profiles, all 47 rows hold at `ε`.
* `envelope_check` runs the fixed-mixture envelope checker against `B`; `lower_envelope` is the
  resulting theorem `V ≤ B` from the row inequalities.
-/

namespace Grothe.Lower

open LowerAnalytic

/-! ### Rows at `ε₀` -/

theorem baseRows_length : baseRows.length = 28 := by decide

theorem baseRows_crude : baseRows.getD 0 dfltRow = ⟨0, 0, ε₀ * ρ ^ 2⟩ ∧
    baseRowNames.getD 0 "" = "crude" := by native_decide

/-- Each coupled row `virtual_k` of `baseRows` is `(ℓ, β, cap)` of the `k`-th certified coupled
profile. -/
theorem baseRows_virtual :
    (List.range 18).all (fun k =>
      (List.range 28).any (fun idx =>
        baseRowNames.getD idx "" == s!"virtual_{k}" &&
        baseRows.getD idx dfltRow ==
          ⟨(vrecords.getD k dfltRecord).ell, (vrecords.getD k dfltRecord).beta,
            (vrecords.getD k dfltRecord).cap⟩)) = true := by native_decide

/-- Each source row `H0.*` has the `(ℓ, β)` of the corresponding source profile. -/
theorem baseRows_source :
    srcProfiles.all (fun p =>
      (List.range 28).any (fun idx =>
        baseRowNames.getD idx "" == p.id &&
        (baseRows.getD idx dfltRow).ell == p.ell &&
        (baseRows.getD idx dfltRow).beta == p.beta)) = true := by native_decide

/-! ### Rows at `ε` from their provenance -/

/-- The transferred cap `C + (ε_b − εₐ) ρ² + 2β² (1/ε_b − 1/εₐ)`. -/
def transferC (εa εb beta C : ℚ) : ℚ := C + (εb - εa) * ρ ^ 2 + 2 * beta ^ 2 * (1 / εb - 1 / εa)

def dfltPw : PwRecord :=
  ⟨"", 0, 0, 0, 0, 0, 0, 0, 0, ⟨0, 0, 0, 0, 0, 0⟩, ⟨0, 0, 0⟩, 0, 0, 0, "", "", 0, "", [], "", [],
    dfltGate, 0, dfltGate⟩

/-- Exact check of one row against its provenance. -/
def checkProv (k : ℕ) : Bool :=
  let row := envRows.getD k dfltRow
  let pv := envProv.getD k (0, 0)
  if pv.1 = 0 then
    let b := baseRows.getD pv.2 dfltRow
    decide (pv.2 < baseRows.length) && (row.ell == b.ell) && (row.beta == b.beta) &&
    decide (transferC ε₀ ε b.beta b.C ≤ row.C)
  else
    let r := pwRecords.getD pv.2 dfltPw
    decide (pv.2 < pwRecords.length) && (row.ell == r.scale * r.ell) &&
    (row.beta == r.scale * r.beta) &&
    decide (transferC (r.scale * ε₀) ε (r.scale * r.beta) (r.scale * r.cap) ≤ row.C)

theorem envRows_length : envRows.length = 47 ∧ envProv.length = 47 := by decide

theorem envRows_check : (List.range 47).all checkProv = true := by native_decide

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- The row inequality of an `EnvRow`. -/
def RowOf (eps : ℚ) (row : EnvRow) (V t : ℝ) (Qh v : E) : Prop :=
  RowHolds (eps : ℝ) row.ell row.beta row.C V t Qh v

/-- **All 47 support rows hold at `ε`** given the base rows at `ε₀` and the dilated pointwise
profiles at `scale · ε₀`. -/
theorem envRows_valid (V t : ℝ) (Qh v : E) (hv : ‖v‖ ^ 2 = 2) (hQ : ‖Qh‖ ^ 2 ≤ (ρ : ℝ) ^ 2)
    (hbase : ∀ k, k < baseRows.length → RowOf ε₀ (baseRows.getD k dfltRow) V t Qh v)
    (hpw : ∀ k, k < pwRecords.length →
      let r := pwRecords.getD k dfltPw
      RowHolds ((r.scale * ε₀ : ℚ) : ℝ) ((r.scale * r.ell : ℚ) : ℝ) ((r.scale * r.beta : ℚ) : ℝ)
        ((r.scale * r.cap : ℚ) : ℝ) V t Qh v) :
    ∀ k, k < envRows.length → RowOf ε (envRows.getD k dfltRow) V t Qh v := by
  intro k hk
  have hk' : k < 47 := by rw [envRows_length.1] at hk; exact hk
  have hc := List.all_eq_true.1 envRows_check k (List.mem_range.2 hk')
  simp only [checkProv] at hc
  split_ifs at hc with hkind
  · simp only [Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at hc
    obtain ⟨⟨⟨hlt, hell⟩, hbeta⟩, hC⟩ := hc
    have hb := hbase _ hlt
    unfold RowOf at hb ⊢
    rw [hell, hbeta]
    have hε0 : (0 : ℝ) < ε₀ := by norm_num [ε₀]
    have hle : ((ε₀ : ℚ) : ℝ) ≤ ε := by norm_num [ε₀, ε]
    have ht := rowHolds_transfer _ _ _ _ _ V t (ρ : ℝ) hε0 hle Qh v hv hQ hb
    refine rowHolds_mono _ _ _ _ _ V t Qh v ht ?_
    have : ((transferC ε₀ ε (baseRows.getD (envProv.getD k (0, 0)).2 dfltRow).beta
        (baseRows.getD (envProv.getD k (0, 0)).2 dfltRow).C : ℚ) : ℝ)
        ≤ (envRows.getD k dfltRow).C := by exact_mod_cast hC
    simp only [transferC] at this
    push_cast at this
    linarith
  · simp only [Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at hc
    obtain ⟨⟨⟨hlt, hell⟩, hbeta⟩, hC⟩ := hc
    have hp := hpw _ hlt
    unfold RowOf
    rw [hell, hbeta]
    set r := pwRecords.getD (envProv.getD k (0, 0)).2 dfltPw with hr
    have hs := pwRecords_sound r (getD_mem_of_lt _ _ _ hlt)
    have hε0 : (0 : ℝ) < ((r.scale * ε₀ : ℚ) : ℝ) := by
      have : (1 : ℚ) ≤ r.scale := hs.scale_ge
      have : (0 : ℚ) < r.scale * ε₀ := by norm_num [ε₀]; linarith
      exact_mod_cast this
    have hle : ((r.scale * ε₀ : ℚ) : ℝ) ≤ ε := by exact_mod_cast hs.scale_le
    have ht := rowHolds_transfer _ _ _ _ _ V t (ρ : ℝ) hε0 hle Qh v hv hQ hp
    refine rowHolds_mono _ _ _ _ _ V t Qh v ht ?_
    have : ((transferC (r.scale * ε₀) ε (r.scale * r.beta) (r.scale * r.cap) : ℚ) : ℝ)
        ≤ (envRows.getD k dfltRow).C := by exact_mod_cast hC
    simp only [transferC] at this
    push_cast at this ⊢
    linarith

/-! ### The scalar envelope -/

theorem envelope_check : checkEnvelope envRows envModels envCells Bcap = true := by native_decide

/-- **The scalar envelope bound**: from the 47 row inequalities at `ε`, `V ≤ B`. -/
theorem lower_envelope (V t : ℝ) (Qh v : E) (hv : ‖v‖ ^ 2 = 2) (ht0 : 0 ≤ t) (ht1 : t ≤ 9 / 10)
    (hrows : ∀ k, k < envRows.length → RowOf ε (envRows.getD k dfltRow) V t Qh v) :
    V ≤ Bcap := by
  refine envelope_bound envRows envModels envCells Bcap envelope_check t V ht0 ht1 ?_
  intro i j hi hj θ hθ0 hθ1
  have hε : (0 : ℝ) < ε := by norm_num [ε]
  have := rowHolds_mix (ε : ℝ) _ _ _ _ _ _ V t hε Qh v hv (hrows i hi) (hrows j hj) θ hθ0 hθ1
  simpa only [F] using this

/-- **Main lower-bound theorem (finite layer).**  Under the retained-square inequalities of the
base rows at `ε₀` and of the dilated pointwise profiles, every admissible `(V, t)` satisfies
`V ≤ B`; with the Gaussian transfer `K_G^ℂ ≥ 1/B` this is `K_G^ℂ > 1.4009320536`
(`lower_endpoint`). -/
theorem lower_bound_main (V t : ℝ) (Qh v : E) (hv : ‖v‖ ^ 2 = 2) (hQ : ‖Qh‖ ^ 2 ≤ (ρ : ℝ) ^ 2)
    (ht0 : 0 ≤ t) (ht1 : t ≤ 9 / 10)
    (hbase : ∀ k, k < baseRows.length → RowOf ε₀ (baseRows.getD k dfltRow) V t Qh v)
    (hpw : ∀ k, k < pwRecords.length →
      let r := pwRecords.getD k dfltPw
      RowHolds ((r.scale * ε₀ : ℚ) : ℝ) ((r.scale * r.ell : ℚ) : ℝ) ((r.scale * r.beta : ℚ) : ℝ)
        ((r.scale * r.cap : ℚ) : ℝ) V t Qh v) :
    V ≤ Bcap :=
  lower_envelope V t Qh v hv ht0 ht1 (envRows_valid V t Qh v hv hQ hbase hpw)

end Grothe.Lower
