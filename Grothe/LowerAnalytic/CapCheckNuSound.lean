import Grothe.LowerAnalytic.CapCheckSound
import Grothe.LowerAnalytic.CapMajorant
import GrotheCapsKernel.CapCheckNu

/-!
# Soundness of the cell check with an identity tail

The cap checker for a witness with a tail (`GrotheCapsKernel/CapCheckNu.lean`) against the cell
majorant of the pair potential (`psiT_le_majPoly`, `CapMajorant.lean`).  For a cell `(i, j)` of a
grid `gd : GridDataNu` with the prices `d₂ = gd.d2 i j`, `d₃ = gd.d3 i j`, the correction coefficient
`g = gd.gg i j`, the ring bound `rl = gd.rl i` and the tail `ν = gd.nu`:

* `majCell_of_cellOKNu`: a passing cell check is the cell condition `MajCell d₂ d₃ ν rl g`;
* `mem_cellWt`: the seven weight intervals `cellWt gd w i j` of the checker enclose the exact
  weights `majWt d₂ d₃ ν g w` of the cell polynomial;
* `psiT_le_majPoly_of_cellOKNu`: hence, for `ν ≥ 0`, every `L` with `|L| ≤ rl` and every `p`,
  `Ψ_ν(L + p, L − p) ≤ majPoly (majWt d₂ d₃ ν g) L p`, the polynomial whose integral over the cell
  the checker encloses;
* `gridOKNu_mkGridNu`: every recipe grid passes the grid check (`cellOKNu_of_gNum`: price
  numerators `≥ nuNum ν` and the coefficient `gNum`, the exact floor of the cell inequality), so
  a certificate needs no run-time cell check.

The integer data of a cell live at the common scale `s = den(ν)·2⁵⁰` (`cellInts`); the lemmas
`*_scaled` are the corresponding identities of real numbers.
-/

open GrotheKernel Grothe.Upper

namespace Grothe.LowerAnalytic

/-! ### Enclosures of integer quotients -/

/-- `qI n d` encloses `n/d` for `d > 0`. -/
lemma mem_qI (n d : ℤ) (hd : 0 < d) : mem ((n : ℝ) / d) (qI n d) := by
  have hdR : (0 : ℝ) < d := by exact_mod_cast hd
  have h1 : (((n * D / d : ℤ) : ℝ)) * d ≤ (n : ℝ) * D := by
    exact_mod_cast Int.ediv_mul_le (n * D) hd.ne'
  have h2 : (((-(n * D) / d : ℤ) : ℝ)) * d ≤ -((n : ℝ) * D) := by
    exact_mod_cast Int.ediv_mul_le (-(n * D)) hd.ne'
  unfold mem qI
  constructor
  · rw [div_mul_eq_mul_div, le_div_iff₀ hdR]
    exact h1
  · rw [div_mul_eq_mul_div, div_le_iff₀ hdR]
    push_cast
    linarith

lemma iabs_cast (x : ℤ) : ((iabs x : ℤ) : ℝ) = |(x : ℝ)| := by
  unfold iabs
  split_ifs with h
  · have : (x : ℝ) < 0 := by exact_mod_cast h
    rw [abs_of_neg this]; push_cast; ring
  · have : (0 : ℝ) ≤ x := by exact_mod_cast not_lt.1 h
    rw [abs_of_nonneg this]

/-! ### The cell at the common scale: identities of real numbers -/

/-- The centre `c₀` at the common scale: `c₀ = (e₂ − e₃)σΔ/(e₂e₃)`. -/
lemma majC0_scaled {x2 x3 n S : ℝ} (hS : S ≠ 0) (h2 : x2 - n ≠ 0) (h3 : x3 - n ≠ 0) :
    majC0 (x2 / S) (x3 / S) (n / S)
      = (x2 - x3) * (x2 - n + (x3 - n)) * (x2 * x3 - n * n) / (S ^ 2 * ((x2 - n) * (x3 - n))) := by
  have e2 : x2 / S - n / S = (x2 - n) / S := by ring
  have e3 : x3 / S - n / S = (x3 - n) / S := by ring
  rw [majC0, e2, e3]
  field_simp
  ring

/-- The centre `c₁` at the common scale. -/
lemma majC1_scaled {x2 x3 n S : ℝ} (hS : S ≠ 0) (h2 : x2 - n ≠ 0) (h3 : x3 - n ≠ 0) :
    majC1 (x2 / S) (x3 / S) (n / S) = -(4 * n * (x2 - x3)) / ((x2 - n) * (x3 - n)) := by
  have e2 : x2 / S - n / S = (x2 - n) / S := by ring
  have e3 : x3 / S - n / S = (x3 - n) / S := by ring
  rw [majC1, e2, e3]
  field_simp

