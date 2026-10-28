import Grothe.UpperChaos.Q0ConditionalPairRankGroup000
import Grothe.UpperChaos.Q0ConditionalPairRankGroup001
import Grothe.UpperChaos.Q0ConditionalPairRankGroup002
import Grothe.UpperChaos.Q0ConditionalPairRankGroup003
import Grothe.UpperChaos.Q0ConditionalPairRankGroup004
import Grothe.UpperChaos.Q0ConditionalPairRankGroup005
import Grothe.UpperChaos.Q0ConditionalPairRankGroup006
import Grothe.UpperChaos.Q0ConditionalPairRankGroup007
import Grothe.UpperChaos.Q0ConditionalPairRankGroup008
import Grothe.UpperChaos.Q0ConditionalPairRankGroup009
import Grothe.UpperChaos.Q0ConditionalPairRankGroup010
import Grothe.UpperChaos.Q0ConditionalPairRankGroup011
import Grothe.UpperChaos.Q0ConditionalPairRankGroup012
import Grothe.UpperChaos.Q0ConditionalPairRankGroup013
import Grothe.UpperChaos.Q0ConditionalPairRankGroup014
import Grothe.UpperChaos.Q0ConditionalPairRankGroup015
import Grothe.UpperChaos.Q0ConditionalPairRankGroup016
import Grothe.UpperChaos.Q0ConditionalPairRankGroup017
import Grothe.UpperChaos.Q0ConditionalPairRankGroup018
import Grothe.UpperChaos.Q0ConditionalPairRankGroup019
import Grothe.UpperChaos.Q0ConditionalPairRankGroup020
import Grothe.UpperChaos.Q0ConditionalPairRankGroup021
import Grothe.UpperChaos.Q0ConditionalPairRankGroup022
import Grothe.UpperChaos.Q0ConditionalPairRankGroup023
import Grothe.UpperChaos.Q0ConditionalPairRankGroup024
import Grothe.UpperChaos.Q0ConditionalPairRankGroup025
import Grothe.UpperChaos.Q0ConditionalPairRankGroup026
import Grothe.UpperChaos.Q0ConditionalPairRankGroup027
import Grothe.UpperChaos.Q0ConditionalPairRankGroup028
import Grothe.UpperChaos.Q0ConditionalPairRankGroup029
import Grothe.UpperChaos.Q0ConditionalPairRankGroup030
import Grothe.UpperChaos.Q0ConditionalPairRankGroup031
import Grothe.UpperChaos.Q0ConditionalPairRankGroup032
import Grothe.UpperChaos.Q0ConditionalPairRankGroup033
import Grothe.UpperChaos.Q0ConditionalPairRankGroup034

/-! All 35,777 original pair ranks and finite lookup coverage.
The historical NPY bytes are not interpreted by this theorem.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0ConditionalPairRankAll

open Grothe.UpperChaos.Q0ConditionalPairRankCheck

