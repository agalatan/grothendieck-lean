import Grothe.Lower.Sweep

/-!
# Stein cuts: the test functions and their polynomial pieces

A *cut* is given by a mesh `0 < v₁ < … < v_K` (in the variable `v = √u`, so the knots of the
test are `t₀ = 0`, `tₖ = vₖ²`) and a vector `z = (φ(t₀), …, φ(t_{K−1}), β', α)`.  The test `φ` is
the continuous piecewise-linear function with these knot values, `φ = 0` on `[t_K, ∞)`, and
`Φ(u) = ∫₀ᵘ φ`.  On the `k`-th mesh cell `φ(u) = A + Bu` and `Φ(u) = e₀ + Au + (B/2)u²`
(`cutCells`), and the cut function is

  `G(u) = (φ(u) + β')² + 2 (φ(u) − Φ(u)/u)² + 2α (Φ(u) − φ(u)) + (α²/3)(u² − 2)`

(`cutG`, as a function of `v`; at `u = 0` the difference `φ − Φ/u` is read as its limit `0`).
On each mesh cell `u² G(u)` is a quartic in `u` (`cellG_quartic`), and on the first cell `G`
itself is a quadratic (`cellG_first`); `cutG_cell` and `cutSum_cell` express this for a cut and
for a nonnegative combination of cuts in the form used by the majorant sweep.
-/

namespace Grothe.Lower

/-- The affine piece `φ = A + Bu` of a test on a mesh cell and the constant `e₀` of its
primitive `Φ = e₀ + Au + (B/2)u²`. -/
structure CutCell where
  A : ℚ
  B : ℚ
  e0 : ℚ

/-- The cells from the knot `t` (value `c`, primitive `Phi`) on; `cv` are the knot values. -/
def cutAux (cv : List ℚ) : ℚ → ℚ → ℚ → ℕ → List ℚ → List CutCell
  | _, _, Phi, _, [] => [⟨0, 0, Phi⟩]
  | t, c, Phi, i, w :: rest =>
    let c' := cv.getD (i + 1) 0
    let b := (c' - c) / (w ^ 2 - t)
    let a := c - b * t
    ⟨a, b, Phi - a * t - b / 2 * t ^ 2⟩ ::
      cutAux cv (w ^ 2) c' (Phi + (c + c') / 2 * (w ^ 2 - t)) (i + 1) rest

/-- The cells of the test with mesh `vs` and knot values `z₀, …, z_{K−1}` (and `0` at `t_K`). -/
def cutCells (vs z : List ℚ) : List CutCell :=
  cutAux (z.take vs.length) 0 ((z.take vs.length).getD 0 0) 0 0 vs

lemma cutAux_length (cv : List ℚ) : ∀ (vs : List ℚ) (t c Phi : ℚ) (i : ℕ),
    (cutAux cv t c Phi i vs).length = vs.length + 1
  | [], _, _, _, _ => by simp [cutAux]
  | w :: rest, t, c, Phi, i => by simp [cutAux, cutAux_length cv rest]

lemma cutCells_length (vs z : List ℚ) : (cutCells vs z).length = vs.length + 1 :=
  cutAux_length _ _ _ _ _ _

lemma cutCells_head_e0 (vs z : List ℚ) : ((cutCells vs z).getD 0 ⟨0, 0, 0⟩).e0 = 0 := by
  cases vs <;> simp [cutCells, cutAux]

/-- Strictly increasing positive mesh. -/
def meshOK : ℚ → List ℚ → Bool
  | _, [] => true
  | a, w :: r => decide (a < w) && meshOK w r

/-- Coefficients in `v` of `v^{sh(k)} G(v²)` on the `k`-th mesh cell. -/
def cutPolyV (k : ℕ) (c : CutCell) (be al : ℚ) : List ℚ :=
  if k = 0 then
    [(c.A + be) ^ 2 - 2 * c.B * c.e0 + 2 * al * (c.e0 - c.A) - 2 * al ^ 2 / 3, 0,
     2 * (c.A + be) * c.B + 2 * al * (c.A - c.B), 0, 3 / 2 * c.B ^ 2 + al * c.B + al ^ 2 / 3]
  else
    [2 * c.e0 ^ 2, 0, 0, 0,
     (c.A + be) ^ 2 - 2 * c.B * c.e0 + 2 * al * (c.e0 - c.A) - 2 * al ^ 2 / 3, 0,
     2 * (c.A + be) * c.B + 2 * al * (c.A - c.B), 0, 3 / 2 * c.B ^ 2 + al * c.B + al ^ 2 / 3]

