import Grothe.Transfer
import Grothe.FifthTail
import Grothe.SixthTail
import Grothe.Assembly

/-!
# Main theorems: `K_G^ℂ < 1.404898426735` (and the source bound) from the certificate inputs

`bound_of_certificate` is the generic assembly: six radial kernels `Kᵢ(z) = ∑ₙ kᵢₙ z|z|^{2n}`
with positive weights `wᵢ`, directed bounds for the linear coefficient and the nonlinear prefix
of the mixture, and per-kernel tail bounds, yield `K_G^ℂ ≤ M / (q₀ - prefix - ∑ wᵢ tᵢ)`.

The two headline theorems instantiate it:

* `complex_grothendieck_refined` — the research note's bound `K_G^ℂ < 1.404898426735`;
* `complex_grothendieck_source` — the source bound `K_G^ℂ < 1.404898554745441`.

Both take as **hypotheses** exactly the inputs that are not formalised here:

1. `hdom`: each source kernel is a dominated rounding kernel (source Sections 3–5; follows from
   Haagerup's Gaussian phase identity and the validity of the preprocessed kernels);
2. `hq0`, `hprefix`: the Arb interval enclosures of the first 120 mixture coefficients
   (upstream `audit_sparse6_altgroups.py` / `verify_intervals.py`);
3. `hcauchy`: the Cauchy-estimate tails of the first four kernels (source Section 6.4);
4. `hfifth`: the retained-block contribution of the fifth kernel (source (6.19)), with the
   omitted blocks expressed through `∑_{j≥67} h_j ‖P₅^{2j+1}‖_𝒜` (which we bound);
5. `hsixth`: the Laguerre energy majorant for the sixth kernel tail (source Section 6.2),
   expressed through `W₁₂₀` (which we bound).

Everything else — the transfer inequality, the Wallis-type estimates, the exact polynomial-norm
computations, the telescoping tail bound, the radical bounds, and the final arithmetic — is
proved.
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
def mixCoeff (w : Fin 6 → ℝ) (k : Fin 6 → ℕ → ℝ) (n : ℕ) : ℝ := ∑ i, w i * k i n

lemma mixCoeff_summable (w : Fin 6 → ℝ) (k : Fin 6 → ℕ → ℝ)
    (hk : ∀ i, Summable fun n => |k i n|) : Summable fun n => |mixCoeff w k n| := by
  have hg : Summable fun n => ∑ i, |w i| * |k i n| :=
    summable_sum (s := Finset.univ) fun i _ => (hk i).mul_left |w i|
  refine Summable.of_nonneg_of_le (fun n => abs_nonneg _) (fun n => ?_) hg
  unfold mixCoeff
  refine (Finset.abs_sum_le_sum_abs _ _).trans (le_of_eq ?_)
  simp [abs_mul]

/-- On the closed unit disc the mixture kernel is the weighted sum of the kernels. -/
lemma radialKernel_mix (w : Fin 6 → ℝ) (k : Fin 6 → ℕ → ℝ)
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
lemma mixture_dominated (w : Fin 6 → ℝ) (hw : ∀ i, 0 < w i) (k : Fin 6 → ℕ → ℝ)
    (hk : ∀ i, Summable fun n => |k i n|) (hdom : ∀ i, DominatedKernel (radialKernel (k i))) :
    DominatedKernel fun z => (((∑ i, w i)⁻¹ : ℝ) : ℂ) * radialKernel (mixCoeff w k) z := by
  have hpos : 0 < ∑ i, w i := Finset.sum_pos (fun i _ => hw i) ⟨0, Finset.mem_univ _⟩
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

set_option maxHeartbeats 2000000 in
/-- **Generic certificate assembly.** -/
theorem bound_of_certificate
    (w : Fin 6 → ℝ) (hw : ∀ i, 0 < w i)
    (k : Fin 6 → ℕ → ℝ) (hk : ∀ i, Summable fun n => |k i n|)
    (hdom : ∀ i, DominatedKernel (radialKernel (k i)))
    (q0lo prefixhi : ℝ) (t : Fin 6 → ℝ)
    (hq0 : q0lo ≤ mixCoeff w k 0)
    (hprefix : ∑ n ∈ Finset.Ico 1 120, |mixCoeff w k n| ≤ prefixhi)
    (htail : ∀ i, ∑' n, |k i (n + 120)| ≤ t i)
    (hpos : 0 < q0lo - prefixhi - ∑ i, w i * t i) :
    IsGrothendieckBound ((∑ i, w i) / (q0lo - prefixhi - ∑ i, w i * t i)) := by
  have hmd := mixture_dominated w hw k hk hdom
  have hcs := mixCoeff_summable w k hk
  have hM : 0 < ∑ i, w i := Finset.sum_pos (fun i _ => hw i) ⟨0, Finset.mem_univ _⟩
  have hki : ∀ i, Summable fun n => |k i (n + 120)| :=
    fun i => (summable_nat_add_iff 120).mpr (hk i)
  -- the tail of the mixture is bounded by the weighted per-kernel tails
  have h1 : ∀ n, |mixCoeff w k (n + 120)| ≤ ∑ i, w i * |k i (n + 120)| := by
    intro n
    unfold mixCoeff
    refine (Finset.abs_sum_le_sum_abs _ _).trans (le_of_eq ?_)
    refine sum_congr rfl fun i _ => ?_
    rw [abs_mul, abs_of_pos (hw i)]
  have hs2 : Summable fun n => ∑ i, w i * |k i (n + 120)| :=
    summable_sum (s := Finset.univ) fun i _ => (hki i).mul_left (w i)
  have hcs120 : Summable fun n => |mixCoeff w k (n + 120)| := (summable_nat_add_iff 120).mpr hcs
  have htail_mix : ∑' n, |mixCoeff w k (n + 120)| ≤ ∑ i, w i * t i := by
    calc ∑' n, |mixCoeff w k (n + 120)|
        ≤ ∑' n, ∑ i, w i * |k i (n + 120)| := Summable.tsum_le_tsum h1 hcs120 hs2
      _ = ∑ i, w i * ∑' n, |k i (n + 120)| := by
          rw [Summable.tsum_finsetSum fun i _ => (hki i).mul_left (w i)]
          refine sum_congr rfl fun i _ => ?_
          rw [tsum_mul_left]
      _ ≤ ∑ i, w i * t i :=
          sum_le_sum fun i _ => mul_le_mul_of_nonneg_left (htail i) (hw i).le
  have hc' : Summable fun n => |mixCoeff w k (n + 1)| := (summable_nat_add_iff 1).mpr hcs
  -- the nonlinear coefficient norm `S = ∑_{n ≥ 1} |cₙ|`
  have hS : ∑' n, |mixCoeff w k (n + 1)| ≤ prefixhi + ∑ i, w i * t i := by
    have hsplit := hc'.sum_add_tsum_nat_add 119
    have e1 : ∑ n ∈ range 119, |mixCoeff w k (n + 1)| = ∑ n ∈ Finset.Ico 1 120, |mixCoeff w k n| := by
      rw [Finset.sum_Ico_eq_sum_range]
      refine sum_congr rfl fun n _ => ?_
      rw [add_comm]
    have e2 : ∑' n, |mixCoeff w k (n + 119 + 1)| = ∑' n, |mixCoeff w k (n + 120)| :=
      tsum_congr fun n => by rw [show n + 119 + 1 = n + 120 by omega]
    rw [← hsplit, e1, e2]
    exact add_le_add hprefix htail_mix
  have hc0 : q0lo ≤ |mixCoeff w k 0| := hq0.trans (le_abs_self _)
  have hSlt : ∑' n, |mixCoeff w k (n + 1)| < |mixCoeff w k 0| := by linarith
  unfold radialKernel at hmd
  have hT := transfer (mixCoeff w k) hcs (∑ i, w i) hM hmd hSlt
  refine hT.mono ?_
  apply div_le_div_of_nonneg_left hM.le hpos
  linarith

/-! ### Instantiation with the note's weights and reserves -/

/-- **Main theorem (research note).**  Under the certificate inputs listed in the module
docstring, `K_G^ℂ ≤ 1.404898426735`. -/
theorem complex_grothendieck_refined
    (k : Fin 6 → ℕ → ℝ) (hk : ∀ i, Summable fun n => |k i n|)
    (hdom : ∀ i, DominatedKernel (radialKernel (k i)))
    (hq0 : 0.7117964083067696 ≤ mixCoeff wNew k 0)
    (hprefix : ∑ n ∈ Finset.Ico 1 120, |mixCoeff wNew k n| ≤ 1.0747148914e-6)
    (hcauchy0 : ∑' n, |k 0 (n + 120)| ≤ cauchyTail 1.2)
    (hcauchy1 : ∑' n, |k 1 (n + 120)| ≤ cauchyTail 1.11)
    (hcauchy2 : ∑' n, |k 2 (n + 120)| ≤ cauchyTail 1.11)
    (hcauchy3 : ∑' n, |k 3 (n + 120)| ≤ cauchyTail 1.11)
    (hfifth : ∑' n, |k 4 (n + 120)| ≤
      finite5 / wOld 4 + ∑' m, h (m + 67) * l1 (P5 ^ (2 * (m + 67) + 1)))
    (hsixth : ∑' n, |k 5 (n + 120)| ≤
      Real.sqrt (1.174 * W 120) + Real.sqrt (1.176 * W 120)
        + Real.sqrt (1.174 * 1.176) / 241 ^ 2) :
    IsGrothendieckBound 1.404898426735 := by
  have htail : ∀ i, ∑' n, |k i (n + 120)| ≤ tBound i := by
    intro i
    fin_cases i
    · simpa [tBound, R] using hcauchy0
    · simpa [tBound, R] using hcauchy1
    · simpa [tBound, R] using hcauchy2
    · simpa [tBound, R] using hcauchy3
    · change _ ≤ finite5 / wOld 4 + fifthReserve
      exact hfifth.trans (add_le_add le_rfl fifth_omitted_tail)
    · change _ ≤ sixthT
      exact hsixth.trans sixth_majorant_le
  have hpos : 0 < (0.7117964083067696 : ℝ) - 1.0747148914e-6 - ∑ i, wNew i * tBound i := by
    linarith [tails_new']
  have hB := bound_of_certificate wNew wNew_pos k hk hdom _ _ tBound hq0 hprefix htail hpos
  refine hB.mono ?_
  rw [mass_new]
  calc (1.000000000000000012 : ℝ) / (0.7117964083067696 - 1.0747148914e-6 - ∑ i, wNew i * tBound i)
      ≤ 1.000000000000000012 / (0.7117964083067696 - 1.0747148914e-6 - 1.027264992e-7) := by
        apply div_le_div_of_nonneg_left (by norm_num) (by norm_num)
        linarith [tails_new']
    _ ≤ 1.404898426735 := refined_final.le

/-- **The source bound** (Heilman–Jones–Malavolta, Theorem 1.1, upper half) from the same
inputs with the source's weights and the source's weaker reserves `1/268` and `2.615·10⁻⁴`. -/
theorem complex_grothendieck_source
    (k : Fin 6 → ℕ → ℝ) (hk : ∀ i, Summable fun n => |k i n|)
    (hdom : ∀ i, DominatedKernel (radialKernel (k i)))
    (hq0 : 0.71179640805640433452 ≤ mixCoeff wOld k 0)
    (hprefix : ∑ n ∈ Finset.Ico 1 120, |mixCoeff wOld k n| ≤ 1.074829404498064e-6)
    (hcauchy0 : ∑' n, |k 0 (n + 120)| ≤ cauchyTail 1.2)
    (hcauchy1 : ∑' n, |k 1 (n + 120)| ≤ cauchyTail 1.11)
    (hcauchy2 : ∑' n, |k 2 (n + 120)| ≤ cauchyTail 1.11)
    (hcauchy3 : ∑' n, |k 3 (n + 120)| ≤ cauchyTail 1.11)
    (hfifth : ∑' n, |k 4 (n + 120)| ≤
      finite5 / wOld 4 + ∑' m, h (m + 67) * l1 (P5 ^ (2 * (m + 67) + 1)))
    (hsixth : ∑' n, |k 5 (n + 120)| ≤
      Real.sqrt (1.174 * W 120) + Real.sqrt (1.176 * W 120)
        + Real.sqrt (1.174 * 1.176) / 241 ^ 2) :
    IsGrothendieckBound 1.404898554745441 := by
  have htail : ∀ i, ∑' n, |k i (n + 120)| ≤ tBoundOld i := by
    intro i
    fin_cases i
    · simpa [tBoundOld, R] using hcauchy0
    · simpa [tBoundOld, R] using hcauchy1
    · simpa [tBoundOld, R] using hcauchy2
    · simpa [tBoundOld, R] using hcauchy3
    · change _ ≤ finite5 / wOld 4 + fifthReserveOld
      exact hfifth.trans (add_le_add le_rfl fifth_omitted_tail_source)
    · change _ ≤ sixthTOld
      exact hsixth.trans sixth_majorant_le_source
  have hpos : 0 < (0.71179640805640433452 : ℝ) - 1.074829404498064e-6
      - ∑ i, wOld i * tBoundOld i := by
    linarith [tails_old']
  have hB := bound_of_certificate wOld wOld_pos k hk hdom _ _ tBoundOld hq0 hprefix htail hpos
  refine hB.mono ?_
  rw [mass_old]
  calc (1.0000000000000000975976 : ℝ)
        / (0.71179640805640433452 - 1.074829404498064e-6 - ∑ i, wOld i * tBoundOld i)
      ≤ 1.0000000000000000975976 / (0.71179640805640433452 - 1.074829404498064e-6 - 1.67218594072e-7) := by
        apply div_le_div_of_nonneg_left (by norm_num) (by norm_num)
        linarith [tails_old']
    _ ≤ 1.404898554745441 := source_final'.le

end

end Grothe
