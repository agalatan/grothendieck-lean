import Grothe.LowerAnalytic.SparseOuterCaps
import Grothe.LowerAnalytic.WeightedSchurRows
import Grothe.LowerAnalytic.RowGaussian
import Grothe.Lower.Cert.Row06
import Grothe.Lower.Cert.Row07

set_option warningAsError true

/-!
# Joint deductions for rows 06 and 07

The two rows have the same normalized law and physical scale. The quadratic
majorants improve the law bounds at small scales. The Schur complement of
the mixed gates supplies a gain proportional to the square of that scale.

Agent-ID: codex-a7c4
-/

open MeasureTheory MvPolynomial
open Grothe.Lower.SharedGate Grothe.Lower.SharedGate.WeightedSchur
open Grothe.LowerAnalytic

namespace Grothe.Lower.SparseOuter

private theorem law_bound {Ω : Type} [MeasurableSpace Ω] {μ : Measure Ω}
    [IsProbabilityMeasure μ] {U : Ω → ℝ} {x σ A B : ℝ} (hM : Moments μ U x)
    (hσ : 0 ≤ σ) {Ψ : ℝ → ℝ} (bound : ∀ s, 0 ≤ s → Ψ s ≤ A+B*s^2)
    (hf : Integrable (fun ω ↦ Ψ (σ * √(U ω))) μ) :
    (∫ ω, Ψ (σ * √(U ω)) ∂μ) ≤ A+B*σ^2 := by
  have hg : Integrable (fun ω ↦ A+(B*σ^2)*U ω) μ :=
    (integrable_const _).add (hM.i1.const_mul _)
  calc
    _ ≤ ∫ ω, (A+(B*σ^2)*U ω) ∂μ := by
      apply integral_mono hf hg
      intro ω
      simpa only [mul_pow, Real.sq_sqrt (hM.nonneg ω), mul_assoc] using
        bound (σ * √(U ω)) (mul_nonneg hσ (Real.sqrt_nonneg _))
    _ = _ := by
      rw [integral_add (integrable_const _) (hM.i1.const_mul _), integral_const,
        integral_const_mul, hM.m1, probReal_univ, one_smul, mul_one]

private def height (r : Row) (A : ℚ) := r.cap - A
private def slope (r : Row) (B : ℚ) := (B-r.kappa)*r.delta^2

