import Grothe.Lower.Poly
import Grothe.HJM.OriginResponse
import Grothe.HJM.OriginApproximation

/-!
# Exact polynomial panels for the actual origin phases

Agent-ID: codex-aa04.

The list operations have real evaluator soundness. Closed rational identities
bind the LEFT/RIGHT lists to the actual numerators. A panel certificate then
controls the phase error using a squared-modulus residual, without a root or
quadrature oracle. The approximant is used to enclose the bounded response;
it is not asserted to be disk-valued.
-/

namespace Grothe.HJM.OriginPanel

open Grothe.Lower Grothe.Upper
open scoped ComplexConjugate

def mulQ : List ℚ → List ℚ → List ℚ
  | [], _ => []
  | a :: p, q => addLq (scaleL a q) (0 :: mulQ p q)

def compQ : List ℚ → List ℚ → List ℚ
  | [], _ => []
  | a :: p, q => addLq [a] (mulQ q (compQ p q))

noncomputable def evalQ (p : List ℚ) (y : ℝ) : ℝ :=
  evalL (p.map ((↑) : ℚ → ℝ)) y

lemma evalQ_nil (y : ℝ) : evalQ [] y = 0 := rfl
lemma evalQ_cons (a : ℚ) (p : List ℚ) (y : ℝ) :
    evalQ (a :: p) y = (a : ℝ) + y * evalQ p y := rfl
lemma evalQ_add (p q : List ℚ) (y : ℝ) :
    evalQ (addLq p q) y = evalQ p y + evalQ q y := evalL_addLq p q y
lemma evalQ_scale (a : ℚ) (p : List ℚ) (y : ℝ) :
    evalQ (scaleL a p) y = (a : ℝ) * evalQ p y := evalL_scaleL a p y
lemma evalQ_neg (p : List ℚ) (y : ℝ) :
    evalQ (negL p) y = -evalQ p y := evalL_negL p y

lemma evalQ_mul (p q : List ℚ) (y : ℝ) :
    evalQ (mulQ p q) y = evalQ p y * evalQ q y := by
  induction p with
  | nil => simp [mulQ, evalQ, evalL]
  | cons a p ih =>
    simp only [mulQ, evalQ_add, evalQ_scale, evalQ_cons, Rat.cast_zero, zero_add, ih]
    ring

lemma evalQ_comp (p q : List ℚ) (y : ℝ) :
    evalQ (compQ p q) y = evalQ p (evalQ q y) := by
  induction p with
  | nil => simp [compQ, evalQ, evalL]
  | cons a p ih =>
    simp only [compQ, evalQ_add, evalQ_mul, evalQ_cons, evalQ_nil,
      mul_zero, add_zero, ih]

lemma evalQ_eq_ofListQ (p : List ℚ) (y : ℝ) : evalQ p y = (ofListQ p).eval y := by
  induction p with
  | nil => simp [evalQ, evalL, ofListQ]
  | cons a p ih =>
    simp only [evalQ_cons, ofListQ, Polynomial.eval_add, Polynomial.eval_C,
      Polynomial.eval_mul, Polynomial.eval_X, ih]

theorem continuous_evalQ (p : List ℚ) : Continuous (evalQ p) := by
  have he : evalQ p = (ofListQ p).eval := funext (evalQ_eq_ofListQ p)
  rw [he]
  exact (ofListQ p).continuous

structure CList where
  re : List ℚ
  im : List ℚ
  deriving DecidableEq

def mulC (p q : CList) : CList :=
  ⟨addLq (mulQ p.re q.re) (negL (mulQ p.im q.im)),
    addLq (mulQ p.re q.im) (mulQ p.im q.re)⟩

def conjC (p : CList) : CList := ⟨p.re, negL p.im⟩

def constC (r i : ℚ) : CList := ⟨[r], [i]⟩

noncomputable def evalC (p : CList) (s : ℝ) : ℂ :=
  (evalQ p.re s : ℂ) + Complex.I * (evalQ p.im s : ℂ)

