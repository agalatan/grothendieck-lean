import Grothe.Lower.Cover

/-!
# Moment rectangles

The constants of the lower-bound certificate and the normalized-moment bound of a physical
polynomial.  A *physical polynomial* `p(s) = p₀ + p₁s + p₂s² + p₄s⁴ + p₆s⁶` (`p₁, p₆ ≥ 0`)
majorizes the potential of a profile; with `σ = ‖q‖₂`, `x² = E|ξ|⁴ − 2` for the normalized
residual `ξ = q/σ`, the first-moment bound `E|ξ| ≤ ρ` and the sixth-moment bound
`E|ξ|⁶ ≤ 6 + 9x² + C₆x³` give, after the penalty `σ²/δ`,

  `Jpw(σ, x) = p₀ + ρp₁σ + (p₂ − 1/δ)σ² + p₄(2 + x²)σ⁴ + p₆(6 + 9x² + C₆x³)σ⁶`.

On a rectangle `[slo, shi] × [xlo, xhi]` the maximum of `Jpw` is attained at an `x`-endpoint
(`cubic_endpoint_le`) and bounded there by Bernstein coefficients (`checkRBox`, `rbox_sound`).
`checkMoment` certifies `Jpw ≤ cap` on the whole domain `[0, δρ] × [0, 31/4]` from a list of
rectangles and the sweep cover (`moment_sound`).
-/

namespace Grothe.Lower

/-- `ρ = 0.97382085`, the first absolute moment bound of a normalized cubic. -/
def ρ : ℚ := 19476417 / 20000000
/-- `C₆ = 40.8205`, the sixth-moment coefficient. -/
def C6 : ℚ := 81641 / 2000
/-- The source witness parameter `ε₀ = 37/50` (the parameter at which all profiles are built). -/
def ε₀ : ℚ := 37 / 50
/-- The common witness parameter `ε = 7400323787/10¹⁰` of the support rows. -/
def ε : ℚ := 7400323787 / 10000000000
/-- The upper end `31/4` of the `x`-range (`E|ξ|⁴ ≤ 62`). -/
def xMax : ℚ := 31 / 4

/-- A physical polynomial must have the shape `a₀ + a₁ s + a₂ s² + a₄ s⁴ + a₆ s⁶`, `a₁, a₆ ≥ 0`. -/
def polyValid (p : List ℚ) : Bool :=
  p.length == 7 && coeffL p 3 == 0 && coeffL p 5 == 0 && decide (0 ≤ coeffL p 1) &&
    decide (0 ≤ coeffL p 6)

def PolyValid (p : List ℚ) : Prop :=
  p.length = 7 ∧ coeffL p 3 = 0 ∧ coeffL p 5 = 0 ∧ 0 ≤ coeffL p 1 ∧ 0 ≤ coeffL p 6

lemma polyValid_iff (p : List ℚ) : polyValid p = true ↔ PolyValid p := by
  simp [polyValid, PolyValid, and_assoc]

/-- Parse `c₀,c₁,…;c₀,c₁,…` into coefficient lists. -/
def parsePolys (s : String) : List (List ℚ) :=
  if s = "" then [] else (s.splitOn ";").map fun t => (t.splitOn ",").map parseQ

/-- Coefficients (in `σ`) of `Jpw` at a fixed `x`. -/
def pwCoeffs (p : List ℚ) (delta x : ℚ) : List ℚ :=
  [coeffL p 0, ρ * coeffL p 1, coeffL p 2 - 1 / delta, 0, coeffL p 4 * (2 + x ^ 2), 0,
   coeffL p 6 * (6 + 9 * x ^ 2 + C6 * x ^ 3)]

/-- `Jpw(σ, x) = p₀ + ρp₁σ + (p₂ − 1/δ)σ² + p₄(2+x²)σ⁴ + p₆(6+9x²+C₆x³)σ⁶`. -/
noncomputable def Jpw (p : List ℚ) (delta : ℚ) (σ x : ℝ) : ℝ :=
  (coeffL p 0 : ℚ) + ρ * (coeffL p 1 : ℚ) * σ + ((coeffL p 2 : ℚ) - 1 / (delta : ℝ)) * σ ^ 2
    + (coeffL p 4 : ℚ) * (2 + x ^ 2) * σ ^ 4 + (coeffL p 6 : ℚ) * (6 + 9 * x ^ 2 + C6 * x ^ 3) * σ ^ 6

lemma Jpw_eq_evalL (p : List ℚ) (delta : ℚ) (σ : ℝ) (x : ℚ) :
    Jpw p delta σ x = evalL ((pwCoeffs p delta x).map ((↑) : ℚ → ℝ)) σ := by
  simp only [Jpw, pwCoeffs, List.map_cons, List.map_nil, evalL]
  push_cast
  ring

def checkRBox (polys : List (List ℚ)) (delta cap : ℚ) (bx : RBox) : Bool :=
  let p := polys.getD bx.k []
  decide (0 ≤ bx.slo) && decide (bx.slo < bx.shi) && decide (0 ≤ bx.xlo) &&
  decide (bx.xlo < bx.xhi) && decide (bx.k < polys.length) && polyValid p &&
  (bernList (pwCoeffs p delta bx.xlo) bx.slo bx.shi).all (fun b => decide (b ≤ cap)) &&
  (bernList (pwCoeffs p delta bx.xhi) bx.slo bx.shi).all (fun b => decide (b ≤ cap))

