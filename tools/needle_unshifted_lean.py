#!/usr/bin/env python3
"""Export checked unshifted law nodes and a complete rational lower cover.

Reads only the durable data/lower-unshifted inputs. Replays every new node
and every final box, binds the original canonical reference map to all old
MixedData box strings, and checks the complete guillotine partition. The
old 21 batches keep their indices; pure-row batches are appended by row,
with nodes ordered by exact scale and identifier. No discovery is rerun.
Use --out-dir for a probe before replacing canonical generated Lean data.
"""
import argparse
from fractions import Fraction as Q
import hashlib
import json
from pathlib import Path
import re
import sys

sys.dont_write_bytecode = True
sys.path.insert(0, str(Path(__file__).resolve().parent))
from needle_cover_lean import canonical_maps, refined_tokens, serialize
from needle_cover_refine import Campaign, capvalue, mix, value, verify
from needle_rankone_nodes import verify_unshifted
from needle_unshifted_export import batch_term

ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / 'data/lower-unshifted'


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def local_input(path):
    """Never fall back to an ignored archive or another checkout."""
    path = Path(path)
    assert '..' not in path.parts, 'Input contains parent traversal'
    local = (ROOT / path).resolve(strict=True)
    assert local.is_relative_to(ROOT) and local.is_relative_to(DATA.resolve()) and local.is_file(), \
        'Input is outside clone-local durable data'
    return local


class ExportCampaign(Campaign):
    def __init__(self, base, cover, docs):
        super().__init__(base)
        assert cover['groups'] == self.cover['groups'], 'Original potentials changed'
        assert cover['newnodes'] == self.cover['newnodes'], 'Existing spectral nodes changed'
        self.cover = cover
        self.nodes = cover['nodes']
        self.docs = docs

    def node(self, index, group, xu):
        assert isinstance(index, int) and 0 <= index < len(self.nodes)
        ref = self.nodes[index]
        if ref[0] != 'u':
            return super().node(index, group, xu)
        d = self.docs[ref[1]]
        expected = [(int(i), Q(a)) for i, a in self.cover['groups'][group]['weights']]
        assert expected == [(d['row_index'], Q(1))], 'New node belongs to another potential'
        p = tuple(map(Q, d['P']))
        assert len(p) == 5 and p[1] >= 0 and p[4] >= 0
        return Q(d['tau']), p

    def box_upper(self, box):
        bb = tuple(map(Q, box['bounds']))
        assert len(bb) == 6 and all(bb[2*k] < bb[2*k+1] for k in range(3))
        if 'cap_choice' in box:
            i, j, t = box['cap_choice']
            t = Q(t)
            assert isinstance(i, int) and isinstance(j, int)
            assert 0 <= i < len(self.env) and 0 <= j < len(self.env) and 0 <= t <= 1
            return capvalue(self.env[i], self.env[j], t, *bb[:2])
        if 'choice' not in box:
            assert isinstance(box['original'], int) and 0 <= box['original'] < len(self.inh['boxes'])
            kind, _, *fields = self.inh['boxes'][box['original']].split('|')
            if kind == 'c':
                i, j, t = fields[0].split(',')
                t = Q(t)
                assert 0 <= t <= 1
                return capvalue(self.env[int(i)], self.env[int(j)], t, *bb[:2])
            assert kind == 's', 'Unsupported inherited box kind'
            # This uses the same inherited source-node and scale-domain recipe.
            n = len(self.cover['boxes'])
            self.cover['boxes'].append(box)
            try:
                normalized = self.normalized_box(n)
            finally:
                self.cover['boxes'].pop()
            return self.box_upper(normalized)
        ch = box['choice']
        gs, refs, theta = ch['groups'], ch['refs'], Q(ch['theta'])
        assert len(gs) in (1, 2) and len(refs) == len(gs) and 0 <= theta <= 1
        assert all(isinstance(g, int) and 0 <= g < len(self.gv) for g in gs)
        assert all(len(rr) == 4 for rr in refs)
        domain = tuple(map(Q, ch.get('scale_domain', bb[2:4])))
        assert len(domain) == 2 and 0 <= domain[0] <= bb[2] < bb[3] <= domain[1]
        parts = [self.component(rr, g, bb, domain) for rr, g in zip(refs, gs)]
        if len(gs) == 1:
            v, (p, q) = self.gv[gs[0]], parts[0]
        else:
            v = mix(theta, self.gv[gs[0]], self.gv[gs[1]])
            p = mix(theta, parts[0][0], parts[1][0])
            q = mix(theta, parts[0][1], parts[1][1])
        return value(bb, v, p, q)


