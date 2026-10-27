import GrotheKernel.Haagerup

/-!
# Finite-power Wiener contraction and a weighted Haagerup tail

All arithmetic rounds outwards at the existing fixed-point precision. There
is no floating optimizer or Gaussian integral in this checker.
-/

namespace GrotheKernel

def polyPowI (p : List Ival) : Nat → List Ival
  | 0 => [ofRatI 1]
  | n + 1 => convI p (polyPowI p n)

def powerNormOK (pl : List Rat) (power : Nat) (q : Rat) : Bool :=
  decide (absSum (polyPowI (pl.map ofRatI) power) ≤ ofRatLo q)

def powIval (q : Ival) : Nat → Ival
  | 0 => ofRatI 1
  | n + 1 => mulI q (powIval q n)

/-- Weighted telescoping majorant, with the uncomputed suffix bounded by its
unweighted telescope. Each step retains two original series indices. -/
def telescopeI (k : Nat) (q : Ival) : Nat → Ival
  | 0 => ofRatI (1 / (k : Rat))
  | n + 1 => addI (ofRatI (1 / (k : Rat) - 1 / ((k + 2 : Nat) : Rat)))
      (mulI q (telescopeI (k + 2) q n))

def powerTailI (k n : Nat) (q gamma : Rat) : Ival :=
  mulI (ofRatI (gamma / 2))
    (mulI (powIval (ofRatI q) (k / 2)) (telescopeI k (ofRatI q) n))

def powerTailOK (k n : Nat) (q gamma cap : Rat) : Bool :=
  decide ((powerTailI k n q gamma).hi ≤ ofRatLo cap)

end GrotheKernel
