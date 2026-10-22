import Grothe.Lower.Gram

/-!
# The law of the normalized residual: moments, Stein cuts, integration

For a residual `q` (a cubic chaos of bidegree `(2,1)`) with `σ = ‖q‖₂`, let `U = |q|²/σ²`.
`Moments μ U x` collects what the certificate uses about the law of `U`:
`E U = 1`, `E U² = 2 + x²` with `0 ≤ x ≤ 31/4`, `E U³ ≤ 6 + 9x² + C₆x³` and `E √U ≤ ρ`.
`SteinCut μ U` collects the Stein-cut inequalities `E G(U) ≥ 0`: the cuts `cutG` (one for every
mesh and test vector), the spectral cuts `specG` (one for every mesh, test and
`(λ, μ, t, β, ν)`, `λ, μ > 0`, `ν ≥ 0`) and the general spectral cuts `gspecG` of a node citing a
law budget (`GBud`: a contraction-Gram certificate or the coupled family, `Gram.lean`); all are
derived from their analytic inputs in `Stein.lean`.

`node_fn` integrates a polynomial majorant minus a nonnegative combination of cuts and
`rect_integral` a polynomial majorant at scale `σ`.  `TB μ U Φ τ val` records a bound
`E Φ(τ√U) ≤ val` through an integrable pointwise majorant; it is produced at a node by a Stein
node certificate (`TB.node`) or a spectral node certificate (`TB.specNode`), at `τ = 0` by the
zero cap (`TB.zero`), transported along `τ` by convexity (`TB.chord`) and mixed with nonnegative
weights (`TB.mix`).
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

/-- **The Stein-cut inequalities**, two families of `E G(U) ≥ 0`.

* `cut`: for every mesh `0 < v₁ < … < v_K` and every test vector
  `z = (φ(t₀), …, φ(t_{K−1}), β', α)`, with `φ` the continuous piecewise-linear function on the
  knots `tₖ = vₖ²` vanishing from `t_K` on and `Φ(u) = ∫₀ᵘ φ`,
  `E[(φ(U) + β')² + 2 (φ(U) − Φ(U)/U)² + 2α (Φ(U) − φ(U)) + (α²/3)(U² − 2)] ≥ 0` (`cutG`).
* `spec`: for every such test (knot values `z`) and every `λ, μ > 0`, `ν ≥ 0`, `t`, `β`, the
  spectral cut `E[f(U)²/λ + g(U)²/μ + Φ(U) − φ(U) + (ν/3 − 2t)(U² − 2)] ≥ 0` with
  `f = −(φ + β)/2 + (2t + λ/3)u` and `g = −(φ − Φ/u)/2 + (t + μ/3 − ν/2)u` (`specG`).
* `gspec`: the same with the coefficients of `u` shifted by the budget shifts `(af, ag)` of a
  cited law budget `bud` passing its exact check `GBud.ok` (`gspecG`). -/
structure SteinCut (μ : Measure Ω) (U : Ω → ℝ) : Prop where
  cut : ∀ vs z : List ℚ, meshOK 0 vs = true →
    Integrable (fun ω => cutG vs z (√(U ω))) μ ∧ 0 ≤ ∫ ω, cutG vs z (√(U ω)) ∂μ
  spec : ∀ (vs z : List ℚ) (lam mu t be nu : ℚ), meshOK 0 vs = true → 0 < lam → 0 < mu →
    0 ≤ nu → Integrable (fun ω => specG vs z lam mu t be nu (√(U ω))) μ ∧
      0 ≤ ∫ ω, specG vs z lam mu t be nu (√(U ω)) ∂μ
  gspec : ∀ (vs z : List ℚ) (lam mu t be nu : ℚ) (bud : GBud), meshOK 0 vs = true → 0 < lam →
    0 < mu → 0 ≤ nu → bud.ok lam mu = true →
    Integrable (fun ω => gspecG vs z lam mu t be nu (bud.af lam) (bud.ag mu) (√(U ω))) μ ∧
      0 ≤ ∫ ω, gspecG vs z lam mu t be nu (bud.af lam) (bud.ag mu) (√(U ω)) ∂μ

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
    obtain ⟨hi, hn⟩ := hS.cut vs c.2 hvs
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

