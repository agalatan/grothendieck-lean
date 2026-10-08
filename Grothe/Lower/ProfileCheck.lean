import Grothe.Lower.ProfileData

/-!
# The coupled-profile certificate

`vrecords_check` evaluates the exact checker on all 18 coupled profiles (10,218 rectangle
leaves) by `native_decide`; `vrecords_sound` is the resulting `RecordSound` statement for each
record: matrix gates, allocation identities, complete dyadic cover of `[0, ρ] × [0, 31/4]`, and
the cap `J(u, x) ≤ C` on every leaf.  The gates of the nine source profiles are certified as
well.
-/

namespace Grothe.Lower

/-- The certificate context: the nine source profiles and their polynomial groups. -/
def ctx : Ctx := ⟨srcProfiles, polyGroups⟩

theorem vrecords_check : vrecords.all (checkRecord ctx) = true := by native_decide

theorem vrecords_length : vrecords.length = 18 := by decide

/-- **All 18 coupled profiles are sound.** -/
theorem vrecords_sound : ∀ r ∈ vrecords, RecordSound ctx r := fun r hr =>
  recordSound_of_check ctx r (List.all_eq_true.1 vrecords_check r hr)

/-- Default values used by `getD`. -/
def dfltProfile : SrcProfile := ⟨"", 0, 0, 0, ⟨0, 0, 0, 0, 0, 0⟩, ⟨0, 0, 0⟩⟩
def dfltGate : GateCert := ⟨⟨0, 0, 0, 0, 0, 0⟩, ⟨0, 0, 0, 0, 0, 0⟩, ⟨0, 0, 0, 0, 0, 0⟩, ⟨0, 0, 0⟩,
  ⟨0, 0, 0⟩, ⟨0, 0, 0⟩⟩
def dfltRecord : VRecord := ⟨0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, dfltGate, ""⟩

theorem srcProfiles_length : srcProfiles.length = 9 ∧ srcGates.length = 9 := by decide

theorem srcGates_check :
    (List.range 9).all (fun k =>
      let p := srcProfiles.getD k dfltProfile
      checkGates p.E p.R p.delta (srcGates.getD k dfltGate)) = true := by native_decide

/-- The gates of the nine source profiles hold. -/
theorem srcProfiles_gates : ∀ p ∈ srcProfiles, GateProp p.E p.R p.delta := by
  intro p hp
  obtain ⟨k, hk, rfl⟩ := List.getElem_of_mem hp
  have h9 := srcProfiles_length.1
  have := List.all_eq_true.1 srcGates_check k (List.mem_range.2 (by omega))
  have h := gateProp_of_check _ _ _ _ this
  rwa [List.getD_eq_getElem _ _ hk] at h

/-- The source profile parameters satisfy `0 < δ < ε` and `ℓ ≥ 2β ≥ 0`. -/
theorem srcProfiles_params :
    srcProfiles.all (fun p => decide (0 < p.delta) && decide (p.delta < ε) &&
      decide (0 ≤ p.beta) && decide (2 * p.beta ≤ p.ell)) = true := by native_decide

end Grothe.Lower
