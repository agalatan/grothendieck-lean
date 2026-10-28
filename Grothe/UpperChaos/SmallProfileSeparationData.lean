import Grothe.UpperChaos.SmallProfileMeshData
import Grothe.UpperChaos.ProfileRootScreen
import Mathlib.Data.Fin.VecNotation

/-! Generated complementary gap data from data/small-profile-mesh/certificate.json
by tools/gen_small_profile_mesh.py. Agent-ID: codex-2ca4. -/

namespace Grothe.UpperChaos.SmallProfileMesh
open ProfileRootScreen

def gapLoQ (i : Fin 6) : ℚ := ![12, cutQ 2, 83 / 4, cutQ 4, 126 / 5, cutQ 6] i
def gapHiQ (i : Fin 6) : ℚ := ![cutQ 1, 15, cutQ 3, 522 / 25, cutQ 5, 2521 / 100] i

/-- Adjacent rows cover each gap between the old and new profile intervals. -/
def gapRows (i : Fin 6) : List Row :=
  match i.val with
  | 0 => [⟨(12 : ℚ) / 1, (6881023 : ℚ) / 500000, false⟩]
  | 1 => [⟨(6946559 : ℚ) / 500000, (28339677 : ℚ) / 2000000, false⟩, ⟨(28339677 : ℚ) / 2000000, (14446559 : ℚ) / 1000000, false⟩, ⟨(14446559 : ℚ) / 1000000, (15 : ℚ) / 1, false⟩]
  | 2 => [⟨(83 : ℚ) / 4, (20817949 : ℚ) / 1000000, false⟩]
  | 3 => [⟨(4164409 : ℚ) / 200000, (522 : ℚ) / 25, false⟩]
  | 4 => [⟨(126 : ℚ) / 5, (25203679 : ℚ) / 1000000, false⟩]
  | _ => [⟨(25204191 : ℚ) / 1000000, (2521 : ℚ) / 100, false⟩]

end Grothe.UpperChaos.SmallProfileMesh
