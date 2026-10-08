import Grothe.Lower.Gates
import Grothe.Lower.Moment
import Grothe.Lower.Chords

/-!
# Profiles: data types, the exact checker, and its soundness

A *profile* of the Gaussian witness at the source parameter `ε₀` consists of the forcing
parameters `(ℓ, β)`, the penalty parameter `δ`, the even/odd blocks `(M_E, M_R)` and a cap `C`
on its normalized-moment bound.  Four kinds of profiles are certified:

* kind `0`, *source profiles*: node caps `(r, cap)` of the potential (Gaussian enclosure
  hypothesis), global physical polynomials dominating the chords of the nodes
  (`DominatesChords`), and a moment cover (`MomentBound`);
* kind `1`, *averaged profiles*: the average with weight `w` of two sources shifted by
  `(deᵢ, dbᵢ)`, `(deⱼ, dbⱼ)`; its nodes are averages of side nodes (indices into the source or
  dense node tables, or inline side caps of the shifted sources) minus the variance gain
  `g = 2w(1−w)(βᵢ + dbᵢ − βⱼ − dbⱼ)²/ε₀`, with own polynomials, chords and moment cover;
* kind `2`, *pointwise joins*: the average of two averaged profiles whose nodes are allocated
  on the parents' chords, `w s₁ + (1−w) s₂ = r`, `cap ≥ w chordᵢ(s₁) + (1−w) chordⱼ(s₂) − g`;
* kind `3`, *shared-moment joins*: the average of two profiles whose moment cover uses the
  pair polynomials `k ↦ w a^k p₁ₖ + (1−w) b^k p₂ₖ` (gain subtracted from the constant term),
  `w a + (1−w) b = 1`, with its own penalty parameter `δ`.

`checkProfile` verifies one profile against the earlier ones (parents precede their joins);
`profileSound_of_check` turns a successful run into the real statement `ProfileSound`.
-/

namespace Grothe.Lower

structure Profile where
  id : String
  kind : ℕ
  i : ℕ
  j : ℕ
  w : ℚ
  dei : ℚ
  dbi : ℚ
  dej : ℚ
  dbj : ℚ
  ell : ℚ
  beta : ℚ
  delta : ℚ
  E : Sym3
  R : Sym2
  gain : ℚ
  cap : ℚ
  /-- kind `1` only: `0` source-node indices, `1` dense-node indices, `2` inline side caps -/
  nodeKind : ℕ
  /-- nodes `r:cap;…` -/
  nodes : String
  /-- node provenance per node: `ia:ib` (tables), `ra:ca:rb:cb` (inline), `s1:s2:ja:jb` (join) -/
  nodeSrc : String
  /-- chord certificate cells `hi:idx;…` -/
  cellSets : List String
  /-- physical polynomials `c0,…,c6;…` -/
  polys : String
  /-- cell-set index of each polynomial -/
  polyCert : List ℕ
  /-- kind `3` only: polynomial pairs `ki:kj:a:b;…` -/
  pairs : String
  /-- moment rectangles `slo:shi:xlo:xhi:k;…` -/
  boxes : String
  /-- column edges of the sweep cover `e;…` -/
  edges : String
  gates : GateCert
  deriving Repr

/-- Context: the profiles (parents precede their joins) and the dense node tables. -/
structure Ctx where
  profiles : List Profile
  dense : List (List (ℚ × ℚ))

def dfltProfile : Profile :=
  ⟨"", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ⟨0, 0, 0, 0, 0, 0⟩, ⟨0, 0, 0⟩, 0, 0, 0, "", "", [], "", [],
    "", "", "", dfltGate⟩

def Ctx.prof (C : Ctx) (n : ℕ) : Profile := C.profiles.getD n dfltProfile

/-! ### Parsing -/

def parseNode (s : String) : ℚ × ℚ :=
  match s.splitOn ":" with
  | [a, b] => (parseQ a, parseQ b)
  | _ => (0, 0)

