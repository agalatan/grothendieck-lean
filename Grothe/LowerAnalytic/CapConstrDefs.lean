import Grothe.LowerAnalytic.CapCoverDefs
import Grothe.LowerAnalytic.CapNodeDefs

/-!
# Computable constrained-piece matrix and node checks

The rational S-lemma matrices, encoded-piece parser and Boolean predicates used
by the localised native facts. Their fibre-potential soundness is in `CapConstr`.
-/

open GrotheKernel

namespace Grothe.LowerAnalytic

/-- The coefficients `u = Mᵀ v` of `τ(y) = v·vec(M y) = Σⱼ uⱼ yⱼ`. -/
def Cons.u (Mq : ℕ → ℕ → ℚ) (c : Cons) (j : ℕ) : ℚ :=
  ((List.range 12).map fun i => c.v.getD i 0 * Mq i j).sum

/-- The matrix of `λ (τ − lo)(hi − τ) + μ (τ − lo)` as a form in `(1, y)`. -/
def Cons.sMat (Mq : ℕ → ℕ → ℚ) (c : Cons) (i j : ℕ) : ℚ :=
  let hi := c.hi.getD 0
  let b := (c.lam * (c.lo + hi) + c.mu) / 2
  if i = 0 ∧ j = 0 then -(c.lam * c.lo * hi) - c.mu * c.lo
  else if i = 0 then b * c.u Mq (j - 1)
  else if j = 0 then b * c.u Mq (i - 1)
  else -(c.lam * c.u Mq (i - 1) * c.u Mq (j - 1))

/-- Admissible multipliers: `λ, μ ≥ 0`, and `λ = 0` for a halfspace. -/
def Cons.ok (c : Cons) : Bool :=
  decide (0 ≤ c.lam) && decide (0 ≤ c.mu) && (c.hi.isSome || decide (c.lam = 0))

/-- `N₀ − Σᶜ Sᶜ` for a tabulated matrix `N₀`. -/
def pieceNcOf (Mq : ℕ → ℕ → ℚ) (N0 : QMat) (cs : List Cons) : QMat :=
  QMat.ofFn 13 fun i j => N0.at i j - (cs.map fun c => c.sMat Mq i j).sum

/-- `N − Σᶜ Sᶜ`.  The matrix `N` of the unconstrained check is tabulated once (as an argument of
`pieceNcOf`), not once for each of the `169` entries. -/
def pieceNc (Mq : ℕ → ℕ → ℚ) (av : ℕ → ℚ) (s cap : ℚ) (Tup : QMat) (cs : List Cons) : QMat :=
  pieceNcOf Mq (pieceN Mq av s cap Tup) cs

/-- **The constrained piece check**: enclosure sanity, admissible multipliers, exact `LDLᵀ`. -/
def pieceOKc (lo up : QMat) (Mq : ℕ → ℕ → ℚ) (av : ℕ → ℚ) (s cap : ℚ) (cs : List Cons) : Bool :=
  enclOK lo up 13 && cs.all Cons.ok && ldlOK (pieceNc Mq av s cap (loewnerUp lo up 13) cs) 13

/-- A constraint `k,σ,lo,hi,λ,μ` (`hi = *` for a halfspace) on the direction `σ dₖ`. -/
def parseCons (ds : List (List ℚ)) (s : String) : Cons :=
  match s.splitOn "," with
  | [k, sg, lo, hi, lam, mu] =>
    let d := ds.getD ((k.toNat?).getD 0) []
    ⟨if sg = "-" then d.map Neg.neg else d, parseRat lo,
      if hi = "*" then none else some (parseRat hi), parseRat lam, parseRat mu⟩
  | _ => ⟨[], 1, some 0, 0, 0⟩

/-- A piece `g;recipe;c₁;c₂;…`: grid index, price recipe, constraints. -/
def parsePiece (ds : List (List ℚ)) (s : String) : ℕ × Recipe × List Cons :=
  match s.splitOn ";" with
  | g :: rc :: cs => ((g.toNat?).getD 0, parseRecipe rc, cs.map (parseCons ds))
  | _ => (0, parseRecipe "", [])

/-- The directions `d₀, d₂, d₃` of a node. -/
def parseDirs (l : List String) : List (List ℚ) := l.map fun d => (d.splitOn ",").map parseRat

/-! ### Constrained node checks -/

end Grothe.LowerAnalytic
