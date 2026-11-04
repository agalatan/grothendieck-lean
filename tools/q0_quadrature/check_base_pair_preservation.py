#!/usr/bin/env python3
"""Replay source-preservation checks for the bounded certificate generator.

Agent-ID: codex-7c2e. Compare against an immutable original Git commit,
regenerate all51 leaves without numerical discovery, and write evidence only
under --out. This is source evidence, not a Lean or RSS acceptance claim.
"""
import difflib
import hashlib
import argparse
import subprocess
import types
import json
import re
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
TOOLS = ROOT / 'tools/q0_quadrature'
sys.path.insert(0, str(TOOLS))
import gen_base_pair_checks as split
import gen_base_pair_root10 as changed

BASELINE = '3fcf0181bbd27708894713e2a458ca51054e2d36'
SOURCE_FILES = [
    'Grothe/UpperChaos/RectangleHornerTraceStep.lean',
    'tools/q0_quadrature/gen_base_pair_checks.py',
    'tools/q0_quadrature/gen_base_pair_root10.py',
    'tools/q0_quadrature/gen_base_pair_root2.py',
    'tools/q0_quadrature/gen_base_pair_root6.py',
]


def git_source(relative, missing=False):
    p = subprocess.run(['git', 'show', BASELINE + ':' + str(relative)],
                       cwd=ROOT, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    if p.returncode:
        if missing and subprocess.run(['git', 'cat-file', '-e', BASELINE],
                                      cwd=ROOT, capture_output=True).returncode == 0:
            return b''
        raise RuntimeError(p.stderr.decode())
    return p.stdout


baseline = types.ModuleType('baseline_root10')
baseline.__file__ = str(TOOLS / 'gen_base_pair_root10.py')
exec(compile(git_source('tools/q0_quadrature/gen_base_pair_root10.py'),
             baseline.__file__, 'exec'), baseline.__dict__)


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def family(renderer, root, raw, recipe):
    outputs = renderer.generate(raw, recipe)
    if root == 10:
        return outputs
    countword = {2: 'twenty-four', 6: 'fifteen'}[root]
    result = {}
    for name, source in outputs.items():
        name = name.replace('Q0BasePairRoot10', f'Q0BasePairRoot{root}')
        source = (source.replace('Q0BasePairRoot10', f'Q0BasePairRoot{root}')
                  .replace('retained root 10', f'retained root {root}')
                  .replace('All twelve actual cell integrals of root 10',
                           f'All {countword} actual cell integrals of root {root}')
                  .replace('Root 10 integral audit', f'Root {root} integral audit')
                  .replace('gen_base_pair_root10.py', f'gen_base_pair_root{root}.py'))
        result[name] = source
    return result


def definitions(source, first, stop):
    return {name: body for kind, name, body in
            split.declarations(source[source.index(first):source.index(stop)]) if kind == 'def'}


def no_cycle(outputs):
    adjacency = {}
    for name, source in outputs.items():
        adjacency[name] = [m + '.lean' for m in re.findall(
            r'^import Grothe\.UpperChaos\.([A-Za-z0-9_]+)$', source, re.M)
            if m + '.lean' in outputs]
    done, active = set(), set()

    def visit(name):
        if name in done:
            return
        assert name not in active, f'import cycle at {name}'
        active.add(name)
        for child in adjacency[name]:
            visit(child)
        active.remove(name)
        done.add(name)

    for name in adjacency:
        visit(name)
    return adjacency


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--out', type=Path, default=ROOT / 'handoff/certificate-memory/replay')
    args = parser.parse_args()
    here = args.out.resolve()
    here.mkdir(parents=True, exist_ok=True)
    (here / 'samples').mkdir(exist_ok=True)
    samples = {2: '0011', 6: '0011', 10: '0101'}
    receipt = {'agent': 'codex-7c2e', 'scope': 'source-only canonical replay for issue225',
               'baseline': BASELINE,
               'lean_checked': False, 'rss_measured': False, 'protected_worktrees_modified': False,
               'source_files': {}, 'inputs': {}, 'families': [], 'checks_per_module': split.CHECKS_PER_MODULE}
    # Small, meaningful negative checks: reject an altered trace shape/budget,
    # and reject stale generated helpers without deleting unowned integral files.
    try:
        split.trace_parts('bad', {'steps': [], 'values': [1]}, 'argument')
    except ValueError:
        pass
    else:
        raise AssertionError('mismatched trace accepted')
    with tempfile.TemporaryDirectory(prefix='codex-aa04-inventory-') as tmp:
        directory = Path(tmp)
        (directory / 'Q0BasePairRoot2Integral.lean').write_text('unowned')
        expected = {'Q0BasePairRoot2Profile.lean': ''}
        split.check_output_inventory(directory, expected)
        (directory / 'Q0BasePairRoot2Leaf0011Check999.lean').write_text('stale')
        try:
            split.check_output_inventory(directory, expected)
        except ValueError:
            pass
        else:
            raise AssertionError('stale helper accepted')

    for root, count in [(2, 24), (6, 15), (10, 12)]:
        trace_path = ROOT / f'data/q0_quadrature/base-pair-root{root}-trace.json'
        recipe_path = ROOT / f'data/q0_quadrature/base-pair-root{root}-recipe.json'
        raw = trace_path.read_bytes()
        recipe = json.loads(recipe_path.read_bytes())
        data = json.loads(raw)
        input_path = ROOT / recipe['profile_input']
        assert digest(input_path.read_bytes()) == recipe['profile_input_sha256']
        for path in [trace_path, recipe_path, input_path]:
            assert path.read_bytes() == git_source(path.relative_to(ROOT)), 'input changed'
            receipt['inputs'][str(path.relative_to(ROOT))] = digest(path.read_bytes())
        assert len(data['cells']) == len(recipe['leaves']) == count
        before = family(baseline, root, raw, recipe)
        after = family(changed, root, raw, recipe)
        assert after == family(changed, root, raw, recipe), 'nondeterministic generation'
        for name, text in before.items():
            assert git_source('Grothe/UpperChaos/' + name).decode() == text, name + ' baseline drift'
        split.check_output_inventory(ROOT / 'Grothe/UpperChaos', after)
        adjacency = no_cycle(after)
        retained_defs, leaf_receipts = 0, []
        previous = None
        for cell, leaf in zip(data['cells'], recipe['leaves'], strict=True):
            assert cell['cell'] == leaf['cell']
            for field, expected in zip(('firstOutput', 'companionOutput'), leaf['expected_models']):
                assert cell['nodes'][field] == expected
            name = f'Q0BasePairRoot{root}Leaf{leaf["path"]}'
            marker = '/-- Both actual signed kernels are enclosed, with no numerical hypotheses. -/'
            old = before[name + '.lean']
            new = after[name + '.lean']
            # This suffix includes both public proofs and interval definitions:
            # preserving it exactly retains the physical rectangle and kernel.
            assert old[old.index(marker):] == new[new.index(marker):]
            old_defs = definitions(old, 'noncomputable def radial', marker)
            data_defs = definitions(after[name + 'Data.lean'], 'noncomputable def radial',
                                    f'\nend Grothe.UpperChaos.{name}')
            assert all(data_defs.get(n) == body for n, body in old_defs.items())
            retained_defs += len(old_defs)
            data_source = after[name + 'Data.lean']
            if previous:
                assert f'import Grothe.UpperChaos.{previous}\n' in data_source
            helper_names = sorted(n for n in after if re.fullmatch(re.escape(name) + r'Check\d{3}\.lean', n))
            assert helper_names
            last = name + 'Data.lean'
            counts = []
            for helper in helper_names:
                assert adjacency[helper] == [last], (helper, adjacency[helper], last)
                counts.append(after[helper].count('decide +kernel'))
                assert 0 < counts[-1] <= split.CHECKS_PER_MODULE
                last = helper
            assert adjacency[name + '.lean'] == [last]
            # No full trace/Verified re-decide in the facade; the remaining
            # small decisions are the original coordinate/integral hypotheses.
            assembly = new[:new.index(marker)]
            assert 'decide' not in assembly
            assert 'exact ⟨commonProduct1_checked, commonProduct2_checked, common_checked⟩' in assembly
            leaf_receipts.append({'module': name, 'original_sha256': digest(old.encode()),
                                  'data_sha256': digest(data_source.encode()),
                                  'facade_sha256': digest(new.encode()),
                                  'checker_modules': len(helper_names),
                                  'substantive_checks': sum(counts)})
            previous = name
            if leaf['path'] == samples[root]:
                for output, text in after.items():
                    if output == name + '.lean' or output.startswith(name + 'Data.') or output in helper_names:
                        (here / 'samples' / output).write_text(text)
        profile = f'Q0BasePairRoot{root}Profile'
        old_profile, new_profile = before[profile + '.lean'], after[profile + '.lean']
        assert old_profile[old_profile.index('theorem profile_contains'):] == new_profile[new_profile.index('theorem profile_contains'):]
        old_defs = definitions(old_profile, 'def sModel', 'theorem profile_contains')
        new_defs = definitions(after[profile + 'Data.lean'], 'def sModel', f'\nend Grothe.UpperChaos.{profile}')
        assert all(new_defs.get(n) == body for n, body in old_defs.items())
        assert 'Q0ProfileRectangleModel.inputs.getD' in after[profile + 'Check000.lean']
        for name, source in after.items():
            if name.startswith(profile):
                (here / 'samples' / name).write_text(source)
            if 'Check' in name:
                assert source.count('decide +kernel') <= split.CHECKS_PER_MODULE
            assert 'native_decide' not in source
        for suffix in ['Scalars', 'Audit']:
            name = f'Q0BasePairRoot{root}{suffix}.lean'
            assert before[name] == after[name]
        receipt['families'].append({'root': root, 'leaf_count': count,
                                    'retained_definitions': retained_defs,
                                    'generated_modules': len(after),
                                    'generated_bytes': sum(len(t.encode()) for t in after.values()),
                                    'outputs': {n: digest(t.encode()) for n, t in sorted(after.items())},
                                    'leaves': leaf_receipts})
    for rel, expected in receipt['inputs'].items():
        assert digest((ROOT / rel).read_bytes()) == expected
    patches = []
    for relative in SOURCE_FILES:
        source = (ROOT / relative).read_bytes()
        receipt['source_files'][relative] = digest(source)
        original = git_source(relative, missing=True)
        old = original.decode().splitlines(keepends=True)
        patches.extend(difflib.unified_diff(old, source.decode().splitlines(keepends=True),
                       fromfile='a/' + relative if old else '/dev/null',
                       tofile='b/' + relative))
    (here / 'generator.patch').write_text(''.join(patches))
    receipt['patch_sha256'] = digest((here / 'generator.patch').read_bytes())
    (here / 'preservation.json').write_text(json.dumps(receipt, indent=2) + '\n')
    print(json.dumps({'leaf_count': sum(f['leaf_count'] for f in receipt['families']),
                      'modules': sum(f['generated_modules'] for f in receipt['families']),
                      'preserved_definitions': sum(f['retained_definitions'] for f in receipt['families']),
                      'patch_sha256': receipt['patch_sha256'],
                      'lean_checked': False, 'rss_measured': False}, indent=2))


if __name__ == '__main__':
    main()
