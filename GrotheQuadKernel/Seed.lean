import GrotheQuadKernel.Basic

/-!
# `π`, the seed `J₀(A²)`, the common scalar `S(A)` and the moment ratios

* `π` by Machin's formula `π = 16 arctan(1/5) − 4 arctan(1/239)` with the alternating series
  of `arctan(1/n)` (tail bounded by the next term).
* `J₀(x) = (4/π) ∫₀^{π/2} cos²t · e^{−x sin²t} dt = (2/π) ∫₀¹ t^{−1/2} (1−t)^{1/2} e^{−xt} dt`
  (`OriginalPositiveMoment.moment 0 x` on master), two enclosures (obligation S2 of #303):
  - the series `Σ_{n ≥ 0} (−x)ⁿ (2n)! / (4ⁿ (n!)³ (n+1))` (`₁F₁(½; 2; −x)`) with
    `|t_{n+1}/t_n| ≤ x/(n+2)`, tail after `N` at most `|t_{N+1}| / (1 − x/(N+3))` (`x < N + 3`);
    used for `x < 150` (cancellation costs about `x·log₂e` bits);
  - the Watson form for large `x`: `(1−t)^{1/2} = Σ_{n ≤ N} c_n tⁿ + R_N(t)` with
    `c_0 = 1`, `c_{n+1} = c_n (n − ½)/(n + 1)` (all `c_n < 0` for `n ≥ 1`, `Σ_{n≥1} |c_n| = 1`),
    so `|R_N(t)| ≤ t^{N+1}` on `[0, 1]`; `∫₀¹ t^{n−1/2} e^{−xt} dt = Γ(n+½)/x^{n+½} − T_n(x)` with
    `0 ≤ T_n(x) = ∫₁^∞ t^{n−1/2} e^{−xt} dt`; for `x ≥ 2N + 2` the function `t^{n−1/2} e^{−xt/2}`
    is decreasing on `[1, ∞)` for every `n ≤ N`, so `T_n ≤ e^{−x/2} ∫₁^∞ e^{−xt/2} dt = (2/x) e^{−x}`
    and, with `Σ_{n ≤ N} |c_n| ≤ 2`, `Σ_n |c_n| T_n ≤ T^* := (4/x) e^{−x}`.
    `J₀(x) = (2/π) Σ_{n≤N} c_n Γ(n+½) x^{−n−½} + E`,
    `|E| ≤ (2/π)[Γ(N+3/2) x^{−N−3/2} + T^*]`, and `Γ(n+½) = √π (2n)!/(4ⁿ n!)`.
* The common scalar `S(A) = (√π/2) · A · J₀(A²)` (`ConditionalSeedNormalization.seedScalar`).
* The moment ratios `r_h = J_{h+1}(x)/J_h(x) = (h+½)/(h+2+x−x·r_{h+1}) ∈ [0, 1]` by the backward
  recurrence from `r_H ∈ [0, 1]` (`PositiveRatio.backward`, obligation S3).

All definitions are `let`-free with named helpers, so that the soundness proofs
(`Grothe/UpperQuad/SeedSound.lean`, `RatioSound.lean`) can unfold them directly.

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace GrotheQuad

/-! ### `π` -/

/-- The loop of the alternating arctan series: `t` carries `x^{2k+1}`, `s` the partial sum
`Σ_{j<k} (−1)^j x^{2j+1}/(2j+1)`; returns `(s, t)` after `fuel` more terms. -/
def arctanLoop (P : Nat) (x2 : Ival) : Nat → Nat → Ival → Ival → Ival × Ival
  | 0, _, t, s => (s, t)
  | fuel + 1, k, t, s =>
    arctanLoop P x2 fuel (k + 1) (mulI P t x2)
      (if k % 2 == 0 then addI P s (divN P (2 * k + 1) t) else subI P s (divN P (2 * k + 1) t))

/-- `arctan(1/n)` by its alternating series through `N` terms, tail ≤ the next term. -/
def arctanInvI (P N : Nat) (n : Nat) : Ival :=
  widen P (arctanLoop P (sqI P (divN P n (ofInt P 1))) N 0 (divN P n (ofInt P 1)) zeroI).1
    (divN P (2 * N + 1) (absUpper (arctanLoop P (sqI P (divN P n (ofInt P 1))) N 0 (divN P n (ofInt P 1)) zeroI).2))

/-- `π` by Machin's formula; `N` terms of each series (`N = 200` gives about 280 bits from
`arctan(1/5)`, i.e. use `N ≥ P / 1.4` for `P` bits). -/
def piMachinI (P N : Nat) : Ival :=
  subI P (mulN P 16 (arctanInvI P N 5)) (mulN P 4 (arctanInvI P N 239))

