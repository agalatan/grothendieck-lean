import Grothe.HJM.OriginUnweightedLeftCheckData
namespace Grothe.HJM.OriginUnweightedLeftChecks
set_option maxRecDepth 1000000

theorem combinedBlock09 : ([63, 64, 65, 66, 67, 68, 69] : List ℕ).all combinedCheck = true := by
  native_decide
end Grothe.HJM.OriginUnweightedLeftChecks
