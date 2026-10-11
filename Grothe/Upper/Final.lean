import Grothe.Upper.Residual
import Grothe.Upper.Head
import Grothe.Upper.Data

/-!
# `K_G^ℂ ≤ 87787300000000/62499883242891 < 1.404599424`

The rounding kernel `H(t) = Σ_{n,m} E[n,m] p(t)^n (−τ(t))^m` (see `Data.lean`) is compared with the
linear kernel `c·t`, `c = 625000/877873`, through the kernel `H_X` of a truncation `X` of the
rounding and the kernel `H₀` of the rounding without phase:

* `‖H − H_X‖_𝒜 ≤ Σ |E − E_X| ≤ 2497/(2·10⁹)` (hypothesis `compare` and the `ℓ¹` contraction of the
  composition);
* the residual of `H_X` up to degree `501` is at most `headCapQ + energyErrQ`: the interval checker
  certifies (`head_check`, by `native_decide`) that the head of the kernel of the stored energies
  `Ê` is within `headCapQ = 7.143·10⁻⁹` of `c·t`, and the energies `E_X` are within `energyErrQ` of
  `Ê` in `ℓ¹` (hypothesis `energy_close`);
* the coefficients of `H_X` beyond degree `501` are those of `H₀`, at most `72/10⁹` in total by
  Cauchy–Schwarz from the weighted square-sum bound of the hypothesis `hardy`, plus those of
  `H_X − H₀` (hypothesis `corr_tail`);
* hence `‖H − c·t‖_𝒜 ≤ 133/10⁸` and `K_G^ℂ ≤ 1/(c − 133/10⁸)` (`residual_transfer`).
-/

namespace Grothe

open Upper GrotheKernel Polynomial Finset

namespace Upper

/-- The stored energy `Ê[n,m]` of the index pair `p = (n, m)` (zero if not stored). -/
def energyTable (p : ℕ × ℕ) : ℚ := tabVal energyRows p

/-- The polynomial `P`: the primary correlation is `p(t) = t·P(t²)`. -/
noncomputable def primaryPoly : ℝ[X] := ofListQ pList

/-- The polynomial `Q`: the auxiliary correlation is `−τ(t) = t·Q(t²)`. -/
noncomputable def auxPoly : ℝ[X] := ofListQ qList

/-- The radial coefficients of the kernel with energies `E`:
`H(t) = Σ_{n,m} E[n,m] p(t)^n (−τ(t))^m = Σ_j kernelCoeff E j · t^{2j+1}`. -/
noncomputable def kernelCoeff (E : ℕ × ℕ → ℝ) : ℕ → ℝ := bivarKernel primaryPoly auxPoly E

/-- The analytic and numerical inputs of the upper bound, for the energy tables `E` of the
rounding, `EX` of its truncation `X` and `E0` of the rounding without phase (`E (n, m)` is the
energy of primary degree `n` and auxiliary degree `m`). -/
structure KernelHyps (E EX E0 : ℕ × ℕ → ℝ) : Prop where
  /-- The kernel `z ↦ Σ_j kernelCoeff E j · z|z|^{2j}` is dominated (it is the correlation kernel
  of a rounding). -/
  valid : DominatedKernel (radialKernel (kernelCoeff E))
  /-- The energies of the rounding are summable. -/
  summable : Summable fun p => |E p|
  /-- The energies of the truncation are summable. -/
  summableX : Summable fun p => |EX p|
  /-- The energies of the rounding without phase are summable. -/
  summable0 : Summable fun p => |E0 p|
  /-- Only odd total degrees occur in the truncation. -/
  parityX : ∀ p : ℕ × ℕ, (p.1 + p.2) % 2 = 0 → EX p = 0
  /-- The energies of the rounding and of its truncation are within `compareQ` in `ℓ¹`. -/
  compare : ∑' p, |E p - EX p| ≤ (compareQ : ℝ)
  /-- The energies of the truncation with `n + 3m ≤ 501` are within `energyErrQ` of the stored
  ones, in `ℓ¹`. -/
  energy_close : ∑ p ∈ headIdx 501, |EX p - (energyTable p : ℝ)| ≤ (energyErrQ : ℝ)
  /-- The kernel of `EX − E0` beyond degree `501` is at most `corrTailQ`. -/
  corr_tail : ∑' n, |kernelCoeff (fun p => EX p - E0 p) (n + 251)| ≤ (corrTailQ : ℝ)
  /-- The weighted square sum of the kernel coefficients of the rounding without phase at radius
  `259/250` is at most `7/4`. -/
  hardy : ∀ J, ∑ n ∈ range J, kernelCoeff E0 n ^ 2 * (259 / 250 : ℝ) ^ (2 * (2 * n + 1)) ≤ 7 / 4

