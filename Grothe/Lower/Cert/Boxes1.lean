import Grothe.Lower.Cert.Parts

/-! One chunk of the certificate check (single-threaded `native_decide`). -/

namespace Grothe.Lower

theorem certBoxes1 : chunkOK (boxOK rowData mixedBatches Bcap) coverBoxList 2200 2200 = true := by native_decide

end Grothe.Lower