/-- The cut function on a cell, in the variable `u`. -/
noncomputable def cellG (A B e0 be al u : ℝ) : ℝ :=
  (A + B * u + be) ^ 2
    + 2 * (if u = 0 then 0 else A + B * u - (e0 + A * u + B / 2 * u ^ 2) / u) ^ 2
    + 2 * al * (e0 + A * u + B / 2 * u ^ 2 - (A + B * u)) + al ^ 2 / 3 * (u ^ 2 - 2)

lemma cellG_quartic (A B e0 be al u : ℝ) (hu : u ≠ 0) :
    u ^ 2 * cellG A B e0 be al u
      = 2 * e0 ^ 2 + ((A + be) ^ 2 - 2 * B * e0 + 2 * al * (e0 - A) - 2 * al ^ 2 / 3) * u ^ 2
        + (2 * (A + be) * B + 2 * al * (A - B)) * u ^ 3
        + (3 / 2 * B ^ 2 + al * B + al ^ 2 / 3) * u ^ 4 := by
  simp only [cellG, hu, ↓reduceIte]
  field_simp
  ring

lemma cellG_first (A B be al u : ℝ) :
    cellG A B 0 be al u
      = ((A + be) ^ 2 - 2 * B * 0 + 2 * al * (0 - A) - 2 * al ^ 2 / 3)
        + (2 * (A + be) * B + 2 * al * (A - B)) * u
        + (3 / 2 * B ^ 2 + al * B + al ^ 2 / 3) * u ^ 2 := by
  by_cases hu : u = 0
  · subst hu; simp only [cellG, ↓reduceIte]; ring
  · simp only [cellG, hu, ↓reduceIte]
    field_simp
    ring

/-- **The cut function** `G(v²)` of the cut `(vs, z)`. -/
noncomputable def cutG (vs z : List ℚ) (v : ℝ) : ℝ :=
  cellG ((cutCells vs z).getD (pickIdx vs v) ⟨0, 0, 0⟩).A
    ((cutCells vs z).getD (pickIdx vs v) ⟨0, 0, 0⟩).B
    ((cutCells vs z).getD (pickIdx vs v) ⟨0, 0, 0⟩).e0
    (z.getD vs.length 0) (z.getD (vs.length + 1) 0) (v ^ 2)

lemma cutG_cell (vs z : List ℚ) (v : ℝ) (hk : pickIdx vs v = 0 ∨ 0 < v) :
    v ^ shOf (pickIdx vs v) * cutG vs z v
      = evalL ((cutPolyV (pickIdx vs v) ((cutCells vs z).getD (pickIdx vs v) ⟨0, 0, 0⟩)
          (z.getD vs.length 0) (z.getD (vs.length + 1) 0)).map ((↑) : ℚ → ℝ)) v := by
  by_cases h0 : pickIdx vs v = 0
  · unfold cutG
    rw [h0]
    have he := cutCells_head_e0 vs z
    obtain ⟨c, hc⟩ : ∃ c, c = (cutCells vs z).getD 0 ⟨0, 0, 0⟩ := ⟨_, rfl⟩
    rw [← hc] at he ⊢
    rw [he, Rat.cast_zero, cellG_first]
    simp only [shOf, cutPolyV, he, ↓reduceIte, List.map_cons, List.map_nil, evalL]
    push_cast
    ring
  · have hv : 0 < v := hk.resolve_left h0
    have hu : v ^ 2 ≠ 0 := by positivity
    unfold cutG
    obtain ⟨c, hc⟩ : ∃ c, c = (cutCells vs z).getD (pickIdx vs v) ⟨0, 0, 0⟩ := ⟨_, rfl⟩
    rw [← hc]
    have key := cellG_quartic c.A c.B c.e0 (z.getD vs.length 0) (z.getD (vs.length + 1) 0)
      (v ^ 2) hu
    simp only [shOf, cutPolyV, h0, ↓reduceIte, List.map_cons, List.map_nil, evalL]
    push_cast
    linear_combination key

/-- A nonnegative combination of cuts on one mesh. -/
noncomputable def cutSum (vs : List ℚ) (cs : List (ℚ × List ℚ)) (v : ℝ) : ℝ :=
  (cs.map fun c => (c.1 : ℝ) * cutG vs c.2 v).sum

/-- The polynomial pieces of the cells from index `i` on. -/
def cutPolysFrom (be al : ℚ) : ℕ → List CutCell → List (List ℚ)
  | _, [] => []
  | i, c :: r => cutPolyV i c be al :: cutPolysFrom be al (i + 1) r

