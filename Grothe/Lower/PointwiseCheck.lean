import Grothe.Lower.PointwiseData
import Grothe.Lower.ProfileCheck

/-!
# The pointwise-profile certificate

`pwRecords_check` runs the exact checker on the 19 pointwise profiles by `native_decide`;
`pwRecords_sound` is the resulting `PwSound` statement for each record: parameter identities and
shifted gates, node provenance (averaged source or dense node caps, or interval evaluations of
the price families), chord domination of every physical polynomial, the rectangle cover of
`[0, δρ] × [0, 31/4]` with the cap, and the matrix gates at `ε₀` and at the dilated parameter
`scale · ε₀`.
-/

namespace Grothe.Lower

/-- The pointwise context: source profiles, lifted source node caps (`chordPts`), lifted dense
node caps and the price families. -/
def pwCtx : PwCtx := ⟨srcProfiles, chordPts, denseNodes, famCoeffs⟩

theorem pwRecords_check : pwRecords.all (checkPw pwCtx) = true := by native_decide

theorem pwRecords_length : pwRecords.length = 19 := by decide

/-- **All 19 pointwise profiles are sound.** -/
theorem pwRecords_sound : ∀ r ∈ pwRecords, PwSound pwCtx r := fun r hr =>
  pwSound_of_check pwCtx r (List.all_eq_true.1 pwRecords_check r hr)

end Grothe.Lower
