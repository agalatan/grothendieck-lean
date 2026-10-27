import Grothe.HJM.OriginUnweightedLeftCheckData
namespace Grothe.HJM.OriginUnweightedLeftChecks
set_option maxRecDepth 1000000

theorem combinedBlock01 : ([7, 8, 9, 10, 11, 12, 13] : List ℕ).all combinedCheck = true := by
  native_decide
end Grothe.HJM.OriginUnweightedLeftChecks
