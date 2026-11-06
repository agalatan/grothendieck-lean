import Grothe.UpperQuad.TwistSound
import Grothe.UpperQuad.GaussSound
import GrotheQuadKernel.Phase
import Grothe.UpperChaos.ComparisonPieces

/-!
# The phase identity at a radial node

At the node `z = r = √s` the phase is `φ(r, w) = r Im(w) e^{−ε(s + |w|²)} Sphase(s, |w|², r Re w)`
(`phiT`), so with the node polynomial

    Q_r = (r/2)(w − w̄) Σ_{j' + k ≤ 17} P_{j'k}(s) (r/2)^k (w w̄)^{j'} (w + w̄)^k,
    P_{j'k}(s) = Σ_{t : (j, k) = (j', k)} C_t s^i

(`qPoly (r/2) (nodeA terms s)`, the polynomial of `Twist.applyQ`) we have
`i φ(r, w) = e^{−εs} e^{−ε|w|²} Q_r(w)` (`I_mul_phiT_node`), hence
`hpow j (r, w) = e^{−jεs} e^{−jε|w|²} Q_r(w)^j F₀(r, w)` (`hpow_node`), and `Q_r` is imaginary
(`conj_ev_qPoly`).  The kernel's node scalars `nodeCoefs` enclose `nodeA` (`mem_nodeCoefs`).

The kernel reads the monomials of `Sphase` from an array of `PhaseTerm`s; `TermsOK terms` says that
they are the monomials of `Sphase` (semantically) of total degree `≤ 17`.

Agent-ID: claude-b9ee. Refs #41, #313.
-/

namespace Grothe.UpperQuad

open GrotheQuad Grothe.UpperChaos MvPolynomial Complex
open scoped ComplexConjugate

noncomputable section

/-! ### The phase terms -/

/-- The value `num / den` of a kernel phase term. -/
def termVal (t : PhaseTerm) : ℝ := (t.num : ℝ) / t.den

/-- The kernel's phase terms are the monomials of `Sphase`, of total degree at most 17. -/
def TermsOK (terms : Array PhaseTerm) : Prop :=
  (∀ t ∈ terms.toList, t.i + t.j + t.k ≤ 17 ∧ 0 < t.den) ∧
    ∀ U V W : ℝ, Sphase U V W =
      (terms.toList.map fun t => termVal t * U ^ t.i * V ^ t.j * W ^ t.k).sum

/-- The kernel's phase terms built from master's `phaseTerms`. -/
def phaseTermArr : Array PhaseTerm :=
  (phaseTerms.map fun t => (⟨t.1.1, t.1.2.1, t.1.2.2, t.2.num, t.2.den⟩ : PhaseTerm)).toArray

/-- `phaseTermArr` satisfies `TermsOK` as soon as the degrees are at most 17 (a finite check on
`phaseTerms`). -/
theorem termsOK_phaseTermArr (hdeg : ∀ t ∈ phaseTerms, t.1.1 + t.1.2.1 + t.1.2.2 ≤ 17) :
    TermsOK phaseTermArr := by
  refine ⟨?_, ?_⟩
  · intro t ht
    simp only [phaseTermArr, List.toList_toArray, List.mem_map] at ht
    obtain ⟨t', ht', rfl⟩ := ht
    exact ⟨hdeg t' ht', t'.2.den_pos⟩
  · intro U V W
    simp only [Sphase, phaseTermArr, List.toList_toArray, List.map_map]
    congr 1
    apply List.map_congr_left
    intro t _
    simp only [Function.comp_apply, termVal]
    congr 3
    rw [Rat.cast_def]

