/-
Copyright (c) 2026 Alin Galatan. Released under Apache 2.0 license as described in the file LICENSE.
Authors: Alin Galatan
-/
import HaagerupKernel.Basic
import HaagerupKernel.CellKernel
import HaagerupKernel.SmoothedStages
import HaagerupKernel.FastHead
import HaagerupKernel.TaylorHardy

/-!
# The executable checkers

The library `HaagerupKernel` holds the programs that carry out the finite computations of the article: exact integer
arithmetic, integer-interval arithmetic, Taylor models and fixed-point polynomial arithmetic. They do not import
Mathlib. Their soundness (that the result `true` implies the mathematical statement) is proved in the library
`Haagerup`.

* `HaagerupKernel.Basic`: intervals at scale `2⁻¹²⁸`;
* `HaagerupKernel.CellKernel`: sums of squares, Laguerre integrals, overlaps and energies of the cell maps
  (Computations 1–3);
* `HaagerupKernel.SmoothedStages`: the algorithm of the energies (Computation 3) split into stages, for its soundness
  proof;
* `HaagerupKernel.FastHead`: the head sum (Computation 4);
* `HaagerupKernel.TaylorHardy`: Taylor models on circles (Computations 5 and 6).
-/

