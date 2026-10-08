import Grothe.Lower.Data

/-!
# The support-row and envelope certificate

`rows_check` verifies every support row against its profile (dilation identities, transferred
cap, gates of the dilated profile) and `envelope_check` runs the fixed-mixture envelope checker
against `B`, both by `native_decide`; `lower_bound_data` is the resulting finite-layer theorem
`V ≤ B`.
-/

namespace Grothe.Lower

theorem rowData_length : rowData.length = 68 := by native_decide

theorem rows_check : rowData.all (checkRow ctx) = true := by native_decide

theorem envelope_check : checkEnvelope (rowData.map Row.env) envModels envCells Bcap = true := by
  native_decide

/-- Every support row is sound. -/
theorem rows_sound : ∀ r ∈ rowData, RowSound ctx r := fun r hr =>
  rowSound_of_check ctx r (List.all_eq_true.1 rows_check r hr)

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- **The finite-layer lower bound for the certificate data**: `V ≤ B` from the row
inequalities of the crude row and of the 67 dilated profiles. -/
theorem lower_bound_data (V t : ℝ) (Qh v : E) (hv : ‖v‖ ^ 2 = 2) (hQ : ‖Qh‖ ^ 2 ≤ (ρ : ℝ) ^ 2)
    (ht0 : 0 ≤ t) (ht1 : t ≤ 9 / 10)
    (hcrude : LowerAnalytic.RowHolds (ε₀ : ℝ) 0 0 ((ε₀ * ρ ^ 2 : ℚ) : ℝ) V t Qh v)
    (hprof : ∀ r ∈ rowData, r.crude = false → ProfileRow ctx r V t Qh v) : V ≤ Bcap :=
  lower_bound_main ctx rowData envModels envCells rows_check envelope_check V t Qh v hv hQ ht0 ht1
    hcrude hprof

end Grothe.Lower
