import Grothe.Upper.Mixture
import Grothe.Upper.Interface
import Grothe.Upper.Preprocessor
import Grothe.Upper.Composition
import Grothe.Upper.JointTail
import Grothe.Upper.Checker

/-!
# Assembly of the certificate

`bound_of_branches` is the generic transfer: a positive mixture of dominated radial kernels
`kᵢ`, each split as a retained part `Pᵢ` (supported on `n < K`) plus a remainder of
coefficient norm at most `τᵢ`, gives `K_G^ℂ ≤ M / Dlo` whenever
`Dlo ≤ P₀ − Σ_{n=1}^{K−1} |Pₙ| − Σᵢ wᵢ τᵢ` for the mixed retained coefficients `P`.

`grothendieck_of_slope` instantiates it with the `49` branches of the certificate:

* a scalar branch `𝔥 ∘ ρᵢ` is dominated because Haagerup's kernel is and the preprocessor is
  admissible; its remainder is its tail beyond `cutoff`, bounded by the positive coefficient
  majorant `1 − Σ_{n<cutoff} (𝔥 ∘ |ρᵢ|)_n` (using `Σ hₙ ≤ 1`, a consequence of domination), or by
  the Cauchy estimate `cauchyTail r` of its analytic continuation;
* an origin branch `H ∘ ρᵢ` is dominated because `H` is; its remainder consists of the discarded
  coefficients of the finite composition, the composed truncation error
  `e⁻¹⁸(‖A‖₂ + ‖B‖₂) + e⁻³⁶` and the composed tail of `H` beyond `modes` (`tailH`, `tailHs`),
  the last two transported by the contraction `‖E ∘ ρ‖_𝒜 ≤ ‖E‖_𝒜`.
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

/-- Every preprocessor has coefficient norm at most one. -/
theorem absRow_sum_le_one : ∀ i : Fin branches, (absRow i).sum ≤ 1 := by native_decide

theorem l1_polyOf_le (i : Fin branches) : l1 (polyOf i) ≤ 1 := by
  refine (l1_ofListQ_le (rowQ i)).trans ?_
  have := absRow_sum_le_one i
  unfold absRow at this
  exact_mod_cast this

theorem l1_absPoly_le (i : Fin branches) : l1 (ofListQ (absRow i)) ≤ 1 := by
  refine (l1_ofListQ_le (absRow i)).trans ?_
  have h1 := absRow_sum_le_one i
  have h2 : (absRow i).map (fun q => |q|) = absRow i := by
    unfold absRow
    rw [List.map_map]
    refine List.map_congr_left fun q _ => ?_
    simp [abs_abs]
  rw [h2]
  exact_mod_cast h1

lemma natDegree_polyOf_lt (i : Fin branches) : (polyOf i).natDegree < (rowQ i).length + 1 := by
  have := natDegree_ofListQ_le_pred (rowQ i)
  unfold polyOf
  omega

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

/-- Composing a dominated radial kernel with the preprocessor of branch `i` gives a dominated
radial kernel. -/
theorem dominated_compose {c : ℕ → ℝ} (hc : Summable fun n => |c n|)
    (hdom : DominatedKernel (radialKernel c)) (i : Fin branches) :
    DominatedKernel (radialKernel (compose c (polyOf i))) := by
  have he : ∑ j ∈ range ((rowQ i).length + 1), |(polyOf i).coeff j| ≤ 1 :=
    (sum_abs_coeff_le_l1 _ _).trans (l1_polyOf_le i)
  have hpre := hdom.comp_physPoly (fun j => (polyOf i).coeff j) _ he
  refine hpre.congr_disc fun z hz => ?_
  rw [physPoly_coeff_eq (polyOf i) (natDegree_polyOf_lt i) z,
    radialKernel_comp _ hc _ (l1_polyOf_le i) hz]

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

lemma coeff_absPoly_eq (i : Fin branches) (n : ℕ) :
    (ofListQ (absRow i)).coeff n = |(polyOf i).coeff n| := by
  unfold polyOf absRow
  rw [coeff_ofListQ, coeff_ofListQ]
  unfold coeffQ
  have : ∀ (l : List ℚ) (n : ℕ), (l.map fun q => |q|).getD n 0 = |l.getD n 0| := by
    intro l
    induction l with
    | nil => intro n; simp
    | cons a l ih =>
      intro n
      cases n with
      | zero => simp
      | succ n => simp only [List.map_cons, List.getD_cons_succ]; exact ih n
  rw [this, Rat.cast_abs]

lemma compose_h_eq_pi_sProf (row : List ℚ) (n : ℕ) :
    compose h (ofListQ row) n = Real.pi * (sProf row n : ℝ) := by
  rw [sProf_eq_compose]
  unfold compose
  rw [Finset.mul_sum]
  refine sum_congr rfl fun j _ => ?_
  rw [h_eq_pi_mul_hRat]
  ring

