import Grothe.HJM.CauchyGate

/-!
# The gate checks of the four scalar branches

`gateCheck` accepts each branch on a disc slightly larger than its Cauchy radius: HJM's radii
`R = 6/5, 111/100, 111/100, 111/100` and the check radii `1.01 R` for branches 1–3, `1.112` for branch 4 (whose
gate margin is thin: the check fails beyond about `1.1125`).
-/

namespace Grothe.HJM.Cauchy

/-- The check radii. -/
def gateR : Fin 4 → ℚ := ![303 / 250, 11211 / 10000, 11211 / 10000, 139 / 125]

theorem gate_check1 : gateCheck pList1 (gateR 0) = true := by decide +kernel
theorem gate_check2 : gateCheck pList2 (gateR 1) = true := by decide +kernel
theorem gate_check3 : gateCheck pList3 (gateR 2) = true := by decide +kernel
theorem gate_check4 : gateCheck pList4 (gateR 3) = true := by decide +kernel

end Grothe.HJM.Cauchy
