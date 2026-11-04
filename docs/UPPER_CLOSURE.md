# Closing the upper half: the six Gaussian hypotheses of `upper_of_three_low_three_whole`

*Issues #313 (epic), #41 (task). Agent-ID: claude-b9ee (worker). Written at master `1401a7b6`,
4–5 November 2026. Design spike: statements first (§1–§5), then a numerical prototype (§6),
then the Lean port design (§7). Nothing here is a Lean proof; every number in §3 is quoted from
committed data or from the inherited certificate and says where it comes from.*

## 0. What is open

`Grothe.UpperChaos.ThreeBandEndpoint.upper_of_three_low_three_whole`
(`Grothe/UpperChaos/ThreeBandUpper.lean`) proves

```
IsGrothendieckBound threeBandValueQ ∧ threeBandValueQ < 1.40459988,
threeBandValueQ = 62500000000000000000000000000000000/44496657949831899485564111968234071
                = 1.40459987063446669…
```

from seven hypotheses. `hclose` (the energy table) is the quadrature checker's job
(`docs/QUAD_CHECKER.md`, PR #304). The other six are three *low-band* and three *whole-error*
statements about the Taylor sources `hpow j = (iφ)^j F₀` and the committed centers `c_j`:

```lean
hfirst  : ‖projOn (firstCenterBandModes 0)  (firstTaylorL2  - firstCenter)‖  ≤ firstCapturedErrorQ 0
hsecond : ‖projOn (secondCenterBandModes 0) (secondTaylorL2 - secondCenter)‖ ≤ secondCapturedErrorQ 0
hthird  : ‖projOn (thirdCenterBandModes 0)  (thirdTaylorL2  - thirdCenter)‖  ≤ thirdCapturedErrorQ 0
hwholeFirst  : ‖firstTaylorL2  - firstCenter‖  ≤     comparisonGroupRadiusQ 1
hwholeSecond : ‖secondTaylorL2 - secondCenter‖ ≤ 2 * comparisonGroupRadiusQ 2
hwholeThird  : ‖thirdTaylorL2  - thirdCenter‖  ≤ 6 * comparisonGroupRadiusQ 3
```

## 1. The objects (Lean name ↔ formula)

**Measure and basis.** `mu2 = gaussC ⊗ gaussC` on `ℂ²`, `gaussC` the standard complex Gaussian
(density `π⁻¹ e^{−|z|²}`, `E|z|² = 1`). Complex Hermite polynomials `H p q` (`ComplexHermite.lean`:
`H_{pq} = A₀^p A₁^q 1`, `A₀ = z − ∂_z̄`, `A₁ = z̄ − ∂_z`), explicitly
`H_{pq}(z) = Σ_k (−1)^k k! C(p,k) C(q,k) z^{p−k} z̄^{q−k}`, orthogonal with
`E[conj H_{pq} H_{rs}] = δ_{pr}δ_{qs} p! q!`; `hfun (p,q) = H_{pq}/√(p!q!)`. Tensor modes
`hvec2 i`, `i = ((p₁,p₂),(r₁,r₂)) : Idx2`, are `h_{p₁p₂}(z) h_{r₁r₂}(w)` (`HermiteC2Basis.lean`), an
orthonormal basis of `L²(mu2)` (`HermiteC2Basis`). `bideg i = (p₁+r₁, p₂+r₂)`; the *total degree* is
their sum; the *charge* is `p₁+r₁ − p₂−r₂`. `projOn B` is the orthogonal projection onto the closed
span of `{hvec2 i | i ∈ B}` (`BandProj.lean`); `energy G (n,m) = Σ_{bideg i = (n,m)} |⟨hvec2 i, G⟩|²`.

**Graded (charge-one) coordinates** (`GradedHermite.lean`): `gradedMode q c d = ((q+1−c, q−d), (c, d))`
for `c ≤ q+1`, `d ≤ q`: charge one, total degree `2q+1`, z-part `h_{q+1−c, q−d}`, w-part `h_{c,d}`.
`gradedHermite N a = Σ_{q<N} Σ_{c≤q+1} Σ_{d≤q} a q c d · hvec2 (gradedMode q c d)`, so
`‖gradedHermite N a‖² = Σ a²` exactly (`norm_gradedHermite_sq_cast`). The number of modes of
grade `q` is `(q+1)(q+2)`; up to total degree `2Q+1` there are `Σ_{q≤Q}(q+1)(q+2)` of them
(6,552 for degree ≤ 51; 259,532 for degree ≤ 181).

**The rounding** (`Rounder.lean`, `PhiProductionDefs.lean`, data `Grothe/Upper/Data.lean`):

* profile `v(s) = Σ_{j<12} x_j L_j^{(−1/2)}(s)/√(Γ(j+½)/j!)` (`vprof`, `profileQ`);
* base phase `F₀(z,w) = ph(z + κ v(|z|²) w)`, `κ = √(1+a²)`, `a = aQ = 0.0289…`,
  `ph(ζ) = ζ/|ζ|`, `ph 0 = 0` (`F0`, `Haag.ph`); `|F₀| = 1` a.e., charge one;
* phase `φ(z,w) = D e^{−ε(U+V)} S(U,V,W)`, `U = |z|²`, `V = |w|²`, `W = Re(z̄w)`, `D = Im(z̄w)`,
  `ε = phaseEpsQ = 21/20`, `S` the polynomial with the 1,140 monomials `U^i V^j W^k` of `phaseStrs`
  (`Sphase`, `phiT`; total degree 17 in `(U,V,W)`, degree 34 in `(z,w)`, 35 for `φ` with `D`);
  `φ` is real, rotation invariant, odd under conjugation `(z,w) ↦ (z̄,w̄)`, and `φ² ≤ 99/100`
  (`PhiBound`, proved);
* Taylor sources `hpow j u = (i φ u)^j F₀ u` (`ComparisonPieces.lean`);
  `firstTaylorL2 = toLp (hpow 1)`, `secondTaylorL2 = toLp (hpow 2)`, `thirdTaylorL2 = toLp (hpow 3)`
  (`FirstSecondCapturedTail.lean`, `ThirdCapturedTail.lean`). These are the **unscaled** sources
  `B^j F₀`, `B = iφ·`; the comparison pieces divide by `j!` later (`srcP`).

  Because `φ(ū) = −φ(u)` and `F₀(ū) = conj F₀(u)`, every `hpow j` has **real** Hermite coefficients
  (so do the centers), and `⟨c_j, hpow j⟩` is real.

**The centers** (`TaylorCenters.lean`, `TaylorBandDefs.lean`; data `data/taylor-approximants/`):

| center | Lean | grades | degree ≤ | coefficients | scale | source array (binary64 `center`, exact dyadic) |
|---|---|---|---|---|---|---|
| `c₁` | `firstCenter = gradedHermite 91 firstCenterCoeff` | `q < 91` | 181 | 259,532 | `2^−206` | `inputs/arb_first_phase_D181.npz` |
| `c₂` | `secondCenter = gradedHermite 46 secondCenterCoeff` | `q < 46` | 91 | 35,696 | `2^−206` | `inputs/arb_phase_power2_D151.npz` (degree-91 prefix of a degree-151 array) |
| `c₃` | `thirdCenter = gradedHermite 26 thirdCenterCoeff` | `q < 26` | 51 | 6,552 | `2^−105` | `inputs/arb_phase_power3_D51.npz` |

`Cq[c,d]` of the arrays multiplies `hvec2 (gradedMode q c d)` (`data/taylor-approximants/README.md`).
The centers approximate `hpow j` itself (not `hpow j / j!`).

**The bands.** `firstCenterBandModes 0 = {i | 0 < totdeg i ≤ 51}` (`firstCenterBandLo 0 = 0`,
`firstCenterBandHi 0 = 51`, `TaylorFirstBandNorms.lean`); `secondCenterBandModes 0` likewise
`(0, 51]`; `thirdCenterBandModes 0 = (0, 11]` (`TaylorBandDefs.lean`, `TaylorBandData.lean`). Since
the sources and centers have charge one, only the charge-one modes `gradedMode q c d` with
`2q+1 ≤ 51` (`q ≤ 25`: 6,552 modes) resp. `2q+1 ≤ 11` (`q ≤ 5`: 112 modes) carry anything.

**The constants.**

```
firstCapturedErrorQ 0  = 40000010000/10^21  = 4.000001e-11      (= public 4000001/10^17)
secondCapturedErrorQ 0 = 3820836533/10^19   = 3.820836533e-10   (= 2 × public 191041827/10^18)
thirdCapturedErrorQ 0  = 47629771/10^18     = 4.7629771e-11     (= 6 × public 992287/(125·10^15), rounded up)
R₁ = comparisonGroupRadiusQ 1 = 7438538917225/10^18 = 7.438538917225e-6
R₂ = comparisonGroupRadiusQ 2 = 1164322916284/10^18 = 1.164322916284e-6
R₃ = comparisonGroupRadiusQ 3 =  355864656182/10^18 = 3.55864656182e-7
E φ²  = phaseMoment2Q = 2.568529474446e-6   (exact rational, native fact PhaseMoment2)
E φ⁴  = phaseMoment4Q = 5.714395097039e-10  (PhaseMoment4)
E φ⁶  = phaseMoment6Q = 1.682387364301e-11  (PhaseMoment6)
‖c₁‖² = firstEnergyQ  = Σ_k firstCenterBandEnergyQ k  = 2.568489304581e-6   (exact; WholeCenterEnergies)
‖c₂‖² = secondEnergyQ = Σ_k secondCenterBandEnergyQ k = 5.667193355422e-10  (exact)
‖c₃‖² = thirdEnergyQ  = thirdCenterEnergyQ            = 1.278653939261e-11  (exact)
```

## 2. The six hypotheses as formulas

Write `a_j(i) := ⟨hvec2 i, hpow j⟩ = ∫ conj(hvec2 i) · (iφ)^j F₀ dμ₂` (real) for the Hermite
coefficients of the `j`-th source and `c_j(i)` for the center's coefficient (`0` outside its support).

### 2.1 Whole errors (`hwholeFirst/Second/Third`)

By `norm_hpow_sub_sq` (`TaylorErrorEnergy.lean`), `norm_hpow_one/two/three_sq` and the exact center
energies,

```
‖hpow j − c_j‖² = E φ^{2j} − 2 I_j + ‖c_j‖²,     I_j := Re ⟨c_j, hpow j⟩ = Σ_i c_j(i) a_j(i)
                                                        = ∫ conj(c_j(u)) (iφ(u))^j F₀(u) dμ₂(u).
```

So `hwhole_j` is **one real number each**:

```
I_j ≥ I_j^min := (E φ^{2j} + ‖c_j‖² − (j! R_j)²) / 2
```

| j | `(j!R_j)²` | `E φ^{2j} − ‖c_j‖²` | `I_j^min` | slack if `I_j = ‖c_j‖²` | needed accuracy on `I_j` |
|---|---|---|---|---|---|
| 1 | 5.533186e-11 | 4.016986e-11 | 2.568481723583e-6 | `(R₁)² − (E−C) = 1.516e-11`, i.e. `I₁ − ‖c₁‖² ≥ −7.58e-12` | ≈ 1e-12 absolute (4e-7 relative) |
| 2 | 5.422591e-12 | 4.720174e-12 | 5.663681269163e-10 | 7.02e-13, i.e. `I₂ − ‖c₂‖² ≥ −3.51e-13` | ≈ 5e-14 absolute (1e-4 relative) |
| 3 | 4.559028e-12 | 4.037334e-12 | 1.252569275446e-11 | 5.22e-13, i.e. `I₃ − ‖c₃‖² ≥ −2.61e-13` | ≈ 3e-14 absolute (2e-3 relative) |

(If the center were the exact projection of the source onto its degree range, `I_j = ‖c_j‖²` and the
whole error would be exactly the omitted tail `E φ^{2j} − ‖c_j‖²`; the slack column is then the room
left under the radius. The radii are the archived values, §3, so the slack is what the archive's
pessimism left over: 27 %, 13 %, 11 % of `(j!R_j)²`.)

### 2.2 Low bands (`hfirst/hsecond/hthird`)

```
‖projOn (0,D] (hpow j − c_j)‖² = Σ_{q ≤ (D−1)/2} Σ_{c ≤ q+1} Σ_{d ≤ q} (a_j(gradedMode q c d) − c_j(q,c,d))²  ≤  cap_j²
```

with `(D, cap)` = `(51, 4.000001e-11)`, `(51, 3.820836533e-10)`, `(11, 4.7629771e-11)`:
6,552 / 6,552 / 112 coefficient differences. Per coefficient (RMS): `4.9e-13`, `4.7e-12`, `4.5e-12`.
These need **per-coefficient enclosures** of `a_j(i)` of width ≈ `1e-13` (j = 1) to `1e-12`, *and* they
need the archived centers to be that close to the true coefficients: the inherited pipeline claims
far better (§3), but this is the fact the prototype must establish or refute.

Lean already turns per-coefficient enclosures into the band statement: `norm_band_error_le_cap`
(`SmallProfileBandEnclosure.lean`; stated for codex's mesh representation of the coefficient) and
`ConcreteRetainedBands.first_error/second_error/third_error`, with the rational energy check
`bandEnclosureEnergyQ ≤ (cap − 5·10⁻¹⁵)²` (the `5·10⁻¹⁵` is the compact-Laplace cutoff reserve of
that representation; a direct `a_j(i)` enclosure needs no reserve). A port that encloses `a_j(i)`
directly should restate the band lemma against `⟨hvec2 i, hpow j⟩` (the generic
`norm_band_error_le_real_enclosure` is the right shape).

### 2.3 What the two kinds have in common

Both are statements about the Hermite coefficients `a_j(i)` of `(iφ)^j F₀`: the low bands need them
individually for `deg i ≤ 51/51/11`; the whole errors need the single weighted sum
`Σ_i c_j(i) a_j(i)` over the center's support (degree ≤ 181/91/51), to the absolute accuracies of
§2.1 (`‖c₁‖₂ ‖δa‖₂ ≤ 1e-12` means `‖δa‖₂ ≤ 6e-10` over 259,532 coefficients for j = 1).

## 3. The inherited certificate and where the radii come from

Source: `handoff/upper-residual/global_norm/` (laptop archive; `certify_taylor_comparison.py`,
`taylor_comparison_result.json` = `data/localized-comparison/inputs/taylor_comparison_result.json`,
SHA `5619546626b7…`; lemma `MIXED_TAYLOR_CUTOFF_LEMMA.md`).

* **Centers**: Arb pipeline, Hermite ladder multiplication of `(iφ)^j` (`phase_power_modes.py`:
  exact Laguerre–angular modes of `(iS)^j`; `arb_norm.c`: the guarded ladder multiplier) applied to an
  Arb-integrated Hermite expansion of `F₀`; `center` arrays rounded to binary64, `error` arrays with
  `Σ error² < 1e-36` (asserted by the script: the Arb radii of the ladder arithmetic, not an
  integration certificate).
* **Finite-band allowances** `ε_{j,I} = 1/(25·10⁹) + (11/500)·HS_{j,I} + 10⁻¹⁸`: `4e-11` is the
  allowance for the Arb quadrature of the `F₀` coefficients, `HS` the rectangular weighted-Bargmann
  Hilbert–Schmidt bound for the omitted inputs (`natural/power{j}_hs_result.json`), `1e-18` the
  ladder radii. For the lowest band of each power `HS` is negligible: `ε_{1,(0,51]} = 4.000001e-11`,
  `ε_{2,(0,51]} = 1.91041827e-10` (scaled, i.e. `3.82e-10` unscaled), `ε_{3,(0,11]} = 7.938296e-12`
  (scaled; `4.76e-11` unscaled).
* **Tails** `t_j² = E φ^{2j} − Σ_I max(0, ‖P_I c_j‖ − ε_{j,I})²` (outward): `t₁ = 7.2762659834e-6`,
  `t₂ = 2.3174289032e-6` (unscaled; `1.1587e-6` scaled), `t₃ = 2.1298625097e-6` (`3.5498e-7` scaled).
* **Group radii**: `R_j² = Σ_{pieces of power j} ε²` over the 7/5/5 scaled pieces (6/4/4 bands + tail),
  `comparison_group_radii` (`ComparisonGroups.lean`, `decide +kernel`): `R₁² − Σε² = 3.1e-24`,
  `R₂² − Σε² = 2.1e-24`, `R₃² − Σε² = 5.5e-25`. So `(j!R_j)² = j!²(Σ_I ε²_{j,I} + t_j²_{scaled})` is the
  archive's bound on the whole error `‖hpow j − c_j‖²`, dominated by `t_j²` (98 %, 93 %, 89 %).
* **Rounding piece**: `‖c₁ + c₂/2 + c₃/6 − v‖ ≤ 10⁻¹⁸`, proved on master from the data
  (`norm_roundingDifference_le`, receipt `8.75e-20`); not an open hypothesis.
* **The endpoint arithmetic** (`ThreeBandBudget.lean`): residual
  `= headCapQ + energyErrQ + threeBandCompareQ + threeBandRawTailQ = 1.7831e-6`,
  `threeBandCompareQ = 2 Σ_{7 pieces} norm·error + (Σ_g R_g)² = 1.7182e-6 + 8.03e-11`, with the high
  pieces' mass caps `229/2500` (j = 1, 2) and `199/1000` (j = 3), `K = 1/(slopeQ − residual)`.

**Padding (the note of 4 November on #313, `upper-bound.tex` §6).** `K = 1.40459987063…` leaves
`9.37e-9` under the stated `1.40459988`; `dK/dR_j = K²(2·norm_j + 2 Σ_g R_g)` = `0.3615` (j = 1, 2),
`0.7852` (j = 3). So within the current headline the radii can be padded by at most
`δR₁ ≤ 2.6e-8` (0.35 %), `δR₂ ≤ 2.6e-8` (2.2 %), `δR₃ ≤ 1.2e-8` (3.4 %): in `(j!R_j)²` that is
`+0.7 %`, `+4.5 %`, `+6.9 %`, small next to the 27 % / 13 % / 11 % slack of §2.1 if the centers are
good projections. A larger pad needs a new headline constant (the user's goal is any proved bound
below 1.4046, so e.g. `1.4045999` would allow `δR₁ ≈ 8e-8`).

## 4. Reduction of the integrals

**Rotation.** Every integrand below is invariant under `(z,w) ↦ (e^{iα}z, e^{iα}w)` (charge one
against charge one), so with `z = √s e^{iα}` and `w ↦ e^{−iα}w`,

```
∫ G(z,w) dμ₂ = ∫₀^∞ e^{−s} E_w[ G(√s, w) ] ds        (w ~ gaussC, s = |z|² ~ Exp(1)).
```

**Fixed `s` (one radial node).** With `r = √s`, `b = κ v(s)` (real, either sign), the source is
`(iφ(r,w))^j F₀(r,w) = i^j (r Im w)^j e^{−jε(s+|w|²)} S(s, |w|², r Re w)^j · ph(r + b w)`, a
polynomial in `(w, w̄)` of degree `≤ 35j`, times the Gaussian factor `e^{−jε|w|²}`, times `ph(r + bw)`.

* The Hermite coefficient: `a_j(gradedMode q c d) = ∫₀^∞ e^{−s} ψ_{k,m}(s) · J^{(j)}_{c,d}(s) ds`,
  `ψ_{k,m}(s) = h_{q+1−c, q−d}(√s)` (`RadialLaguerre.radialFactor` with `k = d+1−c`, `m = q−d`:
  `(−1)^m s^{k/2} √(m!/(m+k)!) L_m^{(k)}(s)`) and
  `J^{(j)}_{c,d}(s) = E_w[ conj(h_{c,d}(w)) (iφ(√s,w))^j ph(√s + b w) ]`.
  For `j = 0` this is exactly the quadrature checker's node computation
  (`ProductionF0Radial.baseGradedCoefficient_eq_radial`, `F0ConditionalEvaluator.coefficient_eq_signed`:
  `J^{(0)}_{c,d}(s) = sign(v)^{c+d} I_{c,d}(A(s))`, `A = √s/(κ|v(s)|)`, `I_{c,d}(A) =
  canonicalCoefficient A (c,d) = E_w[conj(h_{c,d}(w)) ph(A + w)]`, seed `S(A) = (√π/2) A J₀(A²)`,
  `J₀(x) = (2/π)∫₀¹ t^{−1/2}(1−t)^{1/2} e^{−xt} dt = e^{−x/2}(I₀(x/2)+I₁(x/2))`, zero row
  `I_{0,d+1} = −A r_d I_{0,d}/√(d+1)` with the moment ratios `r_d`, charge recurrence
  `I_{c+1,d} = (A√(d+1) I_{c,d+1} + (d+1−c) I_{c,d})/(A√(c+1))`).
* The inner product: `I_j = ∫₀^∞ e^{−s} G_j(s) ds`,
  `G_j(s) = E_w[ conj(c_j(√s, w)) (iφ(√s,w))^j ph(√s + bw) ] = Σ_{c,d} V_{c,d}(s) J^{(j)}_{c,d}(s)`,
  `V_{c,d}(s) = Σ_q c_j(q,c,d) h_{q+1−c,q−d}(√s)` (real).

**The Gaussian factor.** `E_w[ g(w) e^{−jε|w|²} ph(r + bw) ] = λ⁻¹ E_w[ g(w/√λ) ph(r + (b/√λ) w) ]`,
`λ = 1 + jε` (substitute `w ↦ w/√λ`), and for a polynomial `g` the dilation `h_{m,n}(w/√λ)` is a
finite lower-triangular combination of `h_{m',n'}(w)` of the same angular charge
(`GAUSSIAN_POLYNOMIAL_NORM.md` eq. (2): `T_k[j,n] = (−1)^{n+j} √(C(n+k,n)/C(j+k,j)) C(n,j) r^j (1−r)^{n−j}`,
`r = 1/λ`). Hence **every `J^{(j)}_{c,d}(s)` is a finite combination of the checker's canonical
coefficients `I_{c',d'}(A√λ)` at the rescaled shift**, with coefficients that are exact algebraic
functions of `s` (the polynomial `S(s, ·, ·)`, the ladder `w h_{c,d} = √(c+1) h_{c+1,d} + √d h_{c,d−1}`,
`w̄ h_{c,d} = √(d+1) h_{c,d+1} + √c h_{c−1,d}`, and `T`). Equivalently, by the same substitution in both
coordinates, `I_j = i^j λ⁻² ⟨(c_j D^j S^j)(·/√λ), F̃₀⟩` with `F̃₀ = ph(z + κ v(|z|²/λ) w)`: the checker
with the rescaled profile `v(s/λ)`. Both forms matter for the Lean port (§7); their cancellation
behaviour is the design question there.

**Singular set.** `ph(r + bw)` jumps at `w = −r/b`; the `w`-integral is nevertheless exact in the
Hermite route (the Bessel seed absorbs it) and smooth in polar coordinates `y = r + bw = ρe^{iθ}`
(`ph = e^{iθ}`) in the direct route. In `s`, the integrands are `C^∞` across the profile's zeros
(`A → ∞`, where `J^{(j)} → `the Gaussian polynomial moments) but not analytic there: panels must
break at the zeros and refine toward them, as the checker's partition does.

## 5. Accuracy targets (summary for the prototype and the port)

| statement | quantity | absolute target | why |
|---|---|---|---|
| `hwholeFirst` | `I₁` | `≤ 1e-12` (ideally `1e-13`) | slack `7.6e-12` on `I₁ − ‖c₁‖²` |
| `hwholeSecond` | `I₂` | `≤ 5e-14` | slack `3.5e-13` |
| `hwholeThird` | `I₃` | `≤ 3e-14` | slack `2.6e-13` |
| `hfirst` | 6,552 coefficients `a₁(i)`, degree ≤ 51 | `≈ 1e-13` each | `ℓ²` budget `4.0e-11` shared with the centers' own error |
| `hsecond` | 6,552 coefficients `a₂(i)` | `≈ 1e-12` each | `3.8e-10` |
| `hthird` | 112 coefficients `a₃(i)` | `≈ 1e-12` each | `4.8e-11` |

The only genuinely analytic parts are the radial Gauss–Legendre remainder and the treatment of the
profile zeros (the same S6b/c and S8 obligations as the checker's, `docs/QUAD_CHECKER.md` §6); the
`w`-integrals are closed forms, and everything else is finite arithmetic.

## 6. Prototype (`tools/upper_closure_spike.py`)

Float64 numpy (no mpmath on the shared machines; the laptop's `decimal` is used only for the
cross-checks). Inputs: `Grothe/Upper/Data.lean` (phase, profile, `a`), the center arrays
`data/taylor-approximants/inputs/*.npz`, the exact constants from the Lean data files, the quadrature
presets `data/upper-closure/config.json`. Outputs under `handoff/upper-closure/` (git-ignored; the
runs were made on the big droplet in `~/claude-b9ee-upper-closure/`, 8 niced shards).

### 6.1 Method

1. **Radial nodes.** `∫₀^∞ e^{−s}(…) ds = ∫₀^∞ 2r e^{−r²}(…) dr`, `r = √s`: composite Gauss–Legendre
   in `r` on `[0, 9]` (`s ≤ 81`; the integrands carry `e^{−(1/2 + jε)s}` times polynomials of degree
   `≤ 17j` in `s`, `< 10⁻²⁰` beyond), panels of length 0.2 with 16 points (720 nodes). No special
   treatment of the profile's three zeros (`s = 13.83, 20.82, 25.20`): the `s`-integrands are `C^∞`
   there with non-analytic corrections of size `e^{−A(s)²}`, negligible wherever `A > 9`.
2. **One node, the `w`-integral.** Polar coordinates `w = τe^{iψ}` around the origin, so that
   `conj h_{c,d}(w) = ĥ_{c,d}(τ) e^{−i(c−d)ψ}` separates: `J_{c,d} = (1/π)∫ τ ĥ_{c,d}(τ) Φ̂_{c−d}(τ) dτ`
   with `Φ̂_k(τ) = ∫ e^{−ikψ} Φ(τe^{iψ}) dψ`, `Φ = (iφ)^j ph(r + bw) e^{−τ²/2}`, evaluated pointwise
   (`S` by Horner in `(V, W)` from the 1,140 monomials collapsed at `U = s`; `ph = y/|y|`).
   * away from the singular circle (`|τ/A − 1| ≥ 0.25`): `Φ̂_k` by an FFT with 1,024 angles
     (bandwidth: `ph(1 + xe^{iψ})` has Fourier decay `x^k`, `≤ 175` modes at `x = 0.75` or `1.25`,
     plus `35j` from the polynomial and `|k| ≤ 181`);
   * near it: `τ`-panels graded geometrically toward `A` from both sides (26 levels down to
     `|τ/A − 1| = 3.7·10⁻⁹`, 12 points each) and, for each level, Gauss–Legendre angle panels graded
     geometrically toward `arg w₀` (`π` for `b > 0`, `0` for `b < 0`) down to the level's distance
     scale, 16 points per short panel and 32 per long one (so that `e^{−i·181ψ}` is resolved), the
     modes by one matrix product per level;
   * the panels outside the near zone grow geometrically from `0.25A` to the regular length 0.25
     (the integrand depends on `τ/A`; without this the nodes with `A < 1`, i.e. `s > 28`, lost
     `10⁻⁸`), up to `τ_max = 14` (the integrand is `e^{−(1+jε)τ²}` times polynomials of degree
     `≤ 181 + 35j`, `< 10⁻⁴⁰` beyond).
3. **Hermite functions** by the orthonormal Laguerre three-term recurrence in the lower index:
   `ĥ_{c,d}(τ) = (−1)^{min(c,d)} ℓ_{min}^{(|c−d|)}(τ²)`, `ℓ_m^{(k)}(x) = √(m!/(m+k)!) x^{k/2} e^{−x/2} L_m^{(k)}(x)`
   (checked against exact `decimal` evaluation: `≤ 4·10⁻¹⁵` through degree 181). The row recurrence
   `h_{c+1,d} = (τh_{c,d} − √d h_{c,d−1})/√(c+1)` from the row `τ^d/√d!` is **unstable** (errors
   `4·10⁻⁶` at `(25,25)`, `τ = 6`) and was removed.
4. **Assembly.** `a_j(q,c,d) = Σ_n W_n 2r_n e^{−r_n²/2} ĥ_{q+1−c,q−d}(r_n) J_n[c,d]` on the low band
   (and, with `--all`, on the whole support of `c_j`), `I_j = Σ_n W_n 2r_n e^{−r_n²/2} Σ_{c,d} V̂_{c,d}(r_n) J_n[c,d]`
   with `V̂_{c,d}(r) = Σ_q c_j(q,c,d) ĥ_{q+1−c,q−d}(r)`. Per node also `E_w[φ^{2j}]` on the same grid
   and `Σ_{c,d} J²` (Parseval: the two agree to the digits shown at every node tried).

Cost: 0.7 s per node for `j = 1` (`Dw = 181`, 363 modes) on the laptop; a full power is minutes.

### 6.2 Validation

* **`j = 0`, one node:** `J_{c,d}` is the checker's `sign(v)^{c+d} I_{c,d}(A)`; against the 60-digit
  `decimal` reference triangle (seed, backward ratios, charge recurrence, as
  `tools/quad_checker_reference.py` of #303) at `r = 0.3, 1.2, 2.5, 4.6` (`A = 0.97, 4.0, 6.9, 4.7`):
  max difference over `c + d ≤ 60` is `2–6·10⁻¹⁶` in every band, with the coarse preset as well.
  At `A → 0` (`r = 5.3–7`, `A = 10⁻² … 10⁻⁶`), where the reference's divisions by `A^c` fail,
  `J_{0,0}` agrees with the exact seed `(√π/2) A e^{−A²/2}(I₀ + I₁)(A²/2)` to `4·10⁻¹⁷`.
* **Exact moments:** `E φ^{2j}` by the full radial × angular quadrature (no phase, no Hermite
  factor) against `phaseMoment2Q/4Q/6Q`: coarse preset `3·10⁻¹¹`, `6·10⁻¹¹`, `4·10⁻¹²` relative;
  default and fine presets below.
* **Convergence** of every reported number under the presets `default` → `r2` (radial refined) →
  `w2` (`w`-integral refined) → `fine` (both, larger ranges): below.
* **`j = 0`, all nodes:** the assembled `F₀` coefficients of the lowest grades against the quad
  checker's raw enclosures (`handoff/quad-checker/raw-final.txt`, milestone 2 of #303): below.

### 6.3 Results — to be filled in

## 7. Lean port design — to be filled in
