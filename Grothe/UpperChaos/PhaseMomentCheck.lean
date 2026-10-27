import Grothe.UpperChaos.PhiDense

/-!
# Exact integer polynomials for the finite phase moments

Nested coefficient lists represent trivariate integer polynomials in Horner order.
Convolution and repeated multiplication evaluate to the corresponding products and
powers. Clearing a rational term list's common denominator gives an integer polynomial
with exactly the same evaluation, up to that denominator.

The executable definitions live outside the precompiled checker libraries so this
independent moment calculation does not invalidate existing numerical certificates.

Agent-ID: codex-2ca4
-/

open GrotheKernel

namespace Grothe.UpperChaos.PhaseMomentCheck

/-- Convolution of coefficient lists, with the coefficient operations supplied explicitly. -/
def convolve {α : Type} (add mul : α → α → α) (zero : α) : List α → List α → List α
  | [], _ => []
  | a :: p, q =>
      zipAddG add (q.map (mul a)) (zero :: convolve add mul zero p q)

/-- Exact univariate multiplication. -/
def mul1 (p q : List ℤ) : List ℤ := convolve (· + ·) (· * ·) 0 p q

/-- Exact bivariate multiplication. -/
def mul2 (p q : List (List ℤ)) : List (List ℤ) := convolve add1 mul1 [] p q

/-- Exact trivariate multiplication. -/
def mul3 (p q : List (List (List ℤ))) : List (List (List ℤ)) :=
  convolve add2 mul2 [] p q

/-- Repeated multiplication by the fixed base; this preserves the inexpensive small factor. -/
def pow3 (p : List (List (List ℤ))) : ℕ → List (List (List ℤ))
  | 0 => [[[1]]]
  | n + 1 => mul3 p (pow3 p n)

/-- One monomial in a coefficient list. -/
def monomialG {α : Type} (zero a : α) (n : ℕ) : List α :=
  List.replicate n zero ++ [a]

/-- The integer monomial `c U^a V^b W^d`. -/
def monomial3 (a b d : ℕ) (c : ℤ) : List (List (List ℤ)) :=
  monomialG [] (monomialG [] (monomialG 0 c d) b) a

/-- Clear a specified denominator and sum the resulting integer monomials. -/
def ofTerms (L : ℕ) (ts : List ((ℕ × ℕ × ℕ) × ℚ)) : List (List (List ℤ)) :=
  ts.foldr (fun t p =>
    add3 (monomial3 t.1.1 t.1.2.1 t.1.2.2 (t.2 * (L : ℚ)).num) p) []

/-- The unscaled integer phase polynomial; unlike `denseA0`, no grid factors are inserted. -/
def integerPhase (ts : List ((ℕ × ℕ × ℕ) × ℚ)) : List (List (List ℤ)) :=
  ofTerms (commonDen ts) ts

noncomputable section

/-- Convolution evaluates to multiplication whenever coefficient evaluation respects the operations. -/
theorem evalG_convolve {α : Type} (ev : α → ℝ) (add mul : α → α → α) (zero : α)
    (hadd : ∀ a b, ev (add a b) = ev a + ev b)
    (hmul : ∀ a b, ev (mul a b) = ev a * ev b) (hzero : ev zero = 0)
    (p q : List α) (x : ℝ) :
    evalG ev (convolve add mul zero p q) x = evalG ev p x * evalG ev q x := by
  induction p with
  | nil => simp [convolve]
  | cons a p ih =>
    have hmap : evalG ev (q.map (mul a)) x = ev a * evalG ev q x := by
      induction q with
      | nil => simp
      | cons b q ih =>
          simp only [List.map_cons, evalG_cons, hmul, ih]
          ring
    rw [convolve, evalG_zipAddG ev add hadd, evalG_cons, hzero, ih, hmap, evalG_cons]
    ring

theorem e1_mul1 (p q : List ℤ) (x : ℝ) : he1 (mul1 p q) x = he1 p x * he1 q x :=
  evalG_convolve _ _ _ _ (fun a b => by push_cast; ring)
    (fun a b => by push_cast; ring) (by simp) p q x

