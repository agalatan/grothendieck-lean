import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Analysis.Normed.Group.InfiniteSum
import Mathlib.Topology.Algebra.InfiniteSum.Order
import Mathlib.Topology.Algebra.InfiniteSum.Real
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity

/-!
# The complex Grothendieck constant, the radial transfer and convex mixtures

For a complex matrix `A`, `classicalNorm A` is the supremum of `‖∑ A_pq conj(z_p) w_q‖` over complex
numbers with `‖z_p‖, ‖w_q‖ ≤ 1`, and `quantumNorm A` is the supremum of `‖∑ A_pq ⟪u_p, v_q⟫‖` over
vectors of `ℂ^N` (any `N`) with `‖u_p‖, ‖v_q‖ ≤ 1`. `complexGrothendieckConstant` is the infimum of the
`K ≥ 0` with `quantumNorm A ≤ K * classicalNorm A` for every `A`.

This file proves:
* `power_form_le_quantumNorm`: `‖∑ A_pq ⟪u_p, v_q⟫ |⟪u_p, v_q⟫|^{2k}‖ ≤ quantumNorm A` for all
  `‖u_p‖, ‖v_q‖ ≤ 1` and all `k`. The vectors `radLift u k = u ⊗ (u ⊗ ū)^{⊗k}` have norm at most `1`
  and inner products `⟪u, v⟫ |⟪u, v⟫|^{2k}` (`inner_radLift`).
* `complexGrothendieckConstant_le_inv_of_dominated`: if `h` is a `DominatedRadialSeries` and
  `0 < D ≤ h 0 - ∑_{k ≥ 1} |h k|`, then `complexGrothendieckConstant ≤ 1 / D`.
* `DominatedRadialSeries.convex_finset`: a convex combination of dominated radial series is dominated.
* `cert_margin_of_head_and_tails`: for a mixture `H = ∑ᵢ wᵢ hᵢ`, a lower bound for
  `H 0 - ∑_{k ≥ 1} |H k|` from approximations `h_app i` of the `hᵢ` on `0, …, K` and from bounds on their
  tails beyond `K`.
-/

namespace HaagerupBound

/-- Classical bilinear norm `C(A) = sup_{|z_p| ≤ 1, |w_q| ≤ 1} ‖∑_{p,q} A_{pq} conj(z_p) w_q‖`. -/
noncomputable def classicalNorm {m n : ℕ} (A : Matrix (Fin m) (Fin n) ℂ) : ℝ :=
  sSup { r : ℝ | ∃ (z : Fin m → ℂ) (w : Fin n → ℂ),
    (∀ p, ‖z p‖ ≤ 1) ∧ (∀ q, ‖w q‖ ≤ 1) ∧
    r = ‖∑ p : Fin m, ∑ q : Fin n, A p q * starRingEnd ℂ (z p) * w q‖ }

theorem classicalNorm_nonneg {m n : ℕ} (A : Matrix (Fin m) (Fin n) ℂ) :
    0 ≤ classicalNorm A := by
  have h0 : (0 : ℝ) ∈ { r : ℝ | ∃ (z : Fin m → ℂ) (w : Fin n → ℂ),
      (∀ p, ‖z p‖ ≤ 1) ∧ (∀ q, ‖w q‖ ≤ 1) ∧
      r = ‖∑ p : Fin m, ∑ q : Fin n, A p q * starRingEnd ℂ (z p) * w q‖ } :=
    ⟨fun _ => 0, fun _ => 0, fun _ => by simp, fun _ => by simp, by simp⟩
  have hbdd : BddAbove { r : ℝ | ∃ (z : Fin m → ℂ) (w : Fin n → ℂ),
      (∀ p, ‖z p‖ ≤ 1) ∧ (∀ q, ‖w q‖ ≤ 1) ∧
      r = ‖∑ p : Fin m, ∑ q : Fin n, A p q * starRingEnd ℂ (z p) * w q‖ } := by
    refine ⟨∑ p : Fin m, ∑ q : Fin n, ‖A p q‖, ?_⟩
    rintro r ⟨z, w, hz, hw, rfl⟩
    calc ‖∑ p, ∑ q, A p q * starRingEnd ℂ (z p) * w q‖
      _ ≤ ∑ p, ‖∑ q, A p q * starRingEnd ℂ (z p) * w q‖ := norm_sum_le _ _
      _ ≤ ∑ p, ∑ q, ‖A p q * starRingEnd ℂ (z p) * w q‖ :=
          Finset.sum_le_sum fun p _ => norm_sum_le _ _
      _ ≤ ∑ p, ∑ q, ‖A p q‖ := by
          refine Finset.sum_le_sum fun p _ => Finset.sum_le_sum fun q _ => ?_
          rw [norm_mul, norm_mul, Complex.norm_conj]
          have hzw : ‖z p‖ * ‖w q‖ ≤ 1 := (mul_le_of_le_one_left (norm_nonneg _) (hz p)).trans (hw q)
          calc ‖A p q‖ * ‖z p‖ * ‖w q‖
            _ = ‖A p q‖ * (‖z p‖ * ‖w q‖) := by ring
            _ ≤ ‖A p q‖ * 1 := mul_le_mul_of_nonneg_left hzw (norm_nonneg _)
            _ = ‖A p q‖ := mul_one _
  exact le_csSup_of_le hbdd h0 le_rfl

