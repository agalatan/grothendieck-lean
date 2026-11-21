import GrotheKernel.HardyArc
import GrotheQuadKernel.Basic

/-!
# Executable radial quadrature without analytic imports

Agent-ID: codex-a7c4.

These exact rational operations are matched to `Moments` and `MomentCache` in
`RadialComputeSound`. This file alone asserts no integral enclosure.
-/

namespace Grothe.UpperReplacement.RadialCompute

local notation "ℚ" => Rat

def factorial : Nat → Nat
  | 0 => 1
  | n + 1 => (n + 1) * factorial n

def descending (n : Nat) : Nat → Nat
  | 0 => 1
  | k + 1 => (n - k) * descending n k

def choose (n k : Nat) : Nat := descending n k / factorial k

def padd : List ℚ → List ℚ → List ℚ
  | [], q => q
  | a :: p, [] => a :: p
  | a :: p, b :: q => (a + b) :: padd p q

def psmul (c : ℚ) (p : List ℚ) : List ℚ := p.map (c * ·)

def pmul : List ℚ → List ℚ → List ℚ
  | [], _ => []
  | a :: p, q => padd (psmul a q) (0 :: pmul p q)

def pint : List ℚ → Nat → ℚ → ℚ → ℚ
  | [], _, _, _ => 0
  | a :: p, d, x, y => a * (y ^ (d + 1) - x ^ (d + 1)) / (d + 1) + pint p (d + 1) x y

def expPoly (u : List ℚ) : Nat → List ℚ × List ℚ
  | 0 => ([], [1])
  | n + 1 =>
    let r := expPoly u n
    (padd r.1 r.2, psmul (1 / (n + 1 : ℚ)) (pmul r.2 u))

def rdDown (q : ℚ) (P : Nat) : ℚ := (Rat.floor (q * 2 ^ P) : ℚ) / 2 ^ P

def rdUp (q : ℚ) (P : Nat) : ℚ := (-Rat.floor (-(q * 2 ^ P)) : ℚ) / 2 ^ P

def expTay (x : ℚ) : Nat → ℚ × ℚ
  | 0 => (0, 1)
  | n + 1 => let r := expTay x n; (r.1 + r.2, r.2 * x / (n + 1))

def expRem (y : ℚ) (n : Nat) : ℚ := y ^ n * ((n + 1 : ℚ) / (factorial n * n))

def squareEnclosure (P : Nat) : Nat → ℚ × ℚ → ℚ × ℚ
  | 0, e => e
  | k + 1, e =>
    let f := squareEnclosure P k e
    (rdDown (f.1 ^ 2) P, rdUp (f.2 ^ 2) P)

def expNegEnclosure (P n : Nat) (x : ℚ) : ℚ × ℚ :=
  let y := x / 2 ^ 10
  let T := (expTay (-y) n).1
  let E := expRem y n
  squareEnclosure P 10 (max 0 (rdDown (T - E) P), rdUp (T + E) P)

def radialBase (a b : ℚ) (n k : Nat) : ℚ :=
  let c := (a + b) / 2
  let h := (b - a) / 2
  let S := (expPoly [0, -2 * c, -1] n).1
  2 * ((List.range (k + 2)).map fun p ↦
    (choose (k + 1) p : ℚ) * c ^ (k + 1 - p) * pint S p (-h) h).sum

def radialError (a b : ℚ) (n k : Nat) : ℚ :=
  let c := (a + b) / 2
  let h := (b - a) / 2
  expRem (2 * c * h + h ^ 2) n * (2 * (b ^ (k + 2) - a ^ (k + 2)) / (k + 2))

def radialEnclosure (P n : Nat) (a b : ℚ) (k : Nat) : ℚ × ℚ :=
  let X := expNegEnclosure P n (((a + b) / 2) ^ 2)
  let lo := radialBase a b n k - radialError a b n k
  let hi := radialBase a b n k + radialError a b n k
  (rdDown (if 0 ≤ lo then X.1 * lo else X.2 * lo) P,
    rdUp (if 0 ≤ hi then X.2 * hi else X.1 * hi) P)

