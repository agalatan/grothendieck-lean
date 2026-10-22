import Grothe.LowerAnalytic.MomentConeBoundary
open Grothe.LowerAnalytic.MomentCone
#eval boundaryCheck 1 (135/16) (29061/32)
#eval boundaryCheck 1 75 (9054/23)
#eval boundaryCheck 1 75 (9054/23 - 1/1000000)
example : boundaryCheck 1 (135/16) (29061/32) = true := by norm_num [boundaryCheck, boundaryQ]
example : boundaryCheck 1 75 (9054/23) = true := by norm_num [boundaryCheck, boundaryQ]
example : boundaryCheck 1 75 (9054/23 - 1/1000000) = false := by norm_num [boundaryCheck, boundaryQ]