def rows : List Row := Grothe.UpperChaos.Q0ConditionalPairRankGroup000.rows ++ Grothe.UpperChaos.Q0ConditionalPairRankGroup001.rows ++ Grothe.UpperChaos.Q0ConditionalPairRankGroup002.rows ++ Grothe.UpperChaos.Q0ConditionalPairRankGroup003.rows ++ Grothe.UpperChaos.Q0ConditionalPairRankGroup004.rows ++ Grothe.UpperChaos.Q0ConditionalPairRankGroup005.rows ++ Grothe.UpperChaos.Q0ConditionalPairRankGroup006.rows ++ Grothe.UpperChaos.Q0ConditionalPairRankGroup007.rows ++ Grothe.UpperChaos.Q0ConditionalPairRankGroup008.rows ++ Grothe.UpperChaos.Q0ConditionalPairRankGroup009.rows ++ Grothe.UpperChaos.Q0ConditionalPairRankGroup010.rows ++ Grothe.UpperChaos.Q0ConditionalPairRankGroup011.rows ++ Grothe.UpperChaos.Q0ConditionalPairRankGroup012.rows ++ Grothe.UpperChaos.Q0ConditionalPairRankGroup013.rows ++ Grothe.UpperChaos.Q0ConditionalPairRankGroup014.rows ++ Grothe.UpperChaos.Q0ConditionalPairRankGroup015.rows ++ Grothe.UpperChaos.Q0ConditionalPairRankGroup016.rows ++ Grothe.UpperChaos.Q0ConditionalPairRankGroup017.rows ++ Grothe.UpperChaos.Q0ConditionalPairRankGroup018.rows ++ Grothe.UpperChaos.Q0ConditionalPairRankGroup019.rows ++ Grothe.UpperChaos.Q0ConditionalPairRankGroup020.rows ++ Grothe.UpperChaos.Q0ConditionalPairRankGroup021.rows ++ Grothe.UpperChaos.Q0ConditionalPairRankGroup022.rows ++ Grothe.UpperChaos.Q0ConditionalPairRankGroup023.rows ++ Grothe.UpperChaos.Q0ConditionalPairRankGroup024.rows ++ Grothe.UpperChaos.Q0ConditionalPairRankGroup025.rows ++ Grothe.UpperChaos.Q0ConditionalPairRankGroup026.rows ++ Grothe.UpperChaos.Q0ConditionalPairRankGroup027.rows ++ Grothe.UpperChaos.Q0ConditionalPairRankGroup028.rows ++ Grothe.UpperChaos.Q0ConditionalPairRankGroup029.rows ++ Grothe.UpperChaos.Q0ConditionalPairRankGroup030.rows ++ Grothe.UpperChaos.Q0ConditionalPairRankGroup031.rows ++ Grothe.UpperChaos.Q0ConditionalPairRankGroup032.rows ++ Grothe.UpperChaos.Q0ConditionalPairRankGroup033.rows ++ Grothe.UpperChaos.Q0ConditionalPairRankGroup034.rows

theorem checked : rows.all valid = true := by
  simp only [rows, List.all_append, Grothe.UpperChaos.Q0ConditionalPairRankGroup000.checked, Grothe.UpperChaos.Q0ConditionalPairRankGroup001.checked, Grothe.UpperChaos.Q0ConditionalPairRankGroup002.checked, Grothe.UpperChaos.Q0ConditionalPairRankGroup003.checked, Grothe.UpperChaos.Q0ConditionalPairRankGroup004.checked, Grothe.UpperChaos.Q0ConditionalPairRankGroup005.checked, Grothe.UpperChaos.Q0ConditionalPairRankGroup006.checked, Grothe.UpperChaos.Q0ConditionalPairRankGroup007.checked, Grothe.UpperChaos.Q0ConditionalPairRankGroup008.checked, Grothe.UpperChaos.Q0ConditionalPairRankGroup009.checked, Grothe.UpperChaos.Q0ConditionalPairRankGroup010.checked, Grothe.UpperChaos.Q0ConditionalPairRankGroup011.checked, Grothe.UpperChaos.Q0ConditionalPairRankGroup012.checked, Grothe.UpperChaos.Q0ConditionalPairRankGroup013.checked, Grothe.UpperChaos.Q0ConditionalPairRankGroup014.checked, Grothe.UpperChaos.Q0ConditionalPairRankGroup015.checked, Grothe.UpperChaos.Q0ConditionalPairRankGroup016.checked, Grothe.UpperChaos.Q0ConditionalPairRankGroup017.checked, Grothe.UpperChaos.Q0ConditionalPairRankGroup018.checked, Grothe.UpperChaos.Q0ConditionalPairRankGroup019.checked, Grothe.UpperChaos.Q0ConditionalPairRankGroup020.checked, Grothe.UpperChaos.Q0ConditionalPairRankGroup021.checked, Grothe.UpperChaos.Q0ConditionalPairRankGroup022.checked, Grothe.UpperChaos.Q0ConditionalPairRankGroup023.checked, Grothe.UpperChaos.Q0ConditionalPairRankGroup024.checked, Grothe.UpperChaos.Q0ConditionalPairRankGroup025.checked, Grothe.UpperChaos.Q0ConditionalPairRankGroup026.checked, Grothe.UpperChaos.Q0ConditionalPairRankGroup027.checked, Grothe.UpperChaos.Q0ConditionalPairRankGroup028.checked, Grothe.UpperChaos.Q0ConditionalPairRankGroup029.checked, Grothe.UpperChaos.Q0ConditionalPairRankGroup030.checked, Grothe.UpperChaos.Q0ConditionalPairRankGroup031.checked, Grothe.UpperChaos.Q0ConditionalPairRankGroup032.checked, Grothe.UpperChaos.Q0ConditionalPairRankGroup033.checked, Grothe.UpperChaos.Q0ConditionalPairRankGroup034.checked, Bool.and_self]

