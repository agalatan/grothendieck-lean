-- Grothe/Lower/FiniteMix.lean
import Grothe.Lower.Boxes

/-!
# Finite mixtures of certified lower-bound components

A binary expression permits any finite convex mixture while retaining the
gate matrices and common square until the final box bound. Every internal
weight is checked by `mixData`; every leaf uses the existing component
resolver, including its source-potential and kurtosis-range checks.

`MixBox` also embeds existing boxes. Its cover checker therefore supports a
refinement without changing the original box format or Gaussian source caps.
-/

open MeasureTheory

namespace Grothe.Lower

/-- A finite expression whose internal nodes mix with weights `(1 - θ, θ)`. -/
inductive MixTree (α : Type) where
  | leaf (value : α)
  | mix (θ : ℚ) (left right : MixTree α)

/-- Resolve all leaves and mix before applying the gate price. Invalid leaves
or nonconvex weights propagate `none` through the entire expression. -/
def MixTree.resolve {α : Type} (f : α → Option (VRow × MPoly × MPoly)) :
    MixTree α → Option (VRow × MPoly × MPoly)
  | .leaf a => f a
  | .mix θ left right => mixData θ (left.resolve f) (right.resolve f)

section sound

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
variable {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} {U : Ω → ℝ}
  {x : ℝ} {X1 X2 X3 : Ω → ℂ} {τ V t : ℝ} {Qh v : E} {sl su : ℚ}

/-- Soundness for arbitrarily many leaves, using only the binary mixing theorem.
The same law, gate variables and retained square are shared by all leaves. -/
theorem MixTree.resolve_sound {α : Type} (f : α → Option (VRow × MPoly × MPoly))
    (hf : ∀ a d, f a = some d → Comp μ U x X1 X2 X3 τ V t Qh v sl su d)
    (hv : ‖v‖ ^ 2 = 2) (tree : MixTree α) (d : VRow × MPoly × MPoly)
    (h : tree.resolve f = some d) : Comp μ U x X1 X2 X3 τ V t Qh v sl su d := by
  induction tree generalizing d with
  | leaf a => exact hf a d h
  | mix θ left right ihl ihr =>
    exact mixData_sound θ hv _ _ ihl ihr d h

end sound

/-- Existing box geometry and, optionally, a finite component expression.
With a tree, only the six coordinates of `box` are used; without one, the
existing box kind and its existing soundness theorem are used. -/
structure MixBox where
  box : Box
  tree : Option (MixTree CompRef)

def MixBox.dom (b : MixBox) : Dom := b.box.dom

/-- Evaluate a finite-mixture box by the existing exact slab formula. -/
def MixBox.bound (rows : List Row) (batches : List JBatch) (b : MixBox) : Option ℚ :=
  match b.tree with
  | none => boxBound rows batches b.box
  | some tree =>
    let r := b.box
    if ¬ (0 ≤ r.sl ∧ r.sl < r.su ∧ 0 ≤ r.xl) then none else
    match tree.resolve (fun c => compRefData rows batches c r.sl r.su r.xu) with
    | none => none
    | some (a, Lm, Lp) =>
      if gateOK a.N = true ∧ 0 ≤ Lm.a6 ∧ 0 ≤ Lp.a6 then
        some (boxVal a.ell a.beta a.price Lm Lp r.tl r.tu r.sl r.su r.xl r.xu)
      else none

def MixBox.ok (rows : List Row) (batches : List JBatch) (B : ℚ) (b : MixBox) : Bool :=
  match b.bound rows batches with
  | some val => decide (val ≤ B)
  | none => false

