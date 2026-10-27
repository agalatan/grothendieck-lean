/- Intended path: Grothe/HJM/MixtureHead.lean -/
import Grothe.HJM.Mixture

/-!
# A finite-head interface for mixtures of radial kernels

The infinite coefficient score in `mixture_bound` can be supplied by a
finite head and one weighted branch-tail budget. This is independent of the
number or identity of the branches and does not assume a numerical bound.
-/

namespace Grothe

noncomputable section

/-- A finite head and a weighted branch-tail budget imply a mixture bound. -/
theorem mixture_bound_of_finite_head {ι : Type*} (s : Finset ι) (w : ι → ℝ)
    (h : ι → ℕ → ℝ) (hs : ∀ r ∈ s, Summable fun n => |h r n|)
    (hdom : ∀ r ∈ s, DominatedKernel (radialKernel (h r)))
    {M : ℝ} (hM0 : 0 < M) (hM : ∑ r ∈ s, |w r| ≤ M)
    (N : ℕ) (slope tail : ℝ)
    (hslope : slope ≤ ∑ r ∈ s, w r * h r 0)
    (htail : (∑ r ∈ s, |w r| * ∑' j, |h r (j + (N + 1))|) ≤ tail)
    (hscore : (∑ j ∈ Finset.range N, |∑ r ∈ s, w r * h r (j + 1)|) + tail < slope) :
    IsGrothendieckBound (M / (slope -
      (∑ j ∈ Finset.range N, |∑ r ∈ s, w r * h r (j + 1)|) - tail)) := by
  let q : ℕ → ℝ := fun n => ∑ r ∈ s, w r * h r n
  have hbranch (r : ι) (hr : r ∈ s) :
      Summable fun n => |w r| * |h r (n + (N + 1))| :=
    ((summable_nat_add_iff (N + 1)).mpr (hs r hr)).mul_left _
  have hmajor : Summable fun n => ∑ r ∈ s, |w r| * |h r (n + (N + 1))| :=
    summable_sum fun r hr => hbranch r hr
  have hpoint (n : ℕ) : |q (n + (N + 1))| ≤
      ∑ r ∈ s, |w r| * |h r (n + (N + 1))| := by
    dsimp [q]
    refine (Finset.abs_sum_le_sum_abs _ _).trans (le_of_eq ?_)
    exact Finset.sum_congr rfl fun r _ => abs_mul _ _
  have hqtail : Summable fun n => |q (n + (N + 1))| :=
    Summable.of_nonneg_of_le (fun _ => abs_nonneg _) hpoint hmajor
  have hq : Summable fun n => |q n| := by
    have hb (n : ℕ) : |q n| ≤ ∑ r ∈ s, |w r| * |h r n| := by
      dsimp [q]
      refine (Finset.abs_sum_le_sum_abs _ _).trans (le_of_eq ?_)
      exact Finset.sum_congr rfl fun r _ => abs_mul _ _
    exact Summable.of_nonneg_of_le (fun _ => abs_nonneg _) hb
      (summable_sum fun r hr => (hs r hr).mul_left _)
  have hsplit : (∑' n, |q (n + 1)|) =
      (∑ n ∈ Finset.range N, |q (n + 1)|) + ∑' n, |q (n + (N + 1))| := by
    have h1 := (summable_nat_add_iff 1).mpr hq
    simpa only [Nat.add_assoc] using (h1.sum_add_tsum_nat_add N).symm
  have htailq : (∑' n, |q (n + (N + 1))|) ≤ tail := by
    calc
      _ ≤ ∑' n, ∑ r ∈ s, |w r| * |h r (n + (N + 1))| :=
        Summable.tsum_le_tsum hpoint hqtail hmajor
      _ = ∑ r ∈ s, ∑' n, |w r| * |h r (n + (N + 1))| :=
        Summable.tsum_finsetSum fun r hr => hbranch r hr
      _ = ∑ r ∈ s, |w r| * ∑' n, |h r (n + (N + 1))| := by
        apply Finset.sum_congr rfl
        intro r _
        rw [tsum_mul_left]
      _ ≤ tail := htail
  have hres : (∑' n, |q (n + 1)|) < q 0 := by
    change slope ≤ q 0 at hslope
    change (∑ j ∈ Finset.range N, |q (j + 1)|) + tail < slope at hscore
    rw [hsplit]
    linarith
  have hbound := mixture_bound s w h hs hdom hM0 hM hres
  have hdenom : slope - (∑ j ∈ Finset.range N, |q (j + 1)|) - tail ≤
      q 0 - ∑' n, |q (n + 1)| := by
    change slope ≤ q 0 at hslope
    rw [hsplit]
    linarith
  have hpos : 0 < slope - (∑ j ∈ Finset.range N, |q (j + 1)|) - tail := by
    change (∑ j ∈ Finset.range N, |q (j + 1)|) + tail < slope at hscore
    linarith
  exact hbound.mono (div_le_div_of_nonneg_left hM0.le hpos hdenom)

end
end Grothe