theorem evalC_mul (p q : CList) (s : ℝ) :
    evalC (mulC p q) s = evalC p s * evalC q s := by
  simp only [evalC, mulC, evalQ_add, evalQ_mul, evalQ_neg]
  push_cast
  ring_nf
  simp only [Complex.I_sq]
  ring

theorem evalC_conj (p : CList) (s : ℝ) : evalC (conjC p) s = conj (evalC p s) := by
  simp only [evalC, conjC, evalQ_neg, map_add, map_mul, Complex.conj_ofReal,
    Complex.conj_I, Complex.ofReal_neg]
  ring

theorem evalC_const (r i : ℚ) (s : ℝ) :
    evalC (constC r i) s = (r : ℂ) + Complex.I * (i : ℂ) := by
  simp only [evalC, constC, evalQ_cons, evalQ_nil, mul_zero, add_zero]
  norm_cast

theorem continuous_evalC (p : CList) : Continuous (evalC p) := by
  exact (Complex.continuous_ofReal.comp (continuous_evalQ p.re)).add
    (continuous_const.mul (Complex.continuous_ofReal.comp (continuous_evalQ p.im)))

def baseCoeffs : CList := ⟨OriginData.pReal, OriginData.pImag⟩

def affineCoeffs (r i : ℚ) : CList :=
  ⟨[OriginData.delta * r, 1], [OriginData.delta * i]⟩

def leftCoeffs : CList :=
  mulC baseCoeffs (affineCoeffs OriginData.aReal OriginData.aImag)

def rightCoeffs : CList :=
  mulC (mulC (constC OriginData.cReal OriginData.cImag) (conjC baseCoeffs))
    (affineCoeffs OriginData.bReal OriginData.bImag)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 8000000 in
theorem left_lists : (⟨OriginData.leftReal, OriginData.leftImag⟩ : CList) = leftCoeffs := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 8000000 in
theorem right_lists : (⟨OriginData.rightReal, OriginData.rightImag⟩ : CList) = rightCoeffs := by
  decide +kernel

theorem evalC_baseCoeffs (s : ℝ) : evalC baseCoeffs s = Origin.P s := by
  simp only [baseCoeffs, evalC, evalQ_eq_ofListQ, Origin.P]

theorem evalC_affineCoeffs (r i : ℚ) (s : ℝ) :
    evalC (affineCoeffs r i) s = (s : ℂ) + (OriginData.delta : ℂ) *
      ((r : ℂ) + Complex.I * (i : ℂ)) := by
  simp only [affineCoeffs, evalC, evalQ_cons, evalQ_nil, Rat.cast_one,
    Rat.cast_mul, mul_zero, add_zero, mul_one]
  push_cast
  ring

/-- The saved LEFT lists evaluate to the numerator of the actual response. -/
theorem evalC_left (s : ℝ) :
    evalC ⟨OriginData.leftReal, OriginData.leftImag⟩ s = Origin.leftNumerator s := by
  rw [left_lists, leftCoeffs, evalC_mul, evalC_baseCoeffs, evalC_affineCoeffs]
  rfl

/-- The saved RIGHT lists include the actual asymmetric unit scalar and conjugation. -/
theorem evalC_right (s : ℝ) :
    evalC ⟨OriginData.rightReal, OriginData.rightImag⟩ s = Origin.rightNumerator s := by
  rw [right_lists, rightCoeffs, evalC_mul, evalC_mul, evalC_const,
    evalC_conj, evalC_baseCoeffs, evalC_affineCoeffs]
  rfl

def normalizedModulus (re im : List ℚ) (c h k : ℚ) : List ℚ :=
  let square := mulQ [c, h] [c, h]
  let r := scaleL k (compQ re square)
  let i := scaleL k (compQ im square)
  addLq (mulQ r r) (mulQ i i)

