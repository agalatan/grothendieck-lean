import Grothe.UpperChaos.Q0NodeMassGroup000
import Grothe.UpperChaos.Q0NodeMassGroup001
import Grothe.UpperChaos.Q0NodeMassGroup002
import Grothe.UpperChaos.Q0NodeMassGroup003
import Grothe.UpperChaos.Q0NodeMassGroup004
import Grothe.UpperChaos.Q0NodeMassGroup005
import Grothe.UpperChaos.Q0NodeMassGroup006
import Grothe.UpperChaos.Q0NodeMassGroup007
import Grothe.UpperChaos.Q0NodeMassGroup008
import Grothe.UpperChaos.Q0NodeMassGroup009
import Grothe.UpperChaos.Q0NodeMassGroup010
import Grothe.UpperChaos.Q0NodeMassGroup011
import Grothe.UpperChaos.Q0NodeMassGroup012
import Grothe.UpperChaos.Q0NodeMassGroup013
import Grothe.UpperChaos.Q0NodeMassGroup014
import Grothe.UpperChaos.Q0NodeMassGroup015
import Grothe.UpperChaos.Q0NodeMassGroup016
import Grothe.UpperChaos.Q0NodeMassGroup017
import Grothe.UpperChaos.Q0NodeMassGroup018
import Grothe.UpperChaos.Q0NodeMassGroup019
import Grothe.UpperChaos.Q0NodeMassGroup020
import Grothe.UpperChaos.Q0NodeMassGroup021

/-! Full candidate-row coverage and exact integer sum. Actual Gauss
node/weight enclosures and their production binding remain separate.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0NodeMassAll

open Grothe.UpperChaos.Q0NodeMassCheck

def rows : List Row := Grothe.UpperChaos.Q0NodeMassGroup000.rows ++ Grothe.UpperChaos.Q0NodeMassGroup001.rows ++ Grothe.UpperChaos.Q0NodeMassGroup002.rows ++ Grothe.UpperChaos.Q0NodeMassGroup003.rows ++ Grothe.UpperChaos.Q0NodeMassGroup004.rows ++ Grothe.UpperChaos.Q0NodeMassGroup005.rows ++ Grothe.UpperChaos.Q0NodeMassGroup006.rows ++ Grothe.UpperChaos.Q0NodeMassGroup007.rows ++ Grothe.UpperChaos.Q0NodeMassGroup008.rows ++ Grothe.UpperChaos.Q0NodeMassGroup009.rows ++ Grothe.UpperChaos.Q0NodeMassGroup010.rows ++ Grothe.UpperChaos.Q0NodeMassGroup011.rows ++ Grothe.UpperChaos.Q0NodeMassGroup012.rows ++ Grothe.UpperChaos.Q0NodeMassGroup013.rows ++ Grothe.UpperChaos.Q0NodeMassGroup014.rows ++ Grothe.UpperChaos.Q0NodeMassGroup015.rows ++ Grothe.UpperChaos.Q0NodeMassGroup016.rows ++ Grothe.UpperChaos.Q0NodeMassGroup017.rows ++ Grothe.UpperChaos.Q0NodeMassGroup018.rows ++ Grothe.UpperChaos.Q0NodeMassGroup019.rows ++ Grothe.UpperChaos.Q0NodeMassGroup020.rows ++ Grothe.UpperChaos.Q0NodeMassGroup021.rows
def addresses : List (ℕ × ℕ × ℕ) := Grothe.UpperChaos.Q0NodeMassGroup000.addresses ++ Grothe.UpperChaos.Q0NodeMassGroup001.addresses ++ Grothe.UpperChaos.Q0NodeMassGroup002.addresses ++ Grothe.UpperChaos.Q0NodeMassGroup003.addresses ++ Grothe.UpperChaos.Q0NodeMassGroup004.addresses ++ Grothe.UpperChaos.Q0NodeMassGroup005.addresses ++ Grothe.UpperChaos.Q0NodeMassGroup006.addresses ++ Grothe.UpperChaos.Q0NodeMassGroup007.addresses ++ Grothe.UpperChaos.Q0NodeMassGroup008.addresses ++ Grothe.UpperChaos.Q0NodeMassGroup009.addresses ++ Grothe.UpperChaos.Q0NodeMassGroup010.addresses ++ Grothe.UpperChaos.Q0NodeMassGroup011.addresses ++ Grothe.UpperChaos.Q0NodeMassGroup012.addresses ++ Grothe.UpperChaos.Q0NodeMassGroup013.addresses ++ Grothe.UpperChaos.Q0NodeMassGroup014.addresses ++ Grothe.UpperChaos.Q0NodeMassGroup015.addresses ++ Grothe.UpperChaos.Q0NodeMassGroup016.addresses ++ Grothe.UpperChaos.Q0NodeMassGroup017.addresses ++ Grothe.UpperChaos.Q0NodeMassGroup018.addresses ++ Grothe.UpperChaos.Q0NodeMassGroup019.addresses ++ Grothe.UpperChaos.Q0NodeMassGroup020.addresses ++ Grothe.UpperChaos.Q0NodeMassGroup021.addresses

