/-
ABANDONWARE: text removed from `Grothe/Upper/Final.lean` by the cleanup of 4 November 2026 (PR #301, task #291).
Kept for reference only: this folder is outside every Lake library, is not imported by any root
and is never built or checked. The lines below are the removed lines of the diff against master
b886bb574, verbatim (they are not a self-contained module: imports, namespaces and context are in the
original file at that commit).
-/

  kernels is an `ℓ¹` contraction (`summable_kernelCoeff`, `kernelCoeff_sub`).
lemma summable_abs_sub {E F : ℕ × ℕ → ℝ} (hE : Summable fun p => |E p|)
    (hF : Summable fun p => |F p|) : Summable fun p => |E p - F p| :=
  (hE.add hF).of_nonneg_of_le (fun _ => abs_nonneg _) fun p => abs_sub (E p) (F p)

lemma kernelCoeff_sub {E F : ℕ × ℕ → ℝ} (hE : Summable fun p => |E p|)
    (hF : Summable fun p => |F p|) (n : ℕ) :
    kernelCoeff (fun p => E p - F p) n = kernelCoeff E n - kernelCoeff F n :=
  bivarKernel_sub _ _ l1_primaryPoly l1_auxPoly E F hE hF n

