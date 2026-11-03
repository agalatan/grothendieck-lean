import Grothe.UpperChaos.Q0GaussSelectedRulesAudit
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Dependent selection of the checked original root families for
all supported orders. Production context table and Gaussian
quadrature identity remain separate. Agent-ID: codex-aa04. -/
set_option maxRecDepth 8192

namespace Grothe.UpperChaos.Q0GaussSelectedChoice

open Grothe.UpperChaos.Q0GaussSelected

noncomputable def selectedFor (n : ℕ) (h : 1 ≤ n ∧ n ≤ 64) : SelectedRule n :=
  if h01 : n = 1 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule01.selected
  else if h02 : n = 2 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule02.selected
  else if h03 : n = 3 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule03.selected
  else if h04 : n = 4 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule04.selected
  else if h05 : n = 5 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule05.selected
  else if h06 : n = 6 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule06.selected
  else if h07 : n = 7 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule07.selected
  else if h08 : n = 8 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule08.selected
  else if h09 : n = 9 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule09.selected
  else if h10 : n = 10 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule10.selected
  else if h11 : n = 11 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule11.selected
  else if h12 : n = 12 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule12.selected
  else if h13 : n = 13 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule13.selected
  else if h14 : n = 14 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule14.selected
  else if h15 : n = 15 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule15.selected
  else if h16 : n = 16 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule16.selected
  else if h17 : n = 17 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule17.selected
  else if h18 : n = 18 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule18.selected
  else if h19 : n = 19 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule19.selected
  else if h20 : n = 20 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule20.selected
  else if h21 : n = 21 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule21.selected
  else if h22 : n = 22 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule22.selected
  else if h23 : n = 23 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule23.selected
  else if h24 : n = 24 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule24.selected
  else if h25 : n = 25 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule25.selected
  else if h26 : n = 26 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule26.selected
  else if h27 : n = 27 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule27.selected
  else if h28 : n = 28 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule28.selected
  else if h29 : n = 29 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule29.selected
  else if h30 : n = 30 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule30.selected
  else if h31 : n = 31 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule31.selected
  else if h32 : n = 32 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule32.selected
  else if h33 : n = 33 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule33.selected
  else if h34 : n = 34 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule34.selected
  else if h35 : n = 35 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule35.selected
  else if h36 : n = 36 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule36.selected
  else if h37 : n = 37 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule37.selected
  else if h38 : n = 38 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule38.selected
  else if h39 : n = 39 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule39.selected
  else if h40 : n = 40 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule40.selected
  else if h41 : n = 41 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule41.selected
  else if h42 : n = 42 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule42.selected
  else if h43 : n = 43 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule43.selected
  else if h44 : n = 44 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule44.selected
  else if h45 : n = 45 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule45.selected
  else if h46 : n = 46 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule46.selected
  else if h47 : n = 47 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule47.selected
  else if h48 : n = 48 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule48.selected
  else if h49 : n = 49 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule49.selected
  else if h50 : n = 50 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule50.selected
  else if h51 : n = 51 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule51.selected
  else if h52 : n = 52 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule52.selected
  else if h53 : n = 53 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule53.selected
  else if h54 : n = 54 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule54.selected
  else if h55 : n = 55 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule55.selected
  else if h56 : n = 56 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule56.selected
  else if h57 : n = 57 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule57.selected
  else if h58 : n = 58 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule58.selected
  else if h59 : n = 59 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule59.selected
  else if h60 : n = 60 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule60.selected
  else if h61 : n = 61 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule61.selected
  else if h62 : n = 62 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule62.selected
  else if h63 : n = 63 then by
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule63.selected
  else by
    have h64 : n = 64 := by omega
    subst n
    exact Grothe.UpperChaos.Q0GaussSelectedRule64.selected

