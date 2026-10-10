import Grothe.Lower.RowData

/-!
# The row and envelope certificate

`rows_check` runs the exact row checker on the 19 rows (headers, meshes, `x`-coverage, and every
cell: moment rectangles, node majorants with their Stein cuts, `σ`-chords; the cells of a row are
checked in parallel) and `envelope_check` runs the fixed-mixture envelope checker against `B`,
both by `native_decide`.  `rows_bound` is the resulting statement for each row, and
`lower_bound_data` the finite-layer theorem `V ≤ B` for the certificate data.
-/

namespace Grothe.Lower

theorem rowData_length : rowData.length = 19 := rfl

theorem rows_check : rowData.all checkRow = true := by native_decide

theorem envelope_check :
    checkEnvelope (crudeRow :: rowData.map Row.env) envModels envCells Bcap = true := by
  native_decide

/-- Every row has a valid header and its certified bound. -/
theorem rows_bound : ∀ r ∈ rowData, HeaderOK r ∧ RowBound r := fun r hr =>
  rowBound_of_check r (List.all_eq_true.1 rows_check r hr)

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- **The finite-layer lower bound for the certificate data**: `V ≤ B` from the
retained-square inequality of the crude row and the Gaussian reductions of the 19 rows. -/
theorem lower_bound_data (V t : ℝ) (Qh v : E) (hv : ‖v‖ ^ 2 = 2) (ht0 : 0 ≤ t)
    (ht1 : t ≤ 9 / 10) (hcrude : RowOf crudeRow V t Qh v)
    (hred : ∀ r ∈ rowData, RowReduction r V t Qh v) : V ≤ Bcap :=
  lower_bound_main rowData envModels envCells rows_check envelope_check V t Qh v hv ht0 ht1
    hcrude hred

end Grothe.Lower
