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
presets `data/upper-closure/config.json`. Outputs under `handoff/upper-closure/` (git-ignored, on the
laptop in the worktree `grothe-claude-b9ee-upper-closure-spike`): the runs were made on the big
droplet (`~/claude-b9ee-upper-closure/`, 8 niced shards; folder deleted afterwards) and copied to
`handoff/upper-closure/big/`: every `assemble-*.json`, `*-coeffs.npz` and log, the per-node files
`nodes-j{0,1,2,3}-checker-*of8.npz` of the production preset (3.7 GB; the expected values for testing
the Lean kernel: `J[c,d]` at every node of the checker's partition), and the `uniform/` record of the
first run; the node files of the `checker_w2`/`checker_s60` convergence runs (5.4 GB, duplicates to
roundoff) were not kept.

### 6.1 Method

1. **Radial nodes.** `∫₀^∞ e^{−s}(…) ds`: Gauss–Legendre in `s` on the quadrature checker's committed
   partition `sourcePanels` (`data/upper-closure/checker-panels.txt`: 1,289 panels on `[0, 100]`,
   orders 1–62, 21,577 nodes, refined around the profile's zeros `s = 13.83, 20.82, 25.20`), the
   nodes mapped to `r = √s`; preset `checker`. The first version used uniform panels in `r` (length
   0.2, 16 points, 720 nodes, presets `default`/`r2`/`fine`); §6.2 explains why that fails for the
   higher grades and why the checker's partition is the right rule for these integrands.
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
  factor) against `phaseMoment2Q/4Q/6Q`. With the phase polynomial evaluated by Horner in the
  monomial basis the relative errors were `2–6·10⁻¹¹` whatever the preset: the float64 evaluation of
  `S(U,V,W)` loses up to `6·10⁻¹¹` relative at bulk points (condition number `4·10⁶`, exact check
  against `Fraction` arithmetic). In the Laguerre–angular basis of the source
  (`data/upper-closure/phase-laguerre.json`, `D·S = Σ_t c_t L_n^{(k)}(3U) L_m^{(k)}(3V) Im((z̄w)^k)`,
  proved equal to `phaseStrs` as polynomials by `check-phase`) the evaluation is at machine precision
  (`≤ 3·10⁻¹⁵`), and the coarse preset already gives `E φ^{2j}` to `3·10⁻¹⁶`, `3·10⁻¹⁵`, `7·10⁻¹⁵`.
* **`j = 0`, all nodes — the radial quadrature.** The assembled `F₀` coefficients of the 26
  low-band grades (3,627 canonical pairs) against the quad checker's raw enclosures
  (`handoff/quad-checker/raw-final.txt`, milestone 2 of #303). With the uniform radial panels of
  §6.1 (step 1) the differences grow tenfold per grade — `2.5·10⁻¹⁴` (q = 0), `4·10⁻¹³`, `3.5·10⁻¹²`,
  …, `1.5·10⁻⁸` at most — and refining the uniform panels (`r2`: length 0.1, 20 points) leaves the
  maximum unchanged. The cause is the profile's zeros where `|v′|` is large: `J^{(j)}_{c,d}(s)` is
  `C^∞` there, but its transition from the `ph ≡ 1` limit (`A = ∞`) to the small-`A` regime takes
  place in a window of width `≈ r/(κ|v′|)` in `s`: 40 at `s₀ = 13.83` (`v′ = −0.093`), 1.8 at
  `s₀ = 20.82` (`v′ = 2.5`), **0.17 at `s₀ = 25.20`** (`v′ = −30`), far below the panel width 1.5.
  The low grades are insensitive because their Hermite functions are negligible at `r ≈ 4.5–5`;
  from grade 5 on they are not, hence the plateau of the differences. The same spikes affected the
  comparison of the Taylor coefficients with the centers (§6.3), so the first verdicts on the
  low bands of powers 1 and 2 were artefacts of the radial rule, not of the centers. The fix is the
  quadrature checker's own committed partition `sourcePanels` (`data/upper-closure/checker-panels.txt`,
  1,289 panels, 21,577 nodes in `s`, orders up to 62, adaptively refined around the three zeros:
  panel widths 0.01–0.6 there), preset `checker`; its validation is the raw comparison below.
* **Convergence** of every reported number under the presets `checker` → `checker_w2` (`w`-integral
  refined) and the radial-range test `checker_s60`: below.

### 6.3 Results (preset `checker`, 21,577 radial nodes; big droplet, 8 shards; 5 November 2026)

**The six hypotheses.** All six HOLD numerically, with the archived centers exactly as committed.

| hypothesis | computed | Lean constant | margin |
|---|---|---|---|
| `hwholeFirst` | `I₁ = 2.5684893045809268e-6`; `‖hpow 1 − c₁‖² = Eφ² − 2I₁ + ‖c₁‖² = 4.016986e-11` | `R₁² = 5.533186e-11` | `I₁ − I₁^min = 7.581e-12`; `1.516e-11 = 27.4 %` of `R₁²` |
| `hwholeSecond` | `I₂ = 5.6671933554229e-10`; `‖hpow 2 − c₂‖² = 4.720174e-12` | `(2R₂)² = 5.422591e-12` | `I₂ − I₂^min = 3.512e-13`; `7.024e-13 = 13.0 %` |
| `hwholeThird` | `I₃ = 1.278653939268252e-11`; `‖hpow 3 − c₃‖² = 4.037334e-12` | `(6R₃)² = 4.559028e-12` | `I₃ − I₃^min = 2.608e-13`; `5.217e-13 = 11.4 %` |
| `hfirst` | `‖P_{(0,51]}(hpow 1 − c₁)‖ = 7.29e-17` (6,552 coefficients, max `2.1e-17`) | `4.000001e-11` | factor `5·10⁵` |
| `hsecond` | `‖P_{(0,51]}(hpow 2 − c₂)‖ = 2.91e-17` (6,552, max `7.5e-18`) | `3.820836533e-10` | factor `10⁷` |
| `hthird` | `‖P_{(0,11]}(hpow 3 − c₃)‖ = 3.80e-18` (112, max `2.7e-18`) | `4.7629771e-11` | factor `10⁷` |

The centers are the exact projections of the sources onto their degree ranges to the precision of
float64: `I₁ − ‖c₁‖² = 9.7·10⁻²¹`, `I₂ − ‖c₂‖² = 7.2·10⁻²³`, `I₃ − ‖c₃‖² = 7.6·10⁻²³`, so the whole errors equal the omitted
tails `E φ^{2j} − ‖c_j‖²` to all shown digits, and the low-band differences (`10⁻¹⁷`–`10⁻¹⁸` per
coefficient, flat across the grades) are the rounding of the computation, not a deviation of the
centers. The archived certificate's finite-band allowances were pessimistic by five to seven
orders of magnitude; its tail bounds `t_j` (which dominate the radii) were tight.

On the whole support of the centers (`--all`: 259,532 / 35,696 / 6,552 coefficients) `‖a₁ − c₁‖ = 7.6·10⁻¹⁷`,
`‖a₂ − c₂‖ = 3.0·10⁻¹⁷`, `‖a₃ − c₃‖ = 8.6·10⁻¹⁶`, and `I_j` by the coefficient route `Σ_i c_j(i) a_j(i)`
agrees with the direct integral `∫ e^{−s} G_j(s) ds` to `1.7·10⁻²¹`, `7·10⁻²⁵`, `5·10⁻²⁷`.

Per grade (`‖a_j − c_j‖_q`, max `|a_j − c_j|`, `‖c_j‖_q`): j = 1: q = 0: `3.6e-18`, `3.6e-18`,
`4.0e-4`; q = 5: `2.8e-17`, `2.1e-17`, `4.4e-4`; q = 10: `1.7e-17`, `8.2e-18`, `6.3e-5`; q = 25:
`4.7e-18`, `2.5e-18`, `2.1e-5`. j = 2: q = 0: `2.3e-20`, `2.0e-20`, `4.3e-6`; q = 5: `1.0e-17`, `7.2e-18`,
`7.9e-6`; q = 25: `2.2e-18`, `1.2e-18`, `1.1e-6`.

**Validation of the radial rule (j = 0 against the raw enclosures).** The `F₀` coefficients of all
26 low-band grades (run `--power 0 --Dw 40` on the checker partition; 3,536 canonical pairs with
`c + d ≤ 40`) against the midpoints of the checker's raw enclosures: maximum difference `1.8·10⁻¹⁵`
(at the largest coefficient, `⟨h_{1,0}(z), F₀⟩ = 0.8475…`, relative `2·10⁻¹⁵`), `ℓ²` of the
differences `3.0·10⁻¹⁵`, per-grade maxima `1.8e-15, 7.5e-16, 1.3e-15, 1.2e-15, 1.6e-16, …, 8.4e-17`
(grades 0–25; the higher grades are smaller because their coefficients are). This is float64
roundoff over 21,577 nodes; the checker's enclosures themselves have widths `≤ 7.6·10⁻²⁸`. With the
uniform radial rule the same comparison gave `1.5·10⁻⁸` (§6.2).

**Convergence (`checker` → `checker_w2`, `checker_s60`), power 1.** `checker_w2` refines every
parameter of the `w`-integral (panels 0.15 and 20 points, zone 0.3, 30 grading levels of 16
points, FFT 2,048, angle panels 20/40 points, `τ_max = 16`; 2.1× the cost): `I₁` and the whole
error are unchanged to all 17 digits (`2.5684893045809268e-6`, `4.016986493532936e-11`), the
low-band norm moves from `7.286908e-17` to `7.297086e-17` (`+1.0·10⁻¹⁹`, roundoff) and its largest
coefficient difference by `5·10⁻²⁰`. `checker_s60` drops the 159 nodes beyond `s = 60`: no change
in `I₁`, the whole error or the low-band norm (`+1.2·10⁻²³`). The exact moments on the checker
partition: `E φ²` to `−4.9·10⁻¹⁵`, `E φ⁴` to `+2.9·10⁻¹⁵`, `E φ⁶` to `−7.9·10⁻¹⁵` relative. So every
number of the table above is converged to the float64 level of the computation; the hypotheses'
margins (`10⁻¹³`–`10⁻¹¹`) exceed the numerical uncertainty by eight or more orders of magnitude.

**Cost:** 18,820 CPU-s for power 1 (0.87 s per node), 11,113 for power 2, 9,192 for power 3, on
the loaded big droplet (8 niced shards; 40–60 min wall per power).

## 7. Lean port design

The six hypotheses are statements about the Hermite coefficients `a_j(i) = ⟨hvec2 i, hpow j⟩`
(§2.3). Three ways to certify them in Lean were weighed; the first is recommended.

### 7.1 Route E (recommended): the inherited multiplier structure on the checker's `F₀` coefficients

`(iφ)^j F₀ = e^{−jε(U+V)} P_j(u) · F₀` with `P_j = (i D S)^j` a polynomial of degree `36j`. Expand
`F₀ = Σ_{i'} f(i') hvec2 i'` (Parseval, `HermiteC2Basis`) and let `M_j(i, i') = ⟨hvec2 i, (iφ)^j hvec2 i'⟩`:

```
a_j(i) = Σ_{deg i' ≤ 501} M_j(i, i') f(i')  +  ⟨hvec2 i, (iφ)^j P_{>501} F₀⟩.
```

* **Inputs `f(i')`**: the quadrature checker's raw enclosures (milestone 2 of #303: 2,698,752
  coefficients of degree `≤ 501`, widths `≤ 7.6·10⁻²⁸`) and their analytic remainder `ρ`
  (`‖productionF0Head − (Gauss sums)‖₂ ≤ 1.55·10⁻¹²`, S6b/c). Nothing new is integrated: the same
  objects and the same soundness obligations as `hclose` (`docs/QUAD_CHECKER.md` §6, §11), so the
  analytic debt of the upper half does not grow.
