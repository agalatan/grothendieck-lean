#!/usr/bin/env python3
"""Sealed Row15-only noncentre repair reproduction, without search or Lean.

Agent-ID: codex-15b7. The original renderer runs against its original bytes in
an isolated source view. Effective rendering may change only listed D15 data.
Stored matrix replay does not independently recompute N or establish native
verification. This API is not activated until an explicit repair binding exists.
"""
from pathlib import Path
import tempfile
import nodecaps_row15_noncentre_repair as repair
import nodecaps_repaired_render as shared

BASE = shared.BASE
BINDING = BASE + 'row15-repaired-source-binding.json'
ORIGINAL = BASE + 'row15-binding.json'
FORMAT = 'nodecaps-row15-repaired-source/v1'
CURRENT_TOOLS = {'tools/gen_cap_prepared_rows.py',
                 'tools/nodecaps_row15_repaired_render.py',
                 'tools/nodecaps_row15_noncentre_repair.py',
                 'tools/nodecaps_repaired_render.py', 'tools/nodecaps_noncentre_repair.py'}
require, sha, decode = repair.require, repair.sha, repair.decode


def capture_baseline(root):
    """Read an original, unrepaired sealed source view; never modify it."""
    root = Path(root).resolve()
    if (root / BINDING).exists():
        reads = shared.Reads(root)
        top = decode(reads.read(BINDING)); mapping = top['baseline_files']
        original = decode(reads.bound(mapping[ORIGINAL]))
        aliases = set(original['tools_sha256']) | {ORIGINAL, BASE+'row15-pieces.json'}
        snapshot = {}
        for name, reference in mapping.items():
            repair.path(name); actual, _ = repair.ref(reference)
            require(actual == name or name in aliases, 'unreviewed Row15 baseline alias: '+name)
            snapshot[name] = reads.bound(reference)
        require(reads.read(ORIGINAL) == snapshot[ORIGINAL], 'historical Row15 binding rewritten')
        outputs = original_outputs(snapshot)
        reads.unchanged()
        return snapshot, outputs
    module = shared.load_module('_capture_sealed_row15', root/'tools/nodecaps_row15_render.py')
    original_reads = module.STAMP._ActiveReads
    snapshot = {}
    class Captured(original_reads):
        def read(self, name, **kwargs):
            data = super().read(name, **kwargs)
            require(name not in snapshot or snapshot[name] == data, 'baseline changed during capture')
            snapshot[name] = data
            return data
    module.STAMP._ActiveReads = Captured
    try:
        outputs = module.render_sealed(root)
    finally:
        module.STAMP._ActiveReads = original_reads
    binding = decode(snapshot[ORIGINAL])
    for name, digest in binding['tools_sha256'].items():
        data = (root/name).read_bytes()
        require(sha(data) == digest, 'original tool changed during capture')
        snapshot[name] = data
    return snapshot, outputs


def original_outputs(snapshot):
    """Run the original unweakened renderer, including its noncentre gate."""
    binding = decode(snapshot[ORIGINAL])
    required = set(binding['tools_sha256']) | set(binding['inputs_sha256']) | {
        ORIGINAL, BASE+'row15-source.json'}
    require(required <= set(snapshot), 'incomplete original Row15 snapshot')
    for pins in (binding['tools_sha256'], binding['inputs_sha256']):
        for name, digest in pins.items():
            require(sha(snapshot[name]) == digest, 'original Row15 pin differs: '+name)
    require(sha(snapshot[BASE+'row15-source.json']) == binding['source_manifest_sha256'],
            'original Row15 source seal differs')
    with tempfile.TemporaryDirectory(prefix='nodecaps15-sealed-replay-') as directory:
        target = Path(directory).resolve()
        for name, data in snapshot.items():
            repair.path(name)
            p = target/name; p.parent.mkdir(parents=True, exist_ok=True); p.write_bytes(data)
        with shared.baseline_imports(target):
            module = shared.load_module('_original_row15_reproduction', target/'tools/nodecaps_row15_render.py')
            return module.render_sealed(target)