/-- Quantum / Hilbert bilinear norm `V(A)`. -/
noncomputable def quantumNorm {m n : ℕ} (A : Matrix (Fin m) (Fin n) ℂ) : ℝ :=
  sSup { r : ℝ | ∃ (N : ℕ) (u : Fin m → EuclideanSpace ℂ (Fin N))
    (v : Fin n → EuclideanSpace ℂ (Fin N)),
    (∀ p, ‖u p‖ ≤ 1) ∧ (∀ q, ‖v q‖ ≤ 1) ∧
    r = ‖∑ p : Fin m, ∑ q : Fin n, A p q * @inner ℂ _ _ (u p) (v q)‖ }

theorem quantumNorm_bddAbove {m n : ℕ} (A : Matrix (Fin m) (Fin n) ℂ) :
    BddAbove { r : ℝ | ∃ (N : ℕ) (u : Fin m → EuclideanSpace ℂ (Fin N))
      (v : Fin n → EuclideanSpace ℂ (Fin N)),
      (∀ p, ‖u p‖ ≤ 1) ∧ (∀ q, ‖v q‖ ≤ 1) ∧
      r = ‖∑ p : Fin m, ∑ q : Fin n, A p q * @inner ℂ _ _ (u p) (v q)‖ } := by
  refine ⟨∑ p : Fin m, ∑ q : Fin n, ‖A p q‖, ?_⟩
  rintro r ⟨N, u, v, hu, hv, rfl⟩
  calc ‖∑ p, ∑ q, A p q * @inner ℂ _ _ (u p) (v q)‖
    _ ≤ ∑ p, ‖∑ q, A p q * @inner ℂ _ _ (u p) (v q)‖ := norm_sum_le _ _
    _ ≤ ∑ p, ∑ q, ‖A p q * @inner ℂ _ _ (u p) (v q)‖ :=
        Finset.sum_le_sum fun p _ => norm_sum_le _ _
    _ ≤ ∑ p, ∑ q, ‖A p q‖ := by
        refine Finset.sum_le_sum fun p _ => Finset.sum_le_sum fun q _ => ?_
        rw [norm_mul]
        have h_in : ‖@inner ℂ _ _ (u p) (v q)‖ ≤ 1 :=
          (norm_inner_le_norm (u p) (v q)).trans
            ((mul_le_of_le_one_left (norm_nonneg _) (hu p)).trans (hv q))
        calc ‖A p q‖ * ‖@inner ℂ _ _ (u p) (v q)‖
          _ ≤ ‖A p q‖ * 1 := mul_le_mul_of_nonneg_left h_in (norm_nonneg _)
          _ = ‖A p q‖ := mul_one _

theorem le_quantumNorm_of_witness {m n N : ℕ} (A : Matrix (Fin m) (Fin n) ℂ)
    (u : Fin m → EuclideanSpace ℂ (Fin N)) (v : Fin n → EuclideanSpace ℂ (Fin N))
    (hu : ∀ p, ‖u p‖ ≤ 1) (hv : ∀ q, ‖v q‖ ≤ 1) :
    ‖∑ p : Fin m, ∑ q : Fin n, A p q * @inner ℂ _ _ (u p) (v q)‖ ≤ quantumNorm A :=
  le_csSup (quantumNorm_bddAbove A) ⟨N, u, v, hu, hv, rfl⟩