/-- `P_{j'k}(s) = Σ_{t : (j, k) = (j', k)} C_t s^i`. -/
def phaseRow (terms : Array PhaseTerm) (s : ℝ) (j' k : ℕ) : ℝ :=
  (terms.toList.map fun t => if t.j = j' ∧ t.k = k then termVal t * s ^ t.i else 0).sum

/-- The node scalars `P_{j'k}(s) (√s/2)^k`. -/
def nodeA (terms : Array PhaseTerm) (s : ℝ) (j' k : ℕ) : ℝ :=
  phaseRow terms s j' k * (Real.sqrt s / 2) ^ k

/-- Regrouping a list sum by the exponents `(j, k)` of `V^j W^k`. -/
lemma sum_regroup (L : List PhaseTerm) (hL : ∀ t ∈ L, t.j + t.k ≤ 17) (g : PhaseTerm → ℝ)
    (V W : ℝ) :
    (L.map fun t => g t * V ^ t.j * W ^ t.k).sum =
      ∑ j ∈ Finset.range 18, ∑ k ∈ Finset.range (17 - j + 1),
        (L.map fun t => if t.j = j ∧ t.k = k then g t else 0).sum * V ^ j * W ^ k := by
  induction L with
  | nil => simp
  | cons t L ih =>
    simp only [List.map_cons, List.sum_cons]
    rw [ih (fun t' ht' => hL t' (List.mem_cons_of_mem t ht'))]
    simp only [add_mul, Finset.sum_add_distrib]
    congr 1
    have ht := hL t List.mem_cons_self
    rw [Finset.sum_eq_single t.j]
    · rw [Finset.sum_eq_single t.k]
      · simp
      · intro k _ hk
        simp [Ne.symm hk]
      · intro hk
        exfalso
        exact hk (Finset.mem_range.mpr (by omega))
    · intro j _ hj
      apply Finset.sum_eq_zero
      intro k _
      simp [Ne.symm hj]
    · intro hj
      exfalso
      exact hj (Finset.mem_range.mpr (by omega))

/-- `Sphase` in the row form of the kernel. -/
lemma Sphase_rows {terms : Array PhaseTerm} (hT : TermsOK terms) (U V W : ℝ) :
    Sphase U V W = ∑ j ∈ Finset.range 18, ∑ k ∈ Finset.range (17 - j + 1),
      phaseRow terms U j k * V ^ j * W ^ k := by
  rw [hT.2 U V W]
  have h := sum_regroup terms.toList (fun t ht => by have := (hT.1 t ht).1; omega)
    (fun t => termVal t * U ^ t.i) V W
  simp only [mul_assoc] at h ⊢
  rw [h]
  apply Finset.sum_congr rfl
  intro j _
  apply Finset.sum_congr rfl
  intro k _
  unfold phaseRow
  congr 1
  congr 1
  apply List.map_congr_left
  intro t _
  split_ifs <;> simp [mul_assoc]

/-! ### The node polynomial -/

lemma ev_C' (w : ℂ) (c : ℂ) : ev w (C c) = c := by simp [ev]

lemma ev_X0 (w : ℂ) : ev w (X 0) = w := by simp [ev, zv]

lemma ev_X1 (w : ℂ) : ev w (X 1) = conj w := by simp [ev, zv]

/-- The node polynomial evaluated: `Q(w) = i · 2h Im(w) Σ a_{jk} |w|^{2j} (2 Re w)^k`. -/
lemma ev_qPoly (h : ℝ) (a : ℕ → ℕ → ℝ) (w : ℂ) :
    ev w (qPoly h a) = ((2 * h * w.im * ∑ j ∈ Finset.range 18, ∑ k ∈ Finset.range (17 - j + 1),
      a j k * (‖w‖ ^ 2) ^ j * (2 * w.re) ^ k : ℝ) : ℂ) * I := by
  have h0 : w - conj w = ((2 * w.im : ℝ) : ℂ) * I := by
    apply Complex.ext <;> simp; ring
  have h1 : w * conj w = ((‖w‖ ^ 2 : ℝ) : ℂ) := by
    rw [Complex.mul_conj, Complex.normSq_eq_norm_sq]; push_cast; ring
  have h2 : w + conj w = ((2 * w.re : ℝ) : ℂ) := by
    apply Complex.ext <;> simp; ring
  simp only [qPoly, ev, map_mul, map_sub, map_sum, map_pow, map_add, eval_C, eval_X]
  simp only [zv, Matrix.cons_val_zero, Matrix.cons_val_one]
  rw [h0, h1, h2]
  push_cast
  rw [Finset.mul_sum, Finset.mul_sum, Finset.sum_mul]
  apply Finset.sum_congr rfl
  intro j _
  rw [Finset.mul_sum, Finset.mul_sum, Finset.sum_mul]
  apply Finset.sum_congr rfl
  intro k _
  ring

/-- `Q` is imaginary: `conj Q(w) = −Q(w)`. -/
lemma conj_ev_qPoly (h : ℝ) (a : ℕ → ℕ → ℝ) (w : ℂ) :
    conj (ev w (qPoly h a)) = -ev w (qPoly h a) := by
  rw [ev_qPoly, map_mul, Complex.conj_ofReal, Complex.conj_I]
  ring

/-- **The phase identity at a node**: `i φ(√s, w) = e^{−εs} e^{−ε|w|²} Q_{√s}(w)`. -/
theorem I_mul_phiT_node {terms : Array PhaseTerm} (hT : TermsOK terms) {s : ℝ} (hs : 0 ≤ s)
    (w : ℂ) :
    I * (phiT ((Real.sqrt s : ℂ), w) : ℂ) =
      ((Real.exp (-(phaseEpsQ : ℝ) * s) * Real.exp (-(phaseEpsQ : ℝ) * ‖w‖ ^ 2) : ℝ) : ℂ) *
        ev w (qPoly (Real.sqrt s / 2) (nodeA terms s)) := by
  rw [ev_qPoly]
  have hr : ‖(Real.sqrt s : ℂ)‖ ^ 2 = s := by
    rw [Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg (Real.sqrt_nonneg s),
      Real.sq_sqrt hs]
  have him : (conj (Real.sqrt s : ℂ) * w).im = Real.sqrt s * w.im := by simp
  have hre : (conj (Real.sqrt s : ℂ) * w).re = Real.sqrt s * w.re := by simp
  have hS := Sphase_rows hT s (‖w‖ ^ 2) (Real.sqrt s * w.re)
  unfold phiT
  rw [hr, him, hre, hS]
  have hexp : Real.exp (-(phaseEpsQ : ℝ) * (s + ‖w‖ ^ 2)) =
      Real.exp (-(phaseEpsQ : ℝ) * s) * Real.exp (-(phaseEpsQ : ℝ) * ‖w‖ ^ 2) := by
    rw [← Real.exp_add]; ring_nf
  rw [hexp]
  have hsum : (∑ j ∈ Finset.range 18, ∑ k ∈ Finset.range (17 - j + 1),
      phaseRow terms s j k * (‖w‖ ^ 2) ^ j * (Real.sqrt s * w.re) ^ k) =
      ∑ j ∈ Finset.range 18, ∑ k ∈ Finset.range (17 - j + 1),
        nodeA terms s j k * (‖w‖ ^ 2) ^ j * (2 * w.re) ^ k := by
    apply Finset.sum_congr rfl
    intro j _
    apply Finset.sum_congr rfl
    intro k _
    unfold nodeA
    rw [show Real.sqrt s * w.re = (Real.sqrt s / 2) * (2 * w.re) by ring, mul_pow]
    ring
  rw [hsum]
  apply Complex.ext <;> simp <;> ring

/-- `e^{−jεs}` and `e^{−jε|w|²}`: the factors of `hpow j` at a node. -/
theorem hpow_node {terms : Array PhaseTerm} (hT : TermsOK terms) (j : ℕ) {s : ℝ} (hs : 0 ≤ s)
    (w : ℂ) :
    hpow j ((Real.sqrt s : ℂ), w) =
      ((Real.exp (-(j * phaseEpsQ : ℝ) * s) : ℝ) : ℂ) *
        (((Real.exp (-(j * phaseEpsQ : ℝ) * ‖w‖ ^ 2) : ℝ) : ℂ) *
          (ev w (qPoly (Real.sqrt s / 2) (nodeA terms s)) ^ j * F0 ((Real.sqrt s : ℂ), w))) := by
  unfold hpow
  rw [I_mul_phiT_node hT hs w, mul_pow]
  have e1 : ((Real.exp (-(phaseEpsQ : ℝ) * s) * Real.exp (-(phaseEpsQ : ℝ) * ‖w‖ ^ 2) : ℝ) : ℂ) ^ j
      = ((Real.exp (-(j * phaseEpsQ : ℝ) * s) : ℝ) : ℂ) *
        ((Real.exp (-(j * phaseEpsQ : ℝ) * ‖w‖ ^ 2) : ℝ) : ℂ) := by
    rw [← Complex.ofReal_pow, mul_pow, ← Real.exp_nat_mul, ← Real.exp_nat_mul]
    push_cast
    ring_nf
  rw [e1]
  ring

/-! ### The kernel's node scalars -/

lemma mem_zeroI : mem 0 zeroI := (mem_zeroI_iff 0).mpr rfl

lemma phaseRowCoeff_foldl (P : ℕ) (L : List PhaseTerm) (hL : ∀ t ∈ L, t.i ≤ 17 ∧ 0 < t.den)
    (hP : 1 ≤ P) {s : ℝ} {sPow : Array Ival} (hs : ∀ i, i ≤ 17 → mem (s ^ i) (sPow.getD i zeroI))
    (j' k : ℕ) {x : ℝ} {acc : Ival} (hacc : mem x acc) :
    mem (x + (L.map fun t => if t.j = j' ∧ t.k = k then termVal t * s ^ t.i else 0).sum)
      (L.foldl (fun acc t =>
        if t.j == j' && t.k == k then addI P acc (mulI P (ratI P t.num t.den) (sPow.getD t.i zeroI))
        else acc) acc) := by
  induction L generalizing x acc with
  | nil => simpa using hacc
  | cons t L ih =>
    simp only [List.foldl_cons, List.map_cons, List.sum_cons]
    have ht := hL t List.mem_cons_self
    have hL' : ∀ t' ∈ L, t'.i ≤ 17 ∧ 0 < t'.den := fun t' h' => hL t' (List.mem_cons_of_mem t h')
    by_cases hc : t.j = j' ∧ t.k = k
    · have hb : (t.j == j' && t.k == k) = true := by simp [hc.1, hc.2]
      rw [if_pos hc, if_pos hb, ← add_assoc]
      apply ih hL'
      exact mem_addI P hacc (mem_mulI P (by
        have := mem_ratI P hP t.num ht.2
        simpa [termVal] using this) (hs t.i ht.1))
    · have hb : (t.j == j' && t.k == k) = false := by
        by_contra hb'
        simp only [Bool.not_eq_false, Bool.and_eq_true, beq_iff_eq] at hb'
        exact hc hb'
      rw [if_neg hc, if_neg (by simp [hb]), add_zero]
      exact ih hL' hacc

lemma mem_phaseRowCoeff (P : ℕ) (hP : 1 ≤ P) {terms : Array PhaseTerm} (hT : TermsOK terms)
    {s : ℝ} {sI : Ival} (hs : mem s sI) (j' k : ℕ) :
    mem (phaseRow terms s j' k) (phaseRowCoeff P terms (powTable P sI 17) j' k) := by
  unfold phaseRowCoeff
  rw [← Array.foldl_toList]
  have h := phaseRowCoeff_foldl P terms.toList
    (fun t ht => ⟨by have := (hT.1 t ht).1; omega, (hT.1 t ht).2⟩) hP
    (fun i hi => mem_powTable P hs 17 i hi) j' k mem_zeroI
  rw [zero_add] at h
  exact h

/-- The kernel's node scalars enclose `nodeA` (at the scale `2^KTw`). -/
theorem mem_nodeCoefs (P : ℕ) (hP : 1 ≤ P) {terms : Array PhaseTerm} (hT : TermsOK terms)
    {s : ℝ} {sI rI : Ival} (hs : mem s sI) (hr : mem (Real.sqrt s) rI) (j k : ℕ) (hjk : j + k ≤ 17) :
    memTw (nodeA terms s j k) (((nodeCoefs P terms sI rI).getD j #[]).getD k (0, 0)) := by
  unfold nodeCoefs
  have hj : j < 18 := by omega
  have hk : k < 18 - j := by omega
  simp only [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn, hj, hk, ↓reduceDIte,
    Option.getD_some]
  apply memTw_toTw
  unfold nodeA
  exact mem_mulI P (mem_phaseRowCoeff P hP hT hs j k)
    (mem_powTable P (mem_divN P hP (by norm_num) hr) 17 k (by omega))

end

end Grothe.UpperQuad
