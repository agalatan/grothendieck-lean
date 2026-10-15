import Grothe.Lower.TransferFinite

/-!
# The transfer in the limit: approximable vector functions (H5, stage 2, abstract part)

`H` is a complex inner product space (the role of `L²(μ)`), `T : H →L[ℂ] H` a bounded operator
and `U : Set H` an admissible class of test elements (the role of the a.e. unimodular functions).

* `ScalarCap T U B`: `‖⟪f, T g⟫‖ ≤ B` for all `f, g ∈ U` (the `L^∞ → L¹` cap of the witness).
* `CellFamily U e`: every unimodular combination `∑ᵢ εᵢ eᵢ` of the cell family lies in `U`
  (true for the indicators of a finite measurable partition).
* `Approximable U u v`: the vector pair `(u, v)` is approximable in norm, coordinatewise and to
  any accuracy, by ball-valued cell-constant pairs on admissible cell families.

`pairVal_le_of_approx` is the limit form of the finite transfer: with a Grothendieck bound `K`,
a scalar cap `B` and an approximable pair, `‖∑ₗ ⟪uₗ, T vₗ⟫‖ ≤ K · B`.  The only analysis used is
the continuity of the pairing (`norm_pairVal_sub_le`, from `‖T‖`).

Nothing here is hypothetical; the measure-theoretic instances of `Approximable` are provided in
`Grothe.Lower.TransferL2`.
-/

namespace Grothe.Lower

open Finset

noncomputable section

variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
variable {ι : Type} [Fintype ι]

/-- The scalar cap `B` of `T` over the admissible class `U`. -/
def ScalarCap (T : H →L[ℂ] H) (U : Set H) (B : ℝ) : Prop :=
  ∀ f ∈ U, ∀ g ∈ U, ‖inner ℂ f (T g)‖ ≤ B

/-- A cell family is admissible for `U` if all its unimodular combinations lie in `U`. -/
def CellFamily (U : Set H) {N : ℕ} (e : Fin N → H) : Prop :=
  ∀ ε : Fin N → ℂ, (∀ i, ‖ε i‖ = 1) → cellFun e ε ∈ U

