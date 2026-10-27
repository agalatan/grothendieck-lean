import Grothe.HJM.OriginUnweightedRightCheckData
namespace Grothe.HJM.OriginUnweightedRightChecks
set_option maxRecDepth 1000000

theorem combinedBlock06 : ([42, 43, 44, 45, 46, 47, 48] : List ℕ).all combinedCheck = true := by
  native_decide
end Grothe.HJM.OriginUnweightedRightChecks
