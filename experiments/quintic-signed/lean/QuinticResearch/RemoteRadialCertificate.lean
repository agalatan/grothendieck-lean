import Mathlib.Data.Rat.Defs
import Mathlib.Data.Nat.Choose.Basic
import Mathlib.Data.Nat.Factorial.Basic

/-! Rational chord and integrated-price checks for the six fresh Gaussian sectors.
The chords are affine in squared radius. The exponents use two rational brackets
and repeated directed squaring. Agent-ID: codex-a7c4 -/
namespace Grothe.LowerAnalytic.RemoteRadial

abbrev Pol := List ℚ

def nu : ℚ := 47/2000
def beta : ℚ := 191/250+nu
def muLower : ℚ := 4431/5000

def sumTo (n : ℕ) (f : ℕ → ℚ) : ℚ := (List.range n).foldl (fun value i => value+f i) 0

def coeff (p : Pol) (k : ℕ) : ℚ := (p[k]?).getD 0

def eval (p : Pol) (x : ℚ) : ℚ := p.foldr (fun a value => a+x*value) 0

def add (p q : Pol) : Pol := (List.range (max p.length q.length)).map (fun i => coeff p i+coeff q i)

def times (p q : Pol) : Pol :=
  (List.range (p.length+q.length-1)).map (fun i => sumTo (i+1) (fun k => coeff p k*coeff q (i-k)))

def scale (a : ℚ) (p : Pol) : Pol := p.map (a*·)

/-- Denominator $2ν+s μr p_d(r²)$, with a downward rational approximation to μ. -/
def denominator (s d : ℚ) : Pol :=
  [2*nu, s*muLower*(1-nu-beta/2-3*d/8),0,s*muLower*(beta/4+3*d/8),0,-s*muLower*d/16]

def edge (i : ℕ) : ℚ := 6*(i/32:ℚ)^2

def ordinate (s r : ℚ) : ℚ := (min (eval (denominator s 0) r) (eval (denominator s nu) r))⁻¹

/-- The intercept and slope of the price in the variable $t=r²$. -/
def chord (s left right : ℚ) : ℚ × ℚ :=
  let l := ordinate s left
  let slope := (ordinate s right-l)/(right^2-left^2)
  (l-slope*left^2,slope)

def shifted (p : Pol) (left right : ℚ) (k : ℕ) : ℚ :=
  (right-left)^k*sumTo (p.length-k) (fun j => coeff p (j+k)*(Nat.choose (j+k) k:ℚ)*left^j)

def bernstein (p : Pol) (left right : ℚ) (i : ℕ) : ℚ :=
  sumTo (i+1) (fun k => shifted p left right k*(Nat.choose i k:ℚ)/(Nat.choose (p.length-1) k:ℚ))

def chordOK (i : ℕ) : Bool :=
  let l := edge i
  let r := edge (i+1)
  ([1,2] : List ℚ).all fun s =>
    let c := chord s l r
    ([0,nu] : List ℚ).all fun d =>
      let p := add (times [c.1,0,c.2] (denominator s d)) [-1]
      (List.range p.length).all fun k => decide (0 ≤ bernstein p l r k)

def precision : ℚ := 2^100

def roundLo (x : ℚ) : ℚ := ((x*precision).floor:ℚ)/precision

def roundHi (x : ℚ) : ℚ := -roundLo (-x)

def squareBounds (x : ℚ × ℚ) : ℚ × ℚ := (roundLo (x.1^2),roundHi (x.2^2))

/-- $(1-t/2³²)^{2³²}≤e^{-t}≤(1+t/2³²)^{-2³²}$ on the grid. -/
def expBounds (t : ℚ) : ℚ × ℚ :=
  let y := t/(2^32:ℚ)
  (List.range 32).foldl (fun x _ => squareBounds x) (roundLo (1-y),roundHi ((1+y)⁻¹))

def primitive (p : Pol) : Pol := (List.range p.length).map fun k =>
  sumTo (p.length-k) (fun j => coeff p (j+k)*(Nat.factorial (j+k):ℚ)/(Nat.factorial k:ℚ))

def integralUpper (p : Pol) (s : ℚ) (i : ℕ) : ℚ :=
  let a := edge i
  let b := edge (i+1)
  let c := chord s a b
  let anti := primitive (times p [c.1,c.2])
  let l := eval anti (a^2)
  let r := eval anti (b^2)
  let el := expBounds (a^2)
  let er := expBounds (b^2)
  max (el.1*l) (el.2*l)-min (er.1*r) (er.2*r)

/-- The finite Gaussian-mode price; $j=5$ prices the conjugate pair jointly. -/
def numerator (j : ℕ) : Pol :=
  let term (a : ℚ) (k : ℕ) (p : Pol) := (List.replicate k 0) ++ scale a (times p p)
  match j with
  | 0 => add (term (beta/2) 1 [-2,1]) (term (nu/12) 1 [6,-6,1])
  | 1 => add (term (beta/2) 2 [1]) (term (nu/6) 2 [-3,1])
  | 2 => add (term beta 0 [-13/20,1]) (term (nu/4) 0 [2,-4,1])
  | 3 => add (term beta 1 [1]) (term (nu/2) 1 [-2,1])
  | 4 => add [41/100] (term nu 0 [-1,1])
  | _ => add [21/40] (add (term nu 0 [-1,1]) (term (nu/2) 2 [1]))

/-- Upper round after each integration step to keep the finite sum small. -/
def cellCash (i j : ℕ) : ℤ :=
  let p := numerator j
  let ordinary := integralUpper p 1 i
  let price := if j=5 then (ordinary+integralUpper p 2 i)/2 else ordinary
  (price*(10^12:ℚ)).ceil

/-- The tail of every unweighted numerator is at most the Exp(1) fifth-moment
 tail after 36, divided by $2ν$. $10^{-6}$ suffices. -/
def totalPrice (j : ℕ) : ℚ :=
  let raw := (List.range 32).foldl (fun (z : ℤ) i => z+cellCash i j) 0
  (raw:ℚ)/10^12+1/10^6+(if j=2 then beta*(7/20)^2/(1-nu) else 0)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem allChords : (List.range 32).all chordOK = true := by decide +kernel

theorem allPrices : (List.range 6).all (fun j => decide (totalPrice j < 1)) = true := by decide +kernel

end Grothe.LowerAnalytic.RemoteRadial
