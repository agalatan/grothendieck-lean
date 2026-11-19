import Grothe.Lower.Basic
import Grothe.Lower.RowDataTypes
import Grothe.LowerAnalytic.Rows

/-!
# The envelope: scalar rows and their mixtures cap the hat value

Every row `r` of the certificate gives, in the shared reduction, the scalar inequality
`V ≤ t² − 2ℓt + C − ε‖Qh + (β/ε)v‖²` with `C = 2β²/ε + cap + capPad` (`RowOf r.env`, `rowOf_of_shared`). The mass row
`λ = 1/2` with the bound `S` gives `V ≤ (1 − λ)t² + λ + S − ε‖Qh‖²`, hence the scalar row `(λm, 0, λ + S + λm²)` for every
`m` (`rowOf_massTangent`, since `λ(t − m)² ≥ 0`). Two scalar rows mix with a weight `θ ∈ [0, 1]` (`RowHolds.mix`), and on a
cell `[lo, hi]` of `t` the mixture is at most `capVal`, the maximum there of a quadratic in `t`.

The envelope is a chain of cells covering `[0, 9/10]`, each naming two scalar rows and a weight; the mass row is taken at
the midpoint of the cell (`envRowAt`, `checkEnv`). `env_bound` turns its check into `V ≤ B`.
-/

namespace Grothe.Lower

open LowerAnalytic

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- A scalar row `(ℓ, β, C)`. -/
structure EnvRow where
  ell : ℚ
  beta : ℚ
  C : ℚ

/-- The scalar row of a certified row: `C = 2β²/ε + cap + capPad`. -/
def Row.env (r : Row) : EnvRow := ⟨r.ell, r.beta, 2 * r.beta ^ 2 / ε + r.cap + capPad⟩

/-- The tangent at `m` of the mass row `λ = 1/2` with the bound `S`: the scalar row `(λm, 0, λ + S + λm²)`. -/
def massTangent (S m : ℚ) : EnvRow := ⟨m / 2, 0, 1 / 2 + S + m ^ 2 / 2⟩

/-- The scalar rows of the envelope at the point `m`: `0` is the tangent of the mass row with the bound `S` at `m`,
`k + 1` the row `k`. -/
def envRowAt (rows : List Row) (S m : ℚ) : ℕ → Option EnvRow
  | 0 => some (massTangent S m)
  | k + 1 => rows[k]?.map Row.env

/-- The bound of the mixture `(1−θ)a + θb` of two scalar rows on `[tl, tu]`: the maximum there of `t² − 2ℓt + C` with
`ℓ = (1−θ)ℓₐ + θℓ_b`, `C = (1−θ)Cₐ + θC_b − (2/ε)θ(1−θ)(βₐ − β_b)²`. -/
def capVal (a b : EnvRow) (θ tl tu : ℚ) : ℚ :=
  quadMax ((1 - θ) * a.C + θ * b.C - 2 * (1 - θ) * θ * (a.beta - b.beta) ^ 2 / ε)
    (-2 * ((1 - θ) * a.ell + θ * b.ell)) 1 tl tu

/-- A cell of the envelope: the interval `[lo, hi]` of `t`, the scalar rows `i`, `j` and the weight `θ` of `j`. -/
structure EnvCell where
  lo : ℚ
  hi : ℚ
  i : ℕ
  j : ℕ
  θ : ℚ

/-- `lo,hi,i,j,θ`. -/
def parseEnvCell (s : String) : EnvCell :=
  match s.splitOn "," with
  | [lo, hi, i, j, θ] => ⟨parseQ lo, parseQ hi, i.toNat!, j.toNat!, parseQ θ⟩
  | _ => ⟨0, 0, 0, 0, 0⟩

/-- A cell is bounded by `B`: both scalar rows exist (at the midpoint of the cell), `0 ≤ θ ≤ 1`, and the mixture is at
most `B` on the cell. -/
def envCellOK (rows : List Row) (S B : ℚ) (c : EnvCell) : Bool :=
  match envRowAt rows S ((c.lo + c.hi) / 2) c.i, envRowAt rows S ((c.lo + c.hi) / 2) c.j with
  | some a, some b => decide (0 ≤ c.θ ∧ c.θ ≤ 1 ∧ capVal a b c.θ c.lo c.hi ≤ B)
  | _, _ => false