def original_data(base):
    manifest = json.loads((base / 'source-manifest.json').read_text())
    copies = manifest['durable_copies']
    for name in ['inherited.json', 'cover.json', 'minimal-cover-ledger.json']:
        path = local_input(base / name)
        relative = str(path.relative_to(ROOT))
        assert relative in copies and sha(path) == copies[relative], ('Source hash mismatch', relative)
    old = json.loads((base / 'cover.json').read_text())
    inherited = json.loads((base / 'inherited.json').read_text())
    frozen = Campaign(base)
    minimal = json.loads((base / 'minimal-cover-ledger.json').read_text())
    verify(frozen, minimal)
    return old, inherited, frozen.nodes


def canonical_old_map(old, inherited):
    im, nm = canonical_maps(old, inherited)
    text = (ROOT / 'Grothe/Lower/MixedData.lean').read_text()
    chunks = re.findall(r'def coverBoxes\d+ : List String :=\s*\[([\s\S]*?)\]\s*\n', text)
    oldstrings = [s for chunk in chunks for s in re.findall(r'"([^"]*)"', chunk)]
    assert len(oldstrings) == len(old['boxes'])
    assert serialize(old, inherited, im, nm) == oldstrings, 'Original canonical node map changed'
    batch_count = len(im) + len({b for b, _ in nm.values()})
    batch_text = text[text.index('def mixedBatches :'):text.index('def coverBoxes0 :')]
    assert batch_count == batch_text.count('⟨') == 21, 'Old batch count changed'
    cuts = re.findall(r'def coverCuts\d+ : String :=\s*"([^"]*)"', text)
    tokens = [t for s in cuts for t in s.split('|')]
    return im, nm, oldstrings, tokens, batch_count


def new_batches(cover, inherited, old_batch_count):
    docs, sources, grouped = {}, {}, {}
    refs = cover['nodes']
    names = {r[1] for r in refs if r[0] == 'u'}
    assert names == set(cover['u_nodes']), 'Unbound or unused new-node identifier'
    for name, binding in sorted(cover['u_nodes'].items()):
        path = local_input(binding['path'])
        payload = path.read_bytes()
        digest = hashlib.sha256(payload).hexdigest()
        assert digest == binding['sha256'], ('New node hash mismatch', name)
        d = json.loads(payload)
        assert d['format'] == 'needle-unshifted-explicit-scale/v1'
        assert d['inherited'] == 'data/lower-unshifted/inputs/inherited.json'
        assert d['inherited_sha256'] == sha(DATA / 'inputs/inherited.json')
        assert isinstance(d['row_index'], int) and 0 <= d['row_index'] < len(inherited['rows'])
        verify_unshifted(path)
        assert sha(path) == digest, ('Node changed during verification', name)
        docs[name], sources[str(path.relative_to(ROOT))] = d, digest
        grouped.setdefault(d['row_index'], []).append(name)
    out = 'import Grothe.Lower.RowData\nimport Grothe.Lower.MixedData\n\n'
    out += '/-! Generated by `tools/needle_unshifted_lean.py`: checked original-source law scales. -/\n\n'
    out += 'namespace Grothe.Research.LawNodeData\n\nopen Grothe.Lower\n\n'
    extra_map, batch_names = {}, []
    for bi, (row, names) in enumerate(sorted(grouped.items())):
        names.sort(key=lambda name: (Q(docs[name]['tau']), name))
        batch = f'lawBatch{row}'
        batch_names.append(batch)
        out += f'def {batch} : JBatch :=\n  '
        out += batch_term(row, inherited['rows'][row], [docs[name] for name in names]) + '\n\n'
        for ni, name in enumerate(names):
            extra_map[name] = (old_batch_count + bi, ni)
    out += 'def extraBatches : List JBatch :=\n  [' + ', '.join(batch_names) + ']\n\n'
    out += 'end Grothe.Research.LawNodeData\n'
    return docs, extra_map, out, sources, len(batch_names)


