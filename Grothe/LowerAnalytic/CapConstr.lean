import Grothe.LowerAnalytic.CapGridOK
import Grothe.LowerAnalytic.CapCover

/-!
# Constrained pieces: the S-lemma bound on a region (route M of PLAN_CAPS)

On the region `Π = {y : loᶜ ≤ τᶜ(y) ≤ hiᶜ}` of a piece (`τᶜ(y) = vᶜ·vec(M y)`, `pieceSet`), every
term `λᶜ (τᶜ − loᶜ)(hiᶜ − τᶜ) + μᶜ (τᶜ − loᶜ)` with `λᶜ, μᶜ ≥ 0` is nonnegative (MIDCAPS Lemma 1).
As a quadratic form in `(1, y)` it has the matrix `Cons.sMat` (`qf_sMat`).  Subtracting these
forms from the matrix `N` of the unconstrained check (`pieceN`) gives `pieceNc`; if its exact
`LDLᵀ` has nonnegative pivots then `J(y, s) ≤ cap` on `Π` (`Jpot_le_of_pieceOKc`).  With the
prices and enclosures of a recipe on a grid (`nodeOKc`, the constrained analogue of `nodeOK`)
this is `Jpot_le_of_nodeOKc`.  A node is certified by a piece list that passes `capCoverOK` and
`nodeOKc` on every piece (`pot_le_of_pieces`).
-/

open MeasureTheory Finset GrotheKernel Grothe.Lower Grothe.Upper

namespace Grothe.LowerAnalytic

/-- The coefficients `u = Mᵀ v` of `τ(y) = v·vec(M y) = Σⱼ uⱼ yⱼ`. -/
def Cons.u (Mq : ℕ → ℕ → ℚ) (c : Cons) (j : ℕ) : ℚ :=
  ((List.range 12).map fun i => c.v.getD i 0 * Mq i j).sum

/-- The matrix of `λ (τ − lo)(hi − τ) + μ (τ − lo)` as a form in `(1, y)`. -/
def Cons.sMat (Mq : ℕ → ℕ → ℚ) (c : Cons) (i j : ℕ) : ℚ :=
  let hi := c.hi.getD 0
  let b := (c.lam * (c.lo + hi) + c.mu) / 2
  if i = 0 ∧ j = 0 then -(c.lam * c.lo * hi) - c.mu * c.lo
  else if i = 0 then b * c.u Mq (j - 1)
  else if j = 0 then b * c.u Mq (i - 1)
  else -(c.lam * c.u Mq (i - 1) * c.u Mq (j - 1))

/-- Admissible multipliers: `λ, μ ≥ 0`, and `λ = 0` for a halfspace. -/
def Cons.ok (c : Cons) : Bool :=
  decide (0 ≤ c.lam) && decide (0 ≤ c.mu) && (c.hi.isSome || decide (c.lam = 0))

/-- `N − Σᶜ Sᶜ`. -/
def pieceNc (Mq : ℕ → ℕ → ℚ) (av : ℕ → ℚ) (s cap : ℚ) (Tup : QMat) (cs : List Cons) : QMat :=
  QMat.ofFn 13 fun i j => (pieceN Mq av s cap Tup).at i j - (cs.map fun c => c.sMat Mq i j).sum

/-- **The constrained piece check**: enclosure sanity, admissible multipliers, exact `LDLᵀ`. -/
def pieceOKc (lo up : QMat) (Mq : ℕ → ℕ → ℚ) (av : ℕ → ℚ) (s cap : ℚ) (cs : List Cons) : Bool :=
  enclOK lo up 13 && cs.all Cons.ok && ldlOK (pieceNc Mq av s cap (loewnerUp lo up 13) cs) 13

section

variable (E : Sym3) (R : Sym2)

lemma tauOf_eq (c : Cons) (y : Fib) :
    tauOf E R c.v y = ∑ j ∈ range 12, (c.u (mMat E R) j : ℝ) * y.vec j := by
  unfold tauOf Cons.u
  simp only [sum_range_map]
  push_cast
  simp_rw [Finset.sum_mul]
  rw [Finset.sum_comm]
  refine Finset.sum_congr rfl fun i hi => ?_
  rw [vec_M E R y i (mem_range.1 hi), Finset.mul_sum]
  exact Finset.sum_congr rfl fun j _ => by ring