* **The matrix elements** are finite Gaussian integrals of polynomials times `e^{−jε|u|²}`: exactly
  the kind `PhaseMomentCheck.invariantMoment` already proves (`E[z^a z̄^b w^c w̄^d e^{−α|u|²}] =
  δ_{ab}δ_{cd} a! c!/(1+α)^{a+c+2}`), composed with the Hermite expansion of `hvec2 i · P_j · hvec2 i'`.
  Operationally the kernel never forms `M_j`: it applies the multiplication operator to the vector
  `f`, in the two-coordinate Hermite basis,
  - the Gaussian factor `e^{−jε|z|²}` as the dilation matrix per angular charge
    (`⟨h_m, e^{−α|z|²} h_n⟩ = λ⁻¹λ^{−k}Σ_j T_k[j,m]T_k[j,n]`, eq. (2) of `GAUSSIAN_POLYNOMIAL_NORM.md`,
    `λ = 1 + jε`; dense within a charge, entries bounded by 1, operator norm `≤ 1`), likewise in `w`;
  - the polynomial `(i D S)^j` in the **Laguerre–angular form** of `data/upper-closure/phase-laguerre.json`:
    `D S = Σ_k Im((z̄w)^k) Σ_{n,m} c_{nmk} L_n^{(k)}(3U) L_m^{(k)}(3V)`, i.e. for each `k` the ladders
    `z̄^k w^k − z^k w̄^k` (charge shifts) and two radial polynomials applied by Clenshaw recurrence
    in the Laguerre basis (`|z|²` is tridiagonal in the radial index at fixed charge). This form is
    conditioned like the function itself (`10¹–10²`, §6.1); the monomial form loses `10⁶` and the
    archived `arb_norm.c` paid for it with high precision.
  Bounded-entry operators on a bounded vector: interval widths are not amplified beyond the
  operator norms (`≤ 1` for the Gaussian, `≤ (√(2·537))^{36j}·‖c‖₁`-type for the polynomial part,
  harmless at `P = 512`). The weighted sum `I_j = Σ_i c_j(i) a_j(i)` has amplification `‖c_j‖₂`.