def parseNodes (s : String) : List (ℚ × ℚ) := if s = "" then [] else (s.splitOn ";").map parseNode

def parsePair (s : String) : ℕ × ℕ × ℚ × ℚ :=
  match s.splitOn ":" with
  | [a, b, c, d] => (a.toNat!, b.toNat!, parseQ c, parseQ d)
  | _ => (0, 0, 0, 0)

def parsePairs (s : String) : List (ℕ × ℕ × ℚ × ℚ) :=
  if s = "" then [] else (s.splitOn ";").map parsePair

def Profile.nodeList (p : Profile) : List (ℚ × ℚ) := parseNodes p.nodes
def Profile.polyList (p : Profile) : List (List ℚ) := parsePolys p.polys
def Profile.pairList (p : Profile) : List (ℕ × ℕ × ℚ × ℚ) := parsePairs p.pairs
def Profile.boxList (p : Profile) : List RBox := parseBoxes p.boxes

def nodesSorted : List (ℚ × ℚ) → Bool
  | a :: b :: rest => decide (a.1 < b.1) && nodesSorted (b :: rest)
  | _ => true

/-! ### Pair polynomials of a shared-moment join -/

/-- `k ↦ w a^k p₁ₖ + (1−w) b^k p₂ₖ`, the gain subtracted from the constant term. -/
def jointPoly (w a b gain : ℚ) (p1 p2 : List ℚ) : List ℚ :=
  [w * coeffL p1 0 + (1 - w) * coeffL p2 0 - gain,
   w * coeffL p1 1 * a + (1 - w) * coeffL p2 1 * b,
   w * coeffL p1 2 * a ^ 2 + (1 - w) * coeffL p2 2 * b ^ 2,
   w * coeffL p1 3 * a ^ 3 + (1 - w) * coeffL p2 3 * b ^ 3,
   w * coeffL p1 4 * a ^ 4 + (1 - w) * coeffL p2 4 * b ^ 4,
   w * coeffL p1 5 * a ^ 5 + (1 - w) * coeffL p2 5 * b ^ 5,
   w * coeffL p1 6 * a ^ 6 + (1 - w) * coeffL p2 6 * b ^ 6]

/-- The pair polynomial evaluates to the weighted parent values at the scaled arguments. -/
lemma jointPoly_eval (w a b gain : ℚ) (p1 p2 : List ℚ) (h1 : p1.length = 7) (h2 : p2.length = 7)
    (σ : ℝ) :
    evalL ((jointPoly w a b gain p1 p2).map ((↑) : ℚ → ℝ)) σ
      = w * evalL (p1.map ((↑) : ℚ → ℝ)) (a * σ) + (1 - w) * evalL (p2.map ((↑) : ℚ → ℝ)) (b * σ)
        - gain := by
  rw [evalL_map_cast p1, evalL_map_cast p2, h1, h2]
  simp only [jointPoly, List.map_cons, List.map_nil, evalL, Finset.sum_range_succ,
    Finset.sum_range_zero]
  push_cast
  ring

/-- The effective polynomials of profile `n`: the pair polynomials of a shared-moment join, its
own physical polynomials otherwise. -/
def Ctx.effPolys (C : Ctx) (n : ℕ) : List (List ℚ) :=
  let p := C.prof n
  if p.kind = 3 then
    p.pairList.map fun pr =>
      jointPoly p.w pr.2.2.1 pr.2.2.2 p.gain ((C.prof p.i).polyList.getD pr.1 [])
        ((C.prof p.j).polyList.getD pr.2.1 [])
  else p.polyList

/-! ### Node provenance -/

/-- The side node table of an averaged profile: source nodes or dense nodes. -/
def Ctx.table (C : Ctx) (nk i : ℕ) : List (ℚ × ℚ) :=
  if nk = 0 then (C.prof i).nodeList else C.dense.getD i []

