#!/usr/bin/env python3
"""Reproduce q0 literal-fold Lean modules from repository-tracked chunk data.

Python generates candidates only. Lean must independently check the emitted
proofs and their source-binding bridge; Python equality is not a proof.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import re
import sys
from pathlib import Path
from typing import Any


def find_root() -> Path:
    for parent in Path(__file__).resolve().parents:
        if (parent / 'lakefile.toml').is_file():
            return parent
    raise ValueError('cannot find repository root; pass --repo-root')


def add3(a: list, b: list, depth: int = 3) -> list | int:
    if depth == 0:
        return a + b
    return [add3(a[i], b[i], depth - 1) if i < len(a) and i < len(b)
            else a[i] if i < len(a) else b[i] for i in range(max(len(a), len(b)))]


def fold_tables(tables: list) -> list:
    result: list = []
    for table in reversed(tables):
        result = add3(table, result)
    return result


def lean_list(value: Any) -> str:
    return json.dumps(value, separators=(',', ':'))


def literal_in_text(text: str, name: str) -> Any:
    matches = re.findall(r'^def literal : DenseWick := (.+)$', text, re.M)
    if len(matches) != 1:
        raise ValueError(f'{name}: missing or duplicate table literal')
    return json.loads(matches[0])


def input_data(root: Path, assembly_name: str = 'Q0SourceChunkAssembly') -> tuple[list, list]:
    source = root / 'Grothe/Upper/Data.lean'
    source_sha = hashlib.sha256(source.read_bytes()).hexdigest()
    lean = root / 'Grothe/UpperChaos'
    coverage = (lean / (assembly_name + '.lean')).read_text(encoding='utf-8')
    match = re.search(r'^def sizes : List Nat := (\[[^\n]*\])$', coverage, re.M)
    if match is None:
        raise ValueError('cannot find canonical source assembly sizes')
    sizes = json.loads(match.group(1))
    if (not isinstance(sizes, list) or len(sizes) != 168 or
            any(type(x) is not int or x <= 0 for x in sizes) or sum(sizes) != 1140):
        raise ValueError('invalid adaptive chunk partition')
    chunks: list = []
    offset = 0
    for count in sizes:
        name = f'Q0Chunk_o{offset}_n{count}'
        text = (lean / f'{name}.lean').read_text(encoding='utf-8')
        if f'Source Data.lean SHA256: {source_sha}' not in text:
            raise ValueError(f'{name}: canonical source fingerprint mismatch')
        if f'Offset {offset}, count {count};' not in text:
            raise ValueError(f'{name}: chunk descriptor mismatch')
        chunks.append(literal_in_text(text, name))
        offset += count
    source_text = (lean / 'Q0LiteralSourceData.lean').read_text(encoding='utf-8')
    source_literal = source_text.split('def sourceCoefficients : List (List (List Int)) := ', 1)[1]
    full_literal = json.loads(source_literal.split('\n\nend ', 1)[0])
    if fold_tables(chunks) != full_literal:
        raise ValueError('Python diagnostic: chunk fold does not equal sourceCoefficients')
    return chunks, full_literal


def group_text(name: str, inputs: list, expected: list, start: int) -> str:
    input_text = ',\n  '.join(lean_list(table) for table in inputs)
    return f'''import Grothe.UpperChaos.Q0LiteralSourceData
import Mathlib.Tactic

/-! Literal group at chunk index {start}; {len(inputs)} inputs.
This is an untrusted literal-only proof attempt, not a source binding.
Agent-ID: codex-8c4d. -/

namespace Grothe.UpperChaos.{name}
open GrotheKernel
open Grothe.UpperChaos.Q0LiteralSourceData
abbrev Dense := List (List (List Int))

set_option maxRecDepth 65536 in
set_option maxHeartbeats 16000000 in
def inputs : List Dense := [
  {input_text}
]

set_option maxRecDepth 65536 in
set_option maxHeartbeats 16000000 in
def expected : Dense := {lean_list(expected)}

set_option maxRecDepth 65536 in
set_option maxHeartbeats 8000000 in
set_option cbv.maxSteps 1000000 in
theorem fold_eq_literal : inputs.foldr add3 [] = expected := by
  cbv

end Grothe.UpperChaos.{name}
'''


def merge_text(i: int, acc: list) -> str:
    name = f'Q0LiteralBinaryMerge_{i:03d}'
    next_name = f'Q0LiteralBinaryMerge_{i+1:03d}'
    next_import = f'Grothe.UpperChaos.{next_name}' if i < 19 else 'Grothe.UpperChaos.Q0LiteralFoldGroup_020'
    next_value = f'{next_name}.value' if i < 19 else 'Q0LiteralFoldGroup_020.expected'
    return f'''import Grothe.UpperChaos.Q0LiteralFoldGroup_{i:03d}
import {next_import}

/-! Untrusted binary sum candidate; `check` validates it in Lean.
Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.{name}
open GrotheKernel
open Grothe.UpperChaos
abbrev Dense := List (List (List Int))

set_option maxRecDepth 65536 in
set_option maxHeartbeats 16000000 in
def value : Dense := {repr(acc)}

set_option maxRecDepth 65536 in
set_option maxHeartbeats 16000000 in
set_option cbv.maxSteps 2000000 in
theorem check : add3 Q0LiteralFoldGroup_{i:03d}.expected {next_value} = value := by
  cbv

end Grothe.UpperChaos.{name}
'''


def fold_text() -> str:
    lines = [
        'import Grothe.UpperChaos.Q0FoldBatchedAlgebra',
        'import Grothe.UpperChaos.Q0LiteralBinaryMerge_000',
        'import Grothe.UpperChaos.Q0LiteralSourceData',
        '', '/-! Binary grouped fold. This proof must itself be compiled. Agent-ID: codex-8c4d. -/',
        'namespace Grothe.UpperChaos.Q0LiteralBinaryFold',
        'open GrotheKernel', 'open Grothe.UpperChaos',
        'open Grothe.UpperChaos.Q0FoldBatchedAlgebra',
        'open Grothe.UpperChaos.Q0LiteralSourceData',
        'abbrev Dense := List (List (List Int))', '',
        'def groups : List (List Dense) := ['
    ]
    lines += [f'  Q0LiteralFoldGroup_{i:03d}.inputs' + (',' if i < 20 else '') for i in range(21)]
    lines += [']', '', 'theorem add3_nil (a : Dense) : add3 a [] = a := by',
              '  cases a <;> rfl', '', 'set_option maxRecDepth 65536 in',
              'set_option maxHeartbeats 16000000 in',
              'theorem fold_eq_literal : groups.flatten.foldr add3 [] = sourceCoefficients := by',
              '  rw [foldr_flatten_batched]',
              '  simp only [groups, List.map_cons, List.map_nil,']
    lines += [f'    Q0LiteralFoldGroup_{i:03d}.fold_eq_literal' + (',' if i < 20 else ']') for i in range(21)]
    lines += ['  simp only [List.foldr_cons, List.foldr_nil, add3_nil]']
    lines += [f'  rw [Q0LiteralBinaryMerge_{i:03d}.check]' for i in reversed(range(20))]
    lines += ['  rfl', '', 'end Grothe.UpperChaos.Q0LiteralBinaryFold', '']
    return '\n'.join(lines)


def rendered_files(chunks: list, full_literal: list) -> dict[str, bytes]:
    output: dict[str, bytes] = {}
    groups: list = []
    for start in range(0, len(chunks), 8):
        group = chunks[start:start + 8]
        expected = fold_tables(group)
        groups.append(expected)
        name = f'Q0LiteralFoldGroup_{start // 8:03d}'
        output[f'{name}.lean'] = group_text(name, group, expected, start).encode()
    if len(groups) != 21:
        raise ValueError('expected 21 groups')
    acc = groups[-1]
    for i in reversed(range(20)):
        acc = add3(groups[i], acc)
        output[f'Q0LiteralBinaryMerge_{i:03d}.lean'] = merge_text(i, acc).encode()
    if acc != full_literal:
        raise ValueError('Python diagnostic: group fold does not equal sourceCoefficients')
    output['Q0LiteralBinaryFold.lean'] = fold_text().encode()
    return output


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--repo-root', type=Path, help='checkout containing tracked inputs')
    parser.add_argument('--output-dir', type=Path, help='write/check target directory')
    parser.add_argument('--assembly-name', default='Q0SourceChunkAssembly')
    parser.add_argument('--check', action='store_true', help='compare target bytes without writing')
    args = parser.parse_args()
    try:
        root = args.repo_root.resolve() if args.repo_root else find_root()
        target = args.output_dir or (root / 'Grothe/UpperChaos')
        chunks, literal = input_data(root, args.assembly_name)
        outputs = rendered_files(chunks, literal)
        if args.check:
            mismatches = []
            for name, expected in sorted(outputs.items()):
                path = target / name
                if not path.is_file() or path.read_bytes() != expected:
                    mismatches.append(name)
            if mismatches:
                print('mismatches: ' + ', '.join(mismatches), file=sys.stderr)
                return 1
            print(f'match: {len(outputs)} Lean files in {target} (21 groups, 20 merges, 1 fold)')
        else:
            target.mkdir(parents=True, exist_ok=True)
            for name, expected in sorted(outputs.items()):
                (target / name).write_bytes(expected)
            print(f'wrote {len(outputs)} untrusted Lean files to {target}; Lean checking required')
        return 0
    except (OSError, ValueError, KeyError, IndexError, json.JSONDecodeError) as error:
        print(f'error: {error}', file=sys.stderr)
        return 2


if __name__ == '__main__':
    raise SystemExit(main())