/-! ### Integrable majorants at a scale -/

/-- `E Φ(τ√U) ≤ val`, witnessed by an integrable pointwise majorant. -/
def TB (μ : Measure Ω) (U : Ω → ℝ) (Φ : ℝ → ℝ) (τ val : ℝ) : Prop :=
  ∃ B : Ω → ℝ, Integrable B μ ∧ (∀ ω, Φ (τ * √(U ω)) ≤ B ω) ∧ ∫ ω, B ω ∂μ ≤ val

variable {μ}

omit [IsProbabilityMeasure μ] in
lemma TB.integral {Φ : ℝ → ℝ} {τ val : ℝ} (h : TB μ U Φ τ val)
    (hf : Integrable (fun ω => Φ (τ * √(U ω))) μ) : ∫ ω, Φ (τ * √(U ω)) ∂μ ≤ val := by
  obtain ⟨B, hB, hle, hv⟩ := h
  exact (integral_mono hf hB hle).trans hv

omit [IsProbabilityMeasure μ] in
lemma TB.mono {Φ : ℝ → ℝ} {τ val val' : ℝ} (h : TB μ U Φ τ val) (hv : val ≤ val') :
    TB μ U Φ τ val' := by
  obtain ⟨B, hB, hle, hval⟩ := h
  exact ⟨B, hB, hle, hval.trans hv⟩

/-- The zero node: `Φ(0) ≤ c`. -/
lemma TB.zero {Φ : ℝ → ℝ} (c : ℝ) (h : Φ 0 ≤ c) : TB μ U Φ 0 c :=
  ⟨fun _ => c, integrable_const c, fun ω => by simpa using h, by
    rw [integral_const, probReal_univ, one_smul]⟩

/-- A Stein node: a polynomial majorant of `Φ(τ v)` plus a nonnegative combination of cuts. -/
lemma TB.node {Φ : ℝ → ℝ} (hM : Moments μ U x) (hS : SteinCut μ U) (vs : List ℚ)
    (hvs : meshOK 0 vs = true) (cs : List (ℚ × List ℚ)) (hcs : ∀ c ∈ cs, 0 ≤ c.1) (y : MPoly)
    (h1 : 0 ≤ y.a1) (h6 : 0 ≤ y.a6) (τ : ℝ)
    (hpt : ∀ v : ℝ, 0 ≤ v → Φ (τ * v) + cutSum vs cs v ≤ evalL (y.list.map ((↑) : ℚ → ℝ)) v) :
    TB μ U Φ τ (y.J 0 1 x) := by
  obtain ⟨hi, hv⟩ := node_fn μ hM hS vs hvs y h1 h6 cs hcs
  exact ⟨_, hi, fun ω => by have := hpt _ (Real.sqrt_nonneg (U ω)); linarith, hv⟩

