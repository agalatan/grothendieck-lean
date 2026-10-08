import Grothe.Lower.Bernstein
import Grothe.Lower.PSD
import Grothe.Lower.Cover

/-!
# Coupled (virtual) profiles: data types, the exact checker, and its soundness

A *virtual profile* averages two source profiles `i, j` with weight `w`.  Its residual-moment
bound on the rectangle `[0, ρ] × [0, 31/4]` is certified leaf by leaf: each leaf selects two
(lifted) global physical polynomials `p₁, p₂` and an argument allocation `(λ₁, λ₂)` with
`w λ₁ + (1-w) λ₂ = d`, and the polynomial

  `J(u, x) = A₀ - g + ρ A₁ u + (A₂ - d²/d') u² + A₄ (2 + x²) u⁴ + A₆ (6 + 9x² + C₆ x³) u⁶`,
  `A_k = w p₁ₖ λ₁ᵏ + (1-w) p₂ₖ λ₂ᵏ`,

is bounded by the cap on the leaf box via Bernstein coefficients at both `x`-endpoints.
`recordSound_of_check` turns a successful run of the Boolean checker into the Prop
`RecordSound`, whose last field is the pointwise bound for every point of the root box.
-/

namespace Grothe.Lower

/-- `ρ = 977459/1000000`. -/
def ρ : ℚ := 977459 / 1000000
/-- `C₆ = 4942288923/100000000` (the sharper version-2 sixth-moment coefficient; the version-1
certificates remain valid with it because the `C₆` term is nonnegative). -/
def C6 : ℚ := 4942288923 / 100000000
/-- `ε = 37/50`. -/
def ε : ℚ := 37 / 50
/-- Conservative lift of every physical-polynomial constant term. -/
def lift : ℚ := 1 / 100000000
/-- The root rectangle `[0, ρ] × [0, 31/4]`. -/
def rootBox : Box := ⟨0, ρ, 0, 31 / 4⟩

structure SrcProfile where
  id : String
  ell : ℚ
  beta : ℚ
  delta : ℚ
  E : Sym3
  R : Sym2
  deriving Repr

/-- LDL certificates for the six matrix gates of a profile. -/
structure GateCert where
  ePD : LDL3
  eDom1 : LDL3
  eDom2 : LDL3
  rPD : LDL2
  rDom1 : LDL2
  rDom2 : LDL2
  deriving Repr

structure Leaf where
  path : String
  ki : ℕ
  kj : ℕ
  scales : Option (ℚ × ℚ)
  deriving Repr, DecidableEq

structure VRecord where
  i : ℕ
  j : ℕ
  w : ℚ
  ell : ℚ
  beta : ℚ
  /-- `d = w δᵢ + (1-w) δⱼ` -/
  d : ℚ
  /-- embedded (possibly tightened) `δ'` -/
  dprime : ℚ
  gain : ℚ
  cap : ℚ
  s1 : ℚ
  s2 : ℚ
  gates : GateCert
  /-- encoded leaves `path:ki:kj[:λ1:λ2]` separated by `;` -/
  leaves : String
  deriving Repr

/-! ### Parsing of the encoded leaves -/

def parseQ (s : String) : ℚ :=
  match s.splitOn "/" with
  | [n] => (n.toInt! : ℚ)
  | [n, d] => (n.toInt! : ℚ) / (d.toNat! : ℚ)
  | _ => 0

def parseLeaf (s : String) : Leaf :=
  match s.splitOn ":" with
  | [p, a, b] => ⟨p, a.toNat!, b.toNat!, none⟩
  | [p, a, b, x, y] => ⟨p, a.toNat!, b.toNat!, some (parseQ x, parseQ y)⟩
  | _ => ⟨"", 0, 0, none⟩

def parseLeaves (s : String) : List Leaf := (s.splitOn ";").map parseLeaf

/-! ### The gates -/

