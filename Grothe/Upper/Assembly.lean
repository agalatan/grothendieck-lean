import Grothe.Upper.Mixture
import Grothe.Upper.Interface
import Grothe.Upper.Preprocessor
import Grothe.Upper.Composition
import Grothe.Upper.JointTail
import Grothe.Upper.FifthTail

/-!
# Assembly of the certificate

`bound_of_certificate` turns the finite certificate statement `FiniteCertificate Dlo`
(established by the interval checker) together with the analytic inputs into
`K_G^ℂ ≤ M / (Dlo − ε − T)`, where `ε` bounds the sixth-kernel coefficient error of the
truncated integrals (from the joint `ℓ²` truncation bound `e⁻¹⁸` and the box-derived norms
`‖A‖₂, ‖B‖₂ ≤ nBox`) and `T` the weighted tails beyond the retained modes.
`grothendieck_of_slope` adds the numerics: if `Dlo ≥ DloNeeded` then
`K_G^ℂ ≤ 1.404898357808`.
-/

namespace Grothe

open Finset Polynomial Upper
open scoped ComplexConjugate

noncomputable section

/-! ### The preprocessor is admissible -/

lemma l1_ofListQ_le (l : List ℚ) : l1 (ofListQ l) ≤ (((l.map fun q => |q|).sum : ℚ) : ℝ) := by
  induction l with
  | nil => simp [ofListQ]
  | cons a l ih =>
    simp only [ofListQ, List.map_cons, List.sum_cons]
    calc l1 (C (a : ℝ) + X * ofListQ l)
        ≤ l1 (C (a : ℝ)) + l1 (X * ofListQ l) := l1_add_le _ _
      _ ≤ |(a : ℝ)| + l1 X * l1 (ofListQ l) := by
          gcongr
          · exact (l1_C _).le
          · exact l1_mul_le _ _
      _ ≤ |(a : ℝ)| + (((l.map fun q => |q|).sum : ℚ) : ℝ) := by
          rw [l1_X, one_mul]; gcongr
      _ = _ := by push_cast; rfl

lemma natDegree_ofListQ_le_pred (l : List ℚ) : (ofListQ l).natDegree ≤ l.length - 1 := by
  induction l with
  | nil => simp [ofListQ]
  | cons a l ih =>
    cases l with
    | nil => simp [ofListQ]
    | cons b l' =>
      simp only [ofListQ, List.length_cons] at ih ⊢
      refine (natDegree_add_le _ _).trans (max_le ?_ ?_)
      · simp
      · refine natDegree_mul_le.trans ?_
        simp only [natDegree_X]
        omega

theorem etaCoeffs_abs_sum : (etaCoeffs.map fun q => |q|).sum = 1 := by native_decide

theorem l1_etaPoly_le : l1 etaPoly ≤ 1 := by
  refine (l1_ofListQ_le etaCoeffs).trans ?_
  rw [etaCoeffs_abs_sum]; norm_num

theorem natDegree_etaPoly_le : etaPoly.natDegree ≤ 119 := by
  refine (natDegree_ofListQ_le_pred etaCoeffs).trans ?_
  decide

