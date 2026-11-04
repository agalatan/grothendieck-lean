/-
ABANDONWARE: text removed from `Grothe/Upper/Realise.lean` by the cleanup of 4 November 2026 (PR #301, task #291).
Kept for reference only: this folder is outside every Lake library, is not imported by any root
and is never built or checked. The lines below are the removed lines of the diff against master
b886bb574, verbatim (they are not a self-contained module: imports, namespaces and context are in the
original file at that commit).
-/

are unit vectors with `⟪L x, R y⟫ = z · P(|z|²)`, `z = ⟪x, y⟫` (`inner_realL_realR`).  Hence
composing a dominated (resp. disk, valid) kernel with `polyKernel P` keeps it dominated (resp.
disk, valid): `DominatedKernel.comp_poly`, `DiskKernel.comp_poly`, `ValidKernel.comp_poly`.
construction (common-head/PROOF_COMPLETE.md §5), for a single channel.
/-- **Composition with a preprocessor** keeps a kernel dominated. -/
theorem DominatedKernel.comp_poly {Q : ℂ → ℂ} (hQ : DominatedKernel Q) (P : ℝ[X])
    (hP : l1 P ≤ 1) : DominatedKernel fun z => Q (polyKernel P z) := by
  intro m n A ι _ x y hx hy
  have := hQ m n A (RIdx ι (P.natDegree + 1)) (fun i => realL P (x i)) (fun j => realR P (y j))
    (fun i => norm_realL P hP _ (hx i)) (fun j => norm_realR P hP _ (hy j))
  simpa only [inner_realL_realR] using this

/-- Composition with a preprocessor keeps a disk rounding kernel a disk rounding kernel. -/
theorem DiskKernel.comp_poly {Q : ℂ → ℂ} (hQ : DiskKernel Q) (P : ℝ[X]) (hP : l1 P ≤ 1) :
    DiskKernel fun z => Q (polyKernel P z) := by
  intro m n ι _ x y hx hy
  obtain ⟨Ω, _, μ, hμ, ε, δ, h1, h2, h3, h4, h5⟩ := hQ m n (RIdx ι (P.natDegree + 1))
    (fun i => realL P (x i)) (fun j => realR P (y j))
    (fun i => norm_realL P hP _ (hx i)) (fun j => norm_realR P hP _ (hy j))
  exact ⟨Ω, _, μ, hμ, ε, δ, h1, h2, h3, h4, fun i j => by rw [h5, inner_realL_realR]⟩

/-- Composition with a preprocessor keeps a valid rounding kernel valid. -/
theorem ValidKernel.comp_poly {Q : ℂ → ℂ} (hQ : ValidKernel Q) (P : ℝ[X]) (hP : l1 P ≤ 1) :
    ValidKernel fun z => Q (polyKernel P z) := by
  intro m n ι _ x y hx hy
  obtain ⟨Ω, _, μ, hμ, ε, δ, h1, h2, h3, h4, h5⟩ := hQ m n (RIdx ι (P.natDegree + 1))
    (fun i => realL P (x i)) (fun j => realR P (y j))
    (fun i => norm_realL P hP _ (hx i)) (fun j => norm_realR P hP _ (hy j))
  exact ⟨Ω, _, μ, hμ, ε, δ, h1, h2, h3, h4, fun i j => by rw [h5, inner_realL_realR]⟩

