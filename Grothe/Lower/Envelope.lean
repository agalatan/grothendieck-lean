import Grothe.Lower.Bernstein
import Grothe.Lower.Profiles
import Grothe.Lower.Chords

/-!
# The scalar envelope with fixed rational mixtures

Support rows `(ℓᵢ, βᵢ, Cᵢ)` at the common witness parameter `ε` give quadratics
`Fᵢ(t) = t² − 2ℓᵢt + Cᵢ`, and the retained-square mixing of two rows with a fixed weight
`θ ∈ [0,1]` gives the quadratic

  `(1−θ) Fᵢ(t) + θ Fⱼ(t) − (2/ε) θ(1−θ) (βᵢ − βⱼ)²`.

A *model* fixes `(i, j, θ)`; the cells `[lo, hi]` of a contiguous cover of `[0, 9/10]` each select
one model, whose exact maximum on the cell (endpoints, and the vertex when concave) is compared
with the target `bound`.  `envelope_bound` is the soundness theorem: if every row inequality mixes
as above (`hmix`), a successful check implies `V ≤ bound`.
-/

namespace Grothe.Lower

structure EnvRow where
  ell : ℚ
  beta : ℚ
  C : ℚ
  deriving Repr, DecidableEq

structure EnvModel where
  i : ℕ
  j : ℕ
  θ : ℚ
  deriving Repr

structure EnvCell where
  lo : ℚ
  hi : ℚ
  model : ℕ
  deriving Repr

/-- `Fᵢ(t) = t² − 2ℓᵢ t + Cᵢ`. -/
noncomputable def F (row : EnvRow) (t : ℝ) : ℝ := t ^ 2 - 2 * row.ell * t + row.C

def dfltRow : EnvRow := ⟨0, 0, 0⟩

/-- Quadratic coefficients `(c0, c1, c2)` of the fixed mixture of a model. -/
def modelQuad (rows : List EnvRow) (m : EnvModel) : ℚ × ℚ × ℚ :=
  let a := rows.getD m.i dfltRow
  let b := rows.getD m.j dfltRow
  let w := 1 - m.θ
  (w * a.C + m.θ * b.C - 2 * w * m.θ * (a.beta - b.beta) ^ 2 / ε,
   -2 * (w * a.ell + m.θ * b.ell), 1)

def checkModel (rows : List EnvRow) (m : EnvModel) : Bool :=
  decide (m.i < rows.length) && decide (m.j < rows.length) && decide (0 ≤ m.θ) && decide (m.θ ≤ 1)

def checkEnvCells (rows : List EnvRow) (models : List EnvModel) (bound : ℚ) :
    ℚ → List EnvCell → Bool
  | prev, [] => prev == 9 / 10
  | prev, c :: rest =>
    (c.lo == prev) && decide (c.lo < c.hi) && decide (c.hi ≤ 9 / 10) &&
    decide (c.model < models.length) &&
    (let q := modelQuad rows (models.getD c.model ⟨0, 0, 0⟩)
     decide (quadMax q.1 q.2.1 q.2.2 c.lo c.hi ≤ bound)) &&
    checkEnvCells rows models bound c.hi rest

def checkEnvelope (rows : List EnvRow) (models : List EnvModel) (cells : List EnvCell)
    (bound : ℚ) : Bool :=
  models.all (checkModel rows) && checkEnvCells rows models bound 0 cells

lemma modelQuad_eval (rows : List EnvRow) (m : EnvModel) (t : ℝ) :
    ((modelQuad rows m).1 : ℝ) + (modelQuad rows m).2.1 * t + (modelQuad rows m).2.2 * t ^ 2
      = (1 - (m.θ : ℝ)) * F (rows.getD m.i dfltRow) t + m.θ * F (rows.getD m.j dfltRow) t
        - (2 / (ε : ℝ)) * m.θ * (1 - m.θ) *
            ((rows.getD m.i dfltRow).beta - (rows.getD m.j dfltRow).beta) ^ 2 := by
  simp only [modelQuad, F]
  push_cast
  ring

