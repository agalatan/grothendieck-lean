import Grothe.Lower.Cert.Parts

/-! The partition check of the cover (single-threaded `native_decide`). -/

namespace Grothe.Lower

theorem certPartition :
    partOK (treeOf coverCuts) (0, 9 / 10, 0, ρ, 0, xMax) (coverBoxList.map Box.dom) = true := by
  native_decide

end Grothe.Lower
