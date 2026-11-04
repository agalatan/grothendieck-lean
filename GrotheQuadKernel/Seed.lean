import GrotheQuadKernel.Basic

/-!
# `π`, the seed `J₀(A²)`, the common scalar `S(A)` and the moment ratios

* `π` by Machin's formula `π = 16 arctan(1/5) − 4 arctan(1/239)` with the alternating series
  of `arctan(1/n)` (tail bounded by the next term).
* `J₀(x) = (4/π) ∫₀^{π/2} cos²t · e^{−x sin²t} dt = (2/π) ∫₀¹ t^{−1/2} (1−t)^{1/2} e^{−xt} dt`
  (`OriginalPositiveMoment.moment 0 x` on master), two enclosures (obligation S2 of #303):
  - the series `Σ_{n ≥ 0} (−x)ⁿ (2n)! / (4ⁿ (n!)³ (n+1))` (`₁F₁(½; 2; −x)`) with
    `|t_{n+1}/t_n| ≤ x/(n+2)`, tail after `N` at most `|t_{N+1}| / (1 − x/(N+3))` (`x < N + 3`);
    used for `x ≤ 300` (cancellation costs about `x·log₂e` bits);
  - the Watson form for large `x`: `(1−t)^{1/2} = Σ_{n ≤ N} c_n tⁿ + R_N(t)` with
    `c_0 = 1`, `c_{n+1} = c_n (n − ½)/(n + 1)` (all `c_n < 0` for `n ≥ 1`, `Σ_{n≥1} |c_n| = 1`),
    so `|R_N(t)| ≤ t^{N+1}` on `[0, 1]`; `∫₀¹ t^{n−1/2} e^{−xt} dt = Γ(n+½)/x^{n+½} − T_n(x)` with
    `0 ≤ T_n(x) = ∫₁^∞ t^{n−1/2} e^{−xt} dt`; for `x ≥ 2N + 2` the function `t^{n−1/2} e^{−xt/2}`
    is decreasing on `[1, ∞)` for every `n ≤ N`, so `T_n ≤ e^{−x/2} ∫₁^∞ e^{−xt/2} dt = (2/x) e^{−x}`
    and, with `Σ_{n ≤ N} |c_n| ≤ 2`, `Σ_n |c_n| T_n ≤ T^* := (4/x) e^{−x} ≤ (4/x) e^{−x/2}`.
    `J₀(x) = (2/π) Σ_{n≤N} c_n Γ(n+½) x^{−n−½} + E`,
    `|E| ≤ (2/π)[Γ(N+3/2) x^{−N−3/2} + T_N^*]`, and `Γ(n+½) = √π (2n)!/(4ⁿ n!)`.
* The common scalar `S(A) = (√π/2) · A · J₀(A²)` (`ConditionalSeedNormalization.seedScalar`).
* The moment ratios `r_h = J_{h+1}(x)/J_h(x) = (h+½)/(h+2+x−x·r_{h+1}) ∈ [0, 1]` by the backward
  recurrence from `r_H ∈ [0, 1]` (`PositiveRatio.backward`, obligation S3).

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace GrotheQuad

/-- `arctan(1/n)` by its alternating series through `N` terms, tail ≤ the next term. -/
def arctanInvI (P N : Nat) (n : Nat) : Ival :=
  let x := divN P n (ofInt P 1)
  let x2 := sqI P x
  let rec loop : Nat → Nat → Ival → Ival → Ival × Ival
    | 0, _, t, s => (s, t)
    | fuel + 1, k, t, s =>
      -- term_k = (−1)^k x^{2k+1}/(2k+1); here `t` carries the power x^{2k+1}
      let s' := if k % 2 == 0 then addI P s (divN P (2 * k + 1) t) else subI P s (divN P (2 * k + 1) t)
      loop fuel (k + 1) (mulI P t x2) s'
  let (s, tN) := loop N 0 x zeroI
  widen P s (divN P (2 * N + 1) (absUpper tN))

/-- `π` by Machin's formula; `N` terms of each series (`N = 200` gives about 280 bits from
`arctan(1/5)`, i.e. use `N ≥ P / 1.4` for `P` bits). -/
def piMachinI (P N : Nat) : Ival :=
  subI P (mulN P 16 (arctanInvI P N 5)) (mulN P 4 (arctanInvI P N 239))

/-- `J₀(x)` for `x ∈ xI ⊆ [0, ∞)` by the series through `n ≤ N` plus the geometric tail bound. -/
def seedJ0SeriesI (P N : Nat) (xI : Ival) : Ival :=
  let x : Ival := ⟨max xI.lo 0, max xI.hi 0, xI.e⟩
  let negx := negI x
  let rec loop : Nat → Nat → Ival → Ival → Ival × Ival
    | 0, _, t, s => (s, t)
    | fuel + 1, n, t, s =>
      let t' := divN P (2 * (n + 1) * (n + 2)) (mulN P (2 * n + 1) (mulI P t negx))
      loop fuel (n + 1) t' (addI P s t')
  let (s, tN) := loop N 0 (ofInt P 1) (ofInt P 1)
  let tNext := divN P (2 * (N + 1) * (N + 2)) (mulN P (2 * N + 1) (mulI P tN negx))
  let den := subI P (ofNat P (N + 3)) x
  if !(isPos den) then hugeI P
  else widen P s (divI P (mulN P (N + 3) (absUpper tNext)) den)

