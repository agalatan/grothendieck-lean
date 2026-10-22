import Grothe
open Lean Meta Elab Command

/-!
# Dead-code report (audit tool, not part of the library)

`lake env lean scratch/DeadCode.lean` lists, per module, the declarations of `Grothe`/`GrotheKernel`
that are not reachable from the headline theorems below (auto-generated names filtered). Deliberate
standalone results (e.g. `Influence.lean`, the sixth-moment reduction) show up here by design.
-/

/-- Transitive closure of constants used by `roots`, restricted to the `Grothe` namespace. -/
partial def usedClosure (env : Environment) (roots : List Name) : NameSet := Id.run do
  let mut seen : NameSet := {}
  let mut stack := roots
  while !stack.isEmpty do
    let n := stack.head!; stack := stack.tail!
    if seen.contains n then continue
    seen := seen.insert n
    if let some ci := env.find? n then
      let refs := ci.getUsedConstantsAsSet
      for r in refs.toList do
        if !seen.contains r then stack := r :: stack
  return seen

elab "#deadcode" : command => do
  let env ← getEnv
  let roots := [`Grothe.fresh_upper, `Grothe.Lower.lower_bound_data, `Grothe.Lower.lower_endpoint,
    `Grothe.Lower.lower_bound_of_transferL2, `Grothe.LowerAnalytic.gaussian_steinInputs,
    `Grothe.LowerAnalytic.sixth_moment_complex, `Grothe.LowerAnalytic.first_moment_lt_rho,
    `Grothe.LowerAnalytic.fluctuation_bound, `Grothe.LowerAnalytic.lower_bound_gaussian]
  let used := usedClosure env roots
  let mut out : Std.HashMap Name (Array Name) := {}
  for (n, _) in env.constants.toList do
    if n.isInternal then continue
    let some mod := env.getModuleIdxFor? n | continue
    let modName := env.header.moduleNames[mod.toNat]!
    if !(`Grothe).isPrefixOf modName && !(`GrotheKernel).isPrefixOf modName then continue
    if used.contains n then continue
    -- skip auxiliary compiler/equation names
    if n.isInternalDetail || (`_private).isPrefixOf n then continue
    let s := n.toString
    if s.endsWith ".proof_1" || s.contains "._" || s.contains "match_" || s.endsWith ".eq_1" || s.endsWith ".inj" || s.endsWith ".injEq" || s.endsWith ".sizeOf_spec" || s.contains ".rec" || s.contains ".casesOn" || s.contains ".noConfusion" || s.endsWith ".mk" || s.contains ".below" || s.contains ".brecOn" || s.contains ".ctorIdx" then continue
    out := out.insert modName ((out.getD modName #[]).push n)
  for (m, ns) in out.toList do
    logInfo m!"{m} ({ns.size} unused): {ns.qsort (·.toString < ·.toString) |>.toList}"

#deadcode