/-- The matrix gates of a profile with parameters `(E, R, δ)`, as real-valued PSD/PD facts. -/
structure GateProp (E : Sym3) (R : Sym2) (delta : ℚ) : Prop where
  ePD : PD3 E
  eDom1 : PSD3 (E.subDiag (-1) ε ε)
  eDom2 : PSD3 (E.subDiag (ε - delta) 0 0)
  rPD : PD2 R
  rDom1 : PSD2 (R.subDiag (-1) ε)
  rDom2 : PSD2 (R.subDiag ε 0)

def checkGates (E : Sym3) (R : Sym2) (delta : ℚ) (c : GateCert) : Bool :=
  checkPD3 E c.ePD && checkPSD3 (E.subDiag (-1) ε ε) c.eDom1 &&
  checkPSD3 (E.subDiag (ε - delta) 0 0) c.eDom2 && checkPD2 R c.rPD &&
  checkPSD2 (R.subDiag (-1) ε) c.rDom1 && checkPSD2 (R.subDiag ε 0) c.rDom2

theorem gateProp_of_check (E : Sym3) (R : Sym2) (delta : ℚ) (c : GateCert)
    (h : checkGates E R delta c = true) : GateProp E R delta := by
  simp only [checkGates, Bool.and_eq_true] at h
  obtain ⟨⟨⟨⟨⟨h1, h2⟩, h3⟩, h4⟩, h5⟩, h6⟩ := h
  exact ⟨pd3_of_check _ _ h1, psd3_of_check _ _ h2, psd3_of_check _ _ h3, pd2_of_check _ _ h4,
    psd2_of_check _ _ h5, psd2_of_check _ _ h6⟩

/-! ### Polynomials and the leaf polynomial `J` -/

/-- Apply the conservative lift to the constant term. -/
def liftPoly : List ℚ → List ℚ
  | [] => []
  | a :: r => (a + lift) :: r

/-- A physical polynomial must have the shape `a₀ + a₁ s + a₂ s² + a₄ s⁴ + a₆ s⁶`, `a₁, a₆ ≥ 0`. -/
def polyValid (p : List ℚ) : Bool :=
  p.length == 7 && coeffL p 3 == 0 && coeffL p 5 == 0 && decide (0 ≤ coeffL p 1) &&
    decide (0 ≤ coeffL p 6)

def PolyValid (p : List ℚ) : Prop :=
  p.length = 7 ∧ coeffL p 3 = 0 ∧ coeffL p 5 = 0 ∧ 0 ≤ coeffL p 1 ∧ 0 ≤ coeffL p 6

lemma polyValid_iff (p : List ℚ) : polyValid p = true ↔ PolyValid p := by
  simp [polyValid, PolyValid, and_assoc]

/-- Context: the source profiles and the polynomial groups. -/
structure Ctx where
  src : List SrcProfile
  polys : List (List (List ℚ))

def Ctx.srcP (C : Ctx) (i : ℕ) : SrcProfile := C.src.getD i ⟨"", 0, 0, 0, ⟨0, 0, 0, 0, 0, 0⟩, ⟨0, 0, 0⟩⟩
def Ctx.poly (C : Ctx) (g k : ℕ) : List ℚ := liftPoly ((C.polys.getD g []).getD k [])
def Ctx.npolys (C : Ctx) (g : ℕ) : ℕ := (C.polys.getD g []).length

/-- Effective allocation of a leaf. -/
def Leaf.lam (r : VRecord) (leaf : Leaf) : ℚ × ℚ := leaf.scales.getD (r.s1, r.s2)

/-- Averaged scaled coefficient `A_k = w p₁ₖ λ₁ᵏ + (1-w) p₂ₖ λ₂ᵏ` (rational). -/
def Acoef (C : Ctx) (r : VRecord) (leaf : Leaf) (k : ℕ) : ℚ :=
  let p1 := C.poly r.i leaf.ki
  let p2 := C.poly r.j leaf.kj
  let l := leaf.lam r
  r.w * coeffL p1 k * l.1 ^ k + (1 - r.w) * coeffL p2 k * l.2 ^ k

/-- Coefficient list (in `u`) of `J(u, x)` at a fixed `x`. -/
def leafCoeffs (C : Ctx) (r : VRecord) (leaf : Leaf) (x : ℚ) : List ℚ :=
  [Acoef C r leaf 0 - r.gain, ρ * Acoef C r leaf 1, Acoef C r leaf 2 - r.d ^ 2 / r.dprime, 0,
   Acoef C r leaf 4 * (2 + x ^ 2), 0, Acoef C r leaf 6 * (6 + 9 * x ^ 2 + C6 * x ^ 3)]