def contextFor (n : ℕ) : Option (Array (ℚ × ℚ)) :=
  match n with
  | 1 => some Grothe.UpperChaos.Q0GaussSelectedRule01.indexedContext
  | 2 => some Grothe.UpperChaos.Q0GaussSelectedRule02.indexedContext
  | 3 => some Grothe.UpperChaos.Q0GaussSelectedRule03.indexedContext
  | 4 => some Grothe.UpperChaos.Q0GaussSelectedRule04.indexedContext
  | 5 => some Grothe.UpperChaos.Q0GaussSelectedRule05.indexedContext
  | 6 => some Grothe.UpperChaos.Q0GaussSelectedRule06.indexedContext
  | 7 => some Grothe.UpperChaos.Q0GaussSelectedRule07.indexedContext
  | 8 => some Grothe.UpperChaos.Q0GaussSelectedRule08.indexedContext
  | 9 => some Grothe.UpperChaos.Q0GaussSelectedRule09.indexedContext
  | 10 => some Grothe.UpperChaos.Q0GaussSelectedRule10.indexedContext
  | 11 => some Grothe.UpperChaos.Q0GaussSelectedRule11.indexedContext
  | 12 => some Grothe.UpperChaos.Q0GaussSelectedRule12.indexedContext
  | 13 => some Grothe.UpperChaos.Q0GaussSelectedRule13.indexedContext
  | 14 => some Grothe.UpperChaos.Q0GaussSelectedRule14.indexedContext
  | 15 => some Grothe.UpperChaos.Q0GaussSelectedRule15.indexedContext
  | 16 => some Grothe.UpperChaos.Q0GaussSelectedRule16.indexedContext
  | 17 => some Grothe.UpperChaos.Q0GaussSelectedRule17.indexedContext
  | 18 => some Grothe.UpperChaos.Q0GaussSelectedRule18.indexedContext
  | 19 => some Grothe.UpperChaos.Q0GaussSelectedRule19.indexedContext
  | 20 => some Grothe.UpperChaos.Q0GaussSelectedRule20.indexedContext
  | 21 => some Grothe.UpperChaos.Q0GaussSelectedRule21.indexedContext
  | 22 => some Grothe.UpperChaos.Q0GaussSelectedRule22.indexedContext
  | 23 => some Grothe.UpperChaos.Q0GaussSelectedRule23.indexedContext
  | 24 => some Grothe.UpperChaos.Q0GaussSelectedRule24.indexedContext
  | 25 => some Grothe.UpperChaos.Q0GaussSelectedRule25.indexedContext
  | 26 => some Grothe.UpperChaos.Q0GaussSelectedRule26.indexedContext
  | 27 => some Grothe.UpperChaos.Q0GaussSelectedRule27.indexedContext
  | 28 => some Grothe.UpperChaos.Q0GaussSelectedRule28.indexedContext
  | 29 => some Grothe.UpperChaos.Q0GaussSelectedRule29.indexedContext
  | 30 => some Grothe.UpperChaos.Q0GaussSelectedRule30.indexedContext
  | 31 => some Grothe.UpperChaos.Q0GaussSelectedRule31.indexedContext
  | 32 => some Grothe.UpperChaos.Q0GaussSelectedRule32.indexedContext
  | 33 => some Grothe.UpperChaos.Q0GaussSelectedRule33.indexedContext
  | 34 => some Grothe.UpperChaos.Q0GaussSelectedRule34.indexedContext
  | 35 => some Grothe.UpperChaos.Q0GaussSelectedRule35.indexedContext
  | 36 => some Grothe.UpperChaos.Q0GaussSelectedRule36.indexedContext
  | 37 => some Grothe.UpperChaos.Q0GaussSelectedRule37.indexedContext
  | 38 => some Grothe.UpperChaos.Q0GaussSelectedRule38.indexedContext
  | 39 => some Grothe.UpperChaos.Q0GaussSelectedRule39.indexedContext
  | 40 => some Grothe.UpperChaos.Q0GaussSelectedRule40.indexedContext
  | 41 => some Grothe.UpperChaos.Q0GaussSelectedRule41.indexedContext
  | 42 => some Grothe.UpperChaos.Q0GaussSelectedRule42.indexedContext
  | 43 => some Grothe.UpperChaos.Q0GaussSelectedRule43.indexedContext
  | 44 => some Grothe.UpperChaos.Q0GaussSelectedRule44.indexedContext
  | 45 => some Grothe.UpperChaos.Q0GaussSelectedRule45.indexedContext
  | 46 => some Grothe.UpperChaos.Q0GaussSelectedRule46.indexedContext
  | 47 => some Grothe.UpperChaos.Q0GaussSelectedRule47.indexedContext
  | 48 => some Grothe.UpperChaos.Q0GaussSelectedRule48.indexedContext
  | 49 => some Grothe.UpperChaos.Q0GaussSelectedRule49.indexedContext
  | 50 => some Grothe.UpperChaos.Q0GaussSelectedRule50.indexedContext
  | 51 => some Grothe.UpperChaos.Q0GaussSelectedRule51.indexedContext
  | 52 => some Grothe.UpperChaos.Q0GaussSelectedRule52.indexedContext
  | 53 => some Grothe.UpperChaos.Q0GaussSelectedRule53.indexedContext
  | 54 => some Grothe.UpperChaos.Q0GaussSelectedRule54.indexedContext
  | 55 => some Grothe.UpperChaos.Q0GaussSelectedRule55.indexedContext
  | 56 => some Grothe.UpperChaos.Q0GaussSelectedRule56.indexedContext
  | 57 => some Grothe.UpperChaos.Q0GaussSelectedRule57.indexedContext
  | 58 => some Grothe.UpperChaos.Q0GaussSelectedRule58.indexedContext
  | 59 => some Grothe.UpperChaos.Q0GaussSelectedRule59.indexedContext
  | 60 => some Grothe.UpperChaos.Q0GaussSelectedRule60.indexedContext
  | 61 => some Grothe.UpperChaos.Q0GaussSelectedRule61.indexedContext
  | 62 => some Grothe.UpperChaos.Q0GaussSelectedRule62.indexedContext
  | 63 => some Grothe.UpperChaos.Q0GaussSelectedRule63.indexedContext
  | 64 => some Grothe.UpperChaos.Q0GaussSelectedRule64.indexedContext
  | _ => none

