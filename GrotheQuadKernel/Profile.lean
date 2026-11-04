import GrotheQuadKernel.Seed

/-!
# The frozen profile and the shift

`vprof s = Σ_{j < 12} x_j · L_j^{(−1/2)}(s) / nrmHalf j` with `nrmHalf j = √(√π (2j)!/(4^j (j!)²))`
(`Grothe/Upper/Data.lean`: `profileQ`, `aQ`; `Grothe/UpperChaos/Rounder.lean`: `vprof`,
`lagHalf`, `nrmHalf`).  The scaled profile is `κ · vprof s` with `κ = √(1 + a²)`
(`F0ConditionalEvaluator.profileScale s = κ |vprof s|`), the shift is
`profileShift s = √s / (κ |vprof s|)` and the sign `profileSign s = −1` iff `vprof s < 0`.

The Laguerre polynomials with `α = −½` satisfy `2(m+1) L_{m+1} = ((4m+1) − 2s) L_m − (2m−1) L_{m−1}`,
`L_0 = 1`, `L_1 = ½ − s`.

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace GrotheQuad

/-- `L_0^{(−1/2)}(s), …, L_M^{(−1/2)}(s)`. -/
def lagHalfRowI (P : Nat) (M : Nat) (s : Ival) : Array Ival := Id.run do
  let mut out : Array Ival := Array.mkEmpty (M + 1)
  let mut lPrev := ofInt P 1
  out := out.push lPrev
  if M == 0 then return out
  let mut lCur := subI P (divN P 2 (ofInt P 1)) s
  out := out.push lCur
  for m in [1:M] do
    let a := subI P (divN P 2 (ofNat P (4 * m + 1))) s
    let lNext := divN P (2 * (m + 1)) (subI P (mulN P 2 (mulI P a lCur)) (mulN P (2 * m - 1) lPrev))
    out := out.push lNext
    lPrev := lCur
    lCur := lNext
  return out

/-- `nrmHalf j = √(√π · (2j)! / (4^j (j!)²))`. -/
def nrmHalfI (P : Nat) (sqrtPi : Ival) (j : Nat) : Ival :=
  let num := factNat (2 * j)
  let den := 4 ^ j * (factNat j) ^ 2
  sqrtI P (mulI P sqrtPi (divN P den (ofNat P num)))

/-- The profile coefficients as rationals `(num, den)`. -/
structure ProfileData where
  coeffs : Array (Int × Nat)
  aN : Int
  aD : Nat
  deriving Repr, Inhabited

/-- `vprof s`. -/
def vprofI (P : Nat) (piI : Ival) (pd : ProfileData) (s : Ival) : Ival :=
  let sqrtPi := sqrtI P piI
  let lag := lagHalfRowI P (pd.coeffs.size - 1) s
  (Array.range pd.coeffs.size).foldl (fun acc j =>
    let (n, d) := pd.coeffs.getD j (0, 1)
    addI P acc (divI P (mulI P (ratI P n d) (lag.getD j zeroI)) (nrmHalfI P sqrtPi j))) zeroI

/-- `κ = √(1 + a²)`. -/
def kappaI (P : Nat) (pd : ProfileData) : Ival :=
  sqrtI P (addI P (ofInt P 1) (sqI P (ratI P pd.aN pd.aD)))

/-- The scaled profile `κ · vprof s`, the sign (`true` = negative) and the shift
`√s / |κ vprof s|`; `none` if the sign is not decided by the enclosure. -/
def shiftI (P : Nat) (piI : Ival) (pd : ProfileData) (s : Ival) : Option (Ival × Bool × Ival) :=
  let v := mulI P (kappaI P pd) (vprofI P piI pd s)
  if isPos v then some (v, false, divI P (sqrtI P s) v)
  else if isNeg v then some (v, true, divI P (sqrtI P s) (negI v))
  else none

end GrotheQuad
