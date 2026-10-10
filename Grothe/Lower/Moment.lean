import Grothe.Lower.Poly

/-!
# Constants and the moment bound of a physical polynomial

The constants of the lower-bound certificate, and *physical polynomials*
`p(s) = a₀ + a₁s + a₂s² + a₄s⁴ + a₆s⁶` (`MPoly`).  If `p` majorizes the potential of a row, then
with `σ = ‖q‖₂`, `x² = E|ξ|⁴ − 2` for the normalized residual `ξ = q/σ`, the first-moment bound
`E|ξ| ≤ ρ` and the sixth-moment bound `E|ξ|⁶ ≤ 6 + 9x² + C₆x³` bound the integrated potential
minus the price `κσ²` by

  `J(σ, x) = a₀ + ρa₁σ + (a₂ − κ)σ² + a₄(2 + x²)σ⁴ + a₆(6 + 9x² + C₆x³)σ⁶`   (`a₁, a₆ ≥ 0`).

On a rectangle `[slo, shi] × [xlo, xhi]` the maximum of `J` is attained at an `x`-endpoint
(`MPoly.J_endpoint`) and is bounded there by the positivity certificate of `cap − J` (`checkJ`,
`checkJ_sound`).
-/

namespace Grothe.Lower

/-- `ρ = 0.973612157`, the first absolute moment bound of a normalized cubic. -/
def ρ : ℚ := 973612157 / 1000000000
/-- `C₆ = 40.45313`, the sixth-moment coefficient. -/
def C6 : ℚ := 4045313 / 100000
/-- The witness parameter `ε = 149/200`. -/
def ε : ℚ := 149 / 200
/-- The upper end `31/4` of the `x`-range (`E|ξ|⁴ ≤ 62`). -/
def xMax : ℚ := 31 / 4
/-- The slack `10⁻¹¹` added to the node caps of the potentials. -/
def capPad : ℚ := 1 / 100000000000

/-- A physical polynomial `a₀ + a₁ s + a₂ s² + a₄ s⁴ + a₆ s⁶`. -/
structure MPoly where
  a0 : ℚ
  a1 : ℚ
  a2 : ℚ
  a4 : ℚ
  a6 : ℚ
  deriving Repr

/-- Its coefficient list. -/
def MPoly.list (p : MPoly) : List ℚ := [p.a0, p.a1, p.a2, 0, p.a4, 0, p.a6]

/-- Coefficients (in `σ`) of `J` at a fixed `x`. -/
def MPoly.pw (p : MPoly) (kap x : ℚ) : List ℚ :=
  [p.a0, ρ * p.a1, p.a2 - kap, 0, p.a4 * (2 + x ^ 2), 0, p.a6 * (6 + 9 * x ^ 2 + C6 * x ^ 3)]

/-- `J(σ, x) = a₀ + ρa₁σ + (a₂ − κ)σ² + a₄(2+x²)σ⁴ + a₆(6+9x²+C₆x³)σ⁶`. -/
noncomputable def MPoly.J (p : MPoly) (kap : ℚ) (σ x : ℝ) : ℝ :=
  p.a0 + ρ * p.a1 * σ + ((p.a2 : ℝ) - kap) * σ ^ 2 + p.a4 * (2 + x ^ 2) * σ ^ 4
    + p.a6 * (6 + 9 * x ^ 2 + C6 * x ^ 3) * σ ^ 6

/-- The value of `J` at rational arguments. -/
def MPoly.Jq (p : MPoly) (kap σ x : ℚ) : ℚ :=
  p.a0 + ρ * p.a1 * σ + (p.a2 - kap) * σ ^ 2 + p.a4 * (2 + x ^ 2) * σ ^ 4
    + p.a6 * (6 + 9 * x ^ 2 + C6 * x ^ 3) * σ ^ 6

lemma MPoly.Jq_cast (p : MPoly) (kap σ x : ℚ) : ((p.Jq kap σ x : ℚ) : ℝ) = p.J kap σ x := by
  simp only [MPoly.Jq, MPoly.J]; push_cast; ring

lemma MPoly.J_eq_evalL (p : MPoly) (kap : ℚ) (σ : ℝ) (x : ℚ) :
    p.J kap σ x = evalL ((p.pw kap x).map ((↑) : ℚ → ℝ)) σ := by
  simp only [MPoly.J, MPoly.pw, List.map_cons, List.map_nil, evalL]
  push_cast
  ring

