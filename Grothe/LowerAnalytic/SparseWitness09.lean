import Grothe.LowerAnalytic.SparseWitnessData

namespace Grothe.LowerAnalytic.SparseStein
open Grothe.Lower

set_option Elab.async false
set_option maxRecDepth 40000
set_option maxHeartbeats 2000000

theorem w9_5_11_checked : w9_5_11.Checked sparseMesh row09FullNodes row09Smax := by
  unfold Witness.Checked
  decide +kernel

theorem w9_6_15_checked : w9_6_15.Checked sparseMesh row09FullNodes row09Smax := by
  unfold Witness.Checked
  decide +kernel

theorem w9_7_18_checked : w9_7_18.Checked sparseMesh row09FullNodes row09Smax := by
  unfold Witness.Checked
  decide +kernel

theorem w9_8_17_checked : w9_8_17.Checked sparseMesh row09FullNodes row09Smax := by
  unfold Witness.Checked
  decide +kernel

theorem w9_9_21_checked : w9_9_21.Checked sparseMesh row09FullNodes row09Smax := by
  unfold Witness.Checked
  decide +kernel

theorem w9_10_19_checked : w9_10_19.Checked sparseMesh row09FullNodes row09Smax := by
  unfold Witness.Checked
  decide +kernel

theorem planChecks09 (p : Plan) (hp : p ∈ plans09) :
    p.witness.Checked sparseMesh row09FullNodes row09Smax := by
  simp only [plans09, List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact w9_5_11_checked
  · exact w9_6_15_checked
  · exact w9_7_18_checked
  · exact w9_8_17_checked
  · exact w9_9_21_checked
  · exact w9_10_19_checked
  · exact w9_10_19_checked

end Grothe.LowerAnalytic.SparseStein
