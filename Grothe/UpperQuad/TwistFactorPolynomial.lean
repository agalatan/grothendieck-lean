import Grothe.UpperQuad.PhasePolynomialComplex

/-!
# The holomorphic polynomial factor of the twisted conditional source

The auxiliary variables are `(w, conjugate w)`. The radial parameter is substituted into both
formal first-coordinate variables, so its complex continuation uses `r`, never `conjugate r`.
The polynomial `Q r` includes the Taylor factor `I`: on the real slice its product with the
Gaussian damping is `I * phiT`. Consequently its powers enter the finite factorization directly,
without the sign introduced when a conjugate-linear functional conjugates the whole polynomial.

Agent-ID: codex-f3dd. Refs #342.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.TwistFactorPolynomial

open Complex MvPolynomial Grothe.UpperChaos
open scoped ComplexConjugate

noncomputable section

local notation "ε" => (Grothe.Upper.phaseEpsQ : ℝ)

/-- One actual phase monomial, with both formal radial coordinates set to `r`. -/
def phaseTerm (r : ℂ) (t : (ℕ × ℕ × ℕ) × ℚ) : CPoly :=
  C ((t.2 : ℂ) * r ^ (2 * t.1.1)) * (X 0 * X 1) ^ t.1.2.1 *
    (C (r / 2) * (X 0 + X 1)) ^ t.1.2.2

/-- The invariant polynomial, using the production source list verbatim. -/
def phaseSum (r : ℂ) : CPoly := (phaseTerms.map (phaseTerm r)).sum

/-- The undamped factor `Q_r = (r/2)(w-conjugate w) S(r², |w|², r Re w)`. -/
def Q (r : ℂ) : CPoly := C (r / 2) * (X 0 - X 1) * phaseSum r

private lemma degree_mul_le {P R : CPoly} {m n : ℕ}
    (hP : P.totalDegree ≤ m) (hR : R.totalDegree ≤ n) :
    (P * R).totalDegree ≤ m + n :=
  (totalDegree_mul P R).trans (Nat.add_le_add hP hR)

private lemma degree_pow_le {P : CPoly} {m : ℕ} (hP : P.totalDegree ≤ m) (n : ℕ) :
    (P ^ n).totalDegree ≤ n * m :=
  (totalDegree_pow P n).trans (Nat.mul_le_mul_left n hP)

lemma totalDegree_phaseTerm_le (r : ℂ) (t : (ℕ × ℕ × ℕ) × ℚ)
    (ht : t.1.1 + t.1.2.1 + t.1.2.2 ≤ 17) : (phaseTerm r t).totalDegree ≤ 34 := by
  have hV : ((X 0 : CPoly) * X 1).totalDegree ≤ 2 := by
    simpa using degree_mul_le (by simp : (X 0 : CPoly).totalDegree ≤ 1)
      (by simp : (X 1 : CPoly).totalDegree ≤ 1)
  have hW : (C (r / 2) * (X 0 + X 1) : CPoly).totalDegree ≤ 1 := by
    have hsum : ((X 0 : CPoly) + X 1).totalDegree ≤ 1 :=
      (totalDegree_add _ _).trans (by simp)
    simpa only [Nat.zero_add] using
      degree_mul_le (by simp : (C (r / 2) : CPoly).totalDegree ≤ 0) hsum
  have hfirst :
      (C ((t.2 : ℂ) * r ^ (2 * t.1.1)) * (X 0 * X 1) ^ t.1.2.1 : CPoly).totalDegree ≤
        t.1.2.1 * 2 := by
    simpa only [Nat.zero_add] using
      degree_mul_le
        (totalDegree_C ((t.2 : ℂ) * r ^ (2 * t.1.1))).le
        (degree_pow_le hV t.1.2.1)
  exact (degree_mul_le hfirst (degree_pow_le hW t.1.2.2)).trans (by omega)

private lemma degree_list_sum_le (l : List CPoly) (N : ℕ)
    (hl : ∀ P ∈ l, P.totalDegree ≤ N) : l.sum.totalDegree ≤ N := by
  induction l with
  | nil => simp
  | cons P l ih =>
    simpa only [List.sum_cons] using (totalDegree_add P l.sum).trans
      (max_le (hl P List.mem_cons_self)
        (ih fun R hR ↦ hl R (List.mem_cons_of_mem _ hR)))