theorem indices : rows.map Row.index = List.range' 0 35777 := by
  simp only [rows, List.map_append, Grothe.UpperChaos.Q0ConditionalPairRankGroup000.indices, Grothe.UpperChaos.Q0ConditionalPairRankGroup001.indices, Grothe.UpperChaos.Q0ConditionalPairRankGroup002.indices, Grothe.UpperChaos.Q0ConditionalPairRankGroup003.indices, Grothe.UpperChaos.Q0ConditionalPairRankGroup004.indices, Grothe.UpperChaos.Q0ConditionalPairRankGroup005.indices, Grothe.UpperChaos.Q0ConditionalPairRankGroup006.indices, Grothe.UpperChaos.Q0ConditionalPairRankGroup007.indices, Grothe.UpperChaos.Q0ConditionalPairRankGroup008.indices, Grothe.UpperChaos.Q0ConditionalPairRankGroup009.indices, Grothe.UpperChaos.Q0ConditionalPairRankGroup010.indices, Grothe.UpperChaos.Q0ConditionalPairRankGroup011.indices, Grothe.UpperChaos.Q0ConditionalPairRankGroup012.indices, Grothe.UpperChaos.Q0ConditionalPairRankGroup013.indices, Grothe.UpperChaos.Q0ConditionalPairRankGroup014.indices, Grothe.UpperChaos.Q0ConditionalPairRankGroup015.indices, Grothe.UpperChaos.Q0ConditionalPairRankGroup016.indices, Grothe.UpperChaos.Q0ConditionalPairRankGroup017.indices, Grothe.UpperChaos.Q0ConditionalPairRankGroup018.indices, Grothe.UpperChaos.Q0ConditionalPairRankGroup019.indices, Grothe.UpperChaos.Q0ConditionalPairRankGroup020.indices, Grothe.UpperChaos.Q0ConditionalPairRankGroup021.indices, Grothe.UpperChaos.Q0ConditionalPairRankGroup022.indices, Grothe.UpperChaos.Q0ConditionalPairRankGroup023.indices, Grothe.UpperChaos.Q0ConditionalPairRankGroup024.indices, Grothe.UpperChaos.Q0ConditionalPairRankGroup025.indices, Grothe.UpperChaos.Q0ConditionalPairRankGroup026.indices, Grothe.UpperChaos.Q0ConditionalPairRankGroup027.indices, Grothe.UpperChaos.Q0ConditionalPairRankGroup028.indices, Grothe.UpperChaos.Q0ConditionalPairRankGroup029.indices, Grothe.UpperChaos.Q0ConditionalPairRankGroup030.indices, Grothe.UpperChaos.Q0ConditionalPairRankGroup031.indices, Grothe.UpperChaos.Q0ConditionalPairRankGroup032.indices, Grothe.UpperChaos.Q0ConditionalPairRankGroup033.indices, Grothe.UpperChaos.Q0ConditionalPairRankGroup034.indices, List.append_assoc]
  rw [← List.range'_append_1 (s := 0) (m := 1024) (n := 34753),
    ← List.range'_append_1 (s := 1024) (m := 1024) (n := 33729),
    ← List.range'_append_1 (s := 2048) (m := 1024) (n := 32705),
    ← List.range'_append_1 (s := 3072) (m := 1024) (n := 31681),
    ← List.range'_append_1 (s := 4096) (m := 1024) (n := 30657),
    ← List.range'_append_1 (s := 5120) (m := 1024) (n := 29633),
    ← List.range'_append_1 (s := 6144) (m := 1024) (n := 28609),
    ← List.range'_append_1 (s := 7168) (m := 1024) (n := 27585),
    ← List.range'_append_1 (s := 8192) (m := 1024) (n := 26561),
    ← List.range'_append_1 (s := 9216) (m := 1024) (n := 25537),
    ← List.range'_append_1 (s := 10240) (m := 1024) (n := 24513),
    ← List.range'_append_1 (s := 11264) (m := 1024) (n := 23489),
    ← List.range'_append_1 (s := 12288) (m := 1024) (n := 22465),
    ← List.range'_append_1 (s := 13312) (m := 1024) (n := 21441),
    ← List.range'_append_1 (s := 14336) (m := 1024) (n := 20417),
    ← List.range'_append_1 (s := 15360) (m := 1024) (n := 19393),
    ← List.range'_append_1 (s := 16384) (m := 1024) (n := 18369),
    ← List.range'_append_1 (s := 17408) (m := 1024) (n := 17345),
    ← List.range'_append_1 (s := 18432) (m := 1024) (n := 16321),
    ← List.range'_append_1 (s := 19456) (m := 1024) (n := 15297),
    ← List.range'_append_1 (s := 20480) (m := 1024) (n := 14273),
    ← List.range'_append_1 (s := 21504) (m := 1024) (n := 13249),
    ← List.range'_append_1 (s := 22528) (m := 1024) (n := 12225),
    ← List.range'_append_1 (s := 23552) (m := 1024) (n := 11201),
    ← List.range'_append_1 (s := 24576) (m := 1024) (n := 10177),
    ← List.range'_append_1 (s := 25600) (m := 1024) (n := 9153),
    ← List.range'_append_1 (s := 26624) (m := 1024) (n := 8129),
    ← List.range'_append_1 (s := 27648) (m := 1024) (n := 7105),
    ← List.range'_append_1 (s := 28672) (m := 1024) (n := 6081),
    ← List.range'_append_1 (s := 29696) (m := 1024) (n := 5057),
    ← List.range'_append_1 (s := 30720) (m := 1024) (n := 4033),
    ← List.range'_append_1 (s := 31744) (m := 1024) (n := 3009),
    ← List.range'_append_1 (s := 32768) (m := 1024) (n := 1985),
    ← List.range'_append_1 (s := 33792) (m := 1024) (n := 961)]

/-- Every index of the original pair table selects exactly one row. -/
theorem unique_row (i : Fin 35777) :
    ∃! r : Row, r ∈ rows ∧ r.index = i.val :=
  Grothe.UpperChaos.Q0OrdinalCoverage.exists_unique_of_map_range Row.index
    rows 35777 indices i.val i.isLt

noncomputable def rowAt (i : Fin 35777) : Row :=
  Classical.choose (unique_row i).exists

theorem rowAt_spec (i : Fin 35777) :
    rowAt i ∈ rows ∧ (rowAt i).index = i.val ∧ valid (rowAt i) = true := by
  have h := Classical.choose_spec (unique_row i).exists
  exact ⟨h.1, h.2, (List.all_eq_true.mp checked) (rowAt i) h.1⟩

/-- The selected literal pair computes exactly its ordinal rank. -/
theorem rowAt_rank (i : Fin 35777) :
    rank (rowAt i).c (rowAt i).d = i.val := by
  have h := rowAt_spec i
  exact (valid_sound (rowAt i) h.2.2).1.symm.trans h.2.1

/-- No two saved rows contain the same canonical pair. -/
theorem pair_unique {r s : Row} (hr : r ∈ rows) (hs : s ∈ rows)
    (hc : r.c = s.c) (hd : r.d = s.d) : r = s := by
  have vr := valid_sound r ((List.all_eq_true.mp checked) r hr)
  have vs := valid_sound s ((List.all_eq_true.mp checked) s hs)
  have hi : r.index = s.index := by rw [vr.1, vs.1, hc, hd]
  have hn : (rows.map Row.index).Nodup := by
    rw [indices]; exact List.nodup_range' _
  exact List.inj_on_of_nodup_map hn hr hs hi

end Grothe.UpperChaos.Q0ConditionalPairRankAll
