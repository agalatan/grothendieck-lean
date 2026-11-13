import Grothe.UpperQuad.TwistLoopSound
import Grothe.UpperQuad.PortFacts.Common
import Grothe.UpperQuad.WatsonSeed

/-!
# From the port facts to the exact Gauss sums

The range facts `rangeFact j lo hi t` (the node loop over `[lo, hi)` lies in the committed table
`t`) and the final fact `finalFact j bounds ts num den eps` (the ranges tile the partition; the
checks on the sum of the tables) of `Grothe/UpperQuad/PortFacts/Common.lean` give, by
`twistSpecs_sound`:

* `gaussI_ge_of_facts`: the exact Gauss–Legendre `I_j`-sum over the whole partition,
  `Σ_n nodeITerm`, is at least `num / den`;
* `gaussLow_sq_le_of_facts`: the squared distances of the exact low-band Gauss sums
  `Σ_n nodeLowTerm` from the center's coefficients add up to at most `eps / 2^{4 KOut}`.

Besides the facts, the statements use two finite checks that the facts do not contain: the
degree bound of master's phase terms (`PhaseDegOK`) and the table flags `twistTablesValid`.

Agent-ID: claude-b9ee. Refs #41, #313.
-/

namespace Grothe.UpperQuad

open GrotheQuad Grothe.UpperChaos Grothe.UpperQuad.PortFacts

noncomputable section

/-! ### Tables -/

lemma memSc_of_pairWithin {K : ℕ} {x : ℝ} {a b : ℤ × ℤ} (hx : memSc K x a)
    (h : pairWithin a b = true) : memSc K x b := by
  unfold pairWithin at h
  simp only [Bool.and_eq_true, decide_eq_true_eq] at h
  have h1 : (b.1 : ℝ) ≤ a.1 := by exact_mod_cast h.1
  have h2 : (a.2 : ℝ) ≤ b.2 := by exact_mod_cast h.2
  exact ⟨h1.trans hx.1, hx.2.trans h2⟩

lemma accOK_of_within {Q : ℕ} {I : ℝ} {L : ℕ → ℕ → ℕ → ℝ} {acc tab : TwAcc}
    (hacc : AccOK Q I L acc) (h : accWithin Q acc tab = true) : AccOK Q I L tab := by
  unfold accWithin at h
  simp only [Bool.and_eq_true, List.all_eq_true, List.mem_range] at h
  exact ⟨memSc_of_pairWithin hacc.1 h.1, fun q c d hq hc hd =>
    memSc_of_pairWithin (hacc.2 q c d hq hc hd) (h.2 q hq c hc d hd)⟩

lemma accOK_accAdd {Q : ℕ} {I₁ I₂ : ℝ} {L₁ L₂ : ℕ → ℕ → ℕ → ℝ} {a b : TwAcc}
    (ha : AccOK Q I₁ L₁ a) (hb : AccOK Q I₂ L₂ b) :
    AccOK Q (I₁ + I₂) (fun q c d => L₁ q c d + L₂ q c d) (accAdd Q a b) := by
  refine ⟨memSc_addPair ha.1 hb.1, fun q c d hq hc hd => ?_⟩
  have e : lowGet (accAdd Q a b).low q c d = addPair (lowGet a.low q c d) (lowGet b.low q c d) := by
    unfold accAdd lowGet
    simp only [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn, hq, hc, hd, ↓reduceDIte,
      Option.getD_some]
  rw [e]
  exact memSc_addPair (ha.2 q c d hq hc hd) (hb.2 q c d hq hc hd)

/-! ### The tiling of the partition -/

/-- The phase terms of master have total degree at most 17 (a finite check on `phaseTerms`). -/
def PhaseDegOK : Prop := ∀ t ∈ phaseTerms, t.1.1 + t.1.2.1 + t.1.2.2 ≤ 17

lemma termsOK_phaseArr (hdeg : PhaseDegOK) : TermsOK phaseArr := termsOK_phaseTermArr hdeg

lemma tablesOK (j : ℕ) (hdeg : PhaseDegOK)
    (htv : twistTablesValid P0 (twistParams j) (tables j) = true) :
    TwistTablesOK P0 (twistParams j) (tables j) :=
  twistTables_ok P0 (twistParams j) phaseArr (centerInts j) (termsOK_phaseArr hdeg) htv