lemma envCells_sound (rows : List EnvRow) (models : List EnvModel) (bound : ℚ) :
    ∀ (prev : ℚ) (cells : List EnvCell), checkEnvCells rows models bound prev cells = true →
    cells ≠ [] → ∀ t : ℝ, (prev : ℝ) ≤ t → t ≤ 9 / 10 →
      ∃ c ∈ cells, (c.lo : ℝ) ≤ t ∧ t ≤ c.hi ∧ c.model < models.length ∧
        (let q := modelQuad rows (models.getD c.model ⟨0, 0, 0⟩)
         quadMax q.1 q.2.1 q.2.2 c.lo c.hi ≤ bound)
  | _, [], _, hne, _, _, _ => absurd rfl hne
  | prev, c :: rest, h, _, t, hpt, ht => by
    simp only [checkEnvCells, Bool.and_eq_true, beq_iff_eq, decide_eq_true_eq] at h
    obtain ⟨⟨⟨⟨⟨hlo, hlh⟩, hhi⟩, hm⟩, hq⟩, hrest⟩ := h
    by_cases hth : t ≤ (c.hi : ℝ)
    · exact ⟨c, List.mem_cons_self .., by rw [hlo]; exact hpt, hth, hm, hq⟩
    · cases rest with
      | nil =>
        simp only [checkEnvCells, beq_iff_eq] at hrest
        exfalso
        have : (c.hi : ℝ) = 9 / 10 := by rw [hrest]; norm_num
        exact hth (ht.trans this.ge)
      | cons c' rest' =>
        obtain ⟨c'', hc'', h1, h2, h3, h4⟩ :=
          envCells_sound rows models bound c.hi (c' :: rest') hrest (by simp) t
            (le_of_lt (not_le.1 hth)) ht
        exact ⟨c'', List.mem_cons_of_mem _ hc'', h1, h2, h3, h4⟩

/-- **Soundness of the envelope checker.** -/
theorem envelope_bound (rows : List EnvRow) (models : List EnvModel) (cells : List EnvCell)
    (bound : ℚ) (hchk : checkEnvelope rows models cells bound = true) (t V : ℝ)
    (ht0 : 0 ≤ t) (ht1 : t ≤ 9 / 10)
    (hmix : ∀ i j : ℕ, i < rows.length → j < rows.length → ∀ θ : ℝ, 0 ≤ θ → θ ≤ 1 →
      V ≤ (1 - θ) * F (rows.getD i dfltRow) t + θ * F (rows.getD j dfltRow) t
        - (2 / (ε : ℝ)) * θ * (1 - θ) *
            ((rows.getD i dfltRow).beta - (rows.getD j dfltRow).beta) ^ 2) :
    V ≤ bound := by
  simp only [checkEnvelope, Bool.and_eq_true, List.all_eq_true] at hchk
  obtain ⟨hmodels, hcells⟩ := hchk
  have hne : cells ≠ [] := by
    intro hnil
    rw [hnil] at hcells
    simp only [checkEnvCells, beq_iff_eq] at hcells
    norm_num at hcells
  obtain ⟨c, _, hlo, hhi, hm, hq⟩ := envCells_sound rows models bound 0 cells hcells hne t
    (by simpa using ht0) ht1
  set m := models.getD c.model ⟨0, 0, 0⟩ with hm_def
  have hmodel := hmodels m (getD_mem_of_lt _ _ _ hm)
  simp only [checkModel, Bool.and_eq_true, decide_eq_true_eq] at hmodel
  obtain ⟨⟨⟨hi, hj⟩, hθ0⟩, hθ1⟩ := hmodel
  have h1 := hmix m.i m.j hi hj m.θ (by exact_mod_cast hθ0) (by exact_mod_cast hθ1)
  rw [← modelQuad_eval] at h1
  have h2 := quadVal_le_quadMax (modelQuad rows m).1 (modelQuad rows m).2.1
    (modelQuad rows m).2.2 c.lo c.hi t hlo hhi
  have h3 : ((quadMax (modelQuad rows m).1 (modelQuad rows m).2.1 (modelQuad rows m).2.2
      c.lo c.hi : ℚ) : ℝ) ≤ bound := by exact_mod_cast hq
  linarith

end Grothe.Lower