def residual (re im : List ℚ) (c h k : ℚ) (w : List ℚ) : List ℚ :=
  addLq (mulQ (normalizedModulus re im c h k) (mulQ w w)) [-1]

theorem evalQ_square (c h : ℚ) (y : ℝ) :
    evalQ (mulQ [c, h] [c, h]) y = ((c : ℝ) + (h : ℝ) * y) ^ 2 := by
  simp only [evalQ_mul, evalQ_cons, evalQ_nil, mul_zero, add_zero]
  ring

theorem residual_eval (re im : List ℚ) (c h k : ℚ) (w : List ℚ) (y : ℝ) :
    evalQ (residual re im c h k w) y =
      ((k : ℝ) * evalQ w y) ^ 2 *
        Complex.normSq (evalC ⟨re, im⟩ (((c : ℝ) + (h : ℝ) * y) ^ 2)) - 1 := by
  simp only [residual, normalizedModulus, evalQ_add, evalQ_mul, evalQ_scale,
    evalQ_comp, evalQ_square, evalQ_cons, evalQ_nil, Rat.cast_neg, Rat.cast_one,
    mul_zero, add_zero, evalC, Complex.normSq_apply, Complex.add_re,
    Complex.add_im, Complex.mul_re, Complex.mul_im, Complex.ofReal_re,
    Complex.ofReal_im, Complex.I_re, Complex.I_im, zero_mul, one_mul,
    sub_zero, zero_add]
  ring

theorem checked_nonneg (p : List ℚ) (hc : posCert p (-1) 1 = true)
    (y : ℝ) (hy0 : -1 ≤ y) (hy1 : y ≤ 1) : 0 ≤ evalQ p y :=
  posCert_sound _ (-1) 1 hc y
    (by simpa only [Rat.cast_neg, Rat.cast_one] using hy0)
    (by simpa only [Rat.cast_one] using hy1)

theorem checked_residual_bound (p : List ℚ) (ε : ℚ)
    (hlo : posCert (addLq [ε] p) (-1) 1 = true)
    (hhi : posCert (addLq [ε] (negL p)) (-1) 1 = true)
    (y : ℝ) (hy0 : -1 ≤ y) (hy1 : y ≤ 1) : |evalQ p y| ≤ (ε : ℝ) := by
  have hlo' := checked_nonneg _ hlo y hy0 hy1
  have hhi' := checked_nonneg _ hhi y hy0 hy1
  simp only [evalQ_add, evalQ_neg, evalQ_cons, evalQ_nil, mul_zero, add_zero] at hlo' hhi'
  exact abs_le.mpr ⟨by linarith, by linarith⟩

structure Panel where
  a : ℚ
  b : ℚ
  k : ℚ
  w : List ℚ
  deriving DecidableEq

def center (p : Panel) : ℚ := (p.a + p.b) / 2
def halfWidth (p : Panel) : ℚ := (p.b - p.a) / 2

noncomputable def coordinate (p : Panel) (t : ℝ) : ℝ :=
  (t - (center p : ℝ)) / (halfWidth p : ℝ)

noncomputable def panelApprox (re im : List ℚ) (p : Panel) (t : ℝ) : ℂ :=
  (((p.k : ℝ) * evalQ p.w (coordinate p t) : ℝ) : ℂ) * evalC ⟨re, im⟩ (t ^ 2)

def panelCheck (re im : List ℚ) (ε : ℚ) (p : Panel) : Bool :=
  decide (p.a < p.b) && decide (0 < p.k) && posCert p.w (-1) 1 &&
    posCert (addLq [ε] (residual re im (center p) (halfWidth p) p.k p.w)) (-1) 1 &&
    posCert (addLq [ε] (negL (residual re im (center p) (halfWidth p) p.k p.w))) (-1) 1

