import Grothe.LowerAnalytic.SparseSteinSlabs
import Grothe.LowerAnalytic.AntiSteinRowSound

/-! # Using two selected chord tables on the same physical shape slab -/

namespace Grothe.LowerAnalytic.SparseStein

open MeasureTheory MvPolynomial Grothe.Lower CoupledStein

private def sourcesOK (l h : ℚ) (cells : List AntiSCell) (ex : List Extra) (p : Pick) : Bool :=
  let c := oldCell cells p
  decide (p.cell < cells.length ∧ c.sLo ≤ l ∧ h ≤ c.sHi) &&
    ((p.extra.bind fun i => ex[i]?).toList.all fun e => decide (e.lo ≤ l ∧ h ≤ e.hi))

private def scaleOK (c : AntiSCell) : Bool :=
  let pairs := c.snodes.zip c.snodes.tail
  chainTo (fun z => z.1.sigma) (fun z => z.2.sigma) 0 stop pairs &&
    pairs.all fun z => decide (0 ≤ z.1.sigma ∧ z.1.sigma < z.2.sigma)

private def valid (sl : Slice) : Bool :=
  sourcesOK sl.lo sl.hi row08Cells extra08 sl.pick8 &&
    sourcesOK sl.lo sl.hi row09Cells extra09 sl.pick9 && scaleOK sl.left && scaleOK sl.right

private theorem all_valid : slices.all valid = true := by decide +kernel
private theorem covers_shape : chainTo Slice.lo Slice.hi 0 42 slices = true := by decide +kernel

theorem slice_exists {s : ℝ} (h₀ : 0 ≤ s) (h₁ : s ≤ 42) :
    ∃ sl ∈ slices, (sl.lo : ℝ) ≤ s ∧ s ≤ sl.hi :=
  chainTo_sound _ _ _ _ _ covers_shape s (by simpa using h₀) (by simpa using h₁)

variable {Ω : Type*} [MeasurableSpace Ω]

def ExtrasHold (ex : List Extra) (μ : Measure Ω) (U : Ω → ℝ) (s : ℝ)
    (P : ℝ → ℝ) : Prop :=
  ∀ e ∈ ex, (e.lo : ℝ) ≤ s → s ≤ e.hi →
    Integrable (fun y => P (e.sigma * √(U y))) μ →
      ∫ y, P (e.sigma * √(U y)) ∂μ ≤ e.val

private theorem extra_mem (ex : List Extra) (idx : Option ℕ) {e : Extra}
    (he : e ∈ (idx.bind fun i => ex[i]?).toList) : e ∈ ex := by
  rcases idx with _ | i
  · simp at he
  · cases h : ex[i]? with
    | none => simp [h] at he
    | some z =>
      simp [h] at he
      subst e
      exact List.mem_of_getElem? h

private theorem freeze_sigma (c0 : ℚ) (c : AntiSCell) (z : RowSigmaNode) :
    (freeze c0 c z).sigma = z.sigma := by cases z <;> rfl

private theorem freeze_val (c0 l h : ℚ) (c : AntiSCell) (z : RowSigmaNode) :
    (freeze c0 c z).val c0 l h = z.val c0 c.sLo c.sHi := by cases z <;> rfl

