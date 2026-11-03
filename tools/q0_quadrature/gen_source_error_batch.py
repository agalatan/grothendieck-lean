#!/usr/bin/env python3
"""Reproduce the selected generated source-error modules.

The committed manifest fixes every output independently of existing files.
Each generator has one explicitly excluded audit outside this batch; the
batch's own strict audit covers the delivered conclusions. Generated values
are proof candidates: Lean must check all mathematical statements.
Agent-ID: codex-aa04.
"""
from __future__ import annotations

import argparse
import importlib.util
import json
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[2]
MANIFEST = ROOT / 'data/q0_quadrature/source-error/generated-files.json'
GENERATORS = {
    'gen_legendre_rules': 'Q0LegendreRulesAudit.lean',
    'gen_legendre_weight_rules': 'Q0LegendreWeightRulesAudit.lean',
    'gen_legendre_root_weight': 'Q0LegendreRootWeightRulesAudit.lean',
    'gen_gauss_indexed_context': 'Q0GaussIndexedContextAllAudit.lean',
    'gen_gauss_address_groups': 'Q0GaussAddressAllAudit.lean',
    'gen_gauss_physical_groups': 'Q0GaussPhysicalAllAudit.lean',
    'gen_node_mass_groups': 'Q0NodeMassAllAudit.lean',
    'gen_conditional_source_metadata': 'Q0ConditionalMetadataAudit.lean',
}


def generate() -> dict[Path, bytes]:
    """Validate the full generator output sets, then select the fixed batch."""
    manifest = json.loads(MANIFEST.read_text())
    expected_scripts = {f'tools/q0_quadrature/{name}.py' for name in GENERATORS}
    if (set(manifest) != {'schema_version', 'agent', 'generators'} or
            manifest['schema_version'] != 1 or manifest['agent'] != 'codex-aa04' or
            set(manifest['generators']) != expected_scripts):
        raise ValueError('unexpected source-error manifest schema or generator set')

    result: dict[Path, bytes] = {}
    for name, audit in GENERATORS.items():
        script = f'tools/q0_quadrature/{name}.py'
        entry = manifest['generators'][script]
        excluded = f'Grothe/UpperChaos/{audit}'
        if set(entry) != {'excluded_audit', 'outputs'} or entry['excluded_audit'] != excluded:
            raise ValueError(f'unexpected audit exclusion for {script}')
        expected = entry['outputs']
        if (not isinstance(expected, list) or not expected or
                not all(isinstance(p, str) for p in expected) or
                expected != sorted(set(expected)) or excluded in expected):
            raise ValueError(f'invalid output list for {script}')

        spec = importlib.util.spec_from_file_location(name, ROOT / script)
        if spec is None or spec.loader is None:
            raise ValueError(f'cannot load generator {script}')
        module = importlib.util.module_from_spec(spec)
        # Keep --check read-only, including imported-generator bytecode.
        previous_bytecode_setting = sys.dont_write_bytecode
        try:
            sys.dont_write_bytecode = True
            spec.loader.exec_module(module)
        finally:
            sys.dont_write_bytecode = previous_bytecode_setting
        generated = module.generate()
        if not isinstance(generated, dict):
            raise ValueError(f'unexpected output representation from {script}')

        normalized: dict[str, bytes] = {}
        for path, contents in generated.items():
            path = Path(path)
            if not path.is_absolute():
                path = ROOT / path
            relative = path.relative_to(ROOT)
            if (relative.parent != Path('Grothe/UpperChaos') or relative.suffix != '.lean' or
                    not isinstance(contents, bytes)):
                raise ValueError(f'unexpected generated output from {script}: {relative}')
            key = relative.as_posix()
            if key in normalized:
                raise ValueError(f'duplicate generated output from {script}: {key}')
            normalized[key] = contents
        if set(normalized) != set(expected) | {excluded}:
            missing = sorted((set(expected) | {excluded}) - set(normalized))
            extra = sorted(set(normalized) - (set(expected) | {excluded}))
            raise ValueError(f'output manifest mismatch for {script}: missing={missing}, extra={extra}')
        del normalized[excluded]
        for relative, contents in normalized.items():
            path = ROOT / relative
            if path in result:
                raise ValueError(f'output owned by multiple generators: {relative}')
            result[path] = contents
    return result


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true',
                        help='check the explicit batch byte for byte without writing files')
    args = parser.parse_args()
    generated = generate()
    if args.check:
        mismatches = [str(path.relative_to(ROOT)) for path, contents in generated.items()
                      if not path.is_file() or path.read_bytes() != contents]
        if mismatches:
            raise ValueError('missing/different generated files: ' + ', '.join(mismatches))
    else:
        for path, contents in generated.items():
            path.write_bytes(contents)
    print(f'{len(generated)} generated modules, {sum(map(len, generated.values()))} bytes')


if __name__ == '__main__':
    main()