lemma halfWidth_pos (p : Panel) (hab : p.a < p.b) : 0 < (halfWidth p : ℝ) := by
  have h : (p.a : ℝ) < p.b := by exact_mod_cast hab
  simp only [halfWidth, Rat.cast_div, Rat.cast_sub, Rat.cast_ofNat]
  linarith

theorem coordinate_mem (p : Panel) (hab : p.a < p.b) (t : ℝ)
    (ha : (p.a : ℝ) ≤ t) (hb : t ≤ (p.b : ℝ)) :
    -1 ≤ coordinate p t ∧ coordinate p t ≤ 1 := by
  have hh := halfWidth_pos p hab
  unfold coordinate
  constructor
  · apply (le_div_iff₀ hh).mpr
    simp only [center, halfWidth, Rat.cast_div, Rat.cast_add, Rat.cast_sub, Rat.cast_ofNat]
    linarith
  · apply (div_le_iff₀ hh).mpr
    simp only [center, halfWidth, Rat.cast_div, Rat.cast_add, Rat.cast_sub, Rat.cast_ofNat]
    linarith

theorem coordinate_inverse (p : Panel) (hab : p.a < p.b) (t : ℝ) :
    (center p : ℝ) + (halfWidth p : ℝ) * coordinate p t = t := by
  have hh := (halfWidth_pos p hab).ne'
  unfold coordinate
  field_simp [hh]
  ring

/-- A finite rational residual certificate bounds the actual panel phase error. -/
theorem panelCheck_sound (re im : List ℚ) (ε : ℚ) (p : Panel)
    (hc : panelCheck re im ε p = true) (t : ℝ)
    (ha : (p.a : ℝ) ≤ t) (hb : t ≤ (p.b : ℝ)) :
    ‖panelApprox re im p t - Grothe.Haag.ph (evalC ⟨re, im⟩ (t ^ 2))‖ ≤ (ε : ℝ) := by
  simp only [panelCheck, Bool.and_eq_true, decide_eq_true_eq, and_assoc] at hc
  rcases hc with ⟨hab, hk, hw, hlo, hhi⟩
  have hy := coordinate_mem p hab t ha hb
  have hw0 := checked_nonneg p.w hw (coordinate p t) hy.1 hy.2
  have hkR : 0 ≤ (p.k : ℝ) := by exact_mod_cast hk.le
  have hres := checked_residual_bound _ ε hlo hhi (coordinate p t) hy.1 hy.2
  rw [residual_eval, coordinate_inverse p hab t, Complex.normSq_eq_norm_sq] at hres
  exact Origin.phase_error_le_of_residual (evalC ⟨re, im⟩ (t ^ 2))
    ((p.k : ℝ) * evalQ p.w (coordinate p t)) (ε : ℝ) (mul_nonneg hkR hw0) hres

/-- The very same approximant as an exact rational polynomial in physical radius. -/
def approxCoeffs (re im : List ℚ) (p : Panel) : CList :=
  let w := compQ p.w [-(center p) / halfWidth p, 1 / halfWidth p]
  ⟨scaleL p.k (mulQ (compQ re [0, 0, 1]) w),
    scaleL p.k (mulQ (compQ im [0, 0, 1]) w)⟩

lemma evalQ_coordinate (p : Panel) (t : ℝ) :
    evalQ [-(center p) / halfWidth p, 1 / halfWidth p] t = coordinate p t := by
  simp only [evalQ_cons, evalQ_nil, mul_zero, add_zero, Rat.cast_div,
    Rat.cast_neg, Rat.cast_one, coordinate]
  ring

lemma evalQ_tSquare (t : ℝ) : evalQ [0, 0, 1] t = t ^ 2 := by
  simp only [evalQ_cons, evalQ_nil, Rat.cast_zero, Rat.cast_one,
    mul_zero, add_zero, zero_add, mul_one]
  ring

