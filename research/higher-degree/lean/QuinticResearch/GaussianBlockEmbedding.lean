import Grothe.LowerAnalytic.Frame
import Mathlib.Probability.HasLaw

/-!
# Independent blocks of a finite complex Gaussian vector

Coordinate-block projections preserve Wick contractions and the cubic chaos.
The pullbacks of fields on opposite blocks are independent, and their inner
product factors into the two means.

Agent-ID: codex-a7c4
-/

namespace Grothe.LowerAnalytic

open MeasureTheory ProbabilityTheory Grothe.Lower
open scoped ComplexConjugate

noncomputable section

/-- Split a finite family into its first and last coordinate blocks. -/
def splitFinBlock (a b : ℕ) (E : Type*) [MeasurableSpace E] :
    (Fin (a+b) → E) ≃ᵐ (Fin a → E) × (Fin b → E) :=
  (MeasurableEquiv.piCongrLeft (fun _ => E) (finSumFinEquiv (m := a) (n := b))).symm.trans
    (MeasurableEquiv.sumPiEquivProdPi (fun _ => E))

theorem measurePreserving_splitFinBlock (a b : ℕ) {E : Type*} [MeasurableSpace E]
    (μ : Measure E) [SigmaFinite μ] :
    MeasurePreserving (splitFinBlock a b E) (Measure.pi fun _ => μ)
      ((Measure.pi fun _ => μ).prod (Measure.pi fun _ => μ)) :=
  (measurePreserving_sumPiEquivProdPi (fun _ => μ)).comp
    (measurePreserving_piCongrLeft (fun _ => μ) (finSumFinEquiv (m := a) (n := b))).symm

theorem splitFinBlock_fst {a b : ℕ} {E : Type*} [MeasurableSpace E] (x : Fin (a+b) → E) (i : Fin a) :
    (splitFinBlock a b E x).1 i = x (Fin.castAdd b i) := rfl

theorem splitFinBlock_snd {a b : ℕ} {E : Type*} [MeasurableSpace E] (x : Fin (a+b) → E) (i : Fin b) :
    (splitFinBlock a b E x).2 i = x (Fin.natAdd a i) := rfl

/-- The real and imaginary coordinates of each block are kept together. -/
def realBlockPerm (a b : ℕ) : (Fin (a+a) ⊕ Fin (b+b)) ≃ Fin ((a+b)+(a+b)) :=
  ((finSumFinEquiv.symm.sumCongr finSumFinEquiv.symm).trans
    (Equiv.sumSumSumComm (Fin a) (Fin a) (Fin b) (Fin b))).trans
    ((finSumFinEquiv.sumCongr finSumFinEquiv).trans finSumFinEquiv)

def gaussianBlockSplit (a b : ℕ) :
    (Fin ((a+b)+(a+b)) → ℝ) ≃ᵐ (Fin (a+a) → ℝ) × (Fin (b+b) → ℝ) :=
  (MeasurableEquiv.piCongrLeft (fun _ => ℝ) (realBlockPerm a b)).symm.trans
    (MeasurableEquiv.sumPiEquivProdPi (fun _ => ℝ))

theorem measurePreserving_gaussianBlockSplit (a b : ℕ) :
    MeasurePreserving (gaussianBlockSplit a b) (stdGaussian ((a+b)+(a+b)))
      ((stdGaussian (a+a)).prod (stdGaussian (b+b))) :=
  (measurePreserving_sumPiEquivProdPi (fun _ => gaussianReal 0 1)).comp
    (measurePreserving_piCongrLeft (fun _ => gaussianReal 0 1) (realBlockPerm a b)).symm

theorem zc_gaussianBlockSplit_fst {a b : ℕ} (i : Fin a) (x : Fin ((a+b)+(a+b)) → ℝ) :
    zc a i (gaussianBlockSplit a b x).1 = zc (a+b) (Fin.castAdd b i) x := by
  change Complex.mk (x (realBlockPerm a b (.inl (Fin.castAdd a i))))
      (x (realBlockPerm a b (.inl (Fin.natAdd a i)))) = _
  simp only [realBlockPerm, Equiv.trans_apply, Equiv.sumCongr_apply,
    Sum.map_inl, finSumFinEquiv_symm_apply_castAdd, finSumFinEquiv_symm_apply_natAdd]
  rfl

