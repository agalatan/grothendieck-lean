import GrotheQuadKernel.Seed

/-!
# The frozen profile and the shift

`vprof s = Σ_{j < 12} x_j · L_j^{(−1/2)}(s) / nrmHalf j` with `nrmHalf j = √(√π (2j)!/(4^j (j!)²))`
(`Grothe/Upper/Data.lean`: `profileQ`, `aQ`; `Grothe/UpperChaos/Rounder.lean`: `vprof`,
`lagHalf`, `binHalf`, `nrmHalf`), evaluated exactly as master defines it:
`lagHalf j s = Σ_{k ≤ j} (−1)^k binHalf j k s^k / k!`, `binHalf j k = Π_{i < j−k} (k+½+i)/(i+1)`
(a rational).  The scaled profile is `κ · vprof s` with `κ = √(1 + a²)`
(`F0ConditionalEvaluator.profileScale s = κ |vprof s|`), the shift is
`profileShift s = √s / (κ |vprof s|)` and the sign `profileSign s = −1` iff `vprof s < 0`.

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace GrotheQuad

/-- `binHalf j k = Π_{i < j−k} (k + ½ + i)/(i + 1) = Π_{i < j−k} (2k+1+2i)/(2(i+1))` as a
rational `(num, den)`. -/
def binHalfRat (j k : Nat) : Int × Nat :=
  (List.range (j - k)).foldl (fun p i => (p.1 * ((2 * k + 1 + 2 * i : Nat) : Int), p.2 * (2 * (i + 1)))) (1, 1)

/-- One term `(−1)^k · binHalf j k · s^k / k!`. -/
def lagHalfTerm (P : Nat) (j k : Nat) (s : Ival) : Ival :=
  let b := binHalfRat j k
  let t := divN P (factNat k) (mulI P (ratI P b.1 b.2) (powI P s k))
  if k % 2 == 1 then negI t else t

/-- `L_j^{(−1/2)}(s) = Σ_{k ≤ j} (−1)^k binHalf j k s^k / k!`. -/
def lagHalfI (P : Nat) (j : Nat) (s : Ival) : Ival :=
  sumRangeI P (j + 1) fun k => lagHalfTerm P j k s

/-- `nrmHalf j = √(√π · (2j)! / (4^j (j!)²))`. -/
def nrmHalfI (P : Nat) (sqrtPi : Ival) (j : Nat) : Ival :=
  sqrtI P (mulI P sqrtPi (divN P (4 ^ j * (factNat j) ^ 2) (ofNat P (factNat (2 * j)))))

/-- The profile coefficients as rationals `(num, den)`. -/
structure ProfileData where
  coeffs : Array (Int × Nat)
  aN : Int
  aD : Nat
  deriving Repr, Inhabited

/-- One term `x_j · L_j^{(−1/2)}(s) / nrmHalf j`. -/
def vprofTerm (P : Nat) (piI : Ival) (pd : ProfileData) (s : Ival) (j : Nat) : Ival :=
  divI P (mulI P (ratI P (pd.coeffs.getD j (0, 1)).1 (pd.coeffs.getD j (0, 1)).2) (lagHalfI P j s))
    (nrmHalfI P (sqrtI P piI) j)

/-- `vprof s`. -/
def vprofI (P : Nat) (piI : Ival) (pd : ProfileData) (s : Ival) : Ival :=
  sumRangeI P pd.coeffs.size fun j => vprofTerm P piI pd s j

/-- `κ = √(1 + a²)`. -/
def kappaI (P : Nat) (pd : ProfileData) : Ival :=
  sqrtI P (addI P (ofInt P 1) (sqI P (ratI P pd.aN pd.aD)))

/-- The scaled profile `κ · vprof s`. -/
def scaledProfileI (P : Nat) (piI : Ival) (pd : ProfileData) (s : Ival) : Ival :=
  mulI P (kappaI P pd) (vprofI P piI pd s)

/-- The scaled profile, the sign (`true` = negative) and the shift `√s / |κ vprof s|`; `none` if
the sign is not decided by the enclosure. -/
def profileShiftI (P : Nat) (piI : Ival) (pd : ProfileData) (s : Ival) :
    Option (Ival × Bool × Ival) :=
  if isPos (scaledProfileI P piI pd s) then
    some (scaledProfileI P piI pd s, false, divI P (sqrtI P s) (scaledProfileI P piI pd s))
  else if isNeg (scaledProfileI P piI pd s) then
    some (scaledProfileI P piI pd s, true, divI P (sqrtI P s) (negI (scaledProfileI P piI pd s)))
  else none

end GrotheQuad