/-- The moment integrator may integrate these exact coefficients without changing V. -/
theorem evalC_approxCoeffs (re im : List ℚ) (p : Panel) (t : ℝ) :
    evalC (approxCoeffs re im p) t = panelApprox re im p t := by
  simp only [approxCoeffs, evalC, evalQ_scale, evalQ_mul, evalQ_comp,
    evalQ_tSquare, evalQ_coordinate, panelApprox]
  push_cast
  ring

theorem continuous_panelApprox (re im : List ℚ) (p : Panel) :
    Continuous (panelApprox re im p) := by
  have he : panelApprox re im p = evalC (approxCoeffs re im p) :=
    funext fun t => (evalC_approxCoeffs re im p t).symm
  rw [he]
  exact continuous_evalC _

/-- Contiguous ordered rational panels with exactly the requested endpoints. -/
def covers : ℚ → ℚ → List Panel → Bool
  | lo, hi, [] => decide (lo = hi)
  | lo, hi, p :: ps => (decide (p.a = lo) && decide (p.a < p.b)) && covers p.b hi ps

theorem covers_le {lo hi : ℚ} {ps : List Panel} (hc : covers lo hi ps = true) : lo ≤ hi := by
  induction ps generalizing lo with
  | nil =>
    simp only [covers, decide_eq_true_eq] at hc
    exact hc.le
  | cons p ps ih =>
    simp only [covers, Bool.and_eq_true, decide_eq_true_eq] at hc
    rcases hc with ⟨⟨ha, hab⟩, htail⟩
    exact ha.symm ▸ hab.le.trans (ih htail)

theorem covers_panel_bounds {lo hi : ℚ} {ps : List Panel}
    (hc : covers lo hi ps = true) :
    ∀ p ∈ ps, lo ≤ p.a ∧ p.b ≤ hi := by
  induction ps generalizing lo with
  | nil => simp
  | cons p ps ih =>
    simp only [covers, Bool.and_eq_true, decide_eq_true_eq] at hc
    rcases hc with ⟨⟨ha, hab⟩, htail⟩
    intro q hq
    rcases List.mem_cons.mp hq with rfl | hq
    · exact ⟨ha.symm.le, covers_le htail⟩
    · have h := ih htail q hq
      exact ⟨(ha.symm ▸ hab.le).trans h.1, h.2⟩

/-- Closed endpoint coverage, including the rightmost endpoint. -/
theorem covers_exists {lo hi : ℚ} {ps : List Panel}
    (hc : covers lo hi ps = true) (hlt : lo < hi) (t : ℝ)
    (htlo : (lo : ℝ) ≤ t) (hthi : t ≤ (hi : ℝ)) :
    ∃ p ∈ ps, (p.a : ℝ) ≤ t ∧ t ≤ (p.b : ℝ) := by
  induction ps generalizing lo with
  | nil =>
    simp only [covers, decide_eq_true_eq] at hc
    exact (hlt.ne hc).elim
  | cons p ps ih =>
    simp only [covers, Bool.and_eq_true, decide_eq_true_eq] at hc
    rcases hc with ⟨⟨ha, _hab⟩, htail⟩
    by_cases ht : t ≤ (p.b : ℝ)
    · exact ⟨p, List.mem_cons_self, by simpa only [ha] using htlo, ht⟩
    · have hpb : (p.b : ℝ) < t := lt_of_not_ge ht
      have hlt' : p.b < hi := by exact_mod_cast hpb.trans_le hthi
      obtain ⟨q, hq, hqa, hqb⟩ := ih htail hlt' hpb.le hthi
      exact ⟨q, List.mem_cons_of_mem p hq, hqa, hqb⟩

/-- First containing panel; zero outside every panel. Shared endpoints choose the earlier panel. -/
noncomputable def approxList (re im : List ℚ) : List Panel → ℝ → ℂ
  | [], _ => 0
  | p :: ps, t =>
      if (p.a : ℝ) ≤ t ∧ t ≤ (p.b : ℝ) then panelApprox re im p t
      else approxList re im ps t