/-! ### The seed series -/

/-- The series loop: from `(t, s)` enclosing `(t_n, Σ_{m≤n} t_m)`, `fuel` more terms, with
`negx` enclosing `−x` and `t_{n+1} = t_n · (−x) · (2n+1) / (2 (n+1) (n+2))`. -/
def seedLoop (P : Nat) (negx : Ival) : Nat → Nat → Ival → Ival → Ival × Ival
  | 0, _, t, s => (s, t)
  | fuel + 1, n, t, s =>
    seedLoop P negx fuel (n + 1) (divN P (2 * (n + 1) * (n + 2)) (mulN P (2 * n + 1) (mulI P t negx)))
      (addI P s (divN P (2 * (n + 1) * (n + 2)) (mulN P (2 * n + 1) (mulI P t negx))))

/-- The partial sum through `n ≤ N` and the term `t_N`. -/
def seedSeries (P N : Nat) (xI : Ival) : Ival × Ival :=
  seedLoop P (negI (clampI xI)) N 0 (ofInt P 1) (ofInt P 1)

/-- The next term `t_{N+1}`. -/
def seedNext (P N : Nat) (xI : Ival) : Ival :=
  divN P (2 * (N + 1) * (N + 2)) (mulN P (2 * N + 1) (mulI P (seedSeries P N xI).2 (negI (clampI xI))))

/-- The denominator `N + 3 − x` of the geometric tail. -/
def seedDen (P N : Nat) (xI : Ival) : Ival := subI P (ofNat P (N + 3)) (clampI xI)

/-- The validity of the series tail (`N + 3 − x > 0` decided by the enclosure). -/
def seedSeriesValid (P N : Nat) (xI : Ival) : Bool := isPos (seedDen P N xI)

/-- `J₀(x)` for `x ∈ xI ⊆ [0, ∞)` by the series through `n ≤ N` plus the geometric tail bound
`|t_{N+1}| · (N+3)/(N+3−x)`. -/
def seedJ0SeriesI (P N : Nat) (xI : Ival) : Ival :=
  if seedSeriesValid P N xI then
    widen P (seedSeries P N xI).1
      (divI P (mulN P (N + 3) (absUpper (seedNext P N xI))) (seedDen P N xI))
  else hugeI P

/-! ### The Watson form -/

/-- The loop of the asymptotic sum: `a` carries `a_n x^{−n}` with
`a_{n+1} = a_n (2n−1)(2n+1)/(4(n+1)) · x^{−1}`, `s` the partial sum. -/
def watsonLoop (P : Nat) (invx : Ival) : Nat → Nat → Ival → Ival → Ival
  | 0, _, _, s => s
  | fuel + 1, n, a, s =>
    watsonLoop P invx fuel (n + 1)
      (divN P (4 * (n + 1)) (mulZ P ((2 * (n : Int) - 1) * (2 * (n : Int) + 1)) (mulI P a invx)))
      (addI P s (divN P (4 * (n + 1)) (mulZ P ((2 * (n : Int) - 1) * (2 * (n : Int) + 1)) (mulI P a invx))))

/-- `Σ_{n ≤ N} c_n g_n x^{−n}` with `c_0 g_0 = 1`. -/
def watsonSum (P N : Nat) (xI : Ival) : Ival :=
  watsonLoop P (invI P xI) N 0 (ofInt P 1) (ofInt P 1)

/-- `g_{N+1} = (2N+2)!/(4^{N+1} (N+1)!)` as an interval (`g_{n+1} = g_n (2n+1)/2`). -/
def watsonGamma (P : Nat) : Nat → Ival
  | 0 => ofInt P 1
  | n + 1 => divN P 2 (mulN P (2 * n + 1) (watsonGamma P n))