theorem e2_mul2 (p q : List (List ℤ)) (x y : ℝ) :
    he2 (mul2 p q) x y = he2 p x y * he2 q x y :=
  evalG_convolve _ _ _ _ (fun a b => e1_add1 a b y)
    (fun a b => e1_mul1 a b y) (by simp [he1]) p q x

/-- The exact trivariate product has the expected pointwise value. -/
theorem e3_mul3 (p q : List (List (List ℤ))) (x y z : ℝ) :
    he3 (mul3 p q) x y z = he3 p x y z * he3 q x y z :=
  evalG_convolve _ _ _ _ (fun a b => e2_add2 a b y z)
    (fun a b => e2_mul2 a b y z) (by simp [he2]) p q x

/-- Repeated integer convolution evaluates to the ordinary power. -/
theorem e3_pow3 (p : List (List (List ℤ))) (n : ℕ) (x y z : ℝ) :
    he3 (pow3 p n) x y z = he3 p x y z ^ n := by
  induction n with
  | zero => simp [pow3, he3, he2, he1, evalG]
  | succ n ih => rw [pow3, e3_mul3, ih, pow_succ']

lemma evalG_monomialG {α : Type} (ev : α → ℝ) (zero a : α)
    (hzero : ev zero = 0) (n : ℕ) (x : ℝ) :
    evalG ev (monomialG zero a n) x = ev a * x ^ n := by
  induction n with
  | zero => simp [monomialG]
  | succ n ih =>
      simp only [monomialG, List.replicate_succ, List.cons_append, evalG_cons, hzero]
      rw [show evalG ev (List.replicate n zero ++ [a]) x = ev a * x ^ n from ih]
      rw [pow_succ]
      ring

/-- Leading zero coefficients place a monomial at precisely its three exponents. -/
theorem e3_monomial3 (a b d : ℕ) (c : ℤ) (x y z : ℝ) :
    he3 (monomial3 a b d c) x y z = (c : ℝ) * x ^ a * y ^ b * z ^ d := by
  simp only [monomial3, he3, he2, he1]
  rw [evalG_monomialG _ _ _ (by simp), evalG_monomialG _ _ _ (by simp),
    evalG_monomialG _ _ _ (by simp)]
  ring

/-- Clearing integral coefficients commutes with evaluation of the original term list. -/
theorem e3_ofTerms (L : ℕ) (ts : List ((ℕ × ℕ × ℕ) × ℚ))
    (hts : ∀ t ∈ ts, (t.2 * (L : ℚ)).den = 1) (x y z : ℝ) :
    he3 (ofTerms L ts) x y z = (L : ℝ) * Ssum ts x y z := by
  revert hts
  induction ts with
  | nil => intro _; simp [ofTerms, Ssum, he3]
  | cons t ts ih =>
      intro hts
      have hnum : (((t.2 * (L : ℚ)).num : ℤ) : ℝ) = (t.2 : ℝ) * L := by
        have h := Rat.coe_int_num_of_den_eq_one (hts t (by simp))
        exact_mod_cast h
      have htail : ∀ u ∈ ts, (u.2 * (L : ℚ)).den = 1 :=
        fun u hu => hts u (List.mem_cons_of_mem t hu)
      simp only [ofTerms, List.foldr_cons, e3_add3, e3_monomial3, hnum]
      rw [show he3 (ts.foldr (fun t p =>
          add3 (monomial3 t.1.1 t.1.2.1 t.1.2.2 (t.2 * (L : ℚ)).num) p) []) x y z =
          (L : ℝ) * Ssum ts x y z from ih htail]
      simp only [Ssum, List.map_cons, List.sum_cons]
      ring

/-- Existing phase admissibility suffices for the unscaled integer source conversion. -/
theorem e3_integerPhase {ts : List ((ℕ × ℕ × ℕ) × ℚ)} (hts : termsOK ts = true)
    (x y z : ℝ) :
    he3 (integerPhase ts) x y z = (commonDen ts : ℝ) * Ssum ts x y z := by
  apply e3_ofTerms
  intro t ht
  have h := List.all_eq_true.1 hts t ht
  have hp : t.1.1 + t.1.2.1 + t.1.2.2 ≤ DEG ∧
      (t.2 * (commonDen ts : ℚ)).den = 1 := by
    simpa [termsOK] using h
  exact hp.2

end

end Grothe.UpperChaos.PhaseMomentCheck