theorem approxList_error_of_cover (re im : List ℚ) (ε : ℚ) (ps : List Panel)
    (hchecks : ps.all (panelCheck re im ε) = true)
    (t : ℝ) (hcover : ∃ p ∈ ps, (p.a : ℝ) ≤ t ∧ t ≤ (p.b : ℝ)) :
    ‖approxList re im ps t - Grothe.Haag.ph (evalC ⟨re, im⟩ (t ^ 2))‖ ≤ (ε : ℝ) := by
  induction ps with
  | nil => simpa using hcover
  | cons p ps ih =>
    simp only [List.all_cons, Bool.and_eq_true] at hchecks
    by_cases ht : (p.a : ℝ) ≤ t ∧ t ≤ (p.b : ℝ)
    · simpa only [approxList, if_pos ht] using panelCheck_sound re im ε p hchecks.1 t ht.1 ht.2
    · have htail : ∃ q ∈ ps, (q.a : ℝ) ≤ t ∧ t ≤ (q.b : ℝ) := by
        obtain ⟨q, hq, hqa, hqb⟩ := hcover
        rcases List.mem_cons.mp hq with rfl | hq
        · exact (ht ⟨hqa, hqb⟩).elim
        · exact ⟨q, hq, hqa, hqb⟩
      simpa only [approxList, if_neg ht] using ih hchecks.2 htail

/-- A finite cover plus finite panel certificates yields one uniform phase bound. -/
theorem approxList_uniform_error (re im : List ℚ) (ε : ℚ) (ps : List Panel)
    (hchecks : ps.all (panelCheck re im ε) = true) {lo hi : ℚ}
    (hc : covers lo hi ps = true) (hlt : lo < hi) (t : ℝ)
    (htlo : (lo : ℝ) ≤ t) (hthi : t ≤ (hi : ℝ)) :
    ‖approxList re im ps t - Grothe.Haag.ph (evalC ⟨re, im⟩ (t ^ 2))‖ ≤ (ε : ℝ) :=
  approxList_error_of_cover re im ε ps hchecks t (covers_exists hc hlt t htlo hthi)

theorem approxList_zero_of_outside (re im : List ℚ) (ps : List Panel) (t : ℝ)
    (hout : ∀ p ∈ ps, ¬ ((p.a : ℝ) ≤ t ∧ t ≤ (p.b : ℝ))) :
    approxList re im ps t = 0 := by
  induction ps with
  | nil => rfl
  | cons p ps ih =>
    rw [approxList, if_neg (hout p List.mem_cons_self)]
    exact ih fun q hq => hout q (List.mem_cons_of_mem p hq)

theorem approxList_zero_of_lt (re im : List ℚ) (ps : List Panel) {lo hi : ℚ}
    (hc : covers lo hi ps = true) (t : ℝ) (ht : t < (lo : ℝ)) :
    approxList re im ps t = 0 := by
  apply approxList_zero_of_outside
  intro p hp hpt
  have ha : (lo : ℝ) ≤ p.a := by exact_mod_cast (covers_panel_bounds hc p hp).1
  exact (not_le_of_gt ht) (ha.trans hpt.1)

theorem approxList_zero_of_gt (re im : List ℚ) (ps : List Panel) {lo hi : ℚ}
    (hc : covers lo hi ps = true) (t : ℝ) (ht : (hi : ℝ) < t) :
    approxList re im ps t = 0 := by
  apply approxList_zero_of_outside
  intro p hp hpt
  have hb : (p.b : ℝ) ≤ hi := by exact_mod_cast (covers_panel_bounds hc p hp).2
  exact (not_le_of_gt ht) (hpt.2.trans hb)

theorem measurable_approxList (re im : List ℚ) (ps : List Panel) :
    Measurable (approxList re im ps) := by
  induction ps with
  | nil => exact measurable_const
  | cons p ps ih =>
    exact ((continuous_panelApprox re im p).measurable.ite measurableSet_Icc ih)

end Grothe.HJM.OriginPanel