/-- The polynomial pieces of a cut, one per mesh cell. -/
def cutPolys (vs z : List ℚ) : List (List ℚ) :=
  cutPolysFrom (z.getD vs.length 0) (z.getD (vs.length + 1) 0) 0 (cutCells vs z)

lemma cutPolysFrom_getD (be al : ℚ) : ∀ (cells : List CutCell) (i k : ℕ), k < cells.length →
    (cutPolysFrom be al i cells).getD k [] = cutPolyV (i + k) (cells.getD k ⟨0, 0, 0⟩) be al
  | [], _, _, h => absurd h (by simp)
  | c :: r, i, 0, _ => by simp [cutPolysFrom]
  | c :: r, i, k + 1, h => by
    simp only [cutPolysFrom, List.getD_cons_succ]
    rw [cutPolysFrom_getD be al r (i + 1) k (by simpa using h)]
    congr 1
    omega

lemma pickIdx_le (vs : List ℚ) (v : ℝ) : pickIdx vs v ≤ vs.length := by
  induction vs with
  | nil => simp [pickIdx]
  | cons t r ih => simp only [pickIdx, List.length_cons]; split_ifs <;> omega

lemma cutPolys_getD (vs z : List ℚ) (v : ℝ) :
    (cutPolys vs z).getD (pickIdx vs v) []
      = cutPolyV (pickIdx vs v) ((cutCells vs z).getD (pickIdx vs v) ⟨0, 0, 0⟩)
          (z.getD vs.length 0) (z.getD (vs.length + 1) 0) := by
  have h := cutPolysFrom_getD (z.getD vs.length 0) (z.getD (vs.length + 1) 0) (cutCells vs z) 0
    (pickIdx vs v) (by rw [cutCells_length]; have := pickIdx_le vs v; omega)
  rw [zero_add] at h
  exact h

/-- The polynomial piece on the `k`-th mesh cell of a combination of cuts given by their
weights and polynomial pieces. -/
def sumPoly (cuts : List (ℚ × List (List ℚ))) (k : ℕ) : List ℚ :=
  cuts.foldr (fun c acc => addLq (scaleL c.1 (c.2.getD k [])) acc) []

lemma cutSum_cell (vs : List ℚ) (cs : List (ℚ × List ℚ)) (v : ℝ)
    (hk : pickIdx vs v = 0 ∨ 0 < v) :
    v ^ shOf (pickIdx vs v) * cutSum vs cs v
      = evalL ((sumPoly (cs.map fun c => (c.1, cutPolys vs c.2)) (pickIdx vs v)).map
          ((↑) : ℚ → ℝ)) v := by
  induction cs with
  | nil => simp [cutSum, sumPoly, evalL]
  | cons c r ih =>
    have h1 := cutG_cell vs c.2 v hk
    rw [← cutPolys_getD] at h1
    show v ^ shOf (pickIdx vs v) * ((c.1 : ℝ) * cutG vs c.2 v + cutSum vs r v)
      = evalL ((addLq (scaleL c.1 ((cutPolys vs c.2).getD (pickIdx vs v) []))
          (sumPoly (r.map fun c => (c.1, cutPolys vs c.2)) (pickIdx vs v))).map
            ((↑) : ℚ → ℝ)) v
    rw [evalL_addLq, evalL_scaleL, ← ih, ← h1]
    ring

end Grothe.Lower

/-! ### The spectral cuts -/

namespace Grothe.Lower

/-- The **spectral cut** on a cell, in the variable `u`: with `φ = A + Bu`,
`Φ = e₀ + Au + (B/2)u²`, `d = φ − Φ/u` (read as `0` at `u = 0`),
`f = −(φ + β)/2 + (2t + λ/3)u` and `g = −d/2 + (t + μ/3 − ν/2)u`,

  `G(u) = f²/λ + g²/μ + Φ − φ + (ν/3 − 2t)(u² − 2)`. -/
noncomputable def specCellG (A B e0 lam mu t be nu u : ℝ) : ℝ :=
  (-(A + B * u + be) / 2 + (2 * t + lam / 3) * u) ^ 2 / lam
    + (-(if u = 0 then 0 else A + B * u - (e0 + A * u + B / 2 * u ^ 2) / u) / 2
      + (t + mu / 3 - nu / 2) * u) ^ 2 / mu
    + (e0 + A * u + B / 2 * u ^ 2 - (A + B * u)) + (nu / 3 - 2 * t) * (u ^ 2 - 2)

