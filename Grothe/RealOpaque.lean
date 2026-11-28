import Mathlib.Basic.Real.Basic

/-!
# The arithmetic of `ℝ` stays opaque

Mathlib (from `v4.36.0`) defines the operations of `ℝ` (`zero`, `one`, `add`, `neg`, `mul`, `inv'`, `lt`, `le`,
`sup`, `inf`) as `@[no_expose] private def`: a file written with the module system does not see their bodies.
The files of this repository are not modules (`allowNonModules` in `lakefile.toml`), so they would see them, and a
definitional check between two different real expressions could then unfold Cauchy sequences until the heartbeat
limit. This module makes the ten operations irreducible again, as the `irreducible_def` of earlier Mathlib versions
did, for every module that imports it. It changes only how the elaborator unfolds definitions: no statement, no
definition and no axiom changes, and the kernel checks every proof as before.
-/

open Lean Elab Command in
run_cmd do
  let pre := Name.mkNum `_private.Mathlib.Basic.Real.Basic 0 ++ `Real
  for n in [`zero, `one, `add, `neg, `mul, `inv', `lt, `le, `sup, `inf] do
    elabCommand (← `(set_option allowUnsafeReducibility true in
      attribute [irreducible] $(mkIdent (pre ++ n))))