end Upper

/-! ### The finite facts -/

/-- All stored indices satisfy `n + 3m ≤ 501`. -/
theorem energyRows_within : tabWithin 501 energyRows = true := by native_decide

/-- The rows and the entries of each row are listed in increasing order of their indices; in
particular every index pair is stored once. -/
theorem energyRows_sorted : tabSorted energyRows = true := by native_decide

/-- **The finite computation**: the head of the kernel of the stored energies. -/
theorem head_check : headInt 501 energyRows pList qList slopeQ ≤ ofRatLo headCapQ := by
  native_decide

theorem pList_norm : (pList.map fun q => |q|).sum ≤ 1 := by native_decide

theorem qList_norm : (qList.map fun q => |q|).sum ≤ 1 := by native_decide

theorem budget : compareQ + (headCapQ + energyErrQ) + (72 / 1000000000 + corrTailQ)
    ≤ 133 / 100000000 := by
  norm_num [compareQ, headCapQ, energyErrQ, corrTailQ]

/-! ### Assembly -/

lemma l1_primaryPoly : l1 primaryPoly ≤ 1 :=
  (l1_ofListQ_le pList).trans (by exact_mod_cast pList_norm)

lemma l1_auxPoly : l1 auxPoly ≤ 1 :=
  (l1_ofListQ_le qList).trans (by exact_mod_cast qList_norm)

lemma auxPoly_coeff_zero : auxPoly.coeff 0 = 0 := by
  unfold auxPoly
  rw [coeff_ofListQ]
  simp [qList]

/-- The head of the kernel of the stored energies is within `headCapQ` of `c·t`. -/
theorem head_stored_le :
    ∑ j ∈ range 251, |∑ p ∈ headIdx 501,
        (energyTable p : ℝ) * (termOf primaryPoly auxPoly p).coeff j
          - if j = 0 then (slopeQ : ℝ) else 0| ≤ (headCapQ : ℝ) := by
  have h2 := head_sound energyRows_within pList qList slopeQ
  have e : (501 + 1) / 2 = 251 := by norm_num
  rw [e] at h2
  have h3 : (headInt 501 energyRows pList qList slopeQ : ℝ) ≤ (headCapQ : ℝ) * D :=
    (Int.cast_le.2 head_check).trans (ofRatLo_le _)
  exact le_of_mul_le_mul_right (h2.trans h3) D_pos

/-- The residual of the kernel of the truncation up to degree `501`. -/
theorem head_le {E EX E0 : ℕ × ℕ → ℝ} (hE : KernelHyps E EX E0) :
    ∑ j ∈ range 251, |kernelCoeff EX j - if j = 0 then (slopeQ : ℝ) else 0|
      ≤ (headCapQ : ℝ) + energyErrQ := by
  have h1 := head_residual_le primaryPoly auxPoly l1_primaryPoly l1_auxPoly auxPoly_coeff_zero EX
    (fun p => (energyTable p : ℝ)) hE.parityX (N := 501) (K := 251) (by norm_num) (slopeQ : ℝ)
  have := head_stored_le
  have := hE.energy_close
  unfold kernelCoeff
  linarith

