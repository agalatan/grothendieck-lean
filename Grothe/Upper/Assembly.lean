import Grothe.Upper.Mixture
import Grothe.Upper.Interface
import Grothe.Upper.Preprocessor
import Grothe.Upper.Composition

import Grothe.Upper.Checker
import Grothe.WallisTail

/-!
# The generic transfer for mixtures

`bound_of_branches`: a positive mixture of dominated radial kernels `kᵢ`, each split as a retained
part `Pᵢ` (supported on `n < K`) plus a remainder of coefficient norm at most `τᵢ`, gives
`K_G^ℂ ≤ M / Dlo` whenever `Dlo ≤ P₀ − Σ_{n=1}^{K−1} |Pₙ| − Σᵢ wᵢ τᵢ` for the mixed retained
coefficients `P`.

The file also collects the facts about Haagerup's kernel used by the certificate: summability,
`Σ hₙ ≤ 1` (a consequence of domination), `hₙ = π · hRat n`, the exact scalar profile of `𝔥 ∘ ρ`
and the positive-majorant comparison.
-/

namespace Grothe

open Finset Polynomial Upper
open scoped ComplexConjugate

noncomputable section

/-! ### The preprocessors are admissible -/

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

/-! ### Haagerup's kernel -/

lemma h_summable : Summable fun n => |h n| := by
  have := h_tail_summable 1 le_rfl
  have h1 : Summable fun n => h (n + 1) := this.congr fun n => by rw [add_comm]
  have h2 : Summable h := (summable_nat_add_iff 1).mp h1
  exact h2.congr fun n => (abs_of_nonneg (h_nonneg n)).symm

lemma scalarOpt_le_sum {m n : ℕ} (A : Fin m → Fin n → ℂ) : scalarOpt A ≤ ∑ i, ∑ j, ‖A i j‖ := by
  apply csSup_le (scalarSet_nonempty A)
  rintro r ⟨ε, δ, hε, hδ, rfl⟩
  calc ‖∑ i, ∑ j, A i j * (conj (ε i) * δ j)‖
      ≤ ∑ i, ∑ j, ‖A i j * (conj (ε i) * δ j)‖ :=
        (norm_sum_le _ _).trans (sum_le_sum fun i _ => norm_sum_le _ _)
    _ = ∑ i, ∑ j, ‖A i j‖ := by simp [hε, hδ]