/-- The real polynomial `J(u, x)` of a leaf. -/
noncomputable def Jval (C : Ctx) (r : VRecord) (leaf : Leaf) (u x : ℝ) : ℝ :=
  ((Acoef C r leaf 0 : ℚ) - r.gain) + ρ * (Acoef C r leaf 1 : ℚ) * u
    + ((Acoef C r leaf 2 : ℚ) - (r.d : ℝ) ^ 2 / r.dprime) * u ^ 2
    + (Acoef C r leaf 4 : ℚ) * (2 + x ^ 2) * u ^ 4
    + (Acoef C r leaf 6 : ℚ) * (6 + 9 * x ^ 2 + C6 * x ^ 3) * u ^ 6

lemma Jval_eq_evalL (C : Ctx) (r : VRecord) (leaf : Leaf) (u : ℝ) (x : ℚ) :
    Jval C r leaf u x = evalL ((leafCoeffs C r leaf x).map ((↑) : ℚ → ℝ)) u := by
  simp only [Jval, leafCoeffs, List.map_cons, List.map_nil, evalL]
  push_cast
  ring

/-! ### The checker -/

def checkLeaf (C : Ctx) (r : VRecord) (leaf : Leaf) : Bool :=
  let box := boxOfPath rootBox (decodePath leaf.path) 0
  let l := leaf.lam r
  decide (0 ≤ l.1) && decide (0 ≤ l.2) && (r.w * l.1 + (1 - r.w) * l.2 == r.d) &&
  decide (leaf.ki < C.npolys r.i) && decide (leaf.kj < C.npolys r.j) &&
  polyValid (C.poly r.i leaf.ki) && polyValid (C.poly r.j leaf.kj) &&
  decide (box.ulo < box.uhi) && decide (0 ≤ box.xlo) &&
  (bernList (leafCoeffs C r leaf box.xlo) box.ulo box.uhi).all (fun b => decide (b ≤ r.cap)) &&
  (bernList (leafCoeffs C r leaf box.xhi) box.ulo box.uhi).all (fun b => decide (b ≤ r.cap))

def checkRecord (C : Ctx) (r : VRecord) : Bool :=
  let pi := C.srcP r.i
  let pj := C.srcP r.j
  let E := Sym3.avg r.w pi.E pj.E
  let R := Sym2.avg r.w pi.R pj.R
  let leaves := parseLeaves r.leaves
  decide (r.i < C.src.length) && decide (r.j < C.src.length) && (r.i != r.j) &&
  decide (0 < r.w) && decide (r.w < 1) &&
  (r.ell == r.w * pi.ell + (1 - r.w) * pj.ell) &&
  (r.beta == r.w * pi.beta + (1 - r.w) * pj.beta) &&
  (r.d == r.w * pi.delta + (1 - r.w) * pj.delta) &&
  (r.gain == 2 * r.w * (1 - r.w) * (pi.beta - pj.beta) ^ 2 / ε) &&
  decide (0 < r.dprime) && decide (r.dprime ≤ r.d) && decide (r.dprime < ε) &&
  decide (0 ≤ r.beta) && decide (2 * r.beta ≤ r.ell) &&
  checkGates E R r.dprime r.gates &&
  leaves.all (checkLeaf C r) &&
  coversBox rootBox (leaves.map fun leaf => decodePath leaf.path) 0 64

/-! ### Soundness -/

/-- Validity of a leaf's allocation and polynomial choices (the analytic layer's hypotheses). -/
structure LeafValid (C : Ctx) (r : VRecord) (leaf : Leaf) : Prop where
  lam_nonneg : 0 ≤ (leaf.lam r).1 ∧ 0 ≤ (leaf.lam r).2
  lam_eq : r.w * (leaf.lam r).1 + (1 - r.w) * (leaf.lam r).2 = r.d
  ki_lt : leaf.ki < C.npolys r.i
  kj_lt : leaf.kj < C.npolys r.j
  p1_valid : PolyValid (C.poly r.i leaf.ki)
  p2_valid : PolyValid (C.poly r.j leaf.kj)