/-- Two kernels that agree on the closed unit disc are simultaneously dominated. -/
lemma DominatedKernel.congr_disc {Q Q' : ℂ → ℂ} (hQ : DominatedKernel Q)
    (h : ∀ z : ℂ, ‖z‖ ≤ 1 → Q z = Q' z) : DominatedKernel Q' := by
  intro m n A ι _ x y hx hy
  have := hQ m n A ι x y hx hy
  have hz1 : ∀ i j, ‖inner ℂ (x i) (y j)‖ ≤ 1 := fun i j => by
    have := norm_inner_le_norm (𝕜 := ℂ) (x i) (y j)
    rwa [hx, hy, one_mul] at this
  convert this using 4 with i _ j _
  rw [h _ (hz1 i j)]

/-- The boxed composition vanishes beyond radial index `maxIndex`. -/
lemma compose_boxed_eq_zero (A B : ℕ → ℂ) {n : ℕ} (hn : maxIndex < n) :
    compose (boxedCoeff A B) etaPoly n = 0 := by
  unfold compose
  apply Finset.sum_eq_zero
  intro j _
  simp only [maxIndex] at hn
  by_cases hj : j < modes
  · have hj' : j < 480 := hj
    have hdeg : (etaPoly ^ (2 * j + 1)).natDegree < n - j := by
      calc (etaPoly ^ (2 * j + 1)).natDegree ≤ (2 * j + 1) * etaPoly.natDegree :=
            natDegree_pow_le
        _ ≤ (2 * j + 1) * 119 := by gcongr; exact natDegree_etaPoly_le
        _ < n - j := by omega
    rw [coeff_eq_zero_of_natDegree_lt hdeg, mul_zero]
  · unfold boxedCoeff
    rw [if_neg hj, zero_mul]

/-! ### Error of the truncated sixth-kernel coefficients -/

/-- `d = e⁻¹⁸ ≤ 1/2.7182818283¹⁸`. -/
def dHi : ℚ := 1 / 2.7182818283 ^ 18

lemma exp_neg_18_le : Real.exp (-18) ≤ (dHi : ℝ) := by
  have h := Real.exp_one_gt_d9
  have h18 : Real.exp 18 = Real.exp 1 ^ 18 := by
    rw [← Real.exp_nat_mul]; norm_num
  rw [Real.exp_neg, h18]
  unfold dHi
  push_cast
  rw [one_div, inv_le_inv₀ (by positivity) (by positivity)]
  exact pow_le_pow_left₀ (by norm_num) h.le 18

/-- Box-derived bound on the `ℓ²` norms of the truncated coefficient vectors: `‖A‖₂, ‖B‖₂ ≤ nBox`. -/
def nBox : ℚ := 49987/50000

/-- The weighted coefficient-error budget `ε = w₆ (d(‖A‖₂ + ‖B‖₂) + d²)` with `‖A‖₂, ‖B‖₂ ≤ nBox`. -/
def epsW : ℚ := 3027990859/250000000000000000000

lemma epsW_bound :
    wt 5 * ((dHi : ℝ) * nBox + (dHi : ℝ) ^ 2 + nBox * dHi) ≤ (epsW : ℝ) := by
  simp only [wt, dHi, epsW, nBox]
  norm_num

lemma sq_le_boxSq {lo hi x : ℝ} (h1 : lo ≤ x) (h2 : x ≤ hi) : x ^ 2 ≤ (max |lo| |hi|) ^ 2 := by
  have hx : |x| ≤ max |lo| |hi| := by
    rcases le_total 0 x with hx | hx
    · rw [abs_of_nonneg hx]; exact (h2.trans (le_abs_self hi)).trans (le_max_right _ _)
    · rw [abs_of_nonpos hx]
      exact (by linarith [neg_abs_le lo] : -x ≤ |lo|).trans (le_max_left _ _)
  calc x ^ 2 = |x| ^ 2 := (sq_abs x).symm
    _ ≤ _ := pow_le_pow_left₀ (abs_nonneg _) hx 2

/-- Sum of the squared box maxima over the retained indices. -/
def boxSqSum (lo hi : List ℚ) : ℚ :=
  ∑ n ∈ range modes, (max |coeffQ lo n| |coeffQ hi n|) ^ 2

theorem aBoxSq_le : boxSqSum aReLo aReHi + boxSqSum aImLo aImHi ≤ nBox ^ 2 := by native_decide
theorem bBoxSq_le : boxSqSum bReLo bReHi + boxSqSum bImLo bImHi ≤ nBox ^ 2 := by native_decide

lemma normSq_sum_le_of_box (lo₁ hi₁ lo₂ hi₂ : List ℚ) (A : ℕ → ℂ)
    (hA : ∀ n < modes, ((coeffQ lo₁ n : ℝ) ≤ (A n).re ∧ (A n).re ≤ coeffQ hi₁ n) ∧
      ((coeffQ lo₂ n : ℝ) ≤ (A n).im ∧ (A n).im ≤ coeffQ hi₂ n))
    (hbox : boxSqSum lo₁ hi₁ + boxSqSum lo₂ hi₂ ≤ nBox ^ 2) :
    ∑ n ∈ range modes, ‖A n‖ ^ 2 ≤ (nBox : ℝ) ^ 2 := by
  have key : ((∑ n ∈ range modes, ((max |coeffQ lo₁ n| |coeffQ hi₁ n|) ^ 2
      + (max |coeffQ lo₂ n| |coeffQ hi₂ n|) ^ 2) : ℚ) : ℝ) ≤ (nBox : ℝ) ^ 2 := by
    unfold boxSqSum at hbox
    rw [← Finset.sum_add_distrib] at hbox
    exact_mod_cast hbox
  refine le_trans ?_ key
  rw [Rat.cast_sum]
  refine sum_le_sum fun n hn => ?_
  have hn' : n < modes := by simpa using hn
  obtain ⟨⟨h1, h2⟩, ⟨h3, h4⟩⟩ := hA n hn'
  have e1 := sq_le_boxSq h1 h2
  have e2 := sq_le_boxSq h3 h4
  rw [Complex.sq_norm, Complex.normSq_apply]
  push_cast
  nlinarith [e1, e2]

lemma normSq_sum_le_of_boxA (A : ℕ → ℂ) (hA : InBoxA A) :
    ∑ n ∈ range modes, ‖A n‖ ^ 2 ≤ (nBox : ℝ) ^ 2 :=
  normSq_sum_le_of_box _ _ _ _ A hA aBoxSq_le

lemma normSq_sum_le_of_boxB (B : ℕ → ℂ) (hB : InBoxB B) :
    ∑ n ∈ range modes, ‖B n‖ ^ 2 ≤ (nBox : ℝ) ^ 2 :=
  normSq_sum_le_of_box _ _ _ _ B hB bBoxSq_le

/-- `∑_{n<modes} |Re(aₙ b̄ₙ) − Re(Aₙ B̄ₙ)| ≤ d·nB + d² + nA·d` when `‖a−A‖₂, ‖b−B‖₂ ≤ d`,
`‖A‖₂ ≤ nA` and `‖B‖₂ ≤ nB`. -/
theorem coeff_error_le (a b A B : ℕ → ℂ) (d : ℝ) (hd : 0 ≤ d)
    (herrA : ∑ n ∈ range modes, ‖a n - A n‖ ^ 2 ≤ d ^ 2)
    (herrB : ∑ n ∈ range modes, ‖b n - B n‖ ^ 2 ≤ d ^ 2)
    (nA nB : ℝ) (hnA : 0 ≤ nA) (hnB : 0 ≤ nB)
    (hA2 : ∑ n ∈ range modes, ‖A n‖ ^ 2 ≤ nA ^ 2) (hB2 : ∑ n ∈ range modes, ‖B n‖ ^ 2 ≤ nB ^ 2) :
    ∑ n ∈ range modes, |(a n * conj (b n)).re - (A n * conj (B n)).re|
      ≤ d * nB + d ^ 2 + nA * d := by
  have hterm : ∀ n, |(a n * conj (b n)).re - (A n * conj (B n)).re|
      ≤ ‖a n - A n‖ * ‖B n‖ + ‖a n - A n‖ * ‖b n - B n‖ + ‖A n‖ * ‖b n - B n‖ := by
    intro n
    have e : a n * conj (b n) - A n * conj (B n)
        = (a n - A n) * conj (B n) + (a n - A n) * conj (b n - B n) + A n * conj (b n - B n) := by
      simp only [map_sub]; ring
    rw [← Complex.sub_re, e]
    calc |((a n - A n) * conj (B n) + (a n - A n) * conj (b n - B n) + A n * conj (b n - B n)).re|
        ≤ ‖(a n - A n) * conj (B n) + (a n - A n) * conj (b n - B n) + A n * conj (b n - B n)‖ :=
          Complex.abs_re_le_norm _
      _ ≤ ‖(a n - A n) * conj (B n)‖ + ‖(a n - A n) * conj (b n - B n)‖ + ‖A n * conj (b n - B n)‖ :=
          (norm_add_le _ _).trans (add_le_add (norm_add_le _ _) le_rfl)
      _ = _ := by simp only [norm_mul, Complex.norm_conj]
  have hsq : d ^ 2 = Real.sqrt (d ^ 2) * Real.sqrt (d ^ 2) := by
    rw [Real.mul_self_sqrt (sq_nonneg _)]
  have hd' : Real.sqrt (d ^ 2) = d := Real.sqrt_sq hd
  calc ∑ n ∈ range modes, |(a n * conj (b n)).re - (A n * conj (B n)).re|
      ≤ ∑ n ∈ range modes, (‖a n - A n‖ * ‖B n‖ + ‖a n - A n‖ * ‖b n - B n‖
          + ‖A n‖ * ‖b n - B n‖) := sum_le_sum fun n _ => hterm n
    _ = ∑ n ∈ range modes, ‖a n - A n‖ * ‖B n‖ + ∑ n ∈ range modes, ‖a n - A n‖ * ‖b n - B n‖
          + ∑ n ∈ range modes, ‖A n‖ * ‖b n - B n‖ := by rw [sum_add_distrib, sum_add_distrib]
    _ ≤ Real.sqrt (d ^ 2) * Real.sqrt (nB ^ 2) + Real.sqrt (d ^ 2) * Real.sqrt (d ^ 2)
          + Real.sqrt (nA ^ 2) * Real.sqrt (d ^ 2) := by
        refine add_le_add (add_le_add ?_ ?_) ?_
        · exact sum_mul_le_of_partial modes _ _ (fun n => norm_nonneg _) (fun n => norm_nonneg _)
            _ _ herrA hB2
        · exact sum_mul_le_of_partial modes _ _ (fun n => norm_nonneg _) (fun n => norm_nonneg _)
            _ _ herrA herrB
        · exact sum_mul_le_of_partial modes _ _ (fun n => norm_nonneg _) (fun n => norm_nonneg _)
            _ _ hA2 herrB
    _ = d * nB + d ^ 2 + nA * d := by rw [hd', Real.sqrt_sq hnA, Real.sqrt_sq hnB]; ring

/-! ### Tail constants -/

/-- Cauchy-estimate tail beyond the retained modes: `10 R⁻⁽²ᵐᵒᵈᵉˢ⁺¹⁾/(1 − R⁻²)`. -/
def cauchyTail (r : ℝ) : ℝ := 10 / r ^ (2 * modes + 1) / (1 - 1 / r ^ 2)

/-- Per-kernel tail bounds beyond the retained modes. -/
def tBound : Fin 6 → ℝ :=
  ![cauchyTail 1.2, cauchyTail 1.11, cauchyTail 1.11, cauchyTail 1.11,
    (fifthT : ℝ), (sixthT : ℝ)]

/-- Upper bound for the weighted tail total `T`. -/
def tailsT : ℚ := 1271349759587/200000000000000000000

lemma cauchyTail_12_le : cauchyTail 1.2 ≤ 1 / 10 ^ 70 := by
  have h1 : (284 : ℝ) ≤ 1.2 ^ 31 := by norm_num
  have h2 : (284 : ℝ) ^ 31 ≤ 1.2 ^ (2 * modes + 1) := by
    calc (284 : ℝ) ^ 31 ≤ (1.2 ^ 31) ^ 31 := pow_le_pow_left₀ (by norm_num) h1 31
      _ = 1.2 ^ (2 * modes + 1) := by rw [← pow_mul]; norm_num [modes]
  unfold cauchyTail
  rw [div_div, div_le_div_iff₀ (by positivity) (by norm_num)]
  generalize hx : (1.2 : ℝ) ^ (2 * modes + 1) = x at h2 ⊢
  have hx0 : (0 : ℝ) ≤ x := (by positivity : (0 : ℝ) ≤ 284 ^ 31).trans h2
  have h4 : (0.3 : ℝ) ≤ 1 - 1 / 1.2 ^ 2 := by norm_num
  have h5 := mul_le_mul h2 h4 (by norm_num) hx0
  have h6 : (10 : ℝ) * 10 ^ 70 ≤ (284 : ℝ) ^ 31 * 0.3 := by norm_num
  linarith

lemma cauchyTail_111_le : cauchyTail 1.11 ≤ 1 / 10 ^ 40 := by
  have h1 : (25 : ℝ) ≤ 1.11 ^ 31 := by norm_num
  have h2 : (25 : ℝ) ^ 31 ≤ 1.11 ^ (2 * modes + 1) := by
    calc (25 : ℝ) ^ 31 ≤ (1.11 ^ 31) ^ 31 := pow_le_pow_left₀ (by norm_num) h1 31
      _ = 1.11 ^ (2 * modes + 1) := by rw [← pow_mul]; norm_num [modes]
  unfold cauchyTail
  rw [div_div, div_le_div_iff₀ (by positivity) (by norm_num)]
  generalize hx : (1.11 : ℝ) ^ (2 * modes + 1) = x at h2 ⊢
  have hx0 : (0 : ℝ) ≤ x := (by positivity : (0 : ℝ) ≤ 25 ^ 31).trans h2
  have h4 : (0.188 : ℝ) ≤ 1 - 1 / 1.11 ^ 2 := by norm_num
  have h5 := mul_le_mul h2 h4 (by norm_num) hx0
  have h6 : (10 : ℝ) * 10 ^ 40 ≤ (25 : ℝ) ^ 31 * 0.188 := by norm_num
  linarith

theorem tails_le : ∑ i, wt i * tBound i ≤ (tailsT : ℝ) := by
  have h0 := cauchyTail_12_le
  have h1 := cauchyTail_111_le
  have e0 : tBound 0 = cauchyTail 1.2 := rfl
  have e1 : tBound 1 = cauchyTail 1.11 := rfl
  have e2 : tBound 2 = cauchyTail 1.11 := rfl
  have e3 : tBound 3 = cauchyTail 1.11 := rfl
  have e4 : tBound 4 = (fifthT : ℝ) := rfl
  have e5 : tBound 5 = (sixthT : ℝ) := rfl
  have w0 := (wt_pos 0).le
  have w1 := (wt_pos 1).le
  have w2 := (wt_pos 2).le
  have w3 := (wt_pos 3).le
  calc ∑ i, wt i * tBound i
      = wt 0 * tBound 0 + wt 1 * tBound 1 + wt 2 * tBound 2 + wt 3 * tBound 3
          + wt 4 * tBound 4 + wt 5 * tBound 5 := by rw [Fin.sum_univ_six]
    _ ≤ wt 0 * (1 / 10 ^ 70) + wt 1 * (1 / 10 ^ 40) + wt 2 * (1 / 10 ^ 40)
          + wt 3 * (1 / 10 ^ 40) + wt 4 * (fifthT : ℝ) + wt 5 * (sixthT : ℝ) := by
        rw [e0, e1, e2, e3, e4, e5]
        gcongr
    _ ≤ (tailsT : ℝ) := by
        norm_num [wt, fifthT, fifthFinite, sixthT, tailsT]

lemma wt_castLE (i : Fin 5) : wt (Fin.castLE (by norm_num) i) = wt i.castSucc := rfl

/-! ### Generic assembly -/

set_option maxHeartbeats 4000000 in
/-- **Assembly of the certificate.** -/
theorem bound_of_certificate (Dlo : ℚ) (hfin : FiniteCertificate Dlo)
    (k : Fin 6 → ℕ → ℝ) (hk : ∀ i, Summable fun n => |k i n|)
    (hdom : ∀ i, DominatedKernel (radialKernel (k i)))
    (A B : ℕ → ℂ) (hA : InBoxA A) (hB : InBoxB B)
    (hscalar : ∀ i : Fin 5, ∀ n < modes, k i.castSucc n = Real.pi * (sProf (rowQ i) n : ℝ))
    (a b : ℕ → ℂ) (hk5 : ∀ n < modes, k 5 n = (a n * conj (b n)).re)
    (herrA : ∑ n ∈ range modes, ‖a n - A n‖ ^ 2 ≤ Real.exp (-18) ^ 2)
    (herrB : ∑ n ∈ range modes, ‖b n - B n‖ ^ 2 ≤ Real.exp (-18) ^ 2)
    (htail : ∀ i, ∑' n, |k i (n + modes)| ≤ tBound i)
    (hpos : 0 < (Dlo : ℝ) - epsW - tailsT) :
    IsGrothendieckBound ((∑ i, wt i) / ((Dlo : ℝ) - epsW - tailsT)) := by
  have hM : 0 < ∑ i, wt i := Finset.sum_pos (fun i _ => wt_pos i) ⟨0, Finset.mem_univ _⟩
  -- the true mixture and its domination after preprocessing
  have hcs : Summable fun n => |mixCoeff wt k n| := mixCoeff_summable wt k hk
  have hmd := mixture_dominated wt wt_pos k hk hdom
  have he : ∑ j ∈ range 121, |etaPoly.coeff j| ≤ 1 :=
    (sum_abs_coeff_le_l1 etaPoly 121).trans l1_etaPoly_le
  have hpre := hmd.comp_physPoly (fun j => etaPoly.coeff j) 121 he
  have hdeg : etaPoly.natDegree < 121 := by have := natDegree_etaPoly_le; omega
  have hcomp : DominatedKernel fun z =>
      (((∑ i, wt i)⁻¹ : ℝ) : ℂ) * radialKernel (compose (mixCoeff wt k) etaPoly) z := by
    refine hpre.congr_disc fun z hz => ?_
    rw [physPoly_coeff_eq etaPoly hdeg z, radialKernel_comp _ hcs _ l1_etaPoly_le hz]
  -- decomposition of the true coefficients
  set cb : ℕ → ℝ := boxedCoeff A B with hcb
  set Rr : ℕ → ℝ := fun n => mixCoeff wt k n - cb n with hRr
  have hcb_zero : ∀ n, modes ≤ n → cb n = 0 := fun n hn => by
    simp only [hcb, boxedCoeff]; rw [if_neg (by omega)]
  have hcb_sum : Summable fun n => |cb n| :=
    summable_of_ne_finset_zero (s := range modes) fun n hn => by
      rw [hcb_zero n (by simpa using hn), abs_zero]
  have hRr_sum : Summable fun n => |Rr n| := by
    have : Summable fun n => |mixCoeff wt k n| + |cb n| := hcs.add hcb_sum
    refine Summable.of_nonneg_of_le (fun n => abs_nonneg _) (fun n => ?_) this
    simp only [hRr]; exact abs_sub _ _
  -- the coefficient error for n < modes
  have hRr_low : ∑ n ∈ range modes, |Rr n| ≤ (epsW : ℝ) := by
    have hd0 : 0 ≤ Real.exp (-18) := (Real.exp_pos _).le
    have hA2 := normSq_sum_le_of_boxA A hA
    have hB2 := normSq_sum_le_of_boxB B hB
    have hnB0 : (0 : ℝ) ≤ nBox := by simp only [nBox]; norm_num
    have hce := coeff_error_le a b A B _ hd0 herrA herrB nBox nBox hnB0 hnB0 hA2 hB2
    have hRr_eq : ∀ n ∈ range modes, |Rr n|
        = wt 5 * |(a n * conj (b n)).re - (A n * conj (B n)).re| := by
      intro n hn
      have hn' : n < modes := by simpa using hn
      simp only [hRr, hcb, boxedCoeff, mixCoeff]
      rw [if_pos hn', Fin.sum_univ_castSucc]
      have hlast : (Fin.last 5 : Fin 6) = 5 := rfl
      rw [hlast, hk5 n hn']
      have : ∑ i : Fin 5, wt i.castSucc * k i.castSucc n
          = Real.pi * ∑ i : Fin 5, wt (Fin.castLE (by norm_num) i) * (sProf (rowQ i) n : ℝ) := by
        rw [Finset.mul_sum]
        refine sum_congr rfl fun i _ => ?_
        rw [hscalar i n hn', wt_castLE]; ring
      rw [this]
      rw [show ∀ x y z : ℝ, x + wt 5 * y - (x + wt 5 * z) = wt 5 * (y - z) from
        fun x y z => by ring]
      rw [abs_mul, abs_of_pos (wt_pos 5)]
    rw [sum_congr rfl hRr_eq, ← Finset.mul_sum]
    calc wt 5 * ∑ n ∈ range modes, |(a n * conj (b n)).re - (A n * conj (B n)).re|
        ≤ wt 5 * (Real.exp (-18) * nBox + Real.exp (-18) ^ 2 + nBox * Real.exp (-18)) :=
          mul_le_mul_of_nonneg_left hce (wt_pos 5).le
      _ ≤ wt 5 * ((dHi : ℝ) * nBox + (dHi : ℝ) ^ 2 + nBox * dHi) := by
          have := exp_neg_18_le
          have h2 := pow_le_pow_left₀ hd0 this 2
          refine mul_le_mul_of_nonneg_left ?_ (wt_pos 5).le
          exact add_le_add (add_le_add (mul_le_mul_of_nonneg_right this hnB0) h2)
            (mul_le_mul_of_nonneg_left this hnB0)
      _ ≤ (epsW : ℝ) := epsW_bound
  -- the tails for n ≥ modes
  have hRr_high : ∑' n, |Rr (n + modes)| ≤ (tailsT : ℝ) := by
    have hki : ∀ i, Summable fun n => |k i (n + modes)| :=
      fun i => (summable_nat_add_iff modes).mpr (hk i)
    have h1 : ∀ n, |Rr (n + modes)| ≤ ∑ i, wt i * |k i (n + modes)| := by
      intro n
      simp only [hRr]
      rw [hcb_zero _ (Nat.le_add_left _ _), sub_zero]
      unfold mixCoeff
      refine (Finset.abs_sum_le_sum_abs _ _).trans (le_of_eq ?_)
      refine sum_congr rfl fun i _ => ?_
      rw [abs_mul, abs_of_pos (wt_pos i)]
    have hs2 : Summable fun n => ∑ i, wt i * |k i (n + modes)| :=
      summable_sum (s := Finset.univ) fun i _ => (hki i).mul_left (wt i)
    calc ∑' n, |Rr (n + modes)|
        ≤ ∑' n, ∑ i, wt i * |k i (n + modes)| :=
          Summable.tsum_le_tsum h1 ((summable_nat_add_iff modes).mpr hRr_sum) hs2
      _ = ∑ i, wt i * ∑' n, |k i (n + modes)| := by
          rw [Summable.tsum_finsetSum fun i _ => (hki i).mul_left (wt i)]
          refine sum_congr rfl fun i _ => ?_
          rw [tsum_mul_left]
      _ ≤ ∑ i, wt i * tBound i :=
          sum_le_sum fun i _ => mul_le_mul_of_nonneg_left (htail i) (wt_pos i).le
      _ ≤ (tailsT : ℝ) := tails_le
  have hRr_total : ∑' n, |Rr n| ≤ (epsW : ℝ) + tailsT := by
    rw [← hRr_sum.sum_add_tsum_nat_add modes]
    exact add_le_add hRr_low hRr_high
  -- composed coefficients
  set P : ℕ → ℝ := compose cb etaPoly with hP
  set ρ : ℕ → ℝ := compose Rr etaPoly with hρ
  have hc' : ∀ n, compose (mixCoeff wt k) etaPoly n = P n + ρ n := by
    intro n
    have : mixCoeff wt k = fun m => cb m + Rr m := by
      funext m; simp only [hRr]; ring
    rw [this, compose_add]
  have hρ_sum : Summable fun n => |ρ n| := summable_abs_compose Rr hRr_sum etaPoly l1_etaPoly_le
  have hρ_le : ∑' n, |ρ n| ≤ (epsW : ℝ) + tailsT :=
    (tsum_abs_compose_le Rr hRr_sum etaPoly l1_etaPoly_le).trans hRr_total
  have hP_zero : ∀ n, maxIndex < n → P n = 0 := fun n hn => compose_boxed_eq_zero A B hn
  have hP_sum : Summable fun n => |P n| :=
    summable_of_ne_finset_zero (s := range (maxIndex + 1)) fun n hn => by
      rw [hP_zero n (by simp only [mem_range, not_lt] at hn; omega), abs_zero]
  have hcsum : Summable fun n => |compose (mixCoeff wt k) etaPoly n| := by
    refine Summable.of_nonneg_of_le (fun n => abs_nonneg _) (fun n => ?_) (hP_sum.add hρ_sum)
    rw [hc']; exact abs_add_le _ _
  -- the finite certificate
  have hfinite := hfin A B hA hB
  -- the repaired slope
  have hS1 : ∑' n, |P (n + 1)| = ∑ n ∈ Finset.Icc 1 maxIndex, |P n| := by
    have hsupp : ∀ n ∉ range maxIndex, |P (n + 1)| = 0 := fun n hn => by
      rw [hP_zero (n + 1) (by simp only [mem_range, not_lt] at hn; omega), abs_zero]
    have hI : Finset.Icc 1 maxIndex = (range maxIndex).map (addLeftEmbedding 1) := by
      ext n
      simp only [mem_Icc, mem_map, mem_range, addLeftEmbedding_apply]
      constructor
      · intro h; exact ⟨n - 1, by omega, by omega⟩
      · rintro ⟨k, hk, rfl⟩; omega
    rw [tsum_eq_sum hsupp, hI, Finset.sum_map]
    refine sum_congr rfl fun n _ => ?_
    simp only [addLeftEmbedding_apply]
    rw [add_comm]
  have hS : ∑' n, |compose (mixCoeff wt k) etaPoly (n + 1)|
      ≤ ∑ n ∈ Finset.Icc 1 maxIndex, |P n| + ∑' n, |ρ (n + 1)| := by
    rw [← hS1, ← Summable.tsum_add ((summable_nat_add_iff 1).mpr hP_sum)
      ((summable_nat_add_iff 1).mpr hρ_sum)]
    refine Summable.tsum_le_tsum (fun n => ?_) ((summable_nat_add_iff 1).mpr hcsum)
      (((summable_nat_add_iff 1).mpr hP_sum).add ((summable_nat_add_iff 1).mpr hρ_sum))
    rw [hc']; exact abs_add_le _ _
  have hρ_split := hρ_sum.tsum_eq_zero_add
  have hc0 : (Dlo : ℝ) - (epsW + tailsT) ≤ |compose (mixCoeff wt k) etaPoly 0|
      - ∑' n, |compose (mixCoeff wt k) etaPoly (n + 1)| := by
    have h0 : P 0 - |ρ 0| ≤ |compose (mixCoeff wt k) etaPoly 0| := by
      rw [hc']
      have h2 : P 0 ≤ |P 0| := le_abs_self _
      have h3 : |P 0| ≤ |P 0 + ρ 0| + |ρ 0| := by
        have := abs_add_le (P 0 + ρ 0) (-ρ 0)
        simpa using this
      linarith
    have hρ0 : |ρ 0| + ∑' n, |ρ (n + 1)| ≤ (epsW : ℝ) + tailsT := by
      rw [← hρ_split]; exact hρ_le
    linarith [hfinite, hS]
  have hpos' : ∑' n, |compose (mixCoeff wt k) etaPoly (n + 1)|
      < |compose (mixCoeff wt k) etaPoly 0| := by linarith
  -- transfer
  unfold radialKernel at hcomp
  have hT := transfer (compose (mixCoeff wt k) etaPoly) hcsum (∑ i, wt i) hM hcomp hpos'
  refine hT.mono ?_
  apply div_le_div_of_nonneg_left hM.le hpos
  linarith

/-! ### The numeric theorem -/

theorem final_numeric :
    (1.000000000000000012 : ℝ) / ((DloNeeded : ℝ) - epsW - tailsT) ≤ 1404898357808 / 10 ^ 12 := by
  simp only [DloNeeded, epsW, tailsT]; norm_num

theorem DloNeeded_pos : 0 < (DloNeeded : ℝ) - epsW - tailsT := by
  simp only [DloNeeded, epsW, tailsT]; norm_num

/-- **The bound from the certified slope**, conditional on the interval checker and the analytic
inputs listed in the hypotheses: if `Dlo ≥ DloNeeded` then `K_G^ℂ ≤ 1.404898357808`. -/
theorem grothendieck_of_slope (Dlo : ℚ) (hDlo : DloNeeded ≤ Dlo)
    (hfin : FiniteCertificate Dlo)
    (k : Fin 6 → ℕ → ℝ) (hk : ∀ i, Summable fun n => |k i n|)
    (hdom : ∀ i, DominatedKernel (radialKernel (k i)))
    (A B : ℕ → ℂ) (hA : InBoxA A) (hB : InBoxB B)
    (hscalar : ∀ i : Fin 5, ∀ n < modes, k i.castSucc n = Real.pi * (sProf (rowQ i) n : ℝ))
    (a b : ℕ → ℂ) (hk5 : ∀ n < modes, k 5 n = (a n * conj (b n)).re)
    (herrA : ∑ n ∈ range modes, ‖a n - A n‖ ^ 2 ≤ Real.exp (-18) ^ 2)
    (herrB : ∑ n ∈ range modes, ‖b n - B n‖ ^ 2 ≤ Real.exp (-18) ^ 2)
    (hcauchy0 : ∑' n, |k 0 (n + modes)| ≤ cauchyTail 1.2)
    (hcauchy1 : ∑' n, |k 1 (n + modes)| ≤ cauchyTail 1.11)
    (hcauchy2 : ∑' n, |k 2 (n + modes)| ≤ cauchyTail 1.11)
    (hcauchy3 : ∑' n, |k 3 (n + modes)| ≤ cauchyTail 1.11)
    (hfifth : ∑' n, |k 4 (n + modes)| ≤
      (fifthFinite : ℝ) + ∑' m, h (320 + m) * l1 (P5 ^ (2 * (320 + m) + 1)))
    (ξ c : ℕ → ℝ) (r s : ℕ → ℂ) (hξ : ∀ n, ξ n ^ 2 = h n)
    (hk5tail : ∀ n, modes ≤ n → k 5 n = ξ n * c n + (r n * conj (s n)).re)
    (hcs : Summable fun n => (2 * ((modes + n : ℕ) : ℝ) + 1) * c (modes + n) ^ 2)
    (hEC : ∑' n, (2 * ((modes + n : ℕ) : ℝ) + 1) * c (modes + n) ^ 2 ≤ 0.000914101356581664)
    (hrs : Summable fun n => (2 * ((modes + n : ℕ) : ℝ) + 1) * ‖r (modes + n)‖ ^ 2)
    (hEL : ∑' n, (2 * ((modes + n : ℕ) : ℝ) + 1) * ‖r (modes + n)‖ ^ 2 ≤ 0.000228630701840557)
    (hss : Summable fun n => (2 * ((modes + n : ℕ) : ℝ) + 1) * ‖s (modes + n)‖ ^ 2)
    (hER : ∑' n, (2 * ((modes + n : ℕ) : ℝ) + 1) * ‖s (modes + n)‖ ^ 2 ≤ 0.000228844330747684) :
    IsGrothendieckBound (1404898357808 / 10 ^ 12) := by
  have htail : ∀ i, ∑' n, |k i (n + modes)| ≤ tBound i := by
    intro i
    fin_cases i
    · exact hcauchy0
    · exact hcauchy1
    · exact hcauchy2
    · exact hcauchy3
    · change _ ≤ ((fifthFinite + 1 / (4 * 320 * 2 ^ 32) : ℚ) : ℝ)
      push_cast
      exact hfifth.trans (add_le_add le_rfl fifth_reserve)
    · change _ ≤ (sixthT : ℝ)
      have hjt := joint_tail_bound modes (by norm_num) ξ c r s _ _ _ hξ hcs hEC hrs hEL hss hER
      have hnum := sixth_tail_numeric _ _ _ (by norm_num) (by norm_num) (by norm_num) le_rfl le_rfl le_rfl
      calc ∑' n, |k 5 (n + modes)|
          = ∑' n, |ξ (modes + n) * c (modes + n) + (r (modes + n) * conj (s (modes + n))).re| := by
            refine tsum_congr fun n => ?_
            rw [add_comm n modes, hk5tail (modes + n) (Nat.le_add_right _ _)]
        _ ≤ _ := hjt
        _ ≤ _ := by
            refine hnum.trans' ?_
            push_cast
            exact le_rfl
  have hpos : 0 < (Dlo : ℝ) - epsW - tailsT := by
    have := DloNeeded_pos
    have h2 : (DloNeeded : ℝ) ≤ Dlo := by exact_mod_cast hDlo
    linarith
  have hB := bound_of_certificate Dlo hfin k hk hdom A B hA hB hscalar a b hk5 herrA herrB
    htail hpos
  refine hB.mono ?_
  rw [wt_mass]
  refine le_trans ?_ final_numeric
  apply div_le_div_of_nonneg_left (by norm_num) DloNeeded_pos
  have h2 : (DloNeeded : ℝ) ≤ Dlo := by exact_mod_cast hDlo
  linarith

end

end Grothe
