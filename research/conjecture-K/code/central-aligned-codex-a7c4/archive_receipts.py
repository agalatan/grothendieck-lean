#!/usr/bin/env python3
"""Agent-ID: codex-a7c4. Refs #431. Lossless small-file receipt archive.

Each plain JSON file stays below the research tree's 300 KB limit. Restoration
reproduces the original receipt bytes and runs the original exact auditor.
This storage adapter cannot replace a fresh source-quadrature replay.
"""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path

if not __debug__:
    raise RuntimeError('Assertions must be enabled')
HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('central',HERE/'verify.py')
v = importlib.util.module_from_spec(spec)
spec.loader.exec_module(v)
LIMIT = 200000
FORMAT = 'central-aligned-row-chunks-1'


def encoded(data):
    return (json.dumps(data,separators=(',',':'))+'\n').encode()


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def pack_record(raw,output):
    """Storage only; the CLI separately validates mathematical receipts."""
    data = json.loads(raw)
    assert encoded(data) == raw, 'receipt must have the canonical source encoding'
    index = data['index']
    assert type(index) is int and 0 <= index < 20
    chunks = {}
    for field in ('points','leaves'):
        chunks[field] = []
        batch,size = [],3  # brackets and newline
        def flush():
            payload = encoded(batch)
            assert len(payload) <= LIMIT
            name = f'region-{index:02}-{field}-{len(chunks[field]):03}.json'
            (output/name).write_bytes(payload)
            chunks[field].append({'file':name,'rows':len(batch),'bytes':len(payload),
                                  'sha256':digest(payload)})
        for row in data[field]:
            length = len(encoded(row))-1
            assert length+3 <= LIMIT
            if batch and size+length+1 > LIMIT:
                flush()
                batch,size = [],3
            size += length+bool(batch)
            batch.append(row)
        if batch:
            flush()
    header = {'format':FORMAT,'original_sha256':digest(raw),'original_bytes':len(raw),
              'original_keys':list(data),'metadata':{k:x for k,x in data.items()
              if k not in ('points','leaves')},'chunks':chunks}
    payload = encoded(header)
    assert len(payload) <= LIMIT
    (output/f'region-{index:02}-header.json').write_bytes(payload)


def restore_record(header_path):
    header = json.loads(header_path.read_bytes())
    assert header['format'] == FORMAT
    data = header['metadata']
    index = data['index']
    assert type(index) is int and 0 <= index < 20
    assert header_path.name == f'region-{index:02}-header.json'
    assert set(header['chunks']) == {'points','leaves'}
    assert 'points' not in data and 'leaves' not in data
    for field in ('points','leaves'):
        rows = []
        for j,entry in enumerate(header['chunks'][field]):
            assert entry['file'] == f'region-{index:02}-{field}-{j:03}.json'
            payload = (header_path.parent/entry['file']).read_bytes()
            assert len(payload) == entry['bytes'] <= LIMIT
            assert digest(payload) == entry['sha256'], 'changed receipt chunk'
            part = json.loads(payload)
            assert type(part) is list and len(part) == entry['rows']
            rows.extend(part)
        data[field] = rows
    keys = header['original_keys']
    assert len(keys) == len(set(keys)) and set(keys) == set(data)
    raw = encoded({k:data[k] for k in keys})
    assert len(raw) == header['original_bytes'] and digest(raw) == header['original_sha256']
    return raw


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('mode',choices=('pack','restore'))
    parser.add_argument('source',type=Path)
    parser.add_argument('destination',type=Path)
    args = parser.parse_args()
    args.destination.mkdir(parents=True,exist_ok=True)
    assert not any(args.destination.iterdir()), 'use an empty destination'
    seen = set()
    paths = sorted(args.source.glob('region-*.json' if args.mode == 'pack' else 'region-*-header.json'))
    assert len(paths) == 20, 'twenty complete regions are required'
    for path in paths:
        raw = path.read_bytes() if args.mode == 'pack' else restore_record(path)
        index = v.validate(json.loads(raw))
        assert index not in seen
        seen.add(index)
        if args.mode == 'pack':
            pack_record(raw,args.destination)
            assert restore_record(args.destination/f'region-{index:02}-header.json') == raw
        else:
            (args.destination/f'region-{index:02}.json').write_bytes(raw)
    assert seen == set(range(20))
    print('PASS lossless',args.mode,'and exact audit of all twenty aligned regions')


if __name__ == '__main__':
    main()