/-- The maximum of `J` in `x` over `[xlo, xhi] ⊆ [0, ∞)` is attained at an endpoint. -/
lemma MPoly.J_endpoint (p : MPoly) (kap : ℚ) (σ x : ℝ) (xlo xhi : ℚ) (h6 : 0 ≤ p.a6)
    (hx0 : 0 ≤ xlo) (h1 : (xlo : ℝ) ≤ x) (h2 : x ≤ xhi) :
    p.J kap σ x ≤ max (p.J kap σ xlo) (p.J kap σ xhi) := by
  have hA6 : (0 : ℝ) ≤ p.a6 := by exact_mod_cast h6
  have hC6 : (0 : ℝ) ≤ (C6 : ℚ) := by norm_num [C6]
  obtain ⟨a, ha⟩ : ∃ a : ℝ, a = p.a4 * σ ^ 4 + 9 * p.a6 * σ ^ 6 := ⟨_, rfl⟩
  obtain ⟨b, hb⟩ : ∃ b : ℝ, b = p.a6 * (C6 : ℚ) * σ ^ 6 := ⟨_, rfl⟩
  obtain ⟨K, hK⟩ : ∃ K : ℝ, K = p.a0 + ρ * p.a1 * σ + ((p.a2 : ℝ) - kap) * σ ^ 2
      + 2 * p.a4 * σ ^ 4 + 6 * p.a6 * σ ^ 6 := ⟨_, rfl⟩
  have hJ : ∀ y : ℝ, p.J kap σ y = K + (a * y ^ 2 + b * y ^ 3) := by
    intro y; simp only [MPoly.J, hK, ha, hb]; ring
  have hb0 : 0 ≤ b := by
    rw [hb]; exact mul_nonneg (mul_nonneg hA6 hC6) (by positivity)
  have hx0' : (0 : ℝ) ≤ xlo := by exact_mod_cast hx0
  have := cubic_endpoint_le a b x xlo xhi hb0 hx0' h1 h2
  rw [hJ x, hJ, hJ]
  rcases le_max_iff.1 this with h | h
  · exact le_max_of_le_left (by linarith)
  · exact le_max_of_le_right (by linarith)

/-- `cap − q`. -/
def capGap (cap : ℚ) (q : List ℚ) : List ℚ := addLq [cap] (negL q)

lemma evalL_capGap (cap : ℚ) (q : List ℚ) (s : ℝ) :
    evalL ((capGap cap q).map ((↑) : ℚ → ℝ)) s = cap - evalL (q.map ((↑) : ℚ → ℝ)) s := by
  simp only [capGap, evalL_addLq, evalL_negL, List.map_cons, List.map_nil, evalL]; ring

/-- `J ≤ cap` on the rectangle `[slo, shi] × [xlo, xhi]`. -/
def checkJ (p : MPoly) (kap cap slo shi xlo xhi : ℚ) : Bool :=
  decide (0 ≤ p.a6) && decide (0 ≤ xlo) && decide (slo < shi) &&
  posOn (capGap cap (p.pw kap xlo)) 6 slo shi && posOn (capGap cap (p.pw kap xhi)) 6 slo shi

lemma checkJ_sound (p : MPoly) (kap cap slo shi xlo xhi : ℚ)
    (h : checkJ p kap cap slo shi xlo xhi = true) (σ x : ℝ) (hσ0 : (slo : ℝ) ≤ σ)
    (hσ1 : σ ≤ shi) (hx1 : (xlo : ℝ) ≤ x) (hx2 : x ≤ xhi) : p.J kap σ x ≤ cap := by
  simp only [checkJ, Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨⟨⟨⟨h6, hx0⟩, hs⟩, hlo⟩, hhi⟩ := h
  have hend : ∀ x0 : ℚ, posOn (capGap cap (p.pw kap x0)) 6 slo shi = true →
      p.J kap σ x0 ≤ cap := by
    intro x0 hb
    have := posOn_sound _ 6 slo shi hs hb σ hσ0 hσ1
    rw [evalL_capGap, ← MPoly.J_eq_evalL] at this
    linarith
  exact (p.J_endpoint kap σ x xlo xhi h6 hx0 hx1 hx2).trans (max_le (hend xlo hlo) (hend xhi hhi))

end Grothe.Lower
