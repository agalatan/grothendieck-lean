import Grothe.Lower.ProfileDataV2
import Grothe.Lower.ProfileCheck

/-!
# Instantiation of the profile checker on the version-2 certificate data

`vrecordsV2_check` evaluates the exact checker on all 18 coupled profiles (10,218 leaves) of
`handoff/lower-import/coupled-profiles.json` by `native_decide`, with the sharper
`C₆ = 4942288923/10⁸` and the 365 (source + imported) global physical polynomials;
`vrecordsV2_sound` is the resulting `RecordSound` statement for each record.
-/

namespace Grothe.Lower

/-- The version-2 certificate context: the nine source profiles and the extended polynomial
groups. -/
def ctxV2 : Ctx := ⟨srcProfiles, polyGroupsV2⟩

theorem vrecordsV2_check : vrecordsV2.all (checkRecord ctxV2) = true := by native_decide

theorem vrecordsV2_length : vrecordsV2.length = 18 := by decide

/-- **All 18 version-2 coupled profiles are sound.** -/
theorem vrecordsV2_sound : ∀ r ∈ vrecordsV2, RecordSound ctxV2 r := fun r hr =>
  recordSound_of_check ctxV2 r (List.all_eq_true.1 vrecordsV2_check r hr)

end Grothe.Lower
