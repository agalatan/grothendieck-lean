import Grothe.HJM.OriginUnweightedRightCheckData
namespace Grothe.HJM.OriginUnweightedRightChecks
set_option maxRecDepth 1000000

theorem combinedBlock02 : ([14, 15, 16, 17, 18, 19, 20] : List ℕ).all combinedCheck = true := by
  native_decide
end Grothe.HJM.OriginUnweightedRightChecks