def momentStep (P : Nat) (a b : ℚ) (ea eb v : ℚ × ℚ) (k : Nat) : ℚ × ℚ :=
  let c : ℚ := (k + 2) / 2
  (rdDown (c * v.1 + a ^ (k + 2) * ea.1 - b ^ (k + 2) * eb.2) P,
    rdUp (c * v.2 + a ^ (k + 2) * ea.2 - b ^ (k + 2) * eb.1) P)

def momentCache (P : Nat) (a b : ℚ) (ea eb v₀ v₁ : ℚ × ℚ) : Nat → Array (ℚ × ℚ)
  | 0 => #[]
  | n + 1 =>
    let previous := momentCache P a b ea eb v₀ v₁ n
    previous.push (match n with
      | 0 => v₀
      | 1 => v₁
      | k + 2 => momentStep P a b ea eb (previous[k]?.getD (0, 0)) k)

def fastMomentCache (P n : Nat) (a b : ℚ) (size : Nat) : Array (ℚ × ℚ) :=
  momentCache P a b (expNegEnclosure P n (a ^ 2)) (expNegEnclosure P n (b ^ 2))
    (radialEnclosure P n a b 0) (radialEnclosure P n a b 1) size

def hermiteCoefficient (p q k : Nat) : ℚ :=
  (-1 : ℚ) ^ k * (choose p k : ℚ) * (descending q k : ℚ)

def hermiteFromCache (p q : Nat) (moments : Array (ℚ × ℚ)) : ℚ × ℚ :=
  let term := fun k ↦ moments[p - k + (q - k)]?.getD (0, 0)
  (((List.range (p + 1)).map (fun k ↦
      let c := hermiteCoefficient p q k
      c * if 0 ≤ c then (term k).1 else (term k).2)).sum,
    ((List.range (p + 1)).map (fun k ↦
      let c := hermiteCoefficient p q k
      c * if 0 ≤ c then (term k).2 else (term k).1)).sum)

def normalization (P p q : Nat) : GrotheQuad.Ival :=
  GrotheQuad.sqrtI P (GrotheQuad.ratI P 1 (factorial p * factorial q))

def rationalBoundsFloat (P : Nat) (l u : ℚ) : GrotheQuad.Ival :=
  GrotheQuad.ofFixed P (Rat.floor (l * 2 ^ P)) (-Rat.floor (-(u * 2 ^ P)))

def fixedI (a : GrotheQuad.Ival) : GrotheKernel.Ival :=
  ⟨GrotheQuad.toFixedLo GrotheKernel.K a, GrotheQuad.toFixedHi GrotheKernel.K a⟩

def normalizedFromCache (P p q : Nat) (moments : Array (ℚ × ℚ)) : GrotheKernel.Ival :=
  let v := hermiteFromCache p q moments
  fixedI (GrotheQuad.mulI P (normalization P p q) (rationalBoundsFloat P v.1 v.2))

/-- Share the integer Hermite coefficients across every radial cell. -/
def hermiteCoefficients (p q : Nat) : Array ℚ :=
  Array.ofFn fun k : Fin (p + 1) ↦ hermiteCoefficient p q k

def hermiteWithCoefficients (p q : Nat) (coefficients : Array ℚ)
    (moments : Array (ℚ × ℚ)) : ℚ × ℚ :=
  let term := fun k ↦ moments[p - k + (q - k)]?.getD (0, 0)
  (((List.range (p + 1)).map (fun k ↦
      let c := coefficients[k]?.getD 0
      c * if 0 ≤ c then (term k).1 else (term k).2)).sum,
    ((List.range (p + 1)).map (fun k ↦
      let c := coefficients[k]?.getD 0
      c * if 0 ≤ c then (term k).2 else (term k).1)).sum)