theorem zc_gaussianBlockSplit_snd {a b : ℕ} (i : Fin b) (x : Fin ((a+b)+(a+b)) → ℝ) :
    zc b i (gaussianBlockSplit a b x).2 = zc (a+b) (Fin.natAdd a i) x := by
  change Complex.mk (x (realBlockPerm a b (.inr (Fin.castAdd b i))))
      (x (realBlockPerm a b (.inr (Fin.natAdd b i)))) = _
  simp only [realBlockPerm, Equiv.trans_apply, Equiv.sumCongr_apply,
    Sum.map_inr, finSumFinEquiv_symm_apply_castAdd, finSumFinEquiv_symm_apply_natAdd]
  rfl

/-- The proper complex coordinates of a finite real standard Gaussian vector. -/
def properCoords (N : ℕ) (x : Fin (N+N) → ℝ) (i : Fin N) : ℂ :=
  F2 (x (Fin.castAdd N i), x (Fin.natAdd N i))

theorem properCoords_eq (N : ℕ) (x : Fin (N+N) → ℝ) (i : Fin N) :
    properCoords N x i = zc N i x / (√2 : ℝ) := by
  unfold properCoords F2
  rw [← Complex.re_add_im (zc N i x)]
  rfl

theorem measurePreserving_properCoords (N : ℕ) :
    MeasurePreserving (properCoords N) (stdGaussian (N+N)) (Measure.pi fun _ => gaussC) := by
  have hsplit := measurePreserving_splitFinBlock N N (gaussianReal 0 1)
  have hp := (measurePreserving_arrowProdEquivProdArrow ℝ ℝ (Fin N)
    (fun _ => gaussianReal 0 1) (fun _ => gaussianReal 0 1)).symm.comp hsplit
  have hc : MeasurePreserving F2 gauss2 gaussC := ⟨measurable_F2, gaussC_eq_map.symm⟩
  exact (measurePreserving_pi _ _ (fun _ : Fin N => hc)).comp hp