/-- The coefficients `f₀ = −(A + β)/2`, `f₁ = −B/2 + 2t + λ/3`, `g₂ = −B/4 + t + μ/3 − ν/2` of
`f = f₀ + f₁u` and `ug = e₀/2 + g₂u²` on a cell. -/
def specF0 (c : CutCell) (be : ℚ) : ℚ := -(c.A + be) / 2
def specF1 (c : CutCell) (lam t : ℚ) : ℚ := -c.B / 2 + 2 * t + lam / 3
def specG2 (c : CutCell) (mu t nu : ℚ) : ℚ := -c.B / 4 + t + mu / 3 - nu / 2

/-- Coefficients in `v` of `v^{sh(k)} G(v²)` on the `k`-th mesh cell of a spectral cut
`(λ, μ, t, β, ν)`: `G` itself on the first cell (where `e₀ = 0`), `u² G(u)` on the others. -/
def specPolyV (k : ℕ) (c : CutCell) (lam mu t be nu : ℚ) : List ℚ :=
  if k = 0 then
    [specF0 c be ^ 2 / lam - c.A + 4 * t - 2 * nu / 3, 0,
     2 * specF0 c be * specF1 c lam t / lam + (c.A - c.B), 0,
     specF1 c lam t ^ 2 / lam + specG2 c mu t nu ^ 2 / mu + c.B / 2 + (nu / 3 - 2 * t)]
  else
    [c.e0 ^ 2 / (4 * mu), 0, 0, 0,
     specF0 c be ^ 2 / lam + c.e0 * specG2 c mu t nu / mu + c.e0 - c.A + 4 * t - 2 * nu / 3, 0,
     2 * specF0 c be * specF1 c lam t / lam + (c.A - c.B), 0,
     specF1 c lam t ^ 2 / lam + specG2 c mu t nu ^ 2 / mu + c.B / 2 + (nu / 3 - 2 * t)]

lemma specCellG_quartic (A B e0 lam mu t be nu u : ℝ) (hu : u ≠ 0) :
    u ^ 2 * specCellG A B e0 lam mu t be nu u
      = e0 ^ 2 / (4 * mu)
        + ((-(A + be) / 2) ^ 2 / lam + e0 * (-B / 4 + t + mu / 3 - nu / 2) / mu + e0 - A + 4 * t
          - 2 * nu / 3) * u ^ 2
        + (2 * (-(A + be) / 2) * (-B / 2 + 2 * t + lam / 3) / lam + (A - B)) * u ^ 3
        + ((-B / 2 + 2 * t + lam / 3) ^ 2 / lam + (-B / 4 + t + mu / 3 - nu / 2) ^ 2 / mu + B / 2
          + (nu / 3 - 2 * t)) * u ^ 4 := by
  simp only [specCellG, hu, ↓reduceIte]
  have e : -(A + B * u - (e0 + A * u + B / 2 * u ^ 2) / u) / 2 + (t + mu / 3 - nu / 2) * u
      = (e0 / 2 + (-B / 4 + t + mu / 3 - nu / 2) * u ^ 2) / u := by
    field_simp; ring
  rw [e, div_pow]
  field_simp
  ring

lemma specCellG_first (A B lam mu t be nu u : ℝ) :
    specCellG A B 0 lam mu t be nu u
      = ((-(A + be) / 2) ^ 2 / lam - A + 4 * t - 2 * nu / 3)
        + (2 * (-(A + be) / 2) * (-B / 2 + 2 * t + lam / 3) / lam + (A - B)) * u
        + ((-B / 2 + 2 * t + lam / 3) ^ 2 / lam + (-B / 4 + t + mu / 3 - nu / 2) ^ 2 / mu + B / 2
          + (nu / 3 - 2 * t)) * u ^ 2 := by
  have e : (-(if u = 0 then 0 else A + B * u - (0 + A * u + B / 2 * u ^ 2) / u) / 2
      + (t + mu / 3 - nu / 2) * u) = (-B / 4 + t + mu / 3 - nu / 2) * u := by
    split_ifs with hu
    · subst hu; ring
    · field_simp; ring
  simp only [specCellG]
  rw [e]
  ring

/-- **The spectral cut function** `G(v²)` of the test `(vs, z)` with parameters
`(λ, μ, t, β, ν)`. -/
noncomputable def specG (vs z : List ℚ) (lam mu t be nu : ℚ) (v : ℝ) : ℝ :=
  specCellG ((cutCells vs z).getD (pickIdx vs v) ⟨0, 0, 0⟩).A
    ((cutCells vs z).getD (pickIdx vs v) ⟨0, 0, 0⟩).B
    ((cutCells vs z).getD (pickIdx vs v) ⟨0, 0, 0⟩).e0 lam mu t be nu (v ^ 2)

