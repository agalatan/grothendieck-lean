import Grothe.Lower.Cuts

/-!
# The law of the normalized residual: moments, Stein cuts, integration

For a residual `q` (a cubic chaos of bidegree `(2,1)`) with `σ = ‖q‖₂`, let `U = |q|²/σ²`.
`Moments μ U x` collects what the certificate uses about the law of `U`:
`E U = 1`, `E U² = 2 + x²` with `0 ≤ x ≤ 31/4`, `E U³ ≤ 6 + 9x² + C₆x³` and `E √U ≤ ρ`.
`SteinCut μ U` is the family of Stein-cut inequalities `E G(U) ≥ 0`, one for every mesh and
every test vector (`cutG`); it is derived from its analytic inputs in `Stein.lean`.

`node_fn` integrates a polynomial majorant minus a nonnegative combination of cuts, and
`rect_integral`, `chord_integral` are the two forms in which pointwise majorants of the
potential are integrated.
-/

open MeasureTheory

namespace Grothe.Lower

variable {Ω : Type*} [MeasurableSpace Ω]

/-- The moment facts about `U = |q|²/σ²`. -/
structure Moments (μ : Measure Ω) (U : Ω → ℝ) (x : ℝ) : Prop where
  nonneg : ∀ ω, 0 ≤ U ω
  x0 : 0 ≤ x
  x1 : x ≤ xMax
  ih : Integrable (fun ω => √(U ω)) μ
  i1 : Integrable U μ
  i2 : Integrable (fun ω => U ω ^ 2) μ
  i3 : Integrable (fun ω => U ω ^ 3) μ
  mh : ∫ ω, √(U ω) ∂μ ≤ ρ
  m1 : ∫ ω, U ω ∂μ = 1
  m2 : ∫ ω, U ω ^ 2 ∂μ = 2 + x ^ 2
  m3 : ∫ ω, U ω ^ 3 ∂μ ≤ 6 + 9 * x ^ 2 + C6 * x ^ 3

/-- **The Stein-cut inequalities**: for every mesh `0 < v₁ < … < v_K` and every test vector
`z = (φ(t₀), …, φ(t_{K−1}), β', α)`, with `φ` the continuous piecewise-linear function on the
knots `tₖ = vₖ²` vanishing from `t_K` on and `Φ(u) = ∫₀ᵘ φ`,

  `E[(φ(U) + β')² + 2 (φ(U) − Φ(U)/U)² + 2α (Φ(U) − φ(U)) + (α²/3)(U² − 2)] ≥ 0`. -/
def SteinCut (μ : Measure Ω) (U : Ω → ℝ) : Prop :=
  ∀ vs z : List ℚ, meshOK 0 vs = true →
    Integrable (fun ω => cutG vs z (√(U ω))) μ ∧ 0 ≤ ∫ ω, cutG vs z (√(U ω)) ∂μ

lemma mpoly_at (p : MPoly) (σ s Uv : ℝ) (h : s ^ 2 = Uv) :
    evalL (p.list.map ((↑) : ℚ → ℝ)) (σ * s)
      = p.a0 + p.a1 * σ * s + p.a2 * σ ^ 2 * Uv + p.a4 * σ ^ 4 * Uv ^ 2
        + p.a6 * σ ^ 6 * Uv ^ 3 := by
  subst h
  simp only [MPoly.list, List.map_cons, List.map_nil, evalL, Rat.cast_zero]
  ring

variable (μ : Measure Ω) [IsProbabilityMeasure μ] {U : Ω → ℝ} {x : ℝ}