/-- One complete radial row; factorials, coefficients, and square roots are computed once. -/
def radialRow (P p q : Nat) (moments : Array (Array (ℚ × ℚ))) : Array GrotheKernel.Ival :=
  let coefficients := hermiteCoefficients p q
  let norm := normalization P p q
  moments.map fun cell ↦
    let v := hermiteWithCoefficients p q coefficients cell
    fixedI (GrotheQuad.mulI P norm (rationalBoundsFloat P v.1 v.2))

/-! ### Exact integer-scaled moment grid and Hermite rows

The definitions below compute the exact same intervals as `fastMomentCache` and `radialRow` on
the `128`-cell grid on `[0, 6]`, avoiding rational GCD overhead inside the inner loops. -/

def padd2 (x y : ℚ) : List ℚ → List ℚ
  | [] => [x, y]
  | [u] => [x + u, y]
  | u :: v :: rest => (x + u) :: (y + v) :: rest

def pmulQuad (b d : ℚ) : List ℚ → List ℚ
  | [] => []
  | a :: p => 0 :: padd2 (a * b) (a * d) (pmulQuad b d p)

def expPolyQuad (b d : ℚ) : Nat → List ℚ × List ℚ
  | 0 => ([], [1])
  | n + 1 =>
    let r := expPolyQuad b d n
    (padd r.1 r.2, psmul (1 / (n + 1 : ℚ)) (pmulQuad b d r.2))

def sqEnclInt (twoP : Int) : Nat → Int × Int → Int × Int
  | 0, e => e
  | k + 1, e =>
    let f := sqEnclInt twoP k e
    (Int.fdiv (f.1 * f.1) twoP, -(Int.fdiv (-(f.2 * f.2)) twoP))

def expNegInt (n : Nat) (twoP : Int) (x : ℚ) : Int × Int :=
  let y := x / 1024
  let T := (expTay (-y) n).1
  let E := expRem y n
  let lo0 := max 0 (Rat.floor ((T - E) * twoP))
  let hi0 := -(Rat.floor (-((T + E) * twoP)))
  sqEnclInt twoP 10 (lo0, hi0)

def pintLoop (p : List ℚ) (d : Nat) (negH h negHPow hPow acc : ℚ) : ℚ :=
  match p with
  | [] => acc
  | a :: rest =>
    let nextNeg := negHPow * negH
    let nextPos := hPow * h
    pintLoop rest (d + 1) negH h nextNeg nextPos (acc + a * (nextPos - nextNeg) / (d + 1 : ℚ))

def momentStepLoop (aN bN : Int) (ea eb : Int × Int) :
    Nat → Nat → Int → Int → Int → Int → Array (Int × Int) → Array (Int × Int)
  | 0, _, _, _, _, _, acc => acc
  | rem + 1, k, aPow, bPow, denom, halfDenom, acc =>
    let prev := acc.getD (k - 2) (0, 0)
    let m : Int := k
    let numLo := m * prev.1 * halfDenom + aPow * ea.1 - bPow * eb.2
    let numHi := m * prev.2 * halfDenom + aPow * ea.2 - bPow * eb.1
    let lo := Int.fdiv numLo denom
    let hi := -(Int.fdiv (-numHi) denom)
    momentStepLoop aN bN ea eb rem (k + 1)
      (aPow * aN) (bPow * bN) (denom * 64) (halfDenom * 64) (acc.push (lo, hi))