/-- Everything the checker certifies about a virtual profile. -/
structure RecordSound (C : Ctx) (r : VRecord) : Prop where
  idx : r.i < C.src.length ∧ r.j < C.src.length ∧ r.i ≠ r.j
  w_pos : 0 < r.w
  w_lt : r.w < 1
  ell_eq : r.ell = r.w * (C.srcP r.i).ell + (1 - r.w) * (C.srcP r.j).ell
  beta_eq : r.beta = r.w * (C.srcP r.i).beta + (1 - r.w) * (C.srcP r.j).beta
  d_eq : r.d = r.w * (C.srcP r.i).delta + (1 - r.w) * (C.srcP r.j).delta
  gain_eq : r.gain = 2 * r.w * (1 - r.w) * ((C.srcP r.i).beta - (C.srcP r.j).beta) ^ 2 / ε
  dprime_pos : 0 < r.dprime
  dprime_le : r.dprime ≤ r.d
  dprime_lt : r.dprime < ε
  beta_nonneg : 0 ≤ r.beta
  ell_ge : 2 * r.beta ≤ r.ell
  gates : GateProp (Sym3.avg r.w (C.srcP r.i).E (C.srcP r.j).E)
    (Sym2.avg r.w (C.srcP r.i).R (C.srcP r.j).R) r.dprime
  /-- Every point of the root rectangle lies in a certified leaf whose polynomial is at most
  the cap there. -/
  cover : ∀ u x : ℝ, 0 ≤ u → u ≤ ρ → 0 ≤ x → x ≤ 31 / 4 →
    ∃ leaf ∈ parseLeaves r.leaves,
      (boxOfPath rootBox (decodePath leaf.path) 0).mem u x ∧ LeafValid C r leaf ∧
        Jval C r leaf u x ≤ r.cap

