import Grothe.HJM.OriginUnweightedRightCheckData
namespace Grothe.HJM.OriginUnweightedRightChecks
set_option maxRecDepth 1000000

theorem combinedBlock07 : ([49, 50, 51, 52, 53, 54, 55] : List ℕ).all combinedCheck = true := by
  native_decide
end Grothe.HJM.OriginUnweightedRightChecks