/-- Pull a cubic along an embedding of its complex coordinate system into a larger
standard Gaussian vector. Injectivity preserves all Wick contractions, including repeated
indices. -/
theorem pull_mem_H21 {a d : ℕ} {Φ : (Fin (d+d) → ℝ) → (Fin (a+a) → ℝ)}
    (hp : MeasurePreserving Φ (stdGaussian (d+d)) (stdGaussian (a+a)))
    (j : Fin a ↪ Fin d) (hz : ∀ i x, zc a i (Φ x) = zc d (j i) x)
    {u : L2G a} (hu : u ∈ H21 a) :
    Lp.compMeasurePreservingₗᵢ ℂ Φ hp u ∈ H21 d := by
  let L : L2G a →ₗᵢ[ℂ] L2G d := Lp.compMeasurePreservingₗᵢ ℂ Φ hp
  have hgen (i k l : Fin a) : L (wickL a i k l) = wickL d (j i) (j k) (j l) := by
    apply Lp.ext
    filter_upwards [Lp.coeFn_compMeasurePreserving (wickL a i k l) hp,
      hp.quasiMeasurePreserving.ae_eq_comp (wickL_ae' a i k l), wickL_ae' d (j i) (j k) (j l)]
      with x hx hy hw
    change Lp.compMeasurePreserving Φ hp (wickL a i k l) x = _
    rw [hx, hw]
    change _ = _ at hy
    change wickL a i k l (Φ x) = wickFn d (j i) (j k) (j l) x
    rw [show wickL a i k l (Φ x) = wickFn a i k l (Φ x) from hy]
    simp only [wickFn, wc, hz, j.injective.eq_iff]
  obtain ⟨c, rfl⟩ := exists_wick_repr a hu
  change L (∑ p, c p • wickL a p.1 p.2.1 p.2.2) ∈ H21 d
  rw [map_sum]
  refine (H21 d).sum_mem fun p _ => ?_
  rw [map_smul, hgen]
  exact (H21 d).smul_mem _ (wickL_mem_H21 _ _ _ _)

def blockLeft {a b : ℕ} : L2G a →ₗᵢ[ℂ] L2G (a+b) :=
  Lp.compMeasurePreservingₗᵢ ℂ _ (measurePreserving_fst.comp (measurePreserving_gaussianBlockSplit a b))

def blockRight {a b : ℕ} : L2G b →ₗᵢ[ℂ] L2G (a+b) :=
  Lp.compMeasurePreservingₗᵢ ℂ _ (measurePreserving_snd.comp (measurePreserving_gaussianBlockSplit a b))

theorem blockLeft_mem_H21 {a b : ℕ} {u : L2G a} (hu : u ∈ H21 a) : blockLeft (b := b) u ∈ H21 (a+b) :=
  pull_mem_H21 _ (Fin.castAddEmb b) zc_gaussianBlockSplit_fst hu

theorem blockRight_mem_H21 {a b : ℕ} {u : L2G b} (hu : u ∈ H21 b) : blockRight (a := a) u ∈ H21 (a+b) :=
  pull_mem_H21 _ (Fin.natAddEmb a) zc_gaussianBlockSplit_snd hu

theorem blockLeft_ae {a b : ℕ} (u : L2G a) :
    ⇑(blockLeft (b := b) u) =ᵐ[stdGaussian ((a+b)+(a+b))] fun x => u (gaussianBlockSplit a b x).1 :=
  Lp.coeFn_compMeasurePreserving u _

theorem blockRight_ae {a b : ℕ} (u : L2G b) :
    ⇑(blockRight (a := a) u) =ᵐ[stdGaussian ((a+b)+(a+b))] fun x => u (gaussianBlockSplit a b x).2 :=
  Lp.coeFn_compMeasurePreserving u _

theorem indep_blockLeft_blockRight {a b : ℕ} (u : L2G a) (v : L2G b) :
    IndepFun (fun x => blockLeft (b := b) u x) (fun x => blockRight (a := a) v x)
      (stdGaussian ((a+b)+(a+b))) := by
  have mp := measurePreserving_gaussianBlockSplit a b
  have h₁ := (measurePreserving_fst.comp mp).hasLaw
  have h₂ := (measurePreserving_snd.comp mp).hasLaw
  have h := (indepFun_iff_hasLaw_prodMk_prod h₁ h₂).mpr mp.hasLaw
  exact (h.comp (Lp.stronglyMeasurable u).measurable (Lp.stronglyMeasurable v).measurable).congr
    (blockLeft_ae u).symm (blockRight_ae v).symm

theorem inner_blockLeft_blockRight {a b : ℕ} (u : L2G a) (v : L2G b) :
    inner ℂ (blockLeft (b := b) u) (blockRight (a := a) v) =
      conj (∫ x, u x ∂(stdGaussian (a+a))) * ∫ y, v y ∂(stdGaussian (b+b)) := by
  let F (p : (Fin (a+a) → ℝ) × (Fin (b+b) → ℝ)) := conj (u p.1) * v p.2
  have hm : Measurable F := (Complex.continuous_conj.measurable.comp
    ((Lp.stronglyMeasurable u).measurable.comp measurable_fst)).mul
      ((Lp.stronglyMeasurable v).measurable.comp measurable_snd)
  have hi := (measurePreserving_gaussianBlockSplit a b).hasLaw.integral_comp hm.aestronglyMeasurable
  rw [inner_L2]
  refine (integral_congr_ae ?_).trans (hi.trans ?_)
  · filter_upwards [blockLeft_ae u, blockRight_ae v] with x hx hy
    rw [hx,hy]; rfl
  · dsimp only [F]
    rw [integral_prod_mul (fun x => conj (u x)) (fun y => v y), integral_conj]

end

end Grothe.LowerAnalytic