private theorem selected_chord {r : Row} {c0 : ℚ} {cells : List AntiSCell} {ex : List Extra}
    (old : CircularCellNodeBounds r c0 cells)
    {d : ℕ} {a b : MvPolynomial (Fin d) ℝ} (ha : Chaos3 a)
    (haa : ∫ y, eval y a^2 ∂(stdGaussian d) = 1/2) {J : Fin d → Fin d → ℝ} (hc : Circular J a b)
    {P : ℝ → ℝ} (hP : CapsHold P r.nodeList r.smax)
    (extras : ExtrasHold ex (stdGaussian d) (fun y => eval y (radU a b))
      (∫ y, eval y (radU a b)^2 ∂(stdGaussian d) - 2) P)
    {l h : ℚ} {p : Pick} (hsources : sourcesOK l h cells ex p) (hscale : scaleOK (select l h c0 cells ex p))
    (hl : (l : ℝ) ≤ ∫ y, eval y (radU a b)^2 ∂(stdGaussian d) - 2)
    (hh : ∫ y, eval y (radU a b)^2 ∂(stdGaussian d) - 2 ≤ (h : ℝ))
    {σ : ℝ} (hσ₀ : 0 ≤ σ) (hσ₁ : σ ≤ (stop : ℝ))
    (hInt : ∀ u : ℝ, 0 ≤ u → Integrable (fun y => P (u*√(eval y (radU a b)))) (stdGaussian d)) :
    let c := select l h c0 cells ex p
    ∃ k ∈ rowChords c0 [c], k.Covers (∫ y, eval y (radU a b)^2 ∂(stdGaussian d) - 2) σ ∧
      ∫ y, P (σ*√(eval y (radU a b))) ∂(stdGaussian d) ≤ k.eval σ := by
  dsimp only
  let src := oldCell cells p
  let c := select l h c0 cells ex p
  simp only [sourcesOK, Bool.and_eq_true, decide_eq_true_eq, List.all_eq_true] at hsources
  obtain ⟨⟨hi,hlo,hhi⟩,hex⟩ := hsources
  have hsrc : src ∈ cells := by
    dsimp [src,oldCell]
    rw [List.getD_eq_getElem _ _ hi]
    exact List.getElem_mem ..
  have hl' := (Rat.cast_le.mpr hlo).trans hl
  have hh' := hh.trans (Rat.cast_le.mpr hhi)
  have knot (n : RowSigmaNode) (hn : n ∈ c.snodes) (hn₀ : 0 ≤ n.sigma) :
      ∫ y, P (n.sigma*√(eval y (radU a b))) ∂(stdGaussian d) ≤ n.val c0 l h := by
    obtain ⟨i,_,hi⟩ := List.mem_filterMap.mp hn
    obtain h | h := List.mem_append.mp (List.mem_of_getElem? hi)
    · obtain ⟨z,hz,rfl⟩ := List.mem_map.mp h
      rw [freeze_sigma,freeze_val]
      rw [freeze_sigma] at hn₀
      exact old a b ha haa hc P hP src hsrc hl' hh' z hz (hInt _ (by exact_mod_cast hn₀))
    · obtain ⟨e,he,rfl⟩ := List.mem_map.mp h
      obtain ⟨a,b⟩ := hex e he
      exact extras e (extra_mem ex p.extra he) ((Rat.cast_le.mpr a).trans hl) (hh.trans (Rat.cast_le.mpr b))
        (hInt _ (by exact_mod_cast hn₀))
  simp only [scaleOK,Bool.and_eq_true,List.all_eq_true,decide_eq_true_eq] at hscale
  obtain ⟨z,hz,hσl,hσh⟩ := chainTo_sound _ _ _ _ _ hscale.1 σ (by simpa using hσ₀) hσ₁
  obtain ⟨h0,hlt⟩ := hscale.2 z hz
  obtain ⟨hz₁,hz₂⟩ := List.of_mem_zip hz
  refine ⟨fromNodes c0 c z.1 z.2, fromNodes_mem _ (List.mem_singleton_self _) hz,
    ⟨hl,hh,hσl,hσh⟩, ?_⟩
  rw [fromNodes_eval _ _ _ _ hlt]
  have h₁ : (0:ℝ) ≤ z.1.sigma := by exact_mod_cast h0
  have h₂ : (0:ℝ) ≤ z.2.sigma := by exact_mod_cast h0.trans hlt.le
  apply integral_le_scale_chord hP.convex (fun y => eval y (radU a b)) h0 hlt
    (fun _ => knot z.1 hz₁ h0) (fun _ => knot z.2 (List.mem_of_mem_tail hz₂) (h0.trans hlt.le))
    (hInt _ h₁) (hInt _ h₂) hσl hσh (hInt _ hσ₀)

/-- Both chord bounds belong to the same fourth-excess slab and the same physical law. -/
theorem paired_chords (sl : Slice) (hsl : sl ∈ slices)
    {d : ℕ} {a b : MvPolynomial (Fin d) ℝ} (ha : Chaos3 a)
    (haa : ∫ y, eval y a^2 ∂(stdGaussian d) = 1/2) {J : Fin d → Fin d → ℝ} (hc : Circular J a b)
    {P Q : ℝ → ℝ} (hp : CapsHold P row08.nodeList row08.smax) (hq : CapsHold Q row09.nodeList row09.smax)
    (old8 : CircularCellNodeBounds row08 c08 row08Cells) (old9 : CircularCellNodeBounds row09 c09 row09Cells)
    (extra8 : ExtrasHold extra08 (stdGaussian d) (fun y => eval y (radU a b))
      (∫ y, eval y (radU a b)^2 ∂(stdGaussian d)-2) P)
    (extra9 : ExtrasHold extra09 (stdGaussian d) (fun y => eval y (radU a b))
      (∫ y, eval y (radU a b)^2 ∂(stdGaussian d)-2) Q)
    (hl : (sl.lo : ℝ) ≤ ∫ y, eval y (radU a b)^2 ∂(stdGaussian d) - 2)
    (hh : ∫ y, eval y (radU a b)^2 ∂(stdGaussian d) - 2 ≤ (sl.hi : ℝ))
    {σ : ℝ} (hσ₀ : 0 ≤ σ) (hσ₁ : σ ≤ (stop : ℝ))
    (hiP : ∀ u : ℝ, 0 ≤ u → Integrable (fun y => P (u*√(eval y (radU a b)))) (stdGaussian d))
    (hiQ : ∀ u : ℝ, 0 ≤ u → Integrable (fun y => Q (u*√(eval y (radU a b)))) (stdGaussian d)) :
    (∃ l ∈ rowChords c08 [sl.left], l.Covers (∫ y, eval y (radU a b)^2 ∂(stdGaussian d)-2) σ ∧
      ∫ y, P (σ*√(eval y (radU a b))) ∂(stdGaussian d) ≤ l.eval σ) ∧
    (∃ r ∈ rowChords c09 [sl.right], r.Covers (∫ y, eval y (radU a b)^2 ∂(stdGaussian d)-2) σ ∧
      ∫ y, Q (σ*√(eval y (radU a b))) ∂(stdGaussian d) ≤ r.eval σ) := by
  have hv := List.all_eq_true.mp all_valid sl hsl
  simp only [valid, Bool.and_eq_true] at hv
  obtain ⟨⟨⟨s8,s9⟩,k8⟩,k9⟩ := hv
  exact ⟨selected_chord old8 ha haa hc hp extra8 s8 k8 hl hh hσ₀ hσ₁ hiP,
    selected_chord old9 ha haa hc hq extra9 s9 k9 hl hh hσ₀ hσ₁ hiQ⟩

end Grothe.LowerAnalytic.SparseStein