/-- The complex Grothendieck constant `K_G^ℂ`. -/
noncomputable def complexGrothendieckConstant : ℝ :=
  sInf { K : ℝ | 0 ≤ K ∧ ∀ (m n : ℕ) (A : Matrix (Fin m) (Fin n) ℂ),
    quantumNorm A ≤ K * classicalNorm A }

/-- Flattened Hilbert tensor product on `EuclideanSpace ℂ`. -/
noncomputable def tensorVec {N1 N2 : ℕ}
    (x : EuclideanSpace ℂ (Fin N1)) (y : EuclideanSpace ℂ (Fin N2)) :
    EuclideanSpace ℂ (Fin (N1 * N2)) :=
  (EuclideanSpace.equiv (Fin (N1 * N2)) ℂ).symm fun idx =>
    let pq := finProdFinEquiv.symm idx
    x pq.1 * y pq.2

theorem inner_tensorVec {N1 N2 : ℕ}
    (x1 x2 : EuclideanSpace ℂ (Fin N1)) (y1 y2 : EuclideanSpace ℂ (Fin N2)) :
    @inner ℂ _ _ (tensorVec x1 y1) (tensorVec x2 y2) =
      @inner ℂ _ _ x1 x2 * @inner ℂ _ _ y1 y2 := by
  change ∑ i : Fin (N1 * N2), x2 (finProdFinEquiv.symm i).1 * y2 (finProdFinEquiv.symm i).2 *
      star (x1 (finProdFinEquiv.symm i).1 * y1 (finProdFinEquiv.symm i).2) =
    (∑ a, x2 a * star (x1 a)) * ∑ b, y2 b * star (y1 b)
  rw [Fintype.sum_mul_sum, ← Fintype.sum_prod_type']
  exact Fintype.sum_equiv finProdFinEquiv.symm _ _ fun i => by rw [star_mul']; ring

theorem norm_tensorVec_le_one {N1 N2 : ℕ}
    {x : EuclideanSpace ℂ (Fin N1)} {y : EuclideanSpace ℂ (Fin N2)}
    (hx : ‖x‖ ≤ 1) (hy : ‖y‖ ≤ 1) :
    ‖tensorVec x y‖ ≤ 1 := by
  have h := inner_tensorVec x x y y
  simp only [inner_self_eq_norm_sq_to_K] at h
  have hn : ‖tensorVec x y‖ = ‖x‖ * ‖y‖ :=
    (pow_left_inj₀ (norm_nonneg _) (by positivity) two_ne_zero).1
      (by rw [mul_pow]; exact_mod_cast h)
  rw [hn]
  exact (mul_le_of_le_one_left (norm_nonneg _) hx).trans hy

noncomputable def conjVec {N : ℕ} (x : EuclideanSpace ℂ (Fin N)) : EuclideanSpace ℂ (Fin N) :=
  (EuclideanSpace.equiv (Fin N) ℂ).symm fun i => starRingEnd ℂ (x i)

theorem inner_conjVec {N : ℕ} (x y : EuclideanSpace ℂ (Fin N)) :
    @inner ℂ _ _ (conjVec x) (conjVec y) = starRingEnd ℂ (@inner ℂ _ _ x y) := by
  change ∑ i, star (y i) * star (star (x i)) = star (∑ i, y i * star (x i))
  rw [star_sum]
  exact Finset.sum_congr rfl fun i _ => (star_mul' _ _).symm

theorem norm_conjVec_le_one {N : ℕ} {x : EuclideanSpace ℂ (Fin N)} (hx : ‖x‖ ≤ 1) :
    ‖conjVec x‖ ≤ 1 := by
  have h := inner_conjVec x x
  simp only [inner_self_eq_norm_sq_to_K, map_pow, RCLike.conj_ofReal] at h
  have hn : ‖conjVec x‖ = ‖x‖ :=
    (pow_left_inj₀ (norm_nonneg _) (norm_nonneg _) two_ne_zero).1 (by exact_mod_cast h)
  rwa [hn]

def radDim (N : ℕ) : ℕ → ℕ
  | 0 => N
  | k + 1 => radDim N k * (N * N)

noncomputable def radLift {N : ℕ} (x : EuclideanSpace ℂ (Fin N)) :
    (k : ℕ) → EuclideanSpace ℂ (Fin (radDim N k))
  | 0 => x
  | k + 1 => tensorVec (radLift x k) (tensorVec x (conjVec x))

theorem norm_radLift_le_one {N : ℕ} {x : EuclideanSpace ℂ (Fin N)} (hx : ‖x‖ ≤ 1) (k : ℕ) :
    ‖radLift x k‖ ≤ 1 := by
  induction k with
  | zero => exact hx
  | succ k ih =>
    exact norm_tensorVec_le_one ih (norm_tensorVec_le_one hx (norm_conjVec_le_one hx))

theorem inner_radLift {N : ℕ} (x y : EuclideanSpace ℂ (Fin N)) (k : ℕ) :
    @inner ℂ _ _ (radLift x k) (radLift y k) =
      @inner ℂ _ _ x y * ((‖@inner ℂ _ _ x y‖ ^ 2 : ℝ) : ℂ) ^ k := by
  induction k with
  | zero =>
    show @inner ℂ _ _ x y = _
    rw [pow_zero, mul_one]
  | succ k ih =>
    have h_norm_sq : @inner ℂ _ _ x y * starRingEnd ℂ (@inner ℂ _ _ x y) =
        ((‖@inner ℂ _ _ x y‖ ^ 2 : ℝ) : ℂ) := by
      rw [Complex.mul_conj', Complex.ofReal_pow]
    refine (inner_tensorVec (radLift x k) (radLift y k) (tensorVec x (conjVec x))
      (tensorVec y (conjVec y))).trans ?_
    rw [inner_tensorVec, inner_conjVec, ih, h_norm_sq]
    ring

/-- The power form `∑_{p,q} A_{pq} ⟪u_p, v_q⟫ |⟪u_p, v_q⟫|^{2k}`. -/
noncomputable def powerForm {m n N : ℕ} (A : Matrix (Fin m) (Fin n) ℂ)
    (u : Fin m → EuclideanSpace ℂ (Fin N)) (v : Fin n → EuclideanSpace ℂ (Fin N)) (k : ℕ) : ℂ :=
  ∑ p : Fin m, ∑ q : Fin n,
    A p q * (@inner ℂ _ _ (u p) (v q) * ((‖@inner ℂ _ _ (u p) (v q)‖ ^ 2 : ℝ) : ℂ) ^ k)

theorem power_form_le_quantumNorm {m n N : ℕ} (A : Matrix (Fin m) (Fin n) ℂ)
    (u : Fin m → EuclideanSpace ℂ (Fin N)) (v : Fin n → EuclideanSpace ℂ (Fin N))
    (hu : ∀ p, ‖u p‖ ≤ 1) (hv : ∀ q, ‖v q‖ ≤ 1) (k : ℕ) :
    ‖∑ p : Fin m, ∑ q : Fin n,
      A p q * (@inner ℂ _ _ (u p) (v q) * ((‖@inner ℂ _ _ (u p) (v q)‖ ^ 2 : ℝ) : ℂ) ^ k)‖ ≤
      quantumNorm A := by
  have h_eq : (∑ p : Fin m, ∑ q : Fin n,
      A p q * (@inner ℂ _ _ (u p) (v q) * ((‖@inner ℂ _ _ (u p) (v q)‖ ^ 2 : ℝ) : ℂ) ^ k)) =
      ∑ p : Fin m, ∑ q : Fin n, A p q * @inner ℂ _ _ (radLift (u p) k) (radLift (v q) k) := by
    refine Finset.sum_congr rfl fun p _ => Finset.sum_congr rfl fun q _ => ?_
    rw [inner_radLift]
  rw [h_eq]
  exact le_quantumNorm_of_witness A (fun p => radLift (u p) k) (fun q => radLift (v q) k)
    (fun p => norm_radLift_le_one (hu p) k) (fun q => norm_radLift_le_one (hv q) k)

/-- A real sequence `h` whose radial series is dominated by `classicalNorm`: `∑ |h k| < ∞`, and for every
matrix `A` and all vectors `‖u_p‖, ‖v_q‖ ≤ 1`, `‖∑_k h k · ∑_{p,q} A_pq ⟪u_p, v_q⟫ |⟪u_p, v_q⟫|^{2k}‖` is at
most `classicalNorm A`. -/
structure DominatedRadialSeries (h : ℕ → ℝ) : Prop where
  summable_abs : Summable (fun k => |h k|)
  le_classical : ∀ {m n N : ℕ} (A : Matrix (Fin m) (Fin n) ℂ)
    (u : Fin m → EuclideanSpace ℂ (Fin N)) (v : Fin n → EuclideanSpace ℂ (Fin N)),
    (∀ p, ‖u p‖ ≤ 1) → (∀ q, ‖v q‖ ≤ 1) →
    ‖∑' k : ℕ, (h k : ℂ) * ∑ p : Fin m, ∑ q : Fin n,
      A p q * (@inner ℂ _ _ (u p) (v q) * ((‖@inner ℂ _ _ (u p) (v q)‖ ^ 2 : ℝ) : ℂ) ^ k)‖ ≤
      classicalNorm A

/-- The radial transfer: a dominated radial series `h` with `0 < D ≤ h 0 - ∑_{k ≥ 0} |h (k + 1)|` gives
`complexGrothendieckConstant ≤ 1 / D`. -/
theorem complexGrothendieckConstant_le_inv_of_dominated {h : ℕ → ℝ}
    (hdom : DominatedRadialSeries h) {D : ℝ} (hD_pos : 0 < D)
    (hD_le : D ≤ h 0 - ∑' k : ℕ, |h (k + 1)|) :
    complexGrothendieckConstant ≤ 1 / D := by
  have ht : 0 ≤ ∑' k : ℕ, |h (k + 1)| := tsum_nonneg fun _ => abs_nonneg _
  have hh0 : 0 < h 0 := by linarith
  have hs : Summable fun k : ℕ => |h (k + 1)| :=
    hdom.summable_abs.comp_injective (add_left_injective 1)
  refine csInf_le ⟨0, fun _ hK => hK.1⟩ ⟨by positivity, fun m n A => ?_⟩
  have h_zero_mem : (0 : ℝ) ∈ { r : ℝ | ∃ (N : ℕ) (u : Fin m → EuclideanSpace ℂ (Fin N))
      (v : Fin n → EuclideanSpace ℂ (Fin N)), (∀ p, ‖u p‖ ≤ 1) ∧ (∀ q, ‖v q‖ ≤ 1) ∧
      r = ‖∑ p : Fin m, ∑ q : Fin n, A p q * @inner ℂ _ _ (u p) (v q)‖ } :=
    ⟨0, fun _ => 0, fun _ => 0, fun _ => by simp, fun _ => by simp, by simp⟩
  -- Step 1: `h 0 * r ≤ classicalNorm A + (∑_{k ≥ 1} |h k|) * quantumNorm A` for every value `r` of the
  -- supremum defining `quantumNorm A`.
  have h_q_bound : quantumNorm A ≤
      (classicalNorm A + (∑' k : ℕ, |h (k + 1)|) * quantumNorm A) / h 0 := by
    refine csSup_le ⟨0, h_zero_mem⟩ ?_
    rintro r ⟨N, u, v, hu, hv, rfl⟩
    have hS : ∀ k, ‖powerForm A u v k‖ ≤ quantumNorm A := power_form_le_quantumNorm A u v hu hv
    have hb : ∀ k, ‖(h k : ℂ) * powerForm A u v k‖ ≤ |h k| * quantumNorm A := fun k => by
      rw [norm_mul, Complex.norm_real, Real.norm_eq_abs]
      exact mul_le_mul_of_nonneg_left (hS k) (abs_nonneg _)
    have hsum : Summable fun k => (h k : ℂ) * powerForm A u v k :=
      Summable.of_norm_bounded (hdom.summable_abs.mul_right _) hb
    have htail : ‖∑' k : ℕ, (h (k + 1) : ℂ) * powerForm A u v (k + 1)‖ ≤
        (∑' k : ℕ, |h (k + 1)|) * quantumNorm A :=
      tsum_of_norm_bounded (hs.hasSum.mul_right _) fun k => hb (k + 1)
    have hcls : ‖∑' k : ℕ, (h k : ℂ) * powerForm A u v k‖ ≤ classicalNorm A :=
      hdom.le_classical A u v hu hv
    rw [hsum.tsum_eq_zero_add] at hcls
    have h0 : ‖(h 0 : ℂ) * powerForm A u v 0‖ =
        h 0 * ‖∑ p : Fin m, ∑ q : Fin n, A p q * @inner ℂ _ _ (u p) (v q)‖ := by
      rw [norm_mul, Complex.norm_real, Real.norm_of_nonneg hh0.le]
      simp [powerForm]
    have htri := norm_sub_le ((h 0 : ℂ) * powerForm A u v 0 +
      ∑' k : ℕ, (h (k + 1) : ℂ) * powerForm A u v (k + 1))
      (∑' k : ℕ, (h (k + 1) : ℂ) * powerForm A u v (k + 1))
    rw [add_sub_cancel_right] at htri
    rw [le_div_iff₀ hh0]
    linarith
  -- Step 2: rearrange `h 0 * V(A) ≤ C(A) + (∑_{k ≥ 1} |h k|) * V(A)` into `V(A) ≤ (1 / D) * C(A)`.
  rw [le_div_iff₀ hh0] at h_q_bound
  have hV : 0 ≤ quantumNorm A := le_csSup_of_le (quantumNorm_bddAbove A) h_zero_mem le_rfl
  rw [div_mul_eq_mul_div, one_mul, le_div_iff₀ hD_pos]
  linarith [mul_le_mul_of_nonneg_right hD_le hV]

/-! ### Convex combinations and the head/tail margin -/

/-- A finite convex combination of `DominatedRadialSeries` is again a `DominatedRadialSeries`. -/
theorem DominatedRadialSeries.convex_finset {ι : Type*} (s : Finset ι)
    (w : ι → ℝ) (hw_nn : ∀ i ∈ s, 0 ≤ w i) (hw_sum : ∑ i ∈ s, w i = 1)
    (h : ι → ℕ → ℝ) (hdom : ∀ i ∈ s, DominatedRadialSeries (h i)) :
    DominatedRadialSeries (fun k => ∑ i ∈ s, w i * h i k) := by
  refine ⟨?_, ?_⟩
  · refine Summable.of_nonneg_of_le (fun _ => abs_nonneg _) (fun k => ?_)
      (summable_sum fun i hi => ((hdom i hi).summable_abs).mul_left (w i))
    calc |∑ i ∈ s, w i * h i k|
      _ ≤ ∑ i ∈ s, |w i * h i k| := Finset.abs_sum_le_sum_abs _ _
      _ = ∑ i ∈ s, w i * |h i k| :=
          Finset.sum_congr rfl fun i hi => by rw [abs_mul, abs_of_nonneg (hw_nn i hi)]
  · intro m n N A u v hu hv
    have hS : ∀ k, ‖powerForm A u v k‖ ≤ quantumNorm A := power_form_le_quantumNorm A u v hu hv
    have h_summ_i : ∀ i ∈ s,
        Summable (fun k : ℕ => (w i : ℂ) * ((h i k : ℂ) * powerForm A u v k)) := by
      intro i hi
      have hb : ∀ k, ‖(h i k : ℂ) * powerForm A u v k‖ ≤ |h i k| * quantumNorm A := fun k => by
        rw [norm_mul, Complex.norm_real, Real.norm_eq_abs]
        exact mul_le_mul_of_nonneg_left (hS k) (abs_nonneg _)
      have hs : Summable fun k : ℕ => (h i k : ℂ) * powerForm A u v k :=
        Summable.of_norm_bounded ((hdom i hi).summable_abs.mul_right (quantumNorm A)) hb
      exact hs.mul_left _
    have h_swap : ∑' k : ℕ, ((∑ i ∈ s, w i * h i k : ℝ) : ℂ) * powerForm A u v k =
        ∑ i ∈ s, (w i : ℂ) * ∑' k : ℕ, (h i k : ℂ) * powerForm A u v k :=
      calc ∑' k : ℕ, ((∑ i ∈ s, w i * h i k : ℝ) : ℂ) * powerForm A u v k
        _ = ∑' k : ℕ, ∑ i ∈ s, (w i : ℂ) * ((h i k : ℂ) * powerForm A u v k) :=
            tsum_congr fun k => by
              push_cast
              rw [Finset.sum_mul]
              exact Finset.sum_congr rfl fun i _ => mul_assoc _ _ _
        _ = ∑ i ∈ s, ∑' k : ℕ, (w i : ℂ) * ((h i k : ℂ) * powerForm A u v k) :=
            Summable.tsum_finsetSum h_summ_i
        _ = ∑ i ∈ s, (w i : ℂ) * ∑' k : ℕ, (h i k : ℂ) * powerForm A u v k :=
            Finset.sum_congr rfl fun i _ => tsum_mul_left
    show ‖∑' k : ℕ, ((∑ i ∈ s, w i * h i k : ℝ) : ℂ) * powerForm A u v k‖ ≤ classicalNorm A
    rw [h_swap]
    calc ‖∑ i ∈ s, (w i : ℂ) * ∑' k : ℕ, (h i k : ℂ) * powerForm A u v k‖
      _ ≤ ∑ i ∈ s, ‖(w i : ℂ) * ∑' k : ℕ, (h i k : ℂ) * powerForm A u v k‖ := norm_sum_le _ _
      _ ≤ ∑ i ∈ s, w i * classicalNorm A := by
          refine Finset.sum_le_sum fun i hi => ?_
          rw [norm_mul, Complex.norm_real, Real.norm_of_nonneg (hw_nn i hi)]
          exact mul_le_mul_of_nonneg_left ((hdom i hi).le_classical A u v hu hv) (hw_nn i hi)
      _ = classicalNorm A := by rw [← Finset.sum_mul, hw_sum, one_mul]

/-- Head and tail margin: for a mixture `H = ∑ᵢ wᵢ hᵢ` (`wᵢ ≥ 0`), approximations `h_app i` with
`∑_{k ≤ K} |hᵢ k - h_app i k| ≤ head_err i` and tails `∑_{k > K} |hᵢ k| ≤ tail_err i`,
`H_app 0 - ∑_{k=1}^K |H_app k| - ∑ᵢ wᵢ head_err i - ∑ᵢ wᵢ tail_err i ≤ H 0 - ∑_{k ≥ 1} |H k|`.
The head error is paid once for `k = 0, …, K` together. -/
theorem cert_margin_of_head_and_tails {ι : Type*} (s : Finset ι) (K : ℕ)
    (w : ι → ℝ) (hw : ∀ i ∈ s, 0 ≤ w i)
    (h_true h_app : ι → ℕ → ℝ)
    (h_summ : ∀ i ∈ s, Summable (fun k => |h_true i k|))
    (head_err : ι → ℝ)
    (h_head : ∀ i ∈ s, ∑ k ∈ Finset.range (K + 1), |h_true i k - h_app i k| ≤ head_err i)
    (tail_err : ι → ℝ)
    (h_tail : ∀ i ∈ s, ∑' k : ℕ, |h_true i (K + 1 + k)| ≤ tail_err i) :
    let H := fun k => ∑ i ∈ s, w i * h_true i k
    let H_app := fun k => ∑ i ∈ s, w i * h_app i k
    H_app 0 - (∑ k ∈ Finset.range K, |H_app (k + 1)|)
      - (∑ i ∈ s, w i * head_err i) - (∑ i ∈ s, w i * tail_err i) ≤
      H 0 - ∑' k : ℕ, |H (k + 1)| := by
  intro H H_app
  have hH_summ_all : Summable (fun k : ℕ => |H k|) := by
    refine Summable.of_nonneg_of_le (fun _ => abs_nonneg _) (fun k => ?_)
      (summable_sum fun i hi => (h_summ i hi).mul_left (w i))
    calc |∑ i ∈ s, w i * h_true i k|
      _ ≤ ∑ i ∈ s, |w i * h_true i k| := Finset.abs_sum_le_sum_abs _ _
      _ = ∑ i ∈ s, w i * |h_true i k| :=
          Finset.sum_congr rfl fun i hi => by rw [abs_mul, abs_of_nonneg (hw i hi)]
  have hH_summ_shift : Summable (fun k : ℕ => |H (k + 1)|) :=
    hH_summ_all.comp_injective (add_left_injective 1)
  -- Split `∑'_{k ≥ 0} |H (k + 1)|` at `K` into `Finset.range K` and the tail `K + 1 + k`.
  have h_tsum_split : (∑' k : ℕ, |H (k + 1)|) =
      (∑ k ∈ Finset.range K, |H (k + 1)|) + ∑' k : ℕ, |H (k + K + 1)| :=
    (hH_summ_shift.sum_add_tsum_nat_add K).symm
  -- 1. The head `0, …, K`: one triangle inequality bounds `H_app 0 - H 0` together with
  -- `∑_{k=1}^K (|H k| - |H_app k|)`.
  have h_head_diff : (H_app 0 - H 0) +
      ((∑ k ∈ Finset.range K, |H (k + 1)|) - (∑ k ∈ Finset.range K, |H_app (k + 1)|)) ≤
      ∑ i ∈ s, w i * head_err i := by
    have h0_le : H_app 0 - H 0 ≤ |H 0 - H_app 0| := by
      rw [abs_sub_comm]; exact le_abs_self _
    have hsum_le : (∑ k ∈ Finset.range K, |H (k + 1)|) - (∑ k ∈ Finset.range K, |H_app (k + 1)|) ≤
        ∑ k ∈ Finset.range K, |H (k + 1) - H_app (k + 1)| := by
      rw [← Finset.sum_sub_distrib]
      exact Finset.sum_le_sum fun k _ => abs_sub_abs_le_abs_sub _ _
    have h_comb : |H 0 - H_app 0| + (∑ k ∈ Finset.range K, |H (k + 1) - H_app (k + 1)|) =
        ∑ k ∈ Finset.range (K + 1), |H k - H_app k| := by
      rw [Finset.sum_range_succ', add_comm]
    calc (H_app 0 - H 0) +
          ((∑ k ∈ Finset.range K, |H (k + 1)|) - (∑ k ∈ Finset.range K, |H_app (k + 1)|))
      _ ≤ |H 0 - H_app 0| + ∑ k ∈ Finset.range K, |H (k + 1) - H_app (k + 1)| :=
          add_le_add h0_le hsum_le
      _ = ∑ k ∈ Finset.range (K + 1), |H k - H_app k| := h_comb
      _ ≤ ∑ k ∈ Finset.range (K + 1), ∑ i ∈ s, w i * |h_true i k - h_app i k| := by
          refine Finset.sum_le_sum fun k _ => ?_
          have hsub : H k - H_app k = ∑ i ∈ s, w i * (h_true i k - h_app i k) := by
            simp only [H, H_app, ← Finset.sum_sub_distrib, mul_sub]
          rw [hsub]
          calc |∑ i ∈ s, w i * (h_true i k - h_app i k)|
            _ ≤ ∑ i ∈ s, |w i * (h_true i k - h_app i k)| := Finset.abs_sum_le_sum_abs _ _
            _ = ∑ i ∈ s, w i * |h_true i k - h_app i k| :=
                Finset.sum_congr rfl fun i hi => by rw [abs_mul, abs_of_nonneg (hw i hi)]
      _ = ∑ i ∈ s, w i * ∑ k ∈ Finset.range (K + 1), |h_true i k - h_app i k| := by
          rw [Finset.sum_comm]
          refine Finset.sum_congr rfl fun i _ => (Finset.mul_sum _ _ _).symm
      _ ≤ ∑ i ∈ s, w i * head_err i :=
          Finset.sum_le_sum fun i hi => mul_le_mul_of_nonneg_left (h_head i hi) (hw i hi)
  -- 2. The tail `k > K`.
  have h_tail_diff : (∑' k : ℕ, |H (k + K + 1)|) ≤ ∑ i ∈ s, w i * tail_err i := by
    have hs_i : ∀ i ∈ s, Summable (fun k : ℕ => w i * |h_true i (K + 1 + k)|) := by
      intro i hi
      have h2 : Summable fun k : ℕ => |h_true i (K + 1 + k)| :=
        (h_summ i hi).comp_injective (add_right_injective (K + 1))
      exact h2.mul_left (w i)
    have hs_H : Summable (fun k : ℕ => |H (k + K + 1)|) :=
      hH_summ_shift.comp_injective (add_left_injective K)
    calc ∑' k : ℕ, |H (k + K + 1)|
      _ ≤ ∑' k : ℕ, ∑ i ∈ s, w i * |h_true i (K + 1 + k)| := by
          refine Summable.tsum_le_tsum (fun k => ?_) hs_H (summable_sum hs_i)
          have hk_eq : k + K + 1 = K + 1 + k := by omega
          rw [hk_eq]
          calc |∑ i ∈ s, w i * h_true i (K + 1 + k)|
            _ ≤ ∑ i ∈ s, |w i * h_true i (K + 1 + k)| := Finset.abs_sum_le_sum_abs _ _
            _ = ∑ i ∈ s, w i * |h_true i (K + 1 + k)| :=
                Finset.sum_congr rfl fun i hi => by rw [abs_mul, abs_of_nonneg (hw i hi)]
      _ = ∑ i ∈ s, ∑' k : ℕ, w i * |h_true i (K + 1 + k)| := Summable.tsum_finsetSum hs_i
      _ = ∑ i ∈ s, w i * ∑' k : ℕ, |h_true i (K + 1 + k)| :=
          Finset.sum_congr rfl fun i _ => tsum_mul_left
      _ ≤ ∑ i ∈ s, w i * tail_err i :=
          Finset.sum_le_sum fun i hi => mul_le_mul_of_nonneg_left (h_tail i hi) (hw i hi)
  rw [h_tsum_split]
  linarith

end HaagerupBound