/-- The cell inequality cleared of denominators, at the common scale. -/
lemma cell_ineq_scaled {x2 x3 n S Rr A G : ℝ} (hS : 0 < S)
    (h : G * ((x2 * x3 - n * n) * ((x2 * x3 - n * n) * (((x2 - n + (x3 - n)) * (x2 - n + (x3 - n))
        + 2 * Rr * A) * ((x2 - n + (x3 - n)) * (x2 - n + (x3 - n)) + 2 * Rr * A))
        + 16 * (Rr * Rr) * ((x2 - n) * (x3 - n) * ((x2 - n) * (x3 - n)))))
      ≤ 8 * 2 ^ 100 * (x2 - n + (x3 - n)) * ((x2 - n) * (x3 - n) * ((x2 - n) * (x3 - n)))
        * (S * S * S)) :
    G / 2 ^ 100 * ((x2 / S * (x3 / S) - (n / S) ^ 2) * ((x2 / S * (x3 / S) - (n / S) ^ 2)
        * ((x2 / S + x3 / S - 2 * (n / S)) ^ 2 + 2 * (Rr / S) * (A / S)) ^ 2
        + 16 * (Rr / S) ^ 2 * ((x2 / S - n / S) * (x3 / S - n / S)) ^ 2))
      ≤ 8 * (x2 / S + x3 / S - 2 * (n / S)) * ((x2 / S - n / S) * (x3 / S - n / S)) ^ 2 := by
  have hS' := hS.ne'
  have key : 8 * (x2 / S + x3 / S - 2 * (n / S)) * ((x2 / S - n / S) * (x3 / S - n / S)) ^ 2
      - G / 2 ^ 100 * ((x2 / S * (x3 / S) - (n / S) ^ 2) * ((x2 / S * (x3 / S) - (n / S) ^ 2)
        * ((x2 / S + x3 / S - 2 * (n / S)) ^ 2 + 2 * (Rr / S) * (A / S)) ^ 2
        + 16 * (Rr / S) ^ 2 * ((x2 / S - n / S) * (x3 / S - n / S)) ^ 2))
      = (8 * 2 ^ 100 * (x2 - n + (x3 - n)) * ((x2 - n) * (x3 - n) * ((x2 - n) * (x3 - n)))
          * (S * S * S)
        - G * ((x2 * x3 - n * n) * ((x2 * x3 - n * n) * (((x2 - n + (x3 - n)) * (x2 - n + (x3 - n))
          + 2 * Rr * A) * ((x2 - n + (x3 - n)) * (x2 - n + (x3 - n)) + 2 * Rr * A))
          + 16 * (Rr * Rr) * ((x2 - n) * (x3 - n) * ((x2 - n) * (x3 - n))))))
        / (2 ^ 100 * S ^ 8) := by
    field_simp
    ring
  have := div_nonneg (sub_nonneg.2 h) (by positivity : (0 : ℝ) ≤ 2 ^ 100 * S ^ 8)
  linarith

/-- The weights `0`, `3` and the uncorrected parts of `1`, `2`, `4` at the common scale. -/
lemma majWt_scaled_zero {x2 x3 n S γ : ℝ} (hS : S ≠ 0) :
    majWt (x2 / S) (x3 / S) (n / S) γ 0 = S * (x2 + x3 - 2 * n) / (2 * (x2 * x3 - n * n)) ∧
    majWt (x2 / S) (x3 / S) (n / S) 0 1 = (x2 + x3) / (2 * S) ∧
    majWt (x2 / S) (x3 / S) (n / S) 0 2 = S * (x3 - x2) / (2 * (x2 * x3 - n * n)) ∧
    majWt (x2 / S) (x3 / S) (n / S) 0 4 = S * (x2 + x3 + 2 * n) / (2 * (x2 * x3 - n * n)) ∧
    majWt (x2 / S) (x3 / S) (n / S) 0 5 = 0 ∧ majWt (x2 / S) (x3 / S) (n / S) 0 6 = 0 := by
  have eD : x2 / S * (x3 / S) - (n / S) ^ 2 = (x2 * x3 - n * n) / S ^ 2 := by
    field_simp
  simp only [majWt, eD, zero_mul, zero_div, sub_zero, add_zero, neg_zero]
  refine ⟨?_, ?_, ?_, ?_, trivial, trivial⟩ <;> · field_simp

/-- The corrected weights at the common scale (cells with `e₂, e₃ ≠ 0`), `g = G/2¹⁰⁰`. -/
lemma majWt_scaled {x2 x3 n S G : ℝ} (hS : S ≠ 0) (h2 : x2 - n ≠ 0) (h3 : x3 - n ≠ 0) :
    majWt (x2 / S) (x3 / S) (n / S) (G / 2 ^ 100) 1
        = (x2 + x3) / (2 * S)
          - G * ((x2 - x3) * (x2 - x3)) * ((x2 - n + (x3 - n)) * (x2 - n + (x3 - n)))
            * ((x2 * x3 - n * n) * (x2 * x3 - n * n))
            / (16 * 2 ^ 100 * (S * S * S * S) * ((x2 - n) * (x3 - n) * ((x2 - n) * (x3 - n)))) ∧
    majWt (x2 / S) (x3 / S) (n / S) (G / 2 ^ 100) 2
        = S * (x3 - x2) / (2 * (x2 * x3 - n * n))
          + G * (x2 - x3) * (x2 - n + (x3 - n)) * (x2 * x3 - n * n)
            / (4 * 2 ^ 100 * (S * S) * ((x2 - n) * (x3 - n))) ∧
    majWt (x2 / S) (x3 / S) (n / S) (G / 2 ^ 100) 4
        = S * (x2 + x3 + 2 * n) / (2 * (x2 * x3 - n * n))
          - -(G * n * ((x2 - x3) * (x2 - x3)) * (x2 - n + (x3 - n)) * (x2 * x3 - n * n))
            / (2 * 2 ^ 100 * (S * S) * ((x2 - n) * (x3 - n) * ((x2 - n) * (x3 - n)))) ∧
    majWt (x2 / S) (x3 / S) (n / S) (G / 2 ^ 100) 5
        = -(G * n * (x2 - x3)) / (2 ^ 100 * ((x2 - n) * (x3 - n))) ∧
    majWt (x2 / S) (x3 / S) (n / S) (G / 2 ^ 100) 6
        = -(G * (n * n) * ((x2 - x3) * (x2 - x3))
            / (2 ^ 100 * ((x2 - n) * (x3 - n) * ((x2 - n) * (x3 - n))))) := by
  have eD : x2 / S * (x3 / S) - (n / S) ^ 2 = (x2 * x3 - n * n) / S ^ 2 := by
    field_simp
  simp only [majWt, majC0_scaled hS h2 h3, majC1_scaled hS h2 h3, eD]
  refine ⟨?_, ?_, ?_, ?_, ?_⟩ <;> first | (field_simp; ring) | field_simp