def fastMomentCellInt (n size i : Nat) (twoP : Int) : Array (Int × Int) :=
  let aN : Int := 3 * i
  let bN : Int := 3 * (i + 1)
  let a : ℚ := (aN : ℚ) / 64
  let b : ℚ := (bN : ℚ) / 64
  let c : ℚ := (a + b) / 2
  let h : ℚ := (b - a) / 2
  let S := (expPolyQuad (-2 * c) (-1) n).1
  let X := expNegInt n twoP (c ^ 2)
  let eRem := expRem (2 * c * h + h ^ 2) n
  let p0 := pintLoop S 0 (-h) h 1 1 0
  let p1 := pintLoop S 1 (-h) h (-h) h 0
  let p2 := pintLoop S 2 (-h) h (h * h) (h * h) 0
  let base0 := 2 * (c * p0 + p1)
  let err0 := eRem * (2 * (b ^ 2 - a ^ 2) / 2)
  let lo0 := base0 - err0
  let hi0 := base0 + err0
  let v0Lo := Rat.floor (if 0 ≤ lo0 then (X.1 : ℚ) * lo0 else (X.2 : ℚ) * lo0)
  let v0Hi := -(Rat.floor (-(if 0 ≤ hi0 then (X.2 : ℚ) * hi0 else (X.1 : ℚ) * hi0)))
  let base1 := 2 * (c ^ 2 * p0 + 2 * c * p1 + p2)
  let err1 := eRem * (2 * (b ^ 3 - a ^ 3) / 3)
  let lo1 := base1 - err1
  let hi1 := base1 + err1
  let v1Lo := Rat.floor (if 0 ≤ lo1 then (X.1 : ℚ) * lo1 else (X.2 : ℚ) * lo1)
  let v1Hi := -(Rat.floor (-(if 0 ≤ hi1 then (X.2 : ℚ) * hi1 else (X.1 : ℚ) * hi1)))
  let ea := expNegInt n twoP (a ^ 2)
  let eb := expNegInt n twoP (b ^ 2)
  match size with
  | 0 => #[]
  | 1 => #[(v0Lo, v0Hi)]
  | m + 2 =>
    let init := ((Array.mkEmpty size).push (v0Lo, v0Hi)).push (v1Lo, v1Hi)
    momentStepLoop aN bN ea eb m 2 (aN * aN) (bN * bN) (64 * 64) (64 * 32) init

def momentsInt (P n N size : Nat) : Array (Array (Int × Int)) :=
  let twoP : Int := (2 : Int) ^ P
  Array.ofFn fun i : Fin N ↦ fastMomentCellInt n size i.val twoP

def hermiteCoeffsIntAux (p q : Nat) : Nat → Nat → Int → Array Int → Array Int
  | 0, _, _, acc => acc
  | rem + 1, k, cur, acc =>
    let next := -(cur * (p - k) * (q - k)) / (k + 1 : Int)
    hermiteCoeffsIntAux p q rem (k + 1) next (acc.push next)

def hermiteCoeffsInt (p q : Nat) : Array Int :=
  let m := min p q
  hermiteCoeffsIntAux p q m 0 1 ((Array.mkEmpty (m + 1)).push 1)

def hermiteCellIntAux (coeffs : Array Int) (cell : Array (Int × Int)) (pq : Nat) :
    Nat → Int → Int → Int × Int
  | 0, lo, hi => (lo, hi)
  | k + 1, lo, hi =>
    let c := coeffs.getD k 0
    let t := cell.getD (pq - 2 * k) (0, 0)
    if 0 ≤ c then
      hermiteCellIntAux coeffs cell pq k (lo + c * t.1) (hi + c * t.2)
    else
      hermiteCellIntAux coeffs cell pq k (lo + c * t.2) (hi + c * t.1)

def radialRowInt (P p q : Nat) (gridInt : Array (Array (Int × Int))) : Array GrotheKernel.Ival :=
  let coeffs := hermiteCoeffsInt p q
  let m := coeffs.size
  let pq := p + q
  let norm := normalization P p q
  gridInt.map fun cell ↦
    let v := hermiteCellIntAux coeffs cell pq m 0 0
    fixedI (GrotheQuad.mulI P norm (GrotheQuad.ofFixed P v.1 v.2))

end Grothe.UpperReplacement.RadialCompute
