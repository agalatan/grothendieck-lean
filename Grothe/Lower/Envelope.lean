import Grothe.Lower.Bernstein
import Grothe.Lower.Cover
import Grothe.Lower.Profiles

/-!
# The scalar envelope

Rows `(ℓᵢ, βᵢ, Cᵢ)` give quadratics `Fᵢ(t) = t² - 2ℓᵢt + Cᵢ`.  The analytic layer supplies, for
every pair `i, j` and every `θ ∈ [0,1]`,

  `V ≤ (1-θ) Fᵢ(t) + θ Fⱼ(t) - (2/ε) θ(1-θ) (βᵢ - βⱼ)²`

(retained-square mixing).  The checker covers `[0, 9/10]` by dyadic leaves, each selecting one
row (`θ = 0`) or a pair, for which the optimal `θ` yields a piecewise quadratic in `t`; its exact
maximum on each piece is compared with the target `bound`.  `envelope_bound` is the soundness
theorem: a successful check implies `V ≤ bound`.
-/

namespace Grothe.Lower

structure EnvRow where
  ell : ℚ
  beta : ℚ
  C : ℚ
  deriving Repr, DecidableEq

structure EnvLeaf where
  path : String
  rows : List ℕ
  deriving Repr

/-- The root interval `[0, 9/10]` of admissible `t`. -/
def rootIv : Iv := ⟨0, 9 / 10⟩

/-- `Fᵢ(t) = t² - 2ℓᵢ t + Cᵢ`. -/
noncomputable def F (row : EnvRow) (t : ℝ) : ℝ := t ^ 2 - 2 * row.ell * t + row.C

/-- Quadratic coefficients `(c0, c1, c2)` of `F`. -/
def fq (row : EnvRow) : ℚ × ℚ × ℚ := (row.C, -2 * row.ell, 1)

/-- A piece `(quadratic, α, β)` is fine if it is empty or its exact maximum is at most `bound`. -/
def pieceOK (q : ℚ × ℚ × ℚ) (α β bound : ℚ) : Bool :=
  decide (β < α) || decide (quadMax q.1 q.2.1 q.2.2 α β ≤ bound)

/-- The gain `a = 2(βᵢ - βⱼ)²/ε`. -/
def gainOf (ri rj : EnvRow) : ℚ := 2 * (ri.beta - rj.beta) ^ 2 / ε

/-- Affine difference `Fᵢ - Fⱼ = D0 + D1 t`. -/
def D0 (ri rj : EnvRow) : ℚ := ri.C - rj.C
def D1 (ri rj : EnvRow) : ℚ := 2 * (rj.ell - ri.ell)

/-- The middle quadratic `(Fᵢ+Fⱼ)/2 - a/4 - (Fᵢ-Fⱼ)²/(4a)`. -/
def middleQ (ri rj : EnvRow) : ℚ × ℚ × ℚ :=
  let a := gainOf ri rj
  ((ri.C + rj.C) / 2 - a / 4 - D0 ri rj ^ 2 / (4 * a),
   -(ri.ell + rj.ell) - D0 ri rj * D1 ri rj / (2 * a),
   1 - D1 ri rj ^ 2 / (4 * a))

def leftPt (ri rj : EnvRow) : ℚ := (-gainOf ri rj - D0 ri rj) / D1 ri rj
def rightPt (ri rj : EnvRow) : ℚ := (gainOf ri rj - D0 ri rj) / D1 ri rj

def checkPair (ri rj : EnvRow) (lo hi bound : ℚ) : Bool :=
  decide (ri.ell < rj.ell) && decide (0 < gainOf ri rj) &&
  pieceOK (fq ri) lo (min hi (leftPt ri rj)) bound &&
  pieceOK (middleQ ri rj) (max lo (leftPt ri rj)) (min hi (rightPt ri rj)) bound &&
  pieceOK (fq rj) (max lo (rightPt ri rj)) hi bound

def checkEnvLeaf (rows : List EnvRow) (bound : ℚ) (leaf : EnvLeaf) : Bool :=
  let iv := ivOfPath rootIv (decodePath leaf.path)
  match leaf.rows with
  | [i] => decide (i < rows.length) && pieceOK (fq (rows.getD i ⟨0, 0, 0⟩)) iv.lo iv.hi bound
  | [i, j] => decide (i < rows.length) && decide (j < rows.length) &&
      checkPair (rows.getD i ⟨0, 0, 0⟩) (rows.getD j ⟨0, 0, 0⟩) iv.lo iv.hi bound
  | _ => false