lemma specG_cell (vs z : List ℚ) (lam mu t be nu : ℚ) (v : ℝ) (hk : pickIdx vs v = 0 ∨ 0 < v) :
    v ^ shOf (pickIdx vs v) * specG vs z lam mu t be nu v
      = evalL ((specPolyV (pickIdx vs v) ((cutCells vs z).getD (pickIdx vs v) ⟨0, 0, 0⟩)
          lam mu t be nu).map ((↑) : ℚ → ℝ)) v := by
  by_cases h0 : pickIdx vs v = 0
  · unfold specG
    rw [h0]
    have he := cutCells_head_e0 vs z
    obtain ⟨c, hc⟩ : ∃ c, c = (cutCells vs z).getD 0 ⟨0, 0, 0⟩ := ⟨_, rfl⟩
    rw [← hc] at he ⊢
    rw [he, Rat.cast_zero, specCellG_first]
    simp only [shOf, specPolyV, specF0, specF1, specG2, ↓reduceIte, List.map_cons, List.map_nil,
      evalL]
    push_cast
    ring
  · have hv : 0 < v := hk.resolve_left h0
    have hu : v ^ 2 ≠ 0 := by positivity
    unfold specG
    obtain ⟨c, hc⟩ : ∃ c, c = (cutCells vs z).getD (pickIdx vs v) ⟨0, 0, 0⟩ := ⟨_, rfl⟩
    rw [← hc]
    have key := specCellG_quartic c.A c.B c.e0 lam mu t be nu (v ^ 2) hu
    simp only [shOf, specPolyV, specF0, specF1, specG2, h0, ↓reduceIte, List.map_cons,
      List.map_nil, evalL]
    push_cast
    linear_combination key

/-- The polynomial pieces of the cells from index `i` on. -/
def specPolysFrom (lam mu t be nu : ℚ) : ℕ → List CutCell → List (List ℚ)
  | _, [] => []
  | i, c :: r => specPolyV i c lam mu t be nu :: specPolysFrom lam mu t be nu (i + 1) r

/-- The polynomial pieces of a spectral cut, one per mesh cell. -/
def specPolys (vs z : List ℚ) (lam mu t be nu : ℚ) : List (List ℚ) :=
  specPolysFrom lam mu t be nu 0 (cutCells vs z)

lemma specPolysFrom_getD (lam mu t be nu : ℚ) : ∀ (cells : List CutCell) (i k : ℕ),
    k < cells.length → (specPolysFrom lam mu t be nu i cells).getD k []
      = specPolyV (i + k) (cells.getD k ⟨0, 0, 0⟩) lam mu t be nu
  | [], _, _, h => absurd h (by simp)
  | c :: r, i, 0, _ => by simp [specPolysFrom]
  | c :: r, i, k + 1, h => by
    simp only [specPolysFrom, List.getD_cons_succ]
    rw [specPolysFrom_getD lam mu t be nu r (i + 1) k (by simpa using h)]
    congr 1
    omega

lemma specPolys_getD (vs z : List ℚ) (lam mu t be nu : ℚ) (v : ℝ) :
    (specPolys vs z lam mu t be nu).getD (pickIdx vs v) []
      = specPolyV (pickIdx vs v) ((cutCells vs z).getD (pickIdx vs v) ⟨0, 0, 0⟩)
          lam mu t be nu := by
  have h := specPolysFrom_getD lam mu t be nu (cutCells vs z) 0 (pickIdx vs v)
    (by rw [cutCells_length]; have := pickIdx_le vs v; omega)
  rw [zero_add] at h
  exact h

/-! ### The general spectral cut: budget shifts -/

/-- The **general spectral cut** on a cell: `specCellG` with the coefficients of `u` in `f` and
`g` shifted by `af` and `−ag` (the budget shifts of a node citing a contraction-Gram budget or
the coupled one-parameter family):

  `f = −(φ + β)/2 + (2t + λ/3 + af)u`,  `g = −d/2 + (t + μ/3 − ν/2 − ag)u`,
  `G(u) = f²/λ + g²/μ + Φ − φ + (ν/3 − 2t)(u² − 2)`.

