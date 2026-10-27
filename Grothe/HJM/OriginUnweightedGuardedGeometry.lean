import Grothe.HJM.OriginUnweightedLeftGeometry
import Grothe.HJM.OriginUnweightedRightGeometry
import Grothe.HJM.OriginUnweightedLeftAggregate
import Grothe.HJM.OriginUnweightedRightAggregate

/-!
# Bridge full guarded blocks to their partition geometry

The checked aggregate geometry supplies the `GeometryOK` hypothesis used
by both partition interfaces. No additional numerical checks are needed.
-/

namespace Grothe.HJM.OriginUnweightedGuardedGeometry

theorem leftGeometry : OriginUnweightedLeftGeometry.GeometryOK :=
  OriginUnweightedLeftAggregate.allGeometry

theorem rightGeometry : OriginUnweightedRightGeometry.GeometryOK :=
  OriginUnweightedRightAggregate.allGeometry

end Grothe.HJM.OriginUnweightedGuardedGeometry
