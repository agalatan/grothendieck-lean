import Mathlib

/-!
# Dyadic bisection covers

Leaves of the coupled-profile certificate are binary paths in a bisection tree of the root
rectangle `[0, ρ] × [0, 31/4]` (even depth bisects `u`, odd depth bisects `x`; digit `0` is the
lower half).  Rather than a Kraft-equality argument we use a
recursive *cover checker* whose soundness is a direct induction: if `coversBox root paths depth
fuel = true` then every point of `root` lies in the box of some listed path.
-/

namespace Grothe.Lower

/-- A rectangle with rational endpoints. -/
structure Box where
  ulo : ℚ
  uhi : ℚ
  xlo : ℚ
  xhi : ℚ
  deriving DecidableEq, Repr

/-- Membership of a real point. -/
def Box.mem (b : Box) (u x : ℝ) : Prop :=
  (b.ulo : ℝ) ≤ u ∧ u ≤ b.uhi ∧ (b.xlo : ℝ) ≤ x ∧ x ≤ b.xhi

/-- Bisect in `u` at even depth, in `x` at odd depth. -/
def Box.split (b : Box) (depth : ℕ) : Box × Box :=
  if depth % 2 = 0 then
    let m := (b.ulo + b.uhi) / 2
    ({ b with uhi := m }, { b with ulo := m })
  else
    let m := (b.xlo + b.xhi) / 2
    ({ b with xhi := m }, { b with xlo := m })

lemma Box.mem_split (b : Box) (depth : ℕ) (u x : ℝ) (h : b.mem u x) :
    (b.split depth).1.mem u x ∨ (b.split depth).2.mem u x := by
  obtain ⟨h1, h2, h3, h4⟩ := h
  simp only [Box.split]
  split_ifs
  · by_cases hm : u ≤ (((b.ulo + b.uhi) / 2 : ℚ) : ℝ)
    · left; exact ⟨h1, hm, h3, h4⟩
    · right; exact ⟨le_of_lt (not_le.1 hm), h2, h3, h4⟩
  · by_cases hm : x ≤ (((b.xlo + b.xhi) / 2 : ℚ) : ℝ)
    · left; exact ⟨h1, h2, h3, hm⟩
    · right; exact ⟨h1, h2, le_of_lt (not_le.1 hm), h4⟩

/-- The box of a path (`true` = digit `1` = upper half), starting at the given depth. -/
def boxOfPath (root : Box) : List Bool → ℕ → Box
  | [], _ => root
  | d :: rest, depth =>
    let s := root.split depth
    boxOfPath (if d then s.2 else s.1) rest (depth + 1)

/-- Paths starting with digit `d`, with that digit removed. -/
def stripDigit (d : Bool) (paths : List (List Bool)) : List (List Bool) :=
  paths.filterMap fun p => match p with
    | d' :: r => if d' = d then some r else none
    | [] => none

/-- Recursive cover check. -/
def coversBox (root : Box) (paths : List (List Bool)) (depth : ℕ) : ℕ → Bool
  | 0 => paths.any (· = [])
  | fuel + 1 =>
    paths.any (· = []) ||
      (coversBox (root.split depth).1 (stripDigit false paths) (depth + 1) fuel &&
       coversBox (root.split depth).2 (stripDigit true paths) (depth + 1) fuel)

lemma mem_stripDigit {d : Bool} {paths : List (List Bool)} {r : List Bool}
    (h : r ∈ stripDigit d paths) : d :: r ∈ paths := by
  simp only [stripDigit, List.mem_filterMap] at h
  obtain ⟨p, hp, hpr⟩ := h
  rcases p with _ | ⟨d', r'⟩
  · simp at hpr
  · by_cases hd : d' = d
    · simp only [hd, if_true, Option.some.injEq] at hpr
      subst hpr; subst hd; exact hp
    · simp [hd] at hpr

/-- **Soundness of the cover checker.** -/
theorem coversBox_sound (fuel : ℕ) : ∀ (root : Box) (paths : List (List Bool)) (depth : ℕ),
    coversBox root paths depth fuel = true →
    ∀ u x : ℝ, root.mem u x → ∃ p ∈ paths, (boxOfPath root p depth).mem u x := by
  induction fuel with
  | zero =>
    intro root paths depth h u x hmem
    simp only [coversBox, List.any_eq_true, decide_eq_true_eq] at h
    obtain ⟨p, hp, rfl⟩ := h
    exact ⟨[], hp, hmem⟩
  | succ fuel ih =>
    intro root paths depth h u x hmem
    simp only [coversBox, Bool.or_eq_true, List.any_eq_true, decide_eq_true_eq,
      Bool.and_eq_true] at h
    rcases h with ⟨p, hp, rfl⟩ | ⟨hL, hR⟩
    · exact ⟨[], hp, hmem⟩
    · rcases root.mem_split depth u x hmem with hl | hr
      · obtain ⟨r, hr, hmemr⟩ := ih _ _ _ hL u x hl
        refine ⟨false :: r, mem_stripDigit hr, ?_⟩
        simpa [boxOfPath] using hmemr
      · obtain ⟨r, hr', hmemr⟩ := ih _ _ _ hR u x hr
        refine ⟨true :: r, mem_stripDigit hr', ?_⟩
        simpa [boxOfPath] using hmemr

/-- Decode a path string of `'0'`/`'1'` characters. -/
def decodePath (s : String) : List Bool := s.toList.map (· = '1')

end Grothe.Lower