/-- A dominated radial kernel with nonnegative coefficients has coefficient sum at most one
(evaluate at `z = 1`). -/
theorem tsum_le_one_of_dominated {c : ℕ → ℝ} (hc0 : ∀ n, 0 ≤ c n)
    (hdom : DominatedKernel (radialKernel c)) : ∑' n, c n ≤ 1 := by
  have key := hdom 1 1 (fun _ _ => 1) Unit (fun _ => EuclideanSpace.single () 1)
    (fun _ => EuclideanSpace.single () 1) (fun _ => by simp) (fun _ => by simp)
  have hinner : inner ℂ (EuclideanSpace.single () (1 : ℂ)) (EuclideanSpace.single () (1 : ℂ)) = 1 := by
    simp
  simp only [hinner, Fin.sum_univ_one, one_mul] at key
  have hopt : scalarOpt (fun (_ : Fin 1) (_ : Fin 1) => (1 : ℂ)) ≤ 1 := by
    refine (scalarOpt_le_sum _).trans ?_
    simp
  have hval : radialKernel c 1 = ((∑' n, c n : ℝ) : ℂ) := by
    unfold radialKernel
    rw [Complex.ofReal_tsum]
    refine tsum_congr fun n => ?_
    simp
  rw [hval, Complex.norm_real, Real.norm_eq_abs,
    abs_of_nonneg (tsum_nonneg hc0)] at key
  exact key.trans hopt

/-! ### The positive coefficient majorant -/

lemma abs_coeff_mul_le {p q P Q : ℝ[X]} (hp : ∀ n, |p.coeff n| ≤ P.coeff n)
    (hq : ∀ n, |q.coeff n| ≤ Q.coeff n) (n : ℕ) : |(p * q).coeff n| ≤ (P * Q).coeff n := by
  rw [coeff_mul, coeff_mul]
  refine (Finset.abs_sum_le_sum_abs _ _).trans (sum_le_sum fun ij _ => ?_)
  rw [abs_mul]
  exact mul_le_mul (hp _) (hq _) (abs_nonneg _) ((abs_nonneg _).trans (hp _))

lemma abs_coeff_pow_le {p P : ℝ[X]} (hp : ∀ n, |p.coeff n| ≤ P.coeff n) (m : ℕ) (n : ℕ) :
    |(p ^ m).coeff n| ≤ (P ^ m).coeff n := by
  induction m generalizing n with
  | zero => simp only [pow_zero, coeff_one]; split_ifs <;> simp
  | succ m ih =>
    rw [pow_succ, pow_succ]
    exact abs_coeff_mul_le ih hp n

lemma abs_compose_le_majorant {c : ℕ → ℝ} (hc : ∀ j, 0 ≤ c j) {E Ea : ℝ[X]}
    (hE : ∀ n, |E.coeff n| ≤ Ea.coeff n) (n : ℕ) : |compose c E n| ≤ compose c Ea n := by
  unfold compose
  refine (Finset.abs_sum_le_sum_abs _ _).trans (sum_le_sum fun j _ => ?_)
  rw [abs_mul, abs_of_nonneg (hc j)]
  exact mul_le_mul_of_nonneg_left (abs_coeff_pow_le hE _ _) (hc j)

lemma compose_nonneg {c : ℕ → ℝ} (hc : ∀ j, 0 ≤ c j) {Ea : ℝ[X]} (hEa : ∀ n, 0 ≤ Ea.coeff n)
    (n : ℕ) : 0 ≤ compose c Ea n := by
  have : ∀ m k, 0 ≤ (Ea ^ m).coeff k := by
    intro m
    induction m with
    | zero => intro k; simp only [pow_zero, coeff_one]; split_ifs <;> simp
    | succ m ih =>
      intro k
      rw [pow_succ, coeff_mul]
      exact sum_nonneg fun ij _ => mul_nonneg (ih _) (hEa _)
  unfold compose
  exact sum_nonneg fun j _ => mul_nonneg (hc j) (this _ _)

/-- The recursion of Haagerup's coefficients. -/
lemma h_succ (n : ℕ) :
    h (n + 1) = h n * ((2 * (n : ℝ) + 1) ^ 2) / (4 * ((n : ℝ) + 1) * ((n : ℝ) + 2)) := by
  rw [h_eq, h_eq, pc_succ, mul_pow, div_pow]
  have h1 : (0 : ℝ) < (n : ℝ) + 1 := by positivity
  have h2 : (0 : ℝ) < (n : ℝ) + 2 := by positivity
  have h3 : (0 : ℝ) < 2 * (n : ℝ) + 2 := by positivity
  push_cast
  field_simp
  ring

theorem h_eq_pi_mul_hRat (n : ℕ) : h n = Real.pi * (Upper.hRat n : ℝ) := by
  induction n with
  | zero =>
    rw [h, Upper.hRat]
    simp
    ring
  | succ n ih =>
    rw [h_succ, ih, Upper.hRat]
    push_cast
    ring

/-- Efficient evaluation of `∑_{k<K} hRat (n+k) / (2(n+k)+1)` given `cur = hRat n`. -/

lemma compose_h_eq_pi_sProf (row : List ℚ) (n : ℕ) :
    compose h (ofListQ row) n = Real.pi * (sProf row n : ℝ) := by
  rw [sProf_eq_compose]
  unfold compose
  rw [Finset.mul_sum]
  refine sum_congr rfl fun j _ => ?_
  rw [h_eq_pi_mul_hRat]
  ring

/-! ### Generic assembly -/

set_option maxHeartbeats 4000000 in
/-- **Generic assembly.**  Dominated summable radial kernels `kᵢ`, positive weights `wᵢ`,
retained parts `Pᵢ` supported on `n < K`, remainders of coefficient norm at most `τᵢ`, and
`Dlo ≤ P₀ − Σ_{n=1}^{K−1} |Pₙ| − Σᵢ wᵢ τᵢ > 0` for `P = Σᵢ wᵢ Pᵢ` give
`K_G^ℂ ≤ (Σᵢ wᵢ) / Dlo`. -/
theorem bound_of_branches {m : ℕ} (hm : 0 < m) (w : Fin m → ℝ) (hw : ∀ i, 0 < w i)
    (k : Fin m → ℕ → ℝ) (hk : ∀ i, Summable fun n => |k i n|)
    (hdom : ∀ i, DominatedKernel (radialKernel (k i)))
    (K : ℕ) (hK : 0 < K) (P : Fin m → ℕ → ℝ) (hP : ∀ i n, K ≤ n → P i n = 0)
    (τ : Fin m → ℝ) (hτ : ∀ i, ∑' n, |k i n - P i n| ≤ τ i)
    (Dlo : ℝ) (hpos : 0 < Dlo)
    (hDlo : Dlo ≤ ∑ i, w i * P i 0 - ∑ n ∈ Icc 1 (K - 1), |∑ i, w i * P i n| - ∑ i, w i * τ i) :
    IsGrothendieckBound ((∑ i, w i) / Dlo) := by
  have hM : 0 < ∑ i, w i := Finset.sum_pos (fun i _ => hw i) ⟨⟨0, hm⟩, Finset.mem_univ _⟩
  have hcs : Summable fun n => |mixCoeff w k n| := mixCoeff_summable w k hk
  have hmd := mixture_dominated hm w hw k hk hdom
  -- summability of the pieces
  have hPi_sum : ∀ i, Summable fun n => |P i n| := fun i =>
    summable_of_ne_finset_zero (s := range K) fun n hn => by
      rw [hP i n (by simpa using hn), abs_zero]
  have hRi_sum : ∀ i, Summable fun n => |k i n - P i n| := fun i =>
    Summable.of_nonneg_of_le (fun n => abs_nonneg _) (fun n => abs_sub _ _) ((hk i).add (hPi_sum i))
  obtain ⟨Pm, hPm⟩ : ∃ Pm : ℕ → ℝ, ∀ n, Pm n = ∑ i, w i * P i n := ⟨_, fun _ => rfl⟩
  obtain ⟨Rm, hRm⟩ : ∃ Rm : ℕ → ℝ, ∀ n, Rm n = ∑ i, w i * (k i n - P i n) := ⟨_, fun _ => rfl⟩
  have hc' : ∀ n, mixCoeff w k n = Pm n + Rm n := by
    intro n; rw [hPm, hRm]; unfold mixCoeff; rw [← sum_add_distrib]
    exact sum_congr rfl fun i _ => by ring
  have hPm_zero : ∀ n, K ≤ n → Pm n = 0 := fun n hn => by
    rw [hPm]; exact sum_eq_zero fun i _ => by rw [hP i n hn, mul_zero]
  have hPm_sum : Summable fun n => |Pm n| :=
    summable_of_ne_finset_zero (s := range K) fun n hn => by
      rw [hPm_zero n (by simpa using hn), abs_zero]
  have hRm_le : ∀ n, |Rm n| ≤ ∑ i, w i * |k i n - P i n| := fun n => by
    rw [hRm]
    refine (Finset.abs_sum_le_sum_abs _ _).trans (le_of_eq ?_)
    exact sum_congr rfl fun i _ => by rw [abs_mul, abs_of_pos (hw i)]
  have hRm_bound_sum : Summable fun n => ∑ i, w i * |k i n - P i n| :=
    summable_sum (s := Finset.univ) fun i _ => (hRi_sum i).mul_left (w i)
  have hRm_sum : Summable fun n => |Rm n| :=
    Summable.of_nonneg_of_le (fun n => abs_nonneg _) hRm_le hRm_bound_sum
  have hRm_total : ∑' n, |Rm n| ≤ ∑ i, w i * τ i := by
    calc ∑' n, |Rm n| ≤ ∑' n, ∑ i, w i * |k i n - P i n| :=
          Summable.tsum_le_tsum hRm_le hRm_sum hRm_bound_sum
      _ = ∑ i, w i * ∑' n, |k i n - P i n| := by
          rw [Summable.tsum_finsetSum fun i _ => (hRi_sum i).mul_left (w i)]
          exact sum_congr rfl fun i _ => by rw [tsum_mul_left]
      _ ≤ ∑ i, w i * τ i := sum_le_sum fun i _ => mul_le_mul_of_nonneg_left (hτ i) (hw i).le
  -- the slope
  have hS1 : ∑' n, |Pm (n + 1)| = ∑ n ∈ Icc 1 (K - 1), |Pm n| := by
    have hsupp : ∀ n ∉ range (K - 1), |Pm (n + 1)| = 0 := fun n hn => by
      rw [hPm_zero (n + 1) (by simp only [mem_range, not_lt] at hn; omega), abs_zero]
    have hI : Icc 1 (K - 1) = (range (K - 1)).map (addLeftEmbedding 1) := by
      ext n
      simp only [mem_Icc, mem_map, mem_range, addLeftEmbedding_apply]
      constructor
      · intro h; exact ⟨n - 1, by omega, by omega⟩
      · rintro ⟨j, hj, rfl⟩; omega
    rw [tsum_eq_sum hsupp, hI, Finset.sum_map]
    refine sum_congr rfl fun n _ => ?_
    simp only [addLeftEmbedding_apply]
    rw [add_comm]
  have hS : ∑' n, |mixCoeff w k (n + 1)| ≤ ∑ n ∈ Icc 1 (K - 1), |Pm n| + ∑' n, |Rm (n + 1)| := by
    rw [← hS1, ← Summable.tsum_add ((summable_nat_add_iff 1).mpr hPm_sum)
      ((summable_nat_add_iff 1).mpr hRm_sum)]
    refine Summable.tsum_le_tsum (fun n => ?_) ((summable_nat_add_iff 1).mpr hcs)
      (((summable_nat_add_iff 1).mpr hPm_sum).add ((summable_nat_add_iff 1).mpr hRm_sum))
    rw [hc']; exact abs_add_le _ _
  have hRm_split := hRm_sum.tsum_eq_zero_add
  have hc0 : Dlo ≤ |mixCoeff w k 0| - ∑' n, |mixCoeff w k (n + 1)| := by
    have h0 : Pm 0 - |Rm 0| ≤ |mixCoeff w k 0| := by
      rw [hc']
      have h2 : Pm 0 ≤ |Pm 0| := le_abs_self _
      have h3 : |Pm 0| ≤ |Pm 0 + Rm 0| + |Rm 0| := by
        have := abs_add_le (Pm 0 + Rm 0) (-Rm 0)
        simpa using this
      linarith
    have hρ0 : |Rm 0| + ∑' n, |Rm (n + 1)| ≤ ∑ i, w i * τ i := by
      rw [← hRm_split]; exact hRm_total
    rw [hPm] at h0
    have e : ∑ n ∈ Icc 1 (K - 1), |Pm n| = ∑ n ∈ Icc 1 (K - 1), |∑ i, w i * P i n| :=
      sum_congr rfl fun n _ => by rw [hPm]
    rw [e] at hS
    linarith [hDlo, hS]
  have hpos' : ∑' n, |mixCoeff w k (n + 1)| < |mixCoeff w k 0| := by linarith
  -- transfer
  unfold radialKernel at hmd
  have hT := transfer (mixCoeff w k) hcs (∑ i, w i) hM hmd hpos'
  refine hT.mono ?_
  apply div_le_div_of_nonneg_left hM.le hpos
  linarith

/-! ### The numeric theorem -/

end

end Grothe
