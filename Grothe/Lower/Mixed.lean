import Grothe.Lower.Rows

/-!
# Spectral witnesses

A spectral witness (`SWit`, `parseSWit`) certifies a node of a row with a spectral cut; `checkSWit` is its exact check
and `checkSWit_sound` its soundness, used by the rows with spectral nodes (`SpecRows.lean`).
-/

open MeasureTheory

namespace Grothe.Lower

/-- The first node is at `0`. -/
def headZero : List (ℚ × ℚ) → Bool
  | n :: _ => n.1 == 0
  | [] => false

/-! ### Spectral witnesses -/

/-- A spectral witness: the node `τ`, the majorant, the parameters `(λ, μ, t, β, ν)`, the knot
values of the test and the cited law budget (`GBud.sep` for the inherited spectral cut). -/
structure SWit where
  tau : ℚ
  y : MPoly
  lam : ℚ
  mu : ℚ
  t : ℚ
  be : ℚ
  nu : ℚ
  z : List ℚ
  bud : GBud

/-- Consecutive pairs `(s₁, η₁), (s₂, η₂), …`. -/
def pairsOf : List ℚ → List (ℚ × ℚ)
  | a :: b :: r => (a, b) :: pairsOf r
  | _ => []

/-- The cited budget `g,A,B,m₀₀,m₀₁,m₁₁,k₀₀,k₀₁,k₁₁,α,β`, `c,s₁,η₁,…` or
`j,k,α,x_*,ζ,A,B,m₀₀,m₀₁,m₁₁,k₀₀,k₀₁,k₁₁,α',β'`; a malformed string gives a budget failing its
check. -/
def parseGBud (s : String) : GBud :=
  match s.splitOn "," with
  | "g" :: rest =>
    match rest.map parseQ with
    | [A, B, m00, m01, m11, k00, k01, k11, ga, gb] =>
      .gram ⟨A, B, m00, m01, m11, k00, k01, k11, ga, gb⟩
    | _ => .gram ⟨0, 0, 0, 0, 0, 0, 0, 0, -1, 0⟩
  | "j" :: rest =>
    match rest.map parseQ with
    | [k, al, xs, ze, A, B, m00, m01, m11, k00, k01, k11, ga, gb] =>
      .joint ⟨A, B, m00, m01, m11, k00, k01, k11, ga, gb⟩ ⟨k == 1, al, xs, ze⟩
    | _ => .joint ⟨0, 0, 0, 0, 0, 0, 0, 0, -1, 0⟩ ⟨false, 0, 0, 0⟩
  | "c" :: rest => .coupled (pairsOf (rest.map parseQ))
  | _ => .coupled [(0, 1)]

def dfltSWit : SWit := ⟨0, ⟨0, 0, 0, 0, 0⟩, 0, 0, 0, 0, 0, [], .sep⟩

def parseSWit (s : String) : SWit :=
  match s.splitOn "|" with
  | [a, k] =>
    match a.splitOn ":" with
    | [t, p, c] =>
      match parseQs c with
      | [l, m, tt, b, n] => ⟨parseQ t, parseMPoly p, l, m, tt, b, n, parseQs k, .sep⟩
      | _ => dfltSWit
    | [t, p, c, bud] =>
      match parseQs c with
      | [l, m, tt, b, n] => ⟨parseQ t, parseMPoly p, l, m, tt, b, n, parseQs k, parseGBud bud⟩
      | _ => dfltSWit
    | _ => dfltSWit
  | _ => dfltSWit

/-- The spectral node check: `λ, μ > 0`, `ν ≥ 0`, the majorant has `y₄, y₃ ≥ 0`, the cited
budget passes its exact check (`GBud.ok`: identity (4) coefficientwise, PSD by diagonal and
determinant, nonnegative remainders; or `s_j ≥ 2`, `η_j ≥ 0`, `Σ η_j ≤ λ`; or `jointCert`), and
`Ψ(τv) + G(v²) ≤ y(v)` for all `v ≥ 0` by the majorant sweep. -/
def checkSWit (nodes : List (ℚ × ℚ)) (smax : ℚ) (vs : List ℚ) (w : SWit) : Bool :=
  decide (0 < w.lam) && decide (0 < w.mu) && decide (0 ≤ w.nu) && decide (0 ≤ w.y.a1) &&
    decide (0 ≤ w.y.a6) &&
    match w.bud with
    | .sep =>
      let arr := specPolys vs w.z w.lam w.mu w.t w.be w.nu
      sweepTop w.tau smax w.y.list (fun k => arr.getD k []) vs nodes
    | .joint g j =>
      let arr := jspecPolys vs w.z w.lam w.mu w.t w.be w.nu ((GBud.joint g j).af w.lam)
        ((GBud.joint g j).ag w.mu) j.ze
      jointCert w.lam w.mu g j && sweepTop w.tau smax w.y.list (fun k => arr.getD k []) vs nodes
    | bud =>
      let arr := gspecPolys vs w.z w.lam w.mu w.t w.be w.nu (bud.af w.lam) (bud.ag w.mu)
      bud.ok w.lam w.mu && sweepTop w.tau smax w.y.list (fun k => arr.getD k []) vs nodes