lemma qf_sMat (c : Cons) (y : Fib) :
    qf (fun i j => (c.sMat (mMat E R) i j : ℝ)) 13 (wOf y.vec)
      = c.lam * (tauOf E R c.v y - c.lo) * ((c.hi.getD 0 : ℚ) - tauOf E R c.v y)
        + c.mu * (tauOf E R c.v y - c.lo) := by
  rw [tauOf_eq, qf_succ]
  simp only [Cons.sMat, wOf, and_self, ↓reduceIte, Nat.add_one_ne_zero, and_false, false_and,
    Nat.add_sub_cancel, mul_one]
  push_cast
  generalize (c.hi.getD 0 : ℝ) = h
  set u : ℕ → ℝ := fun j => (c.u (mMat E R) j : ℝ)
  have e1 : ∑ i ∈ range 12, ∑ j ∈ range 12, -((c.lam : ℝ) * u i * u j) * y.vec i * y.vec j
      = -(c.lam : ℝ) * (∑ j ∈ range 12, u j * y.vec j) ^ 2 := by
    rw [sq, Finset.sum_mul_sum, Finset.mul_sum]
    refine Finset.sum_congr rfl fun i _ => ?_
    rw [Finset.mul_sum]
    exact Finset.sum_congr rfl fun j _ => by ring
  have e2 : ∑ j ∈ range 12, ((((c.lam : ℝ) * (c.lo + h) + c.mu) / 2 * u j)
      + (((c.lam : ℝ) * (c.lo + h) + c.mu) / 2 * u j)) * y.vec j
      = ((c.lam : ℝ) * (c.lo + h) + c.mu) * ∑ j ∈ range 12, u j * y.vec j := by
    rw [Finset.mul_sum]; exact Finset.sum_congr rfl fun j _ => by ring
  simp only [u] at e1 e2
  rw [e1, e2]
  ring

lemma qf_sMat_nonneg {c : Cons} (hc : c.ok = true) {y : Fib} (hy : c.Holds E R y) :
    0 ≤ qf (fun i j => (c.sMat (mMat E R) i j : ℝ)) 13 (wOf y.vec) := by
  rw [qf_sMat]
  simp only [Cons.ok, Bool.and_eq_true, decide_eq_true_eq, Bool.or_eq_true,
    Option.isSome_iff_exists] at hc
  obtain ⟨⟨hl, hm⟩, hh⟩ := hc
  obtain ⟨h1, h2⟩ := hy
  have hl' : (0 : ℝ) ≤ c.lam := by exact_mod_cast hl
  have hm' : (0 : ℝ) ≤ c.mu := by exact_mod_cast hm
  have hτ : 0 ≤ tauOf E R c.v y - c.lo := by linarith
  rcases hh with ⟨v, hv⟩ | h0
  · have := h2 v hv
    rw [hv, Option.getD_some]
    have : 0 ≤ (v : ℝ) - tauOf E R c.v y := by linarith
    positivity
  · rw [show (c.lam : ℝ) = 0 by exact_mod_cast h0]
    simp only [zero_mul, zero_add]
    positivity

lemma qf_pieceNc (av : ℕ → ℚ) (s cap : ℚ) (Tup : QMat) (cs : List Cons) (w : ℕ → ℝ) :
    qf (fun i j => ((pieceNc (mMat E R) av s cap Tup cs).at i j : ℝ)) 13 w
      = qf (fun i j => ((pieceN (mMat E R) av s cap Tup).at i j : ℝ)) 13 w
        - (cs.map fun c => qf (fun i j => (c.sMat (mMat E R) i j : ℝ)) 13 w).sum := by
  rw [qf_congr (m' := fun i j => ((pieceN (mMat E R) av s cap Tup).at i j : ℝ)
      - (cs.map fun c => (c.sMat (mMat E R) i j : ℝ)).sum) w
      fun i hi j hj => by rw [pieceNc, QMat.at_ofFn _ hi hj]; push_cast; simp [List.map_map, Function.comp_def]]
  have : ∀ (m : ℕ → ℕ → ℝ) (l : List (ℕ → ℕ → ℝ)),
      qf (fun i j => m i j - (l.map fun f => f i j).sum) 13 w
        = qf m 13 w - (l.map fun f => qf f 13 w).sum := by
    intro m l
    induction l generalizing m with
    | nil => simp
    | cons f l ih =>
      have e : (fun i j => m i j - ((f :: l).map fun g => g i j).sum)
          = fun i j => (m i j - f i j) - (l.map fun g => g i j).sum := by
        funext i j; simp; ring
      rw [e, ih]
      simp only [List.map_cons, List.sum_cons]
      unfold qf
      simp only [sub_mul, Finset.sum_sub_distrib]
      ring
  have h2 := this (fun i j => ((pieceN (mMat E R) av s cap Tup).at i j : ℝ))
    (cs.map fun c => fun i j => (c.sMat (mMat E R) i j : ℝ))
  simp only [List.map_map, Function.comp_def] at h2
  exact h2

