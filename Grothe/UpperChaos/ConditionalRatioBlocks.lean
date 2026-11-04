import Grothe.UpperChaos.ConditionalNormalizedFiniteChecks

/-!
# Assembly of separately checked backward-ratio blocks

Symbolic assembly for the original row227 certificate.

Each block owns a small array of transitions and a proof binding every array
index to the exact global current/next endpoint functions. The extraction
proof uses a bounded array index and this binding theorem; it does not
normalize membership in, or traverse, a concrete complete checkpoint table.

The final Boolean equality is obtained from the proved propositions through
`decide_eq_true`. Its proof does not evaluate the full finite certificate.

Agent-ID: codex-aa04. Refs #293.
-/

namespace Grothe.UpperChaos.ConditionalRatioBlocks

open ConditionalNormalizedFiniteChecks OriginalMomentRatioCertificates

/-- Data for one exact multiplication guard. No terminal approximation is
part of this record: the original terminal unit bound is checked separately. -/
structure Step where
  index : ℕ
  lower : ℚ
  upper : ℚ
  nextLower : ℚ
  nextUpper : ℚ

def Step.ofBounds (lo hi : ℕ → ℚ) (k : ℕ) : Step :=
  ⟨k, lo k, hi k, lo (k + 1), hi (k + 1)⟩

/-- Exactly the transition proposition in `certificateOK`. -/
abbrev Step.Guard (xlo xhi : ℚ) (entry : Step) : Prop :=
  entry.nextUpper ≤ 1 ∧
    entry.lower * ((entry.index : ℚ) + 2 + xhi - xhi * entry.nextLower) ≤
      (entry.index : ℚ) + 1 / 2 ∧
    (entry.index : ℚ) + 1 / 2 ≤
      entry.upper * ((entry.index : ℚ) + 2 + xlo - xlo * entry.nextUpper)

def Step.check (xlo xhi : ℚ) (entry : Step) : Bool :=
  decide (entry.Guard xlo xhi)

/-- An array's local position is bound to its actual global transition.
The binding includes the global index and all four endpoints, so a block
cannot silently use unrelated data or a different next checkpoint. -/
structure Block (lo hi : ℕ → ℚ) (start count : ℕ) where
  entries : Array Step
  size_eq : entries.size = count
  binding : ∀ i : Fin entries.size,
    entries[i.val] = Step.ofBounds lo hi (start + i.val)

/-- Canonical symbolic blocks are useful when the endpoint functions already
provide direct bounded lookup. Literal generated arrays may instead supply
their own once-per-block `size_eq` and `binding` proofs. -/
def Block.ofBounds (lo hi : ℕ → ℚ) (start count : ℕ) : Block lo hi start count where
  entries := Array.ofFn (fun i : Fin count => Step.ofBounds lo hi (start + i.val))
  size_eq := Array.size_ofFn
  binding := by
    intro i
    simp only [Array.getElem_ofFn]

def Block.check {lo hi : ℕ → ℚ} {start count : ℕ}
    (block : Block lo hi start count) (xlo xhi : ℚ) : Bool :=
  blockCheck (Step.check xlo xhi) block.entries

/-- Extract one guard without reducing a concrete array. `size_eq` transports
the index bound; both the lookup and the binding proof use the resulting
`Fin entries.size`. There is no default or out-of-range branch. -/
theorem Block.checked_at {lo hi : ℕ → ℚ} {start count : ℕ}
    (block : Block lo hi start count) (xlo xhi : ℚ)
    (hcheck : block.check xlo xhi = true) (i : Fin count) :
    (Step.ofBounds lo hi (start + i.val)).Guard xlo xhi := by
  let j : Fin block.entries.size := ⟨i.val, by rw [block.size_eq]; exact i.isLt⟩
  have h := blockCheck_get (Step.check xlo xhi) block.entries hcheck j
  rw [block.binding j] at h
  exact of_decide_eq_true h

/-- The four non-transition premises of the existing certificate interface. -/
def headerCheck (H : ℕ) (lo hi : ℕ → ℚ) (xlo xhi : ℚ) : Bool :=
  decide (0 ≤ xlo ∧ xlo ≤ xhi ∧ lo H ≤ 0 ∧ 1 ≤ hi H)

/-- Every transition belongs to one bounded block. The block containing `k`
has index `k / width` and local position `k % width`. The last block is
truncated to the remaining transitions. If `width` divides `H`, the final
block has length zero; this imposes no additional transition obligation. -/
theorem certificateOK_of_blocks (H width : ℕ) (lo hi : ℕ → ℚ) (xlo xhi : ℚ)
    (hwidth : 0 < width)
    (blocks : (b : Fin (H / width + 1)) →
      Block lo hi (width * b.val) (min width (H - width * b.val)))
    (hheader : headerCheck H lo hi xlo xhi = true)
    (hblocks : ∀ b, (blocks b).check xlo xhi = true) :
    certificateOK H lo hi xlo xhi = true := by
  apply decide_eq_true
  have hh := of_decide_eq_true hheader
  refine ⟨hh.1, hh.2.1, hh.2.2.1, hh.2.2.2, ?_⟩
  intro k
  let b : Fin (H / width + 1) := ⟨k.val / width, by
    have hdiv : k.val / width ≤ H / width :=
      Nat.div_le_div_right (Nat.le_of_lt k.isLt)
    omega⟩
  have hdecomp : width * b.val + k.val % width = k.val :=
    Nat.div_add_mod k.val width
  have hoffset : k.val % width < min width (H - width * b.val) := by
    apply lt_min
    · exact Nat.mod_lt k.val hwidth
    · have hk := k.isLt
      omega
  have hstep := (blocks b).checked_at xlo xhi (hblocks b)
    ⟨k.val % width, hoffset⟩
  change (Step.ofBounds lo hi (width * b.val + k.val % width)).Guard xlo xhi at hstep
  rw [hdecomp] at hstep
  exact hstep

/-- Row227's full horizon uses 80 bounded blocks: 79 of length 32, followed
by one of length 18. This specializes only the address arithmetic. -/
theorem certificateOK_2546_of_32_blocks (lo hi : ℕ → ℚ) (xlo xhi : ℚ)
    (blocks : (b : Fin 80) →
      Block lo hi (32 * b.val) (min 32 (2546 - 32 * b.val)))
    (hheader : headerCheck 2546 lo hi xlo xhi = true)
    (hblocks : ∀ b, (blocks b).check xlo xhi = true) :
    certificateOK 2546 lo hi xlo xhi = true :=
  certificateOK_of_blocks 2546 32 lo hi xlo xhi (by decide) blocks hheader hblocks

end Grothe.UpperChaos.ConditionalRatioBlocks
