import Mathlib

/-!
# Positive (semi)definiteness certificates for small rational symmetric matrices

A symmetric matrix is certified PSD by an exact `L D Lᵀ` factorization with `D ≥ 0`
(`L` unit lower triangular); then `vᵀ M v = Σ dₖ (Lᵀv)ₖ² ≥ 0`.  With `D > 0` it is PD.
These are the "matrix gates" of the lower-bound profiles.
-/

namespace Grothe.Lower

/-- Symmetric `3×3` rational matrix (upper triangle). -/
structure Sym3 where
  m11 : ℚ
  m12 : ℚ
  m13 : ℚ
  m22 : ℚ
  m23 : ℚ
  m33 : ℚ
  deriving DecidableEq, Repr

/-- Symmetric `2×2` rational matrix. -/
structure Sym2 where
  m11 : ℚ
  m12 : ℚ
  m22 : ℚ
  deriving DecidableEq, Repr

/-- `L D Lᵀ` certificate for a `3×3` matrix: `L = [[1,0,0],[l21,1,0],[l31,l32,1]]`. -/
structure LDL3 where
  d1 : ℚ
  d2 : ℚ
  d3 : ℚ
  l21 : ℚ
  l31 : ℚ
  l32 : ℚ
  deriving Repr

/-- `L D Lᵀ` certificate for a `2×2` matrix. -/
structure LDL2 where
  d1 : ℚ
  d2 : ℚ
  l21 : ℚ
  deriving Repr

/-- Quadratic form of a `3×3` symmetric matrix (real arguments, rational entries). -/
def qf3 (M : Sym3) (v1 v2 v3 : ℝ) : ℝ :=
  M.m11 * v1 ^ 2 + 2 * M.m12 * v1 * v2 + 2 * M.m13 * v1 * v3 + M.m22 * v2 ^ 2
    + 2 * M.m23 * v2 * v3 + M.m33 * v3 ^ 2

def qf2 (M : Sym2) (v1 v2 : ℝ) : ℝ :=
  M.m11 * v1 ^ 2 + 2 * M.m12 * v1 * v2 + M.m22 * v2 ^ 2

/-- Positive semidefinite. -/
def PSD3 (M : Sym3) : Prop := ∀ v1 v2 v3 : ℝ, 0 ≤ qf3 M v1 v2 v3
/-- Positive definite. -/
def PD3 (M : Sym3) : Prop := ∀ v1 v2 v3 : ℝ, (v1 ≠ 0 ∨ v2 ≠ 0 ∨ v3 ≠ 0) → 0 < qf3 M v1 v2 v3
def PSD2 (M : Sym2) : Prop := ∀ v1 v2 : ℝ, 0 ≤ qf2 M v1 v2
def PD2 (M : Sym2) : Prop := ∀ v1 v2 : ℝ, (v1 ≠ 0 ∨ v2 ≠ 0) → 0 < qf2 M v1 v2

/-- Exact factorization check `M = L D Lᵀ`. -/
def ldl3_eq (M : Sym3) (c : LDL3) : Bool :=
  M.m11 == c.d1 && M.m12 == c.d1 * c.l21 && M.m13 == c.d1 * c.l31 &&
  M.m22 == c.d1 * c.l21 ^ 2 + c.d2 && M.m23 == c.d1 * c.l21 * c.l31 + c.d2 * c.l32 &&
  M.m33 == c.d1 * c.l31 ^ 2 + c.d2 * c.l32 ^ 2 + c.d3

def ldl2_eq (M : Sym2) (c : LDL2) : Bool :=
  M.m11 == c.d1 && M.m12 == c.d1 * c.l21 && M.m22 == c.d1 * c.l21 ^ 2 + c.d2

/-- Boolean PSD check. -/
def checkPSD3 (M : Sym3) (c : LDL3) : Bool :=
  ldl3_eq M c && decide (0 ≤ c.d1) && decide (0 ≤ c.d2) && decide (0 ≤ c.d3)
def checkPD3 (M : Sym3) (c : LDL3) : Bool :=
  ldl3_eq M c && decide (0 < c.d1) && decide (0 < c.d2) && decide (0 < c.d3)
def checkPSD2 (M : Sym2) (c : LDL2) : Bool :=
  ldl2_eq M c && decide (0 ≤ c.d1) && decide (0 ≤ c.d2)
def checkPD2 (M : Sym2) (c : LDL2) : Bool :=
  ldl2_eq M c && decide (0 < c.d1) && decide (0 < c.d2)

lemma qf3_ldl (M : Sym3) (c : LDL3) (h : ldl3_eq M c = true) (v1 v2 v3 : ℝ) :
    qf3 M v1 v2 v3 = c.d1 * (v1 + c.l21 * v2 + c.l31 * v3) ^ 2
      + c.d2 * (v2 + c.l32 * v3) ^ 2 + c.d3 * v3 ^ 2 := by
  simp only [ldl3_eq, Bool.and_eq_true, beq_iff_eq] at h
  obtain ⟨⟨⟨⟨⟨h1, h2⟩, h3⟩, h4⟩, h5⟩, h6⟩ := h
  simp only [qf3, h1, h2, h3, h4, h5, h6]
  push_cast
  ring

lemma qf2_ldl (M : Sym2) (c : LDL2) (h : ldl2_eq M c = true) (v1 v2 : ℝ) :
    qf2 M v1 v2 = c.d1 * (v1 + c.l21 * v2) ^ 2 + c.d2 * v2 ^ 2 := by
  simp only [ldl2_eq, Bool.and_eq_true, beq_iff_eq] at h
  obtain ⟨⟨h1, h2⟩, h3⟩ := h
  simp only [qf2, h1, h2, h3]
  push_cast
  ring

