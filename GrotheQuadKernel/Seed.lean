import GrotheQuadKernel.Basic

/-!
# The seed `J₀(A²)`, the common scalar `S(A)` and the moment ratios

`J₀(x) = (4/π) ∫₀^{π/2} cos²t · e^{−x sin²t} dt = Σ_{n ≥ 0} (−x)ⁿ (2n)! / (4ⁿ (n!)³ (n+1))`
(`OriginalPositiveMoment.moment 0 x` on master; the series is the Kummer function
`₁F₁(½; 2; −x)`).  Consecutive terms satisfy `t_{n+1}/t_n = −x (2n+1) / (2 (n+1) (n+2))`, so
`|t_{n+1}/t_n| ≤ x/(n+2)` and the tail after `N` is at most `|t_{N+1}| / (1 − x/(N+3))` when
`x < N + 3` (obligation S2 of #303).

The common scalar is `S(A) = (√π/2) · A · J₀(A²)` (`ConditionalSeedNormalization.seedScalar`),
with `π` supplied as a rational enclosure by the consumer (`Real.pi_gt_d20`/`pi_lt_d20`).

The moment ratios `r_h = J_{h+1}(x)/J_h(x)` satisfy `r_h = (h+½) / (h+2+x−x·r_{h+1})` and lie in
`[0, 1]`; the backward recurrence from `r_H ∈ [0, 1]` is `PositiveRatio.backward` on master
(`OriginalPositiveMoment.ratio_backward_enclosure`), here with outward rounding (S3).

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace GrotheQuad

/-- `J₀(x)` for `x ∈ xI ⊆ [0, ∞)` by the series through `n ≤ N` plus the geometric tail bound. -/
def seedJ0I (K N : Nat) (xI : Ival) : Ival :=
  let x : Ival := ⟨max xI.lo 0, max xI.hi 0⟩
  let negx := negI x
  -- t_{n+1} = t_n · (−x) · (2n+1) / (2 (n+1) (n+2))
  let rec loop : Nat → Nat → Ival → Ival → Ival × Ival
    | 0, _, t, s => (s, t)
    | fuel + 1, n, t, s =>
      let t' := divN (2 * (n + 1) * (n + 2)) (mulN (2 * n + 1) (mulI K t negx))
      loop fuel (n + 1) t' (addI s t')
  let (s, tN) := loop N 0 (ofInt K 1) (ofInt K 1)
  let tNext := divN (2 * (N + 1) * (N + 2)) (mulN (2 * N + 1) (mulI K tN negx))
  let den : Int := (N + 3 : Nat) * pow2 K - x.hi
  if den ≤ 0 then ⟨-(pow2 (2 * K)), pow2 (2 * K)⟩
  else
    let tail := cdiv (absUpper tNext * ((N + 3 : Nat) * pow2 K)) den
    widen s tail

/-- The common scalar `S(A) = (√π/2) · A · J₀(A²)` for `A ∈ aI`, `π ∈ piI`. -/
def seedScalarI (K N : Nat) (piI aI : Ival) : Ival :=
  let j0 := seedJ0I K N (sqI K aI)
  mulI K (mulI K (divN 2 (sqrtI K piI)) aI) j0

/-- One backward step `r_h = (h+½) / (h+2+x−x·r_{h+1})` (`PositiveRatio.next`), outward. -/
def ratioNextI (K : Nat) (h : Nat) (xI rNext : Ival) : Ival :=
  let den := addI (ofNat K (h + 2)) (mulI K xI (subI (ofInt K 1) rNext))
  divI K (divN 2 (ofNat K (2 * h + 1))) den

/-- The ratios `r_0, …, r_{H-1}` from the terminal enclosure `r_H ∈ [0, 1]`
(`PositiveRatio.backward x (H - h) h`), as an array indexed by `h`. -/
def ratiosI (K : Nat) (xI : Ival) (H : Nat) : Array Ival :=
  let unit : Ival := ⟨0, pow2 K⟩
  let rec loop : Nat → Ival → List Ival → List Ival
    | 0, _, acc => acc
    | h + 1, r, acc =>
      let r' := ratioNextI K h xI r
      loop h r' (r' :: acc)
  (loop H unit []).toArray

end GrotheQuad
