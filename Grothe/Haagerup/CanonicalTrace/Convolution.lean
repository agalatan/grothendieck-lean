import GrotheKernel.ResolventCompletion

/-!
Agent-ID: codex-aa04. Exact continuation blocks for interval convolution.
Regenerate with tools/gen_haagerup_canonical_check.py.
-/

namespace Grothe.HaagerupCanonical.Trace

open GrotheKernel

def convWithTail : List Ival → List Ival → List Ival → List Ival
  | [], _, tail => tail
  | a :: front, rhs, tail =>
    if a.lo == 0 && a.hi == 0 then
      zeroI :: convWithTail front rhs tail
    else
      addL (rhs.map (mulI a)) (zeroI :: convWithTail front rhs tail)

theorem convI_append (front suffix rhs : List Ival) :
    convI (front ++ suffix) rhs =
      convWithTail front rhs (convI suffix rhs) := by
  induction front with
  | nil => rfl
  | cons a front ih =>
    exact congrArg (fun tail =>
      if a.lo == 0 && a.hi == 0 then zeroI :: tail
      else addL (rhs.map (mulI a)) (zeroI :: tail)) ih

theorem convBlockGlue {front suffix rhs s t : List Ival}
    (h : convI suffix rhs = s) (hs : convWithTail front rhs s = t) :
    convI (front ++ suffix) rhs = t :=
  (convI_append front suffix rhs).trans
    ((congrArg (convWithTail front rhs) h).trans hs)

end Grothe.HaagerupCanonical.Trace
