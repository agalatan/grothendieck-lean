#!/usr/bin/env python3
"""Pure q0 Wick chunk construction; generated Lean files remain untrusted."""
from collections import defaultdict
from fractions import Fraction
from math import comb, factorial, lcm
import json

def choose(n: int, k: int) -> int:
    return comb(n, k) if 0 <= k <= n else 0


def make_table(terms, denominator):
    values = defaultdict(int)
    lengths = {}
    raw_count = 0
    raw_denominator = 1
    for a, b, c, d in terms:
        for k in range(c + 1):
            p, q = b + k, b + c - k
            for j in range((2 * b + c + 2) // 2 + 1):
                n = 2 * b + c + 2 - 2 * j
                factor = (2 * choose(p + 1, j) * choose(q + 1, j)
                          - choose(p + 2, j) * choose(q, j)
                          - choose(p, j) * choose(q + 2, j))
                raw_value = (d * choose(c, k) * factor * factorial(j) * (-1) ** n
                             / (4 * 2 ** c))
                raw_denominator = lcm(raw_denominator, raw_value.denominator)
                value = raw_value * denominator
                if value.denominator != 1:
                    raise ValueError("the supplied denominator does not clear this entry")
                i, z = a + b + c + 1 - j, j + 1
                values[i, z, n] += value.numerator
                lengths[i, z] = max(lengths.get((i, z), 0), n + 1)
                raw_count += 1
    if not lengths:
        return [], raw_count, raw_denominator
    table = []
    for i in range(max(i for i, _ in lengths) + 1):
        js = [j for ii, j in lengths if ii == i]
        table.append([[values[i, j, n] for n in range(lengths.get((i, j), 0))]
                      for j in range(max(js) + 1 if js else 0)])
    return table, raw_count, raw_denominator



def emit_chunk(terms, source_denominator, offset, count, source_hash):
    """Return both Lean modules and exact local statistics, without filesystem writes."""
    selected = terms[offset:offset + count]
    if offset < 0 or count <= 0 or len(selected) != count:
        raise ValueError("invalid source chunk")
    table, raw_count, raw_denominator = make_table(selected, source_denominator)
    label = f"Q0Chunk_o{offset}_n{count}"
    literal = json.dumps(table, separators=(",", ":"))
    module = f'''import Grothe.UpperChaos.Q0WickChunking
import Grothe.UpperChaos.Q0LiteralSourceData
import Mathlib.Tactic

/-! Untrusted generated data; Lean checks this exact chunk by `cbv`.
Source Data.lean SHA256: {source_hash}
Offset {offset}, count {count}; no full-table claim.
Agent-ID: codex-8c4d. -/

namespace Grothe.UpperChaos.{label}

open Grothe.UpperChaos.Q0WickChunking
open Grothe.UpperChaos.Q0LiteralSourceData

set_option maxRecDepth 65536 in
def literal : DenseWick := {literal}

set_option maxRecDepth 65536 in
set_option maxHeartbeats 8000000 in
set_option cbv.maxSteps 1000000 in
theorem check_source_strings :
    sourceChunkDense sourceDen
      (((Grothe.Upper.phaseStrs.drop {offset}).take {count}).map GrotheKernel.parseTerm) =
        literal := by
  cbv

theorem check_phaseTerms :
    sourceChunkDense sourceDen ((phaseTerms.drop {offset}).take {count}) = literal := by
  rw [phaseTerms, ← List.map_drop, ← List.map_take]
  exact check_source_strings

end Grothe.UpperChaos.{label}
'''
    den_label = f"Q0ChunkDen_o{offset}_n{count}"
    den_module = f'''import Grothe.UpperChaos.Q0RawWickDefs
import Mathlib.Tactic

/-! Untrusted candidate checked against actual parsed source via `cbv`.
Source Data.lean SHA256: {source_hash}
Offset {offset}, count {count}; no full-denominator claim.
Agent-ID: codex-8c4d. -/

namespace Grothe.UpperChaos.{den_label}

set_option maxRecDepth 65536 in
set_option maxHeartbeats 8000000 in
set_option cbv.maxSteps 1000000 in
theorem raw_chunk_commonDen :
    GrotheKernel.commonDen
      (Grothe.UpperChaos.Q0RawWickTerms.rawWickEntries
        (((Grothe.Upper.phaseStrs.drop {offset}).take {count}).map GrotheKernel.parseTerm)) =
      {raw_denominator} := by
  cbv

theorem raw_phaseTerms_commonDen :
    GrotheKernel.commonDen
      (Grothe.UpperChaos.Q0RawWickTerms.rawWickEntries
        ((phaseTerms.drop {offset}).take {count})) = {raw_denominator} := by
  rw [phaseTerms, ← List.map_drop, ← List.map_take]
  exact raw_chunk_commonDen

end Grothe.UpperChaos.{den_label}
'''
    return {
        f"{label}.lean": module,
        f"{den_label}.lean": den_module,
    }, raw_count, raw_denominator