-- The 64 dependent cases share one elaboration budget.
set_option maxHeartbeats 4000000 in
theorem selected_context (n : ℕ) (h : 1 ≤ n ∧ n ≤ 64) (i : Fin n) :
    (do let t ← contextFor n; t[i.val]?) =
      some ((selectedFor n h).lower i, (selectedFor n h).upper i) := by
  have hlo : 1 ≤ n := h.1
  have hhi : n ≤ 64 := h.2
  interval_cases n
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule01.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule02.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule03.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule04.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule05.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule06.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule07.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule08.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule09.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule10.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule11.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule12.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule13.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule14.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule15.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule16.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule17.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule18.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule19.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule20.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule21.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule22.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule23.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule24.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule25.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule26.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule27.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule28.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule29.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule30.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule31.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule32.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule33.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule34.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule35.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule36.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule37.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule38.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule39.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule40.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule41.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule42.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule43.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule44.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule45.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule46.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule47.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule48.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule49.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule50.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule51.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule52.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule53.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule54.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule55.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule56.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule57.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule58.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule59.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule60.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule61.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule62.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule63.context_lookup i
  · simpa [contextFor, selectedFor] using
      Grothe.UpperChaos.Q0GaussSelectedRule64.context_lookup i

end Grothe.UpperChaos.Q0GaussSelectedChoice

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let targets : Array Name := #[
    ``Grothe.UpperChaos.Q0GaussSelectedChoice.selectedFor,
    ``Grothe.UpperChaos.Q0GaussSelectedChoice.selected_context]
  for target in targets do
    let dependencies ← Lean.collectAxioms target
    logInfo m!"Selected choice audit {target}: {dependencies}"
    for dependency in dependencies do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
