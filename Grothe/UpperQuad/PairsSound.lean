import Grothe.UpperQuad.IntervalSound
import GrotheQuadKernel.Pairs
import Grothe.UpperChaos.ConditionalSeedNormalization

/-!
# Soundness of the conditional-coefficient recurrences (obligation S4 of #303)

The kernel's zero row and forward rows enclose the real parts of master's normalized
coefficients `normalizedCoefficient A (c, d)` (`ConditionalSeedNormalization`), through the
proved recurrences `normalizedCoefficient_zero_row_step` and `normalizedCoefficient_forward`;
the actual coefficient `sign^{c+d} · S(A) · U_{c,d}` follows from `canonicalCoefficient_eq_seed_mul`.
The divisors' positivity (`√(d+1)`, `A√(c+1)`) and the ratio enclosures are hypotheses that the
kernel's validity flags decide.

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace Grothe.UpperQuad

open GrotheQuad Grothe.UpperChaos Grothe.UpperChaos.F0ConditionalEvaluator
  Grothe.UpperChaos.ConditionalSeedNormalization

/-- The real part of the normalized coefficient. -/
noncomputable def uRe (A : ℝ) (c d : ℕ) : ℝ := (normalizedCoefficient A (c, d)).re

lemma mem_sqrtNatI (P : ℕ) (n : ℕ) : mem (Real.sqrt n) (sqrtNatI P n) :=
  mem_sqrtI P (by positivity) (mem_ofNat P n)