end

section

variable (ℓ β : ℝ) (pr : Prices ℓ β) (E : Sym3) (R : Sym2) (a : Fib)

/-- **The bound of a constrained piece**: on the region of the constraints, `J(y, s) ≤ cap`. -/
theorem Jpot_le_of_pieceOKc (av : ℕ → ℚ) (hav : ∀ j < 12, a.vec j = av j)
    (s cap : ℚ) (lo up : QMat)
    (henc : ∀ i < 13, ∀ j < 13, (lo.at i j : ℝ) ≤ Tint ℓ β pr i j ∧ Tint ℓ β pr i j ≤ up.at i j)
    (cs : List Cons) (hchk : pieceOKc lo up (mMat E R) av s cap cs = true)
    (y : Fib) (hy : y ∈ pieceSet E R cs) :
    Jpot E R ℓ β a y s ≤ cap := by
  simp only [pieceOKc, Bool.and_eq_true, List.all_eq_true] at hchk
  obtain ⟨⟨henc', hok⟩, hldl⟩ := hchk
  refine Jpot_le_of_qfN ℓ β pr E R a av hav s cap lo up henc henc' y ?_
  have h := qf_nonneg_of_ldlOK hldl (wOf y.vec)
  rw [qf_pieceNc] at h
  have hS : 0 ≤ (cs.map fun c => qf (fun i j => (c.sMat (mMat E R) i j : ℝ)) 13 (wOf y.vec)).sum :=
    List.sum_nonneg fun x hx => by
      obtain ⟨c, hc, rfl⟩ := List.mem_map.1 hx
      exact qf_sMat_nonneg E R (hok c hc) (hy c hc)
  linarith

end

/-! ### Encoding of the pieces (generated data, `tools/gen_cap_pieces.py`) -/

/-- A constraint `k,σ,lo,hi,λ,μ` (`hi = *` for a halfspace) on the direction `σ dₖ`. -/
def parseCons (ds : List (List ℚ)) (s : String) : Cons :=
  match s.splitOn "," with
  | [k, sg, lo, hi, lam, mu] =>
    let d := ds.getD ((k.toNat?).getD 0) []
    ⟨if sg = "-" then d.map Neg.neg else d, parseRat lo,
      if hi = "*" then none else some (parseRat hi), parseRat lam, parseRat mu⟩
  | _ => ⟨[], 1, some 0, 0, 0⟩

/-- A piece `g;recipe;c₁;c₂;…`: grid index, price recipe, constraints. -/
def parsePiece (ds : List (List ℚ)) (s : String) : ℕ × Recipe × List Cons :=
  match s.splitOn ";" with
  | g :: rc :: cs => ((g.toNat?).getD 0, parseRecipe rc, cs.map (parseCons ds))
  | _ => (0, parseRecipe "", [])

/-- The directions `d₀, d₂, d₃` of a node. -/
def parseDirs (l : List String) : List (List ℚ) := l.map fun d => (d.splitOn ",").map parseRat

/-! ### Constrained node checks -/

/-- **The constrained node check** (the analogue of `nodeOK` on a piece region). -/
def nodeOKc (r : Grothe.Lower.Row) (Rg : Grothe.Lower.Sym2) (s c : ℚ) (rec : Recipe)
    (Nr N : ℕ) (h : ℚ) (T : Tables) (cs : List Cons) : Bool :=
  let gd := mkGrid r.ell r.beta rec Nr N h T
  let M := matI r.ell r.beta gd T
  polyBoundsOK r.ell r.beta &&
    pieceOKc (loQ M) (hiQ M) (mMat r.E Rg) (avOf r) s (c + Grothe.Lower.capPad) cs

noncomputable section

