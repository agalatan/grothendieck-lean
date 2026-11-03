#!/usr/bin/env python3
"""Bounded kernel-decoder pilots bound to the preserved packed source bytes.

The structural reader is auxiliary until the legacy delimiter bridge is proved.
The four selected chunks are a resource pilot, not the full source identity.
Agent-ID: codex-8c4d.
"""
from __future__ import annotations

import argparse
from hashlib import sha256
import json
from pathlib import Path
import re

from gen_taylor_first_second_integers import ROOT, SPECS, load_spec

LEAN = ROOT / 'Grothe/UpperChaos'
PART_SIZE = 32


def lean_chars(text: str) -> str:
    # These are witnesses for the pinned source, not a restriction on the parser.
    # Literal character cells avoid re-decoding a String at every structural step.
    if not set(text) <= set('0123456789-,:'):
        raise ValueError('Unexpected character in the pinned dyadic source')
    return '[' + ', '.join("'" + c + "'" for c in text) + ']'


def joined(names: list[str], separator: str) -> str:
    # Right association makes each application of row?_append_of_eq bounded.
    if len(names) == 1:
        return names[0]
    return f'{names[0]} ++ {separator}({joined(names[1:], separator)})'


def generate() -> dict[Path, str]:
    files = {}
    manifest = {'scope': 'four packed-source chunk pilots transferring structural decoding '
                'through the generic legacy delimiter theorem; all new Lean and the '
                'complete source family require checker verification',
                'part_size': PART_SIZE, 'sources': {}, 'pilots': [], 'leaf_probes': [],
                'modular_leaves': []}
    for spec in SPECS:
        cap, name = spec[:2]
        _, grades, _, _ = load_spec(spec)  # Recheck pinned NPZ, order and band targets.
        source_path = LEAN / f'Taylor{cap}Data.lean'
        source = source_path.read_text()
        marker = f'def {name}CenterPackedChunks : Array String := #['
        chunks = re.findall(r'"([^"\\]*)"', source.split(marker, 1)[1].split('\n]', 1)[0])
        manifest['sources'][str(source_path.relative_to(ROOT))] = sha256(source_path.read_bytes()).hexdigest()
        flat = [value for grade in grades for value in grade]
        offset = 0
        for index, chunk in enumerate(chunks):
            records = chunk.split(',')
            values = [int(m) * (1 << (206 - int(e)))
                      for m, e in (record.split(':') for record in records)]
            if values != flat[offset:offset + len(values)]:
                raise ValueError(f'{name} chunk {index}: packed/literal witness mismatch')
            offset += len(values)
            if index not in (0, len(chunks) - 1):
                continue
            mod = f'Taylor{cap}PackedChunk{index:03d}Pilot'
            legacy_probe = cap == 'First' and index == len(chunks) - 1
            if legacy_probe:
                # Keep the two readers in separate modules so CI identifies
                # which proof completed before a resource limit. These are
                # auxiliary literals; the full public-array identity is not
                # supplied by an external source-byte replay.
                leaf_mod = f'Taylor{cap}PackedChunk{index:03}StructuralLeaf000'
                legacy_mod = f'Taylor{cap}PackedChunk{index:03}LegacyLeaf000'
                leaf_text = ','.join(records[:PART_SIZE])
                leaf_values = ', '.join(map(str, values[:PART_SIZE]))
                leaf_lines = [
                    'import Grothe.UpperChaos.PackedDyadicStructural', '',
                    '/-! Generated bounded auxiliary leaf from the preserved packed bytes.',
                    'Public-array/source assembly remains a separate proof obligation.',
                    'Agent-ID: codex-8c4d. -/',
                    f'namespace Grothe.UpperChaos.{leaf_mod}',
                    'set_option maxRecDepth 65536',
                    'set_option maxHeartbeats 2000000', '',
                    f'def text : String := {json.dumps(leaf_text)}',
                    f'def chars : List Char := {lean_chars(leaf_text)}',
                    f'def values : List ℤ := [{leaf_values}]', '',
                    'theorem source_string : text = String.ofList chars := by decide +kernel', '',
                    'theorem source_chars : text.toList = chars := by',
                    '  rw [source_string, String.toList_ofList]', '',
                    'theorem structural_decoded :',
                    '    PackedDyadic.Structural.row? 206 text.toList = some values := by',
                    '  rw [source_chars]',
                    '  decide +kernel', '',
                    f'end Grothe.UpperChaos.{leaf_mod}', '',
                    'open Lean Elab Command', 'run_cmd do',
                    f'  for ax in ← Lean.collectAxioms ``Grothe.UpperChaos.{leaf_mod}.structural_decoded do',
                    '    unless #[`propext, `Classical.choice, `Quot.sound].contains ax do',
                    '      throwError m!"structural leaf has forbidden axiom {ax}"', '']
                legacy_lines = [
                    f'import Grothe.UpperChaos.{leaf_mod}',
                    'import Grothe.UpperChaos.PackedDyadicLegacyDelimiter', '',
                    '/-! The unchanged public parser on the bounded auxiliary leaf.',
                    'This does not identify any full public packed array.',
                    'Agent-ID: codex-8c4d. -/',
                    f'namespace Grothe.UpperChaos.{legacy_mod}',
                    f'open {leaf_mod}',
                    'set_option maxRecDepth 65536',
                    'set_option maxHeartbeats 2000000', '',
                    'theorem legacy_decoded : PackedDyadic.parse 206 text = some values.toArray := by',
                    '  rw [PackedDyadic.Structural.parse_eq_row_unconditional, structural_decoded]',
                    '  rfl', '',
                    f'end Grothe.UpperChaos.{legacy_mod}', '',
                    'open Lean Elab Command', 'run_cmd do',
                    f'  for ax in ← Lean.collectAxioms ``Grothe.UpperChaos.{legacy_mod}.legacy_decoded do',
                    '    unless #[`propext, `Classical.choice, `Quot.sound].contains ax do',
                    '      throwError m!"legacy leaf has forbidden axiom {ax}"', '']
                files[LEAN / f'{leaf_mod}.lean'] = '\n'.join(leaf_lines)
                files[LEAN / f'{legacy_mod}.lean'] = '\n'.join(legacy_lines)
                manifest['leaf_probes'].append({
                    'structural_module': leaf_mod, 'legacy_module': legacy_mod,
                    'chunk': index, 'record_start': 0, 'records': min(PART_SIZE, len(records)),
                    'text_utf8_sha256': sha256(leaf_text.encode()).hexdigest(),
                    'scope': 'auxiliary literal reader checks; full public source equality remains open'})
            leaf_imports = []
            for part in range((len(records) + PART_SIZE - 1) // PART_SIZE):
                leaf_imports.append(
                    f'Taylor{cap}PackedChunk{index:03d}StructuralLeaf000'
                    if legacy_probe and part == 0 else f'{mod}Leaf{part:03d}')
            lines = [*(f'import Grothe.UpperChaos.{m}' for m in leaf_imports),
                     f'import Grothe.UpperChaos.Taylor{cap}Data',
                     'import Grothe.UpperChaos.PackedDyadicLegacyDelimiter', '',
                     '/-! Generated by tools/gen_first_second_packed_pilot.py.',
                     'Actual packed-byte structural and unchanged public-decoder identities.',
                     'No whole-family verification is asserted. Agent-ID: codex-8c4d. -/',
                     f'namespace Grothe.UpperChaos.{mod}',
                     'open PackedDyadic.Structural',
                     'set_option maxRecDepth 65536',
                     'set_option maxHeartbeats 2000000', '']
            text_names, value_names = [], []
            for part, start in enumerate(range(0, len(records), PART_SIZE)):
                tag = f'{part:03d}'
                text_names.append(f'text{tag}')
                value_names.append(f'values{tag}')
                text = ','.join(records[start:start + PART_SIZE])
                value_text = ', '.join(map(str, values[start:start + PART_SIZE]))
                leaf = leaf_imports[part]
                if not (legacy_probe and part == 0):
                    leaf_lines = [
                        'import Grothe.UpperChaos.PackedDyadicStructural', '',
                        '/-! Bounded auxiliary witness from the pinned packed source.',
                        'The importing chunk certificate proves the public byte binding.',
                        'Generated by tools/gen_first_second_packed_pilot.py.',
                        'Agent-ID: codex-8c4d. -/',
                        f'namespace Grothe.UpperChaos.{leaf}',
                        'set_option maxRecDepth 65536',
                        'set_option maxHeartbeats 2000000', '',
                        f'def chars : List Char := {lean_chars(text)}',
                        f'def values : List ℤ := [{value_text}]', '',
                        'theorem nonempty : chars ≠ [] := by decide +kernel',
                        'theorem decoded : PackedDyadic.Structural.row? 206 chars = some values := by',
                        '  decide +kernel', '',
                        f'end Grothe.UpperChaos.{leaf}', '',
                        'open Lean Elab Command', 'run_cmd do',
                        f'  for ax in ← Lean.collectAxioms ``Grothe.UpperChaos.{leaf}.decoded do',
                        '    unless #[`propext, `Classical.choice, `Quot.sound].contains ax do',
                        '      throwError m!"packed source leaf has forbidden axiom {ax}"', '']
                    files[LEAN / f'{leaf}.lean'] = '\n'.join(leaf_lines)
                lines += [f'private def text{tag} : List Char := {leaf}.chars',
                          f'private def values{tag} : List ℤ := {leaf}.values']
                if legacy_probe and part == 0:
                    lines += [f'private theorem nonempty{tag} : text{tag} ≠ [] := by decide +kernel',
                              f'private theorem decoded{tag} : row? 206 text{tag} = some values{tag} := by',
                              f'  change row? 206 {leaf}.chars = some {leaf}.values',
                              f'  rw [← {leaf}.source_chars]',
                              f'  exact {leaf}.structural_decoded', '']
                else:
                    lines += [f'private theorem nonempty{tag} : text{tag} ≠ [] := {leaf}.nonempty',
                              f'private theorem decoded{tag} : row? 206 text{tag} = some values{tag} :=',
                              f'  {leaf}.decoded', '']
                manifest['modular_leaves'].append({
                    'module': leaf, 'chunk': index, 'side': name,
                    'part': part, 'records': len(records[start:start + PART_SIZE]),
                    'source_utf8_sha256': sha256(text.encode()).hexdigest(),
                    'reuses_accepted_auxiliary_leaf': legacy_probe and part == 0})
            for part in reversed(range(len(text_names))):
                tag = f'{part:03d}'
                texts = joined(text_names[part:], "',' :: ")
                vals = joined(value_names[part:], '')
                lines += [f'private theorem joined{tag} : row? 206 ({texts}) =',
                          f'    some ({vals}) := by']
                if part == len(text_names) - 1:
                    lines += [f'  exact decoded{tag}']
                else:
                    lines += ['  apply row?_append_of_eq', f'  · exact nonempty{tag}']
                    if part == len(text_names) - 2:
                        lines += [f'  · exact nonempty{part+1:03d}']
                    else:
                        lines += ['  · simp only [List.append_eq_nil_iff, List.cons_ne_nil, and_false, not_false_eq_true]']
                    lines += [f'  · exact decoded{tag}', f'  · exact joined{part+1:03d}']
                lines += ['']
            texts = joined(text_names, "',' :: ")
            vals = joined(value_names, '')
            actual_string = f'({name}CenterPackedChunks[{index}]?.getD "")'
            actual = f'{actual_string}.toList'
            lines += [f'def values : List ℤ := {vals}', '',
                      f'private theorem source_string : {actual_string} =',
                      f'    String.ofList ({texts}) := by',
                      '  decide +kernel', '',
                      f'theorem source_chars : {actual} =', f'    {texts} := by',
                      '  rw [source_string, String.toList_ofList]', '',
                      f'theorem decoded : row? 206 {actual} = some values := by',
                      '  rw [source_chars]', '  exact joined000', '']
            lines += ['/-- The public decoder on these actual bytes, via the delimiter theorem. -/',
                      f'theorem legacy_decoded : PackedDyadic.parse 206',
                      f'    ({name}CenterPackedChunks[{index}]?.getD "") = some values.toArray := by',
                      '  rw [parse_eq_row_unconditional, decoded]',
                      '  rfl', '']
            audit_targets = [f'``Grothe.UpperChaos.{mod}.source_chars',
                             f'``Grothe.UpperChaos.{mod}.decoded']
            audit_targets.append(f'``Grothe.UpperChaos.{mod}.legacy_decoded')
            lines += [
                      f'end Grothe.UpperChaos.{mod}', '',
                      'open Lean Elab Command', 'run_cmd do',
                      '  for target in #[' + ',\n      '.join(audit_targets) + '] do',
                      '    for ax in ← Lean.collectAxioms target do',
                      '      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do',
                      '        throwError m!"{target} has forbidden axiom {ax}"', '']
            path = LEAN / f'{mod}.lean'
            files[path] = '\n'.join(lines)
            manifest['pilots'].append({'module': mod, 'chunk': index,
                                       'records': len(values), 'parts': len(text_names),
                                       'legacy_decoder_identity': True,
                                       'chunk_utf8_sha256': sha256(chunk.encode()).hexdigest()})
        if offset != len(flat):
            raise ValueError(f'{name}: source coverage mismatch')
    manifest['generated_sha256'] = {str(path.relative_to(ROOT)): sha256(text.encode()).hexdigest()
                                    for path, text in files.items()}
    files[ROOT / 'data/first-second-packed-pilot-manifest.json'] = json.dumps(manifest, indent=2) + '\n'
    return files


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    for path, text in generate().items():
        if args.check:
            if not path.exists() or path.read_text() != text:
                raise SystemExit(f'generated source differs: {path.relative_to(ROOT)}')
        else:
            path.write_text(text)
    print('Four modular actual-byte pilots and two bounded reader modules reproduced; Lean checking still required.')


if __name__ == '__main__':
    main()
