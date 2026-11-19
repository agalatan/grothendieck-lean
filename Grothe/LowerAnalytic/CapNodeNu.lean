import Grothe.LowerAnalytic.CapNodeNuDefs
import Grothe.LowerAnalytic.CapCheckNuMat
import Grothe.LowerAnalytic.CapConstr

/-!
# Soundness of the node and piece checks with an identity tail

For a tail `0 ≤ ν < 1` and tables that satisfy `TablesOK`:

* `pot_le_of_nodeOKNu`: a passing node check `nodeOKNu` at the weight `ε` of the rows gives
  `Ψ_ν(s) − capPad ≤ c` for the fibre potential of the row (the checks take the weight as an
  argument, `mMatE`, so that the facts of a certificate can be checked before `ε` is set to its
  weight);
* `Jpot_le_of_nodeOKcNu`: a passing constrained check `nodeOKcNu` gives `J(y, s) − capPad ≤ c` on
  the region of the constraints;
* `pot_le_of_pieceBoundsNu`: constraint lists that pass the coverage check `capCoverOK`, with
  `J(y, s) − capPad ≤ c` on each region, give `Ψ_ν(s) − capPad ≤ c` (for any real tail).

The chain: every recipe grid passes the grid check (`gridOKNu_mkGridNu`), its weights are
admissible (`gridWtsNu`), the integrated majorant bounds `J` (`Jpot_le_qfNu`), the kernel matrix
encloses it (`bounds_matINu`), and the exact piece checks are sound for any such matrix
(`pot_le_of_pieceOK_of_le`, `Jpot_le_of_pieceOKc_of_le`); the coverage and the symmetric orbit are
those of the checker without a tail (`capCover_sound`, `Jpot_le_of_mem_symOrbit`).
-/

open MeasureTheory Finset GrotheKernel Grothe.Lower Grothe.Upper

namespace Grothe.LowerAnalytic

/-- The matrix of the fibre form at the weight `ε` of the rows is `mMat`. -/
lemma mMatE_eps (E : Grothe.Lower.Sym3) (R : Grothe.Lower.Sym2) : mMatE E R Grothe.Lower.ε = mMat E R := rfl

noncomputable section