/-- **Soundness of the constrained node check**: `J(y, s) − capPad ≤ c` on the piece region. -/
theorem Jpot_le_of_nodeOKc (r : Grothe.Lower.Row) (Rg : Grothe.Lower.Sym2) (s c : ℚ) (rec : Recipe)
    (Nr N : ℕ) (h : ℚ) (T : Tables) (cs : List Cons) (hT : TablesOK Nr N h T) (hh : 0 < h)
    (hN : 0 < N) (hNr : 0 < Nr) (hchk : nodeOKc r Rg s c rec Nr N h T cs = true)
    (y : Fib) (hy : y ∈ pieceSet r.E Rg cs) :
    Jpot r.E Rg r.ell r.beta (aFib r.b1 r.b2 r.b3) y s - Grothe.Lower.capPad ≤ c := by
  simp only [nodeOKc, Bool.and_eq_true] at hchk
  obtain ⟨hp, hpc⟩ := hchk
  have hok := gridOK_mkGrid r.ell r.beta rec T hh hN hNr
  set gd := mkGrid r.ell r.beta rec Nr N h T with hgd
  have hT' : TablesOK gd.Nr gd.N gd.h T := hT
  have hJ := Jpot_le_of_pieceOKc (r.ell : ℝ) r.beta (gridPrices hok) r.E Rg
    (aFib r.b1 r.b2 r.b3) (avOf r) (aFib_vec r) s (c + Grothe.Lower.capPad) _ _ ?_ cs hpc y hy
  · push_cast at hJ; linarith
  intro I hI J hJ
  have hM : ((matI r.ell r.beta gd T).getD I #[]).getD J zeroI
      = if I ≤ J then entryOf r.ell r.beta (cwSpec gd T) (tailPolyI T) I J
        else entryOf r.ell r.beta (cwSpec gd T) (tailPolyI T) J I := by
    rw [matI_eq, matOf_getD _ _ _ _ hI hJ]
  have hmem : mem (Tint r.ell r.beta (gridPrices hok) I J)
      (((matI r.ell r.beta gd T).getD I #[]).getD J zeroI) := by
    rw [hM]
    split_ifs
    · exact mem_entryOf hok hp hT' hI hJ
    · rw [Tint_symm]; exact mem_entryOf hok hp hT' hJ hI
  have hsz : I < (matI r.ell r.beta gd T).size := by rw [matI_eq]; simp [matOf, hI]
  have hsz2 : J < ((matI r.ell r.beta gd T).getD I #[]).size := by
    rw [matI_eq]; unfold matOf; rw [toArray_map_range_getD _ _ _ hI]; simp [hJ]
  rw [loQ_at _ hsz hsz2, hiQ_at _ hsz hsz2]
  exact bounds_of_mem hmem

/-- **A node from its pieces**: if the pieces cover the fibre space modulo the symmetries and
every piece passes its constrained check on its grid, then `Ψ(s) − capPad ≤ c`. -/
theorem pot_le_of_pieces (r : Grothe.Lower.Row) (Rg : Grothe.Lower.Sym2) (s c : ℚ)
    (ds : List (List ℚ)) (P : List (Recipe × (ℕ × ℕ × ℚ) × Tables × List Cons))
    (hT : ∀ x ∈ P, TablesOK x.2.1.1 x.2.1.2.1 x.2.1.2.2 x.2.2.1)
    (hG : ∀ x ∈ P, 0 < x.2.1.2.2 ∧ 0 < x.2.1.2.1 ∧ 0 < x.2.1.1)
    (hcov : capCoverOK ds (P.map fun x => x.2.2.2) = true)
    (hchk : ∀ x ∈ P, nodeOKc r Rg s c x.1 x.2.1.1 x.2.1.2.1 x.2.1.2.2 x.2.2.1 x.2.2.2 = true) :
    pot r.E Rg r.ell r.beta (aFib r.b1 r.b2 r.b3) s - Grothe.Lower.capPad ≤ c := by
  have : pot r.E Rg r.ell r.beta (aFib r.b1 r.b2 r.b3) s ≤ c + Grothe.Lower.capPad := by
    refine ciSup_le fun y => ?_
    obtain ⟨pc, hpc, hy⟩ := capCover_sound r.E Rg hcov y
    obtain ⟨x, hx, rfl⟩ := List.mem_map.1 hpc
    obtain ⟨hh, hN, hNr⟩ := hG x hx
    refine Jpot_le_of_mem_symOrbit r.E Rg r.ell r.beta _ (aFib_cj _ _ _) (aFib_ng _ _ _) s _ _
      (fun w hw => ?_) hy
    have := Jpot_le_of_nodeOKc r Rg s c x.1 _ _ _ _ x.2.2.2 (hT x hx) hh hN hNr (hchk x hx) w hw
    linarith
  linarith

end

end Grothe.LowerAnalytic
