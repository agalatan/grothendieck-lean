import Grothe.Lower.EnvelopeData
import Grothe.Lower.ProfileCheck
import Grothe.Lower.Endpoint

/-!
# The scalar envelope certificate

`envelope_check` runs the exact scalar checker on the 28 rows and 31 leaves covering
`[0, 9/10]` against the cap `B = 7138283181/10000000000`; `envelope_bound_data` is the resulting
conditional theorem `V ≤ B`.  `envRows_virtual` links the 18 virtual rows to the certified
coupled profiles and `envRows_crude` checks the crude row `(0, 0, ερ²)`; the nine source rows
(`H0.*`) carry the caps of the source moment covers, which are data (not re-verified here).
-/

namespace Grothe.Lower

theorem envelope_check : checkEnvelope envRows envLeaves Bcap = true := by native_decide

theorem envRows_length : envRows.length = 28 := by decide

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

/-- Each virtual row `virtual_k` is `(ℓ, β, cap)` of the `k`-th certified coupled profile. -/
theorem envRows_virtual :
    (List.range 18).all (fun k =>
      (List.range 28).any (fun idx =>
        envRowNames.getD idx "" == s!"virtual_{k}" &&
        envRows.getD idx ⟨0, 0, 0⟩ ==
          ⟨(vrecords.getD k dfltRecord).ell, (vrecords.getD k dfltRecord).beta,
            (vrecords.getD k dfltRecord).cap⟩)) = true := by native_decide

/-- Each source row `H0.*` has the `(ℓ, β)` of the corresponding source profile; its cap is
data from the source moment cover. -/
theorem envRows_source :
    srcProfiles.all (fun p =>
      (List.range 28).any (fun idx =>
        envRowNames.getD idx "" == p.id &&
        (envRows.getD idx ⟨0, 0, 0⟩).ell == p.ell &&
        (envRows.getD idx ⟨0, 0, 0⟩).beta == p.beta)) = true := by native_decide

end Grothe.Lower
