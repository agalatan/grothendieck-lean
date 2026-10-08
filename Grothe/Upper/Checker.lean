import Grothe.Upper.CheckerDefs
import Grothe.Upper.PolyBridge

/-!
# The finite certificate: soundness of the concrete computation

`finite_certificate_exact` proves `FiniteCertificate (dloIntFinal / D)` *without* any
evaluation: it is the composition of the soundness lemmas.  Evaluating `dloIntFinal` (by
`native_decide`, see `Grothe/CertBound/Value.lean`) then yields an explicit rational `Dlo`.
-/

namespace Grothe.Upper

open GrotheKernel Polynomial

lemma wtQ_cast (i : Fin 6) : ((wtQ i : ℚ) : ℝ) = wt i := by
  fin_cases i <;> simp [wtQ, wt] <;> norm_num

lemma mem_wt (i : Fin 6) : mem (wt i) (ofRatI (wtQ i)) := by
  rw [← wtQ_cast]; exact mem_ofRatI _

lemma mem_pi : mem Real.pi piI := by
  unfold piI
  apply mem_boxI
  · have := Real.pi_gt_d20
    exact_mod_cast this.le
  · have := Real.pi_lt_d20
    exact_mod_cast this.le

lemma getD_map_ofRatI (l : List ℚ) (n : ℕ) :
    (l.map ofRatI).getD n zeroI = ofRatI (l.getD n 0) := by
  induction l generalizing n with
  | nil => simp [ofRatI_zero]
  | cons a l ih =>
    cases n with
    | zero => simp
    | succ n =>
      rw [List.map_cons, List.getD_cons_succ, List.getD_cons_succ]
      exact ih n

lemma memB_ofListQ (l : List ℚ) (N : ℕ) : memB N (ofListQ l) (l.map ofRatI) := by
  intro n _
  rw [coeff_ofListQ, getD_map_ofRatI]
  exact mem_ofRatI _

lemma memB_gOf {N : ℕ} {P : ℝ[X]} {PI : List Ival} (h : memB (N + 1) P PI) :
    memB (N + 1) (X * P ^ 2) (gOf PI) := by
  have h' : memB N P PI := memB_mono h (Nat.le_succ N)
  have := memB_X_mul (memB_conv h' h')
  rw [pow_two]
  exact this

/-- The real coefficient list `h_j/π`, `j < modes`. -/
noncomputable def hRats : List ℝ := List.ofFn fun j : Fin modes => (hRat j : ℝ)

lemma forall₂_hRats : List.Forall₂ mem hRats hRatL :=
  forall₂_ofFn _ _ fun _ => mem_ofRatI _

/-- Enclosure of the exact scalar profiles. -/
lemma mem_sProf (i : Fin 5) (n : ℕ) (hn : n < modes) :
    mem ((sProf (rowQ i) n : ℚ) : ℝ) ((sProfL i).getD n zeroI) := by
  have hP : memB modes (ofListQ (rowQ i)) (rowI i) := memB_ofListQ _ _
  have hG : memB modes (X * ofListQ (rowQ i) ^ 2) (gOf (rowI i)) := memB_gOf hP
  have hS := memB_hornerT hG forall₂_hRats
  have hPS := memB_take (memB_conv hP hS)
  have key := hPS n hn
  unfold sProfL
  rw [horner_eq_polySum, ← compose_getD_eq_coeff] at key
  rw [sProf_eq_compose]
  have e : compose (fun j => (hRat j : ℝ)) (ofListQ (rowQ i)) n
      = compose (fun j => hRats.getD j 0) (ofListQ (rowQ i)) n :=
    compose_congr _ _ fun j hj => by
      unfold hRats
      rw [getD_ofFn_lt _ _ j (by omega)]
  rw [e]
  exact key