/-- `(u, v)` is approximable, coordinatewise in norm and to any accuracy, by ball-valued
cell-constant pairs on admissible cell families. -/
def Approximable (U : Set H) (u v : ι → H) : Prop :=
  ∀ η : ℝ, 0 < η → ∃ (N M : ℕ) (e : Fin N → H) (e' : Fin M → H)
    (x : Fin N → EuclideanSpace ℂ ι) (y : Fin M → EuclideanSpace ℂ ι),
    CellFamily U e ∧ CellFamily U e' ∧ (∀ i, ‖x i‖ ≤ 1) ∧ (∀ j, ‖y j‖ ≤ 1) ∧
    (∀ ℓ, ‖u ℓ - cellVec e x ℓ‖ ≤ η) ∧ (∀ ℓ, ‖v ℓ - cellVec e' y ℓ‖ ≤ η)

/-- The finite transfer with the cap stated over the admissible class. -/
theorem finite_transfer_of_cap {K B : ℝ} (hK : IsGrothendieckBound K) {T : H →L[ℂ] H}
    {U : Set H} (hcap : ScalarCap T U B) {N M : ℕ} {e : Fin N → H} {e' : Fin M → H}
    (he : CellFamily U e) (he' : CellFamily U e')
    {x : Fin N → EuclideanSpace ℂ ι} {y : Fin M → EuclideanSpace ℂ ι}
    (hx : ∀ i, ‖x i‖ ≤ 1) (hy : ∀ j, ‖y j‖ ≤ 1) :
    ‖pairVal T (cellVec e x) (cellVec e' y)‖ ≤ K * B :=
  finite_transfer hK T e e' (fun ε δ hε hδ => hcap _ (he ε hε) _ (he' δ hδ)) hx hy

/-- Continuity of the pairing in both arguments. -/
lemma norm_pairVal_sub_le (T : H →L[ℂ] H) (u u' v v' : ι → H) :
    ‖pairVal T u v - pairVal T u' v'‖
      ≤ ∑ ℓ, ‖T‖ * (‖u ℓ - u' ℓ‖ * ‖v ℓ‖ + ‖u' ℓ‖ * ‖v ℓ - v' ℓ‖) := by
  unfold pairVal
  rw [← Finset.sum_sub_distrib]
  refine (norm_sum_le _ _).trans (sum_le_sum fun ℓ _ => ?_)
  have hsplit : inner ℂ (u ℓ) (T (v ℓ)) - inner ℂ (u' ℓ) (T (v' ℓ))
      = inner ℂ (u ℓ - u' ℓ) (T (v ℓ)) + inner ℂ (u' ℓ) (T (v ℓ - v' ℓ)) := by
    rw [inner_sub_left, map_sub, inner_sub_right]; ring
  rw [hsplit]
  have h1 := norm_inner_le_norm (𝕜 := ℂ) (u ℓ - u' ℓ) (T (v ℓ))
  have h2 := norm_inner_le_norm (𝕜 := ℂ) (u' ℓ) (T (v ℓ - v' ℓ))
  have h3 := T.le_opNorm (v ℓ)
  have h4 := T.le_opNorm (v ℓ - v' ℓ)
  calc ‖inner ℂ (u ℓ - u' ℓ) (T (v ℓ)) + inner ℂ (u' ℓ) (T (v ℓ - v' ℓ))‖
      ≤ ‖inner ℂ (u ℓ - u' ℓ) (T (v ℓ))‖ + ‖inner ℂ (u' ℓ) (T (v ℓ - v' ℓ))‖ := norm_add_le _ _
    _ ≤ ‖u ℓ - u' ℓ‖ * ‖T (v ℓ)‖ + ‖u' ℓ‖ * ‖T (v ℓ - v' ℓ)‖ := add_le_add h1 h2
    _ ≤ ‖u ℓ - u' ℓ‖ * (‖T‖ * ‖v ℓ‖) + ‖u' ℓ‖ * (‖T‖ * ‖v ℓ - v' ℓ‖) :=
        add_le_add (mul_le_mul_of_nonneg_left h3 (norm_nonneg _))
          (mul_le_mul_of_nonneg_left h4 (norm_nonneg _))
    _ = ‖T‖ * (‖u ℓ - u' ℓ‖ * ‖v ℓ‖ + ‖u' ℓ‖ * ‖v ℓ - v' ℓ‖) := by ring

/-- **Transfer in the limit.**  A Grothendieck bound `K`, a scalar cap `B` of `T` over `U` and
an approximable vector pair give `‖∑ₗ ⟪uₗ, T vₗ⟫‖ ≤ K · B`. -/
theorem pairVal_le_of_approx {K B : ℝ} (hK : IsGrothendieckBound K) {T : H →L[ℂ] H}
    {U : Set H} (hcap : ScalarCap T U B) {u v : ι → H} (happ : Approximable U u v) :
    ‖pairVal T u v‖ ≤ K * B := by
  apply le_of_forall_pos_le_add
  intro ε hε
  obtain ⟨C, hCdef⟩ : ∃ C : ℝ, C = ‖T‖ * ∑ ℓ, (‖v ℓ‖ + ‖u ℓ‖ + 1) := ⟨_, rfl⟩
  have hC : 0 ≤ C := by
    rw [hCdef]
    exact mul_nonneg (norm_nonneg _)
      (sum_nonneg fun ℓ _ => by linarith [norm_nonneg (u ℓ), norm_nonneg (v ℓ)])
  obtain ⟨η, hη0, hη1, hηC⟩ : ∃ η : ℝ, 0 < η ∧ η ≤ 1 ∧ C * η ≤ ε := by
    refine ⟨min 1 (ε / (C + 1)), lt_min one_pos (div_pos hε (by linarith)), min_le_left _ _, ?_⟩
    calc C * min 1 (ε / (C + 1)) ≤ C * (ε / (C + 1)) :=
          mul_le_mul_of_nonneg_left (min_le_right _ _) hC
      _ ≤ (C + 1) * (ε / (C + 1)) := mul_le_mul_of_nonneg_right (by linarith)
          (div_pos hε (by linarith)).le
      _ = ε := by field_simp
  obtain ⟨N, M, e, e', x, y, he, he', hx, hy, hu, hv⟩ := happ η hη0
  have h1 := finite_transfer_of_cap hK hcap he he' hx hy
  have h2 := norm_pairVal_sub_le T u (cellVec e x) v (cellVec e' y)
  have h3 : ∑ ℓ, ‖T‖ * (‖u ℓ - cellVec e x ℓ‖ * ‖v ℓ‖
      + ‖cellVec e x ℓ‖ * ‖v ℓ - cellVec e' y ℓ‖) ≤ C * η := by
    rw [hCdef, ← Finset.mul_sum, mul_assoc]
    apply mul_le_mul_of_nonneg_left _ (norm_nonneg T)
    rw [Finset.sum_mul]
    apply sum_le_sum
    intro ℓ _
    have hcx : ‖cellVec e x ℓ‖ ≤ ‖u ℓ‖ + η := by
      calc ‖cellVec e x ℓ‖ = ‖u ℓ - (u ℓ - cellVec e x ℓ)‖ := by congr 1; abel
        _ ≤ ‖u ℓ‖ + ‖u ℓ - cellVec e x ℓ‖ := norm_sub_le _ _
        _ ≤ ‖u ℓ‖ + η := by linarith [hu ℓ]
    have ha := mul_le_mul_of_nonneg_right (hu ℓ) (norm_nonneg (v ℓ))
    have hb := mul_le_mul_of_nonneg_left (hv ℓ) (norm_nonneg (cellVec e x ℓ))
    have hc := mul_le_mul_of_nonneg_right hcx hη0.le
    have hd : η * η ≤ 1 * η := mul_le_mul_of_nonneg_right hη1 hη0.le
    nlinarith [norm_nonneg (u ℓ), norm_nonneg (v ℓ)]
  calc ‖pairVal T u v‖
      ≤ ‖pairVal T (cellVec e x) (cellVec e' y)‖
        + ‖pairVal T u v - pairVal T (cellVec e x) (cellVec e' y)‖ :=
        norm_le_norm_add_norm_sub' _ _
    _ ≤ K * B + C * η := add_le_add h1 (h2.trans h3)
    _ ≤ K * B + ε := by linarith

end

end Grothe.Lower