/-- A spectral node: a polynomial majorant of `Φ(τ v)` plus one spectral cut. -/
lemma TB.specNode {Φ : ℝ → ℝ} (hM : Moments μ U x) (hS : SteinCut μ U) (vs z : List ℚ)
    (lam mu t be nu : ℚ) (hvs : meshOK 0 vs = true) (hlam : 0 < lam) (hmu : 0 < mu)
    (hnu : 0 ≤ nu) (y : MPoly)
    (h1 : 0 ≤ y.a1) (h6 : 0 ≤ y.a6) (τ : ℝ)
    (hpt : ∀ v : ℝ, 0 ≤ v →
      Φ (τ * v) + specG vs z lam mu t be nu v ≤ evalL (y.list.map ((↑) : ℚ → ℝ)) v) :
    TB μ U Φ τ (y.J 0 1 x) := by
  obtain ⟨hC, hCi⟩ := hS.spec vs z lam mu t be nu hvs hlam hmu hnu
  obtain ⟨hP, hPi⟩ := moment_poly μ hM y.a0 y.a1 y.a2 y.a4 y.a6 (by exact_mod_cast h1)
    (by exact_mod_cast h6)
  refine ⟨fun ω => (y.a0 + y.a1 * √(U ω) + y.a2 * U ω + y.a4 * U ω ^ 2 + y.a6 * U ω ^ 3)
    - specG vs z lam mu t be nu (√(U ω)), hP.sub hC, fun ω => ?_, ?_⟩
  · have key := mpoly_at y 1 (√(U ω)) (U ω) (Real.sq_sqrt (hM.nonneg ω))
    rw [one_mul] at key
    have := hpt _ (Real.sqrt_nonneg (U ω))
    rw [key] at this
    simp only [one_pow, mul_one] at this
    linarith
  · rw [integral_sub hP hC]
    have eJ : y.J 0 1 x = y.a0 + y.a1 * ρ + y.a2 + y.a4 * (2 + x ^ 2)
        + y.a6 * (6 + 9 * x ^ 2 + C6 * x ^ 3) := by
      simp only [MPoly.J]; push_cast; ring
    rw [eJ]
    linarith

/-- A general spectral node: a polynomial majorant of `Φ(τ v)` plus one general spectral cut
of a node citing the budget `bud`. -/
lemma TB.gspecNode {Φ : ℝ → ℝ} (hM : Moments μ U x) (hS : SteinCut μ U) (vs z : List ℚ)
    (lam mu t be nu : ℚ) (bud : GBud) (hvs : meshOK 0 vs = true) (hlam : 0 < lam) (hmu : 0 < mu)
    (hnu : 0 ≤ nu) (hok : bud.ok lam mu = true) (y : MPoly)
    (h1 : 0 ≤ y.a1) (h6 : 0 ≤ y.a6) (τ : ℝ)
    (hpt : ∀ v : ℝ, 0 ≤ v →
      Φ (τ * v) + gspecG vs z lam mu t be nu (bud.af lam) (bud.ag mu) v
        ≤ evalL (y.list.map ((↑) : ℚ → ℝ)) v) :
    TB μ U Φ τ (y.J 0 1 x) := by
  obtain ⟨hC, hCi⟩ := hS.gspec vs z lam mu t be nu bud hvs hlam hmu hnu hok
  obtain ⟨hP, hPi⟩ := moment_poly μ hM y.a0 y.a1 y.a2 y.a4 y.a6 (by exact_mod_cast h1)
    (by exact_mod_cast h6)
  refine ⟨fun ω => (y.a0 + y.a1 * √(U ω) + y.a2 * U ω + y.a4 * U ω ^ 2 + y.a6 * U ω ^ 3)
    - gspecG vs z lam mu t be nu (bud.af lam) (bud.ag mu) (√(U ω)), hP.sub hC, fun ω => ?_, ?_⟩
  · have key := mpoly_at y 1 (√(U ω)) (U ω) (Real.sq_sqrt (hM.nonneg ω))
    rw [one_mul] at key
    have := hpt _ (Real.sqrt_nonneg (U ω))
    rw [key] at this
    simp only [one_pow, mul_one] at this
    linarith
  · rw [integral_sub hP hC]
    have eJ : y.J 0 1 x = y.a0 + y.a1 * ρ + y.a2 + y.a4 * (2 + x ^ 2)
        + y.a6 * (6 + 9 * x ^ 2 + C6 * x ^ 3) := by
      simp only [MPoly.J]; push_cast; ring
    rw [eJ]
    linarith