/-! ### The integer data of a cell as real numbers -/

/-- The real numbers of a cell at the common scale `s = den(ν)·2⁵⁰`. -/
lemma cellInts_cast (nu : ℚ) (D2 D3 : ℕ) :
    (0 : ℝ) < ((cellInts nu D2 D3).s : ℝ) ∧
      (D2 : ℝ) / 2 ^ 50 = ((cellInts nu D2 D3).Dd2 : ℝ) / (cellInts nu D2 D3).s ∧
      (D3 : ℝ) / 2 ^ 50 = ((cellInts nu D2 D3).Dd3 : ℝ) / (cellInts nu D2 D3).s ∧
      (nu : ℝ) = ((cellInts nu D2 D3).Nu : ℝ) / (cellInts nu D2 D3).s := by
  have es : ((cellInts nu D2 D3).s : ℝ) = (nu.den : ℝ) * 2 ^ 50 := by
    show (((nu.den : ℤ) * (two50 : ℤ) : ℤ) : ℝ) = _
    push_cast; rw [two50_eq]
  have e2 : ((cellInts nu D2 D3).Dd2 : ℝ) = (nu.den : ℝ) * D2 := by
    show (((nu.den : ℤ) * (D2 : ℤ) : ℤ) : ℝ) = _
    push_cast; rfl
  have e3 : ((cellInts nu D2 D3).Dd3 : ℝ) = (nu.den : ℝ) * D3 := by
    show (((nu.den : ℤ) * (D3 : ℤ) : ℤ) : ℝ) = _
    push_cast; rfl
  have en : ((cellInts nu D2 D3).Nu : ℝ) = (nu.num : ℝ) * 2 ^ 50 := by
    show ((nu.num * (two50 : ℤ) : ℤ) : ℝ) = _
    push_cast; rw [two50_eq]
  refine ⟨by rw [es]; positivity, ?_, ?_, ?_⟩
  · rw [es, e2]; field_simp
  · rw [es, e3]; field_simp
  · rw [es, en, Rat.cast_def]; field_simp

/-- The ring bound at the common scale: `rl = Rr/s`, `Rr = den(ν)·RL`. -/
lemma rl_cast (nu : ℚ) (D2 D3 RL : ℕ) :
    (RL : ℝ) / 2 ^ 50 = (((nu.den : ℤ) * (RL : ℤ) : ℤ) : ℝ) / (cellInts nu D2 D3).s := by
  have es : ((cellInts nu D2 D3).s : ℝ) = (nu.den : ℝ) * 2 ^ 50 := by
    show (((nu.den : ℤ) * (two50 : ℤ) : ℤ) : ℝ) = _
    push_cast; rw [two50_eq]
  rw [es]; push_cast; field_simp

/-! ### The cell check is the cell condition -/

lemma cellInts_E2 (nu : ℚ) (D2 D3 : ℕ) :
    (cellInts nu D2 D3).E2 = (cellInts nu D2 D3).Dd2 - (cellInts nu D2 D3).Nu := rfl
lemma cellInts_E3 (nu : ℚ) (D2 D3 : ℕ) :
    (cellInts nu D2 D3).E3 = (cellInts nu D2 D3).Dd3 - (cellInts nu D2 D3).Nu := rfl
lemma cellInts_Dl (nu : ℚ) (D2 D3 : ℕ) :
    (cellInts nu D2 D3).Dl = (cellInts nu D2 D3).Dd2 * (cellInts nu D2 D3).Dd3
      - (cellInts nu D2 D3).Nu * (cellInts nu D2 D3).Nu := rfl
lemma cellInts_Sg (nu : ℚ) (D2 D3 : ℕ) :
    (cellInts nu D2 D3).Sg = (cellInts nu D2 D3).Dd2 - (cellInts nu D2 D3).Nu
      + ((cellInts nu D2 D3).Dd3 - (cellInts nu D2 D3).Nu) := rfl

/-- The real cell data of a grid. -/
lemma gridDataNu_cast (gd : GridDataNu) (i j : ℕ) :
    ((gd.d2 i j : ℚ) : ℝ) = (gd.D2 i j : ℝ) / 2 ^ 50 ∧ ((gd.d3 i j : ℚ) : ℝ) = (gd.D3 i j : ℝ) / 2 ^ 50 ∧
      ((gd.gg i j : ℚ) : ℝ) = (gd.G i j : ℝ) / 2 ^ 100 ∧ ((gd.rl i : ℚ) : ℝ) = (gd.RL i : ℝ) / 2 ^ 50 := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · simp only [GridDataNu.d2]; push_cast; rw [two50_eq]
  · simp only [GridDataNu.d3]; push_cast; rw [two50_eq]
  · simp only [GridDataNu.gg]; push_cast; rw [two100_eq]
  · simp only [GridDataNu.rl]; push_cast; rw [two50_eq]