def checkNodeAvg (p : Profile) (ta tb : List (ℚ × ℚ)) (n : ℚ × ℚ) (src : String) : Bool :=
  let parts := src.splitOn ":"
  if p.nodeKind = 2 then
    let ra := parseQ (parts.getD 0 ""); let ca := parseQ (parts.getD 1 "")
    let rb := parseQ (parts.getD 2 ""); let cb := parseQ (parts.getD 3 "")
    decide (0 ≤ ra) && decide (0 ≤ rb) &&
    (n == (p.w * ra + (1 - p.w) * rb, p.w * ca + (1 - p.w) * cb - p.gain))
  else
    let ia := (parts.getD 0 "").toNat!; let ib := (parts.getD 1 "").toNat!
    decide (ia < ta.length) && decide (ib < tb.length) &&
    (let a := ta.getD ia (0, 0); let b := tb.getD ib (0, 0)
     n == (p.w * a.1 + (1 - p.w) * b.1, p.w * a.2 + (1 - p.w) * b.2 - p.gain))

/-- A node of an averaged profile is the average of two side nodes minus the gain: entries of
the side tables, or (for shifted sources) inline side caps. -/
def NodeAvgOK (C : Ctx) (p : Profile) (n : ℚ × ℚ) : Prop :=
  (p.nodeKind ≠ 2 ∧ ∃ a ∈ C.table p.nodeKind p.i, ∃ b ∈ C.table p.nodeKind p.j,
      n = (p.w * a.1 + (1 - p.w) * b.1, p.w * a.2 + (1 - p.w) * b.2 - p.gain)) ∨
  (p.nodeKind = 2 ∧ ∃ ra ca rb cb : ℚ, 0 ≤ ra ∧ 0 ≤ rb ∧
      n = (p.w * ra + (1 - p.w) * rb, p.w * ca + (1 - p.w) * cb - p.gain))

