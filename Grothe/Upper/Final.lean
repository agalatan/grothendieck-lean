import Grothe.Upper.Residual
import Grothe.Upper.Head
import Grothe.Upper.Data

/-!
# `K_G^ℂ ≤ 280923000000000/199999855886501 < 1.404616013`

One rounding kernel `H(t) = Σ_{n,m} E[n,m] p(t)^n (−τ(t))^m` (see `Data.lean`), compared with the
linear kernel `c·t`, `c = 200000/280923`:

* the residual up to degree `501` is at most `9/200000000`: the interval checker certifies
  (`head_check`, by `native_decide`) that the head of the kernel of the stored energies `Ê` is
  within `headCapQ = 6.7·10⁻¹⁰` of `c·t`, and the energies `E` are within `energyErrQ` of `Ê` in
  `ℓ¹` (hypothesis `energy_close`);
* the residual beyond degree `501` is at most `117/250000000`, by Cauchy–Schwarz from the
  weighted square-sum bound of the hypothesis `hardy`;
* hence `‖H − c·t‖_𝒜 ≤ 513/10⁹` and `K_G^ℂ ≤ 1/(c − 513/10⁹)` (`residual_transfer`).
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

/-- The analytic and numerical inputs of the upper bound, for the energy table `E` of the
rounding (`E (n, m)` is the energy of primary degree `n` and auxiliary degree `m`). -/
structure KernelHyps (E : ℕ × ℕ → ℝ) : Prop where
  /-- The kernel `z ↦ Σ_j kernelCoeff E j · z|z|^{2j}` is dominated (it is the correlation kernel
  of a rounding). -/
  valid : DominatedKernel (radialKernel (kernelCoeff E))
  /-- The energies are summable. -/
  summable : Summable fun p => |E p|
  /-- Only odd total degrees occur. -/
  parity : ∀ p : ℕ × ℕ, (p.1 + p.2) % 2 = 0 → E p = 0
  /-- The weighted square sum of the kernel coefficients at radius `83/80` is at most `363`. -/
  hardy : ∀ J, ∑ n ∈ range J, kernelCoeff E n ^ 2 * (83 / 80 : ℝ) ^ (2 * (2 * n + 1)) ≤ 363
  /-- The energies with `n + 3m ≤ 501` are within `energyErrQ` of the stored ones, in `ℓ¹`. -/
  energy_close : ∑ p ∈ headIdx 501, |E p - (energyTable p : ℝ)| ≤ (energyErrQ : ℝ)

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

theorem head_budget : headCapQ + energyErrQ ≤ 9 / 200000000 := by
  norm_num [headCapQ, energyErrQ]

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

/-- The residual up to degree `501`. -/
theorem head_le {E : ℕ × ℕ → ℝ} (hE : KernelHyps E) :
    ∑ j ∈ range 251, |kernelCoeff E j - if j = 0 then (slopeQ : ℝ) else 0| ≤ 9 / 200000000 := by
  have h1 := head_residual_le primaryPoly auxPoly l1_primaryPoly l1_auxPoly auxPoly_coeff_zero E
    (fun p => (energyTable p : ℝ)) hE.parity (N := 501) (K := 251) (by norm_num) (slopeQ : ℝ)
  have h5 : (headCapQ : ℝ) + energyErrQ ≤ 9 / 200000000 := by
    have := (Rat.cast_le (K := ℝ)).2 head_budget
    push_cast at this
    exact this
  have := head_stored_le
  have := hE.energy_close
  unfold kernelCoeff
  linarith

