import Grothe.LowerAnalytic.CapNodeNuDefs
import Grothe.LowerAnalytic.CapCheckNuMat
import Grothe.LowerAnalytic.CapConstr

/-!
# Soundness of the node and piece checks with an identity tail

For a tail `0 ≤ ν < 1` and tables that satisfy `TablesOK`:

* `pot_le_of_nodeOKNu`: a passing node check `nodeOKNu` gives `Ψ_ν(s) − capPad ≤ c` for the fibre
  potential of the row;
* `Jpot_le_of_nodeOKcNu`: a passing constrained check `nodeOKcNu` gives `J(y, s) − capPad ≤ c` on
  the region of the constraints;
* `pot_le_of_piecesNu`: a piece list that passes the coverage check `capCoverOK` and whose pieces
  pass `nodeOKcNu` gives `Ψ_ν(s) − capPad ≤ c`.

The chain: every recipe grid passes the grid check (`gridOKNu_mkGridNu`), its weights are
admissible (`gridWtsNu`), the integrated majorant bounds `J` (`Jpot_le_qfNu`), the kernel matrix
encloses it (`bounds_matINu`), and the exact piece checks are sound for any such matrix
(`pot_le_of_pieceOK_of_le`, `Jpot_le_of_pieceOKc_of_le`); the coverage and the symmetric orbit are
those of the checker without a tail (`capCover_sound`, `Jpot_le_of_mem_symOrbit`).
-/

open MeasureTheory Finset GrotheKernel Grothe.Lower Grothe.Upper

namespace Grothe.LowerAnalytic

noncomputable section

/-- **Soundness of the node check with a tail**: `Ψ_ν(s) − capPad ≤ c`. -/
theorem pot_le_of_nodeOKNu (r : Grothe.Lower.Row) (Rg : Grothe.Lower.Sym2) (nu : ℚ) (hν0 : 0 ≤ nu)
    (hν1 : nu < 1) (s c : ℚ) (rec : Recipe) (gauss : Bool) (Nr N : ℕ) (h : ℚ) (T : Tables)
    (hT : TablesOK Nr N h T) (hh : 0 < h) (hN : 0 < N) (hNr : 0 < Nr)
    (hchk : nodeOKNu r Rg nu s c rec gauss Nr N h T = true) :
    pot r.E Rg r.ell r.beta (aFib r.b1 r.b2 r.b3) nu s - Grothe.Lower.capPad ≤ c := by
  simp only [nodeOKNu, Bool.and_eq_true] at hchk
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
region. -/
theorem Jpot_le_of_nodeOKcNu (r : Grothe.Lower.Row) (Rg : Grothe.Lower.Sym2) (nu : ℚ)
    (hν0 : 0 ≤ nu) (hν1 : nu < 1) (s c : ℚ) (rec : Recipe) (gauss : Bool) (Nr N : ℕ) (h : ℚ)
    (T : Tables) (cs : List Cons) (hT : TablesOK Nr N h T) (hh : 0 < h) (hN : 0 < N)
    (hNr : 0 < Nr) (hchk : nodeOKcNu r Rg nu s c rec gauss Nr N h T cs = true)
    (y : Fib) (hy : y ∈ pieceSet r.E Rg cs) :
    Jpot r.E Rg r.ell r.beta (aFib r.b1 r.b2 r.b3) nu y s - Grothe.Lower.capPad ≤ c := by
  simp only [nodeOKcNu, Bool.and_eq_true] at hchk
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

/-- **A node from its pieces, with a tail**: if the pieces cover the fibre space modulo the
symmetries and every piece passes its constrained check on its grid, then `Ψ_ν(s) − capPad ≤ c`. -/
theorem pot_le_of_piecesNu (r : Grothe.Lower.Row) (Rg : Grothe.Lower.Sym2) (nu : ℚ) (hν0 : 0 ≤ nu)
    (hν1 : nu < 1) (s c : ℚ) (gauss : Bool) (ds : List (List ℚ))
    (P : List (Recipe × (ℕ × ℕ × ℚ) × Tables × List Cons))
    (hT : ∀ x ∈ P, TablesOK x.2.1.1 x.2.1.2.1 x.2.1.2.2 x.2.2.1)
    (hG : ∀ x ∈ P, 0 < x.2.1.2.2 ∧ 0 < x.2.1.2.1 ∧ 0 < x.2.1.1)
    (hcov : capCoverOK ds (P.map fun x => x.2.2.2) = true)
    (hchk : ∀ x ∈ P, nodeOKcNu r Rg nu s c x.1 gauss x.2.1.1 x.2.1.2.1 x.2.1.2.2 x.2.2.1 x.2.2.2
      = true) :
    pot r.E Rg r.ell r.beta (aFib r.b1 r.b2 r.b3) nu s - Grothe.Lower.capPad ≤ c := by
  have : pot r.E Rg r.ell r.beta (aFib r.b1 r.b2 r.b3) nu s ≤ c + Grothe.Lower.capPad := by
    refine ciSup_le fun y => ?_
    obtain ⟨pc, hpc, hy⟩ := capCover_sound r.E Rg hcov y
    obtain ⟨x, hx, rfl⟩ := List.mem_map.1 hpc
    obtain ⟨hh, hN, hNr⟩ := hG x hx
    refine Jpot_le_of_mem_symOrbit r.E Rg r.ell r.beta _ nu (aFib_cj _ _ _) (aFib_ng _ _ _) s _ _
      (fun w hw => ?_) hy
    linarith [Jpot_le_of_nodeOKcNu r Rg nu hν0 hν1 s c x.1 gauss _ _ _ _ x.2.2.2 (hT x hx) hh hN
      hNr (hchk x hx) w hw]
  linarith

end

end Grothe.LowerAnalytic