* **Truncation**: `‖M_j[deg ≤ 181, deg > 501]‖_HS` is a finite exact computation (the inherited
  rectangular Hilbert–Schmidt lemma, `certify_power_hs.py`); the Gaussian factor couples degree
  `n` to `n'` with weight `~(jε/(1+jε))^{|n−n'|/2}` and the polynomial shifts by at most `36j`, so
  the coupling from degree 502 to 181 is below `0.76^{(502−181−108)}·poly ≈ 10⁻²⁵` even for
  `j = 3`; a crude bound suffices.
* **Errors**: `‖δa_j‖₂ ≤ 1·ρ + (widths) + (truncation) ≈ 1.6·10⁻¹²` over all coefficients. Against the
  low-band caps `4.0·10⁻¹¹`, `3.8·10⁻¹⁰`, `4.8·10⁻¹¹` and the `I_j` margins `7.6·10⁻¹²`, `3.5·10⁻¹³`,
  `2.6·10⁻¹³` (times `‖c_j‖ = 1.6·10⁻³, 2.4·10⁻⁵, 3.6·10⁻⁶` for the latter) this is ample.
* **Statement chain in Lean.** (i) `a_j(i) = Σ_{i'} M_j(i,i') f(i')` with the tail term: Parseval for
  `F₀` and the continuity of multiplication by the bounded `(iφ)^j` (`phi_abs_lt_one`); (ii) the
  kernel's operator application encloses `Σ_{i' ≤ 501} M_j(i,i') f(i')` (soundness of the Laguerre
  Clenshaw, the ladders and the dilation: polynomial identities in the Hermite basis, provable by
  `ComplexHermite`'s `A₀, A₁` calculus; the dilation identity (2) needs its own proof or the
  equivalent change of variables `integral_comp_smul` for `gaussC`); (iii) the band statement from
  the per-coefficient enclosures (`norm_band_error_le_real_enclosure` restated for `⟨hvec2 i, hpow j⟩`)
  and the whole-error statement from `I_j ≥ I_j^min` (`norm_hpow_sub_sq`, `norm_hpow_one/two/three_sq`,
  `norm_firstCenter_sq_exact` etc.) — these consumers exist on master.
* **Native facts and sharding.** One native fact per (power, charge block) is natural: the
  operator preserves nothing but can be organised so that the output charge `k_out` of `z` receives
  from input charges `k_out ± k`, `k ≤ 18`; shard by output charge (≈ 250 blocks of unequal size,
  grouped into 8–16 facts per power; the raw vector enters as the committed data of the checker's
  final fact). Cost (interval ops at `P = 512`, `≈ 2 µs` each): the Clenshaw/ladder passes over the
  `5.4·10⁶`-entry tensor, `≈ Σ_k (34 + 2k)` tridiagonal applications `≈ 10¹¹` for `j = 1` (less for
  the truncated outputs of degree `≤ 181`), i.e. `≈ 50 CPU-h` per power, shardable; the dilations
  `≈ 4·10⁹`. Comparable to the node caps (21 CPU-h) and well inside the droplet's capacity.

### 7.2 Route C (fallback): the checker's conditional evaluator at the rescaled shift

Per radial node `s`: the canonical triangle `I_{c',d'}(A√λ)` (seed, ratios, charge recurrence,
exactly the kernel's `Seed`/`Pairs` at a different argument), the dilation to
`K_{m,n}(s) = ⟨h_{m,n}, e^{−jε|w|²} ph(r + bw)⟩`, then the multiplication operator `P_s(w)` (the
Laguerre–angular form at fixed `s`) applied once to `K`; the outputs are all `J^{(j)}_{c,d}(s)` of the
low band and, contracted with the center's conditional vector `V_{c,d}(s)`, `G_j(s)`. Radial
quadrature as the checker's (`sourcePanels`, `panelNode`, `panelWeight`), with an S6b/c-type remainder
for the twisted integrands (new analytic work: bounds of `J^{(j)}` for complex shifts). Cost
`≈ 5·10⁷` interval ops per node (`≈ 100 s`), `≈ 20 CPU-h` per power on 720 nodes (`600 CPU-h` on the
checker's 21,577 nodes, which were sized for degree 501 and are more than needed here). Preferable
only if Route E's tensor passes turn out too slow; it adds analytic obligations that Route E avoids.

### 7.3 Rejected: monomial moments, and the direct 2-D quadrature in the kernel

Writing `P_s` and the Hermite functions in monomials and using `E_w[w^α w̄^β ph(A + w)]` (a positive
combination of canonical coefficients) is exact but amplifies the enclosure widths by `√(α!β!)`
(`10¹¹⁵` at degree 156): impossible at `P = 512`, marginal at `P = 1024`. The prototype's own
scheme (angular FFT, graded Gauss–Legendre around the phase singularity) is the right tool for a
float64 computation but a poor candidate for a certificate: rigorous remainders for a bounded
discontinuous integrand on graded 2-D cells are new analysis with no reuse, whereas Routes E and C
reuse the checker's exact conditional machinery.

### 7.4 What becomes which kind of fact

| piece | kind | where |
|---|---|---|
| `E φ^{2j}` | native (`PhaseMoment2/4/6`) | on master |
| `‖c_j‖²`, `‖P_band c_j‖²`, `I_j^min`, the band energy checks | exact rational, `decide +kernel` | on master / trivial additions |
| `f(i')` and `ρ` | the checker's facts (milestones 2, 4 of #303) | shared with `hclose` |
| `a_j(i)` for `deg i ≤ 181` (low bands and `I_j`) | native facts of `GrotheQuadKernel` (Route E operator application), sharded by output charge | new |
| soundness of the operator application | theorems (Hermite calculus, dilation identity, truncation bound) | new, `Grothe/UpperQuad/` |
| band lemma on `⟨hvec2 i, hpow j⟩`, whole-error assembly | theorems | small adaptations of `SmallProfileBandEnclosure`, `TaylorErrorEnergy` |

Do not start the port before milestone 4 of #304 lands (the kernel's interval layer and the raw
vector's soundness are its prerequisites); the prototype's `a_j(i)` (coefficient files under
`handoff/upper-closure/`) are the expected values to test the kernel against.
