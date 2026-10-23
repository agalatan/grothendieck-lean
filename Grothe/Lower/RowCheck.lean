import Grothe.Lower.Cert.Rows0
import Grothe.Lower.Cert.Rows1
import Grothe.Lower.Cert.Rows2
import Grothe.Lower.Cert.Rows3
import Grothe.Lower.Cert.Rows4
import Grothe.Lower.Cert.Batches0
import Grothe.Lower.Cert.Batches1
import Grothe.Lower.Cert.Batches2
import Grothe.Lower.Cert.Boxes0
import Grothe.Lower.Cert.Boxes1
import Grothe.Lower.Cert.Boxes2
import Grothe.Lower.Cert.Boxes3
import Grothe.Lower.Cert.Partition

/-!
# The certificate check

`cert_check` collects all exact checks of the certificate: the 19 rows (gate
and price, mesh, `x`-coverage, and every cell: moment rectangles, node majorants with their Stein
cuts, `σ`-chords), the exact node certificates of the mixed potentials (Stein and spectral), and
the boxes partitioning `[0, 9/10] × [0, ρ] × [0, 31/4]` (every box bounded by `B`, the partition
certified by its axis cuts).  The checks run as 13 single-threaded `native_decide` chunks, one
per module of `Grothe/Lower/Cert/` (five of the rows, three of the batches, four of the boxes and
the partition), which `lake` runs in separate processes.
`lower_bound_data` is the finite-layer theorem `V ≤ B` for the certificate data.
-/

namespace Grothe.Lower

theorem cert_check : checkCert rowData mixedBatches coverCuts coverBoxes = true := by
  have hr : rowData.all checkRow = true :=
    all_of_chunk _ _ 0 4 certRows0 <| all_of_chunk _ _ 4 4 certRows1 <|
      all_of_chunk _ _ 8 4 certRows2 <| all_of_chunk _ _ 12 4 certRows3 <|
      all_of_chunk _ _ 16 4 certRows4 <| all_drop_of_le _ _ _ (by decide)
  have hb : mixedBatches.all (checkBatch rowData) = true :=
    all_of_chunk _ _ 0 7 certBatches0 <| all_of_chunk _ _ 7 7 certBatches1 <|
      all_of_chunk _ _ 14 7 certBatches2 <| all_drop_of_le _ _ _ (by decide)
  have hx : coverBoxList.all (boxOK rowData mixedBatches Bcap) = true :=
    all_of_chunk _ _ 0 2200 certBoxes0 <| all_of_chunk _ _ 2200 2200 certBoxes1 <|
      all_of_chunk _ _ 4400 2200 certBoxes2 <| all_of_chunk _ _ 6600 2200 certBoxes3 <|
      all_drop_of_le _ _ _ (by decide)
  have hp := certPartition
  simp only [coverBoxList] at hx hp
  simp only [checkCert_eq, checkCover, allPar_eq, hr, hb, hx, hp, Bool.and_self]

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- **The finite-layer lower bound for the certificate data**: `V ≤ B` from the
retained-square inequality of the crude row and the simultaneous Gaussian reduction of the 19
rows. -/
theorem lower_bound_data (V t : ℝ) (Qh v : E) (hv : ‖v‖ ^ 2 = 2) (ht0 : 0 ≤ t)
    (ht1 : t ≤ 9 / 10) (hcrude : RowOf crudeRow V t Qh v)
    (hred : SharedReduction rowData V t Qh v) : V ≤ Bcap :=
  lower_bound_main rowData mixedBatches coverCuts coverBoxes cert_check V t Qh v hv ht0 ht1 hcrude
    hred

end Grothe.Lower