lemma nodeAvgOK_of_check (C : Ctx) (p : Profile) (n : ℚ × ℚ) (src : String)
    (h : checkNodeAvg p (C.table p.nodeKind p.i) (C.table p.nodeKind p.j) n src = true) :
    NodeAvgOK C p n := by
  unfold checkNodeAvg at h
  split_ifs at h with hk
  · simp only [Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at h
    obtain ⟨⟨ha, hb⟩, hn⟩ := h
    exact Or.inr ⟨hk, _, _, _, _, ha, hb, hn⟩
  · simp only [Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at h
    obtain ⟨⟨hia, hib⟩, hn⟩ := h
    exact Or.inl ⟨hk, _, getD_mem_of_lt _ _ _ hia, _, getD_mem_of_lt _ _ _ hib, hn⟩

def activeQ (sp : Support) (s : ℚ) : Bool :=
  decide (sp.left ≤ s) && (match sp.right with | none => true | some r => decide (s ≤ r))

def valQ (sp : Support) (s : ℚ) : ℚ := sp.c0 + sp.c1 * s

lemma activeQ_sound (sp : Support) (s : ℚ) (h : activeQ sp s = true) : sp.Active (s : ℝ) := by
  simp only [activeQ, Bool.and_eq_true, decide_eq_true_eq] at h
  refine ⟨by exact_mod_cast h.1, fun r hr => ?_⟩
  have := h.2
  rw [hr] at this
  simp only [decide_eq_true_eq] at this
  exact_mod_cast this

lemma valQ_cast (sp : Support) (s : ℚ) : ((valQ sp s : ℚ) : ℝ) = sp.val (s : ℝ) := by
  simp [valQ, Support.val]

def checkNodePw (w gain : ℚ) (supA supB : List Support) (n : ℚ × ℚ) (src : String) : Bool :=
  let parts := src.splitOn ":"
  let s1 := parseQ (parts.getD 0 ""); let s2 := parseQ (parts.getD 1 "")
  let ja := (parts.getD 2 "").toNat!; let jb := (parts.getD 3 "").toNat!
  let spA := supA.getD ja dfltSupport; let spB := supB.getD jb dfltSupport
  decide (0 ≤ s1) && decide (0 ≤ s2) && (w * s1 + (1 - w) * s2 == n.1) &&
  decide (ja < supA.length) && decide (jb < supB.length) && activeQ spA s1 && activeQ spB s2 &&
  decide (w * valQ spA s1 + (1 - w) * valQ spB s2 - gain ≤ n.2)

/-- A node of a pointwise join is allocated on active chord supports of the two parents. -/
def NodePwOK (C : Ctx) (p : Profile) (n : ℚ × ℚ) : Prop :=
  ∃ s1 s2 : ℚ, 0 ≤ s1 ∧ 0 ≤ s2 ∧ p.w * s1 + (1 - p.w) * s2 = n.1 ∧
    ∃ spA ∈ supportsOf (C.prof p.i).nodeList, spA.Active (s1 : ℝ) ∧
    ∃ spB ∈ supportsOf (C.prof p.j).nodeList, spB.Active (s2 : ℝ) ∧
      (p.w : ℝ) * spA.val s1 + (1 - p.w) * spB.val s2 - p.gain ≤ n.2

lemma nodePwOK_of_check (C : Ctx) (p : Profile) (n : ℚ × ℚ) (src : String)
    (h : checkNodePw p.w p.gain (supportsOf (C.prof p.i).nodeList)
      (supportsOf (C.prof p.j).nodeList) n src = true) : NodePwOK C p n := by
  simp only [checkNodePw, Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at h
  obtain ⟨⟨⟨⟨⟨⟨⟨h1, h2⟩, h3⟩, hja⟩, hjb⟩, hA⟩, hB⟩, hv⟩ := h
  refine ⟨_, _, h1, h2, h3, _, getD_mem_of_lt _ _ _ hja, activeQ_sound _ _ hA, _,
    getD_mem_of_lt _ _ _ hjb, activeQ_sound _ _ hB, ?_⟩
  have := (Rat.cast_le (K := ℝ)).2 hv
  push_cast [valQ_cast] at this
  exact this

/-! ### The checker -/

def noShift (p : Profile) : Bool := p.dei == 0 && p.dbi == 0 && p.dej == 0 && p.dbj == 0

def NoShift (p : Profile) : Prop := p.dei = 0 ∧ p.dbi = 0 ∧ p.dej = 0 ∧ p.dbj = 0

def checkParams (C : Ctx) (n : ℕ) : Bool :=
  let p := C.prof n
  let pi := C.prof p.i
  let pj := C.prof p.j
  decide (p.kind ≤ 3) &&
  decide (0 < p.delta) && decide (p.delta < ε₀) && decide (0 ≤ p.beta) &&
  decide (2 * p.beta ≤ p.ell) && checkGates ε₀ p.E p.R p.delta p.gates &&
  (p.kind == 0 ||
    (decide (p.i < n) && decide (p.j < n) && (p.i != p.j) && decide (0 < p.w) && decide (p.w < 1) &&
     (p.ell == p.w * pi.ell + (1 - p.w) * pj.ell + (p.w * p.dei + (1 - p.w) * p.dej)) &&
     (p.beta == p.w * pi.beta + (1 - p.w) * pj.beta + (p.w * p.dbi + (1 - p.w) * p.dbj)) &&
     (p.E == Sym3.avg p.w pi.E pj.E) && (p.R == Sym2.avg p.w pi.R pj.R) &&
     (p.gain == 2 * p.w * (1 - p.w) * (pi.beta + p.dbi - pj.beta - p.dbj) ^ 2 / ε₀) &&
     decide (0 ≤ pi.beta + p.dbi) && decide (2 * (pi.beta + p.dbi) ≤ pi.ell + p.dei) &&
     decide (0 ≤ pj.beta + p.dbj) && decide (2 * (pj.beta + p.dbj) ≤ pj.ell + p.dej) &&
     ((p.kind == 1 && pi.kind == 0 && pj.kind == 0 && (p.nodeKind == 2 || noShift p)) ||
      (p.kind == 2 && pi.kind == 1 && pj.kind == 1 && noShift p) ||
      (p.kind == 3 && pi.kind != 3 && pj.kind != 3 && noShift p))))

def checkNodes (C : Ctx) (p : Profile) : Bool :=
  let nodes := p.nodeList
  let srcs := p.nodeSrc.splitOn ";"
  (nodes.head?.map Prod.fst == some 0) && nodesSorted nodes &&
  (p.kind == 0 ||
    ((nodes.length == srcs.length) &&
     (if p.kind = 2 then
        let supA := supportsOf (C.prof p.i).nodeList
        let supB := supportsOf (C.prof p.j).nodeList
        (List.zip nodes srcs).all fun ns => checkNodePw p.w p.gain supA supB ns.1 ns.2
      else
        let ta := C.table p.nodeKind p.i
        let tb := C.table p.nodeKind p.j
        (List.zip nodes srcs).all fun ns => checkNodeAvg p ta tb ns.1 ns.2)))

def checkChords (p : Profile) : Bool :=
  let nodes := p.nodeList
  let polys := p.polyList
  let tail := (nodes.getLast?.map Prod.fst).getD 0
  (polys.length == p.polyCert.length) &&
  (List.zip polys p.polyCert).all fun pc =>
    polyValid pc.1 && decide (pc.2 < p.cellSets.length) &&
    checkPhysical nodes pc.1 ⟨tail, nodes.length - 1, p.cellSets.getD pc.2 ""⟩

def checkPairs (C : Ctx) (p : Profile) : Bool :=
  p.pairList.all fun pr =>
    decide (0 ≤ pr.2.2.1) && decide (0 ≤ pr.2.2.2) && (p.w * pr.2.2.1 + (1 - p.w) * pr.2.2.2 == 1) &&
    decide (pr.1 < (C.prof p.i).polyList.length) && decide (pr.2.1 < (C.prof p.j).polyList.length) &&
    polyValid ((C.prof p.i).polyList.getD pr.1 []) && polyValid ((C.prof p.j).polyList.getD pr.2.1 [])

def checkProfile (C : Ctx) (n : ℕ) : Bool :=
  let p := C.prof n
  checkParams C n &&
  (if p.kind = 3 then checkPairs C p else checkNodes C p && checkChords p) &&
  checkMoment (C.effPolys n) p.delta p.cap p.boxList (parseEdges p.edges)

/-- All profiles of a context, checked in parallel. -/
def checkProfiles (C : Ctx) : Bool :=
  ((List.range C.profiles.length).map fun n => Task.spawn fun _ => checkProfile C n).all Task.get

/-! ### Soundness -/

/-- The relations of a join or averaged profile to its two parents. -/
structure ParentsOK (C : Ctx) (n : ℕ) : Prop where
  i_lt : (C.prof n).i < n
  j_lt : (C.prof n).j < n
  ne : (C.prof n).i ≠ (C.prof n).j
  w_pos : 0 < (C.prof n).w
  w_lt : (C.prof n).w < 1
  ell_eq : (C.prof n).ell = (C.prof n).w * (C.prof (C.prof n).i).ell
    + (1 - (C.prof n).w) * (C.prof (C.prof n).j).ell
    + ((C.prof n).w * (C.prof n).dei + (1 - (C.prof n).w) * (C.prof n).dej)
  beta_eq : (C.prof n).beta = (C.prof n).w * (C.prof (C.prof n).i).beta
    + (1 - (C.prof n).w) * (C.prof (C.prof n).j).beta
    + ((C.prof n).w * (C.prof n).dbi + (1 - (C.prof n).w) * (C.prof n).dbj)
  E_eq : (C.prof n).E = Sym3.avg (C.prof n).w (C.prof (C.prof n).i).E (C.prof (C.prof n).j).E
  R_eq : (C.prof n).R = Sym2.avg (C.prof n).w (C.prof (C.prof n).i).R (C.prof (C.prof n).j).R
  gain_eq : (C.prof n).gain = 2 * (C.prof n).w * (1 - (C.prof n).w)
    * ((C.prof (C.prof n).i).beta + (C.prof n).dbi - (C.prof (C.prof n).j).beta - (C.prof n).dbj) ^ 2
    / ε₀
  side_i : 0 ≤ (C.prof (C.prof n).i).beta + (C.prof n).dbi ∧
    2 * ((C.prof (C.prof n).i).beta + (C.prof n).dbi) ≤ (C.prof (C.prof n).i).ell + (C.prof n).dei
  side_j : 0 ≤ (C.prof (C.prof n).j).beta + (C.prof n).dbj ∧
    2 * ((C.prof (C.prof n).j).beta + (C.prof n).dbj) ≤ (C.prof (C.prof n).j).ell + (C.prof n).dej
  kinds : ((C.prof n).kind = 1 ∧ (C.prof (C.prof n).i).kind = 0 ∧ (C.prof (C.prof n).j).kind = 0 ∧
      ((C.prof n).nodeKind = 2 ∨ NoShift (C.prof n))) ∨
    ((C.prof n).kind = 2 ∧ (C.prof (C.prof n).i).kind = 1 ∧ (C.prof (C.prof n).j).kind = 1 ∧
      NoShift (C.prof n)) ∨
    ((C.prof n).kind = 3 ∧ (C.prof (C.prof n).i).kind ≠ 3 ∧ (C.prof (C.prof n).j).kind ≠ 3 ∧
      NoShift (C.prof n))

/-- A polynomial pair of a shared-moment join: nonnegative scales with `w a + (1−w) b = 1`,
valid parent polynomials, and the evaluation identity of the pair polynomial. -/
def PairOK (C : Ctx) (p : Profile) (pr : ℕ × ℕ × ℚ × ℚ) : Prop :=
  0 ≤ pr.2.2.1 ∧ 0 ≤ pr.2.2.2 ∧ p.w * pr.2.2.1 + (1 - p.w) * pr.2.2.2 = 1 ∧
  pr.1 < (C.prof p.i).polyList.length ∧ pr.2.1 < (C.prof p.j).polyList.length ∧
  PolyValid ((C.prof p.i).polyList.getD pr.1 []) ∧ PolyValid ((C.prof p.j).polyList.getD pr.2.1 []) ∧
  ∀ σ : ℝ, evalL ((jointPoly p.w pr.2.2.1 pr.2.2.2 p.gain ((C.prof p.i).polyList.getD pr.1 [])
      ((C.prof p.j).polyList.getD pr.2.1 [])).map ((↑) : ℚ → ℝ)) σ
    = p.w * evalL (((C.prof p.i).polyList.getD pr.1 []).map ((↑) : ℚ → ℝ)) (pr.2.2.1 * σ)
      + (1 - p.w) * evalL (((C.prof p.j).polyList.getD pr.2.1 []).map ((↑) : ℚ → ℝ)) (pr.2.2.2 * σ)
      - p.gain

/-- Everything the checker certifies about profile `n`. -/
structure ProfileSound (C : Ctx) (n : ℕ) : Prop where
  kind_le : (C.prof n).kind ≤ 3
  delta_pos : 0 < (C.prof n).delta
  delta_lt : (C.prof n).delta < ε₀
  beta_nonneg : 0 ≤ (C.prof n).beta
  ell_ge : 2 * (C.prof n).beta ≤ (C.prof n).ell
  gates : GateProp ε₀ (C.prof n).E (C.prof n).R (C.prof n).delta
  parents : (C.prof n).kind ≠ 0 → ParentsOK C n
  nodes_first : (C.prof n).kind ≠ 3 → (C.prof n).nodeList.head?.map Prod.fst = some 0
  nodes_sorted : (C.prof n).kind ≠ 3 → nodesSorted (C.prof n).nodeList = true
  nodes_avg : (C.prof n).kind = 1 → ∀ nd ∈ (C.prof n).nodeList, NodeAvgOK C (C.prof n) nd
  nodes_pw : (C.prof n).kind = 2 → ∀ nd ∈ (C.prof n).nodeList, NodePwOK C (C.prof n) nd
  /-- Every physical polynomial is valid and dominates the chords of the nodes. -/
  polys : (C.prof n).kind ≠ 3 → ∀ pl ∈ (C.prof n).polyList,
    PolyValid pl ∧ DominatesChords (C.prof n).nodeList pl
  pairs : (C.prof n).kind = 3 → ∀ pr ∈ (C.prof n).pairList, PairOK C (C.prof n) pr
  /-- The moment bound `Jpw ≤ cap` on `[0, δρ] × [0, 31/4]` for the effective polynomials. -/
  cover : MomentBound (C.effPolys n) (C.prof n).delta (C.prof n).cap (C.prof n).boxList

lemma zip_mem_of_lt {α β : Type*} (l : List α) (m : List β) (hlen : l.length = m.length)
    (a : α) (ha : a ∈ l) : ∃ b ∈ m, (a, b) ∈ List.zip l m := by
  obtain ⟨i, hi, rfl⟩ := List.getElem_of_mem ha
  have hi' : i < m.length := hlen ▸ hi
  refine ⟨m[i], List.getElem_mem hi', ?_⟩
  exact List.mem_iff_getElem.2 ⟨i, by rw [List.length_zip]; exact lt_min hi hi', by simp⟩

lemma params_sound (C : Ctx) (n : ℕ) (h : checkParams C n = true) :
    (C.prof n).kind ≤ 3 ∧ 0 < (C.prof n).delta ∧ (C.prof n).delta < ε₀ ∧ 0 ≤ (C.prof n).beta ∧
    2 * (C.prof n).beta ≤ (C.prof n).ell ∧ GateProp ε₀ (C.prof n).E (C.prof n).R (C.prof n).delta ∧
    ((C.prof n).kind ≠ 0 → ParentsOK C n) := by
  simp only [checkParams, Bool.and_eq_true, Bool.or_eq_true, decide_eq_true_eq, beq_iff_eq,
    bne_iff_ne, ne_eq, noShift, and_assoc] at h
  obtain ⟨hk, hd0, hd1, hb0, hb1, hg, hrest⟩ := h
  refine ⟨hk, hd0, hd1, hb0, hb1, gateProp_of_check _ _ _ _ _ hg, fun hk0 => ?_⟩
  rcases hrest with hrest | hrest
  · exact absurd hrest hk0
  obtain ⟨hi, hj, hij, hw0, hw1, hell, hbeta, hE, hR, hgain, hsi1, hsi2, hsj1, hsj2, hkinds⟩ := hrest
  exact ⟨hi, hj, hij, hw0, hw1, hell, hbeta, hE, hR, hgain, ⟨hsi1, hsi2⟩, ⟨hsj1, hsj2⟩,
    by simpa only [NoShift, and_assoc, or_assoc, ne_eq] using hkinds⟩

lemma nodes_sound (C : Ctx) (p : Profile) (h : checkNodes C p = true) :
    p.nodeList.head?.map Prod.fst = some 0 ∧ nodesSorted p.nodeList = true ∧
    (p.kind = 1 → ∀ nd ∈ p.nodeList, NodeAvgOK C p nd) ∧
    (p.kind = 2 → ∀ nd ∈ p.nodeList, NodePwOK C p nd) := by
  simp only [checkNodes, Bool.and_eq_true, Bool.or_eq_true, beq_iff_eq] at h
  obtain ⟨⟨hfirst, hsorted⟩, hrest⟩ := h
  refine ⟨hfirst, hsorted, fun h1 => ?_, fun h2 => ?_⟩
  · rcases hrest with h0 | ⟨hlen, hall⟩
    · omega
    · rw [ite_eq_right (by omega)] at hall
      simp only [List.all_eq_true] at hall
      intro nd hnd
      obtain ⟨src, _, hmem⟩ := zip_mem_of_lt p.nodeList (p.nodeSrc.splitOn ";") hlen nd hnd
      exact nodeAvgOK_of_check C p nd src (hall (nd, src) hmem)
  · rcases hrest with h0 | ⟨hlen, hall⟩
    · omega
    · rw [ite_eq_left h2] at hall
      simp only [List.all_eq_true] at hall
      intro nd hnd
      obtain ⟨src, _, hmem⟩ := zip_mem_of_lt p.nodeList (p.nodeSrc.splitOn ";") hlen nd hnd
      exact nodePwOK_of_check C p nd src (hall (nd, src) hmem)

lemma chords_sound (p : Profile) (h : checkChords p = true) :
    ∀ pl ∈ p.polyList, PolyValid pl ∧ DominatesChords p.nodeList pl := by
  simp only [checkChords, Bool.and_eq_true, beq_iff_eq, List.all_eq_true] at h
  obtain ⟨hlen, hall⟩ := h
  intro pl hpl
  obtain ⟨c, _, hmem⟩ := zip_mem_of_lt p.polyList p.polyCert hlen pl hpl
  obtain ⟨⟨hv, _⟩, hc⟩ := hall (pl, c) hmem
  exact ⟨(polyValid_iff _).1 hv, dominates_of_check _ _ _ hc⟩

lemma pairs_sound (C : Ctx) (p : Profile) (h : checkPairs C p = true) :
    ∀ pr ∈ p.pairList, PairOK C p pr := by
  simp only [checkPairs, List.all_eq_true, Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at h
  intro pr hpr
  obtain ⟨⟨⟨⟨⟨⟨ha, hb⟩, hab⟩, hi⟩, hj⟩, hv1⟩, hv2⟩ := h pr hpr
  have hv1' := (polyValid_iff _).1 hv1
  have hv2' := (polyValid_iff _).1 hv2
  exact ⟨ha, hb, hab, hi, hj, hv1', hv2', fun σ => jointPoly_eval _ _ _ _ _ _ hv1'.1 hv2'.1 σ⟩

/-- **Soundness of the profile checker.** -/
theorem profileSound_of_check (C : Ctx) (n : ℕ) (h : checkProfile C n = true) :
    ProfileSound C n := by
  simp only [checkProfile, Bool.and_eq_true] at h
  obtain ⟨⟨hpar, hcontent⟩, hmom⟩ := h
  obtain ⟨hk, hd0, hd1, hb0, hb1, hg, hparents⟩ := params_sound C n hpar
  by_cases hk3 : (C.prof n).kind = 3
  · rw [ite_eq_left hk3] at hcontent
    exact ⟨hk, hd0, hd1, hb0, hb1, hg, hparents, fun h => absurd hk3 h, fun h => absurd hk3 h,
      fun h => by omega, fun h => by omega, fun h => absurd hk3 h,
      fun _ => pairs_sound C _ hcontent, moment_sound _ _ _ _ _ hmom⟩
  · rw [ite_eq_right hk3] at hcontent
    simp only [Bool.and_eq_true] at hcontent
    obtain ⟨hnodes, hchords⟩ := hcontent
    obtain ⟨hfirst, hsorted, havg, hpw⟩ := nodes_sound C _ hnodes
    exact ⟨hk, hd0, hd1, hb0, hb1, hg, hparents, fun _ => hfirst, fun _ => hsorted, havg, hpw,
      fun _ => chords_sound _ hchords, fun h => absurd h hk3, moment_sound _ _ _ _ _ hmom⟩

/-- **All profiles are sound** when the parallel check succeeds. -/
theorem profiles_sound_of_check (C : Ctx) (h : checkProfiles C = true) :
    ∀ n < C.profiles.length, ProfileSound C n := by
  intro n hn
  have hmem : Task.spawn (fun _ => checkProfile C n) ∈
      (List.range C.profiles.length).map fun n => Task.spawn fun _ => checkProfile C n :=
    List.mem_map.2 ⟨n, List.mem_range.2 hn, rfl⟩
  have := List.all_eq_true.1 h _ hmem
  exact profileSound_of_check C n this

end Grothe.Lower
