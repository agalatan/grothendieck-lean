import Grothe.UpperChaos.OriginalRow227TriangleData2009
import Grothe.UpperChaos.OriginalRow227TriangleData2010
import Grothe.UpperChaos.OriginalRow227TriangleData2013
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1997
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2009.coefficient202_235, Icur := OriginalRow227TriangleData2009.coefficient202_234,
    output := OriginalRow227TriangleData2013.coefficient203_234, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2009.coefficient202_236, Icur := OriginalRow227TriangleData2009.coefficient202_235,
    output := OriginalRow227TriangleData2013.coefficient203_235, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2009.coefficient202_237, Icur := OriginalRow227TriangleData2009.coefficient202_236,
    output := OriginalRow227TriangleData2013.coefficient203_236, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2009.coefficient202_238, Icur := OriginalRow227TriangleData2009.coefficient202_237,
    output := OriginalRow227TriangleData2013.coefficient203_237, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2009.coefficient202_239, Icur := OriginalRow227TriangleData2009.coefficient202_238,
    output := OriginalRow227TriangleData2013.coefficient203_238, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2009.coefficient202_240, Icur := OriginalRow227TriangleData2009.coefficient202_239,
    output := OriginalRow227TriangleData2013.coefficient203_239, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2009.coefficient202_241, Icur := OriginalRow227TriangleData2009.coefficient202_240,
    output := OriginalRow227TriangleData2013.coefficient203_240, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2009.coefficient202_242, Icur := OriginalRow227TriangleData2009.coefficient202_241,
    output := OriginalRow227TriangleData2013.coefficient203_241, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2009.coefficient202_243, Icur := OriginalRow227TriangleData2009.coefficient202_242,
    output := OriginalRow227TriangleData2013.coefficient203_242, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2009.coefficient202_244, Icur := OriginalRow227TriangleData2009.coefficient202_243,
    output := OriginalRow227TriangleData2013.coefficient203_243, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2009.coefficient202_245, Icur := OriginalRow227TriangleData2009.coefficient202_244,
    output := OriginalRow227TriangleData2013.coefficient203_244, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2009.coefficient202_246, Icur := OriginalRow227TriangleData2009.coefficient202_245,
    output := OriginalRow227TriangleData2013.coefficient203_245, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2009.coefficient202_247, Icur := OriginalRow227TriangleData2009.coefficient202_246,
    output := OriginalRow227TriangleData2013.coefficient203_246, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2009.coefficient202_248, Icur := OriginalRow227TriangleData2009.coefficient202_247,
    output := OriginalRow227TriangleData2013.coefficient203_247, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2009.coefficient202_249, Icur := OriginalRow227TriangleData2009.coefficient202_248,
    output := OriginalRow227TriangleData2013.coefficient203_248, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2009.coefficient202_250, Icur := OriginalRow227TriangleData2009.coefficient202_249,
    output := OriginalRow227TriangleData2013.coefficient203_249, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2009.coefficient202_251, Icur := OriginalRow227TriangleData2009.coefficient202_250,
    output := OriginalRow227TriangleData2013.coefficient203_250, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2009.coefficient202_252, Icur := OriginalRow227TriangleData2009.coefficient202_251,
    output := OriginalRow227TriangleData2013.coefficient203_251, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2009.coefficient202_253, Icur := OriginalRow227TriangleData2009.coefficient202_252,
    output := OriginalRow227TriangleData2013.coefficient203_252, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2009.coefficient202_254, Icur := OriginalRow227TriangleData2009.coefficient202_253,
    output := OriginalRow227TriangleData2013.coefficient203_253, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2009.coefficient202_255, Icur := OriginalRow227TriangleData2009.coefficient202_254,
    output := OriginalRow227TriangleData2013.coefficient203_254, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2009.coefficient202_256, Icur := OriginalRow227TriangleData2009.coefficient202_255,
    output := OriginalRow227TriangleData2013.coefficient203_255, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2009.coefficient202_257, Icur := OriginalRow227TriangleData2009.coefficient202_256,
    output := OriginalRow227TriangleData2013.coefficient203_256, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2009.coefficient202_258, Icur := OriginalRow227TriangleData2009.coefficient202_257,
    output := OriginalRow227TriangleData2013.coefficient203_257, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2009.coefficient202_259, Icur := OriginalRow227TriangleData2009.coefficient202_258,
    output := OriginalRow227TriangleData2013.coefficient203_258, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2009.coefficient202_260, Icur := OriginalRow227TriangleData2009.coefficient202_259,
    output := OriginalRow227TriangleData2013.coefficient203_259, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2009.coefficient202_261, Icur := OriginalRow227TriangleData2009.coefficient202_260,
    output := OriginalRow227TriangleData2013.coefficient203_260, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2009.coefficient202_262, Icur := OriginalRow227TriangleData2009.coefficient202_261,
    output := OriginalRow227TriangleData2013.coefficient203_261, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2009.coefficient202_263, Icur := OriginalRow227TriangleData2009.coefficient202_262,
    output := OriginalRow227TriangleData2013.coefficient203_262, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2009.coefficient202_264, Icur := OriginalRow227TriangleData2009.coefficient202_263,
    output := OriginalRow227TriangleData2013.coefficient203_263, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2010.coefficient202_265, Icur := OriginalRow227TriangleData2009.coefficient202_264,
    output := OriginalRow227TriangleData2013.coefficient203_264, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots06.root203,
    Inext := OriginalRow227TriangleData2010.coefficient202_266, Icur := OriginalRow227TriangleData2010.coefficient202_265,
    output := OriginalRow227TriangleData2013.coefficient203_265, hC := OriginalRow227TriangleRoots06.root203_pos, hAC := OriginalRow227TriangleRoots06.product203_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1997

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1997.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