theorem checked : rows.all valid = true := by
  simp only [rows, List.all_append, Grothe.UpperChaos.Q0NodeMassGroup000.checked, Grothe.UpperChaos.Q0NodeMassGroup001.checked, Grothe.UpperChaos.Q0NodeMassGroup002.checked, Grothe.UpperChaos.Q0NodeMassGroup003.checked, Grothe.UpperChaos.Q0NodeMassGroup004.checked, Grothe.UpperChaos.Q0NodeMassGroup005.checked, Grothe.UpperChaos.Q0NodeMassGroup006.checked, Grothe.UpperChaos.Q0NodeMassGroup007.checked, Grothe.UpperChaos.Q0NodeMassGroup008.checked, Grothe.UpperChaos.Q0NodeMassGroup009.checked, Grothe.UpperChaos.Q0NodeMassGroup010.checked, Grothe.UpperChaos.Q0NodeMassGroup011.checked, Grothe.UpperChaos.Q0NodeMassGroup012.checked, Grothe.UpperChaos.Q0NodeMassGroup013.checked, Grothe.UpperChaos.Q0NodeMassGroup014.checked, Grothe.UpperChaos.Q0NodeMassGroup015.checked, Grothe.UpperChaos.Q0NodeMassGroup016.checked, Grothe.UpperChaos.Q0NodeMassGroup017.checked, Grothe.UpperChaos.Q0NodeMassGroup018.checked, Grothe.UpperChaos.Q0NodeMassGroup019.checked, Grothe.UpperChaos.Q0NodeMassGroup020.checked, Grothe.UpperChaos.Q0NodeMassGroup021.checked, Bool.and_self]

theorem positions : (rows.map (fun r => (r.index, r.panel, r.rule))) = addresses := by
  simp only [rows, addresses, List.map_append, Grothe.UpperChaos.Q0NodeMassGroup000.positions, Grothe.UpperChaos.Q0NodeMassGroup001.positions, Grothe.UpperChaos.Q0NodeMassGroup002.positions, Grothe.UpperChaos.Q0NodeMassGroup003.positions, Grothe.UpperChaos.Q0NodeMassGroup004.positions, Grothe.UpperChaos.Q0NodeMassGroup005.positions, Grothe.UpperChaos.Q0NodeMassGroup006.positions, Grothe.UpperChaos.Q0NodeMassGroup007.positions, Grothe.UpperChaos.Q0NodeMassGroup008.positions, Grothe.UpperChaos.Q0NodeMassGroup009.positions, Grothe.UpperChaos.Q0NodeMassGroup010.positions, Grothe.UpperChaos.Q0NodeMassGroup011.positions, Grothe.UpperChaos.Q0NodeMassGroup012.positions, Grothe.UpperChaos.Q0NodeMassGroup013.positions, Grothe.UpperChaos.Q0NodeMassGroup014.positions, Grothe.UpperChaos.Q0NodeMassGroup015.positions, Grothe.UpperChaos.Q0NodeMassGroup016.positions, Grothe.UpperChaos.Q0NodeMassGroup017.positions, Grothe.UpperChaos.Q0NodeMassGroup018.positions, Grothe.UpperChaos.Q0NodeMassGroup019.positions, Grothe.UpperChaos.Q0NodeMassGroup020.positions, Grothe.UpperChaos.Q0NodeMassGroup021.positions]

