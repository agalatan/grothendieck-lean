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

end Grothe.UpperReplacement.RadialCompute