lemma sqrtTable_getD (P n i : ℕ) (hi : i ≤ n) : (sqrtTable P n).getD i zeroI = sqrtNatI P i := by
  unfold sqrtTable
  rw [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn]
  have hi' : i < n + 1 := by omega
  simp only [hi', ↓reduceDIte, Option.getD_some]

/-! ### The zero row -/

/-- The recursive specification of the zero row. -/
def zeroRec (P : ℕ) (aI : Ival) (ratios sq : Array Ival) : ℕ → Ival
  | 0 => ofInt P 1
  | d + 1 => zeroStep P aI (ratios.getD d ⟨0, 1, 0⟩) (zeroRec P aI ratios sq d) (sq.getD (d + 1) zeroI)

lemma zeroRowArr_size (P : ℕ) (aI : Ival) (r sq : Array Ival) (d : ℕ) :
    (zeroRowArr P aI r sq d).size = d + 1 := by
  induction d with
  | zero => rfl
  | succ d ih => simp [zeroRowArr, ih]

lemma zeroRowArr_getD (P : ℕ) (aI : Ival) (r sq : Array Ival) (d : ℕ) :
    ∀ d', d' ≤ d → (zeroRowArr P aI r sq d).getD d' zeroI = zeroRec P aI r sq d' := by
  induction d with
  | zero =>
    intro d' hd'
    interval_cases d'
    rfl
  | succ d ih =>
    intro d' hd'
    simp only [zeroRowArr]
    rw [Array.getD_eq_getD_getElem?, Array.getElem?_push, zeroRowArr_size]
    split_ifs with h
    · subst h
      simp only [Option.getD_some, zeroRec]
      rw [ih d (le_refl d)]
    · rw [← Array.getD_eq_getD_getElem?]
      exact ih d' (by omega)

/-- The zero-row step is sound (`sqI ∋ √(d+1)`, with a positive lower end). -/
lemma mem_zeroStep (P : ℕ) {A r u : ℝ} {aI rI uI sqI : Ival} (hA : mem A aI)
    (hr : mem r rI) (hu : mem u uI) (d : ℕ) (hsq : mem (Real.sqrt ((d + 1 : ℕ) : ℝ)) sqI)
    (hpos : 0 < sqI.lo) :
    mem ((-A) * r / Real.sqrt ((d + 1 : ℕ) : ℝ) * u) (zeroStep P aI rI uI sqI) := by
  unfold zeroStep
  have h := mem_divI P (mem_mulI P (mem_mulI P (mem_negI hA) hr) hu) hsq hpos
  convert h using 1
  ring

/-- The zero row encloses `U_{0,d}` for every `d ≤ D`. -/
lemma mem_zeroRec (P : ℕ) {A : ℝ} {aI : Ival} (hA : mem A aI) (ratios sq : Array Ival)
    (hr : ∀ d, mem (OriginalPositiveMoment.ratio d (A ^ 2)) (ratios.getD d ⟨0, 1, 0⟩)) (D : ℕ)
    (hsqT : ∀ n, n ≤ D + 1 → sq.getD n zeroI = sqrtNatI P n)
    (hsq : ∀ n, 1 ≤ n → n ≤ D → 0 < (sqrtNatI P n).lo) (hA0 : 0 < A) (d : ℕ) (hd : d ≤ D) :
    mem (uRe A 0 d) (zeroRec P aI ratios sq d) := by
  induction d with
  | zero =>
    unfold uRe
    rw [normalizedCoefficient_zero_zero hA0]
    simp only [zeroRec, Complex.one_re]
    exact mem_one P
  | succ d ih =>
    unfold uRe at ih ⊢
    rw [normalizedCoefficient_zero_row_step, Complex.re_ofReal_mul]
    simp only [zeroRec]
    rw [hsqT (d + 1) (by omega)]
    exact mem_zeroStep P hA (hr d) (ih (by omega)) d (mem_sqrtNatI P (d + 1))
      (hsq (d + 1) (by omega) hd)

/-! ### The forward rows -/

/-- The forward step is sound. -/
lemma mem_forwardStep (P : ℕ) {A u u1 : ℝ} {aI uI uI1 sqD sqC : Ival} (hA : mem A aI)
    (hu : mem u uI) (hu1 : mem u1 uI1) (c d : ℕ) (hsqD : mem (Real.sqrt ((d + 1 : ℕ) : ℝ)) sqD)
    (hsqC : mem (Real.sqrt ((c + 1 : ℕ) : ℝ)) sqC) (hden : 0 < (mulI P aI sqC).lo) :
    mem ((A * Real.sqrt ((d + 1 : ℕ) : ℝ) * u1 + (((d : ℝ) + 1 - c)) * u) /
      (A * Real.sqrt ((c + 1 : ℕ) : ℝ))) (forwardStep P aI c d uI uI1 sqD sqC) := by
  unfold forwardStep
  have hz : mem ((((d : ℤ) + 1 - (c : ℤ) : ℤ) : ℝ) * u) (mulZ P ((d : ℤ) + 1 - (c : ℤ)) uI) :=
    mem_mulZ P _ hu
  have h := mem_divI P (mem_addI P (mem_mulI P (mem_mulI P hA hsqD) hu1) hz)
    (mem_mulI P hA hsqC) hden
  convert h using 2
  push_cast
  ring

/-- The real-part form of the forward recurrence. -/
lemma uRe_forward {A : ℝ} (hA : 0 < A) (c d : ℕ) :
    uRe A (c + 1) d = (A * Real.sqrt ((d + 1 : ℕ) : ℝ) * uRe A c (d + 1) +
      (((d : ℝ) + 1 - c)) * uRe A c d) / (A * Real.sqrt ((c + 1 : ℕ) : ℝ)) := by
  unfold uRe
  rw [normalizedCoefficient_forward hA c d]
  have hden : ((A : ℂ) * (Real.sqrt ((c + 1 : ℕ) : ℝ) : ℂ)) =
      ((A * Real.sqrt ((c + 1 : ℕ) : ℝ) : ℝ) : ℂ) := by push_cast; ring
  rw [hden, Complex.div_ofReal_re, Complex.add_re]
  congr 2
  · rw [show (A : ℂ) * (Real.sqrt ((d + 1 : ℕ) : ℝ) : ℂ) =
        ((A * Real.sqrt ((d + 1 : ℕ) : ℝ) : ℝ) : ℂ) by push_cast; ring, Complex.re_ofReal_mul]
  · rw [show ((d : ℂ) + 1 - (c : ℂ)) = (((d : ℝ) + 1 - c : ℝ) : ℂ) by push_cast; ring,
      Complex.re_ofReal_mul]

/-- The recursive specification of the rows. -/
def rowRec (P : ℕ) (aI : Ival) (sq zero : Array Ival) (D : ℕ) : ℕ → Array Ival
  | 0 => zero
  | c + 1 => nextRow P aI sq D c (rowRec P aI sq zero D c)

lemma rowsArr_size (P : ℕ) (aI : Ival) (sq zero : Array Ival) (D n : ℕ) :
    (rowsArr P aI sq zero D n).size = n + 1 := by
  induction n with
  | zero => rfl
  | succ n ih => simp [rowsArr, ih]

lemma rowsArr_getD (P : ℕ) (aI : Ival) (sq zero : Array Ival) (D n : ℕ) :
    ∀ c, c ≤ n → (rowsArr P aI sq zero D n).getD c #[] = rowRec P aI sq zero D c := by
  induction n with
  | zero =>
    intro c hc
    interval_cases c
    rfl
  | succ n ih =>
    intro c hc
    simp only [rowsArr]
    rw [Array.getD_eq_getD_getElem?, Array.getElem?_push, rowsArr_size]
    split_ifs with h
    · subst h
      simp only [Option.getD_some, rowRec]
      rw [ih n (le_refl n)]
    · rw [← Array.getD_eq_getD_getElem?]
      exact ih c (by omega)

lemma nextRow_getD (P : ℕ) (aI : Ival) (sq : Array Ival) (D c : ℕ) (prev : Array Ival) (i : ℕ)
    (hi : i < D - (c + 1) + 1 - c) :
    (nextRow P aI sq D c prev).getD i zeroI =
      forwardStep P aI c (c + i) (prev.getD (c + i - rowLo c) zeroI)
        (prev.getD (c + i + 1 - rowLo c) zeroI) (sq.getD (c + i + 1) zeroI)
        (sq.getD (c + 1) zeroI) := by
  unfold nextRow
  rw [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn]
  split_ifs
  rfl

/-- The rows enclose `U_{c,d}` on their ranges `rowLo c ≤ d ≤ D − c`, `c ≤ (D+1)/2`. -/
lemma mem_rowRec (P : ℕ) {A : ℝ} {aI : Ival} (hA : mem A aI) (hA0 : 0 < A)
    (ratios sq : Array Ival)
    (hr : ∀ d, mem (OriginalPositiveMoment.ratio d (A ^ 2)) (ratios.getD d ⟨0, 1, 0⟩))
    (D : ℕ) (hsqT : ∀ n, n ≤ D + 1 → sq.getD n zeroI = sqrtNatI P n)
    (hsq : ∀ n, 1 ≤ n → n ≤ D → 0 < (sqrtNatI P n).lo)
    (hden : ∀ c, c < (D + 1) / 2 → 0 < (mulI P aI (sqrtNatI P (c + 1))).lo) :
    ∀ c, c ≤ (D + 1) / 2 → ∀ d, rowLo c ≤ d → d ≤ D - c →
      mem (uRe A c d)
        ((rowRec P aI sq (zeroRowArr P aI ratios sq D) D c).getD (d - rowLo c) zeroI) := by
  intro c
  induction c with
  | zero =>
    intro _ d _ hd
    simp only [rowRec, rowLo, Nat.zero_sub, Nat.sub_zero]
    rw [zeroRowArr_getD P aI ratios sq D d (by omega)]
    exact mem_zeroRec P hA ratios sq hr D hsqT hsq hA0 d (by omega)
  | succ c ih =>
    intro hc d hd1 hd2
    simp only [rowRec]
    have hi : d - rowLo (c + 1) < D - (c + 1) + 1 - c := by unfold rowLo at *; omega
    rw [nextRow_getD P aI sq D c _ (d - rowLo (c + 1)) hi]
    have hcd : c + (d - rowLo (c + 1)) = d := by unfold rowLo at *; omega
    rw [hcd, uRe_forward hA0 c d, hsqT (d + 1) (by omega), hsqT (c + 1) (by omega)]
    have h1 := ih (by omega) d (by unfold rowLo at *; omega) (by omega)
    have h2 := ih (by omega) (d + 1) (by unfold rowLo at *; omega) (by omega)
    exact mem_forwardStep P hA h1 h2 c d (mem_sqrtNatI P (d + 1)) (mem_sqrtNatI P (c + 1))
      (hden c (by omega))

/-! ### The canonical pairs -/

lemma levelPairs_mem {dMax m : ℕ} {p : ℕ × ℕ} (h : p ∈ levelPairs dMax m) :
    p.1 + p.2 = m ∧ p.1 ≤ p.2 + 1 ∧ p.2 ≤ dMax := by
  unfold levelPairs rowCount rowRange at h
  simp only [List.mem_map, List.mem_range] at h
  obtain ⟨i, hi, rfl⟩ := h
  simp only
  omega

lemma canonicalPairs_mem {D dMax : ℕ} {p : ℕ × ℕ} (h : p ∈ canonicalPairs D dMax) :
    p.1 + p.2 ≤ D ∧ p.1 ≤ p.2 + 1 ∧ p.2 ≤ dMax := by
  unfold canonicalPairs at h
  simp only [List.mem_toArray, List.mem_flatMap, List.mem_range] at h
  obtain ⟨m, hm, hp⟩ := h
  have := levelPairs_mem hp
  omega

/-- Every entry of the normalized canonical array encloses the corresponding `U_{c,d}`. -/
lemma mem_normalizedTriangleI (P : ℕ) {A : ℝ} {aI : Ival} (hA : mem A aI) (hA0 : 0 < A)
    (ratios sq : Array Ival)
    (hr : ∀ d, mem (OriginalPositiveMoment.ratio d (A ^ 2)) (ratios.getD d ⟨0, 1, 0⟩))
    (D : ℕ) (hsqT : ∀ n, n ≤ D + 1 → sq.getD n zeroI = sqrtNatI P n)
    (hsq : ∀ n, 1 ≤ n → n ≤ D → 0 < (sqrtNatI P n).lo)
    (hden : ∀ c, c < (D + 1) / 2 → 0 < (mulI P aI (sqrtNatI P (c + 1))).lo) (dMax i : ℕ)
    (hi : i < (canonicalPairs D dMax).size) :
    mem (uRe A ((canonicalPairs D dMax).getD i (0, 0)).1 ((canonicalPairs D dMax).getD i (0, 0)).2)
      ((normalizedTriangleI P aI sq ratios D dMax).getD i zeroI) := by
  unfold normalizedTriangleI
  simp only [Array.getD_eq_getD_getElem?, Array.getElem?_map]
  have hsome : (canonicalPairs D dMax)[i]? = some ((canonicalPairs D dMax)[i]) :=
    Array.getElem?_eq_getElem hi
  rw [hsome]
  simp only [Option.map_some, Option.getD_some]
  set p := (canonicalPairs D dMax)[i] with hp
  have hmem : p ∈ canonicalPairs D dMax := Array.getElem_mem hi
  obtain ⟨hsum, hc, hd⟩ := canonicalPairs_mem hmem
  have hcmax : p.1 ≤ (D + 1) / 2 := by omega
  unfold rowsGet
  rw [rowsArr_getD P aI sq _ D ((D + 1) / 2) p.1 hcmax]
  exact mem_rowRec P hA hA0 ratios sq hr D hsqT hsq hden p.1 hcmax p.2 (by unfold rowLo; omega)
    (by omega)

end Grothe.UpperQuad