/-- **Soundness of the node check with a tail**: `Ψ_ν(s) − capPad ≤ c`, for the check at the
weight `eps = ε` of the rows. -/
theorem pot_le_of_nodeOKNu {eps : ℚ} (heps : eps = Grothe.Lower.ε) (r : Grothe.Lower.Row)
    (Rg : Grothe.Lower.Sym2) (nu : ℚ) (hν0 : 0 ≤ nu)
    (hν1 : nu < 1) (s c : ℚ) (rec : Recipe) (gauss : Bool) (Nr N : ℕ) (h : ℚ) (T : Tables)
    (hT : TablesOK Nr N h T) (hh : 0 < h) (hN : 0 < N) (hNr : 0 < Nr)
    (hchk : nodeOKNu eps r Rg nu s c rec gauss Nr N h T = true) :
    pot r.E Rg r.ell r.beta (aFib r.b1 r.b2 r.b3) nu s - Grothe.Lower.capPad ≤ c := by
  subst heps
  simp only [nodeOKNu, Bool.and_eq_true, mMatE_eps] at hchk
  obtain ⟨hp, hpc⟩ := hchk
  have hok := gridOKNu_mkGridNu r.ell r.beta nu rec gauss T hh hN hNr hν0 hν1
  set gd := mkGridNu r.ell r.beta nu rec gauss Nr N h T
  have hT' : TablesOK gd.Nr gd.N gd.h T := hT
  have hnu : gd.nu = nu := rfl
  have hJ := pot_le_of_pieceOK_of_le (r.ell : ℝ) r.beta r.E Rg (aFib r.b1 r.b2 r.b3) (gd.nu : ℝ)
    (TintNu r.ell r.beta gd.nu (gridWtsNu hok)) (avOf r) (aFib_vec r) s
    (c + Grothe.Lower.capPad) _ _ (fun I hI J hJ => bounds_matINu hok hp hT' hI hJ)
    (fun y => Jpot_le_qfNu (r.ell : ℝ) r.beta gd.nu (gridWtsNu hok) r.E Rg
      (aFib r.b1 r.b2 r.b3) y s) hpc
  rw [hnu] at hJ
  push_cast at hJ
  linarith

/-- **Soundness of the constrained node check with a tail**: `J(y, s) − capPad ≤ c` on the piece
region, for the check at the weight `eps = ε` of the rows. -/
theorem Jpot_le_of_nodeOKcNu {eps : ℚ} (heps : eps = Grothe.Lower.ε) (r : Grothe.Lower.Row)
    (Rg : Grothe.Lower.Sym2) (nu : ℚ)
    (hν0 : 0 ≤ nu) (hν1 : nu < 1) (s c : ℚ) (rec : Recipe) (gauss : Bool) (Nr N : ℕ) (h : ℚ)
    (T : Tables) (cs : List Cons) (hT : TablesOK Nr N h T) (hh : 0 < h) (hN : 0 < N)
    (hNr : 0 < Nr) (hchk : nodeOKcNu eps r Rg nu s c rec gauss Nr N h T cs = true)
    (y : Fib) (hy : y ∈ pieceSet r.E Rg cs) :
    Jpot r.E Rg r.ell r.beta (aFib r.b1 r.b2 r.b3) nu y s - Grothe.Lower.capPad ≤ c := by
  subst heps
  simp only [nodeOKcNu, Bool.and_eq_true, mMatE_eps] at hchk
  obtain ⟨hp, hpc⟩ := hchk
  have hok := gridOKNu_mkGridNu r.ell r.beta nu rec gauss T hh hN hNr hν0 hν1
  set gd := mkGridNu r.ell r.beta nu rec gauss Nr N h T
  have hT' : TablesOK gd.Nr gd.N gd.h T := hT
  have hnu : gd.nu = nu := rfl
  have hJ := Jpot_le_of_pieceOKc_of_le (r.ell : ℝ) r.beta r.E Rg (aFib r.b1 r.b2 r.b3)
    (gd.nu : ℝ) (TintNu r.ell r.beta gd.nu (gridWtsNu hok)) (avOf r) (aFib_vec r) s
    (c + Grothe.Lower.capPad) _ _ (fun I hI J hJ => bounds_matINu hok hp hT' hI hJ) cs hpc y hy
    (Jpot_le_qfNu (r.ell : ℝ) r.beta gd.nu (gridWtsNu hok) r.E Rg (aFib r.b1 r.b2 r.b3) y s)
  rw [hnu] at hJ
  push_cast at hJ
  linarith

/-- **A node from its pieces, with a tail**: if the regions of the constraint lists `Cs` cover the
fibre space modulo the symmetries (`capCoverOK`) and `J(y, s) − capPad ≤ c` holds on each of them,
then `Ψ_ν(s) − capPad ≤ c`. -/
theorem pot_le_of_pieceBoundsNu (r : Grothe.Lower.Row) (Rg : Grothe.Lower.Sym2) (ν s c : ℝ)
    (ds : List (List ℚ)) (Cs : List (List Cons)) (hcov : capCoverOK ds Cs = true)
    (hp : ∀ cs ∈ Cs, ∀ y ∈ pieceSet r.E Rg cs,
      Jpot r.E Rg r.ell r.beta (aFib r.b1 r.b2 r.b3) ν y s - Grothe.Lower.capPad ≤ c) :
    pot r.E Rg r.ell r.beta (aFib r.b1 r.b2 r.b3) ν s - Grothe.Lower.capPad ≤ c := by
  have : pot r.E Rg r.ell r.beta (aFib r.b1 r.b2 r.b3) ν s ≤ c + Grothe.Lower.capPad := by
    refine ciSup_le fun y => ?_
    obtain ⟨pc, hpc, hy⟩ := capCover_sound r.E Rg hcov y
    refine Jpot_le_of_mem_symOrbit r.E Rg r.ell r.beta _ ν (aFib_cj _ _ _) (aFib_ng _ _ _) s _ _
      (fun w hw => ?_) hy
    linarith [hp pc hpc w hw]
  linarith

end

end Grothe.LowerAnalytic