Its expectation is the two squares plus `λ(2P/3 − E X²) + μ(2Q/3 − E r²) + ν(χ/3 − Q)
+ 2af·P − 2ag·Q`, so the node needs the law budget
`λ E X² + μ E r² ≤ (2λ/3 + 2af) P + (2μ/3 − 2ag) Q`. -/
noncomputable def gspecCellG (A B e0 lam mu t be nu af ag u : ℝ) : ℝ :=
  (-(A + B * u + be) / 2 + (2 * t + lam / 3 + af) * u) ^ 2 / lam
    + (-(if u = 0 then 0 else A + B * u - (e0 + A * u + B / 2 * u ^ 2) / u) / 2
      + (t + mu / 3 - nu / 2 - ag) * u) ^ 2 / mu
    + (e0 + A * u + B / 2 * u ^ 2 - (A + B * u)) + (nu / 3 - 2 * t) * (u ^ 2 - 2)

/-- The shifted coefficients `f₁ = −B/2 + 2t + λ/3 + af`, `g₂ = −B/4 + t + μ/3 − ν/2 − ag`. -/
def gspecF1 (c : CutCell) (lam t af : ℚ) : ℚ := -c.B / 2 + 2 * t + lam / 3 + af
def gspecG2 (c : CutCell) (mu t nu ag : ℚ) : ℚ := -c.B / 4 + t + mu / 3 - nu / 2 - ag

/-- Coefficients in `v` of `v^{sh(k)} G(v²)` on the `k`-th mesh cell of a general spectral cut. -/
def gspecPolyV (k : ℕ) (c : CutCell) (lam mu t be nu af ag : ℚ) : List ℚ :=
  if k = 0 then
    [specF0 c be ^ 2 / lam - c.A + 4 * t - 2 * nu / 3, 0,
     2 * specF0 c be * gspecF1 c lam t af / lam + (c.A - c.B), 0,
     gspecF1 c lam t af ^ 2 / lam + gspecG2 c mu t nu ag ^ 2 / mu + c.B / 2 + (nu / 3 - 2 * t)]
  else
    [c.e0 ^ 2 / (4 * mu), 0, 0, 0,
     specF0 c be ^ 2 / lam + c.e0 * gspecG2 c mu t nu ag / mu + c.e0 - c.A + 4 * t - 2 * nu / 3, 0,
     2 * specF0 c be * gspecF1 c lam t af / lam + (c.A - c.B), 0,
     gspecF1 c lam t af ^ 2 / lam + gspecG2 c mu t nu ag ^ 2 / mu + c.B / 2 + (nu / 3 - 2 * t)]

lemma gspecCellG_quartic (A B e0 lam mu t be nu af ag u : ℝ) (hu : u ≠ 0) :
    u ^ 2 * gspecCellG A B e0 lam mu t be nu af ag u
      = e0 ^ 2 / (4 * mu)
        + ((-(A + be) / 2) ^ 2 / lam + e0 * (-B / 4 + t + mu / 3 - nu / 2 - ag) / mu + e0 - A
          + 4 * t - 2 * nu / 3) * u ^ 2
        + (2 * (-(A + be) / 2) * (-B / 2 + 2 * t + lam / 3 + af) / lam + (A - B)) * u ^ 3
        + ((-B / 2 + 2 * t + lam / 3 + af) ^ 2 / lam + (-B / 4 + t + mu / 3 - nu / 2 - ag) ^ 2 / mu
          + B / 2 + (nu / 3 - 2 * t)) * u ^ 4 := by
  simp only [gspecCellG, hu, ↓reduceIte]
  have e : -(A + B * u - (e0 + A * u + B / 2 * u ^ 2) / u) / 2 + (t + mu / 3 - nu / 2 - ag) * u
      = (e0 / 2 + (-B / 4 + t + mu / 3 - nu / 2 - ag) * u ^ 2) / u := by
    field_simp; ring
  rw [e, div_pow]
  field_simp
  ring

lemma gspecCellG_first (A B lam mu t be nu af ag u : ℝ) :
    gspecCellG A B 0 lam mu t be nu af ag u
      = ((-(A + be) / 2) ^ 2 / lam - A + 4 * t - 2 * nu / 3)
        + (2 * (-(A + be) / 2) * (-B / 2 + 2 * t + lam / 3 + af) / lam + (A - B)) * u
        + ((-B / 2 + 2 * t + lam / 3 + af) ^ 2 / lam + (-B / 4 + t + mu / 3 - nu / 2 - ag) ^ 2 / mu
          + B / 2 + (nu / 3 - 2 * t)) * u ^ 2 := by
  have e : (-(if u = 0 then 0 else A + B * u - (0 + A * u + B / 2 * u ^ 2) / u) / 2
      + (t + mu / 3 - nu / 2 - ag) * u) = (-B / 4 + t + mu / 3 - nu / 2 - ag) * u := by
    split_ifs with hu
    · subst hu; ring
    · field_simp; ring
  simp only [gspecCellG]
  rw [e]
  ring

