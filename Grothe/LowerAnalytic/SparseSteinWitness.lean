import Grothe.Lower.SparseNodePricing
import Grothe.LowerAnalytic.SparseSteinSlabs

/-! # Physical interpretation of a transported sparse ordinate

Each witness consists of a previously priced plain polynomial and the few cuts
used in its pointwise proof. Its rational price is checked at both endpoints of
the indicated fourth-excess slab.
Agent-ID: codex-a7c4
-/

namespace Grothe.LowerAnalytic.SparseStein

open MeasureTheory Grothe.Lower
open Grothe.Lower.SparseStein (priceOK shape_node_le)

structure Witness where
  bank : List (List ℚ)
  node : SNode

def Witness.Checked (w : Witness) (mesh : List ℚ) (caps : List (ℚ × ℚ)) (smax : ℚ) : Prop :=
  checkNode caps smax mesh (w.bank.map (cutPolys mesh)) w.node = true

structure Plan where
  witness : Witness
  target : Extra
  ratio : ℚ
  rootLo : ℚ
  rootHi : ℚ

def Plan.priced (p : Plan) (mesh : List ℚ) : Bool :=
  decide (p.witness.node.sigma * p.ratio = p.target.sigma ∧ 0 < p.ratio) &&
    (nodeCutList p.witness.bank p.witness.node).all (fun c => c.2.length == mesh.length+2) &&
    priceOK mesh p.witness.bank p.witness.node p.ratio p.target.lo p.target.hi p.rootLo p.rootHi p.target.val

variable {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ] {U : Ω → ℝ}

theorem Plan.sound (p : Plan) {mesh : List ℚ} (hmesh : meshOK 0 mesh)
    {caps : List (ℚ × ℚ)} {smax : ℚ} {Ψ : ℝ → ℝ} (hcap : CapsHold Ψ caps smax)
    (hchecked : p.witness.Checked mesh caps smax) (hp : p.priced mesh)
    {x : ℝ} (hM : Moments μ U x) (hc : SteinCut μ U)
    (hr : ∫ y, √(U y) ∂μ ≤ 93/100)
    (hl : (p.target.lo : ℝ) ≤ x^2) (hh : x^2 ≤ (p.target.hi : ℝ))
    (hi : Integrable (fun y => Ψ (p.target.sigma * √(U y))) μ) :
    ∫ y, Ψ (p.target.sigma * √(U y)) ∂μ ≤ p.target.val := by
  simp only [Plan.priced, Bool.and_eq_true, decide_eq_true_eq, List.all_eq_true, beq_iff_eq] at hp
  obtain ⟨⟨⟨hscale, hpos⟩, hlen⟩, hprice⟩ := hp
  have he (v : ℝ) : (p.target.sigma : ℝ) * v = p.witness.node.sigma * (p.ratio * v) := by
    rw [← hscale, Rat.cast_mul, mul_assoc]
  simp only [he] at hi ⊢
  exact shape_node_le hM hc hr hcap mesh p.witness.bank p.witness.node hmesh hchecked
    hlen p.ratio p.target.lo p.target.hi p.rootLo p.rootHi p.target.val hpos hprice hl hh hi

end Grothe.LowerAnalytic.SparseStein
