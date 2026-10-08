import Grothe.Transfer

/-!
# Radial kernels and their mixtures

`radialKernel c z = ∑ₙ cₙ z |z|^{2n}` is the kernel with radial coefficient sequence `c`.  A
positive mixture of dominated radial kernels, normalised by its mass, is dominated
(`mixture_dominated`), and its coefficients are the weighted sums `mixCoeff`.
-/

namespace Grothe

open Finset

noncomputable section

/-- The radial kernel with coefficient sequence `c`: `z ↦ ∑ₙ cₙ z |z|^{2n}`. -/
def radialKernel (c : ℕ → ℝ) (z : ℂ) : ℂ :=
  ∑' n, (c n : ℂ) * (z * ((‖z‖ : ℝ) : ℂ) ^ (2 * n))

lemma radialKernel_summable {c : ℕ → ℝ} (hc : Summable fun n => |c n|) {z : ℂ} (hz : ‖z‖ ≤ 1) :
    Summable fun n => (c n : ℂ) * (z * ((‖z‖ : ℝ) : ℂ) ^ (2 * n)) := by
  refine Summable.of_norm_bounded hc fun n => ?_
  rw [norm_mul, norm_mul, norm_pow, Complex.norm_real, Complex.norm_real, Real.norm_eq_abs,
    Real.norm_eq_abs, abs_norm]
  have h1 : ‖z‖ * ‖z‖ ^ (2 * n) ≤ 1 := by
    calc ‖z‖ * ‖z‖ ^ (2 * n) ≤ (1 : ℝ) * 1 ^ (2 * n) := by gcongr
      _ = 1 := by simp
  calc |c n| * (‖z‖ * ‖z‖ ^ (2 * n)) ≤ |c n| * 1 := mul_le_mul_of_nonneg_left h1 (abs_nonneg _)
    _ = |c n| := mul_one _

/-- Coefficients of the weighted mixture `∑ᵢ wᵢ Kᵢ`. -/
def mixCoeff {m : ℕ} (w : Fin m → ℝ) (k : Fin m → ℕ → ℝ) (n : ℕ) : ℝ := ∑ i, w i * k i n

lemma mixCoeff_summable {m : ℕ} (w : Fin m → ℝ) (k : Fin m → ℕ → ℝ)
    (hk : ∀ i, Summable fun n => |k i n|) : Summable fun n => |mixCoeff w k n| := by
  have hg : Summable fun n => ∑ i, |w i| * |k i n| :=
    summable_sum (s := Finset.univ) fun i _ => (hk i).mul_left |w i|
  refine Summable.of_nonneg_of_le (fun n => abs_nonneg _) (fun n => ?_) hg
  unfold mixCoeff
  refine (Finset.abs_sum_le_sum_abs _ _).trans (le_of_eq ?_)
  simp [abs_mul]

/-- On the closed unit disc the mixture kernel is the weighted sum of the kernels. -/
lemma radialKernel_mix {m : ℕ} (w : Fin m → ℝ) (k : Fin m → ℕ → ℝ)
    (hk : ∀ i, Summable fun n => |k i n|) {z : ℂ} (hz : ‖z‖ ≤ 1) :
    radialKernel (mixCoeff w k) z = ∑ i, (w i : ℂ) * radialKernel (k i) z := by
  unfold radialKernel mixCoeff
  have e : ∀ n, ((∑ i, w i * k i n : ℝ) : ℂ) * (z * ((‖z‖ : ℝ) : ℂ) ^ (2 * n))
      = ∑ i, (w i : ℂ) * ((k i n : ℂ) * (z * ((‖z‖ : ℝ) : ℂ) ^ (2 * n))) := by
    intro n
    push_cast
    rw [Finset.sum_mul]
    refine sum_congr rfl fun i _ => ?_
    ring
  simp_rw [e]
  rw [Summable.tsum_finsetSum fun i _ => (radialKernel_summable (hk i) hz).mul_left _]
  refine sum_congr rfl fun i _ => ?_
  rw [tsum_mul_left]

/-- The normalised mixture of dominated radial kernels is dominated. -/
lemma mixture_dominated {m : ℕ} (hm : 0 < m) (w : Fin m → ℝ) (hw : ∀ i, 0 < w i) (k : Fin m → ℕ → ℝ)
    (hk : ∀ i, Summable fun n => |k i n|) (hdom : ∀ i, DominatedKernel (radialKernel (k i))) :
    DominatedKernel fun z => (((∑ i, w i)⁻¹ : ℝ) : ℂ) * radialKernel (mixCoeff w k) z := by
  have hpos : 0 < ∑ i, w i := Finset.sum_pos (fun i _ => hw i) ⟨⟨0, hm⟩, Finset.mem_univ _⟩
  have hmix := DominatedKernel.mixture w (fun i => (hw i).le) hpos (fun i => radialKernel (k i)) hdom
  intro m n A ι _ x y hx hy
  have hz1 : ∀ i j, ‖inner ℂ (x i) (y j)‖ ≤ 1 := fun i j => by
    have := norm_inner_le_norm (𝕜 := ℂ) (x i) (y j)
    rwa [hx, hy, one_mul] at this
  have := hmix m n A ι x y hx hy
  have e : ∀ i j, (((∑ i, w i)⁻¹ : ℝ) : ℂ) * radialKernel (mixCoeff w k) (inner ℂ (x i) (y j))
      = ((∑ i, w i : ℝ) : ℂ)⁻¹ * ∑ l, (w l : ℂ) * radialKernel (k l) (inner ℂ (x i) (y j)) := by
    intro i j
    rw [radialKernel_mix w k hk (hz1 i j), Complex.ofReal_inv]
  simpa only [e] using this

end

end Grothe