/-- **The general spectral cut function** `G(v²)` of the test `(vs, z)` with parameters
`(λ, μ, t, β, ν)` and budget shifts `(af, ag)`. -/
noncomputable def gspecG (vs z : List ℚ) (lam mu t be nu af ag : ℚ) (v : ℝ) : ℝ :=
  gspecCellG ((cutCells vs z).getD (pickIdx vs v) ⟨0, 0, 0⟩).A
    ((cutCells vs z).getD (pickIdx vs v) ⟨0, 0, 0⟩).B
    ((cutCells vs z).getD (pickIdx vs v) ⟨0, 0, 0⟩).e0 lam mu t be nu af ag (v ^ 2)

lemma gspecG_cell (vs z : List ℚ) (lam mu t be nu af ag : ℚ) (v : ℝ)
    (hk : pickIdx vs v = 0 ∨ 0 < v) :
    v ^ shOf (pickIdx vs v) * gspecG vs z lam mu t be nu af ag v
      = evalL ((gspecPolyV (pickIdx vs v) ((cutCells vs z).getD (pickIdx vs v) ⟨0, 0, 0⟩)
          lam mu t be nu af ag).map ((↑) : ℚ → ℝ)) v := by
  by_cases h0 : pickIdx vs v = 0
  · unfold gspecG
    rw [h0]
    have he := cutCells_head_e0 vs z
    obtain ⟨c, hc⟩ : ∃ c, c = (cutCells vs z).getD 0 ⟨0, 0, 0⟩ := ⟨_, rfl⟩
    rw [← hc] at he ⊢
    rw [he, Rat.cast_zero, gspecCellG_first]
    simp only [shOf, gspecPolyV, specF0, gspecF1, gspecG2, ↓reduceIte, List.map_cons,
      List.map_nil, evalL]
    push_cast
    ring
  · have hv : 0 < v := hk.resolve_left h0
    have hu : v ^ 2 ≠ 0 := by positivity
    unfold gspecG
    obtain ⟨c, hc⟩ : ∃ c, c = (cutCells vs z).getD (pickIdx vs v) ⟨0, 0, 0⟩ := ⟨_, rfl⟩
    rw [← hc]
    have key := gspecCellG_quartic c.A c.B c.e0 lam mu t be nu af ag (v ^ 2) hu
    simp only [shOf, gspecPolyV, specF0, gspecF1, gspecG2, h0, ↓reduceIte, List.map_cons,
      List.map_nil, evalL]
    push_cast
    linear_combination key

/-- The polynomial pieces of the cells from index `i` on. -/
def gspecPolysFrom (lam mu t be nu af ag : ℚ) : ℕ → List CutCell → List (List ℚ)
  | _, [] => []
  | i, c :: r => gspecPolyV i c lam mu t be nu af ag :: gspecPolysFrom lam mu t be nu af ag (i + 1) r

/-- The polynomial pieces of a general spectral cut, one per mesh cell. -/
def gspecPolys (vs z : List ℚ) (lam mu t be nu af ag : ℚ) : List (List ℚ) :=
  gspecPolysFrom lam mu t be nu af ag 0 (cutCells vs z)

lemma gspecPolysFrom_getD (lam mu t be nu af ag : ℚ) : ∀ (cells : List CutCell) (i k : ℕ),
    k < cells.length → (gspecPolysFrom lam mu t be nu af ag i cells).getD k []
      = gspecPolyV (i + k) (cells.getD k ⟨0, 0, 0⟩) lam mu t be nu af ag
  | [], _, _, h => absurd h (by simp)
  | c :: r, i, 0, _ => by simp [gspecPolysFrom]
  | c :: r, i, k + 1, h => by
    simp only [gspecPolysFrom, List.getD_cons_succ]
    rw [gspecPolysFrom_getD lam mu t be nu af ag r (i + 1) k (by simpa using h)]
    congr 1
    omega

lemma gspecPolys_getD (vs z : List ℚ) (lam mu t be nu af ag : ℚ) (v : ℝ) :
    (gspecPolys vs z lam mu t be nu af ag).getD (pickIdx vs v) []
      = gspecPolyV (pickIdx vs v) ((cutCells vs z).getD (pickIdx vs v) ⟨0, 0, 0⟩)
          lam mu t be nu af ag := by
  have h := gspecPolysFrom_getD lam mu t be nu af ag (cutCells vs z) 0 (pickIdx vs v)
    (by rw [cutCells_length]; have := pickIdx_le vs v; omega)
  rw [zero_add] at h
  exact h