/-- The exact `I`-term and low-band terms of a list of node specs for the power `j`. -/
def specsI (j : ℕ) (specs : List NodeSpec) : ℝ :=
  (specs.map fun nd => nodeITerm (twistParams j) (centerInts j) (nodeSR nd) (nodeWR nd)).sum

def specsLow (j : ℕ) (specs : List NodeSpec) (q c d : ℕ) : ℝ :=
  (specs.map fun nd => nodeLowTerm (twistParams j) (nodeSR nd) (nodeWR nd) q c d).sum

/-- One range fact: the table of the range encloses the exact sums of its nodes. -/
lemma accOK_of_rangeFact (j : ℕ) (hj : j = 1 ∨ j = 2 ∨ j = 3) (hdeg : PhaseDegOK)
    (htv : twistTablesValid P0 (twistParams j) (tables j) = true) {lo hi : ℕ} {t : PartialTable}
    (h : rangeFact j lo hi t = true) :
    AccOK (qlow j) (specsI j (rangeSpecs lo hi)) (specsLow j (rangeSpecs lo hi))
      (t.toAcc (qlow j)) := by
  obtain ⟨hpv, acc, hacc, hwithin⟩ := rangeFact_spec h
  have h0 := accOK_zero (qlow j)
  have hs := twistSpecs_sound P0 (by decide) mem_piI (Grothe.UpperQuad.Watson.watsonHyp 70)
    profile_agrees hpv
    (paramsOK_twistParams j hj) (tablesOK j hdeg htv) (rangeSpecs lo hi) h0 hacc
  simp only [zero_add] at hs
  exact accOK_of_within hs hwithin

/-- A weakly increasing chain of boundaries. -/
def ChainLe : ℕ → List ℕ → Prop
  | _, [] => True
  | b, c :: l => b ≤ c ∧ ChainLe c l

lemma chainLe_getLast : ∀ (b : ℕ) (l : List ℕ), ChainLe b l → b ≤ (b :: l).getLast (by simp)
  | _, [], _ => le_rfl
  | b, c :: l, h => by
    rw [List.getLast_cons (by simp)]
    exact h.1.trans (chainLe_getLast c l h.2)

lemma chainLe_of_zip : ∀ (b : ℕ) (l : List ℕ),
    (((b :: l).zip (b :: l).tail).all fun p => decide (p.1 ≤ p.2)) = true → ChainLe b l
  | _, [], _ => trivial
  | b, c :: l, h => by
    simp only [List.tail_cons, List.zip_cons_cons, List.all_cons, Bool.and_eq_true,
      decide_eq_true_eq] at h
    exact ⟨h.1, chainLe_of_zip c l (by simpa using h.2)⟩