lemma boxedCoeff_eq (A B : ℕ → ℂ) (n : ℕ) (hn : n < modes) :
    boxedCoeff A B n
      = Real.pi * (wt 0 * (sProf (rowQ 0) n : ℝ) + wt 1 * (sProf (rowQ 1) n : ℝ)
          + wt 2 * (sProf (rowQ 2) n : ℝ) + wt 3 * (sProf (rowQ 3) n : ℝ)
          + wt 4 * (sProf (rowQ 4) n : ℝ))
        + wt 5 * ((A n).re * (B n).re + (A n).im * (B n).im) := by
  unfold boxedCoeff
  rw [if_pos hn, Fin.sum_univ_five]
  simp only [Complex.mul_re, Complex.conj_re, Complex.conj_im]
  have h0 : Fin.castLE (by norm_num : 5 ≤ 6) (0 : Fin 5) = 0 := rfl
  have h1 : Fin.castLE (by norm_num : 5 ≤ 6) (1 : Fin 5) = 1 := rfl
  have h2 : Fin.castLE (by norm_num : 5 ≤ 6) (2 : Fin 5) = 2 := rfl
  have h3 : Fin.castLE (by norm_num : 5 ≤ 6) (3 : Fin 5) = 3 := rfl
  have h4 : Fin.castLE (by norm_num : 5 ≤ 6) (4 : Fin 5) = 4 := rfl
  rw [h0, h1, h2, h3, h4]
  ring

lemma mem_boxedCoeff (A B : ℕ → ℂ) (hA : InBoxA A) (hB : InBoxB B) (n : ℕ) (hn : n < modes) :
    mem (boxedCoeff A B n) (cI n) := by
  rw [boxedCoeff_eq A B n hn]
  unfold cI scalarI originI
  obtain ⟨⟨a1, a2⟩, ⟨a3, a4⟩⟩ := hA n hn
  obtain ⟨⟨b1, b2⟩, ⟨b3, b4⟩⟩ := hB n hn
  refine mem_add (mem_mul mem_pi ?_) (mem_mul (mem_wt 5) ?_)
  · refine mem_add (mem_add (mem_add (mem_add ?_ ?_) ?_) ?_) ?_ <;>
      exact mem_mul (mem_wt _) (mem_sProf _ n hn)
  · exact mem_add (mem_mul (mem_boxI a1 a2) (mem_boxI b1 b2))
      (mem_mul (mem_boxI a3 a4) (mem_boxI b3 b4))

/-- The real coefficient list of the retained mixture. -/
noncomputable def csOf (A B : ℕ → ℂ) : List ℝ := List.ofFn fun n : Fin modes => boxedCoeff A B n

lemma csOf_getD (A B : ℕ → ℂ) : (fun j => (csOf A B).getD j 0) = boxedCoeff A B := by
  funext j
  by_cases hj : j < modes
  · unfold csOf; rw [getD_ofFn_lt _ _ j hj]
  · unfold csOf
    rw [getD_ofFn_ge _ _ j (by omega)]
    unfold boxedCoeff
    rw [if_neg hj]

/-- **Soundness of the finite certificate** for the exactly computed scaled integer. -/
theorem finite_certificate_exact :
    FiniteCertificate ((dloIntFinal : ℚ) / ((D : ℤ) : ℚ)) := by
  intro A B hA hB
  have hE : memB (maxIndex + 1) etaPoly etaI := memB_ofListQ _ _
  have hG : memB (maxIndex + 1) (X * etaPoly ^ 2) (gOf etaI) := memB_gOf hE
  have hcs : List.Forall₂ mem (csOf A B) cList :=
    forall₂_ofFn _ _ fun i => mem_boxedCoeff A B hA hB i i.2
  have key := dloInt_sound (M := maxIndex) (by norm_num) hE hG hcs
  have hc : ∀ n, compose (boxedCoeff A B) etaPoly n
      = (etaPoly * hornerPoly (csOf A B) (X * etaPoly ^ 2)).coeff n := by
    intro n
    rw [horner_eq_polySum, ← compose_getD_eq_coeff, csOf_getD]
  simp_rw [hc]
  unfold dloIntFinal
  push_cast
  exact key

/-- `FiniteCertificate` is monotone: any smaller `Dlo` also works. -/
lemma FiniteCertificate.mono {Dlo Dlo' : ℚ} (h : FiniteCertificate Dlo) (hle : Dlo' ≤ Dlo) :
    FiniteCertificate Dlo' := by
  intro A B hA hB
  have := h A B hA hB
  have hle' : (Dlo' : ℝ) ≤ Dlo := by exact_mod_cast hle
  linarith

end Grothe.Upper
