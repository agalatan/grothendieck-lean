import Grothe.Lower.Cert.Parts

/-! One chunk of the certificate check (single-threaded `native_decide`). -/

namespace Grothe.Lower

theorem certBoxes2 : chunkOK (boxOK rowData mixedBatches Bcap) coverBoxList 4400 2200 = true := by native_decide

end Grothe.Lower