lemma moment_poly (hM : Moments μ U x) (a0 a1 a2 a4 a6 : ℝ) (h1 : 0 ≤ a1) (h6 : 0 ≤ a6) :
    Integrable (fun ω => a0 + a1 * √(U ω) + a2 * U ω + a4 * U ω ^ 2 + a6 * U ω ^ 3) μ ∧
    ∫ ω, (a0 + a1 * √(U ω) + a2 * U ω + a4 * U ω ^ 2 + a6 * U ω ^ 3) ∂μ
      ≤ a0 + a1 * ρ + a2 + a4 * (2 + x ^ 2) + a6 * (6 + 9 * x ^ 2 + C6 * x ^ 3) := by
  have hA : Integrable (fun ω => a0 + a1 * √(U ω)) μ :=
    (integrable_const a0).add (hM.ih.const_mul a1)
  have hB : Integrable (fun ω => a0 + a1 * √(U ω) + a2 * U ω) μ := hA.add (hM.i1.const_mul a2)
  have hC : Integrable (fun ω => a0 + a1 * √(U ω) + a2 * U ω + a4 * U ω ^ 2) μ :=
    hB.add (hM.i2.const_mul a4)
  refine ⟨hC.add (hM.i3.const_mul a6), ?_⟩
  rw [integral_add hC (hM.i3.const_mul a6), integral_add hB (hM.i2.const_mul a4),
    integral_add hA (hM.i1.const_mul a2), integral_add (integrable_const a0) (hM.ih.const_mul a1),
    integral_const_mul, integral_const_mul, integral_const_mul, integral_const_mul,
    integral_const, hM.m1, hM.m2, probReal_univ, one_smul]
  nlinarith [mul_le_mul_of_nonneg_left hM.mh h1, mul_le_mul_of_nonneg_left hM.m3 h6]

lemma cutSum_integral (hS : SteinCut μ U) (vs : List ℚ) (hvs : meshOK 0 vs = true) :
    ∀ cs : List (ℚ × List ℚ), (∀ c ∈ cs, 0 ≤ c.1) →
      Integrable (fun ω => cutSum vs cs (√(U ω))) μ ∧ 0 ≤ ∫ ω, cutSum vs cs (√(U ω)) ∂μ
  | [], _ => by simp [cutSum]
  | c :: r, h => by
    obtain ⟨hi, hn⟩ := hS vs c.2 hvs
    obtain ⟨hri, hrn⟩ := cutSum_integral hS vs hvs r fun d hd => h d (List.mem_cons_of_mem _ hd)
    have hc : (0 : ℝ) ≤ c.1 := by exact_mod_cast h c (List.mem_cons_self ..)
    have e : (fun ω => cutSum vs (c :: r) (√(U ω)))
        = fun ω => (c.1 : ℝ) * cutG vs c.2 (√(U ω)) + cutSum vs r (√(U ω)) := rfl
    rw [e]
    refine ⟨(hi.const_mul _).add hri, ?_⟩
    rw [integral_add (hi.const_mul _) hri, integral_const_mul]
    positivity

/-- A node function `maj(√U) − Σ μⱼ Gⱼ(U)` is integrable with integral at most `J(1, x)`. -/
lemma node_fn (hM : Moments μ U x) (hS : SteinCut μ U) (vs : List ℚ) (hvs : meshOK 0 vs = true)
    (y : MPoly) (h1 : 0 ≤ y.a1) (h6 : 0 ≤ y.a6) (cs : List (ℚ × List ℚ))
    (hcs : ∀ c ∈ cs, 0 ≤ c.1) :
    Integrable (fun ω => evalL (y.list.map ((↑) : ℚ → ℝ)) (√(U ω)) - cutSum vs cs (√(U ω))) μ ∧
    ∫ ω, (evalL (y.list.map ((↑) : ℚ → ℝ)) (√(U ω)) - cutSum vs cs (√(U ω))) ∂μ
      ≤ y.J 0 1 x := by
  have key : ∀ ω, evalL (y.list.map ((↑) : ℚ → ℝ)) (√(U ω))
      = y.a0 + y.a1 * √(U ω) + y.a2 * U ω + y.a4 * U ω ^ 2 + y.a6 * U ω ^ 3 := by
    intro ω
    have := mpoly_at y 1 (√(U ω)) (U ω) (Real.sq_sqrt (hM.nonneg ω))
    rw [one_mul] at this
    rw [this]; ring
  obtain ⟨hP, hPi⟩ := moment_poly μ hM y.a0 y.a1 y.a2 y.a4 y.a6 (by exact_mod_cast h1)
    (by exact_mod_cast h6)
  obtain ⟨hC, hCi⟩ := cutSum_integral μ hS vs hvs cs hcs
  have e : (fun ω => evalL (y.list.map ((↑) : ℚ → ℝ)) (√(U ω)) - cutSum vs cs (√(U ω)))
      = fun ω => (y.a0 + y.a1 * √(U ω) + y.a2 * U ω + y.a4 * U ω ^ 2 + y.a6 * U ω ^ 3)
          - cutSum vs cs (√(U ω)) := funext fun ω => by rw [key]
  rw [e]
  refine ⟨hP.sub hC, ?_⟩
  rw [integral_sub hP hC]
  have eJ : y.J 0 1 x = y.a0 + y.a1 * ρ + y.a2 + y.a4 * (2 + x ^ 2)
      + y.a6 * (6 + 9 * x ^ 2 + C6 * x ^ 3) := by
    simp only [MPoly.J]; push_cast; ring
  rw [eJ]
  linarith

