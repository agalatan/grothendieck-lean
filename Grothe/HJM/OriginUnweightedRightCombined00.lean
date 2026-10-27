import Grothe.HJM.OriginUnweightedRightCheckData
namespace Grothe.HJM.OriginUnweightedRightChecks
set_option maxRecDepth 1000000

theorem combinedBlock00 : ([0, 1, 2, 3, 4, 5, 6] : List ℕ).all combinedCheck = true := by
  native_decide
end Grothe.HJM.OriginUnweightedRightChecks