def checkEnvelope (rows : List EnvRow) (leaves : List EnvLeaf) (bound : ℚ) : Bool :=
  leaves.all (checkEnvLeaf rows bound) &&
  coversIv rootIv (leaves.map fun leaf => decodePath leaf.path) 64

lemma F_eq (row : EnvRow) (t : ℝ) :
    F row t = ((fq row).1 : ℝ) + (fq row).2.1 * t + (fq row).2.2 * t ^ 2 := by
  simp only [F, fq]; push_cast; ring

lemma pieceOK_sound (q : ℚ × ℚ × ℚ) (α β bound : ℚ) (h : pieceOK q α β bound = true) (t : ℝ)
    (hα : (α : ℝ) ≤ t) (hβ : t ≤ β) :
    (q.1 : ℝ) + q.2.1 * t + q.2.2 * t ^ 2 ≤ bound := by
  simp only [pieceOK, Bool.or_eq_true, decide_eq_true_eq] at h
  rcases h with h | h
  · exfalso
    have : (α : ℝ) ≤ β := hα.trans hβ
    have : α ≤ β := by exact_mod_cast this
    linarith
  · calc (q.1 : ℝ) + q.2.1 * t + q.2.2 * t ^ 2 ≤ ((quadMax q.1 q.2.1 q.2.2 α β : ℚ) : ℝ) :=
          quadVal_le_quadMax _ _ _ _ _ t hα hβ
      _ ≤ bound := by exact_mod_cast h

