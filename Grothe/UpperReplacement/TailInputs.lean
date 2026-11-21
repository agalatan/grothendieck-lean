import Grothe.UpperReplacement.CertificateInputs
import Grothe.UpperReplacement.CircleWide

set_option warningAsError true

/-!
# Separate contours and exact tail ceilings

Agent-ID: codex-a7c4, gemini-1aa9. The first contour is widened to `1.033`. Every tail ceiling is
checked by a rational squared inequality, without a lower bound for an individual linear
coefficient. Analyticity on the open disc uses the 1D quarter-circle tube cover (extended by
symmetry and the maximum modulus principle), and the circle mean uses the cancellation-free Schur
bound with Lipschitz polynomial enclosures.
-/

namespace Grothe.UpperReplacement.TailInputs

open Certificate CircleCheck GrotheKernel GrotheKernel.HardyArc

def channelAt (i : Fin 18) : Channel := channels.get (Fin.cast (by decide) i)

def radius (i : Fin 18) : Rat := if i.val = 0 then 1033 / 1000 else (channelAt i).radius

def budget (i : Fin 18) : Rat :=
  if i.val = 0 then 7 / 5 else if i.val = 7 then 13 / 10 else if i.val = 15 then 2 else 3

def secondary (c : Channel) : List Rat :=
  match c.kind with
  | .gt => c.auxiliary
  | .phase => []
  | .tiger => c.primary

def smoothing (i : Fin 18) : SR :=
  if (channelAt i).kind = .gt then gtSmoothingM else identityM

def covariance (i : Fin 18) : RData :=
  let c := channelAt i
  if c.kind = .gt then gtRData c.primary (secondary c)
  else unsmoothedRData c.primary (secondary c)

def tolerance (i : Fin 18) : Int :=
  if i.val = 0 then D * D / 30000
  else if i.val = 7 then D * D / 50000
  else if i.val = 12 then D * D / 4000
  else D * D / 2000

def tail (i : Fin 18) : Rat :=
  (match i.val with
  | 0 => 274029735
  | 1 => 1810397513
  | 2 => 48113641
  | 7 => 31672276
  | 15 => 1
  | _ => 296364536962) / 10 ^ 15

def cellTruncationTail : Rat := 889685 / 10 ^ 15

def analyticChecks (i : Fin 18) : Bool :=
  let c := channelAt i
  tubeQuarterOK (smoothing i) c.primary (secondary c) (radius i + 1 / 100000) 18 &&
    CircleWide.quarterMeanOK (smoothing i) c.primary (secondary c)
      (radius i) c.schur (budget i) 20 (tolerance i)

def numericalChecks : Bool :=
  (List.finRange 18).all (fun i ↦
    decide (1 < radius i ∧ radius i + 1 / 100000 ≤ 2 ∧ 0 ≤ budget i ∧ 0 ≤ tail i ∧
      budget i * (radius i)⁻¹ ^ 1006 ≤ tail i ^ 2 * (1 - (radius i)⁻¹ ^ 4))) &&
  decide (((List.finRange 18).map fun i ↦ (channelAt i).weight * tail i).sum ≤ 257 / 10 ^ 9) &&
  decide (0 ≤ cellTruncationTail ∧
    (2 : Rat) * (109 / 100 : Rat)⁻¹ ^ 506 ≤
      cellTruncationTail ^ 2 * (1 - (109 / 100 : Rat)⁻¹ ^ 4))

end Grothe.UpperReplacement.TailInputs
