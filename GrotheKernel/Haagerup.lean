import GrotheCapsKernel.Basic

/-!
# Haagerup's kernel composed with a preprocessor: the computable part

Haagerup's phase rounding has the kernel `φ(t) = (π/4) Σ_k r_k t^{2k+1}` with
`r_k = (1/2)_k² / (k! (k+1)!)`, i.e. `r_0 = 1`, `r_{k+1} = r_k (2k+1)² / (4 (k+1)(k+2))`
(`haagList K = [r_0, …, r_{K−1}]`, exact rationals).

For a preprocessor `p(t) = t·P(t²)` the composition truncated to `k < K` has the radial
coefficient polynomial `Σ_{k<K} r_k X^k P^{2k+1} = P · Σ_{k<K} r_k Y^k`, `Y = X P²`, evaluated by
Horner's rule in fixed-point interval arithmetic (`hornerI`, truncated to `M` coefficients).
`haagOK M pl rs s cap` checks that the coefficient `ℓ¹` norm of `P · Horner(rs; Y) − s` (first
`M` coefficients) is at most `cap`.
-/

namespace GrotheKernel

/-- `[r_k, r_{k+1}, …]` (`n` entries) from `r = r_k`. -/
def haagAux : Nat → Nat → Rat → List Rat
  | 0, _, _ => []
  | n + 1, k, r =>
    r :: haagAux n (k + 1) (r * (((2 * k + 1) ^ 2 : Nat) : Rat) / ((4 * (k + 1) * (k + 2) : Nat) : Rat))

/-- `[r_0, …, r_{K−1}]`. -/
def haagList (K : Nat) : List Rat := haagAux K 0 1

/-- Horner's rule `r₀ + Y (r₁ + Y (r₂ + …))`, truncated to `M` coefficients. -/
def hornerI (M : Nat) (Y : List Ival) : List Rat → List Ival
  | [] => []
  | r :: rs => (addL [ofRatI r] (convI Y (hornerI M Y rs))).take M

/-- Scaled upper bound for `Σ_{n<M} |[Xⁿ](P · Horner(rs; X P²) − s)|`. -/
def haagInt (M : Nat) (pl rs : List Rat) (s : Rat) : Int :=
  let PI := pl.map ofRatI
  let Y := zeroI :: convI PI PI
  absSum (addL ((convI PI (hornerI M Y rs)).take M) [negI (ofRatI s)])

/-- **The Haagerup residual check.** -/
def haagOK (M : Nat) (pl rs : List Rat) (s cap : Rat) : Bool :=
  decide (haagInt M pl rs s ≤ ofRatLo cap)

/-- The full finite check: the residual check for `[r_0, …, r_{K−1}]`, and
`r_K (K+1)(2K+1) ≤ γ` (the constant of the tail bound). -/
def haagCheck (M : Nat) (pl : List Rat) (K : Nat) (s cap γ : Rat) : Bool :=
  haagOK M pl (haagList K) s cap &&
    decide ((haagList (K + 1)).getD K 0 * (((K + 1) * (2 * K + 1) : Nat) : Rat) ≤ γ)

end GrotheKernel