lemma totalDegree_phaseSum_le (r : ℂ) : (phaseSum r).totalDegree ≤ 34 := by
  apply degree_list_sum_le
  intro P hP
  obtain ⟨t, ht, rfl⟩ := List.mem_map.mp hP
  exact totalDegree_phaseTerm_le r t (PhasePolynomialComplex.phaseTerms_degree t ht)

/-- The auxiliary degree is at most thirty-five for every complex radial parameter. -/
theorem totalDegree_Q_le (r : ℂ) : (Q r).totalDegree ≤ 35 := by
  have hsub : ((X 0 : CPoly) - X 1).totalDegree ≤ 1 :=
    (totalDegree_sub _ _).trans (by simp)
  have hfirst : (C (r / 2) * (X 0 - X 1) : CPoly).totalDegree ≤ 1 := by
    simpa only [Nat.zero_add] using
      degree_mul_le (by simp : (C (r / 2) : CPoly).totalDegree ≤ 0) hsub
  exact degree_mul_le hfirst (totalDegree_phaseSum_le r)

theorem totalDegree_Q_pow_le (j : ℕ) (r : ℂ) : (Q r ^ j).totalDegree ≤ 35 * j := by
  simpa only [Nat.mul_comm] using degree_pow_le (totalDegree_Q_le r) j

lemma ev_phaseTerm (r w : ℂ) (t : (ℕ × ℕ × ℕ) × ℚ) :
    ev w (phaseTerm r t) = (t.2 : ℂ) * r ^ (2 * t.1.1) *
      (w * conj w) ^ t.1.2.1 * (r / 2 * (w + conj w)) ^ t.1.2.2 := by
  simp [phaseTerm, ev, zv]

lemma ev_phaseTerm_real (r : ℝ) (w : ℂ) (t : (ℕ × ℕ × ℕ) × ℚ) :
    ev w (phaseTerm (r : ℂ) t) =
      (((t.2 : ℝ) * (r ^ 2) ^ t.1.1 * normSq w ^ t.1.2.1 *
        (r * w.re) ^ t.1.2.2 : ℝ) : ℂ) := by
  have hW : (r : ℂ) / 2 * (w + conj w) = ((r * w.re : ℝ) : ℂ) := by
    rw [Complex.add_conj]
    push_cast
    ring
  rw [ev_phaseTerm, hW, Complex.mul_conj]
  push_cast
  rw [pow_mul]

lemma ev_phaseSum_real (r : ℝ) (w : ℂ) :
    ev w (phaseSum (r : ℂ)) = (Sphase (r ^ 2) (normSq w) (r * w.re) : ℂ) := by
  have hcast (l : List ℝ) : ((l.sum : ℝ) : ℂ) = (l.map fun a : ℝ ↦ (a : ℂ)).sum := by
    induction l with
    | nil => simp
    | cons a l ih => simp only [List.sum_cons, List.map_cons, Complex.ofReal_add, ih]
  unfold phaseSum Sphase
  simp only [ev, map_list_sum, List.map_map, Function.comp_def]
  rw [hcast]
  simp only [List.map_map, Function.comp_def]
  apply congrArg List.sum
  apply List.map_congr_left
  intro t _
  exact ev_phaseTerm_real r w t

lemma ev_Q (r w : ℂ) : ev w (Q r) = r / 2 * (w - conj w) * ev w (phaseSum r) := by
  simp [Q, ev, zv]

lemma ev_phaseTerm_neg (r w : ℂ) (t : (ℕ × ℕ × ℕ) × ℚ) :
    ev w (phaseTerm (-r) t) = ev (-w) (phaseTerm r t) := by
  rw [ev_phaseTerm, ev_phaseTerm]
  have hr : (-r) ^ (2 * t.1.1) = r ^ (2 * t.1.1) := by
    simp only [pow_mul, neg_sq]
  have hV : (-w) * conj (-w) = w * conj w := by
    simp only [map_neg, neg_mul_neg]
  have hW : -r / 2 * (w + conj w) = r / 2 * (-w + conj (-w)) := by
    rw [map_neg]
    ring
  rw [hr, hV, hW]