theorem indices : rows.map Row.index = List.range' 0 21577 := by
  simp only [rows, List.map_append, Grothe.UpperChaos.Q0NodeMassGroup000.indices, Grothe.UpperChaos.Q0NodeMassGroup001.indices, Grothe.UpperChaos.Q0NodeMassGroup002.indices, Grothe.UpperChaos.Q0NodeMassGroup003.indices, Grothe.UpperChaos.Q0NodeMassGroup004.indices, Grothe.UpperChaos.Q0NodeMassGroup005.indices, Grothe.UpperChaos.Q0NodeMassGroup006.indices, Grothe.UpperChaos.Q0NodeMassGroup007.indices, Grothe.UpperChaos.Q0NodeMassGroup008.indices, Grothe.UpperChaos.Q0NodeMassGroup009.indices, Grothe.UpperChaos.Q0NodeMassGroup010.indices, Grothe.UpperChaos.Q0NodeMassGroup011.indices, Grothe.UpperChaos.Q0NodeMassGroup012.indices, Grothe.UpperChaos.Q0NodeMassGroup013.indices, Grothe.UpperChaos.Q0NodeMassGroup014.indices, Grothe.UpperChaos.Q0NodeMassGroup015.indices, Grothe.UpperChaos.Q0NodeMassGroup016.indices, Grothe.UpperChaos.Q0NodeMassGroup017.indices, Grothe.UpperChaos.Q0NodeMassGroup018.indices, Grothe.UpperChaos.Q0NodeMassGroup019.indices, Grothe.UpperChaos.Q0NodeMassGroup020.indices, Grothe.UpperChaos.Q0NodeMassGroup021.indices, List.append_assoc]
  rw [← List.range'_append_1 (s := 0) (m := 1024) (n := 20553),
    ← List.range'_append_1 (s := 1024) (m := 1024) (n := 19529),
    ← List.range'_append_1 (s := 2048) (m := 1024) (n := 18505),
    ← List.range'_append_1 (s := 3072) (m := 1024) (n := 17481),
    ← List.range'_append_1 (s := 4096) (m := 1024) (n := 16457),
    ← List.range'_append_1 (s := 5120) (m := 1024) (n := 15433),
    ← List.range'_append_1 (s := 6144) (m := 1024) (n := 14409),
    ← List.range'_append_1 (s := 7168) (m := 1024) (n := 13385),
    ← List.range'_append_1 (s := 8192) (m := 1024) (n := 12361),
    ← List.range'_append_1 (s := 9216) (m := 1024) (n := 11337),
    ← List.range'_append_1 (s := 10240) (m := 1024) (n := 10313),
    ← List.range'_append_1 (s := 11264) (m := 1024) (n := 9289),
    ← List.range'_append_1 (s := 12288) (m := 1024) (n := 8265),
    ← List.range'_append_1 (s := 13312) (m := 1024) (n := 7241),
    ← List.range'_append_1 (s := 14336) (m := 1024) (n := 6217),
    ← List.range'_append_1 (s := 15360) (m := 1024) (n := 5193),
    ← List.range'_append_1 (s := 16384) (m := 1024) (n := 4169),
    ← List.range'_append_1 (s := 17408) (m := 1024) (n := 3145),
    ← List.range'_append_1 (s := 18432) (m := 1024) (n := 2121),
    ← List.range'_append_1 (s := 19456) (m := 1024) (n := 1097),
    ← List.range'_append_1 (s := 20480) (m := 1024) (n := 73)]

theorem ordinal_nodup : (rows.map Row.index).Nodup := by
  rw [indices]
  exact List.nodup_range' _

theorem count : rows.length = 21577 := by
  simp only [rows, List.length_append, Grothe.UpperChaos.Q0NodeMassGroup000.count, Grothe.UpperChaos.Q0NodeMassGroup001.count, Grothe.UpperChaos.Q0NodeMassGroup002.count, Grothe.UpperChaos.Q0NodeMassGroup003.count, Grothe.UpperChaos.Q0NodeMassGroup004.count, Grothe.UpperChaos.Q0NodeMassGroup005.count, Grothe.UpperChaos.Q0NodeMassGroup006.count, Grothe.UpperChaos.Q0NodeMassGroup007.count, Grothe.UpperChaos.Q0NodeMassGroup008.count, Grothe.UpperChaos.Q0NodeMassGroup009.count, Grothe.UpperChaos.Q0NodeMassGroup010.count, Grothe.UpperChaos.Q0NodeMassGroup011.count, Grothe.UpperChaos.Q0NodeMassGroup012.count, Grothe.UpperChaos.Q0NodeMassGroup013.count, Grothe.UpperChaos.Q0NodeMassGroup014.count, Grothe.UpperChaos.Q0NodeMassGroup015.count, Grothe.UpperChaos.Q0NodeMassGroup016.count, Grothe.UpperChaos.Q0NodeMassGroup017.count, Grothe.UpperChaos.Q0NodeMassGroup018.count, Grothe.UpperChaos.Q0NodeMassGroup019.count, Grothe.UpperChaos.Q0NodeMassGroup020.count, Grothe.UpperChaos.Q0NodeMassGroup021.count]

theorem total : (rows.map Row.termUpper).sum = 1066666667250074236 := by
  simp only [rows, List.map_append, List.sum_append, Grothe.UpperChaos.Q0NodeMassGroup000.total, Grothe.UpperChaos.Q0NodeMassGroup001.total, Grothe.UpperChaos.Q0NodeMassGroup002.total, Grothe.UpperChaos.Q0NodeMassGroup003.total, Grothe.UpperChaos.Q0NodeMassGroup004.total, Grothe.UpperChaos.Q0NodeMassGroup005.total, Grothe.UpperChaos.Q0NodeMassGroup006.total, Grothe.UpperChaos.Q0NodeMassGroup007.total, Grothe.UpperChaos.Q0NodeMassGroup008.total, Grothe.UpperChaos.Q0NodeMassGroup009.total, Grothe.UpperChaos.Q0NodeMassGroup010.total, Grothe.UpperChaos.Q0NodeMassGroup011.total, Grothe.UpperChaos.Q0NodeMassGroup012.total, Grothe.UpperChaos.Q0NodeMassGroup013.total, Grothe.UpperChaos.Q0NodeMassGroup014.total, Grothe.UpperChaos.Q0NodeMassGroup015.total, Grothe.UpperChaos.Q0NodeMassGroup016.total, Grothe.UpperChaos.Q0NodeMassGroup017.total, Grothe.UpperChaos.Q0NodeMassGroup018.total, Grothe.UpperChaos.Q0NodeMassGroup019.total, Grothe.UpperChaos.Q0NodeMassGroup020.total, Grothe.UpperChaos.Q0NodeMassGroup021.total]

theorem each_valid (r : Row) (hr : r ∈ rows) : valid r = true :=
  (List.all_eq_true.mp checked) r hr

theorem total_lt_cap : (rows.map Row.termUpper).sum * 100 < 107 * (10^18 : ℕ) := by
  rw [total]
  decide +kernel

end Grothe.UpperChaos.Q0NodeMassAll