/-- The error bound `(2/π)[Γ(N+3/2) x^{−N−3/2} + (4/x) e^{−x}]` with `e^{−x} ≤ 2^{−⌊x⌋}`. -/
def watsonErr (P N : Nat) (piI xI : Ival) : Ival :=
  divI P (mulN P 2 (addI P
    (divI P (mulI P (sqrtI P piI) (watsonGamma P (N + 1))) (mulI P (powI P xI (N + 1)) (sqrtI P xI)))
    (mulN P 4 (mulI P ⟨0, 1, -(toFixedLo 0 xI)⟩ (invI P xI))))) piI

/-- The validity of the Watson form (`x > 2N + 2` decided by the enclosure). -/
def watsonValid (N : Nat) (xI : Ival) : Bool := gtNat xI (2 * N + 2)

/-- `J₀(x)` for large `x ∈ xI` by the Watson form with `N` terms:
`(2/√π) x^{−1/2} Σ_{n ≤ N} c_n (2n)!/(4ⁿ n!) x^{−n}` plus the error bound. -/
def seedJ0AsymI (P N : Nat) (piI xI : Ival) : Ival :=
  if watsonValid N xI then
    widen P (divI P (mulN P 2 (watsonSum P N xI)) (mulI P (sqrtI P piI) (sqrtI P xI)))
      (watsonErr P N piI xI)
  else hugeI P

/-- `J₀(x)` by the series with 800 terms for `x < 150` (the terms peak near `2^{216}` and
`t_{801} < 10^{−235}`), else by the Watson form with `N = 70` terms (requires `x ≥ 142`; its
error at `x = 150` is below `Γ(71.5)/150^{71.5} < 10^{−54}` and decreases with `x`). -/
def seedJ0I (P : Nat) (piI xI : Ival) : Ival :=
  if ltNat xI 150 then seedJ0SeriesI P 800 xI else seedJ0AsymI P 70 piI xI

/-- The common scalar `S(A) = (√π/2) · A · J₀(A²)` for `A ∈ aI`, `π ∈ piI`. -/
def seedScalarI (P : Nat) (piI aI : Ival) : Ival :=
  mulI P (mulI P (divN P 2 (sqrtI P piI)) aI) (seedJ0I P piI (sqI P aI))

/-! ### The moment ratios -/

/-- The denominator `h + 2 + x − x·r_{h+1}`. -/
def ratioDen (P : Nat) (h : Nat) (xI rNext : Ival) : Ival :=
  addI P (ofNat P (h + 2)) (mulI P xI (subI P (ofInt P 1) rNext))

/-- One backward step `r_h = (h+½) / (h+2+x−x·r_{h+1})` (`PositiveRatio.next`), outward. -/
def ratioNextI (P : Nat) (h : Nat) (xI rNext : Ival) : Ival :=
  divI P (divN P 2 (ofNat P (2 * h + 1))) (ratioDen P h xI rNext)

/-- The loop of `ratiosI`: from `r` enclosing `r_H`, the list `[r_0, …, r_{H-1}] ++ acc`. -/
def ratioLoop (P : Nat) (xI : Ival) : Nat → Ival → List Ival → List Ival
  | 0, _, acc => acc
  | h + 1, r, acc => ratioLoop P xI h (ratioNextI P h xI r) (ratioNextI P h xI r :: acc)

/-- The ratios `r_0, …, r_{H-1}` from the terminal enclosure `r_H ∈ [0, 1]`. -/
def ratiosI (P : Nat) (xI : Ival) (H : Nat) : Array Ival :=
  (ratioLoop P xI H ⟨0, 1, 0⟩ []).toArray

/-- Every denominator of the backward recurrence is decided positive by its enclosure (the
validity flag of `ratiosI`). -/
def ratioLoopOK (P : Nat) (xI : Ival) : Nat → Ival → Bool
  | 0, _ => true
  | h + 1, r => isPos (ratioDen P h xI r) && ratioLoopOK P xI h (ratioNextI P h xI r)

def ratiosValid (P : Nat) (xI : Ival) (H : Nat) : Bool := ratioLoopOK P xI H ⟨0, 1, 0⟩

end GrotheQuad