/-- The exact comparison `(7/4) · (250/259)^{1006} ≤ (72/10⁹)² (1 − (250/259)⁴)` of the tail. -/
theorem tail_numeric :
    (7 / 4 : ℝ) * (259 / 250 : ℝ)⁻¹ ^ (2 * (2 * 251 + 1))
      ≤ (72 / 1000000000 : ℝ) ^ 2 * (1 - (259 / 250 : ℝ)⁻¹ ^ 4) := by
  have hN : (7 * 250 ^ 1006 * 4499860561000000000000000000 : ℕ)
      ≤ 12309108592896 * 259 ^ 1006 := by
    decide +kernel
  have hR : (7 * 250 ^ 1006 * 4499860561000000000000000000 : ℝ)
      ≤ 12309108592896 * 259 ^ 1006 := by
    have := (Nat.cast_le (α := ℝ)).2 hN
    rw [Nat.cast_mul, Nat.cast_mul, Nat.cast_mul, Nat.cast_pow, Nat.cast_pow] at this
    simpa only [Nat.cast_ofNat] using this
  have e0 : 2 * (2 * 251 + 1) = 1006 := by norm_num
  have e1 : (259 / 250 : ℝ)⁻¹ = 250 / 259 := by norm_num
  have hb : (0 : ℝ) < 259 ^ 1006 := by positivity
  rw [e0, e1, div_pow]
  generalize (250 : ℝ) ^ 1006 = a at hR ⊢
  generalize (259 : ℝ) ^ 1006 = b at hR hb ⊢
  rw [show (7 / 4 : ℝ) * (a / b) = 7 * a / (4 * b) by ring, div_le_iff₀ (by positivity)]
  norm_num
  linarith

/-- The kernel of the rounding without phase beyond degree `501`. -/
theorem tail_le {E EX E0 : ℕ × ℕ → ℝ} (hE : KernelHyps E EX E0) :
    ∑' n, |kernelCoeff E0 (n + 251)| ≤ 72 / 1000000000 :=
  hardy_tail (kernelCoeff E0) (259 / 250) (by norm_num) (7 / 4) hE.hardy 251 _ (by norm_num)
    tail_numeric

/-- The residual of the kernel of the truncation. -/
theorem residualX_le {E EX E0 : ℕ × ℕ → ℝ} (hE : KernelHyps E EX E0) :
    |kernelCoeff EX 0 - (slopeQ : ℝ)| + ∑' n, |kernelCoeff EX (n + 1)|
      ≤ (headCapQ : ℝ) + energyErrQ + (72 / 1000000000 + corrTailQ) := by
  have hsX : Summable fun n => |kernelCoeff EX n| :=
    summable_abs_bivarKernel primaryPoly auxPoly l1_primaryPoly l1_auxPoly EX hE.summableX
  have hs0 : Summable fun n => |kernelCoeff E0 n| :=
    summable_abs_bivarKernel primaryPoly auxPoly l1_primaryPoly l1_auxPoly E0 hE.summable0
  have hd : Summable fun p => |EX p - E0 p| :=
    Summable.of_nonneg_of_le (fun _ => abs_nonneg _) (fun p => abs_sub (EX p) (E0 p))
      (hE.summableX.add hE.summable0)
  have hsc : Summable fun n => |kernelCoeff (fun p => EX p - E0 p) n| :=
    summable_abs_bivarKernel primaryPoly auxPoly l1_primaryPoly l1_auxPoly _ hd
  have hc : ∀ n, kernelCoeff (fun p => EX p - E0 p) n = kernelCoeff EX n - kernelCoeff E0 n :=
    bivarKernel_sub primaryPoly auxPoly l1_primaryPoly l1_auxPoly EX E0 hE.summableX hE.summable0
  have htail : ∑' n, |kernelCoeff EX (n + 251)| ≤ 72 / 1000000000 + corrTailQ :=
    tail_add_le (kernelCoeff EX) (kernelCoeff E0) _ hsX hs0 hsc hc 251 _ _ (tail_le hE)
      hE.corr_tail
  have hsplit := residual_split (kernelCoeff EX) hsX (slopeQ : ℝ) 250
  rw [show (250 : ℕ) + 1 = 251 from rfl] at hsplit
  have hhead := head_le hE
  rw [hsplit]
  exact add_le_add hhead htail

