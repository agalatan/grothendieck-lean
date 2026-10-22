/-!
# Symbolic polynomials in `z, z̄` for the cap certificates (Mathlib-free, precompiled)

`KQ` is `ℚ(√2)` (`p + q√2`), `KC` the complex numbers over it, `CP` a polynomial
`Σ c z^a z̄^b` as a list of terms `(a, b, c)`.  The fibre basis `B_j` (`bCP j`) and
`L = z(ℓ + β(|z|² − 2))` (`lCP`) are such polynomials.  `CP.polar` turns `Re P` into polar terms
`|z|^m (cc cos nθ + cs sin nθ)`.  Soundness: `Grothe/LowerAnalytic/CapSym.lean`.
-/

namespace GrotheKernel

/-- `p + q√2`. -/
structure KQ where
  p : Rat
  q : Rat

namespace KQ
def zero : KQ := ⟨0, 0⟩
def ofRat (x : Rat) : KQ := ⟨x, 0⟩
def add (x y : KQ) : KQ := ⟨x.p + y.p, x.q + y.q⟩
def neg (x : KQ) : KQ := ⟨-x.p, -x.q⟩
def mul (x y : KQ) : KQ := ⟨x.p * y.p + 2 * x.q * y.q, x.p * y.q + x.q * y.p⟩
end KQ

/-- Complex numbers over `ℚ(√2)`. -/
structure KC where
  re : KQ
  im : KQ

namespace KC
def ofRat (x : Rat) : KC := ⟨KQ.ofRat x, KQ.zero⟩
def I : KC := ⟨KQ.zero, KQ.ofRat 1⟩
def add (x y : KC) : KC := ⟨x.re.add y.re, x.im.add y.im⟩
def neg (x : KC) : KC := ⟨x.re.neg, x.im.neg⟩
def mul (x y : KC) : KC := ⟨(x.re.mul y.re).add (x.im.mul y.im).neg, (x.re.mul y.im).add (x.im.mul y.re)⟩
def conj (x : KC) : KC := ⟨x.re, x.im.neg⟩
end KC

/-- A polynomial `Σ c z^a z̄^b`. -/
abbrev CP := List (Nat × Nat × KC)

namespace CP
def add (P Q : CP) : CP := P ++ Q
def neg (P : CP) : CP := P.map fun t => (t.1, t.2.1, t.2.2.neg)
def smul (c : KC) (P : CP) : CP := P.map fun t => (t.1, t.2.1, c.mul t.2.2)
def mul (P Q : CP) : CP :=
  P.flatMap fun s => Q.map fun t => (s.1 + t.1, s.2.1 + t.2.1, s.2.2.mul t.2.2)
def conj (P : CP) : CP := P.map fun t => (t.2.1, t.1, t.2.2.conj)
/-- `Re X · Re Y = (Re(XY) + Re(X Ȳ))/2`, as the real part of a polynomial. -/
def reMul (P Q : CP) : CP := smul (KC.ofRat (1 / 2)) (add (mul P Q) (mul P (conj Q)))

/-- A polar term `|z|^m (cc cos nθ + cs sin nθ)`. -/
structure PT where
  m : Nat
  n : Int
  cc : KQ
  cs : KQ

/-- `Re P` in polar terms. -/
def polar (P : CP) : List PT :=
  P.map fun t => ⟨t.1 + t.2.1, (t.1 : Int) - t.2.1, t.2.2.re, t.2.2.im.neg⟩
end CP

/-- `1/√2 = √2/2`. -/
def kInvSqrt2 : KQ := ⟨0, 1 / 2⟩

/-- The fibre basis `B_j` as polynomials. -/
def bCP (j : Nat) : CP :=
  match j with
  | 0 => [(0, 0, KC.ofRat 1)]
  | 1 => [(1, 1, KC.ofRat 1), (0, 0, KC.ofRat (-1))]
  | 2 => [(2, 0, ⟨kInvSqrt2, KQ.zero⟩)]
  | 3 => [(0, 0, KC.I)]
  | 4 => [(1, 1, KC.I), (0, 0, KC.I.neg)]
  | 5 => [(2, 0, ⟨KQ.zero, kInvSqrt2.neg⟩)]
  | 6 => [(1, 0, KC.ofRat 1)]
  | 7 => [(2, 1, ⟨kInvSqrt2, KQ.zero⟩), (1, 0, ⟨⟨0, -1⟩, KQ.zero⟩)]
  | 8 => [(1, 0, KC.I)]
  | 9 => [(2, 1, ⟨KQ.zero, kInvSqrt2⟩), (1, 0, ⟨KQ.zero, ⟨0, -1⟩⟩)]
  | 10 => [(0, 1, KC.ofRat 1)]
  | 11 => [(0, 1, KC.I)]
  | _ => []

/-- `L = z(ℓ + β(|z|² − 2)) = β z²z̄ + (ℓ − 2β) z`. -/
def lCP (ell beta : Rat) : CP := [(2, 1, KC.ofRat beta), (1, 0, KC.ofRat (ell - 2 * beta))]

/-- `uⱼ = Re(Bⱼ L̄)`. -/
def uCP (ell beta : Rat) (j : Nat) : CP := CP.mul (bCP j) (CP.conj (lCP ell beta))
/-- `Gᵢⱼ = Re(Bᵢ B̄ⱼ)`. -/
def gCP (i j : Nat) : CP := CP.mul (bCP i) (CP.conj (bCP j))
/-- `|L|² = Re(L L̄)`. -/
def l2CP (ell beta : Rat) : CP := CP.mul (lCP ell beta) (CP.conj (lCP ell beta))
/-- `uᵢuⱼ`. -/
def uuCP (ell beta : Rat) (i j : Nat) : CP := CP.reMul (uCP ell beta i) (uCP ell beta j)

end GrotheKernel