def render(root, binding):
    require(type(binding) is dict and set(binding) == {'format', 'baseline_files',
            'current_tools_sha256', 'repair_binding', 'effective_sources_sha256'} and
            binding['format'] == FORMAT, 'unsupported Row15 repair source binding')
    reads = shared.Reads(root); project = Path(__file__).resolve().parents[1]
    require(type(binding['current_tools_sha256']) is dict and
            set(binding['current_tools_sha256']) == CURRENT_TOOLS, 'wrong current Row15 tool inventory')
    for name, digest in binding['current_tools_sha256'].items():
        reads.bound({'path':name, 'sha256':digest})
        require(sha((project/name).read_bytes()) == digest, 'running Row15 tool differs: '+name)
    mapping = binding['baseline_files']
    require(type(mapping) is dict and ORIGINAL in mapping, 'missing original Row15 binding')
    original_binding = decode(reads.bound(mapping[ORIGINAL]))
    # Relocation is permitted only for the explicitly sealed tools, original
    # pieces and original binding. Every relocated byte remains hash-bound.
    aliases = set(original_binding['tools_sha256']) | {ORIGINAL, BASE+'row15-pieces.json'}
    snapshot = {}
    for name, reference in mapping.items():
        repair.path(name); actual, _ = repair.ref(reference)
        require(actual == name or name in aliases, 'unreviewed Row15 baseline alias: '+name)
        snapshot[name] = reads.bound(reference)
    require(reads.read(ORIGINAL) == snapshot[ORIGINAL], 'historical Row15 binding rewritten')
    original = original_outputs(snapshot)
    item = decode(reads.bound(binding['repair_binding']))
    require(item.get('row') == 15 and type(item.get('row')) is int, 'repair binding is not Row15')
    canonical = BASE+'row15'
    require(item['baseline_archive'] == mapping[canonical+'-pieces.json'] and
            item['baseline_archive']['path'] != canonical+'-pieces.json', 'Row15 baseline must be archived')
    for field, name in [('centre_plan',canonical+'.json'), ('selection',canonical+'-selection.json'),
                        ('historical_seal',canonical+'-source.json'), ('historical_provenance',ORIGINAL)]:
        require(reads.bound(item[field]) == snapshot[name], 'Row15 historical reference differs: '+field)
    effective = reads.read(canonical+'-pieces.json')
    pieces, receipt = repair.derive(item, shared.repair_files(reads, item), effective_bytes=effective)
    expected = binding['effective_sources_sha256']
    affected = {f'Grothe/LowerAnalytic/CapPieces/D15x{k.split(":")[1]}.lean'
                for k in receipt['repaired_keys']}
    require(type(expected) is dict and set(expected) == affected, 'wrong effective D15 source inventory')
    # The writer, policy, selection and original renderer remain unchanged.
    with tempfile.TemporaryDirectory(prefix='nodecaps15-effective-writer-') as directory:
        target = Path(directory).resolve()
        for name, data in snapshot.items():
            p=target/name; p.parent.mkdir(parents=True,exist_ok=True); p.write_bytes(data)
        generated = shared.render_pieces(target, 15, pieces)
    wanted = {n for n in original if n.startswith('Grothe/LowerAnalytic/CapPieces/')}
    require(set(generated) == wanted, 'effective Row15 writer added or omitted a module')
    for name, data in generated.items():
        if name in affected:
            require(data != original[name] and sha(data) == expected[name], 'effective D15 hash differs: '+name)
        else:
            require(data == original[name], 'repair changed unlisted or non-D15 source: '+name)
    outputs = {**original, **generated}
    reads.unchanged()
    return outputs, {'format':FORMAT, 'repair_receipt':receipt,
                     'historical_sources_reproduced':True, 'native_verified':False,
                     'cache_uploaded':False}


def render_sealed(root):
    reads = shared.Reads(root); binding = decode(reads.read(BINDING))
    result, _ = render(root, binding); reads.unchanged(); return result