/-- **Soundness of the envelope checker.** -/
theorem envelope_bound (rows : List EnvRow) (leaves : List EnvLeaf) (bound : ℚ)
    (hchk : checkEnvelope rows leaves bound = true) (t V : ℝ) (ht0 : 0 ≤ t) (ht1 : t ≤ 9 / 10)
    (hmix : ∀ i j : ℕ, i < rows.length → j < rows.length → ∀ θ : ℝ, 0 ≤ θ → θ ≤ 1 →
      V ≤ (1 - θ) * F (rows.getD i ⟨0, 0, 0⟩) t + θ * F (rows.getD j ⟨0, 0, 0⟩) t
        - (2 / (ε : ℝ)) * θ * (1 - θ) *
            ((rows.getD i ⟨0, 0, 0⟩).beta - (rows.getD j ⟨0, 0, 0⟩).beta) ^ 2) :
    V ≤ bound := by
  simp only [checkEnvelope, Bool.and_eq_true, List.all_eq_true] at hchk
  obtain ⟨hleaves, hcover⟩ := hchk
  have hmem : rootIv.mem t := by
    refine ⟨?_, ?_⟩
    · simp only [rootIv]; push_cast; exact ht0
    · simp only [rootIv]; push_cast; exact ht1
  obtain ⟨p, hp, hmemp⟩ := coversIv_sound 64 rootIv _ hcover t hmem
  obtain ⟨leaf, hleaf, rfl⟩ := List.mem_map.1 hp
  have hc := hleaves leaf hleaf
  simp only [checkEnvLeaf] at hc
  set iv := ivOfPath rootIv (decodePath leaf.path) with hiv
  obtain ⟨hlo, hhi⟩ := hmemp
  match hrows : leaf.rows with
  | [i] =>
    rw [hrows] at hc
    simp only [Bool.and_eq_true, decide_eq_true_eq] at hc
    obtain ⟨hi, hpiece⟩ := hc
    have h1 := hmix i i hi hi 0 le_rfl zero_le_one
    simp only [sub_zero, zero_mul, one_mul, mul_zero, sub_self] at h1
    have h2 := pieceOK_sound _ _ _ _ hpiece t hlo hhi
    rw [← F_eq] at h2
    linarith
  | [i, j] =>
    rw [hrows] at hc
    simp only [Bool.and_eq_true, decide_eq_true_eq, checkPair, and_assoc] at hc
    obtain ⟨hi, hj, hell, hga, hP1, hP2, hP3⟩ := hc
    set ri := rows.getD i ⟨0, 0, 0⟩ with hri
    set rj := rows.getD j ⟨0, 0, 0⟩ with hrj
    set a : ℚ := gainOf ri rj with ha
    have ha' : (0 : ℝ) < a := by exact_mod_cast hga
    have hD1 : (0 : ℝ) < (D1 ri rj : ℚ) := by
      have : (0 : ℚ) < D1 ri rj := by simp only [D1]; linarith
      exact_mod_cast this
    have hgain : (2 / (ε : ℝ)) * (ri.beta - rj.beta) ^ 2 = a := by
      simp only [ha, gainOf]; push_cast; ring
    -- the affine difference
    have hD : F ri t - F rj t = (D0 ri rj : ℚ) + (D1 ri rj : ℚ) * t := by
      simp only [F, D0, D1]; push_cast; ring
    have hleft : ((leftPt ri rj : ℚ) : ℝ) = (-(a : ℝ) - (D0 ri rj : ℚ)) / (D1 ri rj : ℚ) := by
      simp only [leftPt, ha]; push_cast; ring
    have hright : ((rightPt ri rj : ℚ) : ℝ) = ((a : ℝ) - (D0 ri rj : ℚ)) / (D1 ri rj : ℚ) := by
      simp only [rightPt, ha]; push_cast; ring
    by_cases hc1 : F ri t - F rj t ≤ -a
    · -- `θ = 0`
      have h1 := hmix i i hi hi 0 le_rfl zero_le_one
      rw [← hri] at h1
      have e : (1 - (0 : ℝ)) * F ri t + 0 * F ri t
          - 2 / (ε : ℝ) * 0 * (1 - 0) * ((ri.beta : ℝ) - ri.beta) ^ 2 = F ri t := by ring
      have htl : t ≤ ((leftPt ri rj : ℚ) : ℝ) := by
        rw [hleft, le_div_iff₀ hD1]; linarith
      have h2 := pieceOK_sound _ _ _ _ hP1 t hlo (by rw [Rat.cast_min]; exact le_min hhi htl)
      rw [← F_eq] at h2
      linarith
    · by_cases hc2 : (a : ℝ) ≤ F ri t - F rj t
      · -- `θ = 1`
        have h1 := hmix i j hi hj 1 zero_le_one le_rfl
        rw [← hri, ← hrj] at h1
        have e : (1 - (1 : ℝ)) * F ri t + 1 * F rj t
            - 2 / (ε : ℝ) * 1 * (1 - 1) * ((ri.beta : ℝ) - rj.beta) ^ 2 = F rj t := by ring
        have htr : ((rightPt ri rj : ℚ) : ℝ) ≤ t := by
          rw [hright, div_le_iff₀ hD1]; linarith
        have h2 := pieceOK_sound _ _ _ _ hP3 t (by rw [Rat.cast_max]; exact max_le hlo htr) hhi
        rw [← F_eq] at h2
        linarith
      · -- interior `θ = (D + a)/(2a)`
        push_neg at hc1 hc2
        set D : ℝ := F ri t - F rj t with hDdef
        set θ : ℝ := (D + a) / (2 * a) with hθ
        have hθ0 : 0 ≤ θ := div_nonneg (by linarith) (by linarith)
        have hθ1 : θ ≤ 1 := by rw [hθ, div_le_one (by linarith)]; linarith
        have h1 := hmix i j hi hj θ hθ0 hθ1
        rw [← hri, ← hrj] at h1
        have e : 2 / (ε : ℝ) * θ * (1 - θ) * ((ri.beta : ℝ) - rj.beta) ^ 2 = a * θ * (1 - θ) := by
          rw [← hgain]; ring
        have hane : (a : ℝ) ≠ 0 := ha'.ne'
        have hmid : (1 - θ) * F ri t + θ * F rj t - a * θ * (1 - θ)
            = ((middleQ ri rj).1 : ℝ) + (middleQ ri rj).2.1 * t + (middleQ ri rj).2.2 * t ^ 2 := by
          simp only [middleQ]
          rw [← ha]
          push_cast
          rw [hθ]
          have hFj : F rj t = F ri t - D := by rw [hDdef]; ring
          rw [hFj, hD]
          simp only [F, D0, D1]
          push_cast
          field_simp
          ring
        have htl : ((leftPt ri rj : ℚ) : ℝ) ≤ t := by
          rw [hleft, div_le_iff₀ hD1]; linarith
        have htr : t ≤ ((rightPt ri rj : ℚ) : ℝ) := by
          rw [hright, le_div_iff₀ hD1]; linarith
        have h2 := pieceOK_sound _ _ _ _ hP2 t (by rw [Rat.cast_max]; exact max_le hlo htl)
          (by rw [Rat.cast_min]; exact le_min hhi htr)
        rw [← hmid] at h2
        linarith [h1, h2, e]
  | [] => rw [hrows] at hc; simp at hc
  | _ :: _ :: _ :: _ => rw [hrows] at hc; simp at hc

end Grothe.Lower