/-- **The check of the envelope**: its cells are consecutive from `0` to `9/10` and each is bounded by `B`. -/
def checkEnv (rows : List Row) (S B : ℚ) (cells : List String) : Bool :=
  let cs := cells.map parseEnvCell
  chainTo EnvCell.lo EnvCell.hi 0 (9 / 10) cs && allPar (envCellOK rows S B) cs

/-- The retained-square inequality of a scalar row at `ε`. -/
def RowOf (row : EnvRow) (V t : ℝ) (Qh v : E) : Prop :=
  RowHolds (ε : ℝ) row.ell row.beta row.C V t Qh v

/-- **The mass row as scalar rows**: `V ≤ (1 − λ)t² + λ + S − ε‖Qh‖²` with `λ = 1/2` gives the scalar row
`(λm, 0, λ + S + λm²)` for every `m`. -/
lemma rowOf_massTangent {S : ℚ} {V t : ℝ} {Qh : E}
    (h : V ≤ (1 - 1 / 2) * t ^ 2 + 1 / 2 + (S : ℝ) - (ε : ℝ) * ‖Qh‖ ^ 2) (m : ℚ) (v : E) :
    RowOf (massTangent S m) V t Qh v := by
  unfold RowOf RowHolds massTangent
  simp only [Rat.cast_zero, zero_div, zero_smul, add_zero, Rat.cast_add, Rat.cast_div, Rat.cast_pow,
    Rat.cast_one, Rat.cast_ofNat]
  nlinarith [sq_nonneg (t - m)]

/-- **Soundness of the envelope**: if every scalar row of the envelope holds (at every point `m`), the check bounds `V` by
`B` for every `t ∈ [0, 9/10]`. -/
theorem env_bound (rows : List Row) (S B : ℚ) (cells : List String) (h : checkEnv rows S B cells = true)
    {V t : ℝ} {Qh v : E} (hv : ‖v‖ ^ 2 = 2) (ht0 : 0 ≤ t) (ht1 : t ≤ 9 / 10)
    (hscal : ∀ k m a, envRowAt rows S m k = some a → RowOf a V t Qh v) : V ≤ B := by
  have hε : (0 : ℝ) < ε := by norm_num [ε]
  simp only [checkEnv, allPar_eq, Bool.and_eq_true, List.all_eq_true] at h
  obtain ⟨c, hc, hlo, hhi⟩ :=
    chainTo_sound EnvCell.lo EnvCell.hi _ 0 (9 / 10) h.1 t (by simpa using ht0) (by push_cast; linarith)
  have hok := h.2 c hc
  unfold envCellOK at hok
  cases ha : envRowAt rows S ((c.lo + c.hi) / 2) c.i with
  | none => simp [ha] at hok
  | some A =>
  cases hb : envRowAt rows S ((c.lo + c.hi) / 2) c.j with
  | none => simp [ha, hb] at hok
  | some C =>
  simp only [ha, hb, decide_eq_true_eq] at hok
  obtain ⟨hθ0, hθ1, hval⟩ := hok
  have h1 := (RowHolds.mix hε hv (hscal _ _ _ ha) (hscal _ _ _ hb) c.θ (by exact_mod_cast hθ0)
    (by exact_mod_cast hθ1)).le hε.le
  have hq := quadVal_le_quadMax
    ((1 - c.θ) * A.C + c.θ * C.C - 2 * (1 - c.θ) * c.θ * (A.beta - C.beta) ^ 2 / ε)
    (-2 * ((1 - c.θ) * A.ell + c.θ * C.ell)) 1 c.lo c.hi t hlo hhi
  have hB : ((capVal A C c.θ c.lo c.hi : ℚ) : ℝ) ≤ B := by exact_mod_cast hval
  unfold capVal at hB
  refine le_trans (le_trans (le_of_le_of_eq h1 ?_) hq) hB
  push_cast
  ring

end Grothe.Lower