lemma rboxJ_le (p : List ℚ) (delta cap lo hi xlo xhi : ℚ) (hs : lo < hi) (hx0 : 0 ≤ xlo)
    (hp : PolyValid p)
    (hblo : ∀ b ∈ bernList (pwCoeffs p delta xlo) lo hi, b ≤ cap)
    (hbhi : ∀ b ∈ bernList (pwCoeffs p delta xhi) lo hi, b ≤ cap)
    (σ x : ℝ) (hσ0 : (lo : ℝ) ≤ σ) (hσ1 : σ ≤ hi) (hx1 : (xlo : ℝ) ≤ x) (hx2 : x ≤ xhi) :
    Jpw p delta σ x ≤ cap := by
  have hend : ∀ x0 : ℚ, (∀ b ∈ bernList (pwCoeffs p delta x0) lo hi, b ≤ cap) →
      Jpw p delta σ x0 ≤ cap := by
    intro x0 hb
    rw [Jpw_eq_evalL]
    exact evalL_le_of_bern_rat _ (by simp [pwCoeffs]) lo hi σ cap hσ0 hσ1 hs hb
  have hlo := hend xlo hblo
  have hhi := hend xhi hbhi
  have hA6 : (0 : ℝ) ≤ (coeffL p 6 : ℚ) := by exact_mod_cast hp.2.2.2.2
  have hC6 : (0 : ℝ) ≤ (C6 : ℚ) := by norm_num [C6]
  set a : ℝ := (coeffL p 4 : ℚ) * σ ^ 4 + 9 * (coeffL p 6 : ℚ) * σ ^ 6 with ha
  set b : ℝ := (coeffL p 6 : ℚ) * (C6 : ℚ) * σ ^ 6 with hb
  set K : ℝ := (coeffL p 0 : ℚ) + ρ * (coeffL p 1 : ℚ) * σ
    + ((coeffL p 2 : ℚ) - 1 / (delta : ℝ)) * σ ^ 2 + 2 * (coeffL p 4 : ℚ) * σ ^ 4
    + 6 * (coeffL p 6 : ℚ) * σ ^ 6 with hK
  have hJ : ∀ y : ℝ, Jpw p delta σ y = K + (a * y ^ 2 + b * y ^ 3) := by
    intro y; simp only [Jpw, hK, ha, hb]; ring
  have hb0 : 0 ≤ b := by rw [hb]; exact mul_nonneg (mul_nonneg hA6 hC6) (by positivity)
  have hx0' : (0 : ℝ) ≤ xlo := by exact_mod_cast hx0
  have := cubic_endpoint_le a b x xlo xhi hb0 hx0' hx1 hx2
  rw [hJ x]
  rcases le_max_iff.1 this with h | h
  · rw [hJ] at hlo; linarith
  · rw [hJ] at hhi; linarith

lemma rbox_sound (polys : List (List ℚ)) (delta cap : ℚ) (bx : RBox)
    (h : checkRBox polys delta cap bx = true) (σ x : ℝ) (hmem : bx.mem σ x) :
    bx.k < polys.length ∧ PolyValid (polys.getD bx.k []) ∧
      Jpw (polys.getD bx.k []) delta σ x ≤ cap := by
  simp only [checkRBox, Bool.and_eq_true, decide_eq_true_eq, List.all_eq_true, and_assoc] at h
  obtain ⟨_, hs, hx0, _, hk, hp, hblo, hbhi⟩ := h
  obtain ⟨hm1, hm2, hm3, hm4⟩ := hmem
  exact ⟨hk, (polyValid_iff _).1 hp,
    rboxJ_le _ _ _ _ _ _ _ hs hx0 ((polyValid_iff _).1 hp) hblo hbhi σ x hm1 hm2 hm3 hm4⟩

/-- The moment-cover check: every rectangle is certified and the rectangles cover
`[0, δρ] × [0, 31/4]`. -/
def checkMoment (polys : List (List ℚ)) (delta cap : ℚ) (boxes : List RBox) (edges : List ℚ) :
    Bool :=
  boxes.all (checkRBox polys delta cap) && coversRect boxes edges 0 (delta * ρ) 0 xMax

/-- The real statement certified by `checkMoment`: every point of `[0, δρ] × [0, 31/4]` lies in
a certified rectangle whose polynomial is at most the cap there. -/
def MomentBound (polys : List (List ℚ)) (delta cap : ℚ) (boxes : List RBox) : Prop :=
  ∀ σ x : ℝ, 0 ≤ σ → σ ≤ delta * ρ → 0 ≤ x → x ≤ xMax →
    ∃ bx ∈ boxes, bx.mem σ x ∧ bx.k < polys.length ∧
      PolyValid (polys.getD bx.k []) ∧ Jpw (polys.getD bx.k []) delta σ x ≤ cap

theorem moment_sound (polys : List (List ℚ)) (delta cap : ℚ) (boxes : List RBox)
    (edges : List ℚ) (h : checkMoment polys delta cap boxes edges = true) :
    MomentBound polys delta cap boxes := by
  simp only [checkMoment, Bool.and_eq_true, List.all_eq_true] at h
  obtain ⟨hboxes, hcover⟩ := h
  intro σ x hσ0 hσ1 hx0 hx1
  have hσ0' : ((0 : ℚ) : ℝ) ≤ σ := by exact_mod_cast hσ0
  have hσ1' : σ ≤ ((delta * ρ : ℚ) : ℝ) := by push_cast; exact hσ1
  have hx0' : ((0 : ℚ) : ℝ) ≤ x := by exact_mod_cast hx0
  have hx1' : x ≤ ((xMax : ℚ) : ℝ) := hx1
  obtain ⟨bx, hbx, hmem⟩ := coversRect_sound _ _ _ _ _ _ hcover σ x hσ0' hσ1' hx0' hx1'
  obtain ⟨hk, hpv, hJ⟩ := rbox_sound polys delta cap bx (hboxes bx hbx) σ x hmem
  exact ⟨bx, hbx, hmem, hk, hpv, hJ⟩

end Grothe.Lower
