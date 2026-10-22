import Grothe.LowerAnalytic.FibreSup

/-!
# The two symmetries of the fibre potential and the coverage lemma for the caps (PLAN_CAPS, L-f)

The fibre potential `Ψ(s) = sup_y J(y, s)` (`pot`, `Jpot` in `FibreSup.lean`) has two symmetries,
induced by the measure-preserving maps `z ↦ z̄` and `z ↦ −z` of the standard complex Gaussian
`gaussC` (`gaussC_map_conj`, `gaussC_map_neg`).  In the packing `Fib` (`η = (y₀ + i y₃, y₁ + i y₄,
y₂ + i y₅)`, `ζ = (y₆ + i y₈, y₇ + i y₉)`, `d = y₁₀ + i y₁₁`) they act on the dual variable by

* `Fib.cj` (`S_c`): conjugate every complex coordinate, i.e. flip the real coordinates
  `y₃, y₄, y₅, y₈, y₉, y₁₁`; then `B_{S_c y}(z) = conj(B_y(z̄))` (`Fib.fn_cj`),
* `Fib.ng` (`S_-`): negate `ζ₁, ζ₂, d`, i.e. flip `y₆, …, y₁₁` (the odd functions
  `z, z(|z|²−2)/√2, iz, iz(|z|²−2)/√2, z̄, iz̄`); then `B_{S_- y}(z) = B_y(−z)` (`Fib.fn_ng`).

With `L(z̄) = conj L(z)`, `L(−z) = −L(z)`, `M S = S M`, `quad ∘ S = quad` and `S a = a` (true for
`aFib b₁ b₂ b₃`, which has real even coordinates only) this gives `J(S_c y, s) = J(y, s)`
(`Jpot_cj`) and `J(S_- y, s) = J(y, s)` (`Jpot_ng`).  Hence a cap proved on pieces `Π_i` covers
the whole fibre space as soon as the pieces and their three symmetric images cover it
(`pot_le_of_cover`, `pot_le_sup'_of_cover`).
-/

open MeasureTheory ProbabilityTheory Real Set Grothe.Lower
open scoped ComplexConjugate

namespace Grothe.LowerAnalytic

noncomputable section

/-! ### Invariance of the Gaussian -/

/-- The coordinatewise sign maps `x ↦ x`, `x ↦ −x` on `Fin 2 → ℝ`. -/
lemma stdGaussian_two_map_coord (f : Fin 2 → ℝ → ℝ) (hm : ∀ i, Measurable (f i))
    (hf : ∀ i, (gaussianReal 0 1).map (f i) = gaussianReal 0 1) :
    (stdGaussian 2).map (fun x i => f i (x i)) = stdGaussian 2 := by
  unfold stdGaussian
  rw [Measure.pi_map_pi (hμ := fun i => by rw [hf i]; infer_instance) (fun i => (hm i).aemeasurable)]
  simp only [hf]

lemma gaussianReal_map_neg_std : (gaussianReal 0 1).map (fun x : ℝ => -x) = gaussianReal 0 1 := by
  rw [gaussianReal_map_neg, neg_zero]

/-- The sign pattern of `z ↦ z̄`. -/
def sgnC : Fin 2 → ℝ → ℝ := ![fun x => x, fun x => -x]
/-- The sign pattern of `z ↦ −z`. -/
def sgnN : Fin 2 → ℝ → ℝ := ![fun x => -x, fun x => -x]

lemma toC_sgnC (x : Fin 2 → ℝ) : toC (fun i => sgnC i (x i)) = conj (toC x) := by
  simp [toC, sgnC, map_div₀, Complex.conj_ofReal]

lemma toC_sgnN (x : Fin 2 → ℝ) : toC (fun i => sgnN i (x i)) = -toC x := by
  simp [toC, sgnN]; ring

lemma measurable_sgnC (i : Fin 2) : Measurable (sgnC i) := by
  fin_cases i <;> simp [sgnC] <;> fun_prop

lemma measurable_sgnN (i : Fin 2) : Measurable (sgnN i) := by
  fin_cases i <;> simp [sgnN] <;> fun_prop

