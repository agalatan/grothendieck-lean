import Grothe.Lower.EnvelopeDataV2
import Grothe.Lower.EnvelopeCheck
import Grothe.Lower.ProfileCheckV2
import Grothe.Lower.EndpointV2

/-!
# Instantiation of the envelope checker, version 2

`envelope_checkV2` runs the exact scalar checker on the 28 rows and 31 leaves of
`handoff/lower-import/envelope.json` against the cap `B = 7138283181/10000000000`.
`envelope_bound_dataV2` is the resulting conditional theorem.  `envRowsV2_virtual` links the
18 virtual rows to the certified version-2 records, `envRowsV2_crude` checks the crude row;
the nine old rows (`H0.*`) carry caps from the base moment cover, which is **not re-verified
here** (documented data).
-/

namespace Grothe.Lower

theorem envelope_checkV2 : checkEnvelope envRowsV2 envLeavesV2 BcapV2 = true := by native_decide

theorem envRowsV2_length : envRowsV2.length = 28 := by decide

/-- **The version-2 scalar envelope bound** for the certificate rows. -/
theorem envelope_bound_dataV2 (t V : ℝ) (ht0 : 0 ≤ t) (ht1 : t ≤ 9 / 10)
    (hmix : ∀ i j : ℕ, i < envRowsV2.length → j < envRowsV2.length → ∀ θ : ℝ, 0 ≤ θ → θ ≤ 1 →
      V ≤ (1 - θ) * F (envRowsV2.getD i ⟨0, 0, 0⟩) t + θ * F (envRowsV2.getD j ⟨0, 0, 0⟩) t
        - (2 / (ε : ℝ)) * θ * (1 - θ) *
            ((envRowsV2.getD i ⟨0, 0, 0⟩).beta - (envRowsV2.getD j ⟨0, 0, 0⟩).beta) ^ 2) :
    V ≤ BcapV2 :=
  envelope_bound envRowsV2 envLeavesV2 BcapV2 envelope_checkV2 t V ht0 ht1 hmix

/-- The crude row is `(0, 0, ε ρ²)`. -/
theorem envRowsV2_crude : envRowsV2.getD 0 ⟨0, 0, 0⟩ = ⟨0, 0, ε * ρ ^ 2⟩ ∧
    envRowNamesV2.getD 0 "" = "crude" := by native_decide

/-- Each virtual row `virtual_k` is `(ℓ, β, cap)` of the `k`-th certified version-2 record. -/
theorem envRowsV2_virtual :
    (List.range 18).all (fun k =>
      (List.range 28).any (fun idx =>
        envRowNamesV2.getD idx "" == s!"virtual_{k}" &&
        envRowsV2.getD idx ⟨0, 0, 0⟩ ==
          ⟨(vrecordsV2.getD k dfltRecord).ell, (vrecordsV2.getD k dfltRecord).beta,
            (vrecordsV2.getD k dfltRecord).cap⟩)) = true := by native_decide

/-- Each old row `H0.*` has the `(ℓ, β)` of the corresponding source profile; its cap is data
from the base moment cover. -/
theorem envRowsV2_old :
    srcProfiles.all (fun p =>
      (List.range 28).any (fun idx =>
        envRowNamesV2.getD idx "" == p.id &&
        (envRowsV2.getD idx ⟨0, 0, 0⟩).ell == p.ell &&
        (envRowsV2.getD idx ⟨0, 0, 0⟩).beta == p.beta)) = true := by native_decide

end Grothe.Lower
