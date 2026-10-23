import Grothe.Lower.Cert.Parts

/-! One chunk of the certificate check (single-threaded `native_decide`). -/

namespace Grothe.Lower

theorem certRows1 : chunkOK checkRow rowData 4 4 = true := by native_decide

end Grothe.Lower