theorem psd3_of_check (M : Sym3) (c : LDL3) (h : checkPSD3 M c = true) : PSD3 M := by
  simp only [checkPSD3, Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨⟨⟨he, h1⟩, h2⟩, h3⟩ := h
  intro v1 v2 v3
  rw [qf3_ldl M c he]
  have h1' : (0 : ℝ) ≤ c.d1 := by exact_mod_cast h1
  have h2' : (0 : ℝ) ≤ c.d2 := by exact_mod_cast h2
  have h3' : (0 : ℝ) ≤ c.d3 := by exact_mod_cast h3
  positivity

theorem pd3_of_check (M : Sym3) (c : LDL3) (h : checkPD3 M c = true) : PD3 M := by
  simp only [checkPD3, Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨⟨⟨he, h1⟩, h2⟩, h3⟩ := h
  intro v1 v2 v3 hv
  rw [qf3_ldl M c he]
  have h1' : (0 : ℝ) < c.d1 := by exact_mod_cast h1
  have h2' : (0 : ℝ) < c.d2 := by exact_mod_cast h2
  have h3' : (0 : ℝ) < c.d3 := by exact_mod_cast h3
  by_contra hcon
  push_neg at hcon
  have s1 := mul_nonneg h1'.le (sq_nonneg (v1 + c.l21 * v2 + c.l31 * v3))
  have s2 := mul_nonneg h2'.le (sq_nonneg (v2 + c.l32 * v3))
  have s3 := mul_nonneg h3'.le (sq_nonneg v3)
  have e3 : v3 = 0 := by
    have : c.d3 * v3 ^ 2 = 0 := by linarith
    rcases mul_eq_zero.1 this with h | h
    · exact absurd h h3'.ne'
    · exact pow_eq_zero_iff (two_ne_zero) |>.1 h
  have e2 : v2 = 0 := by
    have : c.d2 * (v2 + c.l32 * v3) ^ 2 = 0 := by linarith
    rcases mul_eq_zero.1 this with h | h
    · exact absurd h h2'.ne'
    · have := pow_eq_zero_iff (two_ne_zero) |>.1 h
      rw [e3] at this; linarith
  have e1 : v1 = 0 := by
    have : c.d1 * (v1 + c.l21 * v2 + c.l31 * v3) ^ 2 = 0 := by linarith
    rcases mul_eq_zero.1 this with h | h
    · exact absurd h h1'.ne'
    · have := pow_eq_zero_iff (two_ne_zero) |>.1 h
      rw [e2, e3] at this; linarith
  rcases hv with h | h | h <;> contradiction

theorem psd2_of_check (M : Sym2) (c : LDL2) (h : checkPSD2 M c = true) : PSD2 M := by
  simp only [checkPSD2, Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨⟨he, h1⟩, h2⟩ := h
  intro v1 v2
  rw [qf2_ldl M c he]
  have h1' : (0 : ℝ) ≤ c.d1 := by exact_mod_cast h1
  have h2' : (0 : ℝ) ≤ c.d2 := by exact_mod_cast h2
  positivity

theorem pd2_of_check (M : Sym2) (c : LDL2) (h : checkPD2 M c = true) : PD2 M := by
  simp only [checkPD2, Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨⟨he, h1⟩, h2⟩ := h
  intro v1 v2 hv
  rw [qf2_ldl M c he]
  have h1' : (0 : ℝ) < c.d1 := by exact_mod_cast h1
  have h2' : (0 : ℝ) < c.d2 := by exact_mod_cast h2
  by_contra hcon
  push_neg at hcon
  have s1 := mul_nonneg h1'.le (sq_nonneg (v1 + c.l21 * v2))
  have s2 := mul_nonneg h2'.le (sq_nonneg v2)
  have e2 : v2 = 0 := by
    have : c.d2 * v2 ^ 2 = 0 := by linarith
    rcases mul_eq_zero.1 this with h | h
    · exact absurd h h2'.ne'
    · exact pow_eq_zero_iff (two_ne_zero) |>.1 h
  have e1 : v1 = 0 := by
    have : c.d1 * (v1 + c.l21 * v2) ^ 2 = 0 := by linarith
    rcases mul_eq_zero.1 this with h | h
    · exact absurd h h1'.ne'
    · have := pow_eq_zero_iff (two_ne_zero) |>.1 h
      rw [e2] at this; linarith
  rcases hv with h | h <;> contradiction

/-! ### Matrix arithmetic used by the gates -/

/-- `M - diag(a, b, c)`. -/
def Sym3.subDiag (M : Sym3) (a b c : ℚ) : Sym3 :=
  { M with m11 := M.m11 - a, m22 := M.m22 - b, m33 := M.m33 - c }

def Sym2.subDiag (M : Sym2) (a b : ℚ) : Sym2 :=
  { M with m11 := M.m11 - a, m22 := M.m22 - b }

/-- Convex combination `w A + (1-w) B`. -/
def Sym3.avg (w : ℚ) (A B : Sym3) : Sym3 :=
  ⟨w * A.m11 + (1 - w) * B.m11, w * A.m12 + (1 - w) * B.m12, w * A.m13 + (1 - w) * B.m13,
   w * A.m22 + (1 - w) * B.m22, w * A.m23 + (1 - w) * B.m23, w * A.m33 + (1 - w) * B.m33⟩

def Sym2.avg (w : ℚ) (A B : Sym2) : Sym2 :=
  ⟨w * A.m11 + (1 - w) * B.m11, w * A.m12 + (1 - w) * B.m12, w * A.m22 + (1 - w) * B.m22⟩

end Grothe.Lower