lemma map_sgnC (i : Fin 2) : (gaussianReal 0 1).map (sgnC i) = gaussianReal 0 1 := by
  fin_cases i
  · simp [sgnC, Measure.map_id']
  · simpa [sgnC] using gaussianReal_map_neg_std

lemma map_sgnN (i : Fin 2) : (gaussianReal 0 1).map (sgnN i) = gaussianReal 0 1 := by
  fin_cases i <;> simpa [sgnN] using gaussianReal_map_neg_std

lemma gaussC_map_of (g : ℂ → ℂ) (hg : Measurable g) (f : Fin 2 → ℝ → ℝ) (hm : ∀ i, Measurable (f i))
    (hf : ∀ i, (gaussianReal 0 1).map (f i) = gaussianReal 0 1)
    (hgt : ∀ x, toC (fun i => f i (x i)) = g (toC x)) : gaussC.map g = gaussC := by
  have hmf : Measurable (fun (x : Fin 2 → ℝ) i => f i (x i)) :=
    measurable_pi_iff.mpr fun i => (hm i).comp (measurable_pi_apply i)
  have h1 : g ∘ toC = toC ∘ (fun x i => f i (x i)) := funext fun x => (hgt x).symm
  rw [gaussC, Measure.map_map hg measurable_toC, h1, ← Measure.map_map measurable_toC hmf,
    stdGaussian_two_map_coord f hm hf]

/-- **`gaussC` is invariant under `z ↦ z̄`.** -/
theorem gaussC_map_conj : gaussC.map (fun z => conj z) = gaussC :=
  gaussC_map_of _ Complex.continuous_conj.measurable sgnC measurable_sgnC map_sgnC toC_sgnC

/-- **`gaussC` is invariant under `z ↦ −z`.** -/
theorem gaussC_map_neg : gaussC.map (fun z => -z) = gaussC :=
  gaussC_map_of _ measurable_neg sgnN measurable_sgnN map_sgnN toC_sgnN

lemma integral_gaussC_comp (g : ℂ → ℂ) (hg : Continuous g) (hmap : gaussC.map g = gaussC)
    (F : ℂ → ℝ) (hF : Continuous F) : ∫ z, F (g z) ∂gaussC = ∫ z, F z ∂gaussC := by
  conv_rhs => rw [← hmap]
  rw [integral_map hg.measurable.aemeasurable hF.aestronglyMeasurable]

/-! ### The fibre functions under the symmetries -/

lemma fB1_conj (z : ℂ) : fB1 (conj z) = fB1 z := by simp [fB1]
lemma fB2_conj (z : ℂ) : fB2 (conj z) = conj (fB2 z) := by simp [fB2, map_div₀]
lemma fB4_conj (z : ℂ) : fB4 (conj z) = conj (fB4 z) := by simp [fB4, map_div₀, map_ofNat]
lemma fB1_neg (z : ℂ) : fB1 (-z) = fB1 z := by simp [fB1]
lemma fB2_neg (z : ℂ) : fB2 (-z) = fB2 z := by simp [fB2]
lemma fB4_neg (z : ℂ) : fB4 (-z) = -fB4 z := by simp [fB4]; ring

/-- `L(z̄) = conj L(z)`. -/
lemma Lf_conj (ℓ β : ℝ) (z : ℂ) : Lf ℓ β (conj z) = conj (Lf ℓ β z) := by simp [Lf, map_ofNat]
/-- `L(−z) = −L(z)`. -/
lemma Lf_neg (ℓ β : ℝ) (z : ℂ) : Lf ℓ β (-z) = -Lf ℓ β z := by simp [Lf]

namespace Fib

/-- `S_c`: conjugate every coordinate (flip `y₃, y₄, y₅, y₈, y₉, y₁₁`). -/
def cj (v : Fib) : Fib := ⟨conj v.e1, conj v.e2, conj v.e3, conj v.z1, conj v.z2, conj v.d⟩
/-- `S_-`: negate the odd coordinates `ζ₁, ζ₂, d` (flip `y₆, …, y₁₁`). -/
def ng (v : Fib) : Fib := ⟨v.e1, v.e2, v.e3, -v.z1, -v.z2, -v.d⟩

lemma cj_cj (v : Fib) : v.cj.cj = v := by simp [cj]
lemma ng_ng (v : Fib) : v.ng.ng = v := by simp [ng]

/-- `B_{S_c v}(z) = conj(B_v(z̄))`. -/
theorem fn_cj (v : Fib) (z : ℂ) : v.cj.fn z = conj (v.fn (conj z)) := by
  simp only [fn, cj, map_add, map_mul, fB1_conj, fB2_conj, fB4_conj, Complex.conj_conj]
  simp [fB1]

/-- `B_{S_- v}(z) = B_v(−z)`. -/
theorem fn_ng (v : Fib) (z : ℂ) : v.ng.fn z = v.fn (-z) := by
  simp only [fn, ng, fB1_neg, fB2_neg, fB4_neg, map_neg]; ring

variable (E : Sym3) (R : Sym2)

lemma M_cj (y : Fib) : M E R y.cj = (M E R y).cj := by
  simp [M, cj, map_add, map_mul]

lemma M_ng (y : Fib) : M E R y.ng = (M E R y).ng := by
  simp only [M, ng, mk.injEq]; refine ⟨trivial, trivial, trivial, ?_, ?_, ?_⟩ <;> ring

lemma quad_cj (y : Fib) : quad E R y.cj = quad E R y := by
  simp [quad, cj, Sym3.form, Sym2.form, hre_eq]

lemma quad_ng (y : Fib) : quad E R y.ng = quad E R y := by
  simp [quad, ng, Sym3.form, Sym2.form, hre_eq]

end Fib

lemma aFib_cj (b1 b2 b3 : ℝ) : (aFib b1 b2 b3).cj = aFib b1 b2 b3 := by
  simp [aFib, Fib.cj, Complex.conj_ofReal]

lemma aFib_ng (b1 b2 b3 : ℝ) : (aFib b1 b2 b3).ng = aFib b1 b2 b3 := by
  simp [aFib, Fib.ng]

/-! ### Invariance of `J` -/

variable (E : Sym3) (R : Sym2) (ℓ β : ℝ) (a : Fib)

lemma pfn_cj (ha : a.cj = a) (y : Fib) (s : ℝ) (z : ℂ) :
    pfn E R a y.cj s z = conj (pfn E R a y s (conj z)) := by
  rw [pfn_eq, pfn_eq, Fib.M_cj, Fib.fn_cj]
  conv_lhs => rw [← ha, Fib.fn_cj]
  simp [map_add, map_mul]

lemma pfn_ng (ha : a.ng = a) (y : Fib) (s : ℝ) (z : ℂ) :
    pfn E R a y.ng s z = pfn E R a y s (-z) := by
  rw [pfn_eq, pfn_eq, Fib.M_ng, Fib.fn_ng]
  conv_lhs => rw [← ha, Fib.fn_ng]

/-- **`J(S_c y, s) = J(y, s)`** when `S_c a = a`. -/
theorem Jpot_cj (ha : a.cj = a) (y : Fib) (s : ℝ) : Jpot E R ℓ β a y.cj s = Jpot E R ℓ β a y s := by
  unfold Jpot
  rw [Fib.quad_cj]
  congr 1
  have hc := continuous_pfn E R a y s
  have hL := continuous_Lf ℓ β
  rw [← integral_gaussC_comp _ Complex.continuous_conj gaussC_map_conj _
    (by fun_prop : Continuous fun z => ‖Lf ℓ β z + pfn E R a y s z‖ + ‖Lf ℓ β z - pfn E R a y s z‖)]
  refine integral_congr_ae (Filter.Eventually.of_forall fun z => ?_)
  have hz : Lf ℓ β z = conj (Lf ℓ β (conj z)) := by rw [Lf_conj, Complex.conj_conj]
  beta_reduce
  rw [pfn_cj E R a ha, hz, ← map_add, ← map_sub, Complex.norm_conj, Complex.norm_conj]

/-- **`J(S_- y, s) = J(y, s)`** when `S_- a = a` (the two terms `|L ± p|` are exchanged). -/
theorem Jpot_ng (ha : a.ng = a) (y : Fib) (s : ℝ) : Jpot E R ℓ β a y.ng s = Jpot E R ℓ β a y s := by
  unfold Jpot
  rw [Fib.quad_ng]
  congr 1
  have hc := continuous_pfn E R a y s
  have hL := continuous_Lf ℓ β
  rw [← integral_gaussC_comp _ continuous_neg gaussC_map_neg _
    (by fun_prop : Continuous fun z => ‖Lf ℓ β z + pfn E R a y s z‖ + ‖Lf ℓ β z - pfn E R a y s z‖)]
  refine integral_congr_ae (Filter.Eventually.of_forall fun z => ?_)
  have hz : Lf ℓ β z = -Lf ℓ β (-z) := by rw [Lf_neg, neg_neg]
  beta_reduce
  rw [pfn_ng E R a ha, hz,
    show -Lf ℓ β (-z) + pfn E R a y s (-z) = -(Lf ℓ β (-z) - pfn E R a y s (-z)) by ring,
    show -Lf ℓ β (-z) - pfn E R a y s (-z) = -(Lf ℓ β (-z) + pfn E R a y s (-z)) by ring,
    norm_neg, norm_neg, add_comm]

/-! ### The coverage lemma -/

/-- The orbit of a piece under the group `{1, S_c, S_-, S_c S_-}`. -/
def symOrbit (P : Set Fib) : Set Fib :=
  P ∪ Fib.cj '' P ∪ Fib.ng '' P ∪ (fun y => (Fib.ng y).cj) '' P

/-- A bound of `J` on a piece holds on its orbit. -/
lemma Jpot_le_of_mem_symOrbit (hc : a.cj = a) (hn : a.ng = a) (s q : ℝ) (P : Set Fib)
    (hP : ∀ y ∈ P, Jpot E R ℓ β a y s ≤ q) {y : Fib} (hy : y ∈ symOrbit P) :
    Jpot E R ℓ β a y s ≤ q := by
  rcases hy with ((hy | ⟨w, hw, rfl⟩) | ⟨w, hw, rfl⟩) | ⟨w, hw, rfl⟩
  · exact hP y hy
  · rw [Jpot_cj E R ℓ β a hc]; exact hP w hw
  · rw [Jpot_ng E R ℓ β a hn]; exact hP w hw
  · rw [Jpot_cj E R ℓ β a hc, Jpot_ng E R ℓ β a hn]; exact hP w hw

/-- **Coverage lemma.** If the pieces `Π_i` (`i ∈ I`) together with their images under `S_c`,
`S_-`, `S_c S_-` cover the fibre space, and `J(·, s) ≤ q_i ≤ Q` on `Π_i`, then `Ψ(s) ≤ Q`. -/
theorem pot_le_of_cover {ι : Type*} (I : Finset ι) (P : ι → Set Fib) (q : ι → ℝ) (Q s : ℝ)
    (hc : a.cj = a) (hn : a.ng = a) (hcov : ∀ y : Fib, ∃ i ∈ I, y ∈ symOrbit (P i))
    (hb : ∀ i ∈ I, ∀ y ∈ P i, Jpot E R ℓ β a y s ≤ q i) (hQ : ∀ i ∈ I, q i ≤ Q) :
    pot E R ℓ β a s ≤ Q := by
  refine ciSup_le fun y => ?_
  obtain ⟨i, hi, hy⟩ := hcov y
  exact (Jpot_le_of_mem_symOrbit E R ℓ β a hc hn s (q i) (P i) (hb i hi) hy).trans (hQ i hi)

/-- **Coverage lemma, `max` form.** For a finite nonempty family with
`⋃ᵢ (Πᵢ ∪ S_c Πᵢ ∪ S_- Πᵢ ∪ S_c S_- Πᵢ) = univ` and `J(·, s) ≤ qᵢ` on `Πᵢ`,
`Ψ(s) ≤ maxᵢ qᵢ`. -/
theorem pot_le_sup'_of_cover {ι : Type*} [Fintype ι] [Nonempty ι] (P : ι → Set Fib) (q : ι → ℝ)
    (s : ℝ) (hc : a.cj = a) (hn : a.ng = a) (hcov : ⋃ i, symOrbit (P i) = univ)
    (hb : ∀ i, ∀ y ∈ P i, Jpot E R ℓ β a y s ≤ q i) :
    pot E R ℓ β a s ≤ Finset.univ.sup' Finset.univ_nonempty q := by
  refine pot_le_of_cover E R ℓ β a Finset.univ P q _ s hc hn (fun y => ?_) (fun i _ => hb i)
    (fun i _ => Finset.le_sup' q (Finset.mem_univ i))
  have : y ∈ ⋃ i, symOrbit (P i) := hcov ▸ mem_univ y
  obtain ⟨i, hi⟩ := mem_iUnion.1 this
  exact ⟨i, Finset.mem_univ i, hi⟩

/-- The row form: `a = aFib b₁ b₂ b₃` is fixed by both symmetries. -/
theorem pot_aFib_le_sup'_of_cover (b1 b2 b3 : ℝ) {ι : Type*} [Fintype ι] [Nonempty ι]
    (P : ι → Set Fib) (q : ι → ℝ) (s : ℝ) (hcov : ⋃ i, symOrbit (P i) = univ)
    (hb : ∀ i, ∀ y ∈ P i, Jpot E R ℓ β (aFib b1 b2 b3) y s ≤ q i) :
    pot E R ℓ β (aFib b1 b2 b3) s ≤ Finset.univ.sup' Finset.univ_nonempty q :=
  pot_le_sup'_of_cover E R ℓ β _ P q s (aFib_cj b1 b2 b3) (aFib_ng b1 b2 b3) hcov hb

end

end Grothe.LowerAnalytic