/-- **Main theorem.**  `K_G^ℂ ≤ 87787300000000/62499883242891 < 1.404599424`.

The rounding is `G(x) = 𝔼 F(M x + √(I − M²) Z)` with `F = F₀ · exp(iφ)`: the two-coordinate
Gaussian rounding `F₀` multiplied by a damped polynomial phase (`Data.lean`).  Three energy tables
occur, each giving a kernel `Σ_{n,m} E[n,m] p(t)^n (−τ(t))^m = Σ_j kernelCoeff E j · t^{2j+1}`: `E`
for the rounding, `E0` for `F₀`, and `EX` for the truncation `X = F₀ + v`, where `v` is a fixed
polynomial of degree `≤ 181` approximating `(iφ + (iφ)²/2 + (iφ)³/6) F₀`.  Hypotheses
(`hE : KernelHyps E EX E0`):

* `valid` (mathematical lemma): `z ↦ Σ_j kernelCoeff E j · z|z|^{2j}` is a dominated kernel, i.e.
  it is the correlation kernel of the rounding, the correlations `p` and `−τ` being realised by
  tensor powers;
* `summable`, `summableX`, `summable0`, `parityX` (mathematical lemmas): the three tables are
  summable (Parseval) and `EX (n, m) = 0` for `n + m` even;
* `compare`: `Σ |E − EX| ≤ 2497/(2·10⁹)`.  The source proves `1.2484923099·10⁻⁶`.  It combines
  *mathematical lemmas* (each energy is a sum of squared coefficients after a contraction, so the
  `ℓ¹` distance of two tables is at most `Σ_I (2‖P_I Y‖‖P_I Z‖ + ‖P_I Z‖²)` over chaos bands `I`;
  Taylor's remainder `‖F − (1 + iφ + (iφ)²/2 + (iφ)³/6)F₀‖₂ ≤ √(𝔼φ⁸)/24` with an exact Gaussian
  moment; `|φ| < 1` everywhere; a weighted Bargmann Hilbert–Schmidt bound for the coefficients of
  `F₀` outside the computed rectangle) with *numerical enclosures* (the coefficients of `F₀` in
  primary degree `≤ 1001` and auxiliary degree `≤ 501`, directed Arb quadrature at 21 577 nodes;
  the coefficients of `(iφ)^j F₀`, `j = 1, 2, 3`, through the Hermite cutoffs `181`, `91`, `51`,
  directed Arb arithmetic; the cover certifying `|φ| < 1`), under the Arb / IEEE binary64
  execution model of the source computation;
* `energy_close`: `Σ_{n+3m ≤ 501} |EX (n, m) − Ê (n, m)| ≤ energyErrQ ≈ 1.3695·10⁻¹¹`, where `Ê` is
  the stored table (`energyTable`, binary64 numbers read as exact rationals).  A *numerical
  enclosure*: the error budget of the source computation of the coefficients of `F₀` (raw
  quadrature error `5·10⁻¹²`, reflection, rotation and grouping in binary64) and of the binary64
  addition of `v`;
* `corr_tail`: the kernel of `EX − E0` (a table supported in `n + m ≤ 181`) has coefficients
  beyond degree `501` of total at most `corrTailQ ≈ 2.7288·10⁻¹¹`.  A *numerical enclosure*: a
  directed majorant `2.0·10⁻²⁷` at radius `47/40` for the computed table plus its error budget;
* `hardy`: `Σ_j (kernelCoeff E0 j)² (259/250)^{2(2j+1)} ≤ 7/4`.  This is the Parseval form of a
  mean-square bound for the kernel of `F₀` on the circle `|t| = 259/250`.  It combines a
  *mathematical lemma* (the analytic continuation of the Gaussian correlation and a weighted
  Schur estimate for the Gaussian integral operator with complex covariance) and a *numerical
  enclosure*: the contour certificate of the source computation (65 536 arcs, Arb ball
  arithmetic), which gives the bound `1.69939 < 7/4`.

