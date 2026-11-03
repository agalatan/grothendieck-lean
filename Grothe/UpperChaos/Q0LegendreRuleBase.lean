import Grothe.UpperChaos.Q0LegendreRootSelection

/-! Common exact dyadic denominator of the original Gauss rule enclosures.
The actual Gauss rule semantics remain separate. Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0LegendreRuleBase

def denominator : ℤ := 2^640

theorem denominator_pos : 0 < denominator := by
  change 0 < (2 : ℤ)^640
  positivity

end Grothe.UpperChaos.Q0LegendreRuleBase
