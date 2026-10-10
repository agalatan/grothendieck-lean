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