lemma Acoef6_nonneg (C : Ctx) (r : VRecord) (leaf : Leaf) (hw0 : 0 ≤ r.w) (hw1 : r.w ≤ 1)
    (hp1 : PolyValid (C.poly r.i leaf.ki)) (hp2 : PolyValid (C.poly r.j leaf.kj)) :
    0 ≤ Acoef C r leaf 6 := by
  unfold Acoef
  have h1 : 0 ≤ coeffL (C.poly r.i leaf.ki) 6 := hp1.2.2.2.2
  have h2 : 0 ≤ coeffL (C.poly r.j leaf.kj) 6 := hp2.2.2.2.2
  have hw1' : 0 ≤ 1 - r.w := by linarith
  have e1 : 0 ≤ (leaf.lam r).1 ^ 6 := by positivity
  have e2 : 0 ≤ (leaf.lam r).2 ^ 6 := by positivity
  exact add_nonneg (mul_nonneg (mul_nonneg hw0 h1) e1) (mul_nonneg (mul_nonneg hw1' h2) e2)

lemma leafSound (C : Ctx) (r : VRecord) (leaf : Leaf) (h : checkLeaf C r leaf = true)
    (hw0 : 0 ≤ r.w) (hw1 : r.w ≤ 1)
    (u x : ℝ) (hmem : (boxOfPath rootBox (decodePath leaf.path) 0).mem u x) (hu0 : 0 ≤ u)
    (hx0 : 0 ≤ x) : LeafValid C r leaf ∧ Jval C r leaf u x ≤ r.cap := by
  simp only [checkLeaf, Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq, List.all_eq_true,
    and_assoc] at h
  obtain ⟨hl1, hl2, hleq, hki, hkj, hp1, hp2, hlh, hxlo, hblo, hbhi⟩ := h
  obtain ⟨hu1, hu2, hx1, hx2⟩ := hmem
  have hp1' := (polyValid_iff _).1 hp1
  have hp2' := (polyValid_iff _).1 hp2
  refine ⟨⟨⟨hl1, hl2⟩, hleq, hki, hkj, hp1', hp2'⟩, ?_⟩
  set box := boxOfPath rootBox (decodePath leaf.path) 0 with hbox
  -- Bernstein bounds at the two `x`-endpoints
  have hend : ∀ x0 : ℚ, (∀ b ∈ bernList (leafCoeffs C r leaf x0) box.ulo box.uhi, b ≤ r.cap) →
      Jval C r leaf u x0 ≤ r.cap := by
    intro x0 hb
    rw [Jval_eq_evalL]
    exact evalL_le_of_bern_rat _ (by simp [leafCoeffs]) box.ulo box.uhi u r.cap hu1 hu2 hlh hb
  have hlo := hend box.xlo hblo
  have hhi := hend box.xhi hbhi
  -- endpoint reduction in `x`
  have hA6 : (0 : ℝ) ≤ (Acoef C r leaf 6 : ℚ) := by
    exact_mod_cast Acoef6_nonneg C r leaf hw0 hw1 hp1' hp2'
  have hC6 : (0 : ℝ) ≤ (C6 : ℚ) := by norm_num [C6]
  set a : ℝ := (Acoef C r leaf 4 : ℚ) * u ^ 4 + 9 * (Acoef C r leaf 6 : ℚ) * u ^ 6 with ha
  set b : ℝ := (Acoef C r leaf 6 : ℚ) * (C6 : ℚ) * u ^ 6 with hb
  set K : ℝ := ((Acoef C r leaf 0 : ℚ) - r.gain) + ρ * (Acoef C r leaf 1 : ℚ) * u
    + ((Acoef C r leaf 2 : ℚ) - (r.d : ℝ) ^ 2 / r.dprime) * u ^ 2
    + 2 * (Acoef C r leaf 4 : ℚ) * u ^ 4 + 6 * (Acoef C r leaf 6 : ℚ) * u ^ 6 with hK
  have hJ : ∀ y : ℝ, Jval C r leaf u y = K + (a * y ^ 2 + b * y ^ 3) := by
    intro y; simp only [Jval, hK, ha, hb]; ring
  have hb0 : 0 ≤ b := by rw [hb]; exact mul_nonneg (mul_nonneg hA6 hC6) (by positivity)
  have hx0' : (0 : ℝ) ≤ box.xlo := by exact_mod_cast hxlo
  have := cubic_endpoint_le a b x box.xlo box.xhi hb0 hx0' hx1 hx2
  rw [hJ x]
  rcases le_max_iff.1 this with h | h
  · rw [hJ] at hlo; linarith
  · rw [hJ] at hhi; linarith

/-- **Soundness of the record checker.** -/
theorem recordSound_of_check (C : Ctx) (r : VRecord) (h : checkRecord C r = true) :
    RecordSound C r := by
  simp only [checkRecord, Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq, bne_iff_ne, ne_eq,
    List.all_eq_true, and_assoc] at h
  obtain ⟨hi, hj, hij, hw0, hw1, hell, hbeta, hd, hgain, hdp0, hdp1, hdp2, hb0, hb1, hg,
    hleaves, hcover⟩ := h
  refine ⟨⟨hi, hj, hij⟩, hw0, hw1, hell, hbeta, hd, hgain, hdp0, hdp1, hdp2, hb0, hb1,
    gateProp_of_check _ _ _ _ hg, ?_⟩
  intro u x hu0 hu1 hx0 hx1
  have hmem : rootBox.mem u x := by
    refine ⟨?_, ?_, ?_, ?_⟩
    · simp only [rootBox]; push_cast; exact hu0
    · exact hu1
    · simp only [rootBox]; push_cast; exact hx0
    · simp only [rootBox]; push_cast; exact hx1
  obtain ⟨p, hp, hmemp⟩ := coversBox_sound 64 rootBox _ 0 hcover u x hmem
  obtain ⟨leaf, hleaf, rfl⟩ := List.mem_map.1 hp
  obtain ⟨hv, hJ⟩ := leafSound C r leaf (hleaves leaf hleaf) hw0.le hw1.le u x hmemp hu0 hx0
  exact ⟨leaf, hleaf, hmemp, hv, hJ⟩

end Grothe.Lower
