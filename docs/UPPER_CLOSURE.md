# Closing the upper half: the six Gaussian hypotheses of `upper_of_three_low_three_whole`

*Issues #313 (epic), #41 (task). Agent-ID: claude-b9ee (worker). Written at master `1401a7b6`,
4–5 November 2026. Design spike: statements first (§1–§5), then a numerical prototype (§6),
then the Lean port design (§7), then the port itself (§8, 5 November 2026: the exact design of the
kernel extension, with a correction of §7.1). Nothing here is a Lean proof; every number in §3 is
quoted from committed data or from the inherited certificate and says where it comes from.*

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

### 6.3 Results — to be filled in

## 7. Lean port design

The six hypotheses are statements about the Hermite coefficients `a_j(i) = ⟨hvec2 i, hpow j⟩`
(§2.3). Three ways to certify them in Lean were weighed; the first is recommended.

### 7.1 Route E (recommended in the spike; **superseded by §8.0**): the inherited multiplier structure on the checker's `F₀` coefficients

*Correction (§8.0): the truncation estimate of this subsection ("≈ 10⁻²⁵") is wrong by sixteen
orders of magnitude; the route is unusable at the needed accuracy. The port is the per-node
operator of §8 (Route C with the checker's partition and recurrences), not this one.*

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

## 8. The port (claude-b9ee worker, 5 November 2026, PR stacked on #318 and #316)

*Branch `claude-b9ee/upper-closure-port`, cut from `claude-b9ee/quad-checker-bridge` (the checker,
#318) and merged with `claude-b9ee/upper-closure-spike` (#316). Refs #41, #313.*

### 8.0 Why not Route E: the truncation at degree 501 is 10⁻¹⁰, not 10⁻²⁵

Route E (§7.1) writes `a_j(i) = Σ_{deg i' ≤ 501} M_j(i,i') f(i') + ⟨(iφ)^j h_i, P_{>501} F₀⟩` and
estimated the second term from the decay of the Gaussian factor as `0.76^{(502−181−108)} ≈ 10⁻²⁵`.
That exponent counts degrees; the dilation matrix `T_k[j,n]` (eq. (2) of
`GAUSSIAN_POLYNOMIAL_NORM.md`) is a **binomial distribution in the radial index**, and the coupling of
the radial index `n = 108` (degree 217, the top of `(iφ)h_i` for `deg i ≤ 181`) to `m = 250` (degree
500) is `T_0[108, 250] = C(250,108) r^{108} (1−r)^{142} ≈ 9·10⁻³` (`r = 1/λ = 0.488`): 1.4 standard
deviations from the mode, not small at all. The honest quantity is the Hermite tail of the smooth
function `g = e^{−α|u|²} q(u)`, `q = P_j h_i`, and it was computed exactly (rational arithmetic, one
radial coordinate, charge 0, `tools`-free script `tailtest.py` of this session) for
`g(x) = e^{−1.05 x} x^{17} L_{90}(x)` in `L²(e^{−x}dx)` (radial degree 107, i.e. total degree 214):

| radial cutoff `M` | 200 | 225 | 250 | 275 | 300 |
|---|---|---|---|---|---|
| `‖P_{>M} g‖ / ‖g‖` | 4.8·10⁻⁶ | 1.0·10⁻⁷ | **1.1·10⁻⁹** | 1.2·10⁻¹¹ | 7.3·10⁻¹⁴ |

(`‖g‖ = 2.6·10¹²` for this un-normalised toy; the ratio is what matters since `‖(iφ)^j h_i‖ ≤ 1`.)
The decay is `≈ 0.83` per radial index, i.e. `(α/λ)^{1/2}` slowed by the polynomial factor. So
`‖P_{>501}((iφ) h_i)‖ ≈ 10⁻⁹` for the top of the first center, and with `‖P_{>501} F₀‖ = √(1 −
0.994707²) = 0.103` (the committed raw vector's ℓ² norm; `‖F₀‖ = 1`) the truncation error of Route E
is **≈ 10⁻¹⁰ per coefficient**, three orders above the `10⁻¹³` target of §5 (and `j = 3`, `α = 3.15`,
decays slower still). Pushing the cutoff to degree ≈ 600 would need a new checker partition and new
cutoffs; not an option. The deeper reason is the one §7.3 gives against monomials: `P_j` is an
unbounded multiplier (its Hermite matrix has entries `≈ 10^{25}–10^{37}` at degree 217, since
`|DS| ≈ e^{ε|u|²}` is only tamed by the Gaussian), and any finite truncation of `F₀` before the
Gaussian factor is applied loses the cancellation that makes `(iφ)^j` bounded.

**Route C has no such term.** Per radial node the `w`-integral is exact: the Gaussian factor is a
*dilation* of the polynomial side (lower triangular, degree-decreasing), so the conditional
coefficients `I_{c,d}(A√λ)` are needed only up to the finite degree `D' = D_out + 35j`, and in the
`z`-direction the radial factors `ψ_{k,m}(s)` are evaluated pointwise at the nodes: `F₀` is never
expanded. What remains is the Gauss–Legendre remainder of the radial integral, the same obligation
as the checker's S6b/c, for the twisted integrands (§8.6). Everything below is Route C on the
checker's committed partition, with its recurrences, its data binding and its proof layers reused.

### 8.1 The per-node identity

Fix a node `s > 0` of the partition with `r = √s`, `v = vprof s ≠ 0`, `σ = profileSign s`,
`b = κ v`, `A = profileShift s = r/(κ|v|)`; fix the power `j ∈ {1,2,3}`, `α = jε = 21j/20`,
`λ = 1 + α` and the **rescaled shift** `A' = A√λ`. With `U = s`, `V = |w|²`, `W = r·Re w`,
`D = r·Im w` (`PhiProductionDefs.phiT`),

```
(iφ(r,w))^j F₀(r,w) = e^{−αs} · e^{−α|w|²} · Q_r(w)^j · ph(r + b w),
Q_r(w) := i·r·Im(w)·Sphase(s, |w|², r·Re w) = (r/2)(w − w̄) · Sphase(s, w w̄, (r/2)(w + w̄)),
```

a polynomial in `(w, w̄)` with **real** coefficients (`i·Im w = (w − w̄)/2`), of degree `≤ 35`
(`Sphase` has degree 17 in `(U,V,W)`; the `w`-degree of `U^i V^j W^k D` is `2j + k + 1 ≤ 35`), and
`Q_r` is imaginary-valued, so `conj Q_r = −Q_r`. For a polynomial `p(w, w̄)` define the functional

```
K_s(p) := ∫ conj(p(w)) · e^{−α|w|²} · ph(r + b w) dγ(w)          (γ = gaussC).
```

Then the twisted conditional coefficient and its dilation are

```
J^{(j)}_{c,d}(s) := ∫ conj(h_{c,d}(w)) (iφ(r,w))^j F₀(r,w) dγ = (−1)^j e^{−αs} · K_s(Q_r^j · h_{c,d}),   (8.1)
K_s(h_{e,f}) = λ^{−1} Σ_{(g,h)} T^λ[e,f; g,h] · σ^{g+h} · Re canonicalCoefficient(A') (g,h),              (8.2)
```

where (8.2) is `DampedMoments.integral_gaussC_tilt` (`∫ e^{−(λ−1)|w|²} F(w) dγ = λ⁻¹ ∫ F(w/√λ) dγ`,
on master), the **dilation identity** `h_{e,f}(w/√λ) = Σ T^λ[e,f; g,h] h_{g,h}(w)` (finite: `g − h =
e − f`, `g ≤ e`, `h ≤ f`), `ph(r + b w/√λ) = ph(A' + σ w)` (`phase_pos_mul`), and the sign rotation
`w ↦ σ w` (`integral_rot_gaussC`, `hfun_neg`, as in `coefficient_eq_signed`). The dilation
coefficients are defined by the recurrence that mirrors the ladders (`T[0,0; g,h] = δ`,
`λ^{-1/2}` written `μ`):

```
T[e+1,f; g,h] = ( μ (√g T[e,f; g−1,h] + √(h+1) T[e,f; g,h+1]) − √f T[e,f−1; g,h] ) / √(e+1)
T[0,f+1; g,h] = ( μ (√h T[0,f; g,h−1] + √(g+1) T[0,f; g+1,h]) ) / √(f+1)
```

(from `w h_{e,f} = √(e+1) h_{e+1,f} + √f h_{e,f−1}`, `w̄ h_{e,f} = √(f+1) h_{e,f+1} + √e h_{e−1,f}`,
which are `ComplexHermite.A0/A1` plus `pderiv1_H_succ`/`pderiv0_H_succ` and `H_succ_right`); the
closed form `T = λ^{−k/2} (−1)^{n+m} √(C(n+k,n)/C(m+k,m)) C(n,m) r^m (1−r)^{n−m}` (`k = e−f ≥ 0`,
`n = f`, `m = h`, `r = 1/λ`) is the numerical cross-check, not the definition. The non-canonical
coefficients `g > h + 1` come from `canonicalCoefficient_reflection` (`I_{g,h} = √((h+1)/g)
I_{h+1,g−1}`, on master).

**The operator as a functional transpose.** The kernel never forms `Q_r^j h_{c,d}`. A vector
`K : (e,f) ↦ ℝ` on `{e + f ≤ D'}` *represents the functional* `p ↦ K_s(p)` on
`span{h_{e,f} : e+f ≤ D'}` through `K_{e,f} = K_s(h_{e,f})`; multiplying the argument by `w`, `w̄`,
`w w̄` or a real scalar acts on the vector by the **transposed ladders**

```
(wᵀK)_{c,d}   = √(c+1) K_{c+1,d} + √d K_{c,d−1}
(w̄ᵀK)_{c,d}   = √(d+1) K_{c,d+1} + √c K_{c−1,d}
((ww̄)ᵀK)_{c,d} = (c+d+1) K_{c,d} + √((c+1)(d+1)) K_{c+1,d+1} + √(cd) K_{c−1,d−1}
```

(each defined on one degree less), and `(a p + b q)ᵀ = a pᵀ + b qᵀ`. With `Sphase = Σ_t C_t U^i V^j W^k`
(the 1,140 terms of `phaseTerms`, exactly master's definition) the node operator is

```
Q_rᵀ K = (r/2)(wᵀ − w̄ᵀ) Σ_{(i,j,k)} C_{ijk} s^i ((ww̄)ᵀ)^j ((r/2)(wᵀ + w̄ᵀ))^k K,
J^{(j)}(s) = (−1)^j e^{−αs} (Q_rᵀ)^j K    on c + d ≤ D_out.                                        (8.3)
```

Evaluation order (Krylov in both commuting operators, nothing recomputed): for `j' = 0..17` keep
`V_{j'} := ((ww̄)ᵀ)^{j'} K` (one `(ww̄)ᵀ` step from `V_{j'−1}`), and for `k = 0..34 − 2j'` the vectors
`X_k := ((r/2)(wᵀ+w̄ᵀ))^k V_{j'}` (one step each), accumulating `P_{j'k}(s) · X_k` into the running
sum, `P_{j'k}(s) := Σ_i C_{ij'k} s^i` (an interval per node, 171 of them); finally one `(r/2)(wᵀ − w̄ᵀ)`.
Every vector is truncated to the degrees that can still reach an output (`e + f ≤ D_out + (35 − 2j' − k)`
for `X_k`), so the intermediate sizes shrink. For `j ≥ 2` the whole of (8.3) is applied `j` times
with `D_out` growing by 35 at each inner stage (`K` on `≤ D_out + 35j`). *Optional 2.4× speed-up
(not in the first version):* regroup `(w+w̄)^k (w−w̄)` by angular charge, `Q_r = (r/2) Σ_{k≥1}
(w^k − w̄^k) R_k(ww̄)` with `R_k` of degree `≤ 17` (the Laguerre–angular structure of
`phase-laguerre.json`, derived from the monomials by `(w+w̄)^k = Σ'_κ C(k,(k−κ)/2) |w|^{k−κ}(w^κ+w̄^κ)`);
then Horner in `wᵀ` and `w̄ᵀ` costs 36 ladder steps instead of 170. It needs one regrouping lemma;
the monomial form needs none.

**Radial assembly.** For `i = gradedMode q c d` (`c ≤ q+1`, `d ≤ q`), by the new radial reduction
(§8.3, the `j ≥ 1` analogue of `baseGradedCoefficient_eq_radial`),

```
a_j(i) = ⟨hvec2 i, hpow j⟩ = ∫₀^∞ e^{−s} ψ_i(s) J^{(j)}_{c,d}(s) ds,
ψ_i(s) = conj h_{q+1−c, q−d}(√s) = radialFactor (d+1−c) (q−d) s   (c ≤ d+1;  `conj_primary_laguerre`)
       = radialFactor (c−d−1) (q+1−c) s                            (c > d+1;  `conj_ev_H_swap`),
I_j = Re⟨c_j, hpow j⟩ = Σ_i c_j(i) a_j(i) = ∫₀^∞ e^{−s} G_j(s) ds,   G_j(s) = Σ_{c,d} V_{c,d}(s) J^{(j)}_{c,d}(s),
V_{c,d}(s) = Σ_q c_j(q,c,d) ψ_{gradedMode q c d}(s).
```

The kernel evaluates the Gauss–Legendre sums of these over the checker's 21,577 nodes
(`partitionSpecs`, `nodeS`, `nodeW`, `nodeShift`, the Laguerre table `lagTable`/`radialFactorI`
for `ψ`), and the analytic remainder is the hypothesis of §8.6.

### 8.2 Kernel modules (`GrotheQuadKernel/`, Mathlib-free, no `partial`, no `Task.spawn`)

| module | content |
|---|---|
| `Phase.lean` | the phase terms `(i, j, k, num, den)` (the 1,140 monomials, a literal generated from `phaseStrs`), `nodePhaseCoeffs P s : Array (Array Ival)` = `P_{j'k}(s)` for `2j'+k ≤ 34`, the exponents `λ_j = (20 + 21j)/20`, `μ_j = λ_j^{-1/2}`, `e^{−αs}` (`expNegI` on `α s`) |
| `Twist.lean` | the triangular vector `TwVec := Array (Array Fx)` (`[c][d]`, `c + d ≤ D`; `Fx` at the scale `2^KTw`, `KTw = 256`, products exact at `2^512` then rounded outward, as `Rotate.mulSA`), the `√n` table as `Fx`, the three transposed ladders `stepW`, `stepWbar`, `stepV` (each output degree `D − 1`/`D − 2`), `axpy`/`scale` by an `Ival` turned `Fx`, `applyQ P coeffs r s D_out K` = one application of (8.3) with the Krylov order, `applyQPow j` |
| `Dilate.lean` | the dilation table `dilTable P μ D' : Array (Array (Array Fx))` indexed `[charge + D'][n][m]` by the recurrence of §8.1 (computed once per process; `≈ D'³/12 ≈ 8.5·10⁵` entries for `D' = 216`, `≈ 5 s`), `dilate D' tbl I` : `K_{e,f} = λ⁻¹ Σ_m T·σ^{g+h} I_{g,h}` on `e + f ≤ D'`, restricted to a charge band `[κLo, κHi)` |
| `TwistNode.lean` | one node: `nodeShift` (reused) → `(σ, A)`; `A' = mulI (sqrtI λ) A`; the seed `seedScalarI` and the ratios `ratiosI` at `A'`; `canonicalTriangleI` at `A'` with cutoff `D'` and `dMax = D'` (all canonical pairs `c ≤ d+1`), the reflection to `c > d+1` (`reflectFx`, from `Rotate`), the signed full triangle as a `TwVec`; `dilate`; `applyQPow`; `e^{−αs}`; the node's low-band contributions `W e^{−s} ψ_i(s) J_{c,d}(s)` for `2q+1 ≤ D_low` and the node's `I`-partial `W e^{−s} Σ_{(c,d) ∈ block} V_{c,d}(s) J_{c,d}(s)` (the center coefficients are exact dyadics `m·2^{−206}`/`2^{−105}`, passed in as `Array Int`; `V_{c,d}(s)` by exact products with the `Fx` radial factors); the validity flags `twistValid` (= the checker's `nodeValid` flags at `A'` instead of `A`, plus `isPos` of `λ`'s enclosures) |
| `TwistLoop.lean` | the accumulator `TwAcc := (Int × Int) × Array (Array (Array (Int × Int)))` (the `I`-partial at scale `2^{2 KTw}` and the low-band entries `[q][c][d]`), `twistSpec`/`twistSpecs` over `List NodeSpec` with `Option.bind` (the checker's pattern), the two final checks `iPartialOK acc Imin : Bool` (`acc.lo/2^{2KTw} ≥ Imin`, `Imin` a rational given as `(num, den)`) and `lowBandOK acc center eps : Bool` (`Σ_{i ∈ low ∩ block} excursion(acc_i, c_j(i))² ≤ eps`) |

Driver (`QuadRun.lean`): `quadrun twist <j> <kLo> <kHi> <nNodes> [P]` (times the loop on the first
`n` nodes for the charge block `[kLo, kHi)` and prints the `I`-partial, the low-band checksum and the
widest enclosure), `quadrun twistnode <j> <ordinal> [P]` (one node: `J_{c,d}(s)` for the low band as
decimals, for the comparison with the prototype's `Node.J`), `quadrun twistall <j> <shards>`
(the full run in shards, results to `handoff/upper-closure/twist/`, for the validation of §8.7).

### 8.3 Soundness modules (`Grothe/UpperQuad/`, Mathlib + the kernel, kernel-checked)

| module | statements |
|---|---|
| `HermiteLadder.lean` | `X 0 * H p q = H (p+1) q + q • H p (q−1)`, `X 1 * H p q = H p (q+1) + p • H (p−1) q` (from `A0`, `A1`, `pderiv*_H_*`, `H_succ_right`), their `hfun` forms with `√`, `ww̄ hfun`; the **dilation identity** `hfun (e,f) (μ w) = Σ_{g,h} T[e,f;g,h] hfun (g,h) w` for `T` defined by the recurrence (induction on `e`, then `f`), and `T = 0` off the support |
| `TwistPhase.lean` | `(I * phiT (r, w))^j * F0 (r, w) = e^{−αs} e^{−α|w|²} (evQ_r w)^j ph(r + bw)` with `Q_r` the `CPoly` built from `phaseTerms` (unfolding `phiT`, `Sphase`, `F0`, `basePhaseArgument`); `conjP Q_r = −Q_r` |
| `TwistFunctional.lean` | `mem`/`memFx` semantics of a `TwVec` for a functional `K : CPoly → ℝ` (`∀ e f, e+f ≤ D → memFx (K (hfun e f)) (v[e][f])`), the step lemmas `stepW_sound : … → memFx (K (X 0 * hfun c d)) ((stepW v)[c][d])` etc., `axpy_sound`, hence `applyQ_sound : represents K on D → represents (K ∘ (Q_r ·)) on D − 35` and `applyQPow_sound` |
| `TwistDilate.lean` | `K_s` as a functional, (8.2) from `integral_gaussC_tilt`, the dilation identity, `phase_pos_mul`, `integral_rot_gaussC`, `hfun_neg`, `canonicalCoefficient_reflection`; `dilate_sound : memFx (K_s (hfun e f)) (dilate …)[e][f]` given the triangle enclosure at `A'` (`mem_canonicalTriangleI` at `A'`, S2 at `A'²`) |
| `TwistNodeSound.lean` | (8.1): `J_{c,d}(s) = (−1)^j e^{−αs} K_s(Q_r^j hfun c d)` (Fubini-free: pointwise identity under the integral), `node_sound : memFx (J_{c,d}(s)) (twistNode …)[c][d]` from `applyQPow_sound`, `dilate_sound`, `mem_expNegI`; the node's `I`-partial and low-band terms (`memFx2` products with `mem_radialFactorI`) |
| `TwistRadial.lean` | the radial reduction for charge-one pairs: `⟪toLp c, toLp (hpow j)⟫ = ∫_{s>0} e^{−s} (∫ conj(c(√s,w)) hpow j (√s,w) dγ) ds` for `c = hfun2 i` and `c = gradedHermiteFn N a` (Fubini on `mu2`, `integral_rot_gaussC` for the `z`-angle as in `baseGradedCoefficient_eq_radial`, `integral_gaussC_norm_sq_complex`), hence `a_j(i)` and `I_j` as radial integrals of `ψ_i J_{c,d}` and `G_j` |
| `TwistLoopSound.lean` | `twistSpecs_sound`: the accumulator encloses the exact Gauss sums `Σ_n W_n e^{−s_n} ψ_i(s_n) J_{c,d}(s_n)` (low band) and `Σ_n W_n e^{−s_n} Σ_{block} V J` (the `I`-partial), given a root in every bracket (`rootOf_mem_of_accepted`), `profileAgrees`, S2 at every node |
| `TwistBridge.lean` | **consumers**: `hwhole_j` from `Σ_b Imin_b − ρ_I ≥ I_j^min` (rationals, `decide +kernel`) through `norm_hpow_sub_sq`, `norm_hpow_one/two/three_sq`, `norm_firstCenter_sq_exact` etc.; `hlow_j` from `Σ_i |a_j(i) − c_j(i)|² ≤ (√(Σ_b eps_b) + ρ_low)²` by Parseval on the band (`norm_projOn_chargeOne_sub_graded_sq`, `ChargeOne` of `toLp (hpow j)`) and Minkowski on the finite sum, then `≤ cap²` |
| `Facts/TwistCommon.lean`, `Facts/TwistJ1Block00…`, `…J2…`, `…J3…` | `twistFact j b Imin eps : Bool` (profile flags ∧ the node loop restricted to the charge block ∧ `iPartialOK` ∧ `lowBandOK`), `twistFact_spec`, the block boundaries, and `hwhole_of_twistFacts`/`hlow_of_twistFacts`; one `native_decide` per module |

Reused from master unchanged: `canonicalCoefficient`, `coefficient_eq_signed`'s ingredients,
`canonicalCoefficient_reflection`, `integral_gaussC_tilt`, `integral_rot_gaussC`,
`integral_gaussC_norm_sq_complex`, `conj_primary_laguerre`/`conj_ev_H_swap`, the Hermite calculus of
`ComplexHermite`/`HermiteConjugation`, `norm_hpow_sub_sq`, the exact center energies, Parseval on
bands, and from #318 the whole kernel (`Basic`…`Node`), `IntervalSound`, `SeedSound`, `RatioSound`,
`PairsSound`, `ProfileSound`, `GaussSound`, `NodeSound` (node, weight, shift), `Partition`
(`partitionSpecs`, `rootOf`, `rootOf_mem_of_accepted`).

### 8.4 Error budget

Per power `j`, the certified statements are `Î_j^{lo} − ρ_I ≥ I_j^min` and
`(√(Σ_b eps_b) + ρ_low)² ≤ cap_j²`, where `Î_j` is the kernel's enclosure of the Gauss sum of `G_j`
and `eps_b` the per-block sums of squared excursions of the low-band Gauss sums from the centers.

| source | size | where it enters |
|---|---|---|
| interval widths of the triangle at `A'` (P = 512) | `≤ 2^{−290}` (the checker's measurement at `A`; `A' = A√λ` keeps the series/Watson regimes) | `K`, then `J` |
| the dilation table and the fixed-point operator (`2^{−256}` per entry per step, `≤ 34j` steps, intermediate magnitudes `≤ 2^{170}` at `D' = 216`, ladder factors `≤ 652`) | `≲ 2^{−90}` absolute on `J_{c,d}(s)` in the worst case, `≈ 2^{−200}` in practice; the kernel reports the widest enclosure, to be measured | `J`, `Î_j`, the low-band enclosures |
| the seed enclosure `J₀(A'²) ∈ seedJ0I` | an explicit hypothesis (S2 of #303 at the argument `A'²`) | every node |
| the Gauss–Legendre remainder of the radial integrals (twisted S6b/c) | the hypotheses `ρ_I`, `ρ_low` of §8.6: `ρ_I = 10⁻¹², 5·10⁻¹⁴, 3·10⁻¹⁴`; `ρ_low = 10⁻¹¹, 10⁻¹⁰, 10⁻¹¹` | the final inequalities |
| **margins** (prototype values, §6.3/PR #316) | `I_j − I_j^min = 7.58·10⁻¹², 3.51·10⁻¹³, 2.61·10⁻¹³`; low-band `‖a − c‖ = 7.3·10⁻¹⁷, 2.9·10⁻¹⁷, 3.8·10⁻¹⁸` against `cap = 4.0·10⁻¹¹, 3.8·10⁻¹⁰, 4.8·10⁻¹¹` | after `ρ_I`: `6.6·10⁻¹²`, `3.0·10⁻¹³`, `2.3·10⁻¹³` to spare; the low bands are not close |

The prototype's evidence for the remainder hypotheses: `E φ^{2j}` by the same radial rule to
`3·10⁻¹⁶`/`3·10⁻¹⁵`/`6·10⁻¹⁵` relative (`8·10⁻²²` absolute for `j = 1`) and `I_j` by the two routes
to `1.7·10⁻²¹`, `7·10⁻²⁵`, `5·10⁻²⁷`; the chosen `ρ_I` are `10⁹` above that. The tolerances
`Imin_b`, `eps_b` of the facts are fixed from a `quadrun twistall` run before the facts are
written (as `epsBlock`/`bndBlock` were for the checker).

### 8.5 Cost and sharding (estimates; the measured numbers are in §8.8)

Per node and power (fixed point, `≈ 0.4 µs` per exact product-and-add as measured in the
checker's accumulation; `N = (D'+1)(D'+2)/2 ≈ 23.7k` entries for `D' = 216`):

| step | `j = 1` (`D_out = 181`, `D' = 216`) | `j = 2` (`91`, `161`) | `j = 3` (`51`, `156`) |
|---|---|---|---|
| seed, ratios, triangle at `A'` (floating, P = 512) | 0.4 s | 0.25 s | 0.25 s |
| dilation (`D'³/12` products) | 0.35 s | 0.15 s | 0.15 s |
| operator (8.3): ≈ 170 ladder steps × `N` entries × ≈ 1.5 µs + 171 `axpy` × `N` × 0.4 µs | 7 s | 2 × 2.5 s | 3 × (shrinking) ≈ 7 s |
| radial factors, center contraction, low band | 0.3 s | 0.2 s | 0.1 s |
| **per node** | **≈ 8 s** | **≈ 6 s** | **≈ 8 s** |
| × 21,577 nodes | 48 CPU-h | 36 CPU-h | 48 CPU-h |

Total ≈ 130 CPU-h single-fact (≈ 55 with the charge regrouping of §8.1), to be measured on big in
step 3 before the facts are cut.

**Sharding (no committed data, the checker's decision (i) of `docs/QUAD_CHECKER.md` §11.4):** by
output angular charge `κ = c − d`. Each fact runs the full node loop (triangle and dilation of
every node) but computes `J_{c,d}` only for `κ ∈ [κ_b, κ_{b+1})`, which needs `K` on the charges
`[κ_b − 18j, κ_{b+1} + 18j)` (the operator shifts the charge by `≤ 18` per application): the
overhead over a single fact is `Σ_b (w_b + 36j)/(2 D_out + 1)`. The `I`-partial and the low band
are partitioned with the pairs, so the final theorem only adds rationals. Proposed cuts:
`j = 1`: 8 blocks of width ≈ 45 over `κ ∈ [−181, 181]` (overhead 1.8×, ≈ 11 h each);
`j = 2`: 4 blocks of width ≈ 46 over `[−91, 91]` (2.6×, ≈ 24 h each — or 3 blocks);
`j = 3`: 2 blocks over `[−51, 51]` (2.1×, ≈ 50 h each) or one fact (48 h; droplet only).
About 14 facts, ≈ 250 CPU-h in all, once, cached by CI like the cap rows and the twelve grade
blocks. *Alternative with data:* node-range shards with committed partials — here the partials
are small (one scalar plus 6,552/6,552/112 dyadic intervals per range: ≈ 260 KB per range, ≈ 3 MB
per power for 12 ranges), no recomputation (≈ 130 CPU-h in all, any fact size); the final fact adds
the tables. The user's standing preference is no intermediate data; the choice is theirs once the
per-node time is measured.

### 8.6 What stays an explicit hypothesis (analytic debt)

1. **S2 at `A'²`** (the seed enclosure `J₀(x) ∈ seedJ0I`), at every node — the same unproved lemma as
   the checker's, at the argument `λ A²` instead of `A²`.
2. **The twisted Gauss–Legendre remainder** (new, the analogue of S6b/c for the integrands
   `e^{−s} ψ_i(s) J^{(j)}_{c,d}(s)` and `e^{−s} G_j(s)`), stated as two hypotheses per power:
   `|I_j − Î_j^{Gauss}| ≤ ρ_I` and `Σ_{i ∈ low} |a_j(i) − â_j^{Gauss}(i)|² ≤ ρ_low²`. The ingredients
   of a proof are the checker's (Mehler for `ψ`, `|I_{c,d}(A)| ≤ exp((Im A)² + √(2(c+d))|Im A|)` for
   complex `A`, the analyticity of `A(s)` away from the profile zeros) plus the explicit polynomial
   `Q_r` and the dilation (entire in `s`); whoever discharges S6b/c for `F₀` discharges these with
   the same tools. Route E's claim of "no new analytic obligation" was tied to its truncation
   estimate and falls with it (§8.0).

Everything else is proved: the interval layer, the seed/ratio/pair recurrences (S3, S4), the
node and weight enclosures, the profile binding, the Hermite ladders and the dilation identity,
the phase identity, the functional transposes, the radial reduction, the Gauss-sum accumulation,
and the two consumers.

### 8.7 Validation plan (step 3, before any proof)

On big (`~/claude-b9ee-upper-port`, ≤ 8 cores, `nice -n 10`, the `ProductionRetainedEnergy`
closure copied from `~/claude-b9ee-quad-m4/repo/.lake/build`):
1. `quadrun twistnode j <ordinal>` at the row-227 node and at nodes near the three profile zeros,
   against the prototype's per-node `J` (`Node.J` of `tools/upper_closure_spike.py`, float64):
   agreement to `≈ 10⁻¹⁴` on the low band (`c + d ≤ 51`), and the Parseval check
   `Σ_{c,d} J_{c,d}² ≤ E_w[φ^{2j}]` per node.
2. The dilation table against the closed form (Python, exact rationals with `√` as floats) and
   the kernel's `applyQ` against a direct float64 Hermite-matrix product at one node.
3. `quadrun twistall j 40`: `Î_j` against the prototype's `I` (`2.5684893045809268e-6`,
   `5.6671933554229e-10`, `1.278653939268252e-11`) to `10⁻¹²`, `5·10⁻¹⁴`, `3·10⁻¹⁴`; the assembled
   low-band coefficients against `assemble-j{j}-checker-coeffs.npz` to `10⁻¹³`; the widest
   enclosure and the per-node time (the inputs of §8.5 and of the tolerances `Imin_b`, `eps_b`).

### 8.8 Status of the implementation (claude-b9ee worker, 5 November 2026, 06:00 Bucharest)

**Kernel** (`GrotheQuadKernel/Twist, Dilate, Phase, TwistNode, TwistLoop`, driver `quadrun twistnode |
twist | twistdump | twistshard | twistmerge`, data `data/quad-checker/phase.txt` and
`handoff/quad-checker/center-{1,2,3}.txt` from `tools/quad_gen_phase.py`). Two changes of design against
§8.2, both forced by measurements:

* **The operator runs in the unnormalised basis `H_{c,d} = √(c! d!) h_{c,d}`.** In the normalised basis
  the transposed ladders carry the irrational factors `√(c+1), √d, …`, so every step rounds; at the
  fixed scale `2^256` the ladder amplification (`≤ 652` per `(ww̄)ᵀ`, `≤ 35` per `(w ± w̄)ᵀ`, up to 51
  steps) turned the rounding `2^{−256}` into widths `2^{−21}` on `J` entries of size `2^{−22}`: the
  Krylov vectors span a dynamic range of `2^{300}` and absolute rounding is the wrong arithmetic. In
  the unnormalised basis the ladders are **integer** (`(wᵀK')_{c,d} = K'_{c+1,d} + d K'_{c,d−1}`,
  `((ww̄)ᵀK')_{c,d} = K'_{c+1,d+1} + (c+d+1) K'_{c,d} + c d K'_{c−1,d−1}`), so the whole Krylov
  computation is exact; the only roundings are the input `K'` (scale `2^KTw`, `KTw = 512`), the 171
  node scalars, and two per application. Measured widths of `J` at node 227: `2^{−343}` (j = 1),
  `2^{−282}` (j = 2), `2^{−187}` (j = 3).
* **The dilation runs in fixed point at `2^KDil`, `KDil = 1024`**, not in floating intervals: the
  dilated functional's tiny high-degree entries are multiplied by `√(e! f!) ≤ 2^{550}`, so the
  absolute rounding must be below `2^{−1000}`; at that scale the exact products are 3× faster than the
  interval arithmetic and the results are identical to every printed digit.
* The Krylov loops run over `j' + k ≤ 17` (171 nonzero scalars: `Sphase` has total degree 17), not
  `2j' + k ≤ 34` as §8.1 wrote (that bound is the `w`-degree, attained only at `j' = 17`).

**Per-node cost, measured** (`quadrun twistnode j 227`, P = 512; big = one EPYC core of the big
droplet at load ≈ 24 under `nice 10`, laptop = one Apple core):

| j | triangle at A' | dilation | operator (j applications) | whole J, big | whole J, laptop | mean over the 56 sample nodes, big (before the dilation fix) |
|---|---|---|---|---|---|---|
| 1 | 0.5 s | 2.2 s | 15.3 s | 17.5 s | 7.5 s | 13.9 s |
| 2 | 0.2 s | ≈ 1.0 s | 9.4 s | ≈ 11 s | ≈ 6 s | — |
| 3 | 0.2 s | 1.0 s | 10.5 s | 11.6 s | 5.7 s | 8.3 s |

Node 227 (`s = 1.51`) is among the slowest nodes (large `K'` entries); the sample means are 30 %
lower. Full partition on big, single fact: ≈ 70 / 50 / 45 CPU-h (j = 1, 2, 3), **≈ 165 CPU-h in all**
(≈ 85 on laptop-class cores); the operator is 85 % of it, and within the operator the 171 scalar
products of a big-integer coefficient with an N-vector per application (not the ladder steps)
dominate, so the charge regrouping of §8.1 saves ≈ 25 % of the operator, not 2.4×. The sharding
overhead of output-charge blocks is as in §8.5; node ranges with the ≈ 3 MB partials have none.

**Validation (§8.7), done:**
1. Node 227, j = 3: every `J_{c,d}` (`c + d ≤ 51`) within `9.9·10⁻²⁴` of the prototype's `Node.J`
   (all inside the enclosures, widths `≤ 6·10⁻³⁶`); the node's `I`-term `W e^{−s} Σ V J` agrees to
   `4·10⁻¹⁶` relative; Parseval at the node `Σ J² = 2.341007·10⁻¹⁵ ≤ E_w φ⁶ = 2.341021·10⁻¹⁵`.
2. The dilation recurrence of `Dilate.lean` against the closed form (2): max difference `≤ 2·10⁻⁵⁵`
   over 6,391–20,336 entries (`D ≤ 60`, all three `λ_j`; `tools`-free check in 60-digit decimals).
3. A sample of 56 nodes per power (every 500th ordinal, 227, 771, the three nodes nearest to each
   profile zero, the last node; `quadrun twistdump`, `tools/quad_twist_sample.py` against the
   prototype's per-node arrays on big): `|J_kernel − J_proto| ≤ 10⁻¹⁴` at 42 of 56 nodes
   (`10⁻²⁹ … 10⁻¹⁵` absolute, i.e. float64 accuracy), and `1·10⁻¹³ … 4·10⁻¹²` at the 14 nodes with
   `s ∈ [20.8, 25.2]` where `|J| ≈ 0.07 … 0.2`: there the **prototype** loses `≈ 10⁻¹¹` relative in the
   phase polynomial (`S ≈ 10¹⁰` at `U ≈ 25` with cancelling terms), while the kernel's enclosures
   have widths `≤ 2^{−105}`; the per-node `I`-terms agree to `≤ 3.3·10⁻²³` (j = 1), `7.7·10⁻²⁷`
   (j = 2), `2.3·10⁻²⁷` (j = 3). So the kernel reproduces the prototype to the prototype's accuracy
   everywhere, and the prototype's `I_j` (whose per-node errors sum to `≲ 10⁻¹⁸`) are a valid
   reference for the full sums at `10⁻¹²`.
4. The full runs (`quadrun twistshard`, 8 shards × powers 3, 2, 1 in sequence, cores 40–47 of big,
   `nice 10`; outputs `~/claude-b9ee-upper-port/full/twist-j{j}-{i}.txt`, logs `shard-{i}.log`)
   were launched on 5 November 05:46 Bucharest; ≈ 21 h wall. `quadrun twistmerge j 8 <dir>` then
   gives `I_j` (to compare with `2.5684893045809268e-6`, `5.6671933554229e-10`,
   `1.278653939268252e-11`) and the low-band comparison with the centers.

**Soundness, started:** `Grothe/UpperQuad/TwistSound.lean` (built): the exact ladders `X0_mul_H`,
`X1_mul_H`, `X0_X1_mul_H`; `Represents F D v` (a `TwVec` encloses `(F (H c d)).re`, `F : CPoly →+ ℂ`)
and the soundness of `stepW/stepWbar/stepX/stepY/stepV` (as `mulLeft m F`), `axpy`, `twZero`,
`roundVec`, `scaleTw`. Next: the loop lemmas (`rowLoop`, `rowsLoop`, `applyQ`, `applyQPow`), the
phase identity, the dilation (`integral_gaussC_tilt` + the recurrence by induction), the radial
reduction, the node and loop theorems, the consumers (§8.3).