/-! ### The joint cut: the term `ζ(−u³ + 9u² − 12)` -/

/-- Coefficients in `v` of `v^{sh(k)} ζ(−v⁶ + 9v⁴ − 12)` on the `k`-th mesh cell. -/
def jointPolyV (k : ℕ) (ze : ℚ) : List ℚ :=
  if k = 0 then [-12 * ze, 0, 0, 0, 9 * ze, 0, -ze]
  else [0, 0, 0, 0, -12 * ze, 0, 0, 0, 9 * ze, 0, -ze]

/-- The **joint cut**: the general spectral cut plus `ζ(−u³ + 9u² − 12)`, `u = v²`. -/
noncomputable def jspecG (vs z : List ℚ) (lam mu t be nu af ag ze : ℚ) (v : ℝ) : ℝ :=
  gspecG vs z lam mu t be nu af ag v + ze * (-(v ^ 2) ^ 3 + 9 * (v ^ 2) ^ 2 - 12)

lemma jspecG_cell (vs z : List ℚ) (lam mu t be nu af ag ze : ℚ) (v : ℝ)
    (hk : pickIdx vs v = 0 ∨ 0 < v) :
    v ^ shOf (pickIdx vs v) * jspecG vs z lam mu t be nu af ag ze v
      = evalL ((addLq (gspecPolyV (pickIdx vs v) ((cutCells vs z).getD (pickIdx vs v) ⟨0, 0, 0⟩)
          lam mu t be nu af ag) (jointPolyV (pickIdx vs v) ze)).map ((↑) : ℚ → ℝ)) v := by
  rw [jspecG, mul_add, gspecG_cell vs z lam mu t be nu af ag v hk, evalL_addLq]
  congr 1
  by_cases h0 : pickIdx vs v = 0
  · simp only [h0, shOf, jointPolyV, ↓reduceIte, List.map_cons, List.map_nil, evalL]
    push_cast; ring
  · simp only [h0, shOf, jointPolyV, ↓reduceIte, List.map_cons, List.map_nil, evalL]
    push_cast; ring

/-- The polynomial pieces of the joint cut from index `i` on. -/
def jspecPolysFrom (lam mu t be nu af ag ze : ℚ) : ℕ → List CutCell → List (List ℚ)
  | _, [] => []
  | i, c :: r => addLq (gspecPolyV i c lam mu t be nu af ag) (jointPolyV i ze)
      :: jspecPolysFrom lam mu t be nu af ag ze (i + 1) r

/-- The polynomial pieces of a joint cut, one per mesh cell. -/
def jspecPolys (vs z : List ℚ) (lam mu t be nu af ag ze : ℚ) : List (List ℚ) :=
  jspecPolysFrom lam mu t be nu af ag ze 0 (cutCells vs z)

lemma jspecPolysFrom_getD (lam mu t be nu af ag ze : ℚ) : ∀ (cells : List CutCell) (i k : ℕ),
    k < cells.length → (jspecPolysFrom lam mu t be nu af ag ze i cells).getD k []
      = addLq (gspecPolyV (i + k) (cells.getD k ⟨0, 0, 0⟩) lam mu t be nu af ag)
          (jointPolyV (i + k) ze)
  | [], _, _, h => absurd h (by simp)
  | c :: r, i, 0, _ => by simp [jspecPolysFrom]
  | c :: r, i, k + 1, h => by
    simp only [jspecPolysFrom, List.getD_cons_succ]
    rw [jspecPolysFrom_getD lam mu t be nu af ag ze r (i + 1) k (by simpa using h)]
    congr 2 <;> omega

lemma jspecPolys_getD (vs z : List ℚ) (lam mu t be nu af ag ze : ℚ) (v : ℝ) :
    (jspecPolys vs z lam mu t be nu af ag ze).getD (pickIdx vs v) []
      = addLq (gspecPolyV (pickIdx vs v) ((cutCells vs z).getD (pickIdx vs v) ⟨0, 0, 0⟩)
          lam mu t be nu af ag) (jointPolyV (pickIdx vs v) ze) := by
  have h := jspecPolysFrom_getD lam mu t be nu af ag ze (cutCells vs z) 0 (pickIdx vs v)
    (by rw [cutCells_length]; have := pickIdx_le vs v; omega)
  rw [zero_add] at h
  exact h

end Grothe.Lower