What is proved here: the kernel of the stored table is within `7.14272·10⁻⁹ ≤ headCapQ` of `c·t`
up to degree `501` (`head_check`, the interval computation); the passage from tables to kernels
(`ℓ¹` contraction, locality of the head, Cauchy–Schwarz tail); and the assembly

  `2497/(2·10⁹) + 7.143·10⁻⁹ + 1.3695·10⁻¹¹ + 2.7288·10⁻¹¹ + 72/10⁹ ≤ 133/10⁸`

(`budget`), with margin `2.32·10⁻⁹` (0.17 % of the total).  Of the total residual `133/10⁸`, the
assumed comparison bound is 93.9 %, the tail bound from `hardy` 5.4 %, the computation verified
here 0.54 %, and the two small assumed budgets 0.003 %.  The transfer inequality gives the
constant. -/
theorem complex_grothendieck_upper (E EX E0 : ℕ × ℕ → ℝ) (hE : KernelHyps E EX E0) :
    IsGrothendieckBound (87787300000000 / 62499883242891) := by
  have hs : Summable fun n => |kernelCoeff E n| :=
    summable_abs_bivarKernel primaryPoly auxPoly l1_primaryPoly l1_auxPoly E hE.summable
  have hsX : Summable fun n => |kernelCoeff EX n| :=
    summable_abs_bivarKernel primaryPoly auxPoly l1_primaryPoly l1_auxPoly EX hE.summableX
  have hd : Summable fun p => |E p - EX p| :=
    Summable.of_nonneg_of_le (fun _ => abs_nonneg _) (fun p => abs_sub (E p) (EX p))
      (hE.summable.add hE.summableX)
  have e : ∀ n, kernelCoeff (fun p => E p - EX p) n = kernelCoeff E n - kernelCoeff EX n :=
    bivarKernel_sub primaryPoly auxPoly l1_primaryPoly l1_auxPoly E EX hE.summable hE.summableX
  have hsd : Summable fun n => |kernelCoeff E n - kernelCoeff EX n| :=
    (summable_abs_bivarKernel primaryPoly auxPoly l1_primaryPoly l1_auxPoly _ hd).congr
      fun n => by rw [← e n]; rfl
  have hcmp : ∑' n, |kernelCoeff E n - kernelCoeff EX n| ≤ (compareQ : ℝ) := by
    have h := tsum_abs_bivarKernel_le primaryPoly auxPoly l1_primaryPoly l1_auxPoly _ hd
    have e2 : ∑' n, |kernelCoeff E n - kernelCoeff EX n|
        = ∑' j, |bivarKernel primaryPoly auxPoly (fun p => E p - EX p) j| :=
      tsum_congr fun n => by rw [← e n]; rfl
    rw [e2]
    exact h.trans hE.compare
  have hres : |kernelCoeff E 0 - (slopeQ : ℝ)| + ∑' n, |kernelCoeff E (n + 1)|
      ≤ 133 / 100000000 := by
    have h1 := residual_perturb (kernelCoeff E) (kernelCoeff EX) hsX hsd (slopeQ : ℝ)
    have h2 := residualX_le hE
    have h3 := (Rat.cast_le (K := ℝ)).2 budget
    push_cast at h3
    linarith
  have hc : (133 / 100000000 : ℝ) < (slopeQ : ℝ) := by norm_num [slopeQ]
  refine (residual_transfer (kernelCoeff E) hs hE.valid (slopeQ : ℝ) _ hc hres).mono
    (le_of_eq ?_)
  norm_num [slopeQ]

/-- The certified bound is below `1.404599424`. -/
theorem upper_value_lt :
    (87787300000000 / 62499883242891 : ℝ) < 1.404599424 := by norm_num

end Grothe