/-- The exact comparison `363 · (80/83)^{1006} ≤ (117/250000000)² (1 − (80/83)⁴)` of the tail. -/
theorem tail_numeric :
    (363 : ℝ) * (83 / 80 : ℝ)⁻¹ ^ (2 * (2 * 251 + 1))
      ≤ (117 / 250000000 : ℝ) ^ 2 * (1 - (83 / 80 : ℝ)⁻¹ ^ 4) := by
  have hN : (363 * 80 ^ 1006 * 2966145062500000000000000 : ℕ) ≤ 88955516169 * 83 ^ 1006 := by
    decide +kernel
  have hR : (363 * 80 ^ 1006 * 2966145062500000000000000 : ℝ) ≤ 88955516169 * 83 ^ 1006 := by
    have := (Nat.cast_le (α := ℝ)).2 hN
    rw [Nat.cast_mul, Nat.cast_mul, Nat.cast_mul, Nat.cast_pow, Nat.cast_pow] at this
    simpa only [Nat.cast_ofNat] using this
  norm_num
  rw [div_pow, mul_div_assoc', div_le_div_iff₀ (by positivity) (by norm_num)]
  exact hR

/-- The residual beyond degree `501`. -/
theorem tail_le {E : ℕ × ℕ → ℝ} (hE : KernelHyps E) :
    ∑' n, |kernelCoeff E (n + 251)| ≤ 117 / 250000000 :=
  hardy_tail (kernelCoeff E) (83 / 80) (by norm_num) 363 hE.hardy 251 _ (by norm_num)
    tail_numeric

/-- **Main theorem.**  `K_G^ℂ ≤ 280923000000000/199999855886501 < 1.404616013`.

The rounding is the smoothed two-coordinate Gaussian rounding described in `Data.lean`; `E (n, m)`
is its chaos energy of primary degree `n` and auxiliary degree `m`, and its correlation kernel is
`H(t) = Σ_{n,m} E[n,m] p(t)^n (−τ(t))^m = Σ_j kernelCoeff E j · t^{2j+1}`.  Hypotheses
(`hE : KernelHyps E`):

* `valid` (mathematical lemma): `z ↦ Σ_j kernelCoeff E j · z|z|^{2j}` is a dominated kernel, i.e.
  it is the correlation kernel of the rounding, the correlations `p` and `−τ` being realised by
  tensor powers;
* `summable`, `parity` (mathematical lemmas): `Σ |E| < ∞` (Parseval gives `E ≥ 0`, `Σ E ≤ 1`) and
  `E (n, m) = 0` for `n + m` even;
* `hardy`: `Σ_j (kernelCoeff E j)² (83/80)^{2(2j+1)} ≤ 363`.  This is the Parseval form of a
  mean-square bound for `H` on the circle `|t| = 83/80`.  It combines a mathematical lemma (the
  analytic continuation of the Gaussian correlation, with its total-variation density) and a
  *numerical enclosure*: the contour certificate of the source computation (16 384 arcs, Arb ball
  arithmetic), which gives the bound `362.772 < 363`;
* `energy_close`: `Σ_{n+3m ≤ 501} |E (n, m) − Ê (n, m)| ≤ energyErrQ ≈ 4.43036·10⁻⁸`, where `Ê` is
  the stored table (`energyTable`, binary64 numbers read as exact rationals).  This is a
  *numerical enclosure*: it is the error budget of the source computation of the energies
  (directed Arb quadrature at 21 577 nodes, binary64 contraction, reflection and rotation of
  5 334 252 coefficients) under its Arb / IEEE binary64 execution model.

What is proved here: the kernel of the stored table is within `6.694·10⁻¹⁰ ≤ headCapQ` of `c·t`
up to degree `501` (`head_check`, the interval computation); with the assumed table error budget
`4.43036·10⁻⁸` this gives the head bound `≤ 4.5·10⁻⁸ = 9/200000000` (`head_le`), so the assumed
budget is 98.5 % of the head bound.  The tail bound `117/250000000` follows from `hardy`
(`tail_le`), and the transfer inequality gives the constant. -/
theorem complex_grothendieck_upper (E : ℕ × ℕ → ℝ) (hE : KernelHyps E) :
    IsGrothendieckBound (280923000000000 / 199999855886501) := by
  have hs : Summable fun n => |kernelCoeff E n| :=
    summable_abs_bivarKernel primaryPoly auxPoly l1_primaryPoly l1_auxPoly E hE.summable
  have hres : |kernelCoeff E 0 - (slopeQ : ℝ)| + ∑' n, |kernelCoeff E (n + 1)|
      ≤ 513 / 1000000000 := by
    rw [residual_split (kernelCoeff E) hs (slopeQ : ℝ) 250]
    have h1 := head_le hE
    have h2 := tail_le hE
    norm_num at h1 h2 ⊢
    linarith
  have hc : (513 / 1000000000 : ℝ) < (slopeQ : ℝ) := by norm_num [slopeQ]
  refine (residual_transfer (kernelCoeff E) hs hE.valid (slopeQ : ℝ) _ hc hres).mono
    (le_of_eq ?_)
  norm_num [slopeQ]

/-- The certified bound is below `1.404616013`. -/
theorem upper_value_lt : (280923000000000 / 199999855886501 : ℝ) < 1.404616013 := by norm_num

end Grothe
