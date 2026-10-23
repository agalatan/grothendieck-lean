import Grothe.Lower.Cert.Parts

/-! One chunk of the certificate check (single-threaded `native_decide`). -/

namespace Grothe.Lower

theorem certBatches0 : chunkOK (checkBatch rowData) mixedBatches 0 7 = true := by native_decide

end Grothe.Lower