/-- Integration of a pointwise polynomial majorant at scale `σ`. -/
lemma rect_integral (hM : Moments μ U x) (P : MPoly) (h1 : 0 ≤ P.a1) (h6 : 0 ≤ P.a6) (kap : ℚ)
    (σ : ℝ) (hσ : 0 ≤ σ) (f : Ω → ℝ) (hf : Integrable f μ)
    (hle : ∀ ω, f ω ≤ evalL (P.list.map ((↑) : ℚ → ℝ)) (σ * √(U ω))) :
    ∫ ω, f ω ∂μ - kap * σ ^ 2 ≤ P.J kap σ x := by
  have key : ∀ ω, evalL (P.list.map ((↑) : ℚ → ℝ)) (σ * √(U ω))
      = P.a0 + P.a1 * σ * √(U ω) + P.a2 * σ ^ 2 * U ω + P.a4 * σ ^ 4 * U ω ^ 2
        + P.a6 * σ ^ 6 * U ω ^ 3 := fun ω =>
    mpoly_at P σ (√(U ω)) (U ω) (Real.sq_sqrt (hM.nonneg ω))
  have h1' : (0 : ℝ) ≤ P.a1 * σ := mul_nonneg (by exact_mod_cast h1) hσ
  have h6' : (0 : ℝ) ≤ P.a6 * σ ^ 6 := mul_nonneg (by exact_mod_cast h6) (by positivity)
  obtain ⟨hP, hPi⟩ := moment_poly μ hM P.a0 (P.a1 * σ) (P.a2 * σ ^ 2) (P.a4 * σ ^ 4)
    (P.a6 * σ ^ 6) h1' h6'
  have hmono := integral_mono hf hP fun ω => by rw [← key]; exact hle ω
  have eJ : P.J kap σ x = P.a0 + P.a1 * σ * ρ + P.a2 * σ ^ 2 + P.a4 * σ ^ 4 * (2 + x ^ 2)
      + P.a6 * σ ^ 6 * (6 + 9 * x ^ 2 + C6 * x ^ 3) - kap * σ ^ 2 := by
    simp only [MPoly.J]; ring
  rw [eJ]
  linarith

omit [IsProbabilityMeasure μ] in
/-- Integration of a pointwise convex combination of two node functions. -/
lemma chord_integral (f B1 B2 : Ω → ℝ) (lam V1 V2 : ℝ) (h0 : 0 ≤ lam) (h1 : lam ≤ 1)
    (hf : Integrable f μ) (hB1 : Integrable B1 μ) (hB2 : Integrable B2 μ)
    (hV1 : ∫ ω, B1 ω ∂μ ≤ V1) (hV2 : ∫ ω, B2 ω ∂μ ≤ V2)
    (hle : ∀ ω, f ω ≤ (1 - lam) * B1 ω + lam * B2 ω) :
    ∫ ω, f ω ∂μ ≤ (1 - lam) * V1 + lam * V2 := by
  have hsum : Integrable (fun ω => (1 - lam) * B1 ω + lam * B2 ω) μ :=
    (hB1.const_mul (1 - lam)).add (hB2.const_mul lam)
  have hmono := integral_mono hf hsum hle
  rw [integral_add (hB1.const_mul _) (hB2.const_mul _), integral_const_mul,
    integral_const_mul] at hmono
  nlinarith [mul_le_mul_of_nonneg_left hV1 (by linarith : 0 ≤ 1 - lam),
    mul_le_mul_of_nonneg_left hV2 h0]

end Grothe.Lower