lemma ev_phaseSum_neg (r w : ℂ) : ev w (phaseSum (-r)) = ev (-w) (phaseSum r) := by
  unfold phaseSum
  simp only [ev, map_list_sum, List.map_map, Function.comp_def]
  apply congrArg List.sum
  apply List.map_congr_left
  intro t _
  exact ev_phaseTerm_neg r w t

/-- Negating the formal radial parameter agrees with negating the auxiliary variable. -/
theorem ev_Q_neg (r w : ℂ) : ev w (Q (-r)) = ev (-w) (Q r) := by
  rw [ev_Q, ev_Q, ev_phaseSum_neg]
  simp only [map_neg]
  ring

/-- The same parity identity holds for every unscaled Taylor power. -/
theorem ev_Q_pow_neg (j : ℕ) (r w : ℂ) : ev w (Q (-r) ^ j) = ev (-w) (Q r ^ j) := by
  simp only [ev, map_pow]
  exact congrArg (fun z : ℂ ↦ z ^ j) (ev_Q_neg r w)

/-- The factor `I` is already included in `Q`. -/
theorem ev_Q_real (r : ℝ) (w : ℂ) :
    ev w (Q (r : ℂ)) = I * ((r * w.im * Sphase (r ^ 2) (normSq w) (r * w.re) : ℝ) : ℂ) := by
  rw [ev_Q, ev_phaseSum_real, Complex.sub_conj]
  push_cast
  ring

/-- Restoring the Gaussian gives exactly the actual real-slice Taylor multiplier. -/
theorem ev_Q_damped (r : ℝ) (w : ℂ) :
    ev w (Q (r : ℂ)) * (Real.exp (-ε * (r ^ 2 + normSq w)) : ℂ) =
      I * (phiT ((r : ℂ), w) : ℂ) := by
  have hw : (w.re : ℂ) + I * (w.im : ℂ) = w := by
    apply Complex.ext <;> simp
  have hφ := PhasePolynomialComplex.phiT_real_slice r w.re w.im
  rw [hw] at hφ
  have hn : normSq w = w.re ^ 2 + w.im ^ 2 := by
    simpa only [pow_two] using Complex.normSq_apply w
  rw [ev_Q_real, hφ]
  simp only [hn, add_assoc]
  push_cast
  ring

private lemma analyticAt_term_sum (ts : List ((ℕ × ℕ × ℕ) × ℚ)) (w r : ℂ) :
    AnalyticAt ℂ (fun z ↦ (ts.map fun t ↦ ev w (phaseTerm z t)).sum) r := by
  induction ts with
  | nil => simp only [List.map_nil, List.sum_nil]; fun_prop
  | cons t ts ih =>
    simp only [List.map_cons, List.sum_cons]
    apply AnalyticAt.add _ ih
    simp_rw [ev_phaseTerm]
    fun_prop

lemma analyticAt_ev_phaseSum (w r : ℂ) :
    AnalyticAt ℂ (fun z ↦ ev w (phaseSum z)) r := by
  simpa only [phaseSum, ev, map_list_sum, List.map_map, Function.comp_def] using
    analyticAt_term_sum phaseTerms w r

/-- The auxiliary polynomial has entire dependence on the radial parameter. -/
theorem analyticAt_ev_Q (w r : ℂ) : AnalyticAt ℂ (fun z ↦ ev w (Q z)) r := by
  simp_rw [ev_Q]
  exact (by fun_prop : AnalyticAt ℂ (fun z ↦ z / 2 * (w - conj w)) r).mul
    (analyticAt_ev_phaseSum w r)

theorem differentiable_ev_Q (w : ℂ) : Differentiable ℂ (fun r ↦ ev w (Q r)) :=
  fun r ↦ (analyticAt_ev_Q w r).differentiableAt

end

end Grothe.UpperQuad.TwistFactorPolynomial
