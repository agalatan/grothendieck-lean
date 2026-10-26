import Mathlib.Tactic

/-!
# Real symmetric 2×2 matrices and the Schur weight inequality

`Sym2R` is `[[a, b], [b, c]]`; `q S y = yᵀ S y`, `bil S x y = xᵀ S y`, `adj S = [[c, −b], [−b, a]]`
(so `S · adj S = det S · I`). For the Gaussian Schur bound (`data/upper-preprocess/inputs/
GAUSSIAN_SCHUR_TAIL_PROOF.md`) the weight `w(y) = exp(−yᵀTy/2)` works because, for `W = 2T + E` with
`T ≻ 0` and `E ⪰ 0`,

    yᵀ E y ≥ (Ey)ᵀ W⁻¹ (Ey)        (`weight_ineq`),

which follows, without square roots, from the identity (`δ = det W`, `u = E y`, `v = adj(W) u`)

    δ² yᵀEy − δ uᵀv = (δy − v)ᵀ E (δy − v) + 2 vᵀ T v.
-/

namespace Grothe.UpperChaos

/-- A real symmetric 2×2 matrix `[[a, b], [b, c]]`. -/
structure Sym2R where
  a : ℝ
  b : ℝ
  c : ℝ

namespace Sym2R

/-- `xᵀ S y`. -/
def bil (S : Sym2R) (x y : ℝ × ℝ) : ℝ := S.a * x.1 * y.1 + S.b * (x.1 * y.2 + x.2 * y.1) + S.c * x.2 * y.2

/-- `yᵀ S y`. -/
def q (S : Sym2R) (y : ℝ × ℝ) : ℝ := S.bil y y

def det (S : Sym2R) : ℝ := S.a * S.c - S.b ^ 2

/-- The adjugate `[[c, −b], [−b, a]]`. -/
def adj (S : Sym2R) : Sym2R := ⟨S.c, -S.b, S.a⟩

/-- `S y`. -/
def app (S : Sym2R) (y : ℝ × ℝ) : ℝ × ℝ := (S.a * y.1 + S.b * y.2, S.b * y.1 + S.c * y.2)

def add (S T : Sym2R) : Sym2R := ⟨S.a + T.a, S.b + T.b, S.c + T.c⟩

def smul (r : ℝ) (S : Sym2R) : Sym2R := ⟨r * S.a, r * S.b, r * S.c⟩

/-- Positive definite. -/
def PD (S : Sym2R) : Prop := 0 < S.a ∧ 0 < S.det

/-- Positive semidefinite (as a quadratic form). -/
def PSD (S : Sym2R) : Prop := ∀ y, 0 ≤ S.q y

lemma dot_app (S : Sym2R) (x y : ℝ × ℝ) : x.1 * (S.app y).1 + x.2 * (S.app y).2 = S.bil x y := by
  simp [app, bil]; ring

lemma q_nonneg_of_PD {S : Sym2R} (h : S.PD) (y : ℝ × ℝ) : 0 ≤ S.q y := by
  obtain ⟨ha, hd⟩ := h
  simp only [q, bil, det] at *
  have : S.a * (S.a * y.1 ^ 2 + 2 * S.b * y.1 * y.2 + S.c * y.2 ^ 2)
      = (S.a * y.1 + S.b * y.2) ^ 2 + (S.a * S.c - S.b ^ 2) * y.2 ^ 2 := by ring
  have h2 : 0 ≤ S.a * (S.a * y.1 ^ 2 + 2 * S.b * y.1 * y.2 + S.c * y.2 ^ 2) := by
    rw [this]; positivity
  have h3 : 0 ≤ S.a * y.1 ^ 2 + 2 * S.b * y.1 * y.2 + S.c * y.2 ^ 2 := by
    by_contra hneg; push Not at hneg; nlinarith
  linarith [h3]

lemma PSD_of_PD {S : Sym2R} (h : S.PD) : S.PSD := q_nonneg_of_PD h

lemma det_pos_of_PD {S : Sym2R} (h : S.PD) : 0 < S.det := h.2

/-- The exact identity behind the Schur weight (`δ = det W`, `u = E y`, `v = adj(W) u`). -/
lemma weight_identity (T E : Sym2R) (y : ℝ × ℝ) :
    let W := add (smul 2 T) E
    let δ := W.det
    let u := E.app y
    let v := W.adj.app u
    δ ^ 2 * E.q y - δ * (u.1 * v.1 + u.2 * v.2)
      = E.q (δ * y.1 - v.1, δ * y.2 - v.2) + 2 * T.q v := by
  simp only [add, smul, det, adj, app, q, bil]
  ring

/-- **The Schur weight inequality** `yᵀEy · det W ≥ (Ey)ᵀ adj(W) (Ey)`, i.e. `yᵀEy ≥ (Ey)ᵀ W⁻¹ (Ey)`, for
`W = 2T + E` with `T ⪰ 0`, `E ⪰ 0` and `det W > 0`. -/
theorem weight_ineq {T E : Sym2R} (hT : T.PSD) (hE : E.PSD) (hδ : 0 < (add (smul 2 T) E).det)
    (y : ℝ × ℝ) :
    let W := add (smul 2 T) E
    let u := E.app y
    let v := W.adj.app u
    u.1 * v.1 + u.2 * v.2 ≤ W.det * E.q y := by
  intro W u v
  have hid := weight_identity T E y
  have h1 := hE (W.det * y.1 - v.1, W.det * y.2 - v.2)
  have h2 := hT v
  have : 0 ≤ W.det ^ 2 * E.q y - W.det * (u.1 * v.1 + u.2 * v.2) := by
    simp only at hid; linarith
  have h3 : W.det * (u.1 * v.1 + u.2 * v.2) ≤ W.det * (W.det * E.q y) := by nlinarith
  exact le_of_mul_le_mul_left h3 hδ

end Sym2R

end Grothe.UpperChaos
