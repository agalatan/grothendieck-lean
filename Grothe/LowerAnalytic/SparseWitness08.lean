import Grothe.LowerAnalytic.SparseWitnessData

namespace Grothe.LowerAnalytic.SparseStein
open Grothe.Lower

set_option Elab.async false
set_option maxRecDepth 40000
set_option maxHeartbeats 2000000

theorem w8_5_6_checked : w8_5_6.Checked sparseMesh row08FullNodes row08Smax := by
  unfold Witness.Checked
  decide +kernel

theorem w8_6_6_checked : w8_6_6.Checked sparseMesh row08FullNodes row08Smax := by
  unfold Witness.Checked
  decide +kernel

theorem w8_8_6_checked : w8_8_6.Checked sparseMesh row08FullNodes row08Smax := by
  unfold Witness.Checked
  decide +kernel

theorem w8_13_6_checked : w8_13_6.Checked sparseMesh row08FullNodes row08Smax := by
  unfold Witness.Checked
  decide +kernel

theorem w8_15_5_checked : w8_15_5.Checked sparseMesh row08FullNodes row08Smax := by
  unfold Witness.Checked
  decide +kernel

theorem planChecks08 (p : Plan) (hp : p ∈ plans08) :
    p.witness.Checked sparseMesh row08FullNodes row08Smax := by
  simp only [plans08, List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact w8_5_6_checked
  · exact w8_6_6_checked
  · exact w8_6_6_checked
  · exact w8_8_6_checked
  · exact w8_8_6_checked
  · exact w8_13_6_checked
  · exact w8_15_5_checked

end Grothe.LowerAnalytic.SparseStein