lemma checkSWit_sound {Ψ : ℝ → ℝ} {nodes : List (ℚ × ℚ)} {smax : ℚ} (hΨ : CapsHold Ψ nodes smax)
    (vs : List ℚ) (w : SWit) (h : checkSWit nodes smax vs w = true) :
    0 < w.lam ∧ 0 < w.mu ∧ 0 ≤ w.nu ∧ 0 ≤ w.y.a1 ∧ 0 ≤ w.y.a6 ∧
      ((w.bud = .sep ∧ ∀ v : ℝ, 0 ≤ v →
        Ψ (w.tau * v) + specG vs w.z w.lam w.mu w.t w.be w.nu v
          ≤ evalL (w.y.list.map ((↑) : ℚ → ℝ)) v) ∨
       (w.bud.ok w.lam w.mu = true ∧ ∀ v : ℝ, 0 ≤ v →
        Ψ (w.tau * v) + gspecG vs w.z w.lam w.mu w.t w.be w.nu (w.bud.af w.lam) (w.bud.ag w.mu) v
          ≤ evalL (w.y.list.map ((↑) : ℚ → ℝ)) v) ∨
       (∃ g j, w.bud = .joint g j ∧ jointCert w.lam w.mu g j = true ∧ ∀ v : ℝ, 0 ≤ v →
        Ψ (w.tau * v) + jspecG vs w.z w.lam w.mu w.t w.be w.nu ((GBud.joint g j).af w.lam)
          ((GBud.joint g j).ag w.mu) j.ze v ≤ evalL (w.y.list.map ((↑) : ℚ → ℝ)) v)) := by
  obtain ⟨tau, y, lam, mu, t, be, nu, z, bud⟩ := w
  cases bud with
  | sep =>
    simp only [checkSWit, Bool.and_eq_true, decide_eq_true_eq] at h
    obtain ⟨⟨⟨⟨⟨hl, hm⟩, hn⟩, h1⟩, h6⟩, hsw⟩ := h
    refine ⟨hl, hm, hn, h1, h6, Or.inl ⟨rfl, fun v hv => ?_⟩⟩
    refine major_sound Ψ nodes smax hΨ tau y.list _ vs _ (fun u _ hk => ?_) hsw v hv
    rw [specPolys_getD]
    exact specG_cell vs z lam mu t be nu u hk
  | gram g =>
    simp only [checkSWit, Bool.and_eq_true, decide_eq_true_eq] at h
    obtain ⟨⟨⟨⟨⟨hl, hm⟩, hn⟩, h1⟩, h6⟩, hok, hsw⟩ := h
    refine ⟨hl, hm, hn, h1, h6, Or.inr (Or.inl ⟨hok, fun v hv => ?_⟩)⟩
    refine major_sound Ψ nodes smax hΨ tau y.list _ vs _ (fun u _ hk => ?_) hsw v hv
    rw [gspecPolys_getD]
    exact gspecG_cell vs z lam mu t be nu _ _ u hk
  | coupled se =>
    simp only [checkSWit, Bool.and_eq_true, decide_eq_true_eq] at h
    obtain ⟨⟨⟨⟨⟨hl, hm⟩, hn⟩, h1⟩, h6⟩, hok, hsw⟩ := h
    refine ⟨hl, hm, hn, h1, h6, Or.inr (Or.inl ⟨hok, fun v hv => ?_⟩)⟩
    refine major_sound Ψ nodes smax hΨ tau y.list _ vs _ (fun u _ hk => ?_) hsw v hv
    rw [gspecPolys_getD]
    exact gspecG_cell vs z lam mu t be nu _ _ u hk
  | joint g j =>
    simp only [checkSWit, Bool.and_eq_true, decide_eq_true_eq] at h
    obtain ⟨⟨⟨⟨⟨hl, hm⟩, hn⟩, h1⟩, h6⟩, hok, hsw⟩ := h
    refine ⟨hl, hm, hn, h1, h6, Or.inr (Or.inr ⟨g, j, rfl, hok, fun v hv => ?_⟩)⟩
    refine major_sound Ψ nodes smax hΨ tau y.list _ vs _ (fun u _ hk => ?_) hsw v hv
    rw [jspecPolys_getD]
    exact jspecG_cell vs z lam mu t be nu _ _ _ u hk

end Grothe.Lower
