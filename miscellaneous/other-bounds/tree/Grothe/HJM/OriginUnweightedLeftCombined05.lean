import Grothe.HJM.OriginUnweightedLeftCheckData
namespace Grothe.HJM.OriginUnweightedLeftChecks
set_option maxRecDepth 1000000

theorem combinedBlock05 : ([35, 36, 37, 38, 39, 40, 41] : List ℕ).all combinedCheck = true := by
  native_decide
end Grothe.HJM.OriginUnweightedLeftChecks