omit [IsProbabilityMeasure μ] in
/-- Convexity in `τ`: the chord of two node bounds. -/
lemma TB.chord {Φ : ℝ → ℝ} (hconv : ConvexOn ℝ (Set.Ici 0) Φ) (τ0 τ1 s v0 v1 : ℝ)
    (h0 : 0 ≤ τ0) (h01 : τ0 < τ1) (hs0 : τ0 ≤ s) (hs1 : s ≤ τ1)
    (hT0 : TB μ U Φ τ0 v0) (hT1 : TB μ U Φ τ1 v1) :
    TB μ U Φ s ((τ1 - s) / (τ1 - τ0) * v0 + (s - τ0) / (τ1 - τ0) * v1) := by
  obtain ⟨B0, hB0, hle0, hv0⟩ := hT0
  obtain ⟨B1, hB1, hle1, hv1⟩ := hT1
  have hd : 0 < τ1 - τ0 := by linarith
  obtain ⟨lam, hlam⟩ : ∃ lam : ℝ, lam = (s - τ0) / (τ1 - τ0) := ⟨_, rfl⟩
  have l0 : 0 ≤ lam := by rw [hlam]; exact div_nonneg (by linarith) hd.le
  have l1 : lam ≤ 1 := by rw [hlam, div_le_one hd]; linarith
  have hs : (1 - lam) * τ0 + lam * τ1 = s := by rw [hlam]; field_simp; ring
  have hw : (τ1 - s) / (τ1 - τ0) = 1 - lam := by rw [hlam]; field_simp; ring
  rw [hw, ← hlam]
  refine ⟨fun ω => (1 - lam) * B0 ω + lam * B1 ω, (hB0.const_mul _).add (hB1.const_mul _),
    fun ω => ?_, ?_⟩
  · have hsq := Real.sqrt_nonneg (U ω)
    have hcv := hconv.2 (Set.mem_Ici.2 (mul_nonneg h0 hsq))
      (Set.mem_Ici.2 (mul_nonneg (h0.trans h01.le) hsq)) (by linarith : 0 ≤ 1 - lam) l0
      (by ring : (1 - lam) + lam = 1)
    simp only [smul_eq_mul] at hcv
    have e : (1 - lam) * (τ0 * √(U ω)) + lam * (τ1 * √(U ω)) = s * √(U ω) := by
      rw [← hs]; ring
    rw [e] at hcv
    have a := mul_le_mul_of_nonneg_left (hle0 ω) (by linarith : 0 ≤ 1 - lam)
    have b := mul_le_mul_of_nonneg_left (hle1 ω) l0
    linarith
  · rw [integral_add (hB0.const_mul _) (hB1.const_mul _), integral_const_mul, integral_const_mul]
    nlinarith [mul_le_mul_of_nonneg_left hv0 (by linarith : 0 ≤ 1 - lam),
      mul_le_mul_of_nonneg_left hv1 l0]

omit [IsProbabilityMeasure μ] in
/-- Mixing two potentials with nonnegative weights at the same scale. -/
lemma TB.mix {Φ0 Φ1 : ℝ → ℝ} (w0 w1 : ℝ) (hw0 : 0 ≤ w0) (hw1 : 0 ≤ w1) {s v0 v1 : ℝ}
    (hT0 : TB μ U Φ0 s v0) (hT1 : TB μ U Φ1 s v1) :
    TB μ U (fun r => w0 * Φ0 r + w1 * Φ1 r) s (w0 * v0 + w1 * v1) := by
  obtain ⟨B0, hB0, hle0, hv0⟩ := hT0
  obtain ⟨B1, hB1, hle1, hv1⟩ := hT1
  refine ⟨fun ω => w0 * B0 ω + w1 * B1 ω, (hB0.const_mul _).add (hB1.const_mul _), fun ω => ?_, ?_⟩
  · have a := mul_le_mul_of_nonneg_left (hle0 ω) hw0
    have b := mul_le_mul_of_nonneg_left (hle1 ω) hw1
    linarith
  · rw [integral_add (hB0.const_mul _) (hB1.const_mul _), integral_const_mul, integral_const_mul]
    nlinarith [mul_le_mul_of_nonneg_left hv0 hw0, mul_le_mul_of_nonneg_left hv1 hw1]

end Grothe.Lower
