import Grothe.HJM.CauchyGate

/-!
# The gate checks of the four scalar branches

`gateCheck` accepts each branch on the disc of radius `1.01 R_r`, with the Cauchy radii
`R = 6/5, 111/100, 111/100, 108/100` (HJM uses `111/100` for branch 4; the gate is tight there, and the smaller
radius costs nothing measurable: the weighted tails stay below `4·10⁻¹⁰`).
-/

namespace Grothe.HJM.Cauchy

/-- The check radii `1.01 R_r`. -/
def gateR : Fin 4 → ℚ := ![303 / 250, 11211 / 10000, 11211 / 10000, 2727 / 2500]

theorem gate_check1 : gateCheck pList1 (gateR 0) = true := by decide +kernel
theorem gate_check2 : gateCheck pList2 (gateR 1) = true := by decide +kernel
theorem gate_check3 : gateCheck pList3 (gateR 2) = true := by decide +kernel
theorem gate_check4 : gateCheck pList4 (gateR 3) = true := by decide +kernel

end Grothe.HJM.Cauchy
