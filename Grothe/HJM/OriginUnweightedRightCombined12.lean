import Grothe.HJM.OriginUnweightedRightCheckData
namespace Grothe.HJM.OriginUnweightedRightChecks
set_option maxRecDepth 1000000

theorem combinedBlock12 : ([84, 85, 86, 87, 88, 89, 90] : List ℕ).all combinedCheck = true := by
  native_decide
end Grothe.HJM.OriginUnweightedRightChecks
