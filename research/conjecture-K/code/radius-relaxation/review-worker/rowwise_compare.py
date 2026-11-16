#!/usr/bin/env python3
"""Row by row: the exact bounds B(s_lo), B(s_hi) of the reviewer's verifier against the author's (scratch copy).
Usage: python3 -I rowwise_compare.py AUTHOR_VERIFY_CERT_COPY.py CERT.json ..."""
import importlib.util, json, os, sys
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
import own_verifier as OV
spec = importlib.util.spec_from_file_location('author_verify_cert', sys.argv[1])
AV = importlib.util.module_from_spec(spec)
spec.loader.exec_module(AV)
bad = 0
for path in sys.argv[2:]:
    cert = json.load(open(path))
    same = 0
    for i, row in enumerate(cert['rows']):
        mine = OV.verify_row(row)
        auth = AV.verify_row(row, quiet=True)
        ok = auth['ok'] and mine['bounds'] == auth['bounds'] and mine['bound'] == auth['bound']
        same += ok
        bad += not ok
    print('%s: %d rows, both verifiers accept and give identical exact endpoint bounds on %d rows' % (
        os.path.basename(path), len(cert['rows']), same))
sys.exit(1 if bad else 0)