/-- The range sums along a chain of boundaries add up to the sum over the outer range. -/
lemma accOK_foldl_tables (j : ℕ) (hj : j = 1 ∨ j = 2 ∨ j = 3) (hdeg : PhaseDegOK)
    (htv : twistTablesValid P0 (twistParams j) (tables j) = true) :
    ∀ (ts : List PartialTable) (b0 : ℕ) (bs : List ℕ), bs.length = ts.length →
      ChainLe b0 bs →
      (∀ r, r < ts.length → rangeFact j ((b0 :: bs).getD r 0) ((b0 :: bs).getD (r + 1) 0)
        (ts.getD r default) = true) →
      ∀ {I : ℝ} {L : ℕ → ℕ → ℕ → ℝ} {acc : TwAcc}, AccOK (qlow j) I L acc →
        AccOK (qlow j) (I + specsI j (rangeSpecs b0 ((b0 :: bs).getLast (by simp))))
          (fun q c d => L q c d + specsLow j (rangeSpecs b0 ((b0 :: bs).getLast (by simp))) q c d)
          (ts.foldl (fun acc t => accAdd (qlow j) acc (t.toAcc (qlow j))) acc) := by
  intro ts
  induction ts with
  | nil =>
    intro b0 bs hlen _ _ I L acc hacc
    obtain rfl : bs = [] := List.eq_nil_of_length_eq_zero hlen
    simp only [List.getLast_singleton, List.foldl_nil]
    rw [show rangeSpecs b0 b0 = [] by simp [rangeSpecs]]
    simpa [specsI, specsLow] using hacc
  | cons t ts ih =>
    intro b0 bs hlen hchain hfacts I L acc hacc
    obtain ⟨b1, bs', rfl⟩ : ∃ b1 bs', bs = b1 :: bs' := by
      cases bs with
      | nil => simp at hlen
      | cons b1 bs' => exact ⟨b1, bs', rfl⟩
    obtain ⟨h01, hchain'⟩ := hchain
    have hr0 := accOK_of_rangeFact j hj hdeg htv (hfacts 0 (by simp))
    simp only [List.getD_cons_zero, List.getD_cons_succ] at hr0
    have hstep := accOK_accAdd hacc hr0
    have hrest := ih b1 bs' (by simpa using hlen) hchain'
      (fun r hr => by simpa using hfacts (r + 1) (by simp; omega)) hstep
    rw [List.foldl_cons]
    have hlast : (b0 :: b1 :: bs').getLast (by simp) = (b1 :: bs').getLast (by simp) :=
      List.getLast_cons (by simp)
    have hle : b1 ≤ (b1 :: bs').getLast (by simp) := chainLe_getLast b1 bs' hchain'
    rw [hlast, ← rangeSpecs_append h01 hle]
    simpa only [specsI, specsLow, List.map_append, List.sum_append, ← add_assoc] using hrest

/-- **The facts of the power `j`**: the sum of the committed tables encloses the exact Gauss sums of
the whole partition, and it passes the two checks. -/
theorem accOK_of_facts (j : ℕ) (hj : j = 1 ∨ j = 2 ∨ j = 3) (hdeg : PhaseDegOK)
    (htv : twistTablesValid P0 (twistParams j) (tables j) = true) {bounds : List ℕ}
    {ts : List PartialTable} {num : ℤ} {den : ℕ} {eps : ℤ}
    (hfin : finalFact j bounds ts num den eps = true)
    (hr : ∀ r, r < ts.length →
      rangeFact j (bounds.getD r 0) (bounds.getD (r + 1) 0) (ts.getD r default) = true) :
    AccOK (qlow j) (specsI j partitionSpecs) (specsLow j partitionSpecs) (sumTables (qlow j) ts) ∧
      iPartialOK (sumTables (qlow j) ts) num den = true ∧
      lowBandOK (sumTables (qlow j) ts) (centerInts j) (twistParams j).E (qlow j) eps = true := by
  obtain ⟨htiles, hlen, hI, hL⟩ := finalFact_spec hfin
  refine ⟨?_, hI, hL⟩
  unfold tiles at htiles
  simp only [Bool.and_eq_true, beq_iff_eq] at htiles
  obtain ⟨⟨hhead, hlast⟩, hzip⟩ := htiles
  obtain ⟨bs, rfl⟩ : ∃ bs, bounds = 0 :: bs := by
    cases bounds with
    | nil => simp at hhead
    | cons b bs =>
      simp only [List.head?_cons, Option.some.injEq] at hhead
      exact ⟨bs, by rw [hhead]⟩
  have hchain := chainLe_of_zip 0 bs hzip
  have hl : (0 :: bs).getLast (by simp) = partitionSpecs.length := by
    rw [List.getLast?_eq_some_getLast (by simp)] at hlast
    simpa using hlast
  have h := accOK_foldl_tables j hj hdeg htv ts 0 bs (by simp at hlen; omega) hchain hr
    (accOK_zero (qlow j))
  rw [hl, show rangeSpecs 0 partitionSpecs.length = partitionSpecs by simp [rangeSpecs]] at h
  unfold sumTables
  simpa only [zero_add] using h

lemma foldl_add_sum3 (Q : ℕ) (f : ℕ → ℕ → ℕ → ℤ) (s0 : ℤ) :
    (List.range Q).foldl (fun s q => (List.range (q + 2)).foldl (fun s c =>
      (List.range (q + 1)).foldl (fun s d => s + f q c d) s) s) s0 =
      s0 + ∑ q ∈ Finset.range Q, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
        f q c d := by
  have h1 : ∀ (n : ℕ) (g : ℕ → ℤ) (s : ℤ),
      (List.range n).foldl (fun s d => s + g d) s = s + ∑ d ∈ Finset.range n, g d := by
    intro n g s
    induction n generalizing s with
    | zero => simp
    | succ n ih => rw [List.range_succ (n := n), List.foldl_append, List.foldl_cons,
        List.foldl_nil, ih, Finset.sum_range_succ, add_assoc]
  have h2 : ∀ (q m : ℕ) (s : ℤ), (List.range m).foldl (fun s c =>
      (List.range (q + 1)).foldl (fun s d => s + f q c d) s) s =
      s + ∑ c ∈ Finset.range m, ∑ d ∈ Finset.range (q + 1), f q c d := by
    intro q m
    induction m with
    | zero => simp
    | succ n ih =>
      intro s
      rw [List.range_succ (n := n), List.foldl_append, List.foldl_cons, List.foldl_nil, ih, h1,
        Finset.sum_range_succ (n := n), add_assoc]
  induction Q generalizing s0 with
  | zero => simp
  | succ Q ih => rw [List.range_succ (n := Q), List.foldl_append, List.foldl_cons, List.foldl_nil,
      ih, h2, Finset.sum_range_succ (n := Q), add_assoc]

/-- `lowBandOK`: the squared distances of the enclosed values from the center add up to at most
`eps / 2^{4 KOut}`. -/
theorem lowBandOK_sound {Qlow E : ℕ} (hE : E ≤ 2 * KOut) {acc : TwAcc} {L : ℕ → ℕ → ℕ → ℝ}
    (hL : ∀ q c d, q < Qlow → c < q + 2 → d < q + 1 →
      memSc (2 * KOut) (L q c d) (lowGet acc.low q c d))
    {center : Array ℤ} {eps : ℤ} (h : lowBandOK acc center E Qlow eps = true) :
    ∑ q ∈ Finset.range Qlow, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
      (L q c d - centerR center E q c d) ^ 2 ≤ (eps : ℝ) / 2 ^ (4 * KOut) := by
  unfold lowBandOK lowBandExcursionSq at h
  rw [foldl_add_sum3, zero_add] at h
  have h' : ((∑ q ∈ Finset.range Qlow, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
      (excursionTw (lowGet acc.low q c d)
        (center.getD (gradedFlat q c d) 0 * pow2 (2 * KOut - E))) ^ 2 : ℤ) : ℝ) ≤ eps := by
    exact_mod_cast (decide_eq_true_iff.mp h)
  have hpos : (0 : ℝ) < (2 : ℝ) ^ (4 * KOut) := by positivity
  rw [le_div_iff₀ hpos]
  push_cast at h'
  refine le_trans ?_ h'
  rw [Finset.sum_mul]
  refine Finset.sum_le_sum fun q hq => ?_
  rw [Finset.sum_mul]
  refine Finset.sum_le_sum fun c hc => ?_
  rw [Finset.sum_mul]
  refine Finset.sum_le_sum fun d hd => ?_
  simp only [Finset.mem_range] at hq hc hd
  have hb := abs_sub_le_excursionTw (hL q c d hq hc hd)
    (center.getD (gradedFlat q c d) 0 * pow2 (2 * KOut - E))
  rw [centerR_eq_scaled center hE] at hb
  have h2K : (2 : ℝ) ^ (4 * KOut) = ((2 : ℝ) ^ (2 * KOut)) ^ 2 := by rw [← pow_mul]; ring_nf
  rw [h2K, ← mul_pow]
  have hp2 : (0 : ℝ) < 2 ^ (2 * KOut) := by positivity
  have hx : |(L q c d - centerR center E q c d) * 2 ^ (2 * KOut)| ≤
      (excursionTw (lowGet acc.low q c d) (center.getD (gradedFlat q c d) 0 *
        pow2 (2 * KOut - E)) : ℝ) := by
    rw [abs_mul, abs_of_pos hp2]
    rwa [le_div_iff₀ hp2] at hb
  simpa using sq_le_sq' (abs_le.mp hx).1 (abs_le.mp hx).2

end

end Grothe.UpperQuad
