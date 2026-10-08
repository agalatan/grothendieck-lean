import Grothe.Upper.Assembly
import Grothe.Upper.Value

/-!
# `K_G^ℂ < 1.404896257347`

The interval checker certifies `FiniteCertificate Dlo` with `Dlo ≥ DloNeeded`
(`Grothe/Upper/Value.lean`), and the analytic assembly turns that into the bound.  The only
remaining hypotheses are the analytic and quadrature inputs of the construction, listed in the
theorem statement.
-/

namespace Grothe

open Finset Upper
open scoped ComplexConjugate

/-- **Main theorem.**  Conditional on: domination of Haagerup's kernel, the analytic
description of the two origin kernels (domination, truncated coefficient integrals within
`e⁻¹⁸` of the boxed ones, polarized first-order tail energies), box containment of the
truncated coefficient integrals, and the Cauchy tails of the nine analytically continued scalar
branches. -/
theorem complex_grothendieck_upper
    (hh : DominatedKernel (radialKernel h))
    {H : ℕ → ℝ} {A B : ℕ → ℂ}
    (hH : OriginKernel H A B (999511 / 10 ^ 6) 0.0035203939734987528839
      0.0000182773096480245802715 0.0035186722940462150571)
    (hA : InBox aReLo aReHi aImLo aImHi A) (hB : InBox bReLo bReHi bImLo bImHi B)
    {Hs : ℕ → ℝ} {A' B' : ℕ → ℂ}
    (hHs : OriginKernel Hs A' B' 1 0.0048623361335078433465 0.0000444870768551502459631
      0.0048623361335204498121)
    (hA' : InBox asReLo asReHi asImLo asImHi A') (hB' : InBox bsReLo bsReHi bsImLo bsImHi B')
    (hcauchy : ∀ i r, tag i = .cauchy r →
      ∑' n, |compose h (polyOf i) (n + cutoff)| ≤ cauchyTail r) :
    IsGrothendieckBound (1404896257347 / 10 ^ 12) :=
  grothendieck_of_slope Dlo dlo_ge_needed finite_certificate hh hH hA hB hHs hA' hB' hcauchy

end Grothe
