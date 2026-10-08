import Grothe.Lower.PSD

/-!
# The matrix gates of a profile

A profile with even block `M_E` (3×3), odd block `M_R` (2×2) and penalty parameter `δ` is
admissible at the witness parameter `ε` when `M_E ≻ 0`, `M_R ≻ 0`,
`M_E − diag(−1, ε, ε) ⪰ 0`, `M_E − diag(ε − δ, 0, 0) ⪰ 0`, `M_R − diag(−1, ε) ⪰ 0` and
`M_R − diag(ε, 0) ⪰ 0`.  Each gate is certified by an exact `LᵀDL` factorization
(`GateCert`); `gateProp_of_check` turns a successful check into the real statement `GateProp`.
-/

namespace Grothe.Lower

/-- LDL certificates for the six matrix gates of a profile. -/
structure GateCert where
  ePD : LDL3
  eDom1 : LDL3
  eDom2 : LDL3
  rPD : LDL2
  rDom1 : LDL2
  rDom2 : LDL2
  deriving Repr

def dfltGate : GateCert := ⟨⟨0, 0, 0, 0, 0, 0⟩, ⟨0, 0, 0, 0, 0, 0⟩, ⟨0, 0, 0, 0, 0, 0⟩, ⟨0, 0, 0⟩,
  ⟨0, 0, 0⟩, ⟨0, 0, 0⟩⟩

/-- The matrix gates of a profile with parameters `(E, R, δ)` at the witness parameter `eps`, as
real-valued PSD/PD facts. -/
structure GateProp (eps : ℚ) (E : Sym3) (R : Sym2) (delta : ℚ) : Prop where
  ePD : PD3 E
  eDom1 : PSD3 (E.subDiag (-1) eps eps)
  eDom2 : PSD3 (E.subDiag (eps - delta) 0 0)
  rPD : PD2 R
  rDom1 : PSD2 (R.subDiag (-1) eps)
  rDom2 : PSD2 (R.subDiag eps 0)

def checkGates (eps : ℚ) (E : Sym3) (R : Sym2) (delta : ℚ) (c : GateCert) : Bool :=
  checkPD3 E c.ePD && checkPSD3 (E.subDiag (-1) eps eps) c.eDom1 &&
  checkPSD3 (E.subDiag (eps - delta) 0 0) c.eDom2 && checkPD2 R c.rPD &&
  checkPSD2 (R.subDiag (-1) eps) c.rDom1 && checkPSD2 (R.subDiag eps 0) c.rDom2

theorem gateProp_of_check (eps : ℚ) (E : Sym3) (R : Sym2) (delta : ℚ) (c : GateCert)
    (h : checkGates eps E R delta c = true) : GateProp eps E R delta := by
  simp only [checkGates, Bool.and_eq_true] at h
  obtain ⟨⟨⟨⟨⟨h1, h2⟩, h3⟩, h4⟩, h5⟩, h6⟩ := h
  exact ⟨pd3_of_check _ _ h1, psd3_of_check _ _ h2, psd3_of_check _ _ h3, pd2_of_check _ _ h4,
    psd2_of_check _ _ h5, psd2_of_check _ _ h6⟩

end Grothe.Lower
