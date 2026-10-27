import Grothe.HJM.OriginUnweightedLeftCheckData
namespace Grothe.HJM.OriginUnweightedLeftChecks
set_option maxRecDepth 1000000

theorem combinedBlock13 : ([91, 92, 93, 94, 95, 96, 97] : List ℕ).all combinedCheck = true := by
  native_decide
end Grothe.HJM.OriginUnweightedLeftChecks
