import Grothe.HJM.OriginUnweightedLeftCheckData
namespace Grothe.HJM.OriginUnweightedLeftChecks
set_option maxRecDepth 1000000

theorem combinedBlock08 : ([56, 57, 58, 59, 60, 61, 62] : List ℕ).all combinedCheck = true := by
  native_decide
end Grothe.HJM.OriginUnweightedLeftChecks