def cover_text(B, L, strings, tokens):
    out = 'import Grothe.Research.LawNodeData\n\n'
    out += '/-! Generated by `tools/needle_unshifted_lean.py`: complete cover with extra checked law nodes. -/\n\n'
    out += 'namespace Grothe.Research.RefinedCoverData\n\n'
    out += 'def refinedBatches : List Grothe.Lower.JBatch :=\n'
    out += '  Grothe.Lower.mixedBatches ++ Grothe.Research.LawNodeData.extraBatches\n\n'
    out += f'def refinedB : ℚ := {B.numerator} / {B.denominator}\n'
    out += f'def refinedL : ℚ := {L.numerator} / {L.denominator}\n\n'
    names = []
    for k, start in enumerate(range(0, len(strings), 500)):
        name = f'refinedBoxes{k}'
        names.append(name)
        out += f'def {name} : List String :=\n['
        out += ',\n '.join(json.dumps(s) for s in strings[start:start+500]) + ']\n\n'
    out += 'def refinedBoxes : List String :=\n  ' + ' ++ '.join(names) + '\n\n'
    names = []
    for k, start in enumerate(range(0, len(tokens), 1000)):
        name = f'refinedCuts{k}'
        names.append(name)
        out += f'def {name} : String :=\n  ' + json.dumps('|'.join(tokens[start:start+1000])) + '\n\n'
    out += 'def refinedCuts : List String :=\n  [' + ', '.join(names)
    out += '].flatMap fun s => Grothe.Lower.splitL s "|"\n\n'
    return out + 'end Grothe.Research.RefinedCoverData\n'


def export(cover_path, out_dir, check=False):
    cover_path = local_input(cover_path)
    payload = cover_path.read_bytes()
    cover = json.loads(payload)
    source_pins = {str(cover_path.relative_to(ROOT)): hashlib.sha256(payload).hexdigest()}
    base = DATA / 'inputs'
    for name in ['inherited.json', 'cover.json', 'minimal-cover-ledger.json', 'source-manifest.json']:
        path = base / name
        source_pins[str(path.relative_to(ROOT))] = sha(path)
    source_pins['Grothe/Lower/MixedData.lean'] = sha(ROOT / 'Grothe/Lower/MixedData.lean')
    assert cover.get('fails') == [], 'Incomplete cover or missing failure ledger'
    B, L = Q(cover['target']), Q(cover['lower'])
    assert 0 < B and 0 < L and B*L < 1, 'Invalid reciprocal endpoint'
    old, inherited, frozen_nodes = original_data(base)
    assert cover['nodes'][:len(frozen_nodes)] == frozen_nodes, 'Original node indices changed'
    im, nm, oldstrings, oldtokens, count = canonical_old_map(old, inherited)
    docs, extra_map, law_text, sources, extra_count = new_batches(cover, inherited, count)
    c = ExportCampaign(base, cover, docs)
    for ref in cover['nodes']:
        assert ref and ref[0] in ('s', 'z', 'b', 'n', 'u'), 'Invalid node reference'
        if ref[0] in ('s', 'z', 'b'):
            assert all(isinstance(i, int) and i >= 0 for i in ref[1:])
    upper = Q(0)
    for index, box in enumerate(cover['boxes']):
        bound = c.box_upper(box)
        assert bound == Q(box['upper']) and bound <= B, ('Bad final box bound', index)
        upper = max(upper, bound)
    strings = serialize(cover, inherited, im, nm, extra_map)
    domains = [tuple(map(Q, box['bounds'])) for box in cover['boxes']]
    assert len(domains) == len(set(domains)), 'Duplicate box domains'
    tokens = refined_tokens(oldtokens, domains)
    texts = {'LawNodeData.lean': law_text, 'RefinedCoverData.lean': cover_text(B, L, strings, tokens)}
    sources.update(source_pins)
    for name, digest in sources.items():
        assert sha(ROOT / name) == digest, ('Source changed during export', name)
    for name, text in texts.items():
        path = out_dir / name
        if check:
            assert path.read_text() == text, ('Nondeterministic Lean export', name)
        else:
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(text)
    return dict(status='PASS_EXACT_ORIGINAL_MAP_NODES_BOXES_AND_PARTITION',
                original_boxes=len(oldstrings), boxes=len(strings), partition_tokens=len(tokens),
                old_batches=count, extra_batches=extra_count, extra_nodes=len(docs),
                extra_node_map={name: list(pair) for name, pair in sorted(extra_map.items())},
                B=str(B), L=str(L), actual_upper=str(upper), source_sha256=sources,
                lean_sha256={name: hashlib.sha256(text.encode()).hexdigest() for name, text in texts.items()})


def main():
    if not __debug__:
        raise SystemExit('Reject -O/-OO: exact assertions required')
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--cover', type=Path, default=DATA / 'cover.json')
    p.add_argument('--out-dir', type=Path, default=ROOT / 'Grothe/Research')
    p.add_argument('--check', action='store_true')
    a = p.parse_args()
    print(json.dumps(export(a.cover, a.out_dir, a.check), indent=2))


if __name__ == '__main__':
    main()