/-- **The majorant tail bound** for a scalar branch: `Σ_{n≥cutoff} |(𝔥 ∘ ρᵢ)_n| ≤ majTail i`. -/
theorem scalar_tail_le (hsum : ∑' n, h n ≤ 1) (i : Fin branches) (hi : tag i = .scalar) :
    ∑' n, |compose h (polyOf i) (n + cutoff)| ≤ majTail i := by
  have hE : ∀ n, |(polyOf i).coeff n| ≤ (ofListQ (absRow i)).coeff n :=
    fun n => (coeff_absPoly_eq i n).ge
  have hEa : ∀ n, 0 ≤ (ofListQ (absRow i)).coeff n :=
    fun n => (coeff_absPoly_eq i n).symm ▸ abs_nonneg _
  have hg0 : ∀ n, 0 ≤ compose h (ofListQ (absRow i)) n := compose_nonneg h_nonneg hEa
  have hg_sum : Summable fun n => compose h (ofListQ (absRow i)) n := by
    have := summable_abs_compose h h_summable _ (l1_absPoly_le i)
    exact this.congr fun n => abs_of_nonneg (hg0 n)
  have hg_le : ∑' n, compose h (ofListQ (absRow i)) n ≤ 1 := by
    calc ∑' n, compose h (ofListQ (absRow i)) n
        = ∑' n, |compose h (ofListQ (absRow i)) n| := tsum_congr fun n => (abs_of_nonneg (hg0 n)).symm
      _ ≤ ∑' n, |h n| := tsum_abs_compose_le h h_summable _ (l1_absPoly_le i)
      _ = ∑' n, h n := tsum_congr fun n => abs_of_nonneg (h_nonneg n)
      _ ≤ 1 := hsum
  have hf_sum : Summable fun n => |compose h (polyOf i) (n + cutoff)| :=
    (summable_nat_add_iff (f := fun n => |compose h (polyOf i) n|) cutoff).mpr
      (summable_abs_compose h h_summable _ (l1_polyOf_le i))
  have hsplit := hg_sum.sum_add_tsum_nat_add cutoff
  rw [majTail, hi]
  simp only
  have e : ∑ n ∈ range cutoff, Real.pi * (sProf (absRow i) n : ℝ)
      = ∑ n ∈ range cutoff, compose h (ofListQ (absRow i)) n :=
    sum_congr rfl fun n _ => (compose_h_eq_pi_sProf _ _).symm
  rw [e]
  calc ∑' n, |compose h (polyOf i) (n + cutoff)|
      ≤ ∑' n, compose h (ofListQ (absRow i)) (n + cutoff) :=
        Summable.tsum_le_tsum (fun n => abs_compose_le_majorant h_nonneg hE _) hf_sum
          ((summable_nat_add_iff (f := fun n => compose h (ofListQ (absRow i)) n) cutoff).mpr hg_sum)
    _ = ∑' n, compose h (ofListQ (absRow i)) n - ∑ n ∈ range cutoff, compose h (ofListQ (absRow i)) n := by
        linarith
    _ ≤ 1 - ∑ n ∈ range cutoff, compose h (ofListQ (absRow i)) n := by linarith

/-! ### Cauchy tails -/

/-- Cauchy-estimate tail beyond the retained modes: `10 r⁻⁽²ᶜᵘᵗᵒᶠᶠ⁺¹⁾/(1 − r⁻²)`. -/
def cauchyTail (r : ℝ) : ℝ := 10 / r ^ (2 * cutoff + 1) / (1 - 1 / r ^ 2)

lemma cauchyTail_le {r : ℝ} (hr : 53 / 50 ≤ r) : cauchyTail r ≤ 1 / 10 ^ 40 := by
  have h1 : (8.6 : ℝ) ≤ (53 / 50) ^ 37 := by norm_num
  have h2 : (8.6 : ℝ) ^ 110 ≤ r ^ (2 * cutoff + 1) := by
    calc (8.6 : ℝ) ^ 110 ≤ ((53 / 50) ^ 37) ^ 110 := pow_le_pow_left₀ (by norm_num) h1 110
      _ = (53 / 50) ^ 4070 := by rw [← pow_mul]
      _ ≤ (53 / 50) ^ (2 * cutoff + 1) := pow_le_pow_right₀ (by norm_num) (by decide)
      _ ≤ r ^ (2 * cutoff + 1) := pow_le_pow_left₀ (by norm_num) hr _
  have h4 : (0.11 : ℝ) ≤ 1 - 1 / r ^ 2 := by
    have : (53 / 50 : ℝ) ^ 2 ≤ r ^ 2 := pow_le_pow_left₀ (by norm_num) hr 2
    have h5 : 1 / r ^ 2 ≤ 1 / (53 / 50 : ℝ) ^ 2 := one_div_le_one_div_of_le (by norm_num) this
    norm_num at h5 ⊢
    linarith
  unfold cauchyTail
  rw [div_div, div_le_div_iff₀ (by positivity) (by norm_num)]
  generalize hx : r ^ (2 * cutoff + 1) = x at h2 ⊢
  have hx0 : (0 : ℝ) ≤ x := (by positivity : (0 : ℝ) ≤ 8.6 ^ 110).trans h2
  have h5 := mul_le_mul h2 h4 (by norm_num) hx0
  have h6 : (10 : ℝ) * 10 ^ 40 ≤ (8.6 : ℝ) ^ 110 * 0.11 := by norm_num
  linarith

/-- The Cauchy radius of a branch is at least `53/50` (trivially true for the other branches). -/
def radiusOK (i : Fin branches) : Bool :=
  match tag i with
  | .cauchy r => decide ((53 / 50 : ℚ) ≤ r)
  | _ => true

theorem cauchy_radius_ge : ∀ i : Fin branches, radiusOK i = true := by native_decide

/-! ### The origin kernels -/

/-- The analytic description of an origin kernel with coefficient sequence `H`: a dominated
summable radial kernel whose first `modes` coefficients are `Re(aₙ b̄ₙ)` for coefficient
integrals `a, b` within `e⁻¹⁸` (in `ℓ²`) of the truncated integrals `A, B`, and whose
coefficients from `modes` on have the form `ξₙcₙ + Re(rₙ s̄ₙ)` with `ξₙ² = hₙ` and first-order
tail energies `E_C` (of `c`), `E₊` (of `r + iκs`) and `E₋` (of `r − iκs`). -/
structure OriginKernel (H : ℕ → ℝ) (A B : ℕ → ℂ) (κ EC Ep Em : ℝ) : Prop where
  summable : Summable fun n => |H n|
  dominated : DominatedKernel (radialKernel H)
  head : ∃ a b : ℕ → ℂ, (∀ n < modes, H n = (a n * conj (b n)).re) ∧
    ∑ n ∈ range modes, ‖a n - A n‖ ^ 2 ≤ Real.exp (-18) ^ 2 ∧
    ∑ n ∈ range modes, ‖b n - B n‖ ^ 2 ≤ Real.exp (-18) ^ 2
  tail : ∃ (ξ c : ℕ → ℝ) (r s : ℕ → ℂ), (∀ n, ξ n ^ 2 = h n) ∧
    (∀ n, modes ≤ n → H n = ξ n * c n + (r n * conj (s n)).re) ∧
    (Summable fun n => (2 * ((modes + n : ℕ) : ℝ) + 1) * c (modes + n) ^ 2) ∧
    (∑' n, (2 * ((modes + n : ℕ) : ℝ) + 1) * c (modes + n) ^ 2 ≤ EC) ∧
    (Summable fun n =>
      (2 * ((modes + n : ℕ) : ℝ) + 1) * ‖r (modes + n) + Complex.I * κ * s (modes + n)‖ ^ 2) ∧
    (∑' n, (2 * ((modes + n : ℕ) : ℝ) + 1) * ‖r (modes + n) + Complex.I * κ * s (modes + n)‖ ^ 2
      ≤ Ep) ∧
    (Summable fun n =>
      (2 * ((modes + n : ℕ) : ℝ) + 1) * ‖r (modes + n) - Complex.I * κ * s (modes + n)‖ ^ 2) ∧
    (∑' n, (2 * ((modes + n : ℕ) : ℝ) + 1) * ‖r (modes + n) - Complex.I * κ * s (modes + n)‖ ^ 2
      ≤ Em)

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

/-- Box-derived bound on the `ℓ²` norms of the truncated coefficient vectors:
`‖A‖₂, ‖B‖₂ ≤ nBox` for both origin kernels. -/
def nBox : ℚ := 0.99948

/-- The coefficient-error budget `e⁻¹⁸(‖A‖₂ + ‖B‖₂) + e⁻³⁶ ≤ epsOrigin` with
`‖A‖₂, ‖B‖₂ ≤ nBox`. -/
def epsOrigin : ℚ := 304441205745059 / 10 ^ 22

lemma epsOrigin_bound : (dHi : ℝ) * nBox + (dHi : ℝ) ^ 2 + nBox * dHi ≤ (epsOrigin : ℝ) := by
  simp only [dHi, epsOrigin, nBox]
  norm_num

lemma sq_le_boxSq {lo hi x : ℝ} (h1 : lo ≤ x) (h2 : x ≤ hi) : x ^ 2 ≤ (max |lo| |hi|) ^ 2 := by
  have hx : |x| ≤ max |lo| |hi| := by
    rcases le_total 0 x with hx | hx
    · rw [abs_of_nonneg hx]; exact (h2.trans (le_abs_self hi)).trans (le_max_right _ _)
    · rw [abs_of_nonpos hx]
      exact (by linarith [neg_abs_le lo] : -x ≤ |lo|).trans (le_max_left _ _)
  calc x ^ 2 = |x| ^ 2 := (sq_abs x).symm
    _ ≤ _ := pow_le_pow_left₀ (abs_nonneg _) hx 2

/-- Sum of the squared box maxima over the input modes. -/
def boxSqSum (lo hi : List ℚ) : ℚ :=
  ∑ n ∈ range modes, (max |coeffQ lo n| |coeffQ hi n|) ^ 2

theorem aBoxSq_le : boxSqSum aReLo aReHi + boxSqSum aImLo aImHi ≤ nBox ^ 2 := by native_decide
theorem bBoxSq_le : boxSqSum bReLo bReHi + boxSqSum bImLo bImHi ≤ nBox ^ 2 := by native_decide
theorem asBoxSq_le : boxSqSum asReLo asReHi + boxSqSum asImLo asImHi ≤ nBox ^ 2 := by native_decide
theorem bsBoxSq_le : boxSqSum bsReLo bsReHi + boxSqSum bsImLo bsImHi ≤ nBox ^ 2 := by native_decide

lemma normSq_sum_le_of_box {lo₁ hi₁ lo₂ hi₂ : List ℚ} {A : ℕ → ℂ} (hA : InBox lo₁ hi₁ lo₂ hi₂ A)
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

/-- **The remainder of an origin kernel** after replacing its first `modes` coefficients by the
truncated ones: `Σₙ |Hₙ − headCoeff A B n| ≤ epsOrigin + T` where `T` bounds its polarized tail. -/
theorem originKernel_rest_le {H : ℕ → ℝ} {A B : ℕ → ℂ} {κ EC Ep Em : ℝ} (hκ : 0 < κ)
    (hH : OriginKernel H A B κ EC Ep Em)
    (hA2 : ∑ n ∈ range modes, ‖A n‖ ^ 2 ≤ (nBox : ℝ) ^ 2)
    (hB2 : ∑ n ∈ range modes, ‖B n‖ ^ 2 ≤ (nBox : ℝ) ^ 2) (T : ℝ)
    (hT : Real.sqrt EC * Real.sqrt (Wp modes) + Real.sqrt Ep * Real.sqrt Em / (2 * κ * (2 * modes + 1))
      ≤ T) :
    (Summable fun n => |H n - headCoeff A B n|) ∧
      ∑' n, |H n - headCoeff A B n| ≤ (epsOrigin : ℝ) + T := by
  obtain ⟨a, b, hab, herrA, herrB⟩ := hH.head
  obtain ⟨ξ, c, r, s, hξ, htail, hcs, hEC, hus, hEp, hvs, hEm⟩ := hH.tail
  have hhead_sum : Summable fun n => |headCoeff A B n| :=
    summable_of_ne_finset_zero (s := range modes) fun n hn => by
      unfold headCoeff; rw [ite_eq_right (by simpa using hn), abs_zero]
  have hRsum : Summable fun n => |H n - headCoeff A B n| := by
    refine Summable.of_nonneg_of_le (fun n => abs_nonneg _) (fun n => abs_sub _ _)
      (hH.summable.add hhead_sum)
  refine ⟨hRsum, ?_⟩
  -- the head part
  have hlow : ∑ n ∈ range modes, |H n - headCoeff A B n| ≤ (epsOrigin : ℝ) := by
    have hd0 : 0 ≤ Real.exp (-18) := (Real.exp_pos _).le
    have hnB0 : (0 : ℝ) ≤ nBox := by simp only [nBox]; norm_num
    have hce := coeff_error_le a b A B _ hd0 herrA herrB nBox nBox hnB0 hnB0 hA2 hB2
    have e : ∀ n ∈ range modes, |H n - headCoeff A B n|
        = |(a n * conj (b n)).re - (A n * conj (B n)).re| := by
      intro n hn
      have hn' : n < modes := by simpa using hn
      rw [hab n hn']
      unfold headCoeff
      rw [ite_eq_left hn']
    rw [sum_congr rfl e]
    calc ∑ n ∈ range modes, |(a n * conj (b n)).re - (A n * conj (B n)).re|
        ≤ Real.exp (-18) * nBox + Real.exp (-18) ^ 2 + nBox * Real.exp (-18) := hce
      _ ≤ (dHi : ℝ) * nBox + (dHi : ℝ) ^ 2 + nBox * dHi := by
          have := exp_neg_18_le
          have h2 := pow_le_pow_left₀ hd0 this 2
          exact add_le_add (add_le_add (mul_le_mul_of_nonneg_right this hnB0) h2)
            (mul_le_mul_of_nonneg_left this hnB0)
      _ ≤ (epsOrigin : ℝ) := epsOrigin_bound
  -- the tail part
  have hhigh : ∑' n, |H (n + modes) - headCoeff A B (n + modes)| ≤ T := by
    have hjt := polarized_tail_bound modes (by norm_num) ξ c r s κ hκ EC Ep Em hξ hcs hEC hus hEp
      hvs hEm
    calc ∑' n, |H (n + modes) - headCoeff A B (n + modes)|
        = ∑' n, |ξ (modes + n) * c (modes + n) + (r (modes + n) * conj (s (modes + n))).re| := by
          refine tsum_congr fun n => ?_
          unfold headCoeff
          rw [ite_eq_right (by omega), sub_zero, add_comm n modes, htail (modes + n) (Nat.le_add_right _ _)]
      _ ≤ _ := hjt
      _ ≤ T := hT
  rw [← hRsum.sum_add_tsum_nat_add modes]
  exact add_le_add hlow hhigh

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

/-! ### The certificate's branches -/

/-- The coefficient sequence of the kernel of branch `i`. -/
def kernelOf (H Hs : ℕ → ℝ) (i : Fin branches) : ℕ → ℝ :=
  match tag i with
  | .origin => compose H (polyOf i)
  | .originStar => compose Hs (polyOf i)
  | _ => compose h (polyOf i)

/-- The retained part of branch `i`. -/
def retainedOf (A B A' B' : ℕ → ℂ) (i : Fin branches) (n : ℕ) : ℝ :=
  if n < cutoff then col A B A' B' i n else 0

/-- The analytic part of the tail budget of branch `i`: the Cauchy tail of an analytically
continued scalar branch, or the composed truncation error and origin tail of an origin branch. -/
def extraTail (i : Fin branches) : ℝ :=
  match tag i with
  | .scalar => 0
  | .cauchy r => cauchyTail r
  | .origin => (epsOrigin : ℝ) + tailH
  | .originStar => (epsOrigin : ℝ) + tailHs

/-- Upper bound of the analytic tail budget of branch `i`, as a rational. -/
def extraHi (i : Fin branches) : ℚ :=
  match tag i with
  | .scalar => 0
  | .cauchy _ => 1 / 10 ^ 40
  | .origin => epsOrigin + tailH
  | .originStar => epsOrigin + tailHs

/-- Upper bound of the weighted analytic tail budget `Σᵢ wtᵢ · extraTail i`. -/
def restHi : ℚ := 274074992504129 / 10 ^ 22

theorem rest_le : ∑ i, wtQ i * extraHi i ≤ restHi := by native_decide

lemma extraTail_le (i : Fin branches) : extraTail i ≤ (extraHi i : ℝ) := by
  unfold extraTail extraHi
  rcases h : tag i with _ | r | _ | _
  · simp
  · simp only
    refine (cauchyTail_le ?_).trans (by norm_num)
    have := cauchy_radius_ge i
    simp only [radiusOK, h, decide_eq_true_eq] at this
    have h2 : ((53 / 50 : ℚ) : ℝ) ≤ (r : ℝ) := Rat.cast_le.mpr this
    push_cast at h2
    exact h2
  · simp
  · simp

lemma weighted_rest_le : ∑ i, wt i * extraTail i ≤ (restHi : ℝ) := by
  have h1 : ∑ i, wt i * extraTail i ≤ ∑ i, wt i * (extraHi i : ℝ) :=
    sum_le_sum fun i _ => mul_le_mul_of_nonneg_left (extraTail_le i) (wt_pos i).le
  refine h1.trans ?_
  have := rest_le
  have e : ∑ i, wt i * (extraHi i : ℝ) = ((∑ i, wtQ i * extraHi i : ℚ) : ℝ) := by
    push_cast; rfl
  rw [e]
  exact_mod_cast this

/-- The mass `M = Σ wtᵢ`. -/
theorem wt_mass : ∑ i, wt i = 1000000000000000208629 / 10 ^ 21 := by
  have h : ∑ i, wtQ i = 1000000000000000208629 / 10 ^ 21 := by native_decide
  have e : ∑ i, wt i = ((∑ i, wtQ i : ℚ) : ℝ) := by push_cast; rfl
  rw [e, h]; push_cast; ring

/-- The finite composition of a truncated origin kernel vanishes from `fullLen i` on. -/
lemma compose_head_eq_zero (A B : ℕ → ℂ) (i : Fin branches) {n : ℕ} (hn : fullLen i ≤ n) :
    compose (headCoeff A B) (polyOf i) n = 0 := by
  unfold compose
  apply Finset.sum_eq_zero
  intro j _
  by_cases hj : j < modes
  · have hd := natDegree_ofListQ_le_pred (rowQ i)
    unfold fullLen at hn
    generalize hdd : (rowQ i).length - 1 = d at hd hn
    have h1 : (2 * j + 1) * d ≤ (2 * modes - 1) * d := Nat.mul_le_mul_right _ (by omega)
    have hdeg : (polyOf i ^ (2 * j + 1)).natDegree < n - j := by
      calc (polyOf i ^ (2 * j + 1)).natDegree ≤ (2 * j + 1) * (polyOf i).natDegree :=
            natDegree_pow_le
        _ ≤ (2 * j + 1) * d := by unfold polyOf; exact Nat.mul_le_mul_left _ hd
        _ < n - j := by
            generalize (2 * j + 1) * d = u at h1
            simp only [modes] at h1 hn hj ⊢
            omega
    rw [coeff_eq_zero_of_natDegree_lt hdeg, mul_zero]
  · unfold headCoeff
    rw [ite_eq_right hj, zero_mul]

lemma tsum_abs_eq_highTail (A B : ℕ → ℂ) (i : Fin branches) (hi : cutoff ≤ fullLen i) :
    ∑' n, |compose (headCoeff A B) (polyOf i) (n + cutoff)|
      = ∑ n ∈ Ico cutoff (fullLen i), |compose (headCoeff A B) (polyOf i) n| := by
  have hsupp : ∀ n ∉ range (fullLen i - cutoff),
      |compose (headCoeff A B) (polyOf i) (n + cutoff)| = 0 := fun n hn => by
    rw [compose_head_eq_zero A B i (by simp only [mem_range, not_lt] at hn; omega), abs_zero]
  rw [tsum_eq_sum hsupp, Finset.sum_Ico_eq_sum_range]
  exact sum_congr rfl fun n _ => by rw [add_comm]

set_option maxHeartbeats 4000000 in
/-- The tail budget of one branch. -/
theorem branch_tail_le (hsum : ∑' n, h n ≤ 1)
    {H : ℕ → ℝ} {A B : ℕ → ℂ} {Hs : ℕ → ℝ} {A' B' : ℕ → ℂ}
    (hH : OriginKernel H A B (999511 / 10 ^ 6) 0.0035203939734987528839
      0.0000182773096480245802715 0.0035186722940462150571)
    (hA : InBox aReLo aReHi aImLo aImHi A) (hB : InBox bReLo bReHi bImLo bImHi B)
    (hHs : OriginKernel Hs A' B' 1 0.0048623361335078433465 0.0000444870768551502459631
      0.0048623361335204498121)
    (hA' : InBox asReLo asReHi asImLo asImHi A') (hB' : InBox bsReLo bsReHi bsImLo bsImHi B')
    (hcauchy : ∀ i r, tag i = .cauchy r →
      ∑' n, |compose h (polyOf i) (n + cutoff)| ≤ cauchyTail r)
    (i : Fin branches) :
    ∑' n, |kernelOf H Hs i n - retainedOf A B A' B' i n|
      ≤ majTail i + highTail A B A' B' i + extraTail i := by
  -- generic reduction for the scalar branches
  have scalar_case : ∀ (f : ℕ → ℝ), (Summable fun n => |f n|) →
      (∀ n, n < cutoff → col A B A' B' i n = f n) →
      ∑' n, |f n - retainedOf A B A' B' i n| = ∑' n, |f (n + cutoff)| := by
    intro f hf hcol
    have hP : Summable fun n => |retainedOf A B A' B' i n| :=
      summable_of_ne_finset_zero (s := range cutoff) fun n hn => by
        unfold retainedOf; rw [ite_eq_right (by simpa using hn), abs_zero]
    have hR : Summable fun n => |f n - retainedOf A B A' B' i n| :=
      Summable.of_nonneg_of_le (fun n => abs_nonneg _) (fun n => abs_sub _ _) (hf.add hP)
    rw [← hR.sum_add_tsum_nat_add cutoff]
    have e1 : ∑ n ∈ range cutoff, |f n - retainedOf A B A' B' i n| = 0 :=
      sum_eq_zero fun n hn => by
        have hn' : n < cutoff := by simpa using hn
        unfold retainedOf; rw [ite_eq_left hn', hcol n hn', sub_self, abs_zero]
    rw [e1, zero_add]
    refine tsum_congr fun n => ?_
    unfold retainedOf; rw [ite_eq_right (by omega), sub_zero]
  -- generic reduction for the origin branches
  have origin_case : ∀ (H₀ : ℕ → ℝ) (A₀ B₀ : ℕ → ℂ), (Summable fun n => |H₀ n|) →
      (∀ n, n < cutoff → col A B A' B' i n = compose (headCoeff A₀ B₀) (polyOf i) n) →
      cutoff ≤ fullLen i →
      ∀ (T : ℝ), (Summable fun n => |H₀ n - headCoeff A₀ B₀ n|) →
      ∑' n, |H₀ n - headCoeff A₀ B₀ n| ≤ T →
      ∑' n, |compose H₀ (polyOf i) n - retainedOf A B A' B' i n|
        ≤ ∑ n ∈ Ico cutoff (fullLen i), |compose (headCoeff A₀ B₀) (polyOf i) n| + T := by
    intro H₀ A₀ B₀ hHs hcol hcut T hrest_sum hrest
    obtain ⟨rest, hrest_def⟩ : ∃ rest : ℕ → ℝ, ∀ n, rest n = H₀ n - headCoeff A₀ B₀ n :=
      ⟨_, fun _ => rfl⟩
    have hsplit : ∀ n, compose H₀ (polyOf i) n
        = compose (headCoeff A₀ B₀) (polyOf i) n + compose rest (polyOf i) n := by
      intro n
      rw [← compose_add]
      congr 1; funext m; rw [hrest_def]; ring
    have hhead_sum : Summable fun n => |headCoeff A₀ B₀ n| :=
      summable_of_ne_finset_zero (s := range modes) fun n hn => by
        unfold headCoeff; rw [ite_eq_right (by simpa using hn), abs_zero]
    have hch : Summable fun n => |compose (headCoeff A₀ B₀) (polyOf i) n| :=
      summable_abs_compose _ hhead_sum _ (l1_polyOf_le i)
    have hrest_sum' : Summable fun n => |rest n| := by simp_rw [hrest_def]; exact hrest_sum
    have hcr : Summable fun n => |compose rest (polyOf i) n| :=
      summable_abs_compose _ hrest_sum' _ (l1_polyOf_le i)
    have hcr_le : ∑' n, |compose rest (polyOf i) n| ≤ T :=
      (tsum_abs_compose_le _ hrest_sum' _ (l1_polyOf_le i)).trans (by simp_rw [hrest_def]; exact hrest)
    have e := scalar_case (compose (headCoeff A₀ B₀) (polyOf i)) hch hcol
    have hP : Summable fun n => |retainedOf A B A' B' i n| :=
      summable_of_ne_finset_zero (s := range cutoff) fun n hn => by
        unfold retainedOf; rw [ite_eq_right (by simpa using hn), abs_zero]
    have h1 : Summable fun n => |compose (headCoeff A₀ B₀) (polyOf i) n - retainedOf A B A' B' i n| :=
      Summable.of_nonneg_of_le (fun n => abs_nonneg _) (fun n => abs_sub _ _) (hch.add hP)
    calc ∑' n, |compose H₀ (polyOf i) n - retainedOf A B A' B' i n|
        ≤ ∑' n, (|compose (headCoeff A₀ B₀) (polyOf i) n - retainedOf A B A' B' i n|
            + |compose rest (polyOf i) n|) := by
          refine Real.tsum_le_of_sum_le (fun n => abs_nonneg _) fun s => ?_
          calc ∑ n ∈ s, |compose H₀ (polyOf i) n - retainedOf A B A' B' i n|
              ≤ ∑ n ∈ s, (|compose (headCoeff A₀ B₀) (polyOf i) n - retainedOf A B A' B' i n|
                  + |compose rest (polyOf i) n|) := by
                refine sum_le_sum fun n _ => ?_
                rw [hsplit]
                calc |compose (headCoeff A₀ B₀) (polyOf i) n + compose rest (polyOf i) n
                      - retainedOf A B A' B' i n|
                    = |(compose (headCoeff A₀ B₀) (polyOf i) n - retainedOf A B A' B' i n)
                      + compose rest (polyOf i) n| := by congr 1; ring
                  _ ≤ _ := abs_add_le _ _
            _ ≤ ∑' n, (|compose (headCoeff A₀ B₀) (polyOf i) n - retainedOf A B A' B' i n|
                  + |compose rest (polyOf i) n|) :=
                (h1.add hcr).sum_le_tsum _ fun n _ => by positivity
      _ = ∑' n, |compose (headCoeff A₀ B₀) (polyOf i) n - retainedOf A B A' B' i n|
            + ∑' n, |compose rest (polyOf i) n| := h1.tsum_add hcr
      _ ≤ ∑ n ∈ Ico cutoff (fullLen i), |compose (headCoeff A₀ B₀) (polyOf i) n| + T := by
          rw [e, tsum_abs_eq_highTail A₀ B₀ i hcut]
          exact add_le_add le_rfl hcr_le
  have hA2 := normSq_sum_le_of_box hA aBoxSq_le
  have hB2 := normSq_sum_le_of_box hB bBoxSq_le
  have hA2' := normSq_sum_le_of_box hA' asBoxSq_le
  have hB2' := normSq_sum_le_of_box hB' bsBoxSq_le
  unfold kernelOf majTail highTail extraTail
  rcases ht : tag i with _ | r | _ | _
  · simp only
    have hf := summable_abs_compose h h_summable _ (l1_polyOf_le i)
    rw [scalar_case _ hf fun n _ => by
      unfold col; rw [ht]; exact (compose_h_eq_pi_sProf _ _).symm]
    have := scalar_tail_le hsum i ht
    unfold majTail at this
    rw [ht] at this
    simpa using this
  · simp only
    have hf := summable_abs_compose h h_summable _ (l1_polyOf_le i)
    rw [scalar_case _ hf fun n _ => by
      unfold col; rw [ht]; exact (compose_h_eq_pi_sProf _ _).symm]
    simpa using hcauchy i r ht
  · simp only
    have hcol : ∀ n, col A B A' B' i n = compose (headCoeff A B) (polyOf i) n := fun n => by
      unfold col; rw [ht]
    obtain ⟨hs, hr⟩ := originKernel_rest_le (by norm_num) hH hA2 hB2 _
      (tailH_numeric _ _ _ (by norm_num) (by norm_num) (by norm_num) le_rfl le_rfl le_rfl)
    have := origin_case H A B hH.summable (fun n _ => hcol n)
      (Upper.cutoff_le_fullLen i (Or.inl ht)) _ hs hr
    simpa only [hcol, zero_add] using this
  · simp only
    have hcol : ∀ n, col A B A' B' i n = compose (headCoeff A' B') (polyOf i) n := fun n => by
      unfold col; rw [ht]
    obtain ⟨hs, hr⟩ := originKernel_rest_le (by norm_num) hHs hA2' hB2' _
      (tailHs_numeric _ _ _ (by norm_num) (by norm_num) (by norm_num) le_rfl le_rfl le_rfl)
    have := origin_case Hs A' B' hHs.summable (fun n _ => hcol n)
      (Upper.cutoff_le_fullLen i (Or.inr ht)) _ hs hr
    simpa only [hcol, zero_add] using this

/-! ### The numeric theorem -/

theorem final_numeric :
    (1000000000000000208629 / 10 ^ 21 : ℝ) / ((DloNeeded : ℝ) - restHi)
      ≤ 1404896257347 / 10 ^ 12 := by
  simp only [DloNeeded, restHi]; norm_num

theorem DloNeeded_pos : 0 < (DloNeeded : ℝ) - restHi := by
  simp only [DloNeeded, restHi]; norm_num

set_option maxHeartbeats 4000000 in
/-- **The bound from the certified slope**: if `Dlo ≥ DloNeeded` then
`K_G^ℂ ≤ 1.404896257347`, conditional on the analytic inputs listed in the hypotheses. -/
theorem grothendieck_of_slope (Dlo : ℚ) (hDlo : DloNeeded ≤ Dlo) (hfin : FiniteCertificate Dlo)
    (hh : DominatedKernel (radialKernel h))
    {H : ℕ → ℝ} {A B : ℕ → ℂ}
    (hH : OriginKernel H A B (999511 / 10 ^ 6) 0.0035203939734987528839
      0.0000182773096480245802715 0.0035186722940462150571)
    (hA : InBox aReLo aReHi aImLo aImHi A) (hB : InBox bReLo bReHi bImLo bImHi B)
    {Hs : ℕ → ℝ} {A' B' : ℕ → ℂ}
    (hHs : OriginKernel Hs A' B' 1 0.0048623361335078433465 0.0000444870768551502459631
      0.0048623361335204498121)
    (hA' : InBox asReLo asReHi asImLo asImHi A') (hB' : InBox bsReLo bsReHi bsImLo bsImHi B')
    (hcauchy : ∀ i r, tag i = .cauchy r →
      ∑' n, |compose h (polyOf i) (n + cutoff)| ≤ cauchyTail r) :
    IsGrothendieckBound (1404896257347 / 10 ^ 12) := by
  have hsum : ∑' n, h n ≤ 1 := tsum_le_one_of_dominated h_nonneg hh
  have hk : ∀ i, Summable fun n => |kernelOf H Hs i n| := by
    intro i
    unfold kernelOf
    rcases tag i with _ | _ | _ | _ <;> simp only
    · exact summable_abs_compose _ h_summable _ (l1_polyOf_le i)
    · exact summable_abs_compose _ h_summable _ (l1_polyOf_le i)
    · exact summable_abs_compose _ hH.summable _ (l1_polyOf_le i)
    · exact summable_abs_compose _ hHs.summable _ (l1_polyOf_le i)
  have hdom : ∀ i, DominatedKernel (radialKernel (kernelOf H Hs i)) := by
    intro i
    unfold kernelOf
    rcases tag i with _ | _ | _ | _ <;> simp only
    · exact dominated_compose h_summable hh i
    · exact dominated_compose h_summable hh i
    · exact dominated_compose hH.summable hH.dominated i
    · exact dominated_compose hHs.summable hHs.dominated i
  have hP : ∀ i n, cutoff ≤ n → retainedOf A B A' B' i n = 0 := fun i n hn => by
    unfold retainedOf; rw [ite_eq_right (by omega)]
  have hτ := branch_tail_le hsum hH hA hB hHs hA' hB' hcauchy
  have hfin' := hfin A B A' B' hA hB hA' hB'
  have hrest := weighted_rest_le
  have hDlo' : (DloNeeded : ℝ) ≤ Dlo := by exact_mod_cast hDlo
  have hpos : 0 < (Dlo : ℝ) - restHi := by linarith [DloNeeded_pos]
  have hmix : ∀ n, n < cutoff → mix A B A' B' n = ∑ i, wt i * retainedOf A B A' B' i n := by
    intro n hn
    unfold mix retainedOf
    exact sum_congr rfl fun i _ => by rw [ite_eq_left hn]
  have hslope : (Dlo : ℝ) - restHi
      ≤ ∑ i, wt i * retainedOf A B A' B' i 0
        - ∑ n ∈ Icc 1 (cutoff - 1), |∑ i, wt i * retainedOf A B A' B' i n|
        - ∑ i, wt i * (majTail i + highTail A B A' B' i + extraTail i) := by
    rw [← hmix 0 (by decide)]
    have e : ∑ n ∈ Icc 1 (cutoff - 1), |∑ i, wt i * retainedOf A B A' B' i n|
        = ∑ n ∈ Icc 1 (cutoff - 1), |mix A B A' B' n| :=
      sum_congr rfl fun n hn => by rw [hmix n (by simp only [mem_Icc] at hn; omega)]
    rw [e]
    have e2 : ∑ i, wt i * (majTail i + highTail A B A' B' i + extraTail i)
        = ∑ i, wt i * (majTail i + highTail A B A' B' i) + ∑ i, wt i * extraTail i := by
      rw [← sum_add_distrib]; exact sum_congr rfl fun i _ => by ring
    rw [e2]
    linarith
  have hB := bound_of_branches (by decide) wt wt_pos (kernelOf H Hs) hk hdom cutoff (by decide)
    (retainedOf A B A' B') hP _ hτ _ hpos hslope
  refine hB.mono ?_
  rw [wt_mass]
  refine le_trans ?_ final_numeric
  apply div_le_div_of_nonneg_left (by norm_num) DloNeeded_pos
  linarith

end

end Grothe