/-- `J₀(x)` for large `x ∈ xI` (`x ≥ 2N + 2` required, else `hugeI`) by the Watson form with
`N` terms: `(2/√π) x^{−1/2} Σ_{n ≤ N} c_n (2n)!/(4ⁿ n!) x^{−n}` plus the error bound. -/
def seedJ0AsymI (P N : Nat) (piI xI : Ival) : Ival :=
  if !(gtNat xI (2 * N + 2)) then hugeI P
  else
    let x := xI
    let invx := invI P x
    -- Σ_{n ≤ N} c_n g_n x^{−n}, c_0 = 1, c_{n+1} = c_n (2n−1)/(2(n+1)); g_n = (2n)!/(4ⁿ n!),
    -- g_{n+1} = g_n (2n+1)/2.  Combined: a_{n+1} = a_n (2n−1)(2n+1)/(4(n+1)) · x^{−1}.
    let rec loop : Nat → Nat → Ival → Ival → Ival
      | 0, _, _, s => s
      | fuel + 1, n, a, s =>
        -- a is the term a_n x^{−n}; the next uses (2n−1)(2n+1)/(4(n+1)) (negative for n = 0)
        let a' := divN P (4 * (n + 1)) (mulZ P ((2 * (n : Int) - 1) * (2 * (n : Int) + 1)) (mulI P a invx))
        loop fuel (n + 1) a' (addI P s a')
    let sum := loop N 0 (ofInt P 1) (ofInt P 1)
    let sqrtx := sqrtI P x
    let main := divI P (mulN P 2 sum) (mulI P (sqrtI P piI) sqrtx)
    -- error: (2/π)[Γ(N+3/2) x^{−N−3/2} + T*],  Γ(N+3/2) = √π (2N+2)!/(4^{N+1} (N+1)!)
    let gam : Ival := Id.run do
      let mut g := ofInt P 1          -- (2n)!/(4^n n!) at n = 0
      for n in [0:N+1] do
        g := divN P 2 (mulN P (2 * n + 1) g)   -- g_{n+1} = g_n (2n+1)/2
      return mulI P (sqrtI P piI) g
    let e1 := divI P gam (mulI P (powI P x (N + 1)) sqrtx)
    -- T* = 2 e^{−x/2} (2/x) max(1, (2N/x)^N): with x ≥ 2N+2 the max is 1
    -- e^{−x/2} ≤ 2^{−⌊x/2⌋} (since e^{−y} ≤ 2^{−y} for y ≥ 0)
    let halfx := divN P 2 x
    let eNeg : Ival := ⟨0, 1, -(toFixedLo 0 halfx)⟩
    let tStar := mulN P 4 (mulI P eNeg invx)
    let err := divI P (mulN P 2 (addI P e1 tStar)) piI
    widen P main err

/-- `J₀(x)` by the series with 800 terms for `x < 150` (the terms peak near `2^{216}` and
`t_{801} < 10^{−235}`), else by the Watson form with `N = 70` terms (requires `x ≥ 142`; its
error at `x = 150` is below `Γ(71.5)/150^{71.5} < 10^{−54}` and decreases with `x`). -/
def seedJ0I (P : Nat) (piI xI : Ival) : Ival :=
  if ltNat xI 150 then seedJ0SeriesI P 800 xI
  else seedJ0AsymI P 70 piI xI

/-- The common scalar `S(A) = (√π/2) · A · J₀(A²)` for `A ∈ aI`, `π ∈ piI`. -/
def seedScalarI (P : Nat) (piI aI : Ival) : Ival :=
  let j0 := seedJ0I P piI (sqI P aI)
  mulI P (mulI P (divN P 2 (sqrtI P piI)) aI) j0

/-- One backward step `r_h = (h+½) / (h+2+x−x·r_{h+1})` (`PositiveRatio.next`), outward. -/
def ratioNextI (P : Nat) (h : Nat) (xI rNext : Ival) : Ival :=
  let den := addI P (ofNat P (h + 2)) (mulI P xI (subI P (ofInt P 1) rNext))
  divI P (divN P 2 (ofNat P (2 * h + 1))) den

/-- The ratios `r_0, …, r_{H-1}` from the terminal enclosure `r_H ∈ [0, 1]`. -/
def ratiosI (P : Nat) (xI : Ival) (H : Nat) : Array Ival :=
  let unit : Ival := ⟨0, 1, 0⟩
  let rec loop : Nat → Ival → List Ival → List Ival
    | 0, _, acc => acc
    | h + 1, r, acc =>
      let r' := ratioNextI P h xI r
      loop h r' (r' :: acc)
  (loop H unit []).toArray

end GrotheQuad
