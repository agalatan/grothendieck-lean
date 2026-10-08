import Grothe.Lower.EnvelopeData
import Grothe.Lower.ProfileCheck
import Grothe.Lower.Endpoint

/-!
# Instantiation of the envelope checker

`envelope_check` runs the exact scalar checker on the 31 rows and 20 leaves against the cap
`B = 3569353321/5000000000`.  `envelope_bound_data` is the resulting conditional theorem.
`envRows_virtual` links the 21 virtual rows to the certified records, `envRows_crude` checks
the crude row; the nine old rows (`H0.*`) carry caps from the base moment cover, which is
**not re-verified here** (documented data).
-/

namespace Grothe.Lower

/-- Default record for `getD`. -/
def dfltRecord : VRecord := ⟨0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, dfltGate, ""⟩

theorem envelope_check : checkEnvelope envRows envLeaves Bcap = true := by native_decide

theorem envRows_length : envRows.length = 31 := by decide

/-- **The scalar envelope bound** for the certificate rows. -/
theorem envelope_bound_data (t V : ℝ) (ht0 : 0 ≤ t) (ht1 : t ≤ 9 / 10)
    (hmix : ∀ i j : ℕ, i < envRows.length → j < envRows.length → ∀ θ : ℝ, 0 ≤ θ → θ ≤ 1 →
      V ≤ (1 - θ) * F (envRows.getD i ⟨0, 0, 0⟩) t + θ * F (envRows.getD j ⟨0, 0, 0⟩) t
        - (2 / (ε : ℝ)) * θ * (1 - θ) *
            ((envRows.getD i ⟨0, 0, 0⟩).beta - (envRows.getD j ⟨0, 0, 0⟩).beta) ^ 2) :
    V ≤ Bcap :=
  envelope_bound envRows envLeaves Bcap envelope_check t V ht0 ht1 hmix

/-- The crude row is `(0, 0, ε ρ²)`. -/
theorem envRows_crude : envRows.getD 0 ⟨0, 0, 0⟩ = ⟨0, 0, ε * ρ ^ 2⟩ ∧
    envRowNames.getD 0 "" = "crude" := by native_decide

/-- Each virtual row `virtual_k` is `(ℓ, β, cap)` of the `k`-th certified record. -/
theorem envRows_virtual :
    (List.range 21).all (fun k =>
      (List.range 31).any (fun idx =>
        envRowNames.getD idx "" == s!"virtual_{k}" &&
        envRows.getD idx ⟨0, 0, 0⟩ ==
          ⟨(vrecords.getD k dfltRecord).ell, (vrecords.getD k dfltRecord).beta,
            (vrecords.getD k dfltRecord).cap⟩)) = true := by native_decide

/-- Each old row `H0.*` has the `(ℓ, β)` of the corresponding source profile; its cap is data
from the base moment cover. -/
theorem envRows_old :
    srcProfiles.all (fun p =>
      (List.range 31).any (fun idx =>
        envRowNames.getD idx "" == p.id &&
        (envRows.getD idx ⟨0, 0, 0⟩).ell == p.ell &&
        (envRows.getD idx ⟨0, 0, 0⟩).beta == p.beta)) = true := by native_decide

end Grothe.Lower
