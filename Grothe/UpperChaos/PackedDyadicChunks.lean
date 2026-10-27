import Grothe.UpperChaos.PackedDyadic
import Mathlib.Tactic.Ring

/-! Bounded strict parsing for large exact coefficient sources. Agent-ID: codex-2ca4. -/
namespace Grothe.UpperChaos.PackedDyadic

/-- Parse bounded chunks individually, returning no coefficients if any chunk fails. -/
def parseChunks (E : ℕ) (chunks : Array String) : Option (Array ℤ) := do
  let arrays ← chunks.mapM (parse E)
  pure (arrays.foldl (fun acc a => acc ++ a) #[])

/-- Integer range summation in tail position, for large finite certificate folds. -/
def isumAcc (f : ℕ → ℤ) : ℕ → ℤ → ℤ
  | 0, acc => acc
  | n + 1, acc => isumAcc f n (acc + f n)

theorem isumAcc_eq (f : ℕ → ℤ) (n : ℕ) (acc : ℤ) :
    isumAcc f n acc = acc + ∑ k ∈ Finset.range n, f k := by
  induction n generalizing acc with
  | zero => simp [isumAcc]
  | succ n ih => rw [isumAcc, ih, Finset.sum_range_succ]; ring

/-- Three nested integer folds equal the mathematical graded triple sum. -/
def gradedIntegerSum (N : ℕ) (f : ℕ → ℕ → ℕ → ℤ) : ℤ :=
  isumAcc (fun q => isumAcc (fun c => isumAcc (f q c) (q + 1) 0) (q + 2) 0) N 0

theorem gradedIntegerSum_eq (N : ℕ) (f : ℕ → ℕ → ℕ → ℤ) :
    gradedIntegerSum N f = ∑ q ∈ Finset.range N,
      ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1), f q c d := by
  simp only [gradedIntegerSum, isumAcc_eq, zero_add]

end Grothe.UpperChaos.PackedDyadic
