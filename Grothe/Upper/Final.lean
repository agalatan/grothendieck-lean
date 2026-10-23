import Grothe.Upper.Head
import Grothe.Upper.Data

/-!
# The kernel of an energy table and the native head computation

The rounding kernel `H(t) = Σ_{n,m} E[n,m] p(t)^n (−τ(t))^m` (see `Data.lean`) of an energy table
`E` has radial coefficients `kernelCoeff E`.  This file proves the facts on the stored table used
by the upper bound (`PolynomialBridge.lean`):

* `head_check` (by `native_decide`): the stored indices satisfy `n + 3m ≤ 501`, and the interval
  checker bounds the head (degrees `≤ 501`) of the kernel of the stored energies `Ê` by
  `headCapQ = 2.8153·10⁻⁸` against `c·t`;
* the `ℓ¹` norms of the correlation polynomials are at most `1`, hence the passage from tables to
  kernels is an `ℓ¹` contraction (`summable_kernelCoeff`, `kernelCoeff_sub`).
-/

namespace Grothe

open Upper GrotheKernel Polynomial Finset

namespace Upper

/-- The stored energy `Ê[n,m]` of the index pair `p = (n, m)` (zero if not stored). -/
def energyTable (p : ℕ × ℕ) : ℚ := tabVal energyRows p

/-- The polynomial `P`: the primary correlation is `p(t) = t·P(t²)`. -/
noncomputable def primaryPoly : ℝ[X] := ofListQ pList

/-- The polynomial `Q`: the auxiliary correlation is `−τ(t) = t·Q(t²)`. -/
noncomputable def auxPoly : ℝ[X] := ofListQ qList

/-- The radial coefficients of the kernel with energies `E`:
`H(t) = Σ_{n,m} E[n,m] p(t)^n (−τ(t))^m = Σ_j kernelCoeff E j · t^{2j+1}`. -/
noncomputable def kernelCoeff (E : ℕ × ℕ → ℝ) : ℕ → ℝ := bivarKernel primaryPoly auxPoly E

end Upper

/-! ### The finite facts -/

/-- **The finite computation** (by `native_decide`): the stored indices satisfy `n + 3m ≤ 501`,
and the interval checker bounds the head of the kernel of the stored energies by `headCapQ`. -/
theorem head_check : headOK 501 energyRows pList qList slopeQ headCapQ = true := by
  native_decide

theorem pList_norm : (pList.map fun q => |q|).sum ≤ 1 := by decide +kernel

theorem qList_norm : (qList.map fun q => |q|).sum ≤ 1 := by decide +kernel

/-! ### From tables to kernels -/

lemma l1_primaryPoly : l1 primaryPoly ≤ 1 :=
  (l1_ofListQ_le pList).trans (by exact_mod_cast pList_norm)

lemma l1_auxPoly : l1 auxPoly ≤ 1 :=
  (l1_ofListQ_le qList).trans (by exact_mod_cast qList_norm)

lemma auxPoly_coeff_zero : auxPoly.coeff 0 = 0 := by
  simp [auxPoly, coeff_ofListQ, qList]

lemma summable_kernelCoeff {E : ℕ × ℕ → ℝ} (h : Summable fun p => |E p|) :
    Summable fun n => |kernelCoeff E n| :=
  summable_abs_bivarKernel _ _ l1_primaryPoly l1_auxPoly E h

lemma summable_abs_sub {E F : ℕ × ℕ → ℝ} (hE : Summable fun p => |E p|)
    (hF : Summable fun p => |F p|) : Summable fun p => |E p - F p| :=
  (hE.add hF).of_nonneg_of_le (fun _ => abs_nonneg _) fun p => abs_sub (E p) (F p)

lemma kernelCoeff_sub {E F : ℕ × ℕ → ℝ} (hE : Summable fun p => |E p|)
    (hF : Summable fun p => |F p|) (n : ℕ) :
    kernelCoeff (fun p => E p - F p) n = kernelCoeff E n - kernelCoeff F n :=
  bivarKernel_sub _ _ l1_primaryPoly l1_auxPoly E F hE hF n

end Grothe