/-- **A passing cell check is the cell condition** of the majorant: `MajCell d₂ d₃ ν rl g` for the
prices, the ring bound and the correction coefficient of the cell. -/
theorem majCell_of_cellOKNu (gd : GridDataNu) (ell beta : ℚ) (i j : ℕ)
    (h : cellOKNu gd ell beta i j = true) :
    MajCell (gd.d2 i j : ℝ) (gd.d3 i j : ℝ) (gd.nu : ℝ) (gd.rl i : ℝ) (gd.gg i j : ℝ) := by
  obtain ⟨hS, hd2, hd3, hν⟩ := cellInts_cast gd.nu (gd.D2 i j) (gd.D3 i j)
  have hR := rl_cast gd.nu (gd.D2 i j) (gd.D3 i j) (gd.RL i)
  obtain ⟨ed2, ed3, eg, erl⟩ := gridDataNu_cast gd i j
  simp only [cellOKNu, Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨⟨⟨h1, h2⟩, -⟩, h4⟩ := h
  rw [ed2, ed3, eg, erl, hd2, hd3, hR, hν]
  -- the integer facts as real numbers
  have h1R : (0 : ℝ) < ((cellInts gd.nu (gd.D2 i j) (gd.D3 i j)).Dd2 : ℝ) := by exact_mod_cast h1
  have h2R : ((cellInts gd.nu (gd.D2 i j) (gd.D3 i j)).Nu : ℝ)
        * ((cellInts gd.nu (gd.D2 i j) (gd.D3 i j)).Nu : ℝ)
      < ((cellInts gd.nu (gd.D2 i j) (gd.D3 i j)).Dd2 : ℝ)
        * ((cellInts gd.nu (gd.D2 i j) (gd.D3 i j)).Dd3 : ℝ) := by
    rw [cellInts_Dl] at h2
    have : (0 : ℝ) < ((cellInts gd.nu (gd.D2 i j) (gd.D3 i j)).Dd2 : ℝ)
        * ((cellInts gd.nu (gd.D2 i j) (gd.D3 i j)).Dd3 : ℝ)
        - ((cellInts gd.nu (gd.D2 i j) (gd.D3 i j)).Nu : ℝ)
          * ((cellInts gd.nu (gd.D2 i j) (gd.D3 i j)).Nu : ℝ) := by exact_mod_cast h2
    linarith
  refine ⟨div_pos h1R hS, ?_, ?_⟩
  · rw [div_pow, div_mul_div_comm, sq, sq]
    exact div_lt_div_of_pos_right h2R (mul_pos hS hS)
  split_ifs at h4 with hE
  · rw [decide_eq_true_eq] at h4
    left
    rw [h4]; simp
  · rw [decide_eq_true_eq] at h4
    obtain ⟨hE2, hE3⟩ := not_or.1 hE
    rw [not_le] at hE2 hE3
    rw [cellInts_E2] at hE2
    rw [cellInts_E3] at hE3
    have hE2R : ((cellInts gd.nu (gd.D2 i j) (gd.D3 i j)).Nu : ℝ)
        < ((cellInts gd.nu (gd.D2 i j) (gd.D3 i j)).Dd2 : ℝ) := by
      have : (0 : ℝ) < ((cellInts gd.nu (gd.D2 i j) (gd.D3 i j)).Dd2 : ℝ)
          - ((cellInts gd.nu (gd.D2 i j) (gd.D3 i j)).Nu : ℝ) := by exact_mod_cast hE2
      linarith
    have hE3R : ((cellInts gd.nu (gd.D2 i j) (gd.D3 i j)).Nu : ℝ)
        < ((cellInts gd.nu (gd.D2 i j) (gd.D3 i j)).Dd3 : ℝ) := by
      have : (0 : ℝ) < ((cellInts gd.nu (gd.D2 i j) (gd.D3 i j)).Dd3 : ℝ)
          - ((cellInts gd.nu (gd.D2 i j) (gd.D3 i j)).Nu : ℝ) := by exact_mod_cast hE3
      linarith
    right
    refine ⟨div_lt_div_of_pos_right hE2R hS, div_lt_div_of_pos_right hE3R hS, by positivity, ?_⟩
    -- the cell inequality
    have habs : |((cellInts gd.nu (gd.D2 i j) (gd.D3 i j)).Dd3 : ℝ)
          / (cellInts gd.nu (gd.D2 i j) (gd.D3 i j)).s
        - ((cellInts gd.nu (gd.D2 i j) (gd.D3 i j)).Dd2 : ℝ)
          / (cellInts gd.nu (gd.D2 i j) (gd.D3 i j)).s|
        = ((iabs ((cellInts gd.nu (gd.D2 i j) (gd.D3 i j)).E3
            - (cellInts gd.nu (gd.D2 i j) (gd.D3 i j)).E2) : ℤ) : ℝ)
          / (cellInts gd.nu (gd.D2 i j) (gd.D3 i j)).s := by
      rw [iabs_cast, ← sub_div, abs_div, abs_of_pos hS, cellInts_E2, cellInts_E3]
      congr 2
      push_cast; ring
    unfold majGammaDen
    rw [habs]
    refine cell_ineq_scaled hS ?_
    have h4R : ((gd.G i j : ℤ) : ℝ) * ((cellDen (cellInts gd.nu (gd.D2 i j) (gd.D3 i j))
          ((gd.nu.den : ℤ) * (gd.RL i : ℤ)) : ℤ) : ℝ)
        ≤ ((cellNum (cellInts gd.nu (gd.D2 i j) (gd.D3 i j)) : ℤ) : ℝ) := by
      exact_mod_cast h4
    simp only [cellDen, cellNum, cellInts_Sg, cellInts_Dl] at h4R
    rw [cellInts_E2, cellInts_E3] at h4R ⊢
    push_cast [two100_eq] at h4R ⊢
    exact h4R

/-! ### The weight intervals enclose the exact weights -/

/-- The weight intervals of the integer cell data `(s, x₂, x₃, n)` (`dᵢ = xᵢ/s`, `ν = n/s`) and `G`
enclose the exact weights of the cell polynomial, when `Δ > 0` and `e₂, e₃ > 0` unless `G = 0`. -/
lemma mem_cellWtOf {s x2 x3 n : ℤ} {G : ℕ} (hs : 0 < s) (hDl : 0 < x2 * x3 - n * n)
    (hG : G ≠ 0 → 0 < x2 - n ∧ 0 < x3 - n) (w : ℕ) :
    mem (majWt ((x2 : ℝ) / s) ((x3 : ℝ) / s) ((n : ℝ) / s) ((G : ℝ) / 2 ^ 100) w)
      (cellWtOf ⟨s, x2, x3, n, x2 - n, x3 - n, x2 * x3 - n * n, x2 - n + (x3 - n)⟩ G w) := by
  have hsR : (0 : ℝ) < s := by exact_mod_cast hs
  have ht : (0 : ℤ) < ((two100 : ℕ) : ℤ) := by norm_num [two100, two50]
  have h2D : (0 : ℤ) < 2 * (x2 * x3 - n * n) := by linarith
  have h2s : (0 : ℤ) < 2 * s := by linarith
  obtain ⟨e0, e1, e2, e4, e5, e6⟩ := majWt_scaled_zero (x2 := (x2 : ℝ)) (x3 := (x3 : ℝ))
    (n := (n : ℝ)) (γ := (G : ℝ) / 2 ^ 100) hsR.ne'
  -- every index `≥ 6` is the index `6`
  have h6 : ∀ w, mem (majWt ((x2 : ℝ) / s) ((x3 : ℝ) / s) ((n : ℝ) / s) ((G : ℝ) / 2 ^ 100) 6)
        (cellWtOf ⟨s, x2, x3, n, x2 - n, x3 - n, x2 * x3 - n * n, x2 - n + (x3 - n)⟩ G 6)
      → mem (majWt ((x2 : ℝ) / s) ((x3 : ℝ) / s) ((n : ℝ) / s) ((G : ℝ) / 2 ^ 100) (w + 6))
        (cellWtOf ⟨s, x2, x3, n, x2 - n, x3 - n, x2 * x3 - n * n, x2 - n + (x3 - n)⟩ G (w + 6)) :=
    fun _ h => h
  by_cases hG0 : G = 0
  · subst hG0
    simp only [Nat.cast_zero, zero_div] at e0 h6 ⊢
    rcases w with _ | _ | _ | _ | _ | _ | w
    · rw [e0]
      simp only [cellWtOf]
      convert mem_qI (s * (x2 + x3 - 2 * n)) (2 * (x2 * x3 - n * n)) h2D using 1
      push_cast; ring
    · rw [e1]
      simp only [cellWtOf, ↓reduceIte]
      convert mem_qI (x2 + x3) (2 * s) h2s using 1
      push_cast; ring
    · rw [e2]
      simp only [cellWtOf, ↓reduceIte]
      convert mem_qI (s * (x3 - x2)) (2 * (x2 * x3 - n * n)) h2D using 1
      push_cast; ring
    · simp only [cellWtOf]
      convert mem_qI 0 ((two100 : ℕ) : ℤ) ht using 1
      simp [majWt]
    · rw [e4]
      simp only [cellWtOf, ↓reduceIte]
      convert mem_qI (s * (x2 + x3 + 2 * n)) (2 * (x2 * x3 - n * n)) h2D using 1
      push_cast; ring
    · rw [e5]
      simp only [cellWtOf, ↓reduceIte]
      exact mem_zero
    · refine h6 w ?_
      rw [e6]
      simp only [cellWtOf, ↓reduceIte]
      exact mem_zero
  · obtain ⟨h2, h3⟩ := hG hG0
    have hGz : ((G : ℕ) : ℤ) ≠ 0 := by exact_mod_cast hG0
    have h2R : ((x2 : ℝ) - n) ≠ 0 := by
      have : (0 : ℝ) < (x2 : ℝ) - n := by exact_mod_cast h2
      exact this.ne'
    have h3R : ((x3 : ℝ) - n) ≠ 0 := by
      have : (0 : ℝ) < (x3 : ℝ) - n := by exact_mod_cast h3
      exact this.ne'
    have hP : (0 : ℤ) < (x2 - n) * (x3 - n) := mul_pos h2 h3
    obtain ⟨f1, f2, f4, f5, f6⟩ := majWt_scaled (x2 := (x2 : ℝ)) (x3 := (x3 : ℝ)) (n := (n : ℝ))
      (G := (G : ℝ)) hsR.ne' h2R h3R
    have hs2 : (0 : ℤ) < s * s := mul_pos hs hs
    have d1 : (0 : ℤ) < 16 * ((two100 : ℕ) : ℤ) * (s * s * s * s)
        * ((x2 - n) * (x3 - n) * ((x2 - n) * (x3 - n))) :=
      mul_pos (mul_pos (mul_pos (by norm_num) ht) (mul_pos (mul_pos hs2 hs) hs)) (mul_pos hP hP)
    have d2 : (0 : ℤ) < 4 * ((two100 : ℕ) : ℤ) * (s * s) * ((x2 - n) * (x3 - n)) :=
      mul_pos (mul_pos (mul_pos (by norm_num) ht) hs2) hP
    have d4 : (0 : ℤ) < 2 * ((two100 : ℕ) : ℤ) * (s * s)
        * ((x2 - n) * (x3 - n) * ((x2 - n) * (x3 - n))) :=
      mul_pos (mul_pos (mul_pos (by norm_num) ht) hs2) (mul_pos hP hP)
    have d5 : (0 : ℤ) < ((two100 : ℕ) : ℤ) * ((x2 - n) * (x3 - n)) := mul_pos ht hP
    have d6 : (0 : ℤ) < ((two100 : ℕ) : ℤ) * ((x2 - n) * (x3 - n) * ((x2 - n) * (x3 - n))) :=
      mul_pos ht (mul_pos hP hP)
    rcases w with _ | _ | _ | _ | _ | _ | w
    · rw [e0]
      simp only [cellWtOf]
      convert mem_qI (s * (x2 + x3 - 2 * n)) (2 * (x2 * x3 - n * n)) h2D using 1
      push_cast; ring
    · rw [f1]
      simp only [cellWtOf, hGz, ↓reduceIte]
      convert mem_add (mem_qI (x2 + x3) (2 * s) h2s) (mem_neg (mem_qI _ _ d1)) using 1
      push_cast [two100_eq]; ring
    · rw [f2]
      simp only [cellWtOf, hGz, ↓reduceIte]
      convert mem_add (mem_qI (s * (x3 - x2)) (2 * (x2 * x3 - n * n)) h2D) (mem_qI _ _ d2) using 1
      push_cast [two100_eq]; ring
    · simp only [cellWtOf]
      convert mem_qI (G : ℤ) ((two100 : ℕ) : ℤ) ht using 1
      simp [majWt, two100_eq]
    · rw [f4]
      simp only [cellWtOf, hGz, ↓reduceIte]
      convert mem_add (mem_qI (s * (x2 + x3 + 2 * n)) (2 * (x2 * x3 - n * n)) h2D)
        (mem_neg (mem_qI _ _ d4)) using 1
      push_cast [two100_eq]; ring
    · rw [f5]
      simp only [cellWtOf, hGz, ↓reduceIte]
      convert mem_qI _ _ d5 using 1
      push_cast [two100_eq]; ring
    · refine h6 w ?_
      rw [f6]
      simp only [cellWtOf, hGz, ↓reduceIte]
      convert mem_neg (mem_qI _ _ d6) using 1
      push_cast [two100_eq]; ring

/-- **The weight intervals of the checker enclose the exact weights** of the cell polynomial, for a
cell that passes the cell check. -/
theorem mem_cellWt (gd : GridDataNu) (ell beta : ℚ) (i j : ℕ)
    (h : cellOKNu gd ell beta i j = true) (w : ℕ) :
    mem (majWt (gd.d2 i j : ℝ) (gd.d3 i j : ℝ) (gd.nu : ℝ) (gd.gg i j : ℝ) w)
      (cellWt gd w i j) := by
  obtain ⟨hS, hd2, hd3, hν⟩ := cellInts_cast gd.nu (gd.D2 i j) (gd.D3 i j)
  obtain ⟨ed2, ed3, eg, -⟩ := gridDataNu_cast gd i j
  simp only [cellOKNu, Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨⟨⟨-, h2⟩, -⟩, h4⟩ := h
  rw [ed2, ed3, eg, hd2, hd3, hν]
  refine mem_cellWtOf (by exact_mod_cast hS) h2 (fun hG => ?_) w
  split_ifs at h4 with hE
  · exact absurd (of_decide_eq_true h4) hG
  · obtain ⟨hE2, hE3⟩ := not_or.1 hE
    exact ⟨not_le.1 hE2, not_le.1 hE3⟩

/-- **The cell majorant from the cell check**: for a tail `ν ≥ 0` and a cell that passes the cell
check, every `L` with `|L| ≤ rl` and every `p` satisfy
`Ψ_ν(L + p, L − p) ≤ majPoly (majWt d₂ d₃ ν g) L p`, the polynomial whose weights the checker
encloses (`mem_cellWt`). -/
theorem psiT_le_majPoly_of_cellOKNu (gd : GridDataNu) (ell beta : ℚ) (i j : ℕ)
    (hν : 0 ≤ gd.nu) (h : cellOKNu gd ell beta i j = true) {L : ℂ} (hL : ‖L‖ ≤ (gd.rl i : ℝ))
    (p : ℂ) :
    psiT (gd.nu : ℝ) (L + p) (L - p)
      ≤ majPoly (majWt (gd.d2 i j : ℝ) (gd.d3 i j : ℝ) (gd.nu : ℝ) (gd.gg i j : ℝ)) L p :=
  psiT_le_majPoly (by exact_mod_cast hν) (majCell_of_cellOKNu gd ell beta i j h) hL p

/-! ### Every recipe grid passes the grid check -/

lemma iabs_nonneg (x : ℤ) : 0 ≤ iabs x := by
  unfold iabs; split_ifs <;> omega

/-- The denominator of the cell inequality is positive for `Δ > 0`, `σ > 0`. -/
lemma cellDen_pos (c : CellInts) {Rr : ℤ} (hD : 0 < c.Dl) (hS : 0 < c.Sg) (hR : 0 ≤ Rr) :
    0 < cellDen c Rr := by
  have hQ : 0 < c.Sg * c.Sg + 2 * Rr * iabs (c.E3 - c.E2) :=
    add_pos_of_pos_of_nonneg (mul_pos hS hS)
      (mul_nonneg (mul_nonneg (by norm_num) hR) (iabs_nonneg _))
  exact mul_pos hD (add_pos_of_pos_of_nonneg (mul_pos hD (mul_pos hQ hQ))
    (mul_nonneg (mul_nonneg (by norm_num) (mul_self_nonneg _)) (mul_self_nonneg _)))

/-- **The coefficient `gNum` satisfies the cell inequality**: it is its exact floor. -/
lemma gNum_mul_cellDen_le (c : CellInts) {Rr : ℤ} (h2 : 0 < c.E2) (h3 : 0 < c.E3) (hD : 0 < c.Dl)
    (hSg : c.Sg = c.E2 + c.E3) (hs : 0 < c.s) (hR : 0 ≤ Rr) :
    (gNum c Rr : ℤ) * cellDen c Rr ≤ cellNum c := by
  have hS : 0 < c.Sg := by omega
  have hden := cellDen_pos c hD hS hR
  have ht : (0 : ℤ) < ((two100 : ℕ) : ℤ) := by norm_num [two100, two50]
  have hnum : 0 ≤ cellNum c :=
    mul_nonneg (mul_nonneg (mul_nonneg (mul_nonneg (by norm_num) ht.le) hS.le) (mul_self_nonneg _))
      (mul_nonneg (mul_nonneg hs.le hs.le) hs.le)
  unfold gNum
  split_ifs with hc
  · omega
  · rw [Int.toNat_of_nonneg (Int.ediv_nonneg hnum hden.le)]
    exact Int.ediv_mul_le _ hden.ne'

/-- A price numerator `D ≥ nuNum ν` gives `d > ν`: `den(ν)·D − num(ν)·2⁵⁰ > 0`. -/
lemma nuNum_le {nu : ℚ} {D : ℕ} (h : nuNum nu ≤ D) :
    0 < (nu.den : ℤ) * (D : ℤ) - nu.num * ((two50 : ℕ) : ℤ) := by
  have hb : (0 : ℚ) < (nu.den : ℚ) := by exact_mod_cast nu.den_pos
  have e : nuNum nu = (⌈nu * (two50 : ℚ)⌉).toNat + 1 := rfl
  have h1 : nu * (two50 : ℚ) ≤ (⌈nu * (two50 : ℚ)⌉ : ℤ) := Int.le_ceil _
  have h2 : (⌈nu * (two50 : ℚ)⌉ : ℤ) ≤ ((⌈nu * (two50 : ℚ)⌉).toNat : ℤ) := Int.self_le_toNat _
  have h3 : (((⌈nu * (two50 : ℚ)⌉).toNat : ℤ) : ℚ) + 1 ≤ (D : ℚ) := by
    rw [e] at h; exact_mod_cast h
  have h2' : ((⌈nu * (two50 : ℚ)⌉ : ℤ) : ℚ) ≤ (((⌈nu * (two50 : ℚ)⌉).toNat : ℤ) : ℚ) := by
    exact_mod_cast h2
  have h4 : nu * (two50 : ℚ) < (D : ℚ) := by linarith
  have h5 : (nu.num : ℚ) * (two50 : ℚ) < (nu.den : ℚ) * (D : ℚ) := by
    have hn : nu = (nu.num : ℚ) / (nu.den : ℚ) := (Rat.num_div_den nu).symm
    rw [hn, div_mul_eq_mul_div, div_lt_iff₀ hb] at h4
    linarith
  have h6 : nu.num * ((two50 : ℕ) : ℤ) < (nu.den : ℤ) * (D : ℤ) := by exact_mod_cast h5
  omega

/-- **A cell with price numerators `≥ nuNum ν`, `ν ≥ 0` and the coefficient `gNum` passes the cell
check**, given its ring bound. -/
theorem cellOKNu_of_gNum (gd : GridDataNu) (ell beta : ℚ) (i j : ℕ) (hν : 0 ≤ gd.nu)
    (h2 : nuNum gd.nu ≤ gd.D2 i j) (h3 : nuNum gd.nu ≤ gd.D3 i j)
    (hG : gd.G i j = gNum (cellInts gd.nu (gd.D2 i j) (gd.D3 i j)) ((gd.nu.den : ℤ) * gd.RL i))
    (hrl : rlb ell beta ((i + 1) * gd.h) ≤ gd.rl i) :
    cellOKNu gd ell beta i j = true := by
  have hE2 := nuNum_le h2
  have hE3 := nuNum_le h3
  have hb : (0 : ℤ) < (gd.nu.den : ℤ) := by exact_mod_cast gd.nu.den_pos
  have hnum : (0 : ℤ) ≤ gd.nu.num := Rat.num_nonneg.2 hν
  have ht : (0 : ℤ) < ((two50 : ℕ) : ℤ) := by norm_num [two50]
  have hNu : (0 : ℤ) ≤ gd.nu.num * ((two50 : ℕ) : ℤ) := mul_nonneg hnum ht.le
  -- the integer cell data
  obtain ⟨c, hc⟩ : ∃ c, c = cellInts gd.nu (gd.D2 i j) (gd.D3 i j) := ⟨_, rfl⟩
  have cE2 : c.E2 = (gd.nu.den : ℤ) * (gd.D2 i j : ℤ) - gd.nu.num * ((two50 : ℕ) : ℤ) := by
    rw [hc]; rfl
  have cE3 : c.E3 = (gd.nu.den : ℤ) * (gd.D3 i j : ℤ) - gd.nu.num * ((two50 : ℕ) : ℤ) := by
    rw [hc]; rfl
  have cDd2 : c.Dd2 = (gd.nu.den : ℤ) * (gd.D2 i j : ℤ) := by rw [hc]; rfl
  have cDd3 : c.Dd3 = (gd.nu.den : ℤ) * (gd.D3 i j : ℤ) := by rw [hc]; rfl
  have cNu : c.Nu = gd.nu.num * ((two50 : ℕ) : ℤ) := by rw [hc]; rfl
  have cDl : c.Dl = c.Dd2 * c.Dd3 - c.Nu * c.Nu := by rw [hc]; rfl
  have cSg : c.Sg = c.E2 + c.E3 := by rw [hc]; rfl
  have cs : c.s = (gd.nu.den : ℤ) * ((two50 : ℕ) : ℤ) := by rw [hc]; rfl
  have p2 : 0 < c.E2 := by rw [cE2]; exact hE2
  have p3 : 0 < c.E3 := by rw [cE3]; exact hE3
  have hD2 : c.Dd2 = c.E2 + c.Nu := by rw [cDd2, cE2, cNu]; ring
  have hD3 : c.Dd3 = c.E3 + c.Nu := by rw [cDd3, cE3, cNu]; ring
  have hNu' : 0 ≤ c.Nu := by rw [cNu]; exact hNu
  have pD : 0 < c.Dl := by
    rw [cDl, hD2, hD3]
    nlinarith [mul_pos p2 p3, mul_nonneg hNu' p2.le, mul_nonneg hNu' p3.le]
  have hRr : (0 : ℤ) ≤ (gd.nu.den : ℤ) * (gd.RL i : ℤ) := mul_nonneg hb.le (Int.natCast_nonneg _)
  have hcell := gNum_mul_cellDen_le c p2 p3 pD cSg (by rw [cs]; exact mul_pos hb ht) hRr
  simp only [cellOKNu, Bool.and_eq_true, decide_eq_true_eq, ← hc]
  refine ⟨⟨⟨by rw [hD2]; omega, pD⟩, hrl⟩, ?_⟩
  split_ifs with hE
  · omega
  · rw [decide_eq_true_eq, hG, ← hc]
    exact hcell

/-- The ring bound of a recipe grid: `rlb((i+1)h) ≤ rlNum/2⁵⁰`. -/
lemma rlb_le_rlNum (ell beta h : ℚ) (i : ℕ) :
    rlb ell beta ((i + 1) * h) ≤ (rlNum ell beta h i : ℚ) / two50 := by
  have h50 : (0 : ℚ) < two50 := by norm_num [two50]
  rw [le_div_iff₀ h50]
  have h1 := Int.le_ceil (rlb ell beta ((i + 1) * h) * two50)
  have h2 : ((⌈rlb ell beta ((i + 1) * h) * two50⌉ : ℤ) : ℚ) ≤ (rlNum ell beta h i : ℚ) := by
    have : ⌈rlb ell beta ((i + 1) * h) * two50⌉
        ≤ ((⌈rlb ell beta ((i + 1) * h) * two50⌉).toNat : ℤ) := Int.self_le_toNat _
    have e : rlNum ell beta h i = (⌈rlb ell beta ((i + 1) * h) * two50⌉).toNat := rfl
    rw [e]; exact_mod_cast this
  exact h1.trans h2

/-- The shape of a cell of a recipe grid with a tail. -/
lemma mkGridNu_cell (ell beta nu : ℚ) (r : Recipe) {Nr N : ℕ} (h : ℚ) (T : Tables) {i j : ℕ}
    (hi : i < Nr) (hj : j < N) :
    ∃ d2 d3 : ℕ, nuNum nu ≤ d2 ∧ nuNum nu ≤ d3 ∧
      (mkGridNu ell beta nu r Nr N h T).D2 i j = d2 ∧ (mkGridNu ell beta nu r Nr N h T).D3 i j = d3 ∧
      (mkGridNu ell beta nu r Nr N h T).G i j
        = gNum (cellInts nu d2 d3) ((nu.den : ℤ) * rlNum ell beta h i) ∧
      (mkGridNu ell beta nu r Nr N h T).RL i = rlNum ell beta h i := by
  unfold mkGridNu
  dsimp only
  rw [toArray_map_range_getD _ _ _ hi]
  unfold ringCellsNu
  dsimp only
  rw [toArray_map_range_getD _ _ _ hj]
  exact ⟨_, _, le_max_right _ _, le_max_right _ _, rfl, rfl, rfl, rfl⟩

/-- **Every recipe grid with a tail `0 ≤ ν < 1` passes the grid check**: the price numerators are
at least `nuNum ν` and the correction coefficients are the exact floors `gNum`, so the checker never
has to run `gridOKNu` (the `Float` steps only choose the numerators). -/
theorem gridOKNu_mkGridNu (ell beta nu : ℚ) (r : Recipe) {Nr N : ℕ} {h : ℚ} (T : Tables)
    (hh : 0 < h) (hN : 0 < N) (hNr : 0 < Nr) (hν0 : 0 ≤ nu) (hν1 : nu < 1) :
    gridOKNu (mkGridNu ell beta nu r Nr N h T) ell beta = true := by
  simp only [gridOKNu, Bool.and_eq_true, decide_eq_true_eq, List.all_eq_true, List.mem_range]
  refine ⟨⟨⟨⟨⟨hh, hN⟩, hNr⟩, hν0⟩, hν1⟩, fun i hi j hj => ?_⟩
  have hi' : i < Nr := hi
  have hj' : j < N := hj
  obtain ⟨d2, d3, h2, h3, e2, e3, eG, eRL⟩ := mkGridNu_cell ell beta nu r h T hi' hj'
  refine cellOKNu_of_gNum _ ell beta i j hν0 (by rw [e2]; exact h2) (by rw [e3]; exact h3) ?_ ?_
  · rw [eG, e2, e3, eRL]; rfl
  · have hgh : (mkGridNu ell beta nu r Nr N h T).h = h := rfl
    have := rlb_le_rlNum ell beta h i
    simpa only [GridDataNu.rl, eRL, hgh] using this

end Grothe.LowerAnalytic
