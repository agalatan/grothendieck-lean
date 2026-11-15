#!/usr/bin/env python3
"""Read-only exact replay of the saved v6 cover; writes only a replay report."""
import sys
sys.dont_write_bytecode = True
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from fractions import Fraction as Q
import json, time
from improvement_cover import OUT, read_current, partition, reprice, endpoint, sha
from needle_cover_lean import serialize

def main():
    assert sys.flags.isolated == 1, 'Invoke with absolute Python 3.12 -I'
    started = time.monotonic()
    cp = OUT/'improvement_cover_v6.json'
    sp = OUT/'improvement_certificate_v6.json'
    checker = OUT/'improvement_independent_check.py'
    before = {str(p): sha(p) for p in (cp, sp, checker)}
    c, original, _, _, maps, pins = read_current()
    cover = json.loads(cp.read_text())
    cert = json.loads(sp.read_text())
    upper, binding = reprice(c, cover, True)
    count = partition(cert['partition_tokens'], cover['boxes'])
    inherited, im, nm, em = maps
    assert serialize(cover, inherited, im, nm, em) == cert['boxes']
    B, L = endpoint(upper)
    assert B == Q(cert['B']) == Q(cover['target'])
    assert L == Q(cert['L']) == Q(cover['lower'])
    assert upper <= B and B*L < 1
    assert before == {str(p): sha(p) for p in (cp, sp, checker)}
    result = dict(status='PASS exact saved-v6 replay under isolated Python; NO Lean build',
        agent='codex-a713', python=sys.executable, python_version=sys.version,
        isolated=sys.flags.isolated, boxes=count, actual_upper=str(upper),
        binding_boxes=binding, B=str(B), L=str(L), strict_margin=str(1-B*L),
        improvement_over_current=str(L-Q(1401697117301,10**12)),
        source_pins=pins, unchanged_input_sha256=before,
        seconds=time.monotonic()-started)
    (OUT/'improvement_isolated_replay_v6.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({k:result[k] for k in ('status','isolated','boxes','binding_boxes','B','L','seconds')},indent=2))

if __name__=='__main__':
    main()
