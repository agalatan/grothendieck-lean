import GrotheQuadExtKernel.Twist

/-!
# The phase polynomial at a node

`Sphase(U, V, W) = Σ_t C_t U^i V^j W^k` (`Grothe/Upper/Data.lean`: `phaseStrs`, 1,140 monomials of
total degree ≤ 17, `C_t = num/den`; the file `data/quad-checker/phase.txt`, one `i j k num den` per
line, is generated from it by `tools/quad_gen_phase.py`).  At the node `z = r = √s` the phase is
`φ(r, w) = D e^{−ε(s + |w|²)} Sphase(s, |w|², r Re w)` with `D = r Im w`, so

    (iφ)^j = e^{−jεs} e^{−jε|w|²} Q_r(w)^j,
    Q_r(w) = (r/2)(w − w̄) · Σ_t C_t s^i (w w̄)^j ((r/2)(w + w̄))^k

(`i Im w = (w − w̄)/2`).  The node scalars `P_{jk}(s) (r/2)^k = Σ_i C_{ijk} s^i (r/2)^k` are the
coefficients of the operator rows of `Twist.applyQ`; the Gaussian exponent `λ_j = 1 + jε = (20 + 21j)/20`
is the dilation parameter.

Agent-ID: claude-b9ee. Refs #41, #313.
-/

namespace GrotheQuad

/-- A phase monomial `C U^i V^j W^k`, `C = num / den`. -/
structure PhaseTerm where
  i : Nat
  j : Nat
  k : Nat
  num : Int
  den : Nat
  deriving Repr, Inhabited

/-- `ε = 21/20`. -/
def phaseEpsI (P : Nat) : Ival := ratI P 21 20

/-- `λ_j = 1 + jε = (20 + 21 j)/20`. -/
def lamI (P j : Nat) : Ival := ratI P (20 + 21 * j) 20

/-- `P_{j'k}(s) = Σ_{t : (j, k) = (j', k)} C_t s^i` from the power table of `s`. -/
def phaseRowCoeff (P : Nat) (terms : Array PhaseTerm) (sPow : Array Ival) (j' k : Nat) : Ival :=
  terms.foldl (fun acc t =>
    if t.j == j' && t.k == k then addI P acc (mulI P (ratI P t.num t.den) (sPow.getD t.i zeroI))
    else acc) zeroI

/-- The node scalars `coefs[j'][k] ∋ P_{j'k}(s) (r/2)^k` for `j' + k ≤ 17`, at the scale
`2^KTw` (`r ∋ √s`). -/
def nodeCoefs (P : Nat) (terms : Array PhaseTerm) (s r : Ival) : Array (Array (Int × Int)) :=
  let sPow := powTable P s 17
  let hPow := powTable P (divN P 2 r) 17
  Array.ofFn fun j' : Fin 18 => Array.ofFn fun k : Fin (18 - j'.val) =>
    toTw (mulI P (phaseRowCoeff P terms sPow j'.val k.val) (hPow.getD k.val zeroI))

/-- `e^{−jεs} = (e^{−s})^j · e^{−js/20}` (the series of `expNegI` is used below its tail threshold:
`s < 402` and `js/20 < 402`). -/
def expAlphaI (P j : Nat) (s : Ival) : Ival :=
  mulI P (powI P (expNegI P 400 s) j) (expNegI P 400 (divN P 20 (mulN P j s)))

/-- The validity of the two exponentials of `expAlphaI`. -/
def expAlphaValid (P j : Nat) (s : Ival) : Bool :=
  expPosValid P 400 s && isPos (expPosI P 400 s) &&
    expPosValid P 400 (divN P 20 (mulN P j s)) && isPos (expPosI P 400 (divN P 20 (mulN P j s)))

end GrotheQuad