section box

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
variable {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
  {U : Ω → ℝ} {x : ℝ}

/-- Every accepted finite-mixture box bounds the same scalar objective.
No extra distributional hypothesis is introduced by the number of components. -/
theorem MixBox.bound_sound (rows : List Row) (batches : List JBatch)
    (hrows : ∀ r ∈ rows, checkRow r = true)
    (hbatches : ∀ b ∈ batches, checkBatch rows b = true)
    (b : MixBox) (val : ℚ) (hb : b.bound rows batches = some val)
    (X1 X2 X3 : Ω → ℂ) (τ : ℝ) (hX : ∀ ω, ‖X1 ω‖ ^ 2 = τ ^ 2 * U ω)
    (hM : Moments μ U x) (hS : SteinCut μ U) (V t : ℝ) (Qh v : E)
    (hv : ‖v‖ ^ 2 = 2) (Ψ : Row → ℝ → ℝ)
    (hΨ : ∀ r ∈ rows, RowSharedWith r (Ψ r) μ U X1 X2 X3 τ V t Qh v)
    (hscal : ∀ k a, envRowAt rows k = some a → RowOf a V t Qh v)
    (hm : b.dom.mem t τ x) : V ≤ val := by
  obtain ⟨htl, htu, hτl, hτu, hxl, hxu⟩ := hm
  cases b with
  | mk r tree =>
    cases tree with
    | none =>
      exact box_sound rows batches hrows hbatches r val hb X1 X2 X3 τ hX hM hS
        V t Qh v hv Ψ hΨ hscal ⟨htl, htu⟩ ⟨hτl, hτu⟩ ⟨hxl, hxu⟩
    | some tree =>
      simp only [MixBox.bound] at hb
      split_ifs at hb with hvalid
      obtain ⟨hsl, hslsu, hxl0⟩ := hvalid
      cases hd : tree.resolve (fun c => compRefData rows batches c r.sl r.su r.xu) with
      | none => simp [hd] at hb
      | some d =>
        obtain ⟨a, Lm, Lp⟩ := d
        simp only [hd] at hb
        split_ifs at hb with hcond
        simp only [Option.some.injEq] at hb
        subst val
        have hc := MixTree.resolve_sound _
          (fun c d h => compRef_sound rows batches hrows hbatches Ψ hΨ hM hS hv
            c r.xu hxu d h) hv tree (a, Lm, Lp) hd
        obtain ⟨Φ, hconv, hV, hTm, hTp⟩ := hc
        exact vslab_bound a hcond.1 hconv X1 X2 X3 τ hX hM V t Qh v hV Lm Lp
          hcond.2.1 hcond.2.2 r.tl r.tu r.sl r.su r.xl r.xu hTm hTp
          hsl hslsu hτl hτu htl htu hxl0 hxl hxu

end box

/-- A complete finite-mixture cover, reusing the existing partition checker. -/
def checkMixCover (rows : List Row) (batches : List JBatch) (B : ℚ)
    (cuts : List String) (boxes : List MixBox) : Bool :=
  allPar (MixBox.ok rows batches B) boxes &&
    treeCoverOK (treeOf cuts) (0, 9 / 10, 0, ρ, 0, xMax) (boxes.map MixBox.dom)

/-- Every point of the full witness domain lies in an accepted finite-mixture box. -/
theorem mixCover_sound (rows : List Row) (batches : List JBatch) (B : ℚ)
    (cuts : List String) (boxes : List MixBox)
    (h : checkMixCover rows batches B cuts boxes = true) (t τ x : ℝ)
    (ht0 : 0 ≤ t) (ht1 : t ≤ 9 / 10) (hτ0 : 0 ≤ τ) (hτ1 : τ ≤ ρ)
    (hx0 : 0 ≤ x) (hx1 : x ≤ xMax) :
    ∃ b ∈ boxes, b.ok rows batches B = true ∧ b.dom.mem t τ x := by
  simp only [checkMixCover, allPar_eq, Bool.and_eq_true, List.all_eq_true] at h
  obtain ⟨d, hd, hdm⟩ := treeCoverOK_sound _ _ _ h.2 t τ x
    ⟨by simpa using ht0, by push_cast; exact ht1,
      by simpa using hτ0, hτ1, by simpa using hx0, hx1⟩
  obtain ⟨b, hb, rfl⟩ := List.mem_map.1 hd
  exact ⟨b, hb, h.1 b hb, hdm⟩

section bound

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
variable {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
  {U : Ω → ℝ} {x : ℝ}

/-- An accepted finite-mixture cover bounds the scalar objective on the full
witness domain, under the existing shared-row and common-law hypotheses. -/
theorem mixCover_bound (rows : List Row) (batches : List JBatch)
    (hrows : ∀ r ∈ rows, checkRow r = true)
    (hbatches : ∀ b ∈ batches, checkBatch rows b = true)
    (B : ℚ) (cuts : List String) (boxes : List MixBox)
    (hcover : checkMixCover rows batches B cuts boxes = true)
    (X1 X2 X3 : Ω → ℂ) (τ : ℝ) (hX : ∀ ω, ‖X1 ω‖ ^ 2 = τ ^ 2 * U ω)
    (hM : Moments μ U x) (hS : SteinCut μ U) (V t : ℝ) (Qh v : E)
    (hv : ‖v‖ ^ 2 = 2) (Ψ : Row → ℝ → ℝ)
    (hΨ : ∀ r ∈ rows, RowSharedWith r (Ψ r) μ U X1 X2 X3 τ V t Qh v)
    (hscal : ∀ k a, envRowAt rows k = some a → RowOf a V t Qh v)
    (ht0 : 0 ≤ t) (ht1 : t ≤ 9 / 10) (hτ0 : 0 ≤ τ) (hτ1 : τ ≤ ρ)
    (hx0 : 0 ≤ x) (hx1 : x ≤ xMax) : V ≤ B := by
  obtain ⟨b, _, hok, hm⟩ := mixCover_sound rows batches B cuts boxes hcover
    t τ x ht0 ht1 hτ0 hτ1 hx0 hx1
  cases hb : b.bound rows batches with
  | none => simp [MixBox.ok, hb] at hok
  | some val =>
    simp only [MixBox.ok, hb, decide_eq_true_eq] at hok
    exact (MixBox.bound_sound rows batches hrows hbatches b val hb X1 X2 X3 τ hX hM hS
      V t Qh v hv Ψ hΨ hscal hm).trans (by exact_mod_cast hok)

end bound

end Grothe.Lower
