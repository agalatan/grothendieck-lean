import Grothe.Lower.Data

/-!
# The profile certificate

`profiles_check` runs the exact profile checker on all profiles of `ctx` in parallel by
`native_decide`; `profiles_sound` is the resulting `ProfileSound` statement for each profile:
matrix gates, parent relations, node provenance, chord domination of every physical polynomial,
and the moment bound `Jpw ≤ cap` on `[0, δρ] × [0, 31/4]`.
-/

namespace Grothe.Lower

theorem profiles_length : ctx.profiles.length = 31 := by native_decide

theorem profiles_check : checkProfiles ctx = true := by native_decide

/-- **All profiles are sound.** -/
theorem profiles_sound : ∀ n < ctx.profiles.length, ProfileSound ctx n :=
  profiles_sound_of_check ctx profiles_check

end Grothe.Lower