private theorem obtain_reserve {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    {Ω : Type} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {U : Ω → ℝ} {τ x V t : ℝ} {X1 X2 X3 : Ω → ℂ} {Qh v : E}
    (r : Row) {A B : ℚ} (hfacts : RowFacts r) (hM : Moments μ U x)
    (hS : SteinCut μ U) (hτ₀ : 0 ≤ τ) (hτ₁ : τ ≤ ρ)
    {Ψ : ℝ → ℝ} (hr : RowSharedWith r Ψ μ U X1 X2 X3 τ V t Qh v)
    (hb : ∀ s, 0 ≤ s → Ψ s - capPad ≤ (A : ℝ)+B*s^2) :
    ∃ a : ℝ, 0 ≤ a ∧ (height r A : ℝ)-(slope r B : ℝ)*τ^2 ≤ a ∧
      RowHolds ε r.env.ell r.env.beta ((r.env.C : ℝ)-(a+surplus r μ X1 X2 X3 τ))
        V t Qh v := by
  let σ : ℝ := r.delta * τ
  let F : ℝ := ∫ ω, (Ψ (σ*√(U ω))-capPad) ∂μ
  let a : ℝ := r.cap + r.kappa*σ^2 - F
  have hδ : (0 : ℝ) ≤ r.delta := Rat.cast_nonneg.mpr hfacts.1.le
  have hσ := mul_nonneg hδ hτ₀
  have hI := hr.2.1.sub (integrable_const (capPad : ℝ))
  have hscalar := hfacts.2.2.2 Ω μ U x (fun s ↦ Ψ s-capPad) σ hM hS hr.1 hσ
    (mul_le_mul_of_nonneg_left hτ₁ hδ) hI
  have hquad := law_bound hM hσ (Ψ := fun s ↦ Ψ s-capPad) hb hI
  change F - _ ≤ _ at hscalar
  change F ≤ (A : ℝ)+(B : ℝ)*σ^2 at hquad
  refine ⟨a, ?_, ?_, ?_⟩
  · dsimp only [a]
    linarith only [hscalar]
  · dsimp only [height,slope,a,σ] at *
    push_cast
    nlinarith only [hquad]
  · apply real_reserve r r.cap a hr
    change F - _ ≤ (r.cap : ℝ) - a
    dsimp only [a]
    linarith

private def mixQ (w a b : ℚ) := (1-w)*a+w*b

private def schurQ (w : ℚ) : ℚ :=
  let blend := fun (f : Row → ℚ) ↦ mixQ w (f row06) (f row07)
  let n := blend (fun r ↦ r.N.m11+2*r.g1)
  let x := blend (fun r ↦ r.N.m12+r.g2)
  let y := blend (fun r ↦ r.N.m13+r.g3)
  let a := blend (fun r ↦ r.N.m22)
  let b := blend (fun r ↦ r.N.m23)
  let c := blend (fun r ↦ r.N.m33)
  n-(c*x^2-2*b*x*y+a*y^2)/(a*c-b^2)-blend baseline

private def H (w : ℚ) := mixQ w (height row06 (1306702479/1000000000))
  (height row07 (132914743/100000000))
private def K (w : ℚ) := mixQ w (slope row06 (563/500)) (slope row07 (227/200))

/-- Uniform intercept deduction at a rational mixing weight. -/
def price (w : ℚ) := min (H w) (schurQ w * H w / K w)

private theorem compensate {H K g p t a : ℝ} (hH : 0 < H) (hp : 0 ≤ p)
    (hlo : p ≤ H) (hhi : p*K ≤ g*H) (ht : 0 ≤ t) (ha : 0 ≤ a)
    (hlaw : H-K*t ≤ a) : p ≤ a+g*t := by
  apply (le_of_mul_le_mul_left (a := H) _ hH)
  nlinarith only [mul_le_mul_of_nonneg_left hlaw hp,
    mul_le_mul_of_nonneg_right hlo ha, mul_le_mul_of_nonneg_right hhi ht]

/-- Conditions on a tabulated outer weight, checked by rational arithmetic. -/
def priceOK (w : ℚ) : Bool := decide (0 ≤ w ∧ w ≤ 1 ∧ 0 < H w ∧ 0 < K w ∧ 0 ≤ schurQ w)

private theorem schur_surplus {Ω : Type} [MeasurableSpace Ω] {μ : Measure Ω}
    {U : Ω → ℝ} {x τ : ℝ} {X1 X2 X3 : Ω → ℂ}
    (w : ℚ) (h₀ : 0 ≤ w) (h₁ : w ≤ 1) (hM : Moments μ U x)
    (hX : ∀ ω, ‖X1 ω‖ ^ 2 = τ ^ 2 * U ω)
    (h6 : Integrable (fun ω ↦ row06.gate (X1 ω) (X2 ω) (X3 ω)) μ)
    (h7 : Integrable (fun ω ↦ row07.gate (X1 ω) (X2 ω) (X3 ω)) μ) :
    (schurQ w : ℝ)*τ^2 ≤ (1-(w : ℝ))*surplus row06 μ X1 X2 X3 τ +
      (w : ℝ)*surplus row07 μ X1 X2 X3 τ := by
  let rs : Fin 2 → Row := ![row06,row07]
  have hw (i) : 0 ≤ twoWeights (w : ℝ) i := by
    fin_cases i
    · exact sub_nonneg.mpr (by exact_mod_cast h₁)
    · exact Rat.cast_nonneg.mpr h₀
  have hsum : 0 < ∑ i, twoWeights (w : ℝ) i := by simp [twoWeights, Fin.sum_univ_two]
  have hr (i) : gateOK (rs i).N = true := by fin_cases i <;> decide +kernel
  have hint (i) : Integrable (fun ω ↦ (rs i).gate (X1 ω) (X2 ω) (X3 ω)) μ := by
    fin_cases i
    · exact h6
    · exact h7
  have hprice : SharedGate.WeightedSchur.gain (twoWeights (w : ℝ)) rs = (schurQ w : ℝ) := by
    simp [rs, schurQ, mixQ, SharedGate.WeightedSchur.gain, SharedGate.WeightedSchur.price, det, mix,
      Fin.sum_univ_two, twoWeights, ofRow]
  have hg := weighted_surplus (twoWeights (w : ℝ)) rs hw hsum hr hM hX hint
  rw [hprice] at hg
  simpa only [Fin.sum_univ_two,rs,twoWeights,Matrix.cons_val_zero,Matrix.cons_val_one,
    Matrix.head_cons] using hg

private theorem endpoint {a b s t τ : ℝ} (w : ℚ) (hw : priceOK w = true)
    (ha₀ : 0 ≤ a) (hb₀ : 0 ≤ b)
    (ha : (height row06 (1306702479/1000000000) : ℝ) -
      (slope row06 (563/500) : ℝ)*τ^2 ≤ a)
    (hb : (height row07 (132914743/100000000) : ℝ) -
      (slope row07 (227/200) : ℝ)*τ^2 ≤ b)
    (hg : (schurQ w : ℝ)*τ^2 ≤ (1-(w : ℝ))*s+(w : ℝ)*t) :
    (price w : ℝ) ≤ (1-(w : ℝ))*(a+s)+(w : ℝ)*(b+t) := by
  obtain ⟨hw₀,hw₁,hh,hk,hg₀⟩ := of_decide_eq_true hw
  have h₁ : 0 ≤ 1-(w : ℝ) := sub_nonneg.mpr (by exact_mod_cast hw₁)
  have h₀ : (0 : ℝ) ≤ w := Rat.cast_nonneg.mpr hw₀
  have hprice₀ : 0 ≤ price w := le_min hh.le (div_nonneg (mul_nonneg hg₀ hh.le) hk.le)
  have hprice₁ : price w ≤ H w := min_le_left _ _
  have hprice₂ : price w * K w ≤ schurQ w * H w := (le_div_iff₀ hk).mp (min_le_right _ _)
  have hlaw : (H w : ℝ)-(K w : ℝ)*τ^2 ≤ (1-(w : ℝ))*a+(w : ℝ)*b := by
    simp only [H,K,mixQ,Rat.cast_add,Rat.cast_sub,Rat.cast_mul,Rat.cast_one]
    linarith only [mul_le_mul_of_nonneg_left ha h₁, mul_le_mul_of_nonneg_left hb h₀]
  have hp := compensate (Rat.cast_pos.mpr hh) (Rat.cast_nonneg.mpr hprice₀)
    (Rat.cast_le.mpr hprice₁) (by exact_mod_cast hprice₂ : (price w : ℝ)*(K w : ℝ) ≤
      (schurQ w : ℝ)*(H w : ℝ)) (sq_nonneg τ)
    (add_nonneg (mul_nonneg h₁ ha₀) (mul_nonneg h₀ hb₀)) hlaw
  linarith only [hp,hg]

/-- Chords between rational endpoint prices bound the deductions of the two actual rows. -/
theorem actual_deductions {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    {V t : ℝ} {Qh v : E} (hred : CircularSharedReduction rowData V t Qh v)
    (w z : ℚ) (hw : priceOK w = true) (hz : priceOK z = true)
    {x : ℝ} (hx₀ : 0 ≤ x) (hx₁ : x ≤ 1) :
    let θ := (1-x)*(w : ℝ)+x*(z : ℝ)
    ∃ d6 d7 : ℝ, (1-x)*(price w : ℝ)+x*(price z : ℝ) ≤ (1-θ)*d6+θ*d7 ∧
      RowHolds ε row06.env.ell row06.env.beta ((row06.env.C : ℝ)-d6) V t Qh v ∧
      RowHolds ε row07.env.ell row07.env.beta ((row07.env.C : ℝ)-d7) V t Qh v := by
  obtain ⟨d,J,A,B,X1,X2,X3,τ,ex,_,_,_,hM,hGI,hτ₀,_,hτρ,hX,hshared⟩ := hred
  obtain ⟨P6,h6,_⟩ := hshared row06 (List.mem_of_getElem? (i := 5) (by rfl))
  obtain ⟨P7,h7,_⟩ := hshared row07 (List.mem_of_getElem? (i := 6) (by rfl))
  have hS := steinCut_of_inputs _ hM hGI
  obtain ⟨a,ha₀,ha,hrow6⟩ := obtain_reserve row06 (A := 1306702479/1000000000) (B := 563/500)
    (rowFacts_of_checkRow _ certRow06) hM hS hτ₀ hτρ h6
    (fun s hs ↦ by simpa only [Rat.cast_div,Rat.cast_ofNat] using cap6 h6.1 hs)
  obtain ⟨b,hb₀,hb,hrow7⟩ := obtain_reserve row07 (A := 132914743/100000000) (B := 227/200)
    (rowFacts_of_checkRow _ certRow07) hM hS hτ₀ hτρ h7
    (fun s hs ↦ by simpa only [Rat.cast_div,Rat.cast_ofNat] using cap7 h7.1 hs)
  let s := surplus row06 (stdGaussian d) X1 X2 X3 τ
  let t' := surplus row07 (stdGaussian d) X1 X2 X3 τ
  have hp (y : ℚ) (hy : priceOK y = true) :
      (price y : ℝ) ≤ (1-(y : ℝ))*(a+s)+(y : ℝ)*(b+t') := by
    obtain ⟨hy₀,hy₁,_⟩ := of_decide_eq_true hy
    exact endpoint y hy ha₀ hb₀ ha hb (schur_surplus y hy₀ hy₁ hM hX h6.2.2.1 h7.2.2.1)
  refine ⟨a+s,b+t',?_,hrow6,hrow7⟩
  linarith only [mul_le_mul_of_nonneg_left (hp w hw) (sub_nonneg.mpr hx₁),
    mul_le_mul_of_nonneg_left (hp z hz) hx₀]

end Grothe.Lower.SparseOuter
